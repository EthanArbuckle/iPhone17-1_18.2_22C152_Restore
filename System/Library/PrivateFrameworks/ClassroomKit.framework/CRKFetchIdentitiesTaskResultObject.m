@interface CRKFetchIdentitiesTaskResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchIdentitiesTaskResultObject)initWithCoder:(id)a3;
- (NSDictionary)courseIdentityInfosByGroupIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentityInfosByGroupIdentifier:(id)a3;
@end

@implementation CRKFetchIdentitiesTaskResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKFetchIdentitiesTaskResultObject *)self courseIdentityInfosByGroupIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentityInfosByGroupIdentifier"];
}

- (CRKFetchIdentitiesTaskResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKFetchIdentitiesTaskResultObject;
  id v5 = [(CATTaskResultObject *)&v21 initWithCoder:v4];
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
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"courseIdentityInfosByGroupIdentifier"];
    courseIdentityInfosByGroupIdentifier = v5->_courseIdentityInfosByGroupIdentifier;
    v5->_courseIdentityInfosByGroupIdentifier = (NSDictionary *)v15;
  }
  return v5;
}

- (NSDictionary)courseIdentityInfosByGroupIdentifier
{
  return self->_courseIdentityInfosByGroupIdentifier;
}

- (void)setCourseIdentityInfosByGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end