@interface ATXCachedCandidateCounter
- (ATXCachedCandidateCounter)initWithCandidateIdPublisher:(id)a3;
- (int64_t)countForCandidate:(id)a3;
- (void)populateCache;
@end

@implementation ATXCachedCandidateCounter

- (ATXCachedCandidateCounter)initWithCandidateIdPublisher:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCachedCandidateCounter;
  v6 = [(ATXCachedCandidateCounter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_publisher, a3);
    uint64_t v8 = objc_opt_new();
    cache = v7->_cache;
    v7->_cache = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)populateCache
{
  publisher = self->_publisher;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ATXCachedCandidateCounter_populateCache__block_invoke_2;
  v4[3] = &unk_1E68B1220;
  v4[4] = self;
  id v3 = (id)[(BPSPublisher *)publisher sinkWithCompletion:&__block_literal_global_241 receiveInput:v4];
}

void __42__ATXCachedCandidateCounter_populateCache__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue") + 1);
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:&unk_1F27F2A48 forKeyedSubscript:v6];
  }
}

- (int64_t)countForCandidate:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end