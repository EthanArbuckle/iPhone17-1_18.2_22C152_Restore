@interface CKFetchArchivedRecordsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchAllChanges;
- (BOOL)shouldFetchAssetContents;
- (CKFetchArchivedRecordsOperationInfo)init;
- (CKFetchArchivedRecordsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
@end

@implementation CKFetchArchivedRecordsOperationInfo

- (CKFetchArchivedRecordsOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_fetchAllChanges = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v31.receiver = self;
  v31.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  [(CKDatabaseOperationInfo *)&v31 encodeWithCoder:v4];
  v9 = objc_msgSend_recordZoneIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordZoneIDs");

  v14 = objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"configurationsByRecordZoneID");

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContents, @"shouldFetchAssetContents");
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v4, v25, AllChanges, @"fetchAllChanges");
  v29 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v26, v27, v28);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, @"assetTransferOptionsByRecordTypeAndKey");
}

- (CKFetchArchivedRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKFetchArchivedRecordsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v41 initWithCoder:v4];
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

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_setWithObjects_(v16, v20, v17, v21, v18, v19, 0);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"configurationsByRecordZoneID");
    configurationsByRecordZoneID = v5->_configurationsByRecordZoneID;
    v5->_configurationsByRecordZoneID = (NSDictionary *)v24;

    v5->_shouldFetchuint64_t AssetContents = objc_msgSend_decodeBoolForKey_(v4, v26, @"shouldFetchAssetContents", v27);
    v5->_fetchuint64_t AllChanges = objc_msgSend_decodeBoolForKey_(v4, v28, @"fetchAllChanges", v29);
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v36 = objc_msgSend_setWithObjects_(v30, v34, v31, v35, v32, v33, 0);
    uint64_t v38 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, @"assetTransferOptionsByRecordTypeAndKey");
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v38;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);

  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end