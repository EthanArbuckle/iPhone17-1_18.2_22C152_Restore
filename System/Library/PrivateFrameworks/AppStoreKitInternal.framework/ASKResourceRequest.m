@interface ASKResourceRequest
+ (id)makeUniqueKey;
- (ASKResourceRequest)init;
- (BOOL)isEqual:(id)a3;
- (NSObject)cacheKey;
- (NSObject)requestKey;
- (id)description;
- (id)makeLoadOperation;
- (unint64_t)cacheOptions;
- (unint64_t)hash;
- (void)setCacheKey:(id)a3;
- (void)setRequestKey:(id)a3;
@end

@implementation ASKResourceRequest

+ (id)makeUniqueKey
{
  atomic_fetch_add_explicit(&makeUniqueKey_counter, 1uLL, memory_order_relaxed);
  v2 = NSNumber;
  unint64_t v3 = atomic_load((unint64_t *)&makeUniqueKey_counter);
  return (id)[v2 numberWithUnsignedLong:v3];
}

- (ASKResourceRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASKResourceRequest;
  v2 = [(ASKResourceRequest *)&v9 init];
  if (v2)
  {
    unint64_t v3 = [(id)objc_opt_class() makeUniqueKey];
    uint64_t v4 = [v3 copyWithZone:0];
    requestKey = v2->_requestKey;
    v2->_requestKey = v4;

    uint64_t v6 = [v3 copyWithZone:0];
    cacheKey = v2->_cacheKey;
    v2->_cacheKey = v6;
  }
  return v2;
}

- (unint64_t)cacheOptions
{
  return 0;
}

- (id)makeLoadOperation
{
  return 0;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ASKResourceRequest *)self cacheKey];
  v7 = [v3 stringWithFormat:@"<%@:%p cacheKey = %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ASKResourceRequest *)self requestKey];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = [v4 cacheKey];
    v8 = [(ASKResourceRequest *)self cacheKey];
    BOOL v6 = v7 == v8;
  }
  return v6;
}

- (NSObject)requestKey
{
  return self->_requestKey;
}

- (void)setRequestKey:(id)a3
{
}

- (NSObject)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

@end