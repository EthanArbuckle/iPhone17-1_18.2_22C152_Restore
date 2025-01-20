@interface CKDFetchRecordsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)fetchingAssetsForRereference;
- (BOOL)forcePCSDecrypt;
- (BOOL)makeStateTransition;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldFetchAssetContent;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldFetchMergeableValues;
- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier;
- (BOOL)shouldRollSharePCSOnFetch;
- (BOOL)shouldUpdateTimestampsForFetchedMergeableValues;
- (BOOL)skipDecryption;
- (BOOL)supportsClearAssetEncryption;
- (BOOL)useCachedEtags;
- (BOOL)useRecordCache;
- (CKDDecryptRecordsOperation)recordDecryptOperation;
- (CKDFetchRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)fullRecordsToFetch;
- (NSArray)recordIDsToFetch;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)desiredPackageFileIndices;
- (NSDictionary)recordIDsToETags;
- (NSDictionary)recordIDsToVersionETags;
- (NSDictionary)webSharingIdentityDataByRecordID;
- (NSMapTable)downloadTasksByRecordID;
- (NSMutableArray)recordIDsToRefetch;
- (NSMutableDictionary)cachedRecords;
- (NSMutableDictionary)errorsByRecordID;
- (NSMutableDictionary)keyOrErrorForHostname;
- (NSMutableDictionary)mergeableValueDownloadTasks;
- (NSMutableDictionary)shareRecordsToUpdateByRecordID;
- (NSSet)assetFieldNamesToPublishURLs;
- (NSSet)desiredKeySet;
- (OS_dispatch_group)fetchRecordsGroup;
- (id)activityCreate;
- (id)desiredIndexedListKeys;
- (id)errorForRecordID:(id)a3;
- (id)recordFetchCommandBlock;
- (id)recordFetchCompletionBlock;
- (id)recordFetchProgressBlock;
- (id)relevantZoneIDs;
- (int)_prepareAsset:(id)a3 record:(id)a4 recordKey:(id)a5 assetTransferOptions:(id)a6;
- (int)operationType;
- (unint64_t)URLOptions;
- (unint64_t)requestedTTL;
- (void)_addAssetDownloadTaskForRecord:(id)a3 completionBlock:(id)a4;
- (void)_addDownloadTasksForRecord:(id)a3 completionBlock:(id)a4;
- (void)_addMergeableValueDownloadTasksForRecord:(id)a3 completionBlock:(id)a4;
- (void)_continueHandleFetchedRecord:(id)a3 recordID:(id)a4;
- (void)_decryptPropertiesIfNeededForRecord:(id)a3 record:(id)a4;
- (void)_decryptPropertiesOnRecord:(id)a3 recordID:(id)a4;
- (void)_didDownloadAssetsWithError:(id)a3;
- (void)_downloadAssets;
- (void)_downloadMergeableValues;
- (void)_fetchCloudCerts;
- (void)_fetchContainerScopedUserID;
- (void)_fetchPCSForMergeableValueDeltaRecord:(id)a3 recordID:(id)a4;
- (void)_findSpecialParticipantsOnShare:(id)a3 identityDelegate:(id)a4;
- (void)_finishAllDownloadTasksWithError:(id)a3;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordFetch:(id)a3 recordID:(id)a4 etagMatched:(BOOL)a5 responseCode:(id)a6;
- (void)_handleSharePCSPrepForShare:(id)a3 recordID:(id)a4;
- (void)_reallyDecryptPropertiesOnRecord:(id)a3 recordID:(id)a4;
- (void)_saveUpdatedShareRecords;
- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4;
- (void)finishDecryption;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)setAssetFieldNamesToPublishURLs:(id)a3;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setCachedRecords:(id)a3;
- (void)setDesiredKeySet:(id)a3;
- (void)setDesiredPackageFileIndices:(id)a3;
- (void)setDownloadTasksByRecordID:(id)a3;
- (void)setError:(id)a3 forRecordID:(id)a4;
- (void)setErrorsByRecordID:(id)a3;
- (void)setFetchRecordsGroup:(id)a3;
- (void)setForcePCSDecrypt:(BOOL)a3;
- (void)setFullRecordsToFetch:(id)a3;
- (void)setKeyOrErrorForHostname:(id)a3;
- (void)setMergeableValueDownloadTasks:(id)a3;
- (void)setRecordFetchCommandBlock:(id)a3;
- (void)setRecordFetchCompletionBlock:(id)a3;
- (void)setRecordFetchProgressBlock:(id)a3;
- (void)setRecordIDsToETags:(id)a3;
- (void)setRecordIDsToFetch:(id)a3;
- (void)setRecordIDsToRefetch:(id)a3;
- (void)setRecordIDsToVersionETags:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setShareRecordsToUpdateByRecordID:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
- (void)setShouldFetchMergeableValues:(BOOL)a3;
- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3;
- (void)setShouldRollSharePCSOnFetch:(BOOL)a3;
- (void)setShouldUpdateTimestampsForFetchedMergeableValues:(BOOL)a3;
- (void)setSkipDecryption:(BOOL)a3;
- (void)setURLOptions:(unint64_t)a3;
- (void)setUseCachedEtags:(BOOL)a3;
- (void)setUseRecordCache:(BOOL)a3;
- (void)setWebSharingIdentityDataByRecordID:(id)a3;
@end

@implementation CKDFetchRecordsOperation

- (CKDFetchRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v83.receiver = self;
  v83.super_class = (Class)CKDFetchRecordsOperation;
  v9 = [(CKDDatabaseOperation *)&v83 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordIDs(v6, v7, v8);
    recordIDsToFetch = v9->_recordIDsToFetch;
    v9->_recordIDsToFetch = (NSArray *)v10;

    uint64_t v12 = objc_opt_new();
    cachedRecords = v9->_cachedRecords;
    v9->_cachedRecords = (NSMutableDictionary *)v12;

    v16 = objc_msgSend_desiredKeys(v6, v14, v15);

    if (v16)
    {
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      v20 = objc_msgSend_desiredKeys(v6, v17, v18);
      uint64_t v22 = objc_msgSend_setWithArray_(v19, v21, (uint64_t)v20);
      desiredKeySet = v9->_desiredKeySet;
      v9->_desiredKeySet = (NSSet *)v22;
    }
    uint64_t v24 = objc_msgSend_recordIDsToETags(v6, v17, v18);
    recordIDsToETags = v9->_recordIDsToETags;
    v9->_recordIDsToETags = (NSDictionary *)v24;

    uint64_t v28 = objc_msgSend_recordIDsToVersionETags(v6, v26, v27);
    recordIDsToVersionETags = v9->_recordIDsToVersionETags;
    v9->_recordIDsToVersionETags = (NSDictionary *)v28;

    uint64_t v32 = objc_msgSend_desiredPackageFileIndices(v6, v30, v31);
    desiredPackageFileIndices = v9->_desiredPackageFileIndices;
    v9->_desiredPackageFileIndices = (NSDictionary *)v32;

    dispatch_group_t v34 = dispatch_group_create();
    fetchRecordsGroup = v9->_fetchRecordsGroup;
    v9->_fetchRecordsGroup = (OS_dispatch_group *)v34;

    uint64_t v38 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v36, v37);
    downloadTasksByRecordID = v9->_downloadTasksByRecordID;
    v9->_downloadTasksByRecordID = (NSMapTable *)v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errorsByRecordID = v9->_errorsByRecordID;
    v9->_errorsByRecordID = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    shareRecordsToUpdateByRecordID = v9->_shareRecordsToUpdateByRecordID;
    v9->_shareRecordsToUpdateByRecordID = v42;

    uint64_t v46 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v44, v45);
    assetTransferOptionsByRecordTypeAndKey = v9->_assetTransferOptionsByRecordTypeAndKey;
    v9->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v46;

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v48, v49);
    v9->_shouldFetchAssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v6, v50, v51);
    v9->_shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v6, v52, v53);
    v9->_shouldFetchMergeableValues = objc_msgSend_shouldFetchMergeableValues(v6, v54, v55);
    v9->_shouldUpdateTimestampsForFetchedMergeableValues = 1;
    v9->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v56, v57);
    v60 = objc_msgSend_assetFieldNamesToPublishURLs(v6, v58, v59);

    if (v60)
    {
      uint64_t v63 = objc_msgSend_assetFieldNamesToPublishURLs(v6, v61, v62);
      assetFieldNamesToPublishURLs = v9->_assetFieldNamesToPublishURLs;
      v9->_assetFieldNamesToPublishURLs = (NSSet *)v63;

      v9->_requestedTTL = objc_msgSend_requestedTTL(v6, v65, v66);
      v9->_URLOptions = objc_msgSend_URLOptions(v6, v67, v68);
    }
    v9->_useCachedEtags = 1;
    v9->_useRecordCache = 1;
    v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordIDsToRefetch = v9->_recordIDsToRefetch;
    v9->_recordIDsToRefetch = v69;

    uint64_t v71 = objc_opt_new();
    keyOrErrorForHostname = v9->_keyOrErrorForHostname;
    v9->_keyOrErrorForHostname = (NSMutableDictionary *)v71;

    uint64_t v75 = objc_msgSend_webSharingIdentityDataByRecordID(v6, v73, v74);
    webSharingIdentityDataByRecordID = v9->_webSharingIdentityDataByRecordID;
    v9->_webSharingIdentityDataByRecordID = (NSDictionary *)v75;

    if (*MEMORY[0x1E4F1A4E0])
    {
      v79 = objc_msgSend_unitTestOverrides(v9, v77, v78);
      v81 = objc_msgSend_objectForKeyedSubscript_(v79, v80, @"ShouldRollSharePCSOnFetch");
      v9->_shouldRollSharePCSOnFetch = v81 != 0;
    }
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__fetchContainerScopedUserID(self, v6, v7);
      return 1;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_hash(self, v8, v9);
      kdebug_trace();
      uint64_t v12 = objc_msgSend_recordIDsToFetch(self, v10, v11);
      uint64_t v15 = objc_msgSend_fullRecordsToFetch(self, v13, v14);
      objc_msgSend_fetchRecordsWithIDs_andFullRecords_(self, v16, (uint64_t)v12, v15);

      goto LABEL_11;
    case 3:
      v17 = objc_msgSend_recordIDsToRefetch(self, v4, v5);
      uint64_t v20 = objc_msgSend_count(v17, v18, v19);

      if (!v20) {
        goto LABEL_6;
      }
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_setUseCachedEtags_(self, v21, 0);
      uint64_t v12 = objc_msgSend_recordIDsToRefetch(self, v22, v23);
      objc_msgSend_fetchRecordsWithIDs_andFullRecords_(self, v24, (uint64_t)v12, 0);
      goto LABEL_11;
    case 4:
