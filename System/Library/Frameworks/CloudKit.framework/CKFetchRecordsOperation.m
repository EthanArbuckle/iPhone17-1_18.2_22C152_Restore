@interface CKFetchRecordsOperation
+ (CKFetchRecordsOperation)fetchCurrentUserRecordOperation;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4;
- (BOOL)dropInMemoryAssetContentASAP;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)isFetchCurrentUserOperation;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldFetchAssetContent;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier;
- (CKFetchRecordsOperation)init;
- (CKFetchRecordsOperation)initWithRecordIDs:(NSArray *)recordIDs;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)desiredPackageFileIndices;
- (NSDictionary)recordIDsToETags;
- (NSDictionary)recordIDsToVersionETags;
- (NSDictionary)webSharingIdentityDataByRecordID;
- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID;
- (NSMutableDictionary)recordIDsToRecords;
- (id)activityCreate;
- (id)fetchRecordsCompletionBlock_wrapper;
- (id)perRecordCompletionBlock_wrapper;
- (id)perRecordETagMatchedBlock;
- (id)perRecordETagMatchedBlock_wrapper;
- (id)perRecordProgressBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchRecordsCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7;
- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4;
- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)perRecordCompletionBlock;
- (void)perRecordProgressBlock;
- (void)performCKOperation;
- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setDesiredPackageFileIndices:(id)a3;
- (void)setDropInMemoryAssetContentASAP:(BOOL)a3;
- (void)setFetchRecordsCompletionBlock:(void *)fetchRecordsCompletionBlock;
- (void)setFetchRecordsCompletionBlockIVar:(id)a3;
- (void)setFetchRecordsCompletionBlock_wrapper:(id)a3;
- (void)setIsFetchCurrentUserOperation:(BOOL)a3;
- (void)setPerRecordCompletionBlock:(void *)perRecordCompletionBlock;
- (void)setPerRecordCompletionBlock_wrapper:(id)a3;
- (void)setPerRecordETagMatchedBlock:(id)a3;
- (void)setPerRecordETagMatchedBlock_wrapper:(id)a3;
- (void)setPerRecordProgressBlock:(void *)perRecordProgressBlock;
- (void)setPerRecordProgressBlock_wrapper:(id)a3;
- (void)setRecordIDs:(NSArray *)recordIDs;
- (void)setRecordIDsToETags:(id)a3;
- (void)setRecordIDsToRecords:(id)a3;
- (void)setRecordIDsToVersionETags:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3;
- (void)setWebSharingIdentityDataByRecordID:(id)a3;
@end

@implementation CKFetchRecordsOperation

- (CKFetchRecordsOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKFetchRecordsOperation;
  v2 = [(CKOperation *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    recordIDsToRecords = v2->_recordIDsToRecords;
    v2->_recordIDsToRecords = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v7;

    v2->_shouldFetchAssetContent = 1;
    v2->_shouldFetchAssetContentInMemory = 0;
    v2->_shouldRequestEncryptedAssetOwnerIdentifier = 0;
    v2->_dropInMemoryAssetContentASAP = 0;
    uint64_t v9 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v2->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v2->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (CKFetchRecordsOperation)initWithRecordIDs:(NSArray *)recordIDs
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = recordIDs;
  v8 = (CKFetchRecordsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v9 = v4;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v29, (uint64_t)v33, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = [CKException alloc];
            uint64_t v24 = *MEMORY[0x1E4F1C3C8];
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            id v28 = (id)objc_msgSend_initWithName_format_(v23, v27, v24, @"Unexpected recordID passed to %@: %@", v26, v15, (void)v29);

            objc_exception_throw(v28);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v29, (uint64_t)v33, 16);
      }
      while (v12);
    }

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    v21 = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v20;
  }
  return v8;
}

+ (CKFetchRecordsOperation)fetchCurrentUserRecordOperation
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchCurrentUserOperation_(v2, v3, 1, v4);

  return (CKFetchRecordsOperation *)v2;
}

