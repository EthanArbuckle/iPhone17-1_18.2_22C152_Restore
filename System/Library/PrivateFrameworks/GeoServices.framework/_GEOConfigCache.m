@interface _GEOConfigCache
- (id)init:(id)a3;
- (void)withCache:(id)a3;
@end

@implementation _GEOConfigCache

- (void)withCache:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

- (id)init:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOConfigCache;
  v6 = [(_GEOConfigCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_cache, a3);
    uint64_t v8 = geo_isolater_create();
    isolator = v7->_isolator;
    v7->_isolator = (geo_isolater *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolator, 0);

  objc_storeStrong(&self->_cache, 0);
}

@end