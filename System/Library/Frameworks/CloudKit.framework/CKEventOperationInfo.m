@interface CKEventOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKEventOperationInfo)initWithCoder:(id)a3;
- (CKEventOperationInfo)initWithOperation:(id)a3;
- (NSString)operationGroupID;
- (NSString)operationID;
- (NSString)operationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKEventOperationInfo

- (CKEventOperationInfo)initWithOperation:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKEventOperationInfo;
  v8 = [(CKEventOperationInfo *)&v36 init];
  if (v8)
  {
    v9 = objc_msgSend_operationID(v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);
    operationID = v8->_operationID;
    v8->_operationID = (NSString *)v13;

    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v20 = objc_msgSend_copy(v16, v17, v18, v19);
    operationType = v8->_operationType;
    v8->_operationType = (NSString *)v20;

    v25 = objc_msgSend_group(v4, v22, v23, v24);
    v29 = objc_msgSend_operationGroupID(v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_copy(v29, v30, v31, v32);
    operationGroupID = v8->_operationGroupID;
    v8->_operationGroupID = (NSString *)v33;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_operationID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"operationID");

  uint64_t v13 = objc_msgSend_operationType(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, @"operationType");

  uint64_t v18 = objc_msgSend_operationGroupID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, @"groupID");
}

- (CKEventOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKEventOperationInfo;
  v5 = [(CKEventOperationInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"operationID");
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"operationType");
    operationType = v5->_operationType;
    v5->_operationType = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"groupID");
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v17;
  }

  return v5;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (NSString)operationGroupID
{
  return self->_operationGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupID, 0);
  objc_storeStrong((id *)&self->_operationType, 0);

  objc_storeStrong((id *)&self->_operationID, 0);
}

@end