- (void)setPerRecordProgressBlock:(void *)perRecordProgressBlock
{
  id v7 = perRecordProgressBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B153810;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordProgressBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordProgressBlock;
    self->_perRecordProgressBlock = v11;
LABEL_9:
  }
}

- (void)perRecordProgressBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF1419C;
    v16 = sub_18AF139C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B153A08;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordProgressBlock);
  }

  return v8;
}

- (void)setPerRecordCompletionBlock:(void *)perRecordCompletionBlock
{
  id v7 = perRecordCompletionBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B153B94;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordCompletionBlock;
    self->_perRecordCompletionBlock = v11;
LABEL_9:
  }
}

- (void)perRecordCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF1419C;
    v16 = sub_18AF139C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B153D8C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordCompletionBlock);
  }

  return v8;
}

- (void)setPerRecordETagMatchedBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B153F18;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordETagMatchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordETagMatchedBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordETagMatchedBlock = self->_perRecordETagMatchedBlock;
    self->_id perRecordETagMatchedBlock = v11;
LABEL_9:
  }
}

- (id)perRecordETagMatchedBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF1419C;
    v16 = sub_18AF139C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B154110;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordETagMatchedBlock);
  }

  return v8;
}

- (void)setFetchRecordsCompletionBlockIVar:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B15429C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchRecordsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordsCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    self->_id fetchRecordsCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchRecordsCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF1419C;
    v16 = sub_18AF139C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B154494;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordsCompletionBlock);
  }

  return v8;
}

