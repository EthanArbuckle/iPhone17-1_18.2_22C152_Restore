@interface BPSCollect
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)completed;
- (BOOL)returned;
- (BPSCollect)initWithUpstream:(id)a3;
- (BPSPublisher)upstream;
- (NSMutableArray)results;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (void)reset;
- (void)setResults:(id)a3;
- (void)setReturned:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSCollect

- (BPSCollect)initWithUpstream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BPSCollect;
  v6 = [(BPSCollect *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upstream, a3);
    uint64_t v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [_BPSCollectInner alloc];
  v7 = [(BPSReduceProducer *)v5 initWithDownstream:v4 initial:MEMORY[0x1E4F1CBF0] reduce:&__block_literal_global_8];

  v6 = [(BPSCollect *)self upstream];
  [v6 subscribe:v7];
}

uint64_t __24__BPSCollect_subscribe___block_invoke()
{
  return 0;
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSCollect *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(BPSCollect *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    do
    {
      id v5 = [(BPSCollect *)self results];
      [v5 addObject:v4];

      v6 = [(BPSCollect *)self upstream];
      uint64_t v7 = [v6 nextEvent];

      id v4 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = [(BPSCollect *)self upstream];
  if ([v8 completed])
  {
    BOOL v9 = [(BPSCollect *)self returned];

    if (!v9)
    {
      [(BPSCollect *)self setReturned:1];
      v10 = [(BPSCollect *)self results];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v10 = 0;
LABEL_8:
  return v10;
}

- (BOOL)completed
{
  v3 = [(BPSCollect *)self upstream];
  if ([v3 completed]) {
    BOOL v4 = [(BPSCollect *)self returned];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)reset
{
  v3 = objc_opt_new();
  [(BPSCollect *)self setResults:v3];

  [(BPSCollect *)self setReturned:0];
  v4.receiver = self;
  v4.super_class = (Class)BPSCollect;
  [(BPSPublisher *)&v4 reset];
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_super v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = [BPSCollect alloc];
    BOOL v9 = [v7 objectAtIndexedSubscript:0];
    v10 = [(BPSCollect *)v8 initWithUpstream:v9];
  }
  else
  {
    uint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[BPSCollect(BMBookmarkOperators) publisherWithPublisher:upstreams:bookmarkState:](v11);
    }

    v10 = (BPSCollect *)v6;
  }

  return v10;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSCollect *)self upstream];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end