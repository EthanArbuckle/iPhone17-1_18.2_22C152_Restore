@interface CKDeserializeRecordModificationsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKDeserializeRecordModificationsOperationInfo)init;
- (CKDeserializeRecordModificationsOperationInfo)initWithCoder:(id)a3;
- (NSData)serializedModifications;
- (void)encodeWithCoder:(id)a3;
- (void)setSerializedModifications:(id)a3;
@end

@implementation CKDeserializeRecordModificationsOperationInfo

- (CKDeserializeRecordModificationsOperationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  v2 = [(CKOperationInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    serializedModifications = v2->_serializedModifications;
    v2->_serializedModifications = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v16.receiver = self;
  v16.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  [(CKDatabaseOperationInfo *)&v16 encodeWithCoder:v4];
  v9 = objc_msgSend_serializedModifications(self, v6, v7, v8);

  if (v9)
  {
    v13 = objc_msgSend_serializedModifications(self, v10, v11, v12);
    v14 = NSStringFromSelector(sel_serializedModifications);
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v13, (uint64_t)v14);
  }
}

- (CKDeserializeRecordModificationsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(sel_serializedModifications);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    serializedModifications = v5->_serializedModifications;
    v5->_serializedModifications = (NSData *)v10;
  }

  return v5;
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
}

- (void).cxx_destruct
{
}

@end