- (void)setFetchRecordsCompletionBlock:(void *)fetchRecordsCompletionBlock
{
  BOOL v4 = fetchRecordsCompletionBlock == 0;
  id v9 = fetchRecordsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchRecordsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordIDs(self, v5, v6, v7);
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchCurrentUserOperation_(v4, v15, CurrentUserOperation, v16);
  uint64_t v20 = objc_msgSend_desiredKeys(self, v17, v18, v19);
  objc_msgSend_setDesiredKeys_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_recordIDsToETags(self, v23, v24, v25);
  objc_msgSend_setRecordIDsToETags_(v4, v27, (uint64_t)v26, v28);

  long long v32 = objc_msgSend_recordIDsToVersionETags(self, v29, v30, v31);
  objc_msgSend_setRecordIDsToVersionETags_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_desiredPackageFileIndices(self, v35, v36, v37);
  objc_msgSend_setDesiredPackageFileIndices_(v4, v39, (uint64_t)v38, v40);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(v4, v45, AssetContent, v46);
  uint64_t shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(self, v47, v48, v49);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(v4, v51, shouldRequestEncryptedAssetOwnerIdentifier, v52);
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v53, v54, v55);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v57, AssetContentInMemory, v58);
  uint64_t v62 = objc_msgSend_dropInMemoryAssetContentASAP(self, v59, v60, v61);
  objc_msgSend_setDropInMemoryAssetContentASAP_(v4, v63, v62, v64);
  v68 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v65, v66, v67);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v69, (uint64_t)v68, v70);

  v74 = objc_msgSend_webSharingIdentityDataByRecordID(self, v71, v72, v73);
  objc_msgSend_setWebSharingIdentityDataByRecordID_(v4, v75, (uint64_t)v74, v76);

  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v77, v78, v79);
  objc_msgSend_setShouldCloneFileInAssetCache_(v4, v81, shouldCloneFileInAssetCache, v82);
  v83.receiver = self;
  v83.super_class = (Class)CKFetchRecordsOperation;
  [(CKDatabaseOperation *)&v83 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v87.receiver = self;
  v87.super_class = (Class)CKFetchRecordsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v87 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordIDs(v4, v5, v6, v7, v87.receiver, v87.super_class);
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchCurrentUserOperation_(self, v15, CurrentUserOperation, v16);
  uint64_t v20 = objc_msgSend_desiredKeys(v4, v17, v18, v19);
  objc_msgSend_setDesiredKeys_(self, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_recordIDsToETags(v4, v23, v24, v25);
  objc_msgSend_setRecordIDsToETags_(self, v27, (uint64_t)v26, v28);

  long long v32 = objc_msgSend_recordIDsToVersionETags(v4, v29, v30, v31);
  objc_msgSend_setRecordIDsToVersionETags_(self, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_desiredPackageFileIndices(v4, v35, v36, v37);
  objc_msgSend_setDesiredPackageFileIndices_(self, v39, (uint64_t)v38, v40);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(self, v45, AssetContent, v46);
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v4, v47, v48, v49);
  objc_msgSend_setShouldFetchAssetContentInMemory_(self, v51, AssetContentInMemory, v52);
  uint64_t shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v4, v53, v54, v55);
  objc_msgSend_setShouldRequestEncryptedAssetOwnerIdentifier_(self, v57, shouldRequestEncryptedAssetOwnerIdentifier, v58);
  uint64_t v62 = objc_msgSend_dropInMemoryAssetContentASAP(v4, v59, v60, v61);
  objc_msgSend_setDropInMemoryAssetContentASAP_(self, v63, v62, v64);
  v68 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v65, v66, v67);
  uint64_t v72 = objc_msgSend_copy(v68, v69, v70, v71);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v73, (uint64_t)v72, v74);

  uint64_t v78 = objc_msgSend_webSharingIdentityDataByRecordID(v4, v75, v76, v77);
  objc_msgSend_setWebSharingIdentityDataByRecordID_(self, v79, (uint64_t)v78, v80);

  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v4, v81, v82, v83);
  objc_msgSend_setShouldCloneFileInAssetCache_(self, v85, shouldCloneFileInAssetCache, v86);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v21.receiver = self;
  v21.super_class = (Class)CKFetchRecordsOperation;
  if ([(CKOperation *)&v21 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perRecordProgressBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perRecordCompletionBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_perRecordETagMatchedBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_fetchRecordsCompletionBlock(self, v15, v16, v17);
        BOOL v6 = v19 != 0;
      }
    }
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v9 = objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  if (v9)
  {
  }
  else if ((objc_msgSend_isFetchCurrentUserOperation(self, v10, v11, v12) & 1) == 0)
  {
    if (a3)
    {
      uint64_t v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 12, @"property recordIDs must not be nil for %@", v38);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  uint64_t v19 = objc_msgSend_perRecordCompletionBlock(self, v13, v14, v15);
  if (v19)
  {
    int v20 = 0;
    goto LABEL_8;
  }
  uint64_t v21 = objc_msgSend_perRecordETagMatchedBlock(self, v16, v17, v18);
  if (v21)
  {
    uint64_t v4 = (void *)v21;
    int v20 = 0;
    goto LABEL_8;
  }
  uint64_t v40 = objc_msgSend_perRecordProgressBlock(self, v16, v17, v18);
  if (v40)
  {
    uint64_t v5 = (void *)v40;
    uint64_t v4 = 0;
    int v20 = 1;
LABEL_8:
    int v25 = 0;
    BOOL v26 = 0;
    if (objc_msgSend_isFetchCurrentUserOperation(self, v16, v17, v18)) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v42 = objc_msgSend_fetchRecordsCompletionBlock(self, v16, v17, v18);
  if (!v42) {
    return 0;
  }
  BOOL v6 = (void *)v42;
  if (!objc_msgSend_isFetchCurrentUserOperation(self, v43, v44, v45))
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    int v25 = 1;
    int v20 = 1;
LABEL_9:
    v27 = objc_msgSend_recordIDs(self, v22, v23, v24);
    BOOL v26 = objc_msgSend_count(v27, v28, v29, v30) == 0;

    if (v25)
    {

      if ((v20 & 1) == 0)
      {
LABEL_14:
        if (!v19) {

        }
        if (!v26) {
          goto LABEL_17;
        }
        return 0;
      }
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    if (!v20) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

LABEL_17:
  uint64_t v34 = objc_msgSend_desiredKeys(self, v31, v32, v33);
  v35 = CKValidateIndexedArrayKeys(v34, 1);

  if (v35)
  {
    BOOL v36 = 0;
    if (a3) {
      *a3 = v35;
    }
  }
  else
  {
    v46.receiver = self;
    v46.super_class = (Class)CKFetchRecordsOperation;
    BOOL v36 = [(CKDatabaseOperation *)&v46 CKOperationShouldRun:a3];
  }

  return v36;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isFetchCurrentUserOperation(self, a2, v2, v3))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = v5;
      uint64_t v10 = objc_msgSend_operationID(self, v7, v8, v9);
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Fetching current user record with operation %{public}@", buf, 0xCu);
LABEL_11:
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v11 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = v11;
      uint64_t v10 = objc_msgSend_operationID(self, v12, v13, v14);
      uint64_t v18 = objc_msgSend_recordIDs(self, v15, v16, v17);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Fetching records with operation %{public}@ recordIDs=%@", buf, 0x16u);

      goto LABEL_11;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKFetchRecordsOperation;
  [(CKOperation *)&v19 performCKOperation];
}

- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18B154FA0;
  v23[4] = sub_18B154FB0;
  uint64_t v24 = self;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_18B154FA0;
  uint64_t v17 = sub_18B154FB0;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B154FB8;
  v12[3] = &unk_1E5462958;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B154FF8;
  v11[3] = &unk_1E5462980;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v6, v7, (uint64_t)v12, (uint64_t)v11, 0);
  if (a4)
  {
    uint64_t v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  return v9;
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  uint64_t v160 = v159 = self;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v16 = signpost;

  if (v160)
  {
    if (v16)
    {
      if (self) {
        uint64_t v19 = self->super.super._signpost;
      }
      else {
        uint64_t v19 = 0;
      }
      int v20 = v19;
      uint64_t v24 = objc_msgSend_log(v20, v21, v22, v23);

      if (self) {
        int v25 = self->super.super._signpost;
      }
      else {
        int v25 = 0;
      }
      BOOL v26 = v25;
      uint64_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412546;
      id v175 = v9;
      __int16 v176 = 2112;
      uint64_t v177 = v160;
      uint64_t v31 = "Record %@ fetched with error: %@";
      uint64_t v32 = v24;
      os_signpost_id_t v33 = v30;
      uint32_t v34 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchRecordsOperation", v31, buf, v34);
LABEL_21:
    }
  }
  else if (v16)
  {
    if (self) {
      v35 = self->super.super._signpost;
    }
    else {
      v35 = 0;
    }
    BOOL v36 = v35;
    uint64_t v24 = objc_msgSend_log(v36, v37, v38, v39);

    if (self) {
      uint64_t v40 = self->super.super._signpost;
    }
    else {
      uint64_t v40 = 0;
    }
    v41 = v40;
    uint64_t v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    id v175 = v9;
    uint64_t v31 = "Record %@ fetched";
    uint64_t v32 = v24;
    os_signpost_id_t v33 = v45;
    uint32_t v34 = 12;
    goto LABEL_20;
  }
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v171[2] = sub_18B155A9C;
  v171[3] = &unk_1E5464380;
  v171[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v10, v17, (uint64_t)v171, v18);
  if (v10 && !v160)
  {
    id v170 = 0;
    int v49 = objc_msgSend_claimPackagesInRecord_error_(self, v46, (uint64_t)v10, (uint64_t)&v170);
    id v53 = v170;
    BOOL v54 = v53 != 0;
    if (!v49) {
      BOOL v54 = v53 == 0;
    }
    if (v54)
    {
      uint64_t v55 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v50, v51, v52);
      v57 = v55;
      if (v49) {
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)v159, @"CKFetchRecordsOperation.m", 215, @"Expecting packageClaimError(%@) only on failure (%s)", v53, "succeeded");
      }
      else {
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)v159, @"CKFetchRecordsOperation.m", 215, @"Expecting packageClaimError(%@) only on failure (%s)", v53, "failed");
      }

      if (v49) {
        goto LABEL_28;
      }
    }
    else if (v49)
    {
LABEL_28:
      uint64_t v160 = 0;
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v160 = objc_msgSend_CKClientSuitableError(v53, v50, v51, v52);

    id v10 = 0;
    goto LABEL_34;
  }
