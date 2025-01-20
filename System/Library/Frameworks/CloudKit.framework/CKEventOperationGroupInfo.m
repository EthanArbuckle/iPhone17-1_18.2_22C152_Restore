@interface CKEventOperationGroupInfo
+ (BOOL)supportsSecureCoding;
- (CKEventOperationGroupInfo)initWithCoder:(id)a3;
- (NSString)operationGroupID;
- (NSString)operationGroupName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKEventOperationGroupInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_operationGroupID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"operationGroupID");

  v13 = objc_msgSend_operationGroupName(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, @"operationGroupName");
}

- (CKEventOperationGroupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEventOperationGroupInfo;
  v5 = [(CKEventOperationGroupInfo *)&v16 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"operationGroupID");
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"operationGroupName");
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v13;
  }

  return v5;
}

- (NSString)operationGroupID
{
  return self->_operationGroupID;
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);

  objc_storeStrong((id *)&self->_operationGroupID, 0);
}

@end