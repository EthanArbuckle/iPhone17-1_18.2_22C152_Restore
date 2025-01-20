@interface CKFetchRecordsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)dropInMemoryAssetContentASAP;
- (BOOL)fetchingAssetsForRereference;
- (BOOL)isFetchCurrentUserOperation;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldFetchAssetContent;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldFetchMergeableValues;
- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier;
- (CKFetchRecordsOperationInfo)init;
- (CKFetchRecordsOperationInfo)initWithCoder:(id)a3;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)desiredPackageFileIndices;
- (NSDictionary)recordIDsToETags;
- (NSDictionary)recordIDsToVersionETags;
- (NSDictionary)webSharingIdentityDataByRecordID;
- (NSSet)assetFieldNamesToPublishURLs;
- (id)cloneContextReturnBlock;
- (unint64_t)URLOptions;
- (unint64_t)requestedTTL;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetFieldNamesToPublishURLs:(id)a3;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setCloneContextReturnBlock:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setDesiredPackageFileIndices:(id)a3;
- (void)setDropInMemoryAssetContentASAP:(BOOL)a3;
- (void)setFetchingAssetsForRereference:(BOOL)a3;
- (void)setIsFetchCurrentUserOperation:(BOOL)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRecordIDsToETags:(id)a3;
- (void)setRecordIDsToVersionETags:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
- (void)setShouldFetchMergeableValues:(BOOL)a3;
- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3;
- (void)setURLOptions:(unint64_t)a3;
- (void)setWebSharingIdentityDataByRecordID:(id)a3;
@end

@implementation CKFetchRecordsOperationInfo

- (CKFetchRecordsOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordsOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result)
  {
    result->_shouldFetchAssetContent = 1;
    result->_shouldFetchMergeableValues = 1;
    result->_shouldRequestEncryptedAssetOwnerIdentifier = 0;
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
  v71.receiver = self;
  v71.super_class = (Class)CKFetchRecordsOperationInfo;
  [(CKDatabaseOperationInfo *)&v71 encodeWithCoder:v4];
  v9 = objc_msgSend_recordIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordIDs");

  uint64_t CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, CurrentUserOperation, @"isFetchCurrentUser");
  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContent, @"shouldFetchAssetContent");
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v4, v25, AssetContentInMemory, @"shouldFetchAssetContentInMemory");
  uint64_t v29 = objc_msgSend_dropInMemoryAssetContentASAP(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, @"dropInMemoryAssetContentASAP");
  v34 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, @"assetTransferOptionsByRecordTypeAndKey");

  uint64_t MergeableValues = objc_msgSend_shouldFetchMergeableValues(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, MergeableValues, @"shouldFetchMergeableValues");
  v44 = objc_msgSend_desiredKeys(self, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"desiredKeys");

  v49 = objc_msgSend_recordIDsToETags(self, v46, v47, v48);
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, @"ETag");

  v54 = objc_msgSend_recordIDsToVersionETags(self, v51, v52, v53);
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v54, @"VersionETag");

  v59 = objc_msgSend_desiredPackageFileIndices(self, v56, v57, v58);
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, @"DesiredPackageFileIndices");

  v64 = objc_msgSend_webSharingIdentityDataByRecordID(self, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"WebSharingIdentities");

  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(v4, v70, shouldCloneFileInAssetCache, @"ShouldCloneFileInAssetCache");
}