LABEL_35:
  if (v160 || !v10)
  {
    if (objc_msgSend_count(v159->_assetInfoByArrayIndexByRecordKeyByRecordID, v46, v47, v48))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v69 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v175 = v9;
        __int16 v176 = 2112;
        uint64_t v177 = v160;
        __int16 v178 = 2112;
        id v179 = v10;
        _os_log_error_impl(&dword_18AF10000, v69, OS_LOG_TYPE_ERROR, "Ditching assetInfoByArrayIndexByRecordKeyByRecordID recordID %@ error %@ record %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (__sTestOverridesAvailable)
    {
      uint64_t v58 = objc_msgSend_unitTestOverrides(v159, v46, v47, v48);
      uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v58, v59, @"SkipInMemoryAssetSignatureCheck", v60);
      int v65 = objc_msgSend_BOOLValue(v61, v62, v63, v64);
    }
    else
    {
      int v65 = 0;
    }
    objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v46, (uint64_t)v159, (uint64_t)v10, v65 ^ 1u, 0);
  }
  if (v9)
  {
    if (!v160)
    {
      if (v10)
      {
        if (objc_msgSend_canDropItemResultsEarly(v159, v66, v67, v68)) {
          goto LABEL_56;
        }
        uint64_t v70 = objc_msgSend_recordIDsToRecords(v159, v66, v67, v68);
        objc_msgSend_setObject_forKeyedSubscript_(v70, v71, (uint64_t)v10, (uint64_t)v9);
      }
      else
      {
        uint64_t v72 = objc_msgSend_recordIDsToETags(v159, v66, v67, v68);
        v75 = objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)v9, v74);

        if (v75) {
          goto LABEL_56;
        }
        uint64_t v70 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v66, v67, v68);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v70, v153, (uint64_t)a2, (uint64_t)v159, @"CKFetchRecordsOperation.m", 248, @"Should have received a record");
      }

      goto LABEL_56;
    }
    if ((objc_msgSend_canDropItemResultsEarly(v159, v66, v67, v68) & 1) == 0)
    {
      if (v159) {
        objc_msgSend_setObject_forKeyedSubscript_(v159->_recordErrors, v66, v160, (uint64_t)v9);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(0, v66, v160, (uint64_t)v9);
      }
    }
  }