LABEL_6:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_hash(self, v25, v26);
      kdebug_trace();
      objc_msgSend_hash(self, v27, v28);
      kdebug_trace();
      objc_msgSend__fetchCloudCerts(self, v29, v30);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__saveUpdatedShareRecords(self, v31, v32);
      return 1;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      objc_msgSend__downloadMergeableValues(self, v33, v34);
      return 1;
    case 7:
      objc_msgSend_setState_(self, v4, 8);
      objc_msgSend_hash(self, v35, v36);
      kdebug_trace();
      objc_msgSend_hash(self, v37, v38);
      kdebug_trace();
      objc_msgSend__downloadAssets(self, v39, v40);
      return 1;
    case 8:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_hash(self, v41, v42);
      kdebug_trace();
      uint64_t v12 = objc_msgSend_error(self, v43, v44);
      objc_msgSend_finishWithError_(self, v45, (uint64_t)v12);
LABEL_11:

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 7)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F7898[a3 - 2];
  }
  return v3;
}

- (id)desiredIndexedListKeys
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_msgSend_desiredKeySet(self, v6, v7);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v37, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
        uint64_t v14 = CKProcessIndexedArrayKey();
        id v15 = 0;
        uint64_t v18 = v15;
        if (v14)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v19 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v36 = v13;
            _os_log_error_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CKDFetchRecordsOperation.m", 371, @"Invalid desired key %@, which should have been caught earlier", v13);
        }
        else if (v15)
        {
          uint64_t v24 = objc_msgSend_count(v5, v16, v17);
          uint64_t v26 = objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(v5, v25, v13, 0, v24, 1024, &unk_1F2044570);
          objc_msgSend_insertObject_atIndex_(v5, v27, v13, v26);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v31, v37, 16);
    }
    while (v10);
  }

  return v5;
}

- (void)_fetchContainerScopedUserID
{
  objc_initWeak(&location, self);
  objc_super v5 = objc_msgSend_stateTransitionGroup(self, v3, v4);
  dispatch_group_enter(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4F8BB88;
  v7[3] = &unk_1E64F22C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend_fetchContainerScopedUserID_(self, v6, (uint64_t)v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_saveUpdatedShareRecords
{
  uint64_t v4 = objc_msgSend_shareRecordsToUpdateByRecordID(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    id v8 = objc_opt_new();
    uint64_t v11 = objc_msgSend_shareRecordsToUpdateByRecordID(self, v9, v10);
    uint64_t v14 = objc_msgSend_allValues(v11, v12, v13);
    objc_msgSend_setRecordsToSave_(v8, v15, (uint64_t)v14);

    objc_msgSend_setShouldSkipPCSRetryBehavior_(v8, v16, 1);
    uint64_t v19 = objc_msgSend_stateTransitionGroup(self, v17, v18);
    dispatch_group_enter(v19);

    objc_initWeak(&location, self);
    uint64_t v20 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4F8BD68;
    v22[3] = &unk_1E64F66E8;
    objc_copyWeak(&v23, &location);
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v21, v20, v8, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)_findSpecialParticipantsOnShare:(id)a3 identityDelegate:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v54 = a4;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  objc_msgSend_allParticipants(a3, v6, v7);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v58, v62, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v57 = *(void *)v59;
    uint64_t v55 = (void *)*MEMORY[0x1E4F19DB0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v59 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v15 = objc_msgSend_userIdentity(v14, v10, v11);
        uint64_t v18 = objc_msgSend_userRecordID(v15, v16, v17);
        uint64_t v21 = objc_msgSend_recordName(v18, v19, v20);

        uint64_t v24 = objc_msgSend_container(self, v22, v23);
        uint64_t v27 = objc_msgSend_containerScopedUserID(v24, v25, v26);
        if (objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v21))
        {

LABEL_10:
          objc_msgSend_setIsCurrentUser_(v14, v30, 1);
          goto LABEL_11;
        }
        char isEqualToString = objc_msgSend_isEqualToString_(v55, v29, (uint64_t)v21);

        if (isEqualToString) {
          goto LABEL_10;
        }
        long long v33 = objc_msgSend_userIdentity(v14, v30, v32);
        uint64_t v36 = objc_msgSend_publicSharingKey(v33, v34, v35);
        int v38 = objc_msgSend_sharingFingerprintsContainPublicKeyWithData_error_(v54, v37, (uint64_t)v36, 0);

        if (v38) {
          goto LABEL_10;
        }
LABEL_11:
        uint64_t v40 = objc_msgSend_container(self, v30, v39);
        uint64_t v43 = objc_msgSend_orgAdminUserID(v40, v41, v42);
        if (v43)
        {
          uint64_t v46 = (void *)v43;
          v47 = objc_msgSend_container(self, v44, v45);
          v50 = objc_msgSend_orgAdminUserID(v47, v48, v49);
          int v52 = objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v21);

          if (v52) {
            objc_msgSend_setIsOrgAdminUser_(v14, v53, 1);
          }
        }
        else
        {
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v58, v62, 16);
    }
    while (v12);
  }
}

- (int)operationType
{
  return 211;
}

- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v155 = a3;
  id v156 = a4;
  if (objc_msgSend_count(v155, v7, v8))
  {
    SEL v154 = a2;
    v157 = objc_opt_new();
    if (objc_msgSend_useRecordCache(self, v11, v12)
      && objc_msgSend_useCachedEtags(self, v13, v14))
    {
      v153 = objc_msgSend_container(self, v13, v14);
      uint64_t v17 = objc_msgSend_recordCache(v153, v15, v16);
      uint64_t v20 = objc_msgSend_desiredKeySet(self, v18, v19);
      uint64_t v23 = objc_msgSend_databaseScope(self, v21, v22);
      v25 = objc_msgSend_recordsWithIDs_container_requiredKeys_scope_(v17, v24, (uint64_t)v155, v153, v20, v23);

      long long v178 = 0u;
      long long v179 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      id v26 = v25;
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v176, v181, 16);
      if (v30)
      {
        uint64_t v31 = *(void *)v177;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v177 != v31) {
              objc_enumerationMutation(v26);
            }
            long long v33 = *(void **)(*((void *)&v176 + 1) + 8 * i);
            long long v34 = objc_msgSend_etag(v33, v28, v29);
            uint64_t v37 = objc_msgSend_length(v34, v35, v36);

            if (v37)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v40 = objc_msgSend_container(self, v38, v39);
                uint64_t v43 = objc_msgSend_pcsManager(v40, v41, v42);
                objc_msgSend__findSpecialParticipantsOnShare_identityDelegate_(self, v44, (uint64_t)v33, v43);
              }
              uint64_t v45 = objc_msgSend_cachedRecords(self, v38, v39);
              v48 = objc_msgSend_recordID(v33, v46, v47);
              objc_msgSend_setObject_forKeyedSubscript_(v45, v49, (uint64_t)v33, v48);

              int v52 = objc_msgSend_etag(v33, v50, v51);
              uint64_t v55 = objc_msgSend_recordID(v33, v53, v54);
              objc_msgSend_setObject_forKeyedSubscript_(v157, v56, (uint64_t)v52, v55);
            }
          }
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v176, v181, 16);
        }
        while (v30);
      }
    }
    uint64_t v57 = objc_msgSend_recordIDsToETags(self, v13, v14);

    if (v57)
    {
      long long v60 = objc_msgSend_recordIDsToETags(self, v58, v59);
      objc_msgSend_addEntriesFromDictionary_(v157, v61, (uint64_t)v60);
    }
    uint64_t v62 = objc_msgSend_desiredIndexedListKeys(self, v58, v59);
    uint64_t v65 = objc_msgSend_desiredKeySet(self, v63, v64);
    uint64_t v68 = (void *)v65;
    if (v62)
    {
      v69 = objc_msgSend_desiredKeySet(self, v66, v67);
      v72 = objc_msgSend_mutableCopy(v69, v70, v71);

      uint64_t v74 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v73, (uint64_t)v62);
      objc_msgSend_minusSet_(v72, v75, (uint64_t)v74);
    }
    else
    {
      v72 = (void *)v65;
    }
    v174[0] = 0;
    v174[1] = v174;
    v174[2] = 0x2020000000;
    char v175 = 0;
    v76 = [CKDFetchRecordsURLRequest alloc];
    v79 = objc_msgSend_recordIDsToVersionETags(self, v77, v78);
    v81 = objc_msgSend_initWithOperation_recordIDs_recordIDsToEtags_recordIDsToVersionETags_desiredKeys_(v76, v80, (uint64_t)self, v155, v157, v79, v72);

    objc_msgSend_setDesiredIndexedListKeys_(v81, v82, (uint64_t)v62);
    v85 = objc_msgSend_assetFieldNamesToPublishURLs(self, v83, v84);

    if (v85)
    {
      v88 = objc_msgSend_assetFieldNamesToPublishURLs(self, v86, v87);
      objc_msgSend_setAssetFieldNamesToPublishURLs_(v81, v89, (uint64_t)v88);

      uint64_t v92 = objc_msgSend_requestedTTL(self, v90, v91);
      objc_msgSend_setRequestedTTL_(v81, v93, v92);
      uint64_t v96 = objc_msgSend_URLOptions(self, v94, v95);
      objc_msgSend_setURLOptions_(v81, v97, v96);
    }
    if (objc_msgSend_fetchingAssetsForRereference(self, v86, v87))
    {
      objc_msgSend_setShouldFetchAssetContent_(v81, v98, 0);
    }
    else
    {
      v101 = objc_opt_new();
      if ((objc_msgSend_shouldFetchAssetContent(self, v102, v103) & 1) == 0)
      {
        v106 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v104, v105);
        v109 = objc_msgSend_allValues(v106, v107, v108);
        v172[0] = MEMORY[0x1E4F143A8];
        v172[1] = 3221225472;
        v172[2] = sub_1C4F8CBC8;
        v172[3] = &unk_1E64F74C0;
        id v173 = v101;
        objc_msgSend_enumerateObjectsUsingBlock_(v109, v110, (uint64_t)v172);
      }
      if (objc_msgSend_count(v101, v104, v105))
      {
        objc_msgSend_setDesiredAssetKeys_(v81, v111, (uint64_t)v101);
      }
      else
      {
        uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v111, v112);
        objc_msgSend_setShouldFetchAssetContent_(v81, v114, AssetContent);
      }
    }
    v115 = objc_msgSend_fetchRecordsGroup(self, v99, v100);
    dispatch_group_enter(v115);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v81);
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = sub_1C4F8CCF8;
    v167[3] = &unk_1E64F7650;
    objc_copyWeak(&v168, &location);
    objc_copyWeak(v169, &from);
    v167[4] = v174;
    v169[1] = (id)v154;
    objc_msgSend_setRecordFetchedBlock_(v81, v116, (uint64_t)v167);
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = sub_1C4F8CE3C;
    v164[3] = &unk_1E64F36F8;
    objc_copyWeak(&v165, &location);
    objc_copyWeak(&v166, &from);
    v164[4] = v174;
    objc_msgSend_setCompletionBlock_(v81, v117, (uint64_t)v164);
    v120 = objc_msgSend_stateTransitionGroup(self, v118, v119);
    dispatch_group_enter(v120);

    objc_msgSend_setRequest_(self, v121, (uint64_t)v81);
    v124 = objc_msgSend_container(self, v122, v123);
    objc_msgSend_performRequest_(v124, v125, (uint64_t)v81);

    objc_destroyWeak(&v166);
    objc_destroyWeak(&v165);
    objc_destroyWeak(v169);
    objc_destroyWeak(&v168);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    _Block_object_dispose(v174, 8);
  }
  if (objc_msgSend_count(v156, v9, v10))
  {
    v128 = objc_opt_new();
    objc_msgSend_setCode_(v128, v129, 1);
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v130 = v156;
    uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v160, v180, 16);
    if (v134)
    {
      uint64_t v135 = *(void *)v161;
      do
      {
        for (uint64_t j = 0; j != v134; ++j)
        {
          if (*(void *)v161 != v135) {
            objc_enumerationMutation(v130);
          }
          v137 = *(void **)(*((void *)&v160 + 1) + 8 * j);
          v138 = objc_msgSend_recordID(v137, v132, v133);
          objc_msgSend__handleRecordFetch_recordID_etagMatched_responseCode_(self, v139, (uint64_t)v137, v138, 0, v128);
        }
        uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v132, (uint64_t)&v160, v180, 16);
      }
      while (v134);
    }

    v142 = objc_msgSend_stateTransitionGroup(self, v140, v141);
    dispatch_group_enter(v142);

    v145 = objc_msgSend_fetchRecordsGroup(self, v143, v144);
    v148 = objc_msgSend_callbackQueue(self, v146, v147);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F8D340;
    block[3] = &unk_1E64F05C8;
    block[4] = self;
    dispatch_group_notify(v145, v148, block);
  }
  v149 = objc_msgSend_fetchRecordsGroup(self, v126, v127);
  v152 = objc_msgSend_callbackQueue(self, v150, v151);
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = sub_1C4F8D3F4;
  v158[3] = &unk_1E64F05C8;
  v158[4] = self;
  dispatch_group_notify(v149, v152, v158);
}

