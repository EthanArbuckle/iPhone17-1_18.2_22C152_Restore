@interface CKDPublishAssetsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDPublishAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordIDs;
- (NSDictionary)fileNamesByAssetFieldNames;
- (NSMutableDictionary)fetchedRecordsByID;
- (NSOperation)fetchRecordsOperation;
- (id)_checkEntitlements;
- (id)activityCreate;
- (id)assetPublishedBlock;
- (unint64_t)URLOptions;
- (unint64_t)requestedTTL;
- (void)_dispatchAssetURLsForRecord:(id)a3 pcs:(_OpaquePCSShareProtection *)a4;
- (void)_fetchPCSForRecords;
- (void)_fetchRecords;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_finishPublishAssetsForRecord:(id)a3;
- (void)cancel;
- (void)main;
- (void)setAssetPublishedBlock:(id)a3;
- (void)setFetchRecordsOperation:(id)a3;
- (void)setFetchedRecordsByID:(id)a3;
- (void)setFileNamesByAssetFieldNames:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setURLOptions:(unint64_t)a3;
@end

@implementation CKDPublishAssetsOperation

- (CKDPublishAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDPublishAssetsOperation;
  v9 = [(CKDDatabaseOperation *)&v25 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordIDs(v6, v7, v8);
    recordIDs = v9->_recordIDs;
    v9->_recordIDs = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_fileNamesByAssetFieldNames(v6, v12, v13);
    fileNamesByAssetFieldNames = v9->_fileNamesByAssetFieldNames;
    v9->_fileNamesByAssetFieldNames = (NSDictionary *)v14;

    uint64_t v18 = objc_msgSend_requestedTTL(v6, v16, v17);
    uint64_t v21 = 3600;
    if (v18) {
      uint64_t v21 = v18;
    }
    v9->_requestedTTL = v21;
    v9->_URLOptions = objc_msgSend_URLOptions(v6, v19, v20);
    uint64_t v22 = objc_opt_new();
    fetchedRecordsByID = v9->_fetchedRecordsByID;
    v9->_fetchedRecordsByID = (NSMutableDictionary *)v22;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/publish-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      uint64_t v8 = objc_msgSend__checkEntitlements(self, v5, v6);
      if (v8)
      {
        objc_msgSend_finishWithError_(self, v7, (uint64_t)v8);
        objc_msgSend_setState_(self, v9, 0xFFFFFFFFLL);
      }
      goto LABEL_7;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__fetchRecords(self, v10, v11);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__fetchPCSForRecords(self, v12, v13);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      uint64_t v8 = objc_msgSend_error(self, v14, v15);
      objc_msgSend_finishWithError_(self, v16, (uint64_t)v8);
LABEL_7:

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDPublishAssetsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F4170[a3 - 2];
  }
  return v3;
}

