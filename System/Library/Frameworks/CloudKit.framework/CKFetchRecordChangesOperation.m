@interface CKFetchRecordChangesOperation
+ (Class)operationInfoClass;
+ (SEL)daemonCallbackCompletionSelector;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)fetchAllChanges;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)moreComing;
- (BOOL)shouldFetchAssetContents;
- (CKFetchRecordChangesOperation)init;
- (CKFetchRecordChangesOperation)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID previousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (CKRecordZoneID)recordZoneID;
- (CKServerChangeToken)previousServerChangeToken;
- (CKServerChangeToken)resultServerChangeToken;
- (NSArray)desiredKeys;
- (NSData)resultClientChangeTokenData;
- (NSMutableDictionary)recordErrors;
- (NSUInteger)resultsLimit;
- (id)activityCreate;
- (id)changeTokensUpdatedBlock;
- (id)relevantZoneIDs;
- (id)serverChangeTokenFetchedBlock;
- (int64_t)changeTypesFromSetCallbacks;
- (int64_t)status;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchRecordChangesCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 reply:(id)a6;
- (void)handleDeleteForRecordID:(id)a3;
- (void)handleOperationDidCompleteWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 metrics:(id)a6 error:(id)a7;
- (void)performCKOperation;
- (void)recordChangedBlock;
- (void)recordWithIDWasDeletedBlock;
- (void)setChangeTokensUpdatedBlock:(id)a3;
- (void)setDesiredKeys:(NSArray *)desiredKeys;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchRecordChangesCompletionBlock:(void *)fetchRecordChangesCompletionBlock;
- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (void)setRecordChangedBlock:(void *)recordChangedBlock;
- (void)setRecordErrors:(id)a3;
- (void)setRecordWithIDWasDeletedBlock:(void *)recordWithIDWasDeletedBlock;
- (void)setRecordZoneID:(CKRecordZoneID *)recordZoneID;
- (void)setResultClientChangeTokenData:(id)a3;
- (void)setResultServerChangeToken:(id)a3;
- (void)setResultsLimit:(NSUInteger)resultsLimit;
- (void)setServerChangeTokenFetchedBlock:(id)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CKFetchRecordChangesOperation

- (CKFetchRecordChangesOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKFetchRecordChangesOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContents = 1;
  }
  return v2;
}

- (CKFetchRecordChangesOperation)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID previousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_super v6 = recordZoneID;
  v7 = previousServerChangeToken;
  v14 = (CKFetchRecordChangesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZoneID;
    v14->_recordZoneID = (CKRecordZoneID *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_previousServerChangeToken;
    v14->_previousServerChangeToken = (CKServerChangeToken *)v20;
  }
  return v14;
}

- (void)setRecordChangedBlock:(void *)recordChangedBlock
{
  id v7 = recordChangedBlock;
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
    v14[2] = sub_18B106578;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordChangedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordChangedBlock;
    self->_recordChangedBlock = v11;
LABEL_9:
  }
}

- (void)recordChangedBlock
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
    id v15 = sub_18AF13FB4;
    v16 = sub_18AF13958;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B106770;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordChangedBlock);
  }

  return v8;
}

- (void)setRecordWithIDWasDeletedBlock:(void *)recordWithIDWasDeletedBlock
{
  id v7 = recordWithIDWasDeletedBlock;
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
    v14[2] = sub_18B1068FC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordWithIDWasDeletedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordWithIDWasDeletedBlock;
    self->_recordWithIDWasDeletedBlock = v11;
LABEL_9:
  }
}

- (void)recordWithIDWasDeletedBlock
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
    id v15 = sub_18AF13FB4;
    v16 = sub_18AF13958;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B106AF4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordWithIDWasDeletedBlock);
  }

  return v8;
}

- (void)setFetchRecordChangesCompletionBlock:(void *)fetchRecordChangesCompletionBlock
{
  id v7 = fetchRecordChangesCompletionBlock;
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
    v14[2] = sub_18B106C80;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordChangesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_fetchRecordChangesCompletionBlock;
    self->_fetchRecordChangesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchRecordChangesCompletionBlock
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
    id v15 = sub_18AF13FB4;
    v16 = sub_18AF13958;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B106E78;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordChangesCompletionBlock);
  }

  return v8;
}

