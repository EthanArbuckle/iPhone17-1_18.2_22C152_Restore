@interface CRKGenerateIdentityRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKGenerateIdentityRequest)initWithCoder:(id)a3;
- (NSString)commonName;
- (void)encodeWithCoder:(id)a3;
- (void)setCommonName:(id)a3;
@end

@implementation CRKGenerateIdentityRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKGenerateIdentityRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKGenerateIdentityRequest *)self commonName];
  [v4 encodeObject:v5 forKey:@"commonName"];
}

- (CRKGenerateIdentityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKGenerateIdentityRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"commonName"];
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;
  }
  return v5;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end