- (id)errorForRecordID:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_errorsByRecordID(self, v4, v5);
    objc_sync_enter(v7);
    uint64_t v10 = objc_msgSend_errorsByRecordID(self, v8, v9);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);

    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)setError:(id)a3 forRecordID:(id)a4
{
  id v14 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = objc_msgSend_errorsByRecordID(self, v6, v7);
    objc_sync_enter(v9);
    uint64_t v13 = objc_msgSend_errorsByRecordID(self, v10, v11);
    if (v14) {
      objc_msgSend_setObject_forKeyedSubscript_(v13, v12, (uint64_t)v14, v8);
    }
    else {
      objc_msgSend_removeObjectForKey_(v13, v12, (uint64_t)v8);
    }

    objc_sync_exit(v9);
  }
}

- (void)_continueHandleFetchedRecord:(id)a3 recordID:(id)a4
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v141 = a4;
  val = self;
  uint64_t v9 = objc_msgSend_recordIDsToETags(self, v7, v8);
  uint64_t v12 = objc_msgSend_recordID(v6, v10, v11);
  id v14 = objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)v12);
  uint64_t v17 = objc_msgSend_etag(v6, v15, v16);
  char isEqual = objc_msgSend_isEqual_(v14, v18, (uint64_t)v17);

  if (!v6
    || (objc_msgSend_recordID(v6, v19, v20), (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_errorForRecordID_(val, v19, (uint64_t)v141),
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        v22))
  {
    uint64_t v23 = objc_msgSend_callbackQueue(val, v19, v20);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F8E2AC;
    block[3] = &unk_1E64F2248;
    block[4] = val;
    char v151 = isEqual;
    id v149 = v6;
    id v150 = v141;
    dispatch_async(v23, block);

    goto LABEL_5;
  }
  unsigned int v139 = objc_msgSend_trackChanges(v6, v19, v20);
  objc_msgSend_setTrackChanges_(v6, v27, 0);
  uint64_t v30 = objc_msgSend_desiredIndexedListKeys(val, v28, v29);
  v142 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v31, v32);
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id obj = v30;
  uint64_t v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v164, v175, 16);
  if (v147)
  {
    uint64_t v146 = *(void *)v165;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v165 != v146) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v164 + 1) + 8 * v34);
        uint64_t v162 = 0;
        uint64_t v163 = 0;
        uint64_t v161 = 0;
        uint64_t v36 = CKProcessIndexedArrayKey();
        id v39 = 0;
        if (v36)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v40 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v170 = v35;
            _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          uint64_t v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v41, v42);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, val, @"CKDFetchRecordsOperation.m", 615, @"Invalid desired key %@, which should have been caught earlier", v35);

          goto LABEL_39;
        }
        uint64_t v45 = objc_msgSend_valueStore(v6, v37, v38);
        id v14 = objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)v39);

        if (v14)
        {
          uint64_t v49 = objc_msgSend_valueStore(v6, v47, v48);
        }
        else
        {
          uint64_t v51 = objc_msgSend_encryptedValueStore(v6, v47, v48);
          uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)v39);

          if (!v53) {
            goto LABEL_25;
          }
          uint64_t v49 = objc_msgSend_encryptedValueStore(v6, v54, v55);
        }
        v56 = v49;
        uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)v39);

        if (v57)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v58 = v57;
            long long v61 = objc_msgSend_objectForKeyedSubscript_(v142, v59, (uint64_t)v39);
            if (v61)
            {
              uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v142, v60, (uint64_t)v39);
              uint64_t v65 = objc_msgSend_unsignedIntegerValue(v62, v63, v64);
            }
            else
            {
              uint64_t v65 = 0;
            }
            BOOL v67 = v14 == 0;

            v69 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v68, v162 + v65);
            objc_msgSend_setObject_forKeyedSubscript_(v142, v70, (uint64_t)v69, v39);

            if (v67)
            {
              id v14 = objc_msgSend_encryptedValueStore(v6, v71, v72);
              uint64_t v74 = objc_msgSend_subarrayWithRange_(v58, v76, v65, v162);
              objc_msgSend_setCompatibilityModeObjectNoValidate_forKey_(v14, v77, (uint64_t)v74, v35);
            }
            else
            {
              id v14 = objc_msgSend_valueStore(v6, v71, v72);
              uint64_t v74 = objc_msgSend_subarrayWithRange_(v58, v73, v65, v162);
              objc_msgSend_setObjectNoValidate_forKey_(v14, v75, (uint64_t)v74, v35);
            }
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v14 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              id v14 = v14;
              v79 = (objc_class *)objc_opt_class();
              v80 = NSStringFromClass(v79);
              *(_DWORD *)buf = 138543874;
              id v170 = v39;
              __int16 v171 = 2114;
              v172 = v80;
              __int16 v173 = 2114;
              v174 = v35;
              _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Original list key %{public}@ has incorrect value type %{public}@ for desired indexed list key %{public}@", buf, 0x20u);
            }
          }
          goto LABEL_39;
        }
LABEL_25:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v66 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v170 = v39;
          __int16 v171 = 2114;
          v172 = v35;
          _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "Could not find original list key %{public}@ for desired indexed list key %{public}@", buf, 0x16u);
        }
LABEL_39:

        ++v34;
      }
      while (v147 != v34);
      uint64_t v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v164, v175, 16);
    }
    while (v147);
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  objc_super v83 = objc_msgSend_allKeys(v142, v81, v82);
  uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v157, v168, 16);
  if (!v87) {
    goto LABEL_53;
  }
  uint64_t v88 = *(void *)v158;
  do
  {
    for (uint64_t i = 0; i != v87; ++i)
    {
      if (*(void *)v158 != v88) {
        objc_enumerationMutation(v83);
      }
      id v14 = *(NSObject **)(*((void *)&v157 + 1) + 8 * i);
      v90 = objc_msgSend_valueStore(v6, v85, v86);
      uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(v90, v91, (uint64_t)v14);

      if (v92)
      {
        uint64_t v95 = objc_msgSend_valueStore(v6, v93, v94);
      }
      else
      {
        v97 = objc_msgSend_encryptedValueStore(v6, v93, v94);
        v99 = objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)v14);

        if (!v99) {
          continue;
        }
        uint64_t v95 = objc_msgSend_encryptedValueStore(v6, v85, v86);
      }
      uint64_t v100 = v95;
      objc_msgSend_setObject_forKeyedSubscript_(v95, v96, 0, v14);
    }
    uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v85, (uint64_t)&v157, v168, 16);
  }
  while (v87);
