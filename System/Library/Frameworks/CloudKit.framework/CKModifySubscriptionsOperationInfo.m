@interface CKModifySubscriptionsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKModifySubscriptionsOperationInfo)initWithCoder:(id)a3;
- (NSArray)subscriptionIDsToDelete;
- (NSArray)subscriptionsToSave;
- (void)encodeWithCoder:(id)a3;
- (void)setSubscriptionIDsToDelete:(id)a3;
- (void)setSubscriptionsToSave:(id)a3;
@end

@implementation CKModifySubscriptionsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v16.receiver = self;
  v16.super_class = (Class)CKModifySubscriptionsOperationInfo;
  [(CKDatabaseOperationInfo *)&v16 encodeWithCoder:v4];
  v9 = objc_msgSend_subscriptionsToSave(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"subscriptions");

  v14 = objc_msgSend_subscriptionIDsToDelete(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"subscriptionIDs");
}

- (CKModifySubscriptionsOperationInfo)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKModifySubscriptionsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v26 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v28, 2);
    uint64_t v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"subscriptions");
    subscriptionsToSave = v5->_subscriptionsToSave;
    v5->_subscriptionsToSave = (NSArray *)v14;

    objc_super v16 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v27, 2);
    v21 = objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18, v20);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"subscriptionIDs");
    subscriptionIDsToDelete = v5->_subscriptionIDsToDelete;
    v5->_subscriptionIDsToDelete = (NSArray *)v23;
  }

  return v5;
}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(id)a3
{
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);

  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
}

@end