LABEL_56:
  uint64_t v76 = objc_msgSend_perRecordETagMatchedBlock_wrapper(v159, v66, v67, v68);
  uint64_t v80 = v76;
  if (v76)
  {
    v81 = (void (**)(void *, id))_Block_copy(v76);
  }
  else
  {
    uint64_t v82 = objc_msgSend_perRecordETagMatchedBlock(v159, v77, v78, v79);
    v81 = (void (**)(void *, id))_Block_copy(v82);
  }
  uint64_t v83 = (void *)v160;

  objc_super v87 = objc_msgSend_perRecordCompletionBlock_wrapper(v159, v84, v85, v86);
  v91 = v87;
  if (v87)
  {
    v158 = (void (**)(void *, id, id, uint64_t))_Block_copy(v87);
  }
  else
  {
    v92 = objc_msgSend_perRecordCompletionBlock(v159, v88, v89, v90);
    v158 = (void (**)(void *, id, id, uint64_t))_Block_copy(v92);
  }
  if (v9 && !v160 && !v10 && v81)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v96 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v135 = v96;
      v139 = objc_msgSend_operationID(v159, v136, v137, v138);
      v143 = objc_msgSend_recordChangeTag(0, v140, v141, v142);
      *(_DWORD *)buf = 138543874;
      id v175 = v139;
      __int16 v176 = 2112;
      uint64_t v177 = (uint64_t)v9;
      __int16 v178 = 2112;
      id v179 = v143;
      _os_log_debug_impl(&dword_18AF10000, v135, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched etag-matched record with ID %@ etag=%@", buf, 0x20u);
    }
    v81[2](v81, v9);
    goto LABEL_79;
  }
  if (!v158)
  {
LABEL_78:
    if (!v9) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v97 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v144 = v97;
    v148 = objc_msgSend_operationID(v159, v145, v146, v147);
    v152 = objc_msgSend_recordChangeTag(v10, v149, v150, v151);
    *(_DWORD *)buf = 138544130;
    id v175 = v148;
    __int16 v176 = 2112;
    uint64_t v177 = (uint64_t)v9;
    __int16 v178 = 2112;
    id v179 = v152;
    __int16 v180 = 2112;
    uint64_t v181 = v160;
    _os_log_debug_impl(&dword_18AF10000, v144, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched record with ID %@ etag=%@: %@", buf, 0x2Au);
  }
  if (objc_msgSend_dropInMemoryAssetContentASAP(v159, v98, v99, v100))
  {
    v101 = (void *)MEMORY[0x18C12ADA0]();
    v158[2](v158, v10, v9, v160);
    goto LABEL_78;
  }
  v158[2](v158, v10, v9, v160);
  if (v9)
  {
LABEL_79:
    v102 = objc_msgSend_configuration(v159, v93, v94, v95);
    v106 = objc_msgSend_container(v102, v103, v104, v105);
    objc_msgSend_handleRecordChanged_changeType_record_error_(v106, v107, (uint64_t)v9, 1, v10, v160);
  }
LABEL_80:
  if (objc_msgSend_dropInMemoryAssetContentASAP(v159, v93, v94, v95))
  {
    id v155 = v11;
    uint64_t v157 = (uint64_t)v9;
    context = (void *)MEMORY[0x18C12ADA0]();
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    id v156 = v10;
    v111 = objc_msgSend_valueStore(v10, v108, v109, v110);
    v115 = objc_msgSend_allRawValues(v111, v112, v113, v114);

    uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v166, (uint64_t)v173, 16);
    if (v117)
    {
      uint64_t v118 = v117;
      uint64_t v119 = *(void *)v167;
      v161 = v115;
      do
      {
        for (uint64_t i = 0; i != v118; ++i)
        {
          if (*(void *)v167 != v119) {
            objc_enumerationMutation(v115);
          }
          v121 = *(void **)(*((void *)&v166 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_setAssetContent_(v121, v122, 0, v123);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v164 = 0u;
              long long v165 = 0u;
              long long v162 = 0u;
              long long v163 = 0u;
              id v125 = v121;
              uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v162, (uint64_t)v172, 16);
              if (v127)
              {
                uint64_t v128 = v127;
                uint64_t v129 = *(void *)v163;
                do
                {
                  for (uint64_t j = 0; j != v128; ++j)
                  {
                    if (*(void *)v163 != v129) {
                      objc_enumerationMutation(v125);
                    }
                    v131 = *(void **)(*((void *)&v162 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      objc_msgSend_setAssetContent_(v131, v132, 0, v133);
                    }
                  }
                  uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v132, (uint64_t)&v162, (uint64_t)v172, 16);
                }
                while (v128);
              }

              v115 = v161;
            }
          }
        }
        uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v124, (uint64_t)&v166, (uint64_t)v173, 16);
      }
      while (v118);
    }

    id v9 = (id)v157;
    if (v157) {
      objc_msgSend_setObject_forKeyedSubscript_(v159->_assetInfoByArrayIndexByRecordKeyByRecordID, v134, 0, v157);
    }
    id v11 = v155;
    id v10 = v156;
    uint64_t v83 = (void *)v160;
  }
}

- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v8 = signpost;

  if (v8)
  {
    if (self) {
      uint64_t v12 = self->super.super._signpost;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = v12;
    uint64_t v17 = objc_msgSend_log(v13, v14, v15, v16);

    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    os_signpost_id_t v23 = objc_msgSend_identifier(v19, v20, v21, v22);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v31 = 138412546;
      id v32 = v6;
      __int16 v33 = 2048;
      double v34 = a4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v17, OS_SIGNPOST_EVENT, v23, "CKFetchRecordsOperation", "Record %@ updated progress %f", (uint8_t *)&v31, 0x16u);
    }
  }
  uint64_t v24 = objc_msgSend_perRecordProgressBlock_wrapper(self, v9, v10, v11);
  uint64_t v28 = v24;
  if (v24)
  {
    uint64_t v29 = (void (**)(void *, id, double))_Block_copy(v24);
  }
  else
  {
    uint64_t v30 = objc_msgSend_perRecordProgressBlock(self, v25, v26, v27);
    uint64_t v29 = (void (**)(void *, id, double))_Block_copy(v30);
  }
  if (v29) {
    v29[2](v29, v6, a4);
  }
}

- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7
{
  id v15 = a6;
  uint64_t v14 = objc_msgSend_assetInfoForOperation_recordID_recordKey_arrayIndex_(CKOperation, v12, (uint64_t)self, (uint64_t)a3, a4, a5);
  if (v15) {
    objc_msgSend_writeData_atOffset_(v14, v13, (uint64_t)v15, a7);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      id v9 = self->super.super._signpost;
    }
    else {
      id v9 = 0;
    }
    uint64_t v10 = v9;
    uint64_t v14 = objc_msgSend_log(v10, v11, v12, v13);

    if (self) {
      id v15 = self->super.super._signpost;
    }
    else {
      id v15 = 0;
    }
    uint64_t v16 = v15;
    os_signpost_id_t v20 = objc_msgSend_identifier(v16, v17, v18, v19);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v14, OS_SIGNPOST_EVENT, v20, "CKFetchRecordsOperation", "Finishing", buf, 2u);
    }
  }
  if (self)
  {
    unint64_t mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, mergeableValueCount, v8);
      uint64_t v26 = objc_msgSend_operationMetric(self, v23, v24, v25);
      objc_msgSend_setObject_forKeyedSubscript_(v26, v27, (uint64_t)v22, @"mergeable_valueCount");
    }
    unint64_t mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      uint64_t v29 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, mergeableDeltaCount, v8);
      __int16 v33 = objc_msgSend_operationMetric(self, v30, v31, v32);
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v29, @"mergeable_fetchedDeltaCount");
    }
    unint64_t assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      BOOL v36 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, assetBackedMergeableDeltaCount, v8);
      uint64_t v40 = objc_msgSend_operationMetric(self, v37, v38, v39);
      objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)v36, @"mergeable_assetCount");
    }
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  objc_super v46 = objc_msgSend_recordIDs(self, v43, v44, v45);
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v119, (uint64_t)v132, 16);
  if (v48)
  {
    uint64_t v52 = v48;
    uint64_t v53 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v120 != v53) {
          objc_enumerationMutation(v46);
        }
        uint64_t v55 = objc_msgSend_zoneID(*(void **)(*((void *)&v119 + 1) + 8 * i), v49, v50, v51);
        objc_msgSend_addObject_(v42, v56, (uint64_t)v55, v57);
      }
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v119, (uint64_t)v132, 16);
    }
    while (v52);
  }

  if (objc_msgSend_count(v42, v58, v59, v60))
  {
    uint64_t v64 = objc_msgSend_zoneIDsToZoneNamesString_(self, v61, (uint64_t)v42, v63);
    uint64_t v68 = objc_msgSend_operationMetric(self, v65, v66, v67);
    objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v64, @"zoneNames");
  }
  if (!v4)
  {
    if (self) {
      uint64_t v70 = objc_msgSend_count(self->_recordErrors, v61, v62, v63);
    }
    else {
      uint64_t v70 = objc_msgSend_count(0, v61, v62, v63);
    }
    if (v70)
    {
      uint64_t v71 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v61, v62, v63);
      uint64_t v73 = v71;
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(v71, v72, (uint64_t)self->_recordErrors, @"CKPartialErrors");
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(v71, v72, 0, @"CKPartialErrors");
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v74, @"CKInternalErrorDomain", 1011, v73, @"Failed to fetch some records");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  v75 = objc_msgSend_fetchRecordsCompletionBlock_wrapper(self, v61, v62, v63);
  uint64_t v79 = v75;
  if (v75)
  {
    uint64_t v80 = (void (**)(void *, void *, void *))_Block_copy(v75);
  }
  else
  {
    v81 = objc_msgSend_fetchRecordsCompletionBlock(self, v76, v77, v78);
    uint64_t v80 = (void (**)(void *, void *, void *))_Block_copy(v81);
  }
  if (v80)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v82 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v107 = v82;
      v108 = (objc_class *)objc_opt_class();
      uint64_t v109 = NSStringFromClass(v108);
      uint64_t v113 = objc_msgSend_ckShortDescription(self, v110, v111, v112);
      *(_DWORD *)buf = 138544130;
      id v125 = v109;
      __int16 v126 = 2048;
      uint64_t v127 = self;
      __int16 v128 = 2114;
      uint64_t v129 = v113;
      __int16 v130 = 2112;
      id v131 = v4;
      _os_log_debug_impl(&dword_18AF10000, v107, OS_LOG_TYPE_DEBUG, "Calling fetchRecordsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    uint64_t v86 = objc_msgSend_recordIDsToRecords(self, v83, v84, v85);
    uint64_t v90 = objc_msgSend_CKClientSuitableError(v4, v87, v88, v89);
    v80[2](v80, v86, v90);

    objc_msgSend_setFetchRecordsCompletionBlock_(self, v91, 0, v92);
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  if (self) {
    packagesToDestroy = self->_packagesToDestroy;
  }
  else {
    packagesToDestroy = 0;
  }
  uint64_t v94 = packagesToDestroy;
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v115, (uint64_t)v123, 16);
  if (v96)
  {
    uint64_t v100 = v96;
    uint64_t v101 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v100; ++j)
      {
        if (*(void *)v116 != v101) {
          objc_enumerationMutation(v94);
        }
        objc_msgSend_removeDB(*(void **)(*((void *)&v115 + 1) + 8 * j), v97, v98, v99);
      }
      uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v115, (uint64_t)v123, 16);
    }
    while (v100);
  }

  objc_msgSend_setPerRecordProgressBlock_(self, v103, 0, v104);
  objc_msgSend_setPerRecordCompletionBlock_(self, v105, 0, v106);
  v114.receiver = self;
  v114.super_class = (Class)CKFetchRecordsOperation;
  [(CKOperation *)&v114 _finishOnCallbackQueueWithError:v4];
}