LABEL_53:

  objc_msgSend_setTrackChanges_(v6, v101, v139);
  if (*MEMORY[0x1E4F1A4E0])
  {
    char v104 = objc_msgSend_shouldRollSharePCSOnFetch(val, v102, v103);
    objc_msgSend_setShouldRollSharePCSOnFetch_(val, v105, 0);
  }
  else
  {
    char v104 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_isZoneWideShare(v6, v106, v107)) {
    goto LABEL_68;
  }
  v110 = objc_msgSend_currentUserParticipant(v6, v108, v109);
  if (objc_msgSend_role(v110, v111, v112) != 1) {
    goto LABEL_67;
  }
  if ((v104 & 1) == 0)
  {
    id v14 = objc_msgSend_invitedKeysToRemove(v6, v113, v114);
    if (!objc_msgSend_count(v14, v115, v116)) {
      goto LABEL_66;
    }
  }
  v117 = objc_msgSend_container(val, v113, v114);
  v120 = objc_msgSend_pcsManager(v117, v118, v119);
  if (!objc_msgSend_canRollShareKeys(v120, v121, v122))
  {

    if ((v104 & 1) == 0) {
LABEL_66:
    }

LABEL_67:
    goto LABEL_68;
  }
  v125 = objc_msgSend_shareRecordsToUpdateByRecordID(val, v123, v124);
  v128 = objc_msgSend_recordID(v6, v126, v127);
  id v130 = objc_msgSend_objectForKeyedSubscript_(v125, v129, (uint64_t)v128);

  if (v104)
  {

    if (!v130)
    {
LABEL_70:
      uint64_t v134 = objc_msgSend_shareRecordsToUpdateByRecordID(val, v131, v132);
      v137 = objc_msgSend_recordID(v6, v135, v136);
      objc_msgSend_setObject_forKeyedSubscript_(v134, v138, (uint64_t)v6, v137);

      goto LABEL_5;
    }
  }
  else
  {

    if (!v130) {
      goto LABEL_70;
    }
  }
LABEL_68:
  objc_initWeak((id *)buf, val);
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = sub_1C4F8E090;
  v152[3] = &unk_1E64F7678;
  objc_copyWeak(&v155, (id *)buf);
  id v153 = v6;
  id v154 = v141;
  char v156 = isEqual;
  objc_msgSend__addDownloadTasksForRecord_completionBlock_(val, v133, (uint64_t)v153, v152);

  objc_destroyWeak(&v155);
  objc_destroyWeak((id *)buf);
LABEL_5:
  id v26 = objc_msgSend_fetchRecordsGroup(val, v24, v25);
  dispatch_group_leave(v26);
}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    uint64_t v8 = objc_opt_new();
    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v9 = objc_msgSend_webSharingIdentityDataByRecordID(v2, v6, v7);
      objc_msgSend_setWebSharingIdentityDataByRecordID_(v8, v10, (uint64_t)v9);
    }
    uint64_t v11 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4F8E4AC;
    v15[3] = &unk_1E64F0210;
    v15[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v12, v11, v8, v15);
  }
  objc_sync_exit(v2);

  uint64_t v13 = v2->_decryptOperation;
  return v13;
}

- (void)finishDecryption
{
  id obj = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0) {
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  }
  objc_sync_exit(obj);
}

- (void)_decryptPropertiesOnRecord:(id)a3 recordID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (objc_msgSend_isMergeableValueDeltaRecord(v11, v7, v8)
    && objc_msgSend_useEncryption(self, v9, v10))
  {
    objc_msgSend__fetchPCSForMergeableValueDeltaRecord_recordID_(self, v9, (uint64_t)v11, v6);
  }
  else
  {
    objc_msgSend__reallyDecryptPropertiesOnRecord_recordID_(self, v9, (uint64_t)v11, v6);
  }
}

- (void)_reallyDecryptPropertiesOnRecord:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_recordDecryptOperation(self, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4F8E7F8;
  v14[3] = &unk_1E64F76C0;
  objc_copyWeak(&v17, &location);
  id v11 = v6;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  objc_msgSend_decryptRecord_withCompletion_(v10, v13, (uint64_t)v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_fetchPCSForMergeableValueDeltaRecord:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v13 = objc_msgSend_pcsCache(v10, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F8EC8C;
  v17[3] = &unk_1E64F76E8;
  objc_copyWeak(&v21, &location);
  id v14 = v7;
  id v18 = v14;
  id v15 = v6;
  id v19 = v15;
  uint64_t v20 = self;
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v13, v16, (uint64_t)v14, self, 0, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_handleRecordFetch:(id)a3 recordID:(id)a4 etagMatched:(BOOL)a5 responseCode:(id)a6
{
  BOOL v166 = a5;
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    if (v166) {
      long long v157 = @"true";
    }
    else {
      long long v157 = @"false";
    }
    long long v158 = v12;
    *(_DWORD *)id location = 138543874;
    *(void *)&location[4] = v10;
    __int16 v177 = 2114;
    long long v178 = v157;
    __int16 v179 = 1024;
    int v180 = objc_msgSend_code(v11, v159, v160);
    _os_log_debug_impl(&dword_1C4CFF000, v158, OS_LOG_TYPE_DEBUG, "Fetched record %{public}@, etag-matched:%{public}@, responseCode:%d", location, 0x1Cu);
  }
  long long v167 = objc_msgSend_container(self, v13, v14);
  id v17 = objc_msgSend_fetchRecordsGroup(self, v15, v16);
  dispatch_group_enter(v17);

  int v20 = objc_msgSend_code(v11, v18, v19);
  BOOL v165 = v20 == 1;
  if (v20 != 1)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v24 = sub_1C4E94D98(v11);
    uint64_t v27 = objc_msgSend_request(self, v25, v26);
    uint64_t v28 = sub_1C4E940D0(v27, v11);
    uint64_t v31 = objc_msgSend_error(v11, v29, v30);
    uint64_t v34 = objc_msgSend_errorDescription(v31, v32, v33);
    uint64_t v36 = objc_msgSend_errorWithDomain_code_userInfo_format_(v23, v35, *MEMORY[0x1E4F19DD8], v24, v28, @"Error fetching record %@ from server: %@", v10, v34);

    if (v10) {
      objc_msgSend_setError_forRecordID_(self, v37, (uint64_t)v36, v10);
    }
    if (objc_msgSend_databaseScope(self, v37, v38) != 1 && objc_msgSend_CKIsNotFoundError(v36, v39, v40))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v41 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v10;
        _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Record not found in private DB for recordID %@. Setting PCS data nil on caches", location, 0xCu);
      }
      objc_msgSend_setPCSData_forFetchedRecordID_(self, v42, 0, v10);
      objc_msgSend_setPCSData_forFetchedShareID_(self, v43, 0, v10);
    }
  }
  uint64_t v44 = objc_msgSend_error(v11, v21, v22);
  uint64_t v47 = objc_msgSend_clientError(v44, v45, v46);
  BOOL v50 = objc_msgSend_type(v47, v48, v49) == 48;

  if (v50)
  {
    uint64_t v53 = objc_msgSend_options(v167, v51, v52);
    int v58 = objc_msgSend_useAnonymousToServerShareParticipants(v53, v54, v55) ^ 1;
    if (!v10) {
      LOBYTE(v58) = 1;
    }
    if (v58)
    {
    }
    else
    {
      BOOL v59 = objc_msgSend_databaseScope(self, v56, v57) == 3;

      if (v59)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v62 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v161 = v62;
          long long v164 = objc_msgSend_zoneID(v10, v162, v163);
          *(_DWORD *)id location = 138412290;
          *(void *)&location[4] = v164;
          _os_log_debug_impl(&dword_1C4CFF000, v161, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", location, 0xCu);
        }
        objc_initWeak((id *)location, self);
        uint64_t v65 = objc_msgSend_fetchRecordsGroup(self, v63, v64);
        dispatch_group_enter(v65);

        uint64_t v68 = objc_msgSend_anonymousSharingManager(v167, v66, v67);
        uint64_t v71 = objc_msgSend_zoneID(v10, v69, v70);
        char v175 = v71;
        v73 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)&v175, 1);
        v173[0] = MEMORY[0x1E4F143A8];
        v173[1] = 3221225472;
        v173[2] = sub_1C4F8FB0C;
        v173[3] = &unk_1E64F22C0;
        objc_copyWeak(&v174, (id *)location);
        objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v68, v74, (uint64_t)v73, self, v173);

        objc_destroyWeak(&v174);
        objc_destroyWeak((id *)location);
      }
    }
    uint64_t v75 = objc_msgSend_recordCache(v167, v60, v61);
    uint64_t v78 = objc_msgSend_zoneID(v10, v76, v77);
    objc_msgSend_clearAllRecordsForZoneWithID_(v75, v79, (uint64_t)v78);

    if (objc_msgSend_databaseScope(self, v80, v81) != 1)
    {
      uint64_t v82 = objc_msgSend_zoneID(v10, v51, v52);
      objc_msgSend_setPCSData_forFetchedZoneID_(self, v83, 0, v82);

      uint64_t v86 = objc_msgSend_pcsCache(v167, v84, v85);
      v89 = objc_msgSend_zoneID(v10, v87, v88);
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v86, v90, (uint64_t)v89);
    }
  }
  if (v10 && !v9 && v166)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v91 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_DEBUG, "Remote record matches local record etag. Returning record %{public}@ from cache.", location, 0xCu);
    }
    uint64_t v94 = objc_msgSend_cachedRecords(self, v92, v93);
    objc_msgSend_objectForKeyedSubscript_(v94, v95, (uint64_t)v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v9;
      v98 = objc_msgSend_container(self, v96, v97);
      v101 = objc_msgSend_pcsManager(v98, v99, v100);
      objc_msgSend__findSpecialParticipantsOnShare_identityDelegate_(self, v102, (uint64_t)v9, v101);

      uint64_t v105 = objc_msgSend_cachedRecords(self, v103, v104);
      objc_msgSend_setObject_forKeyedSubscript_(v105, v106, (uint64_t)v9, v10);
    }
    BOOL v165 = 0;
  }
  if (v9)
  {
    uint64_t v107 = objc_msgSend_etag(v9, v51, v52);
    BOOL v108 = v107 != 0;

    if (v165 && v108)
    {
      if (objc_msgSend_useRecordCache(self, v51, v52))
      {
        uint64_t v109 = objc_msgSend_recordCache(v167, v51, v52);
        uint64_t v112 = objc_msgSend_desiredKeySet(self, v110, v111);
        uint64_t v115 = objc_msgSend_databaseScope(self, v113, v114);
        objc_msgSend_addRecord_container_knownUserKeys_scope_(v109, v116, (uint64_t)v9, v167, v112, v115);
      }
    }
  }
  v117 = objc_msgSend_entitlements(v167, v51, v52);
  uint64_t hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v117, v118, v119);
  objc_msgSend_setSerializeProtectionData_(v9, v121, hasProtectionDataEntitlement);

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v123 = objc_msgSend_objectForKeyedSubscript_(v9, v122, @"TESTING_NO_RECORD_ERROR_OR_RECORDS_RETURNED");
    BOOL v124 = v123 == 0;

    if (!v124)
    {

      if (v10)
      {
        objc_msgSend_setError_forRecordID_(self, v122, 0, v10);
      }
      id v10 = 0;
      id v9 = 0;
    }
  }
  uint64_t v125 = objc_msgSend_errorForRecordID_(self, v122, (uint64_t)v10);
  v128 = (__CFString *)v125;
  if (!v9 || v125)
  {
    char v130 = 0;
    if (v10 && v166)
    {
      v131 = objc_msgSend_recordIDsToETags(self, v126, v127);
      uint64_t v134 = objc_msgSend_allKeys(v131, v132, v133);
      char v130 = objc_msgSend_containsObject_(v134, v135, (uint64_t)v10);
    }
    if (!v128 && (v130 & 1) == 0)
    {
      uint64_t v136 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v137 = sub_1C4E94D98(v11);
      v140 = objc_msgSend_request(self, v138, v139);
      id v141 = sub_1C4E940D0(v140, v11);
      uint64_t v144 = objc_msgSend_error(v11, v142, v143);
      uint64_t v147 = objc_msgSend_errorDescription(v144, v145, v146);
      objc_msgSend_errorWithDomain_code_userInfo_format_(v136, v148, *MEMORY[0x1E4F19DD8], v137, v141, @"Error fetching record %@ from server: %@", v10, v147);
      v128 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v149 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v10;
      __int16 v177 = 2112;
      long long v178 = v128;
      _os_log_impl(&dword_1C4CFF000, v149, OS_LOG_TYPE_INFO, "Calling completion block for nil or failed record with ID %@: %@", location, 0x16u);
    }
    v152 = objc_msgSend_callbackQueue(self, v150, v151);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F8FC20;
    block[3] = &unk_1E64F5600;
    block[4] = self;
    BOOL v172 = v166;
    id v169 = v9;
    id v170 = v10;
    __int16 v171 = v128;
    id v153 = v128;
    dispatch_async(v152, block);

    char v156 = objc_msgSend_fetchRecordsGroup(self, v154, v155);
    dispatch_group_leave(v156);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend__handleSharePCSPrepForShare_recordID_(self, v129, (uint64_t)v9, v10);
    }
    else {
      objc_msgSend__decryptPropertiesIfNeededForRecord_record_(self, v129, (uint64_t)v9, v10);
    }
  }
}

