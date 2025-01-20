@interface IDSCacheClearRequest
+ (BOOL)supportsSecureCoding;
- (IDSCacheClearRequest)initWithCoder:(id)a3;
- (NSArray)requestContexts;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestContexts:(id)a3;
@end

@implementation IDSCacheClearRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_requestContexts, v3, @"RequestContextKey");
}

- (IDSCacheClearRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSCacheClearRequest;
  v5 = [(IDSCacheClearRequest *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, v8, @"RequestContextKey");
    requestContexts = v5->_requestContexts;
    v5->_requestContexts = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)requestContexts
{
  return self->_requestContexts;
}

- (void)setRequestContexts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end