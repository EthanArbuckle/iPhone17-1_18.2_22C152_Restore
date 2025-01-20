@interface CRKFetchLastLoginDateResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchLastLoginDateResultObject)initWithCoder:(id)a3;
- (CRKFetchLastLoginDateResultObject)initWithDatesByAppleID:(id)a3;
- (NSDictionary)lastLoginDatesByAppleID;
- (void)encodeWithCoder:(id)a3;
- (void)setLastLoginDatesByAppleID:(id)a3;
@end

@implementation CRKFetchLastLoginDateResultObject

- (CRKFetchLastLoginDateResultObject)initWithDatesByAppleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchLastLoginDateResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lastLoginDatesByAppleID = v5->_lastLoginDatesByAppleID;
    v5->_lastLoginDatesByAppleID = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLastLoginDateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKFetchLastLoginDateResultObject;
  v5 = [(CATTaskResultObject *)&v21 initWithCoder:v4];
  if (v5)
  {
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"lastLoginDatesByAppleID"];
    lastLoginDatesByAppleID = v5->_lastLoginDatesByAppleID;
    v5->_lastLoginDatesByAppleID = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchLastLoginDateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchLastLoginDateResultObject *)self lastLoginDatesByAppleID];
  [v4 encodeObject:v5 forKey:@"lastLoginDatesByAppleID"];
}

- (NSDictionary)lastLoginDatesByAppleID
{
  return self->_lastLoginDatesByAppleID;
}

- (void)setLastLoginDatesByAppleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end