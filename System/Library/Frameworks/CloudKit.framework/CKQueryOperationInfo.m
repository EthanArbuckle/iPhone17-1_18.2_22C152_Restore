@interface CKQueryOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchAllResults;
- (BOOL)shouldFetchAssetContent;
- (CKQuery)query;
- (CKQueryCursor)cursor;
- (CKQueryOperationInfo)init;
- (CKQueryOperationInfo)initWithCoder:(id)a3;
- (CKRecordZoneID)zoneID;
- (NSArray)desiredKeys;
- (NSDictionary)assetTransferOptionsByKey;
- (unint64_t)resultsLimit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKQueryOperationInfo

- (CKQueryOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKQueryOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result) {
    result->_shouldFetchAssetContent = 1;
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
  v46.receiver = self;
  v46.super_class = (Class)CKQueryOperationInfo;
  [(CKDatabaseOperationInfo *)&v46 encodeWithCoder:v4];
  v9 = objc_msgSend_query(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"query");

  v14 = objc_msgSend_zoneID(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"zoneID");

  v19 = objc_msgSend_cursor(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"cursor");

  uint64_t v24 = objc_msgSend_resultsLimit(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, @"limit");
  v29 = objc_msgSend_desiredKeys(self, v26, v27, v28);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, @"desiredKeys");

  v34 = objc_msgSend_assetTransferOptionsByKey(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, @"assetTransferOptionsByKey");

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, AssetContent, @"fetchAssetContent");
  uint64_t AllResults = objc_msgSend_fetchAllResults(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(v4, v45, AllResults, @"fetchAllResults");
}

- (CKQueryOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKQueryOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v45 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"query");
    query = v5->_query;
    v5->_query = (CKQuery *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"zoneID");
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"cursor");
    cursor = v5->_cursor;
    v5->_cursor = (CKQueryCursor *)v17;

    v5->_resultsLimit = objc_msgSend_decodeInt64ForKey_(v4, v19, @"limit", v20);
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v26 = objc_msgSend_setWithObjects_(v21, v24, v22, v25, v23, 0);
    uint64_t v28 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, @"desiredKeys");
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v36 = objc_msgSend_setWithObjects_(v30, v34, v31, v35, v32, v33, 0);
    uint64_t v38 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, @"assetTransferOptionsByKey");
    assetTransferOptionsByKey = v5->_assetTransferOptionsByKey;
    v5->_assetTransferOptionsByKey = (NSDictionary *)v38;

    v5->_shouldFetchuint64_t AssetContent = objc_msgSend_decodeBoolForKey_(v4, v40, @"fetchAssetContent", v41);
    v5->_fetchuint64_t AllResults = objc_msgSend_decodeBoolForKey_(v4, v42, @"fetchAllResults", v43);
  }

  return v5;
}

- (CKQuery)query
{
  return self->_query;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end