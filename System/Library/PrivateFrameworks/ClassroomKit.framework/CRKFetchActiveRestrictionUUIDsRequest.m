@interface CRKFetchActiveRestrictionUUIDsRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchActiveRestrictionUUIDsRequest)initWithCoder:(id)a3;
- (NSString)clientType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientType:(id)a3;
@end

@implementation CRKFetchActiveRestrictionUUIDsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveRestrictionUUIDsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchActiveRestrictionUUIDsRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"clientType"];
    clientType = v5->_clientType;
    v5->_clientType = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchActiveRestrictionUUIDsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchActiveRestrictionUUIDsRequest *)self clientType];
  [v4 encodeObject:v5 forKey:@"clientType"];
}

- (NSString)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end