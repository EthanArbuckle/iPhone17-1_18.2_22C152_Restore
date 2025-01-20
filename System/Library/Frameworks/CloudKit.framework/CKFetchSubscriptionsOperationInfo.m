@interface CKFetchSubscriptionsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isFetchAllSubscriptionsOperation;
- (CKFetchSubscriptionsOperationInfo)initWithCoder:(id)a3;
- (NSArray)subscriptionIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3;
- (void)setSubscriptionIDs:(id)a3;
@end

@implementation CKFetchSubscriptionsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v16.receiver = self;
  v16.super_class = (Class)CKFetchSubscriptionsOperationInfo;
  [(CKDatabaseOperationInfo *)&v16 encodeWithCoder:v4];
  v9 = objc_msgSend_subscriptionIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"subscriptionIDs");

  uint64_t AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, AllSubscriptionsOperation, @"isFetchAllSubscriptionsOperation");
}

- (CKFetchSubscriptionsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKFetchSubscriptionsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"subscriptionIDs");
    subscriptionIDs = v5->_subscriptionIDs;
    v5->_subscriptionIDs = (NSArray *)v14;

    v5->_isFetchuint64_t AllSubscriptionsOperation = objc_msgSend_decodeBoolForKey_(v4, v16, @"isFetchAllSubscriptionsOperation", v17);
  }

  return v5;
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchuint64_t AllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
}

@end