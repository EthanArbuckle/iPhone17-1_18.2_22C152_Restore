@interface IDSCacheClearRequestContext
+ (BOOL)supportsSecureCoding;
- (IDSCacheClearRequestContext)initWithCoder:(id)a3;
- (NSArray)uris;
- (NSString)service;
- (void)encodeWithCoder:(id)a3;
- (void)setService:(id)a3;
- (void)setUris:(id)a3;
@end

@implementation IDSCacheClearRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uris = self->_uris;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)uris, v6, @"urisKey");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_service, v8, @"serviceKey");
}

- (IDSCacheClearRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSCacheClearRequestContext;
  v5 = [(IDSCacheClearRequestContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, v8, @"urisKey");
    uris = v5->_uris;
    v5->_uris = (NSArray *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, @"serviceKey");
    service = v5->_service;
    v5->_service = (NSString *)v14;
  }
  return v5;
}

- (NSArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uris, 0);
}

@end