- (void)setServerChangeTokenFetchedBlock:(id)a3
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
    v14[2] = sub_18B107004;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id serverChangeTokenFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_serverChangeTokenFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id serverChangeTokenFetchedBlock = self->_serverChangeTokenFetchedBlock;
    self->_id serverChangeTokenFetchedBlock = v11;
LABEL_9:
  }
}

- (id)serverChangeTokenFetchedBlock
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
    id v15 = sub_18AF13FB4;
    v16 = sub_18AF13958;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1071FC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_serverChangeTokenFetchedBlock);
  }

  return v8;
}

- (void)setChangeTokensUpdatedBlock:(id)a3
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
    v14[2] = sub_18B107388;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id changeTokensUpdatedBlock = v15;
    goto LABEL_9;
  }
  if (self->_changeTokensUpdatedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id changeTokensUpdatedBlock = self->_changeTokensUpdatedBlock;
    self->_id changeTokensUpdatedBlock = v11;
LABEL_9:
  }
}

- (id)changeTokensUpdatedBlock
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
    id v15 = sub_18AF13FB4;
    v16 = sub_18AF13958;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B107580;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_changeTokensUpdatedBlock);
  }

  return v8;
}

- (BOOL)moreComing
{
  return objc_msgSend_status(self, a2, v2, v3) != 3;
}

- (id)relevantZoneIDs
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordZoneID(self, a2, v2, v3);
  v8[0] = v4;
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 1);

  return v6;
}

+ (Class)operationInfoClass
{
  return (Class)objc_opt_class();
}

- (void)fillOutOperationInfo:(id)a3
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v9 = objc_msgSend_previousServerChangeToken(self, v6, v7, v8);
  objc_msgSend_setPreviousServerChangeToken_(v5, v10, (uint64_t)v9, v11);

  uint64_t v15 = objc_msgSend_resultsLimit(self, v12, v13, v14);
  objc_msgSend_setResultsLimit_(v5, v16, v15, v17);
  v21 = objc_msgSend_desiredKeys(self, v18, v19, v20);
  objc_msgSend_setDesiredKeys_(v5, v22, (uint64_t)v21, v23);

  id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v63[0] = v5;
  v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v63, 1);
  v30 = objc_msgSend_recordZoneID(self, v27, v28, v29);
  v62 = v30;
  v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)&v62, 1);
  v34 = objc_msgSend_initWithObjects_forKeys_(v24, v33, (uint64_t)v26, (uint64_t)v32);

  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v35, (uint64_t)v34, v36);
  v40 = objc_msgSend_recordZoneID(self, v37, v38, v39);
  v61 = v40;
  v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)&v61, 1);
  objc_msgSend_setRecordZoneIDs_(v4, v43, (uint64_t)v42, v44);

  char AssetContents = objc_msgSend_shouldFetchAssetContents(self, v45, v46, v47);
  if (v4)
  {
    *((unsigned char *)v4 + 144) = AssetContents;
    *((void *)v4 + 21) = objc_msgSend_changeTypesFromSetCallbacks(self, v49, v50, v51);
  }
  else
  {
    objc_msgSend_changeTypesFromSetCallbacks(self, v49, v50, v51);
  }
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v52, v53, v54);
  objc_msgSend_setFetchAllChanges_(v4, v56, AllChanges, v57);
  objc_msgSend_setErrorReportingStyle_(v4, v58, 2, v59);
  v60.receiver = self;
  v60.super_class = (Class)CKFetchRecordChangesOperation;
  [(CKDatabaseOperation *)&v60 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v60.receiver = self;
  v60.super_class = (Class)CKFetchRecordChangesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v60 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_configurationsByRecordZoneID(v4, v5, v6, v7, v60.receiver, v60.super_class);
  uint64_t v12 = objc_msgSend_allKeys(v8, v9, v10, v11);
  v16 = objc_msgSend_firstObject(v12, v13, v14, v15);

  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v8, v17, (uint64_t)v16, v18);
  uint64_t v23 = objc_msgSend_recordZoneIDs(v4, v20, v21, v22);
  v27 = objc_msgSend_firstObject(v23, v24, v25, v26);
  objc_msgSend_setRecordZoneID_(self, v28, (uint64_t)v27, v29);

  v33 = objc_msgSend_previousServerChangeToken(v19, v30, v31, v32);
  objc_msgSend_setPreviousServerChangeToken_(self, v34, (uint64_t)v33, v35);

  uint64_t v39 = objc_msgSend_desiredKeys(v19, v36, v37, v38);
  objc_msgSend_setDesiredKeys_(self, v40, (uint64_t)v39, v41);

  uint64_t v45 = objc_msgSend_resultsLimit(v19, v42, v43, v44);
  objc_msgSend_setResultsLimit_(self, v46, v45, v47);
  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v48, v49, v50);
  objc_msgSend_setShouldFetchAssetContents_(self, v52, AssetContents, v53);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v4, v54, v55, v56);

  objc_msgSend_setFetchAllChanges_(self, v58, AllChanges, v59);
}

