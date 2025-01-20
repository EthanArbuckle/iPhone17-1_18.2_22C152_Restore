@interface BPSScan
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BPSPublisher)upstream;
- (BPSScan)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5;
- (id)bookmarkableUpstreams;
- (id)initialResult;
- (id)nextEvent;
- (id)nextPartialResult;
- (id)result;
- (id)upstreamPublishers;
- (void)reset;
- (void)setResult:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSScan

- (BPSScan)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BPSScan;
  v12 = [(BPSScan *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    objc_storeStrong(&v13->_initialResult, a4);
    objc_storeStrong(&v13->_result, a4);
    uint64_t v14 = [v11 copy];
    id nextPartialResult = v13->_nextPartialResult;
    v13->_id nextPartialResult = (id)v14;
  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSScan subscribe:]();
  }

  v6 = [_BPSScanInner alloc];
  v7 = [(BPSScan *)self nextPartialResult];
  v8 = [(BPSScan *)self initialResult];
  id v9 = [(_BPSScanInner *)v6 initWithDownstream:v4 nextPartialResult:v7 initialResult:v8];

  id v10 = [(BPSScan *)self upstream];
  [v10 subscribe:v9];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSScan *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(BPSScan *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    v5 = [(BPSScan *)self nextPartialResult];
    v6 = [(BPSScan *)self result];
    v7 = ((void (**)(void, void *, void *))v5)[2](v5, v6, v4);
    [(BPSScan *)self setResult:v7];

    v8 = [(BPSScan *)self result];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reset
{
  v3 = [(BPSScan *)self initialResult];
  [(BPSScan *)self setResult:v3];

  v4.receiver = self;
  v4.super_class = (Class)BPSScan;
  [(BPSPublisher *)&v4 reset];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)initialResult
{
  return self->_initialResult;
}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_initialResult, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [BPSScan alloc];
  id v11 = [v9 objectAtIndexedSubscript:0];

  v12 = v8;
  if (!v8)
  {
    v12 = [v7 initialResult];
  }
  v13 = [v7 nextPartialResult];
  uint64_t v14 = [(BPSScan *)v10 initWithUpstream:v11 initialResult:v12 nextPartialResult:v13];

  if (!v8) {
  return v14;
  }
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSScan *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 1;
}

- (void)subscribe:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v1, v2, "%@ - subscribe", v3, v4, v5, v6, 2u);
}

@end