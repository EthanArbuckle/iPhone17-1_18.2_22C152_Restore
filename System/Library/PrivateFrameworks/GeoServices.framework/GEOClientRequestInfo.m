@interface GEOClientRequestInfo
+ (BOOL)supportsSecureCoding;
- (GEOClientRequestInfo)init;
- (GEOClientRequestInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOClientRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(GEOClientRequestInfo);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_requests copyItems:1];
  requests = v4->_requests;
  v4->_requests = (NSMutableDictionary *)v5;

  return v4;
}

- (GEOClientRequestInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOClientRequestInfo;
  v2 = [(GEOClientRequestInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (GEOClientRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOClientRequestInfo;
  uint64_t v5 = [(GEOClientRequestInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"requests"];
    uint64_t v8 = [v7 mutableCopy];
    requests = v5->_requests;
    v5->_requests = (NSMutableDictionary *)v8;

    if (!v5->_requests)
    {
      uint64_t v10 = objc_opt_new();
      v11 = v5->_requests;
      v5->_requests = (NSMutableDictionary *)v10;
    }
  }

  return v5;
}

@end