- (void)_handleSharePCSPrepForShare:(id)a3 recordID:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v13 = objc_msgSend_entitlements(v10, v11, v12);
  if (objc_msgSend_hasOutOfProcessUIEntitlement(v13, v14, v15))
  {
    objc_msgSend_setSerializePersonalInfo_(v6, v16, 1);
  }
  else
  {
    id v18 = objc_msgSend_entitlements(v10, v16, v17);
    uint64_t hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v18, v19, v20);
    objc_msgSend_setSerializePersonalInfo_(v6, v22, hasParticipantPIIEntitlement);
  }
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v23 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    id v39 = objc_msgSend_recordID(v6, v24, v25);
    *(_DWORD *)buf = 138412546;
    uint64_t v47 = v39;
    __int16 v48 = 2112;
    uint64_t v49 = v10;
    _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Prepping PCS data for share %@ with container %@", buf, 0x16u);
  }
  uint64_t v28 = objc_msgSend_databaseScope(self, v26, v27);
  uint64_t v31 = objc_msgSend_topmostParentOperation(self, v29, v30);
  uint64_t v34 = objc_msgSend_operationID(v31, v32, v33);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4F8FF74;
  v40[3] = &unk_1E64F7710;
  id v35 = v6;
  id v41 = v35;
  id v36 = v10;
  id v42 = v36;
  objc_copyWeak(&v44, &location);
  id v37 = v7;
  id v43 = v37;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_removeServerSpecifiedKeys_requestorOperationID_completionHandler_(v35, v38, (uint64_t)v36, v28, 1, v34, v40);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (void)_decryptPropertiesIfNeededForRecord:(id)a3 record:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_errorForRecordID_(self, v7, (uint64_t)v6);

  if ((objc_msgSend_hasPropertiesRequiringEncryption(v13, v9, v10) & 1) == 0
    && !objc_msgSend_forcePCSDecrypt(self, v11, v12)
    || (objc_msgSend_skipDecryption(self, v11, v12) & 1) != 0
    || v8)
  {
    objc_msgSend__continueHandleFetchedRecord_recordID_(self, v11, (uint64_t)v13, v6);
  }
  else
  {
    objc_msgSend__decryptPropertiesOnRecord_recordID_(self, v11, (uint64_t)v13, v6);
  }
}

- (BOOL)fetchingAssetsForRereference
{
  uint64_t v3 = objc_msgSend_operationInfo(self, a2, v2);
  char v6 = objc_msgSend_fetchingAssetsForRereference(v3, v4, v5);

  return v6;
}

- (int)_prepareAsset:(id)a3 record:(id)a4 recordKey:(id)a5 assetTransferOptions:(id)a6
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v16 = a6;
  if (!v12)
  {
    uint64_t v91 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    uint64_t v94 = objc_msgSend_operationID(self, v92, v93);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v95, (uint64_t)a2, self, @"CKDFetchRecordsOperation.m", 990, @"Expected non-nil record for operation %@", v94);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v11;
    uint64_t v20 = objc_msgSend_downloadBaseURL(v17, v18, v19);
    if (v20
      || (objc_msgSend_constructedAssetDownloadURLTemplate(v17, v21, v22),
          (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_7:
      objc_msgSend_setRecord_(v17, v25, (uint64_t)v12);
      objc_msgSend_setRecordKey_(v17, v26, (uint64_t)v13);
      objc_msgSend_setAssetTransferOptions_(v17, v27, (uint64_t)v16);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v28 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = v28;
        uint64_t v34 = objc_msgSend_signature(v17, v32, v33);
        id v37 = objc_msgSend_recordID(v12, v35, v36);
        uint64_t v40 = objc_msgSend_operationID(self, v38, v39);
        *(_DWORD *)buf = 138413058;
        id v103 = v34;
        __int16 v104 = 2112;
        uint64_t v105 = v37;
        __int16 v106 = 2114;
        id v107 = v13;
        __int16 v108 = 2114;
        uint64_t v109 = v40;
        _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Prepared asset %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);
      }
      id v41 = objc_msgSend_downloadBaseURL(v17, v29, v30);

      if (v41) {
        int v42 = 2;
      }
      else {
        int v42 = 1;
      }
      goto LABEL_39;
    }
    if (!objc_msgSend_downloaded(v17, v23, v24)) {
      goto LABEL_7;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v80 = (void *)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
LABEL_38:
      int v42 = 0;
LABEL_39:

      goto LABEL_40;
    }
    __int16 v48 = v80;
    objc_super v83 = objc_msgSend_signature(v17, v81, v82);
    uint64_t v86 = objc_msgSend_recordID(v12, v84, v85);
    v89 = objc_msgSend_operationID(self, v87, v88);
    *(_DWORD *)buf = 138413058;
    id v103 = v83;
    __int16 v104 = 2112;
    uint64_t v105 = v86;
    __int16 v106 = 2114;
    id v107 = v13;
    __int16 v108 = 2114;
    uint64_t v109 = v89;
    _os_log_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_INFO, "Using cached asset for signature %@, record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

LABEL_37:
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = v11;
    if (!objc_msgSend_downloaded(v43, v44, v45))
    {
      uint64_t v96 = self;
      objc_msgSend_setRecord_(v43, v46, (uint64_t)v12);
      objc_msgSend_setRecordKey_(v43, v55, (uint64_t)v13);
      uint64_t v58 = objc_msgSend_recordPCS(v12, v56, v57);
      objc_msgSend_setRecordPCS_(v43, v59, v58);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      uint64_t v62 = objc_msgSend_assets(v43, v60, v61);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v97, v101, 16);
      if (v64)
      {
        uint64_t v66 = v64;
        uint64_t v67 = *(void *)v98;
        do
        {
          for (uint64_t i = 0; i != v66; ++i)
          {
            if (*(void *)v98 != v67) {
              objc_enumerationMutation(v62);
            }
            v69 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            objc_msgSend_setRecord_(v69, v65, (uint64_t)v12);
            objc_msgSend_setRecordKey_(v69, v70, (uint64_t)v13);
            objc_msgSend_setAssetTransferOptions_(v69, v71, (uint64_t)v16);
          }
          uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v97, v101, 16);
        }
        while (v66);
      }

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v72 = (void *)*MEMORY[0x1E4F1A500];
      int v42 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v73 = v72;
        v76 = objc_msgSend_recordID(v12, v74, v75);
        v79 = objc_msgSend_operationID(v96, v77, v78);
        *(_DWORD *)buf = 138413058;
        id v103 = v43;
        __int16 v104 = 2112;
        uint64_t v105 = v76;
        __int16 v106 = 2114;
        id v107 = v13;
        __int16 v108 = 2114;
        uint64_t v109 = v79;
        _os_log_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_INFO, "Prepared package %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);
      }
      goto LABEL_39;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v47 = (void *)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_38;
    }
    __int16 v48 = v47;
    uint64_t v51 = objc_msgSend_recordID(v12, v49, v50);
    uint64_t v54 = objc_msgSend_operationID(self, v52, v53);
    *(_DWORD *)buf = 138413058;
    id v103 = v43;
    __int16 v104 = 2112;
    uint64_t v105 = v51;
    __int16 v106 = 2114;
    id v107 = v13;
    __int16 v108 = 2114;
    uint64_t v109 = v54;
    _os_log_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_INFO, "Using cached package %@ for record %@, recordKey %{public}@ and operation %{public}@", buf, 0x2Au);

    goto LABEL_37;
  }
  int v42 = 0;
LABEL_40:

  return v42;
}

