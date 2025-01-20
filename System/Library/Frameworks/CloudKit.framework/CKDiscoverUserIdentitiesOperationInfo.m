@interface CKDiscoverUserIdentitiesOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKDiscoverUserIdentitiesOperationInfo)initWithCoder:(id)a3;
- (NSArray)userIdentityLookupInfos;
- (void)encodeWithCoder:(id)a3;
- (void)setUserIdentityLookupInfos:(id)a3;
@end

@implementation CKDiscoverUserIdentitiesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKDiscoverUserIdentitiesOperationInfo;
  [(CKOperationInfo *)&v11 encodeWithCoder:v4];
  v9 = objc_msgSend_userIdentityLookupInfos(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"IdentityLookupInfos");
}

- (CKDiscoverUserIdentitiesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDiscoverUserIdentitiesOperationInfo;
  v5 = [(CKOperationInfo *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"IdentityLookupInfos");
    userIdentityLookupInfos = v5->_userIdentityLookupInfos;
    v5->_userIdentityLookupInfos = (NSArray *)v14;
  }

  return v5;
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end