- (id)_checkEntitlements
{
  if ((objc_msgSend_URLOptions(self, a2, v2) & 2) != 0
    && (objc_msgSend_container(self, v4, v5),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_entitlements(v6, v7, v8),
        v9 = objc_claimAutoreleasedReturnValue(),
        char hasAllowOnDeviceAssetStreamingEntitlement = objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(v9, v10, v11),
        v9,
        v6,
        (hasAllowOnDeviceAssetStreamingEntitlement & 1) == 0))
  {
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F19C40], 8, &unk_1F20ABC90);
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)_dispatchAssetURLsForRecord:(id)a3 pcs:(_OpaquePCSShareProtection *)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v90 = objc_msgSend_recordID(v6, v7, v8);
  if (!v90)
  {
    v84 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v84, v85, (uint64_t)a2, self, @"CKDPublishAssetsOperation.m", 120, @"Expected non nil recordID");
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v105 = v90;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Getting asset urls for record %@", buf, 0xCu);
  }
  uint64_t v14 = objc_msgSend_container(self, v12, v13);
  uint64_t v17 = objc_msgSend_entitlements(v14, v15, v16);
  char hasAlwaysAllowPublishAssetsEntitlement = objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(v17, v18, v19);

  if ((hasAlwaysAllowPublishAssetsEntitlement & 1) == 0)
  {
    if (!*MEMORY[0x1E4F1A4E0])
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v33 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        v68 = v33;
        v71 = objc_msgSend_container(self, v69, v70);
        v74 = objc_msgSend_containerID(v71, v72, v73);
        v77 = objc_msgSend_containerIdentifier(v74, v75, v76);
        v80 = objc_msgSend_container(self, v78, v79);
        v83 = objc_msgSend_processName(v80, v81, v82);
        *(_DWORD *)buf = 138412546;
        id v105 = v77;
        __int16 v106 = 2112;
        v107 = v83;
        _os_log_fault_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_FAULT, "Unidentified use of CKPublishAssetsOperation which will break under Walrus in container %@ by client %@. Please file a radar and reach out to cloudkit-client@group.apple.com for next steps.", buf, 0x16u);
      }
    }
    goto LABEL_19;
  }
  v23 = objc_msgSend_container(self, v21, v22);
  v26 = objc_msgSend_containerID(v23, v24, v25);
  if (objc_msgSend_specialContainerType(v26, v27, v28) == 4)
  {
    char v31 = objc_msgSend_URLOptions(self, v29, v30);

    if (v31)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v32 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v105 = v90;
        _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Asset URL for iCloud Drive record %@ requested for private streaming. This request will fail if walrus is enabled.", buf, 0xCu);
      }
LABEL_19:
      char v88 = 0;
      goto LABEL_22;
    }
  }
  else
  {
  }
  char v88 = 1;
LABEL_22:
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  objc_msgSend_allKeys(v6, v21, v22);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v99, v103, 16);
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v100;
    uint64_t v87 = *(void *)v100;
    do
    {
      uint64_t v39 = 0;
      uint64_t v91 = v37;
      do
      {
        if (*(void *)v100 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v99 + 1) + 8 * v39);
        v41 = objc_msgSend_objectForKey_(v6, v36, v40);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v42 = v41;
          v45 = objc_msgSend_fileNamesByAssetFieldNames(self, v43, v44);
          v47 = objc_msgSend_objectForKeyedSubscript_(v45, v46, v40);

          if (v47)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v48 = v6;
            v49 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v105 = v42;
              _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Creating asset url for asset %@", buf, 0xCu);
            }
            v52 = objc_msgSend_container(self, v50, v51);
            v55 = objc_msgSend_pcsManager(v52, v53, v54);
            uint64_t v58 = objc_msgSend_useEncryption(self, v56, v57);
            uint64_t v61 = objc_msgSend_useClearAssetEncryption(self, v59, v60);
            id v98 = 0;
            LOBYTE(v86) = v88;
            objc_msgSend_fillInDownloadURLsForAssetWithFieldName_fileName_recordPCS_pcsManager_useEncryption_useClearAssetEncryption_alwaysAllowKeyExport_outError_(v42, v62, v40, v47, a4, v55, v58, v61, v86, &v98);
            id v63 = v98;

            v66 = objc_msgSend_callbackQueue(self, v64, v65);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1C4E46C50;
            block[3] = &unk_1E64F0198;
            block[4] = self;
            id v94 = v90;
            uint64_t v95 = v40;
            id v96 = v42;
            id v97 = v63;
            id v67 = v63;
            dispatch_async(v66, block);

            id v6 = v48;
            uint64_t v38 = v87;
            uint64_t v37 = v91;
          }
        }
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v99, v103, 16);
    }
    while (v37);
  }
}

- (void)_finishPublishAssetsForRecord:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = a3;
  objc_msgSend_allKeys(v26, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v31, v35, 16);
  if (v7)
  {
    uint64_t v10 = v7;
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
        uint64_t v14 = objc_msgSend_fileNamesByAssetFieldNames(self, v8, v9);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);

        if (v16)
        {
          uint64_t v18 = objc_msgSend_objectForKey_(v26, v17, v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            objc_msgSend_setExposeAssetKey_(v19, v20, 1);
            v23 = objc_msgSend_callbackQueue(self, v21, v22);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1C4E46F00;
            block[3] = &unk_1E64F0DF0;
            block[4] = self;
            id v28 = v26;
            uint64_t v29 = v13;
            id v30 = v19;
            id v24 = v19;
            dispatch_async(v23, block);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }
}