- (void)_addDownloadTasksForRecord:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4F90BF0;
  v11[3] = &unk_1E64F4698;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  objc_msgSend__addMergeableValueDownloadTasksForRecord_completionBlock_(self, v10, (uint64_t)v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_addAssetDownloadTaskForRecord:(id)a3 completionBlock:(id)a4
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v193 = a4;
  v204 = v5;
  if (!v5)
  {
    v188 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    v191 = objc_msgSend_operationID(self, v189, v190);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v188, v192, (uint64_t)a2, self, @"CKDFetchRecordsOperation.m", 1047, @"Expected non-nil record for operation %@", v191, v193);
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v171 = v8;
    id v174 = objc_msgSend_recordID(v204, v172, v173);
    __int16 v177 = objc_msgSend_operationID(self, v175, v176);
    if (objc_msgSend_shouldFetchAssetContent(self, v178, v179)) {
      uint64_t v182 = @"true";
    }
    else {
      uint64_t v182 = @"false";
    }
    if (objc_msgSend_fetchingAssetsForRereference(self, v180, v181)) {
      v185 = @"true";
    }
    else {
      v185 = @"false";
    }
    *(_DWORD *)buf = 138413314;
    if (objc_msgSend_shouldFetchAssetContentInMemory(self, v183, v184)) {
      v186 = @"true";
    }
    else {
      v186 = @"false";
    }
    uint64_t v239 = (uint64_t)v174;
    __int16 v240 = 2114;
    v241 = v177;
    __int16 v242 = 2114;
    v243 = v182;
    __int16 v244 = 2114;
    v245 = v185;
    __int16 v246 = 2114;
    v247 = v186;
    _os_log_debug_impl(&dword_1C4CFF000, v171, OS_LOG_TYPE_DEBUG, "Preparing assets for download for record %@ and operation %{public}@ (shouldFetchAssetContent:%{public}@ fetchingAssetsForRereference:%{public}@ inMemory:%{public}@)", buf, 0x34u);
  }
  if ((objc_msgSend_shouldFetchAssetContent(self, v9, v10) & 1) == 0)
  {
    id v13 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v11, v12);
    id v16 = objc_msgSend_recordType(v204, v14, v15);
    id v18 = objc_msgSend_objectForKeyedSubscript_(v13, v17, (uint64_t)v16);
    BOOL v19 = v18 == 0;

    if (v19)
    {
      if (!objc_msgSend_containsAssetBackedMergeableDeltas(v204, v11, v12))
      {
        id v170 = objc_msgSend_callbackQueue(self, v20, v21);
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v233[2] = sub_1C4F91D5C;
        v233[3] = &unk_1E64F0A80;
        id v234 = v193;
        dispatch_async(v170, v233);

        goto LABEL_102;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v22 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "Forcing asset fetch due to presence of asset-backed mergeable deltas", buf, 2u);
      }
    }
  }
  v194 = objc_msgSend_desiredPackageFileIndices(self, v11, v12);
  id v199 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v198 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v197 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  objc_msgSend_allKeys(v204, v23, v24);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v229, v237, 16);
  if (v201)
  {
    uint64_t v200 = *(void *)v230;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v230 != v200)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(obj);
          uint64_t v27 = v28;
        }
        uint64_t v202 = v27;
        uint64_t v206 = *(void *)(*((void *)&v229 + 1) + 8 * v27);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v204, v26, v206);
        uint64_t v32 = v29;
        if (v29)
        {
          id v205 = v29;
        }
        else
        {
          uint64_t v33 = objc_msgSend_encryptedValues(v204, v30, v31);
          objc_msgSend_objectForKeyedSubscript_(v33, v34, v206);
          id v205 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v37 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v35, v36);
        uint64_t v40 = objc_msgSend_recordType(v204, v38, v39);
        v203 = objc_msgSend_objectForKeyedSubscript_(v37, v41, (uint64_t)v40);

        id v44 = v203;
        if (v203)
        {
          id v44 = objc_msgSend_objectForKeyedSubscript_(v203, v42, v206);
        }
        v208 = v44;
        uint64_t v47 = objc_msgSend_shouldFetchAssetContent(v44, v42, v43);
        if (v47)
        {
          __int16 v48 = objc_msgSend_shouldFetchAssetContent(v208, v45, v46);
          char AssetContent = objc_msgSend_BOOLValue(v48, v49, v50);
        }
        else
        {
          char AssetContent = objc_msgSend_shouldFetchAssetContent(self, v45, v46);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_hasAssetBackedDeltas(v205, v52, v53))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v54 = v208;
          uint64_t v55 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v56 = v55;
            BOOL v59 = objc_msgSend_recordID(v204, v57, v58);
            *(_DWORD *)buf = 138543618;
            uint64_t v239 = v206;
            __int16 v240 = 2112;
            v241 = v59;
            _os_log_debug_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_DEBUG, "Forcing asset download for asset-backed mergeable field %{public}@ on record %@", buf, 0x16u);

            objc_msgSend_shouldFetchAssetContentInMemory(v208, v60, v61);
          }
          else
          {
LABEL_33:
            objc_msgSend_shouldFetchAssetContentInMemory(v54, v52, v53);
          uint64_t v64 = };
          if (v64)
          {
            uint64_t v65 = objc_msgSend_shouldFetchAssetContentInMemory(v208, v62, v63);
            int v68 = objc_msgSend_BOOLValue(v65, v66, v67);

            if (v68) {
              goto LABEL_36;
            }
LABEL_46:
            int v70 = 0;
          }
          else
          {
            if ((objc_msgSend_shouldFetchAssetContentInMemory(self, v62, v63) & 1) == 0) {
              goto LABEL_46;
            }
LABEL_36:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v69 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v134 = v69;
              uint64_t v137 = objc_msgSend_recordID(v204, v135, v136);
              *(_DWORD *)buf = 138543618;
              uint64_t v239 = v206;
              __int16 v240 = 2112;
              v241 = v137;
              _os_log_debug_impl(&dword_1C4CFF000, v134, OS_LOG_TYPE_DEBUG, "Will fetch asset content in memory for key %{public}@ on record %@", buf, 0x16u);
            }
            int v70 = 1;
          }
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1C4F91D78;
          aBlock[3] = &unk_1E64F7760;
          aBlock[4] = self;
          char v228 = v70;
          id v223 = v198;
          id v224 = v199;
          id v76 = v204;
          id v225 = v76;
          id v226 = v197;
          SEL v227 = a2;
          uint64_t v77 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v79 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v78, (uint64_t)v205, v76, v206, v208);
            v77[2](v77, v79, v205);
            goto LABEL_93;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v80 = v205;
            objc_super v83 = objc_msgSend_firstObject(v80, v81, v82);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              if (objc_msgSend_count(v80, v85, v86))
              {
                unint64_t v88 = 0;
                do
                {
                  v89 = objc_msgSend_objectAtIndexedSubscript_(v80, v87, v88);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v92 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v90, (uint64_t)v89, v76, v206, v208);
                    if (v92) {
                      objc_msgSend_setArrayIndex_(v89, v91, v88);
                    }
                    v77[2](v77, v92, v89);
                  }

                  ++v88;
                }
                while (v88 < objc_msgSend_count(v80, v93, v94));
              }
            }
            else
            {
              uint64_t v122 = objc_msgSend_firstObject(v80, v85, v86);
              objc_opt_class();
              char v123 = objc_opt_isKindOfClass();

              if (v123)
              {
                if (v70)
                {
                  v142 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v124, v125);
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v142, v143, (uint64_t)a2, self, @"CKDFetchRecordsOperation.m", 1144, @"shouldFetchAssetContentInMemory not for packages");
                }
                long long v220 = 0u;
                long long v221 = 0u;
                long long v218 = 0u;
                long long v219 = 0u;
                id v126 = v80;
                uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v127, (uint64_t)&v218, v236, 16);
                if (v128)
                {
                  uint64_t v129 = *(void *)v219;
                  do
                  {
                    for (uint64_t i = 0; i != v128; ++i)
                    {
                      if (*(void *)v219 != v129) {
                        objc_enumerationMutation(v126);
                      }
                      uint64_t v131 = *(void *)(*((void *)&v218 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v133 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v132, v131, v76, v206, v208);
                        v77[2](v77, v133, (id)v131);
                      }
                    }
                    uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v132, (uint64_t)&v218, v236, 16);
                  }
                  while (v128);
                }
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v70)
              {
                v140 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v95, v96);
                objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v140, v141, (uint64_t)a2, self, @"CKDFetchRecordsOperation.m", 1154, @"shouldFetchAssetContentInMemory not for packages");
              }
              id v97 = v205;
              uint64_t v101 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v98, (uint64_t)v97, v76, v206, v208);
              if (v101 == 1)
              {
                v102 = objc_msgSend_recordID(v76, v99, v100);
                __int16 v104 = objc_msgSend_objectForKeyedSubscript_(v194, v103, (uint64_t)v102);

                if (v104) {
                  objc_msgSend_objectForKeyedSubscript_(v104, v105, v206);
                }
                else {
                v138 = objc_msgSend_objectForKeyedSubscript_(v194, v105, v206);
                }
                objc_msgSend_setDownloadItemIndices_(v97, v139, (uint64_t)v138);
              }
              v77[2](v77, v101, v97);

              goto LABEL_93;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_93:

              goto LABEL_94;
            }
            long long v217 = 0u;
            long long v215 = 0u;
            long long v216 = 0u;
            long long v214 = 0u;
            objc_msgSend_unmergedDeltas(v205, v106, v107);
            id v80 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v108, (uint64_t)&v214, v235, 16);
            if (v111)
            {
              uint64_t v112 = *(void *)v215;
              do
              {
                for (uint64_t j = 0; j != v111; ++j)
                {
                  if (*(void *)v215 != v112) {
                    objc_enumerationMutation(v80);
                  }
                  uint64_t v114 = *(void **)(*((void *)&v214 + 1) + 8 * j);
                  uint64_t v115 = objc_msgSend_asset(v114, v109, v110);

                  if (v115)
                  {
                    uint64_t v116 = objc_msgSend_asset(v114, v109, v110);
                    uint64_t v118 = objc_msgSend__prepareAsset_record_recordKey_assetTransferOptions_(self, v117, (uint64_t)v116, v76, v206, v208);

                    v121 = objc_msgSend_asset(v114, v119, v120);
                    v77[2](v77, v118, v121);
                  }
                }
                uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v109, (uint64_t)&v214, v235, 16);
              }
              while (v111);
            }
          }

          goto LABEL_93;
        }
        uint64_t v54 = v208;
        if (AssetContent) {
          goto LABEL_33;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v71 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v72 = v71;
          uint64_t v75 = objc_msgSend_recordID(v204, v73, v74);
          *(_DWORD *)buf = 138543618;
          uint64_t v239 = v206;
          __int16 v240 = 2112;
          v241 = v75;
          _os_log_debug_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_DEBUG, "Skipping asset download for key %{public}@ on record %@", buf, 0x16u);