- (int64_t)changeTypesFromSetCallbacks
{
  return 2;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v25.receiver = self;
  v25.super_class = (Class)CKFetchRecordChangesOperation;
  if ([(CKOperation *)&v25 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordChangedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordWithIDWasDeletedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_serverChangeTokenFetchedBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v22 = objc_msgSend_changeTokensUpdatedBlock(self, v15, v16, v17);
        if (v22)
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v23 = objc_msgSend_fetchRecordChangesCompletionBlock(self, v19, v20, v21);
          BOOL v6 = v23 != 0;
        }
      }
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  BOOL v6 = objc_msgSend_recordZoneID(self, a2, (uint64_t)a3, v3);

  if (v6)
  {
    uint64_t v10 = objc_msgSend_recordZoneID(self, v7, v8, v9);
    int v12 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v11, (uint64_t)v10, (uint64_t)a3);

    if (v12)
    {
      v17.receiver = self;
      v17.super_class = (Class)CKFetchRecordChangesOperation;
      return [(CKDatabaseOperation *)&v17 CKOperationShouldRun:a3];
    }
  }
  else if (a3)
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKErrorDomain", 12, @"property recordZoneID must not be nil for %@", v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordChangesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_recordZoneID(self, v5, v6, v7);
    int v12 = objc_msgSend_previousServerChangeToken(self, v9, v10, v11);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 2048;
    uint64_t v22 = objc_msgSend_resultsLimit(self, v13, v14, v15);
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Fetching changes from the server for zone %@ with change token %{public}@. Fetching %lu items at a time.", buf, 0x20u);
  }
  v16.receiver = self;
  v16.super_class = (Class)CKFetchRecordChangesOperation;
  [(CKOperation *)&v16 performCKOperation];
}

- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v15 = signpost;

  if (v13)
  {
    if (v15)
    {
      if (self) {
        __int16 v19 = self->super.super._signpost;
      }
      else {
        __int16 v19 = 0;
      }
      uint64_t v20 = v19;
      id v24 = objc_msgSend_log(v20, v21, v22, v23);

      if (self) {
        objc_super v25 = self->super.super._signpost;
      }
      else {
        objc_super v25 = 0;
      }
      uint64_t v26 = v25;
      os_signpost_id_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        int v84 = 138412546;
        id v85 = v8;
        __int16 v86 = 2112;
        v87 = v13;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchRecordChangesOperation", "Record %@ changed with error: %@", (uint8_t *)&v84, 0x16u);
      }
    }
    uint64_t v31 = objc_msgSend_recordErrors(self, v16, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);

    id v9 = 0;
    goto LABEL_14;
  }
  if (v15)
  {
    if (self) {
      v40 = self->super.super._signpost;
    }
    else {
      v40 = 0;
    }
    uint64_t v41 = v40;
    uint64_t v45 = objc_msgSend_log(v41, v42, v43, v44);

    if (self) {
      uint64_t v46 = self->super.super._signpost;
    }
    else {
      uint64_t v46 = 0;
    }
    uint64_t v47 = v46;
    os_signpost_id_t v51 = objc_msgSend_identifier(v47, v48, v49, v50);

    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      int v84 = 138412290;
      id v85 = v8;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v45, OS_SIGNPOST_EVENT, v51, "CKFetchRecordChangesOperation", "Record %@ changed", (uint8_t *)&v84, 0xCu);
    }
  }
  if (v9)
  {
    v52 = objc_msgSend_recordChangedBlock(self, v16, v17, v18);

    if (v52)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v53 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v71 = v53;
        v75 = objc_msgSend_operationID(self, v72, v73, v74);
        if (objc_msgSend_isMergeableValueDeltaRecord(v9, v76, v77, v78)) {
          v82 = @"mergeable delta partial ";
        }
        else {
          v82 = &stru_1ED7F5C98;
        }
        v83 = objc_msgSend_recordID(v9, v79, v80, v81);
        int v84 = 138543874;
        id v85 = v75;
        __int16 v86 = 2112;
        v87 = v82;
        __int16 v88 = 2112;
        v89 = v83;
        _os_log_debug_impl(&dword_18AF10000, v71, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed %@record with id %@", (uint8_t *)&v84, 0x20u);
      }
      objc_msgSend_recordChangedBlock(self, v54, v55, v56);
      uint64_t v57 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
      v57[2](v57, v9);
      goto LABEL_34;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v58 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v57 = v58;
      v62 = objc_msgSend_operationID(self, v59, v60, v61);
      if (objc_msgSend_isMergeableValueDeltaRecord(v9, v63, v64, v65)) {
        v69 = @"mergeable delta partial ";
      }
      else {
        v69 = &stru_1ED7F5C98;
      }
      v70 = objc_msgSend_recordID(v9, v66, v67, v68);
      int v84 = 138543874;
      id v85 = v62;
      __int16 v86 = 2112;
      v87 = v69;
      __int16 v88 = 2112;
      v89 = v70;
      _os_log_debug_impl(&dword_18AF10000, (os_log_t)v57, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a changed %@record (%@), but no recordChangedBlock has been set.", (uint8_t *)&v84, 0x20u);

LABEL_34:
    }
  }