- (CKFetchRecordsOperationInfo)initWithCoder:(id)a3
{
  v89[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)CKFetchRecordsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v88 initWithCoder:v4];
  if (v5)
  {
    context = (void *)MEMORY[0x18C12ADA0]();
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v8, 0);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"recordIDs");
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v13;

    v5->_isFetchuint64_t CurrentUserOperation = objc_msgSend_decodeBoolForKey_(v4, v15, @"isFetchCurrentUser", v16);
    v5->_shouldFetchuint64_t AssetContent = objc_msgSend_decodeBoolForKey_(v4, v17, @"shouldFetchAssetContent", v18);
    v5->_shouldFetchuint64_t AssetContentInMemory = objc_msgSend_decodeBoolForKey_(v4, v19, @"shouldFetchAssetContentInMemory", v20);
    v5->_dropInMemoryAssetContentASAP = objc_msgSend_decodeBoolForKey_(v4, v21, @"dropInMemoryAssetContentASAP", v22);
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v29 = objc_msgSend_setWithObjects_(v23, v27, v24, v28, v25, v26, 0);
    uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, @"assetTransferOptionsByRecordTypeAndKey");
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v31;

    v5->_shouldFetchuint64_t MergeableValues = objc_msgSend_decodeBoolForKey_(v4, v33, @"shouldFetchMergeableValues", v34);
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v40 = objc_msgSend_setWithObjects_(v35, v38, v36, v39, v37, 0);
    uint64_t v42 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v40, @"desiredKeys");
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v42;

    v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    v50 = objc_msgSend_setWithObjects_(v44, v48, v45, v49, v46, v47, 0);
    uint64_t v52 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v50, @"ETag");
    recordIDsToETags = v5->_recordIDsToETags;
    v5->_recordIDsToETags = (NSDictionary *)v52;

    v54 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    v60 = objc_msgSend_setWithObjects_(v54, v58, v55, v59, v56, v57, 0);
    uint64_t v62 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v61, (uint64_t)v60, @"VersionETag");
    recordIDsToVersionETags = v5->_recordIDsToVersionETags;
    v5->_recordIDsToVersionETags = (NSDictionary *)v62;

    v64 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    uint64_t v68 = objc_opt_class();
    objc_super v71 = objc_msgSend_setWithObjects_(v64, v69, v65, v70, v66, v67, v68, 0);
    uint64_t v73 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v72, (uint64_t)v71, @"DesiredPackageFileIndices");
    desiredPackageFileIndices = v5->_desiredPackageFileIndices;
    v5->_desiredPackageFileIndices = (NSDictionary *)v73;

    v75 = (void *)MEMORY[0x1E4F1CAD0];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    v89[2] = objc_opt_class();
    v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v76, (uint64_t)v89, 3);
    v80 = objc_msgSend_setWithArray_(v75, v78, (uint64_t)v77, v79);
    uint64_t v82 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v81, (uint64_t)v80, @"WebSharingIdentities");
    webSharingIdentityDataByRecordID = v5->_webSharingIdentityDataByRecordID;
    v5->_webSharingIdentityDataByRecordID = (NSDictionary *)v82;

    v5->_uint64_t shouldCloneFileInAssetCache = objc_msgSend_decodeBoolForKey_(v4, v84, @"ShouldCloneFileInAssetCache", v85);
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

- (BOOL)isFetchCurrentUserOperation
{
  return self->_isFetchCurrentUserOperation;
}

- (void)setIsFetchCurrentUserOperation:(BOOL)a3
{
  self->_isFetchuint64_t CurrentUserOperation = a3;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
}

- (NSDictionary)desiredPackageFileIndices
{
  return self->_desiredPackageFileIndices;
}

- (void)setDesiredPackageFileIndices:(id)a3
{
}

- (BOOL)fetchingAssetsForRereference
{
  return self->_fetchingAssetsForRereference;
}

- (void)setFetchingAssetsForRereference:(BOOL)a3
{
  self->_fetchingAssetsForRereference = a3;
}

- (id)cloneContextReturnBlock
{
  return self->_cloneContextReturnBlock;
}

- (void)setCloneContextReturnBlock:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContent = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContentInMemory = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldFetchMergeableValues
{
  return self->_shouldFetchMergeableValues;
}

- (void)setShouldFetchMergeableValues:(BOOL)a3
{
  self->_shouldFetchuint64_t MergeableValues = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (NSSet)assetFieldNamesToPublishURLs
{
  return self->_assetFieldNamesToPublishURLs;
}

- (void)setAssetFieldNamesToPublishURLs:(id)a3
{
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong(&self->_cloneContextReturnBlock, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);

  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end