@interface CKReplaceMergeableDeltasOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKReplaceMergeableDeltasOperationInfo)initWithCoder:(id)a3;
- (NSArray)replaceDeltasRequests;
- (void)encodeWithCoder:(id)a3;
- (void)setReplaceDeltasRequests:(id)a3;
@end

@implementation CKReplaceMergeableDeltasOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v9.receiver = self;
  v9.super_class = (Class)CKReplaceMergeableDeltasOperationInfo;
  [(CKDatabaseOperationInfo *)&v9 encodeWithCoder:v4];
  replaceDeltasRequests = self->_replaceDeltasRequests;
  v7 = NSStringFromSelector(sel_replaceDeltasRequests);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)replaceDeltasRequests, (uint64_t)v7);
}

- (CKReplaceMergeableDeltasOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKReplaceMergeableDeltasOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v13 = NSStringFromSelector(sel_replaceDeltasRequests);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    replaceDeltasRequests = v5->_replaceDeltasRequests;
    v5->_replaceDeltasRequests = (NSArray *)v15;
  }

  return v5;
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end