LABEL_94:
          uint64_t v54 = v208;
        }

        uint64_t v27 = v202 + 1;
      }
      while (v202 + 1 != v201);
      uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v229, v237, 16);
    }
    while (v201);
  }

  if (objc_msgSend_count(v199, v144, v145)
    || objc_msgSend_count(v198, v146, v147)
    || objc_msgSend_count(v197, v146, v147))
  {
    v148 = objc_msgSend_recordFetchProgressBlock(self, v146, v147);
    BOOL v149 = v148 != 0;

    id v150 = [CKDRecordDownloadTask alloc];
    v152 = objc_msgSend_initWithRecord_trackProgress_assetsToDownload_assetsToDownloadInMemory_assetURLInfosToFillOut_(v150, v151, (uint64_t)v204, v149, v199, v198, v197);
    uint64_t v155 = objc_msgSend_group(v152, v153, v154);
    long long v158 = objc_msgSend_callbackQueue(self, v156, v157);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F91FA4;
    block[3] = &unk_1E64F0790;
    id v211 = v193;
    id v159 = v152;
    id v210 = v159;
    dispatch_group_notify(v155, v158, block);

    uint64_t v162 = objc_msgSend_downloadTasksByRecordID(self, v160, v161);
    objc_sync_enter(v162);
    BOOL v165 = objc_msgSend_downloadTasksByRecordID(self, v163, v164);
    id v168 = objc_msgSend_recordID(v204, v166, v167);
    objc_msgSend_setObject_forKey_(v165, v169, (uint64_t)v159, v168);

    objc_sync_exit(v162);
  }
  else
  {
    v187 = objc_msgSend_callbackQueue(self, v146, v147);
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = sub_1C4F91F88;
    v212[3] = &unk_1E64F0A80;
    id v213 = v193;
    dispatch_async(v187, v212);

    id v159 = v213;
  }

LABEL_102:
}

- (void)_addMergeableValueDownloadTasksForRecord:(id)a3 completionBlock:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (objc_msgSend_shouldFetchMergeableValues(self, v8, v9))
  {
    uint64_t v10 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v67 = v7;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      long long v60 = v11;
      uint64_t v63 = objc_msgSend_recordID(v6, v61, v62);
      uint64_t v66 = objc_msgSend_operationID(self, v64, v65);
      *(_DWORD *)buf = 138412546;
      uint64_t v82 = v63;
      __int16 v83 = 2114;
      uint64_t v84 = (uint64_t)v66;
      _os_log_debug_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_DEBUG, "Adding mergeable value download tasks for record %@ in operation %{public}@", buf, 0x16u);
    }
    group = dispatch_group_create();
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    objc_msgSend_allKeys(v6, v12, v13);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v77, v89, 16);
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v78;
      uint64_t v69 = *(void *)v78;
      id v68 = v6;
      do
      {
        uint64_t v19 = 0;
        uint64_t v71 = v17;
        do
        {
          if (*(void *)v78 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v77 + 1) + 8 * v19);
          uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v6, v16, v20);
          uint64_t v24 = v21;
          if (v21)
          {
            id v25 = v21;
          }
          else
          {
            uint64_t v26 = objc_msgSend_encryptedValues(v6, v22, v23);
            objc_msgSend_objectForKeyedSubscript_(v26, v27, v20);
            id v25 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = v25;
            uint64_t v31 = objc_msgSend_valueID(v28, v29, v30);
            if (*v10 != -1) {
              dispatch_once(v10, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              uint64_t v33 = v32;
              objc_msgSend_recordID(v6, v34, v35);
              uint64_t v36 = v10;
              v38 = id v37 = self;
              id v41 = objc_msgSend_operationID(v37, v39, v40);
              *(_DWORD *)buf = 138413058;
              uint64_t v82 = v31;
              __int16 v83 = 2112;
              uint64_t v84 = v20;
              __int16 v85 = 2112;
              uint64_t v86 = v38;
              __int16 v87 = 2114;
              unint64_t v88 = v41;
              _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Will download mergeable value for mergeable %@ for key '%@' on record %@ in operation %{public}@", buf, 0x2Au);

              self = v37;
              uint64_t v10 = v36;
              id v6 = v68;
            }
            int v42 = objc_alloc_init(CKMergeableValueDownloadTask);
            objc_msgSend_setRecord_(v42, v43, (uint64_t)v6);
            objc_msgSend_setKey_(v42, v44, v20);
            objc_msgSend_setMergeableValueID_(v42, v45, (uint64_t)v31);
            objc_msgSend_setRecordValue_(v42, v46, (uint64_t)v28);
            dispatch_group_enter(group);
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = sub_1C4F92558;
            v75[3] = &unk_1E64F05C8;
            id v76 = group;
            objc_msgSend_setCompletionBlock_(v42, v47, (uint64_t)v75);
            uint64_t v50 = objc_msgSend_mergeableValueDownloadTasks(self, v48, v49);

            if (!v50)
            {
              uint64_t v53 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v51, v52);
              objc_msgSend_setMergeableValueDownloadTasks_(self, v54, (uint64_t)v53);
            }
            uint64_t v55 = objc_msgSend_mergeableValueDownloadTasks(self, v51, v52);
            objc_msgSend_setObject_forKeyedSubscript_(v55, v56, (uint64_t)v42, v31);

            uint64_t v18 = v69;
            uint64_t v17 = v71;
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v77, v89, 16);
      }
      while (v17);
    }

    BOOL v59 = objc_msgSend_callbackQueue(self, v57, v58);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F92560;
    block[3] = &unk_1E64F0A80;
    uint64_t v7 = v67;
    uint64_t v74 = v67;
    dispatch_group_notify(group, v59, block);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)_finishAllDownloadTasksWithError:(id)a3
{
  id v22 = a3;
  id v6 = objc_msgSend_downloadTasksByRecordID(self, v4, v5);
  uint64_t v9 = objc_msgSend_objectEnumerator(v6, v7, v8);

  uint64_t v12 = objc_msgSend_nextObject(v9, v10, v11);
  if (v12)
  {
    uint64_t v15 = (void *)v12;
    do
    {
      objc_msgSend_didCompleteTaskWithError_(v15, v13, (uint64_t)v22);
      uint64_t v18 = objc_msgSend_nextObject(v9, v16, v17);

      uint64_t v15 = (void *)v18;
    }
    while (v18);
  }
  uint64_t v19 = objc_msgSend_downloadTasksByRecordID(self, v13, v14);
  objc_msgSend_removeAllObjects(v19, v20, v21);
}

- (void)_didDownloadAssetsWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A548];
  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    id v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v6;
      uint64_t v11 = objc_msgSend_operationID(self, v9, v10);
      *(_DWORD *)uint64_t v18 = 138543618;
      *(void *)&v18[4] = v11;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v4;
      uint64_t v12 = "Failed to download assets for operation %{public}@: %@";
      uint64_t v13 = v8;
      uint32_t v14 = 22;
LABEL_11:
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, v12, v18, v14);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v15;
      uint64_t v11 = objc_msgSend_operationID(self, v16, v17);
      *(_DWORD *)uint64_t v18 = 138543362;
      *(void *)&v18[4] = v11;
      uint64_t v12 = "Downloaded assets for operation %{public}@";
      uint64_t v13 = v8;
      uint32_t v14 = 12;
      goto LABEL_11;
    }
  }
  objc_msgSend__finishAllDownloadTasksWithError_(self, v7, (uint64_t)v4, *(_OWORD *)v18, *(void *)&v18[16], v19);
}

- (void)_fetchCloudCerts
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_keyOrErrorForHostname(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_initWeak(location, self);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v10 = objc_msgSend_keyOrErrorForHostname(self, v8, v9);
    objc_msgSend_allKeys(v10, v11, v12);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v34, v38, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_stateTransitionGroup(self, v14, v15);
          dispatch_group_enter(v20);

          uint64_t v21 = objc_opt_new();
          objc_msgSend_setTranscodeServerHostname_(v21, v22, v19);
          objc_msgSend_setType_(v21, v23, 0);
          uint64_t v24 = objc_opt_class();
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = sub_1C4F92B10;
          v32[3] = &unk_1E64F6758;
          objc_copyWeak(&v33, location);
          v32[4] = v19;
          objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v25, v24, v21, v32);
          objc_destroyWeak(&v33);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v34, v38, 16);
      }
      while (v16);
    }

    objc_destroyWeak(location);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v26 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = v26;
      uint64_t v30 = objc_msgSend_operationID(self, v28, v29);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v30;
      _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "No cloud certs to download for operation %{public}@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)_downloadAssets
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_downloadTasksByRecordID(self, a2, v2);
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint32_t v14 = objc_msgSend_downloadTasksByRecordID(self, v12, v13);
    uint64_t v17 = objc_msgSend_objectEnumerator(v14, v15, v16);

    uint64_t v20 = objc_msgSend_nextObject(v17, v18, v19);
    if (v20)
    {
      uint64_t v23 = (void *)v20;
      do
      {
        uint64_t v24 = objc_msgSend_assetsToDownload(v23, v21, v22);
        objc_msgSend_addObjectsFromArray_(v9, v25, (uint64_t)v24);

        id v28 = objc_msgSend_assetsToDownloadInMemory(v23, v26, v27);
        objc_msgSend_addObjectsFromArray_(v10, v29, (uint64_t)v28);

        uint64_t v32 = objc_msgSend_assetURLInfosToFillOut(v23, v30, v31);
        objc_msgSend_addObjectsFromArray_(v11, v33, (uint64_t)v32);

        uint64_t v36 = objc_msgSend_nextObject(v17, v34, v35);

        uint64_t v23 = (void *)v36;
      }
      while (v36);
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v37 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      long long v60 = v37;
      uint64_t v63 = objc_msgSend_operationID(self, v61, v62);
      *(_DWORD *)buf = 138413058;
      id v70 = v9;
      __int16 v71 = 2112;
      id v72 = v10;
      __int16 v73 = 2112;
      id v74 = v11;
      __int16 v75 = 2114;
      id v76 = v63;
      _os_log_debug_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_DEBUG, "Downloading assets: %@, in-memory assets: %@, and publish assets %@ for operation %{public}@", buf, 0x2Au);
    }
    uint64_t v38 = objc_opt_new();
    objc_msgSend_setAssetsToDownload_(v38, v39, (uint64_t)v9);
    objc_msgSend_setAssetsToDownloadInMemory_(v38, v40, (uint64_t)v10);
    objc_msgSend_setAssetURLInfosToFillOut_(v38, v41, (uint64_t)v11);
    uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v42, v43);
    objc_msgSend_setShouldCloneFileInAssetCache_(v38, v45, shouldCloneFileInAssetCache);
    uint64_t v48 = objc_msgSend_fetchingAssetsForRereference(self, v46, v47);
    objc_msgSend_setFetchingAssetsForRereference_(v38, v49, v48);
    uint64_t v52 = objc_msgSend_operationInfo(self, v50, v51);
    uint64_t v55 = objc_msgSend_cloneContextReturnBlock(v52, v53, v54);
    objc_msgSend_setCloneContextReturnBlock_(v38, v56, (uint64_t)v55);

    uint64_t v57 = objc_opt_class();
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_1C4F93134;
    v68[3] = &unk_1E64F7850;
    v68[4] = self;
    v68[5] = a2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v58, v57, v38, v68);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v59 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v64 = v59;
      uint64_t v67 = objc_msgSend_operationID(self, v65, v66);
      *(_DWORD *)buf = 138543362;
      id v70 = v67;
      _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "No assets to download for operation %{public}@", buf, 0xCu);
    }
  }
}

