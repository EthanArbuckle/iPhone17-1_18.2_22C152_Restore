@interface _HFHomePropertyCacheManagerKey
- (BOOL)isEqual:(id)a3;
- (NSString)key;
- (NSUUID)objectID;
- (_HFHomePropertyCacheManagerKey)initWithObjectID:(id)a3 key:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _HFHomePropertyCacheManagerKey

- (_HFHomePropertyCacheManagerKey)initWithObjectID:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HFHomePropertyCacheManagerKey;
  v9 = [(_HFHomePropertyCacheManagerKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectID, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(_HFHomePropertyCacheManagerKey *)self objectID];
  uint64_t v4 = [v3 hash];
  v5 = [(_HFHomePropertyCacheManagerKey *)self key];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSUUID)objectID
{
  return self->_objectID;
}

- (NSString)key
{
  return self->_key;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_HFHomePropertyCacheManagerKey);
  uint64_t v5 = [(_HFHomePropertyCacheManagerKey *)self objectID];
  objectID = v4->_objectID;
  v4->_objectID = (NSUUID *)v5;

  uint64_t v7 = [(_HFHomePropertyCacheManagerKey *)self key];
  key = v4->_key;
  v4->_key = (NSString *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_HFHomePropertyCacheManagerKey *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_HFHomePropertyCacheManagerKey;
    if ([(_HFHomePropertyCacheManagerKey *)&v12 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(_HFHomePropertyCacheManagerKey *)self objectID];
      uint64_t v7 = [(_HFHomePropertyCacheManagerKey *)v5 objectID];
      if (v6 == v7)
      {
        v9 = [(_HFHomePropertyCacheManagerKey *)self key];
        v10 = [(_HFHomePropertyCacheManagerKey *)v5 key];
        BOOL v8 = v9 == v10;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end