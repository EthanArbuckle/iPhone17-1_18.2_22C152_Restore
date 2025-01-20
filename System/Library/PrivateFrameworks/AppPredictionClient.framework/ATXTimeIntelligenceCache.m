@interface ATXTimeIntelligenceCache
- (ATXGenericFileBasedCache)cache;
- (ATXTimeIntelligenceCache)init;
- (id)cachedEvents;
- (void)cacheEvents:(id)a3;
- (void)evictCachedEvents;
- (void)setCache:(id)a3;
@end

@implementation ATXTimeIntelligenceCache

- (ATXTimeIntelligenceCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeIntelligenceCache;
  v2 = [(ATXTimeIntelligenceCache *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
    v4 = [v3 stringByAppendingPathComponent:@"TimeIntelligence"];

    id v5 = objc_alloc(MEMORY[0x1E4F4B638]);
    v6 = __atxlog_handle_time_intelligence();
    v7 = (void *)[v5 initWithCacheFilePath:v4 loggingHandle:v6 debugName:@"Time Intelligence"];
    [(ATXTimeIntelligenceCache *)v2 setCache:v7];
  }
  return v2;
}

- (void)cacheEvents:(id)a3
{
  id v4 = a3;
  id v6 = [(ATXTimeIntelligenceCache *)self cache];
  id v5 = (void *)[v4 copy];

  [v6 storeSecureCodedObject:v5 error:0];
}

- (id)cachedEvents
{
  v2 = [(ATXTimeIntelligenceCache *)self cache];
  v3 = (void *)MEMORY[0x1AD0D3C30]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v2 readSecureCodedObjectWithMaxValidAge:v6 allowableClasses:0 error:86400.0];

  return v7;
}

- (void)evictCachedEvents
{
  id v2 = [(ATXTimeIntelligenceCache *)self cache];
  [v2 evict];
}

- (ATXGenericFileBasedCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end