- (void)ckSignpostBegin
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super.super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super.super._signpost;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      os_signpost_id_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      BOOL v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      int v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      uint64_t v13 = self->super.super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordID_record_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchRecordsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID
{
  return self->_assetInfoByArrayIndexByRecordKeyByRecordID;
}

- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3
{
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(NSArray *)recordIDs
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
}

- (id)perRecordProgressBlock_wrapper
{
  return self->_perRecordProgressBlock_wrapper;
}

- (void)setPerRecordProgressBlock_wrapper:(id)a3
{
}

- (id)perRecordCompletionBlock_wrapper
{
  return self->_perRecordCompletionBlock_wrapper;
}

- (void)setPerRecordCompletionBlock_wrapper:(id)a3
{
}

- (id)perRecordETagMatchedBlock_wrapper
{
  return self->_perRecordETagMatchedBlock_wrapper;
}

- (void)setPerRecordETagMatchedBlock_wrapper:(id)a3
{
}

- (id)fetchRecordsCompletionBlock_wrapper
{
  return self->_fetchRecordsCompletionBlock_wrapper;
}

- (void)setFetchRecordsCompletionBlock_wrapper:(id)a3
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

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_uint64_t shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
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

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
}

- (NSMutableDictionary)recordIDsToRecords
{
  return self->_recordIDsToRecords;
}

- (void)setRecordIDsToRecords:(id)a3
{
}

- (NSDictionary)desiredPackageFileIndices
{
  return self->_desiredPackageFileIndices;
}

- (void)setDesiredPackageFileIndices:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToRecords, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordETagMatchedBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordProgressBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordETagMatchedBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);

  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, 0);
}

@end