@interface CRKFetchLastLoginDateRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchLastLoginDateRequest)initWithCoder:(id)a3;
- (NSSet)appleIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleIDs:(id)a3;
@end

@implementation CRKFetchLastLoginDateRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLastLoginDateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchLastLoginDateRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appleIDs"];
    appleIDs = v5->_appleIDs;
    v5->_appleIDs = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchLastLoginDateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchLastLoginDateRequest *)self appleIDs];
  [v4 encodeObject:v5 forKey:@"appleIDs"];
}

- (NSSet)appleIDs
{
  return self->_appleIDs;
}

- (void)setAppleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end