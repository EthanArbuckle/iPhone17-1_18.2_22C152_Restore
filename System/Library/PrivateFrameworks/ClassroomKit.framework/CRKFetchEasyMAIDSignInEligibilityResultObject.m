@interface CRKFetchEasyMAIDSignInEligibilityResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchEasyMAIDSignInEligibilityResultObject)initWithCoder:(id)a3;
- (NSDictionary)eligibility;
- (void)encodeWithCoder:(id)a3;
- (void)setEligibility:(id)a3;
@end

@implementation CRKFetchEasyMAIDSignInEligibilityResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchEasyMAIDSignInEligibilityResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKFetchEasyMAIDSignInEligibilityResultObject;
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
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"eligibility"];
    eligibility = v5->_eligibility;
    v5->_eligibility = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchEasyMAIDSignInEligibilityResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchEasyMAIDSignInEligibilityResultObject *)self eligibility];
  [v4 encodeObject:v5 forKey:@"eligibility"];
}

- (NSDictionary)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(id)a3
{
}

- (void).cxx_destruct
{
}

@end