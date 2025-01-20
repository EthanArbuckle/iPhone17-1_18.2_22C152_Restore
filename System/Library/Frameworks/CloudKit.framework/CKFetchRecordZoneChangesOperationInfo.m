@interface CKFetchRecordZoneChangesOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchAllChanges;
- (BOOL)forcePCSDecryptionAttempt;
- (BOOL)shouldFetchAssetContents;
- (CKFetchRecordZoneChangesOperationInfo)init;
- (CKFetchRecordZoneChangesOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (NSDictionary)supplementalChangeTokenByZoneID;
- (int64_t)changeTypes;
- (int64_t)errorReportingStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setErrorReportingStyle:(int64_t)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setForcePCSDecryptionAttempt:(BOOL)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setSupplementalChangeTokenByZoneID:(id)a3;
@end

@implementation CKFetchRecordZoneChangesOperationInfo

- (CKFetchRecordZoneChangesOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_fetchAllChanges = 1;
    result->_errorReportingStyle = 1;
  }
  return result;
}

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  if (a3 && objc_msgSend_errorReportingStyle(self, a2, a3, v3) == 2) {
    objc_msgSend_setErrorReportingStyle_(self, v6, 1, v7);
  }
  self->_forcePCSDecryptionAttempt = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v46.receiver = self;
  v46.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  [(CKDatabaseOperationInfo *)&v46 encodeWithCoder:v4];
  v9 = objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"RecordZoneIDs");

  v14 = objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"configurationsByRecordZoneID");

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContents, @"shouldFetchAssetContents");
  uint64_t v24 = objc_msgSend_changeTypes(self, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, @"changeTypes");
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, AllChanges, @"fetchAllChanges");
  v34 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, @"assetTransferOptionsByKeyByRecordType");

  v39 = objc_msgSend_supplementalChangeTokenByZoneID(self, v36, v37, v38);
  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, @"supplementalChangeTokenByZoneID");

  uint64_t v44 = objc_msgSend_errorReportingStyle(self, v41, v42, v43);
  objc_msgSend_encodeInteger_forKey_(v4, v45, v44, @"errorReportingStyle");
}

- (CKFetchRecordZoneChangesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CKFetchRecordZoneChangesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v55 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"RecordZoneIDs");
    recordZoneIDs = v5->_recordZoneIDs;
    v5->_recordZoneIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_setWithObjects_(v16, v20, v17, v21, v18, v19, 0);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"configurationsByRecordZoneID");
    configurationsByRecordZoneID = v5->_configurationsByRecordZoneID;
    v5->_configurationsByRecordZoneID = (NSDictionary *)v24;

    v5->_shouldFetchuint64_t AssetContents = objc_msgSend_decodeBoolForKey_(v4, v26, @"shouldFetchAssetContents", v27);
    v5->_changeTypes = objc_msgSend_decodeIntegerForKey_(v4, v28, @"changeTypes", v29);
    v5->_fetchuint64_t AllChanges = objc_msgSend_decodeBoolForKey_(v4, v30, @"fetchAllChanges", v31);
    uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v38 = objc_msgSend_setWithObjects_(v32, v36, v33, v37, v34, v35, 0);
    uint64_t v40 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, @"assetTransferOptionsByKeyByRecordType");
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v40;

    uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    v48 = objc_msgSend_setWithObjects_(v42, v46, v43, v47, v44, v45, 0);
    uint64_t v50 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v49, (uint64_t)v48, @"supplementalChangeTokenByZoneID");
    supplementalChangeTokenByZoneID = v5->_supplementalChangeTokenByZoneID;
    v5->_supplementalChangeTokenByZoneID = (NSDictionary *)v50;

    v5->_errorReportingStyle = objc_msgSend_decodeIntegerForKey_(v4, v52, @"errorReportingStyle", v53);
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

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchuint64_t AllChanges = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  self->_errorReportingStyle = a3;
}

- (BOOL)forcePCSDecryptionAttempt
{
  return self->_forcePCSDecryptionAttempt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);

  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end