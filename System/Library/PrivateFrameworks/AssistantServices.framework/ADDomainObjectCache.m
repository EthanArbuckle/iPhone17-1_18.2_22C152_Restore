@interface ADDomainObjectCache
- (ADDomainObjectCache)init;
- (id)domainObjectForKey:(id)a3;
- (id)oldIdForKey:(id)a3;
- (void)reset;
- (void)setDomainObject:(id)a3 forKey:(id)a4;
- (void)setDomainObject:(id)a3 withOldId:(id)a4 forKey:(id)a5;
@end

@implementation ADDomainObjectCache

- (void).cxx_destruct
{
}

- (void)reset
{
}

- (id)oldIdForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_cacheEntriesByAceKey objectForKeyedSubscript:a3];
  v4 = [v3 oldId];

  return v4;
}

- (void)setDomainObject:(id)a3 forKey:(id)a4
{
}

- (void)setDomainObject:(id)a3 withOldId:(id)a4 forKey:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(NSMutableDictionary *)self->_cacheEntriesByAceKey objectForKeyedSubscript:v9];
  if (v11)
  {
    if (!v10)
    {
      v10 = objc_alloc_init(_ADDomainObjectCacheEntry);
      [(NSMutableDictionary *)self->_cacheEntriesByAceKey setObject:v10 forKeyedSubscript:v9];
    }
    [(_ADDomainObjectCacheEntry *)v10 setAceDictionary:v11];
    if (v8) {
      [(_ADDomainObjectCacheEntry *)v10 setOldId:v8];
    }
  }
  else if (v10)
  {
    [(NSMutableDictionary *)self->_cacheEntriesByAceKey removeObjectForKey:v9];
  }
}

- (id)domainObjectForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_cacheEntriesByAceKey objectForKeyedSubscript:a3];
  v4 = [v3 aceDictionary];

  return v4;
}

- (ADDomainObjectCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADDomainObjectCache;
  v2 = [(ADDomainObjectCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cacheEntriesByAceKey = v2->_cacheEntriesByAceKey;
    v2->_cacheEntriesByAceKey = v3;
  }
  return v2;
}

@end