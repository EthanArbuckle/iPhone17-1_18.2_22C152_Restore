@interface CKFetchShareParticipantsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKFetchShareParticipantsOperationInfo)initWithCoder:(id)a3;
- (NSArray)userIdentityLookupInfos;
- (void)encodeWithCoder:(id)a3;
- (void)setUserIdentityLookupInfos:(id)a3;
@end

@implementation CKFetchShareParticipantsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_userIdentityLookupInfos, @"UserIdentityInfos");
  v7.receiver = self;
  v7.super_class = (Class)CKFetchShareParticipantsOperationInfo;
  [(CKOperationInfo *)&v7 encodeWithCoder:v4];
}

- (CKFetchShareParticipantsOperationInfo)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKFetchShareParticipantsOperationInfo;
  v5 = [(CKOperationInfo *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v19, 2);
    v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"UserIdentityInfos");
    objc_msgSend_setUserIdentityLookupInfos_(v5, v15, (uint64_t)v14, v16);
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