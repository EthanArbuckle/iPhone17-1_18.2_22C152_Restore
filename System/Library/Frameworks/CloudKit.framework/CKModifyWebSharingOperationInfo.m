@interface CKModifyWebSharingOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKModifyWebSharingOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDsToShare;
- (NSArray)recordIDsToShareReadWrite;
- (NSArray)recordIDsToUnshare;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordIDsToShare:(id)a3;
- (void)setRecordIDsToShareReadWrite:(id)a3;
- (void)setRecordIDsToUnshare:(id)a3;
@end

@implementation CKModifyWebSharingOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKModifyWebSharingOperationInfo;
  id v4 = a3;
  [(CKDatabaseOperationInfo *)&v8 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_recordIDsToShare, @"RecordIDsToShare", v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDsToUnshare, @"RecordIDsToUnshare");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_recordIDsToShareReadWrite, @"RecordIDsToShareReadWrite");
}

- (CKModifyWebSharingOperationInfo)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKModifyWebSharingOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v34 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_super v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v37, 2);
    v11 = objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8, v10);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"RecordIDsToShare");
    recordIDsToShare = v5->_recordIDsToShare;
    v5->_recordIDsToShare = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v36, 2);
    v20 = objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"RecordIDsToUnshare");
    recordIDsToUnshare = v5->_recordIDsToUnshare;
    v5->_recordIDsToUnshare = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v35, 2);
    v29 = objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26, v28);
    uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, @"RecordIDsToShareReadWrite");
    recordIDsToShareReadWrite = v5->_recordIDsToShareReadWrite;
    v5->_recordIDsToShareReadWrite = (NSArray *)v31;
  }
  return v5;
}

- (NSArray)recordIDsToShare
{
  return self->_recordIDsToShare;
}

- (void)setRecordIDsToShare:(id)a3
{
}

- (NSArray)recordIDsToUnshare
{
  return self->_recordIDsToUnshare;
}

- (void)setRecordIDsToUnshare:(id)a3
{
}

- (NSArray)recordIDsToShareReadWrite
{
  return self->_recordIDsToShareReadWrite;
}

- (void)setRecordIDsToShareReadWrite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, 0);
  objc_storeStrong((id *)&self->_recordIDsToUnshare, 0);

  objc_storeStrong((id *)&self->_recordIDsToShare, 0);
}

@end