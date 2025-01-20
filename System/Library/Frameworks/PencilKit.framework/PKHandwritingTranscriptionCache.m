@interface PKHandwritingTranscriptionCache
- (PKHandwritingTranscriptionCache)init;
- (id)allCachedGroups;
- (id)cachedTranscriptionForStrokeGroup:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addCachedTranscription:(id)a3 forStrokeGroup:(id)a4;
- (void)clear;
- (void)clearCacheForStrokeGroup:(id)a3;
@end

@implementation PKHandwritingTranscriptionCache

- (PKHandwritingTranscriptionCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKHandwritingTranscriptionCache;
  v2 = [(PKHandwritingTranscriptionCache *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  cache = v2->_cache;
  v2->_cache = (NSMutableDictionary *)v3;

  return v2;
}

- (void)addCachedTranscription:(id)a3 forStrokeGroup:(id)a4
{
}

- (void)clearCacheForStrokeGroup:(id)a3
{
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:a3];

  return v3;
}

- (id)allCachedGroups
{
  return (id)[(NSMutableDictionary *)self->_cache allKeys];
}

- (void)clear
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PKHandwritingTranscriptionCache);
  uint64_t v5 = [(NSMutableDictionary *)self->_cache copy];
  cache = v4->_cache;
  v4->_cache = (NSMutableDictionary *)v5;

  return v4;
}

- (void).cxx_destruct
{
}

@end