LABEL_14:
  v33 = objc_msgSend_configuration(self, v16, v17, v18);
  uint64_t v37 = objc_msgSend_container(v33, v34, v35, v36);
  objc_msgSend_handleRecordChanged_changeType_record_error_(v37, v38, (uint64_t)v8, 1, v9, v13);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v39 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v84 = 138412290;
    id v85 = v8;
    _os_log_debug_impl(&dword_18AF10000, v39, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v84, 0xCu);
  }
}

- (void)handleDeleteForRecordID:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      objc_super v16 = self->super.super._signpost;
    }
    else {
      objc_super v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v48 = 138412290;
      id v49 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordChangesOperation", "Record %@ deleted", (uint8_t *)&v48, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_recordWithIDWasDeletedBlock(self, v7, v8, v9);

  if (v22)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v23 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = v23;
      uint64_t v43 = objc_msgSend_operationID(self, v40, v41, v42);
      int v48 = 138543618;
      id v49 = v43;
      __int16 v50 = 2112;
      id v51 = v4;
      _os_log_debug_impl(&dword_18AF10000, v39, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted record with id %@", (uint8_t *)&v48, 0x16u);
    }
    objc_msgSend_recordWithIDWasDeletedBlock(self, v24, v25, v26);
    v27 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v27[2](v27, v4);
    goto LABEL_18;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v31 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v27 = v31;
    uint64_t v47 = objc_msgSend_operationID(self, v44, v45, v46);
    int v48 = 138543618;
    id v49 = v47;
    __int16 v50 = 2112;
    id v51 = v4;
    _os_log_debug_impl(&dword_18AF10000, (os_log_t)v27, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a deleted record (%@), but no recordWithIDWasDeletedBlock has been set.", (uint8_t *)&v48, 0x16u);

LABEL_18:
  }
  uint64_t v32 = objc_msgSend_configuration(self, v28, v29, v30);
  uint64_t v36 = objc_msgSend_container(v32, v33, v34, v35);
  objc_msgSend_handleRecordChanged_changeType_record_error_(v36, v37, (uint64_t)v4, 3, 0, 0);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v38 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v48 = 138412290;
    id v49 = v4;
    _os_log_debug_impl(&dword_18AF10000, v38, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v48, 0xCu);
  }
}

- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 reply:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v14 = signpost;

  if (v14)
  {
    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    uint64_t v23 = objc_msgSend_log(v19, v20, v21, v22);

    if (self) {
      id v24 = self->super.super._signpost;
    }
    else {
      id v24 = 0;
    }
    uint64_t v25 = v24;
    os_signpost_id_t v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v23, OS_SIGNPOST_EVENT, v29, "CKFetchRecordChangesOperation", "Progress callback", (uint8_t *)&v68, 2u);
    }
  }
  if (a5 != -1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v63 = v30;
      uint64_t v67 = objc_msgSend_operationID(self, v64, v65, v66);
      int v68 = 138543618;
      v69 = v67;
      __int16 v70 = 2048;
      int64_t v71 = a5;
      _os_log_debug_impl(&dword_18AF10000, v63, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating recordChangesStatus to %ld", (uint8_t *)&v68, 0x16u);
    }
    objc_msgSend_setStatus_(self, v31, a5, v32);
  }
  v33 = objc_msgSend_changeTokensUpdatedBlock(self, v15, v16, v17);
  if (v33)
  {

LABEL_21:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v38 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v58 = v38;
      v62 = objc_msgSend_operationID(self, v59, v60, v61);
      int v68 = 138543874;
      v69 = v62;
      __int16 v70 = 2114;
      int64_t v71 = (int64_t)v10;
      __int16 v72 = 2114;
      id v73 = v11;
      _os_log_debug_impl(&dword_18AF10000, v58, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@, client change token data %{public}@", (uint8_t *)&v68, 0x20u);
    }
    uint64_t v42 = objc_msgSend_changeTokensUpdatedBlock(self, v39, v40, v41);

    if (v42)
    {
      objc_msgSend_changeTokensUpdatedBlock(self, v43, v44, v45);
      uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id))v46)[2](v46, v10, v11);
    }
    else
    {
      uint64_t v47 = objc_msgSend_serverChangeTokenFetchedBlock(self, v43, v44, v45);

      if (!v47) {
        goto LABEL_30;
      }
      objc_msgSend_serverChangeTokenFetchedBlock(self, v48, v49, v50);
      uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void, void, void), id))v46[2])(v46, v10);
    }

LABEL_30:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    goto LABEL_32;
  }
  uint64_t v37 = objc_msgSend_serverChangeTokenFetchedBlock(self, v34, v35, v36);

  if (v37) {
    goto LABEL_21;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v52 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v53 = v52;
    uint64_t v57 = objc_msgSend_operationID(self, v54, v55, v56);
    int v68 = 138543874;
    v69 = v57;
    __int16 v70 = 2114;
    int64_t v71 = (int64_t)v10;
    __int16 v72 = 2114;
    id v73 = v11;
    _os_log_debug_impl(&dword_18AF10000, v53, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a server change token (%{public}@) and client change token data (%{public}@), but neither changeTokensUpdatedBlock nor serverChangeTokenFetchedBlock has been set.", (uint8_t *)&v68, 0x20u);

    goto LABEL_30;
  }
LABEL_32:
  id v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v68) = 0;
    _os_log_debug_impl(&dword_18AF10000, v51, OS_LOG_TYPE_DEBUG, "Progress callback for change tokens is done", (uint8_t *)&v68, 2u);
  }
  v12[2](v12, 0);
}

