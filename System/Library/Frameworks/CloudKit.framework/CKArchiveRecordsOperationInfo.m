@interface CKArchiveRecordsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKArchiveRecordsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordIDs:(id)a3;
@end

@implementation CKArchiveRecordsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKArchiveRecordsOperationInfo;
  [(CKDatabaseOperationInfo *)&v11 encodeWithCoder:v4];
  v9 = objc_msgSend_recordIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordIDs");
}

- (CKArchiveRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKArchiveRecordsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"recordIDs");
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;
  }

  return v5;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end