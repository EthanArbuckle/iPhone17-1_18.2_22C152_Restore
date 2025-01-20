@interface CKModifyRecordAccessOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKModifyRecordAccessOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDsToGrant;
- (NSArray)recordIDsToRevoke;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordIDsToGrant:(id)a3;
- (void)setRecordIDsToRevoke:(id)a3;
@end

@implementation CKModifyRecordAccessOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKModifyRecordAccessOperationInfo;
  id v4 = a3;
  [(CKDatabaseOperationInfo *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_recordIDsToGrant, @"RecordIDsToGrant", v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDsToRevoke, @"RecordIDsToRevoke");
}

- (CKModifyRecordAccessOperationInfo)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKModifyRecordAccessOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v27, 2);
    v11 = objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8, v10);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"RecordIDsToGrant");
    recordIDsToGrant = v5->_recordIDsToGrant;
    v5->_recordIDsToGrant = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v26, 2);
    v20 = objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"RecordIDsToRevoke");
    recordIDsToRevoke = v5->_recordIDsToRevoke;
    v5->_recordIDsToRevoke = (NSArray *)v22;
  }
  return v5;
}

- (NSArray)recordIDsToGrant
{
  return self->_recordIDsToGrant;
}

- (void)setRecordIDsToGrant:(id)a3
{
}

- (NSArray)recordIDsToRevoke
{
  return self->_recordIDsToRevoke;
}

- (void)setRecordIDsToRevoke:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);

  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
}

@end