- (void)_downloadMergeableValues
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_mergeableValueDownloadTasks(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  uint64_t v8 = (void *)*MEMORY[0x1E4F1A548];
  if (v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v8);
    }
    id v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = v9;
      uint64_t v27 = objc_msgSend_operationID(self, v25, v26);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v27;
      _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Will download mergeable values for operation %{public}@", (uint8_t *)location, 0xCu);
    }
    uint64_t v12 = objc_msgSend_stateTransitionGroup(self, v10, v11);
    dispatch_group_enter(v12);

    objc_initWeak(location, self);
    uint64_t v13 = objc_opt_new();
    uint64_t v16 = objc_msgSend_mergeableValueDownloadTasks(self, v14, v15);
    uint64_t v19 = objc_msgSend_allKeys(v16, v17, v18);
    objc_msgSend_setMergeableValueIDs_(v13, v20, (uint64_t)v19);

    uint64_t v21 = objc_opt_class();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1C4F943F8;
    v32[3] = &unk_1E64F66E8;
    objc_copyWeak(&v33, location);
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v22, v21, v13, v32);
    objc_destroyWeak(&v33);

    objc_destroyWeak(location);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v8);
    }
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v28 = v23;
      uint64_t v31 = objc_msgSend_operationID(self, v29, v30);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v31;
      _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "No mergeable values to download for operation %{public}@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend__finishAllDownloadTasksWithError_(self, v5, (uint64_t)v4);
  objc_msgSend_hash(self, v6, v7);
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)CKDFetchRecordsOperation;
  [(CKDOperation *)&v8 finishWithError:v4];
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v8 = objc_msgSend_recordIDsToFetch(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v26, v30, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v26 + 1) + 8 * v15), v11, v12);
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v18, v19))
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1C4F94E54;
    v24[3] = &unk_1E64F1D18;
    id v25 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v21, (uint64_t)v24);
  }
  objc_msgSend_setRecordFetchProgressBlock_(self, v20, 0);
  objc_msgSend_setRecordFetchCompletionBlock_(self, v22, 0);
  v23.receiver = self;
  v23.super_class = (Class)CKDFetchRecordsOperation;
  [(CKDOperation *)&v23 _finishOnCallbackQueueWithError:v4];
}

- (void)main
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  id v4 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = v6;
    uint64_t v22 = (objc_class *)objc_opt_class();
    objc_super v23 = NSStringFromClass(v22);
    id v25 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v24, 1, 0, 0);
    long long v28 = objc_msgSend_CKPropertiesStyleString(v25, v26, v27);
    uint64_t v30 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v29, 0, 1, 0);
    id v33 = objc_msgSend_CKPropertiesStyleString(v30, v31, v32);
    int v38 = 138544130;
    uint64_t v39 = v23;
    __int16 v40 = 2048;
    id v41 = self;
    __int16 v42 = 2114;
    uint64_t v43 = v28;
    __int16 v44 = 2112;
    uint64_t v45 = v33;
    _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Starting fetch records operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v38,
      0x2Au);
  }
  id v9 = objc_msgSend_recordIDsToFetch(self, v7, v8);
  if (objc_msgSend_count(v9, v10, v11))
  {

LABEL_8:
    objc_msgSend_makeStateTransition_(self, v14, 0);
    return;
  }
  uint64_t v15 = objc_msgSend_fullRecordsToFetch(self, v12, v13);
  uint64_t v18 = objc_msgSend_count(v15, v16, v17);

  if (v18) {
    goto LABEL_8;
  }
  if (*v4 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v19 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
  {
    long long v34 = v19;
    long long v37 = objc_msgSend_operationID(self, v35, v36);
    int v38 = 138543362;
    uint64_t v39 = v37;
    _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Operation %{public}@ is finishing early because there are no records to fetch", (uint8_t *)&v38, 0xCu);
  }
  objc_msgSend_makeStateTransition_(self, v20, 1);
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (id)relevantZoneIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_recordIDsToFetch(self, a2, v2);
  if (objc_msgSend_count(v3, v4, v5))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v18 + 1) + 8 * i), v10, v11, (void)v18);
          if (v16) {
            objc_msgSend_addObject_(v6, v15, (uint64_t)v16);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)useCachedEtags
{
  return self->_useCachedEtags;
}

- (void)setUseCachedEtags:(BOOL)a3
{
  self->_useCachedEtags = a3;
}

- (BOOL)useRecordCache
{
  return self->_useRecordCache;
}

- (void)setUseRecordCache:(BOOL)a3
{
  self->_useRecordCache = a3;
}

- (BOOL)forcePCSDecrypt
{
  return self->_forcePCSDecrypt;
}

- (void)setForcePCSDecrypt:(BOOL)a3
{
  self->_forcePCSDecrypt = a3;
}

- (BOOL)skipDecryption
{
  return self->_skipDecryption;
}

- (void)setSkipDecryption:(BOOL)a3
{
  self->_skipDecryption = a3;
}

- (NSArray)fullRecordsToFetch
{
  return self->_fullRecordsToFetch;
}

- (void)setFullRecordsToFetch:(id)a3
{
}

- (BOOL)shouldUpdateTimestampsForFetchedMergeableValues
{
  return self->_shouldUpdateTimestampsForFetchedMergeableValues;
}

- (void)setShouldUpdateTimestampsForFetchedMergeableValues:(BOOL)a3
{
  self->_shouldUpdateTimestampsForFetchedMergeableValues = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (id)recordFetchProgressBlock
{
  return self->_recordFetchProgressBlock;
}

- (void)setRecordFetchProgressBlock:(id)a3
{
}

- (id)recordFetchCommandBlock
{
  return self->_recordFetchCommandBlock;
}

- (void)setRecordFetchCommandBlock:(id)a3
{
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
}

- (NSArray)recordIDsToFetch
{
  return self->_recordIDsToFetch;
}

- (void)setRecordIDsToFetch:(id)a3
{
}

- (NSMutableDictionary)cachedRecords
{
  return self->_cachedRecords;
}

- (void)setCachedRecords:(id)a3
{
}

- (NSSet)desiredKeySet
{
  return self->_desiredKeySet;
}

- (void)setDesiredKeySet:(id)a3
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

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (void)setFetchRecordsGroup:(id)a3
{
}

- (NSMutableDictionary)errorsByRecordID
{
  return self->_errorsByRecordID;
}

- (void)setErrorsByRecordID:(id)a3
{
}

- (NSMapTable)downloadTasksByRecordID
{
  return self->_downloadTasksByRecordID;
}

- (void)setDownloadTasksByRecordID:(id)a3
{
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchchar AssetContent = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (BOOL)shouldFetchMergeableValues
{
  return self->_shouldFetchMergeableValues;
}

- (void)setShouldFetchMergeableValues:(BOOL)a3
{
  self->_shouldFetchMergeableValues = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
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

- (NSMutableArray)recordIDsToRefetch
{
  return self->_recordIDsToRefetch;
}

- (void)setRecordIDsToRefetch:(id)a3
{
}

- (NSMutableDictionary)keyOrErrorForHostname
{
  return self->_keyOrErrorForHostname;
}

- (void)setKeyOrErrorForHostname:(id)a3
{
}

- (NSMutableDictionary)shareRecordsToUpdateByRecordID
{
  return self->_shareRecordsToUpdateByRecordID;
}

- (void)setShareRecordsToUpdateByRecordID:(id)a3
{
}

- (NSMutableDictionary)mergeableValueDownloadTasks
{
  return self->_mergeableValueDownloadTasks;
}

- (void)setMergeableValueDownloadTasks:(id)a3
{
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
}

- (BOOL)shouldRollSharePCSOnFetch
{
  return self->_shouldRollSharePCSOnFetch;
}

- (void)setShouldRollSharePCSOnFetch:(BOOL)a3
{
  self->_shouldRollSharePCSOnFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_mergeableValueDownloadTasks, 0);
  objc_storeStrong((id *)&self->_shareRecordsToUpdateByRecordID, 0);
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, 0);
  objc_storeStrong((id *)&self->_recordIDsToRefetch, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_downloadTasksByRecordID, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredKeySet, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong((id *)&self->_recordIDsToFetch, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordFetchCommandBlock, 0);
  objc_storeStrong(&self->_recordFetchProgressBlock, 0);
  objc_storeStrong((id *)&self->_fullRecordsToFetch, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end