- (void)handleOperationDidCompleteWithServerChangeToken:(id)a3 clientChangeTokenData:(id)a4 recordChangesStatus:(int64_t)a5 metrics:(id)a6 error:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  objc_msgSend_setResultServerChangeToken_(self, v16, (uint64_t)v12, v17);
  objc_msgSend_setResultClientChangeTokenData_(self, v18, (uint64_t)v13, v19);
  if (a5 != -1) {
    objc_msgSend_setStatus_(self, v20, a5, v21);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v22 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = v22;
    uint64_t v27 = objc_msgSend_operationID(self, v24, v25, v26);
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v27;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    __int16 v35 = 2048;
    int64_t v36 = a5;
    _os_log_debug_impl(&dword_18AF10000, v23, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with server change token %{public}@, client change token data %{public}@, status %ld", buf, 0x2Au);
  }
  v28.receiver = self;
  v28.super_class = (Class)CKFetchRecordChangesOperation;
  [(CKOperation *)&v28 handleOperationDidCompleteWithMetrics:v15 error:v14];
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super.super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordChangesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_recordErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      __int16 v31 = objc_msgSend_recordErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Couldn't fetch some records when fetching changes");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  id v34 = objc_msgSend_recordZoneID(self, v7, v8, v9);

  if (v34)
  {
    uint64_t v38 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v39 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v40 = objc_msgSend_recordZoneID(self, v35, v36, v37);
    uint64_t v43 = objc_msgSend_arrayWithObjects_(v39, v41, (uint64_t)v40, v42, 0);
    uint64_t v46 = objc_msgSend_setWithArray_(v38, v44, (uint64_t)v43, v45);

    uint64_t v49 = objc_msgSend_zoneIDsToZoneNamesString_(self, v47, (uint64_t)v46, v48);
    uint64_t v53 = objc_msgSend_operationMetric(self, v50, v51, v52);
    objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)v49, @"zoneNames");
  }
  uint64_t v55 = objc_msgSend_fetchRecordChangesCompletionBlock(self, v35, v36, v37);

  if (v55)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v56 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v87 = objc_msgSend_operationID(self, v57, v58, v59);
      objc_msgSend_resultServerChangeToken(self, v88, v89, v90);
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resultClientChangeTokenData(self, v92, v93, v94);
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v99 = &stru_1ED7F5C98;
      if (v4) {
        v100 = @" Error was: ";
      }
      else {
        v100 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v95, v96, v97);
        v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v109 = v87;
      __int16 v110 = 2112;
      v111 = v91;
      __int16 v112 = 2114;
      v113 = v98;
      __int16 v114 = 2114;
      v115 = v100;
      __int16 v116 = 2112;
      v117 = v99;
      _os_log_debug_impl(&dword_18AF10000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. Server change token is %@, client change token data is %{public}@.%{public}@%@", buf, 0x34u);
      if (v4) {
    }
      }
    objc_msgSend_fetchRecordChangesCompletionBlock(self, v60, v61, v62);
    uint64_t v66 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      uint64_t v67 = 0;
      int v68 = 0;
    }
    else
    {
      uint64_t v67 = objc_msgSend_resultServerChangeToken(self, v63, v64, v65);
      int v68 = objc_msgSend_resultClientChangeTokenData(self, v75, v76, v77);
    }
    uint64_t v78 = objc_msgSend_CKClientSuitableError(v4, v63, v64, v65);
    ((void (**)(void, void *, void *, void *))v66)[2](v66, v67, v68, v78);

    if (!v4)
    {
    }
    objc_msgSend_setFetchRecordChangesCompletionBlock_(self, v79, 0, v80);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v69 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      v104 = objc_msgSend_operationID(self, v70, v71, v72);
      v105 = &stru_1ED7F5C98;
      if (v4) {
        v106 = @" Error was: ";
      }
      else {
        v106 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v101, v102, v103);
        v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v109 = v104;
      __int16 v110 = 2114;
      v111 = v106;
      __int16 v112 = 2112;
      v113 = v105;
      _os_log_debug_impl(&dword_18AF10000, v69, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchRecordChangesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
  }
  objc_msgSend_setRecordChangedBlock_(self, v73, 0, v74);
  objc_msgSend_setRecordWithIDWasDeletedBlock_(self, v81, 0, v82);
  objc_msgSend_setServerChangeTokenFetchedBlock_(self, v83, 0, v84);
  objc_msgSend_setChangeTokensUpdatedBlock_(self, v85, 0, v86);
  v107.receiver = self;
  v107.super_class = (Class)CKFetchRecordChangesOperation;
  [(CKOperation *)&v107 _finishOnCallbackQueueWithError:v4];
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
    uint64_t v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super.super._signpost;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      objc_super v28 = objc_msgSend_group(self, v25, v26, v27);
      id v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
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
      v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    id v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-record-changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleChangeForRecordID_record_error_, 2, 0);

  uint64_t v7 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleOperationDidCompleteWithServerChangeToken_clientChangeTokenData_recordChangesStatus_metrics_error_, 4, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKFetchRecordChangesOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithServerChangeToken_clientChangeTokenData_recordChangesStatus_metrics_error_;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(CKRecordZoneID *)recordZoneID
{
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
}

- (CKServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (void)setResultClientChangeTokenData:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
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

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong(&self->_changeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_serverChangeTokenFetchedBlock, 0);
  objc_storeStrong(&self->_fetchRecordChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);

  objc_storeStrong(&self->_recordChangedBlock, 0);
}

@end