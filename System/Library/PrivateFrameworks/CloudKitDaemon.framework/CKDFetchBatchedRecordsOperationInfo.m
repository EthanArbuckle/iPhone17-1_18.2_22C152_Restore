@interface CKDFetchBatchedRecordsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchAllChanges;
- (BOOL)forcePCSDecryptionAttempt;
- (BOOL)shouldFetchAssetContents;
- (CKDFetchBatchedRecordsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (NSDictionary)supplementalChangeTokenByZoneID;
- (int64_t)errorReportingStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setErrorReportingStyle:(int64_t)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setForcePCSDecryptionAttempt:(BOOL)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
- (void)setSupplementalChangeTokenByZoneID:(id)a3;
@end

@implementation CKDFetchBatchedRecordsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C8789E70]();
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchBatchedRecordsOperationInfo;
  [(CKDatabaseOperationInfo *)&v26 encodeWithCoder:v4];
  v8 = objc_msgSend_recordZoneIDs(self, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"recordZoneIDs");

  v12 = objc_msgSend_configurationsByRecordZoneID(self, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"configurationsByRecordZoneID");

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v14, v15);
  objc_msgSend_encodeBool_forKey_(v4, v17, AssetContents, @"shouldFetchAssetContents");
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v18, v19);
  objc_msgSend_encodeBool_forKey_(v4, v21, AllChanges, @"fetchAllChanges");
  v24 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v22, v23);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, @"assetTransferOptionsByKeyByRecordType");
}

- (CKDFetchBatchedRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKDFetchBatchedRecordsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v36 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"recordZoneIDs");
    recordZoneIDs = v5->_recordZoneIDs;
    v5->_recordZoneIDs = (NSArray *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v15, v19, v16, v17, v18, 0);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"configurationsByRecordZoneID");
    configurationsByRecordZoneID = v5->_configurationsByRecordZoneID;
    v5->_configurationsByRecordZoneID = (NSDictionary *)v22;

    v5->_shouldFetchuint64_t AssetContents = objc_msgSend_decodeBoolForKey_(v4, v24, @"shouldFetchAssetContents");
    v5->_fetchuint64_t AllChanges = objc_msgSend_decodeBoolForKey_(v4, v25, @"fetchAllChanges");
    objc_super v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v31 = objc_msgSend_setWithObjects_(v26, v30, v27, v28, v29, 0);
    uint64_t v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, @"assetTransferOptionsByKeyByRecordType");
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v33;
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

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContents = a3;
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

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
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

- (void)setForcePCSDecryptionAttempt:(BOOL)a3
{
  self->_forcePCSDecryptionAttempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end