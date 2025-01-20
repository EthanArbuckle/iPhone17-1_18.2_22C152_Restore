@interface CKDatabaseOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKDatabaseOperationInfo)initWithCoder:(id)a3;
- (id)activityCreate;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)takeValuesFrom:(id)a3;
@end

@implementation CKDatabaseOperationInfo

- (void)takeValuesFrom:(id)a3
{
  id v4 = a3;
  self->_databaseScope = objc_msgSend_databaseScope(v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)CKDatabaseOperationInfo;
  [(CKOperationInfo *)&v8 takeValuesFrom:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKDatabaseOperationInfo;
  [(CKOperationInfo *)&v11 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_databaseScope(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, v9, @"DatabaseScope");
}

- (CKDatabaseOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDatabaseOperationInfo;
  v5 = [(CKOperationInfo *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v7, @"DatabaseScope", v8);
  }

  return v5;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/db-operation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

@end