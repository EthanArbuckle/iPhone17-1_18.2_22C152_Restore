@interface BPSMerge
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)nextIsB;
- (BPSMerge)initWithA:(id)a3 b:(id)a4;
- (BPSPublisher)a;
- (BPSPublisher)b;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setNextIsB:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSMerge

- (BPSMerge)initWithA:(id)a3 b:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSMerge;
  v9 = [(BPSMerge *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_a, a3);
    objc_storeStrong((id *)&v10->_b, a4);
    v10->_nextIsB = 0;
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v9 = [[_BPSMerged alloc] initWithDownstream:v4 count:2];
  [v4 receiveSubscription:v9];

  v5 = [(BPSMerge *)self a];
  v6 = [[_BPSMergedSide alloc] initWithIndex:0 merger:v9];
  [v5 subscribe:v6];

  id v7 = [(BPSMerge *)self b];
  id v8 = [[_BPSMergedSide alloc] initWithIndex:1 merger:v9];
  [v7 subscribe:v8];
}

- (id)upstreamPublishers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BPSMerge *)self a];
  v7[0] = v3;
  id v4 = [(BPSMerge *)self b];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)nextEvent
{
  if ([(BPSMerge *)self nextIsB]) {
    [(BPSMerge *)self b];
  }
  else {
  v3 = [(BPSMerge *)self a];
  }
  [(BPSMerge *)self setNextIsB:[(BPSMerge *)self nextIsB] ^ 1];
  uint64_t v4 = [v3 nextEvent];
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    if ([(BPSMerge *)self nextIsB]) {
      [(BPSMerge *)self b];
    }
    else {
    v6 = [(BPSMerge *)self a];
    }

    [(BPSMerge *)self setNextIsB:[(BPSMerge *)self nextIsB] ^ 1];
    v5 = [v6 nextEvent];
    v3 = v6;
  }

  return v5;
}

- (void)reset
{
  [(BPSMerge *)self setNextIsB:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSMerge;
  [(BPSPublisher *)&v3 reset];
}

- (id)bookmark
{
  v2 = NSNumber;
  BOOL v3 = [(BPSMerge *)self nextIsB];
  return (id)[v2 numberWithBool:v3];
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    id v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  [(BPSMerge *)self setNextIsB:v4];
}

- (BPSPublisher)a
{
  return self->_a;
}

- (BPSPublisher)b
{
  return self->_b;
}

- (BOOL)nextIsB
{
  return self->_nextIsB;
}

- (void)setNextIsB:(BOOL)a3
{
  self->_nextIsB = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5 = a4;
  uint64_t v6 = [BPSMerge alloc];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];

  v9 = [(BPSMerge *)v6 initWithA:v7 b:v8];
  return v9;
}

- (id)bookmarkableUpstreams
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(BPSMerge *)self a];
  v7[0] = v3;
  uint64_t v4 = [(BPSMerge *)self b];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end