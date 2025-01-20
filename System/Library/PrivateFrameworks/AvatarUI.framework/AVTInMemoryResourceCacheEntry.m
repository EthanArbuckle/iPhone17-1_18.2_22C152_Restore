@interface AVTInMemoryResourceCacheEntry
- (AVTCacheableResourceChangeToken)changeToken;
- (AVTCachedResource)resource;
- (AVTInMemoryResourceCacheEntry)initWithResource:(id)a3 changeToken:(id)a4 key:(id)a5 cost:(unint64_t)a6;
- (NSString)key;
- (id)description;
- (unint64_t)cost;
- (void)dealloc;
@end

@implementation AVTInMemoryResourceCacheEntry

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AVTInMemoryResourceCacheEntry;
  v3 = [(AVTInMemoryResourceCacheEntry *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@" key: "];
  v5 = [(AVTInMemoryResourceCacheEntry *)self key];
  [v4 appendString:v5];

  v6 = (void *)[v4 copy];
  return v6;
}

- (AVTInMemoryResourceCacheEntry)initWithResource:(id)a3 changeToken:(id)a4 key:(id)a5 cost:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTInMemoryResourceCacheEntry;
  v14 = [(AVTInMemoryResourceCacheEntry *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resource, a3);
    objc_storeStrong((id *)&v15->_changeToken, a4);
    uint64_t v16 = [v13 copy];
    key = v15->_key;
    v15->_key = (NSString *)v16;

    v15->_cost = a6;
  }

  return v15;
}

- (void)dealloc
{
  [(AVTCacheableResourceChangeToken *)self->_changeToken stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)AVTInMemoryResourceCacheEntry;
  [(AVTInMemoryResourceCacheEntry *)&v3 dealloc];
}

- (AVTCachedResource)resource
{
  return self->_resource;
}

- (AVTCacheableResourceChangeToken)changeToken
{
  return self->_changeToken;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end