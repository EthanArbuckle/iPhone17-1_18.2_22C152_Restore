@interface BPSMergeMany
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSMergeMany)initWithPublishers:(id)a3;
- (NSArray)publishers;
- (id)bookmark;
- (id)nextEvent;
- (id)validateBookmark:(id)a3;
- (unint64_t)currentPublisher;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setCurrentPublisher:(unint64_t)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSMergeMany

- (id)nextEvent
{
  v3 = [(BPSMergeMany *)self publishers];
  v4 = (void *)[v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    while (1)
    {
      v6 = [(BPSMergeMany *)self publishers];
      v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[BPSMergeMany currentPublisher](self, "currentPublisher"));

      unint64_t v8 = [(BPSMergeMany *)self currentPublisher] + 1;
      v9 = [(BPSMergeMany *)self publishers];
      -[BPSMergeMany setCurrentPublisher:](self, "setCurrentPublisher:", v8 % [v9 count]);

      if (([v7 completed] & 1) == 0)
      {
        uint64_t v10 = [v7 nextEvent];
        if (v10) {
          break;
        }
      }

      ++v5;
      v11 = [(BPSMergeMany *)self publishers];
      unint64_t v12 = [v11 count];

      if (v5 >= v12)
      {
        v4 = 0;
        goto LABEL_8;
      }
    }
    v4 = (void *)v10;
  }
LABEL_8:
  return v4;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (unint64_t)currentPublisher
{
  return self->_currentPublisher;
}

- (void)setCurrentPublisher:(unint64_t)a3
{
  self->_currentPublisher = a3;
}

- (void)reset
{
  [(BPSMergeMany *)self setCurrentPublisher:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSMergeMany;
  [(BPSPublisher *)&v3 reset];
}

- (id)bookmark
{
  v2 = NSNumber;
  unint64_t v3 = [(BPSMergeMany *)self currentPublisher];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (void).cxx_destruct
{
}

- (BPSMergeMany)initWithPublishers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSMergeMany;
  v6 = [(BPSMergeMany *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_publishers, a3);
  }

  return v7;
}

- (void)subscribe:(id)a3
{
  id v15 = a3;
  v4 = [_BPSMerged alloc];
  id v5 = [(BPSMergeMany *)self publishers];
  v6 = -[_BPSMerged initWithDownstream:count:](v4, "initWithDownstream:count:", v15, [v5 count]);

  [v15 receiveSubscription:v6];
  v7 = [(BPSMergeMany *)self publishers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [[_BPSMergedSide alloc] initWithIndex:v9 merger:v6];
      v11 = [(BPSMergeMany *)self publishers];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v9];

      [v12 subscribe:v10];
      ++v9;
      v13 = [(BPSMergeMany *)self publishers];
      unint64_t v14 = [v13 count];
    }
    while (v9 < v14);
  }
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  uint64_t v4 = [a3 unsignedIntegerValue];
  [(BPSMergeMany *)self setCurrentPublisher:v4];
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5 = a4;
  uint64_t v6 = [[BPSMergeMany alloc] initWithPublishers:v5];

  return v6;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end