@interface CKMovePhotosOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKMovePhotosOperationInfo)initWithCoder:(id)a3;
- (NSArray)moveChanges;
- (int64_t)sourceDatabaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setMoveChanges:(id)a3;
- (void)setSourceDatabaseScope:(int64_t)a3;
@end

@implementation CKMovePhotosOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v18.receiver = self;
  v18.super_class = (Class)CKMovePhotosOperationInfo;
  [(CKModifyRecordsOperationInfo *)&v18 encodeWithCoder:v4];
  v9 = objc_msgSend_moveChanges(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_moveChanges);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  uint64_t v15 = objc_msgSend_sourceDatabaseScope(self, v12, v13, v14);
  v16 = NSStringFromSelector(sel_databaseScope);
  objc_msgSend_encodeInteger_forKey_(v4, v17, v15, (uint64_t)v16);
}

- (CKMovePhotosOperationInfo)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKMovePhotosOperationInfo;
  v5 = [(CKModifyRecordsOperationInfo *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v22, 2);
    v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v13 = NSStringFromSelector(sel_moveChanges);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    moveChanges = v5->_moveChanges;
    v5->_moveChanges = (NSArray *)v15;

    v17 = NSStringFromSelector(sel_databaseScope);
    v5->_sourceDatabaseScope = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)v17, v19);
  }

  return v5;
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (void).cxx_destruct
{
}

@end