@interface BPSReduce
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)completed;
- (BOOL)returned;
- (BPSPublisher)upstream;
- (BPSReduce)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5;
- (id)bookmarkableUpstreams;
- (id)initialResult;
- (id)nextEvent;
- (id)nextPartialResult;
- (id)result;
- (id)upstreamPublishers;
- (void)reset;
- (void)setResult:(id)a3;
- (void)setReturned:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSReduce

- (id)nextEvent
{
  v3 = [(BPSReduce *)self upstream];
  v4 = [v3 nextEvent];

  if (v4)
  {
    do
    {
      v5 = [(BPSReduce *)self nextPartialResult];
      v6 = [(BPSReduce *)self result];
      v7 = ((void (**)(void, void *, void *))v5)[2](v5, v6, v4);
      [(BPSReduce *)self setResult:v7];

      v8 = [(BPSReduce *)self upstream];
      uint64_t v9 = [v8 nextEvent];

      v4 = (void *)v9;
    }
    while (v9);
  }
  v10 = [(BPSReduce *)self upstream];
  if ([v10 completed])
  {
    BOOL v11 = [(BPSReduce *)self returned];

    if (!v11)
    {
      [(BPSReduce *)self setReturned:1];
      v12 = [(BPSReduce *)self result];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v12 = 0;
LABEL_8:
  return v12;
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSReduce *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (id)result
{
  return self->_result;
}

- (void)reset
{
  v3 = [(BPSReduce *)self initialResult];
  [(BPSReduce *)self setResult:v3];

  [(BPSReduce *)self setReturned:0];
  v4.receiver = self;
  v4.super_class = (Class)BPSReduce;
  [(BPSPublisher *)&v4 reset];
}

- (void)setResult:(id)a3
{
}

- (id)initialResult
{
  return self->_initialResult;
}

- (BOOL)completed
{
  v3 = [(BPSReduce *)self upstream];
  if ([v3 completed]) {
    BOOL v4 = [(BPSReduce *)self returned];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_initialResult, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (BPSReduce)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BPSReduce;
  v12 = [(BPSReduce *)&v17 init];
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
  v6 = [[_BPSReduceInner alloc] initWithDownstream:v4 initial:self->_initialResult reduce:self->_nextPartialResult];

  v5 = [(BPSReduce *)self upstream];
  [v5 subscribe:v6];
}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [BPSReduce alloc];
  id v11 = [v9 objectAtIndexedSubscript:0];

  v12 = v8;
  if (!v8)
  {
    v12 = [v7 initialResult];
  }
  v13 = [v7 nextPartialResult];
  uint64_t v14 = [(BPSReduce *)v10 initWithUpstream:v11 initialResult:v12 nextPartialResult:v13];

  if (!v8) {
  return v14;
  }
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSReduce *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end