- (void)_fetchPCSForRecords
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v4 = objc_msgSend_fetchedRecordsByID(self, a2, v2);
  uint64_t v7 = objc_msgSend_allKeys(v4, v5, v6);

  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v32, v36, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_fetchedRecordsByID(self, v10, v11);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, v15);

        uint64_t v21 = objc_msgSend_stateTransitionGroup(self, v19, v20);
        dispatch_group_enter(v21);

        id v24 = objc_msgSend_container(self, v22, v23);
        v27 = objc_msgSend_pcsCache(v24, v25, v26);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = sub_1C4E471A0;
        v30[3] = &unk_1E64F4150;
        v30[4] = v15;
        v30[5] = self;
        id v31 = v18;
        id v28 = v18;
        objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v27, v29, v15, self, 0, v30);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }
}

- (void)_fetchRecords
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_msgSend_fileNamesByAssetFieldNames(self, a2, v2);
  uint64_t v8 = objc_msgSend_allKeys(v5, v6, v7);
  uint64_t v10 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);

  uint64_t v11 = objc_opt_new();
  uint64_t v14 = objc_msgSend_operationInfo(self, v12, v13);
  uint64_t v17 = objc_msgSend_resolvedConfiguration(v14, v15, v16);
  objc_msgSend_setResolvedConfiguration_(v11, v18, (uint64_t)v17);

  uint64_t v21 = objc_msgSend_operationInfo(self, v19, v20);
  id v24 = objc_msgSend_group(v21, v22, v23);
  objc_msgSend_setGroup_(v11, v25, (uint64_t)v24);

  id v28 = objc_msgSend_recordIDs(self, v26, v27);
  objc_msgSend_setRecordIDs_(v11, v29, (uint64_t)v28);

  objc_msgSend_setShouldFetchAssetContent_(v11, v30, 0);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(v11, v31, 1);
  long long v34 = objc_msgSend_fileNamesByAssetFieldNames(self, v32, v33);
  uint64_t v37 = objc_msgSend_allKeys(v34, v35, v36);
  objc_msgSend_setDesiredKeys_(v11, v38, (uint64_t)v37);

  objc_msgSend_setAssetFieldNamesToPublishURLs_(v11, v39, (uint64_t)v10);
  uint64_t v42 = objc_msgSend_requestedTTL(self, v40, v41);
  objc_msgSend_setRequestedTTL_(v11, v43, v42);
  uint64_t v46 = objc_msgSend_URLOptions(self, v44, v45);
  objc_msgSend_setURLOptions_(v11, v47, v46);
  uint64_t v48 = objc_opt_class();
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1C4E4761C;
  v50[3] = &unk_1E64F0210;
  v50[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v49, v48, v11, v50);
}

- (void)main
{
  v4 = objc_msgSend_recordIDs(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_fileNamesByAssetFieldNames(self, v7, v8);
    BOOL v12 = objc_msgSend_count(v9, v10, v11) == 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  objc_msgSend_makeStateTransition_(self, v13, v12);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setAssetPublishedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDPublishAssetsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CKDPublishAssetsOperation;
  [(CKDOperation *)&v8 cancel];
  uint64_t v5 = objc_msgSend_fetchRecordsOperation(self, v3, v4);
  objc_msgSend_cancel(v5, v6, v7);
}

- (id)assetPublishedBlock
{
  return self->_assetPublishedBlock;
}

- (void)setAssetPublishedBlock:(id)a3
{
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
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

- (NSOperation)fetchRecordsOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 496, 1);
}

- (void)setFetchRecordsOperation:(id)a3
{
}

- (NSMutableDictionary)fetchedRecordsByID
{
  return self->_fetchedRecordsByID;
}

- (void)setFetchedRecordsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedRecordsByID, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_assetPublishedBlock, 0);
}

@end