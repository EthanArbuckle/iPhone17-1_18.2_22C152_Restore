@interface CRKFetchResourceRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchResourceRequest)initWithCoder:(id)a3;
- (NSURL)resourceURL;
- (void)encodeWithCoder:(id)a3;
- (void)setResourceURL:(id)a3;
@end

@implementation CRKFetchResourceRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchResourceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchResourceRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"resourceURL"];
    resourceURL = v5->_resourceURL;
    v5->_resourceURL = (NSURL *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchResourceRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchResourceRequest *)self resourceURL];
  [v4 encodeObject:v5 forKey:@"resourceURL"];
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end