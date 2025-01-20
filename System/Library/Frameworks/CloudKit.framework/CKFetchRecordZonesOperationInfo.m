@interface CKFetchRecordZonesOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)ignorePCSFailures;
- (BOOL)isFetchAllRecordZonesOperation;
- (CKFetchRecordZonesOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordZoneIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnorePCSFailures:(BOOL)a3;
- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3;
- (void)setRecordZoneIDs:(id)a3;
@end

@implementation CKFetchRecordZonesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordZonesOperationInfo;
  [(CKDatabaseOperationInfo *)&v21 encodeWithCoder:v4];
  v9 = objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordZoneIDs");

  uint64_t AllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, AllRecordZonesOperation, @"isFetchAllRecordZonesOperation");
  uint64_t v19 = objc_msgSend_ignorePCSFailures(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, v19, @"ignorePCSFailures");
}

- (CKFetchRecordZonesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordZonesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"recordZoneIDs");
    recordZoneIDs = v5->_recordZoneIDs;
    v5->_recordZoneIDs = (NSArray *)v14;

    v5->_isFetchuint64_t AllRecordZonesOperation = objc_msgSend_decodeBoolForKey_(v4, v16, @"isFetchAllRecordZonesOperation", v17);
    v5->_ignorePCSFailures = objc_msgSend_decodeBoolForKey_(v4, v18, @"ignorePCSFailures", v19);
  }

  return v5;
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchuint64_t AllRecordZonesOperation = a3;
}

- (BOOL)ignorePCSFailures
{
  return self->_ignorePCSFailures;
}

- (void)setIgnorePCSFailures:(BOOL)a3
{
  self->_ignorePCSFailures = a3;
}

- (void).cxx_destruct
{
}

@end