@interface CKModifyRecordZonesOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)allowDefaultZoneSave;
- (BOOL)dontFetchFromServer;
- (BOOL)markZonesAsUserPurged;
- (CKModifyRecordZonesOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (int64_t)maxZoneSaveAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowDefaultZoneSave:(BOOL)a3;
- (void)setDontFetchFromServer:(BOOL)a3;
- (void)setMarkZonesAsUserPurged:(BOOL)a3;
- (void)setMaxZoneSaveAttempts:(int64_t)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
@end

@implementation CKModifyRecordZonesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v31.receiver = self;
  v31.super_class = (Class)CKModifyRecordZonesOperationInfo;
  [(CKDatabaseOperationInfo *)&v31 encodeWithCoder:v4];
  v9 = objc_msgSend_recordZonesToSave(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordZones");

  v14 = objc_msgSend_recordZoneIDsToDelete(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"recordZoneIDs");

  uint64_t v19 = objc_msgSend_markZonesAsUserPurged(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, v19, @"userPurge");
  uint64_t v24 = objc_msgSend_maxZoneSaveAttempts(self, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, @"maxZoneSaveAttempts");
  uint64_t v29 = objc_msgSend_dontFetchFromServer(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, @"dontFetchFromServer");
}

- (CKModifyRecordZonesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKModifyRecordZonesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"recordZones");
    recordZonesToSave = v5->_recordZonesToSave;
    v5->_recordZonesToSave = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"recordZoneIDs");
    recordZoneIDsToDelete = v5->_recordZoneIDsToDelete;
    v5->_recordZoneIDsToDelete = (NSArray *)v23;

    v5->_markZonesAsUserPurged = objc_msgSend_decodeBoolForKey_(v4, v25, @"userPurge", v26);
    v5->_maxZoneSaveAttempts = objc_msgSend_decodeIntegerForKey_(v4, v27, @"maxZoneSaveAttempts", v28);
    v5->_dontFetchFromServer = objc_msgSend_decodeBoolForKey_(v4, v29, @"dontFetchFromServer", v30);
  }

  return v5;
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (BOOL)allowDefaultZoneSave
{
  return self->_allowDefaultZoneSave;
}

- (void)setAllowDefaultZoneSave:(BOOL)a3
{
  self->_allowDefaultZoneSave = a3;
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (BOOL)dontFetchFromServer
{
  return self->_dontFetchFromServer;
}

- (void)setDontFetchFromServer:(BOOL)a3
{
  self->_dontFetchFromServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end