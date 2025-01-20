@interface CKSerializeRecordModificationsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKSerializeRecordModificationsOperationInfo)init;
- (CKSerializeRecordModificationsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
@end

@implementation CKSerializeRecordModificationsOperationInfo

- (CKSerializeRecordModificationsOperationInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  v2 = [(CKOperationInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    recordsToSave = v2->_recordsToSave;
    v2->_recordsToSave = 0;

    recordIDsToDelete = v3->_recordIDsToDelete;
    v3->_recordIDsToDelete = 0;
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
  v23.receiver = self;
  v23.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  [(CKDatabaseOperationInfo *)&v23 encodeWithCoder:v4];
  v9 = objc_msgSend_recordsToSave(self, v6, v7, v8);

  if (v9)
  {
    v13 = objc_msgSend_recordsToSave(self, v10, v11, v12);
    v14 = NSStringFromSelector(sel_recordsToSave);
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v13, (uint64_t)v14);
  }
  v16 = objc_msgSend_recordIDsToDelete(self, v10, v11, v12);

  if (v16)
  {
    v20 = objc_msgSend_recordIDsToDelete(self, v17, v18, v19);
    v21 = NSStringFromSelector(sel_recordIDsToDelete);
    objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);
  }
}

- (CKSerializeRecordModificationsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v28 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v13 = NSStringFromSelector(sel_recordsToSave);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    recordsToSave = v5->_recordsToSave;
    v5->_recordsToSave = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    objc_super v23 = NSStringFromSelector(sel_recordIDsToDelete);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    recordIDsToDelete = v5->_recordIDsToDelete;
    v5->_recordIDsToDelete = (NSArray *)v25;
  }

  return v5;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end