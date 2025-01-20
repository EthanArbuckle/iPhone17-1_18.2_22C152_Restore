@interface CKFetchDatabaseChangesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)fetchAllChanges;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchDatabaseChangesOperation)init;
- (CKFetchDatabaseChangesOperation)initWithPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (CKServerChangeToken)previousServerChangeToken;
- (CKServerChangeToken)serverChangeToken;
- (NSMutableSet)zoneIDsForMetrics;
- (NSUInteger)resultsLimit;
- (id)activityCreate;
- (id)fetchDatabaseChangesCompletionBlock_wrapper;
- (id)recordZoneWithIDChangedBlock_wrapper;
- (id)recordZoneWithIDWasDeletedBlock_wrapper;
- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper;
- (id)recordZoneWithIDWasPurgedBlock_wrapper;
- (int64_t)status;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)changeTokenUpdatedBlock;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchDatabaseChangesCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleChangeForRecordZoneID:(id)a3;
- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 databaseChangesStatus:(int64_t)a4 error:(id)a5 reply:(id)a6;
- (void)handleDeleteForRecordZoneID:(id)a3;
- (void)handleEncryptedDataResetForRecordZoneID:(id)a3;
- (void)handlePurgeForRecordZoneID:(id)a3;
- (void)performCKOperation;
- (void)recordZoneWithIDChangedBlock;
- (void)recordZoneWithIDWasDeletedBlock;
- (void)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
- (void)recordZoneWithIDWasPurgedBlock;
- (void)setChangeTokenUpdatedBlock:(void *)changeTokenUpdatedBlock;
- (void)setFetchAllChanges:(BOOL)fetchAllChanges;
- (void)setFetchDatabaseChangesCompletionBlock:(void *)fetchDatabaseChangesCompletionBlock;
- (void)setFetchDatabaseChangesCompletionBlock_wrapper:(id)a3;
- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken;
- (void)setRecordZoneWithIDChangedBlock:(void *)recordZoneWithIDChangedBlock;
- (void)setRecordZoneWithIDChangedBlock_wrapper:(id)a3;
- (void)setRecordZoneWithIDWasDeletedBlock:(void *)recordZoneWithIDWasDeletedBlock;
- (void)setRecordZoneWithIDWasDeletedBlock_wrapper:(id)a3;
- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(void *)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper:(id)a3;
- (void)setRecordZoneWithIDWasPurgedBlock:(void *)recordZoneWithIDWasPurgedBlock;
- (void)setRecordZoneWithIDWasPurgedBlock_wrapper:(id)a3;
- (void)setResultsLimit:(NSUInteger)resultsLimit;
- (void)setServerChangeToken:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setZoneIDsForMetrics:(id)a3;
@end

@implementation CKFetchDatabaseChangesOperation

- (CKFetchDatabaseChangesOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKFetchDatabaseChangesOperation;
  v2 = [(CKOperation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_fetchAllChanges = 1;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    zoneIDsForMetrics = v3->_zoneIDsForMetrics;
    v3->_zoneIDsForMetrics = v4;
  }
  return v3;
}

- (CKFetchDatabaseChangesOperation)initWithPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  v4 = previousServerChangeToken;
  v11 = (CKFetchDatabaseChangesOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_previousServerChangeToken;
    v11->_previousServerChangeToken = (CKServerChangeToken *)v12;
  }
  return v11;
}

- (void)setRecordZoneWithIDChangedBlock:(void *)recordZoneWithIDChangedBlock
{
  id v7 = recordZoneWithIDChangedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08B6AC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneWithIDChangedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordZoneWithIDChangedBlock;
    self->_recordZoneWithIDChangedBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneWithIDChangedBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08B8A4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDChangedBlock);
  }

  return v8;
}

- (void)setRecordZoneWithIDWasDeletedBlock:(void *)recordZoneWithIDWasDeletedBlock
{
  id v7 = recordZoneWithIDWasDeletedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08BA30;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneWithIDWasDeletedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordZoneWithIDWasDeletedBlock;
    self->_recordZoneWithIDWasDeletedBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneWithIDWasDeletedBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08BC28;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasDeletedBlock);
  }

  return v8;
}

- (void)setRecordZoneWithIDWasPurgedBlock:(void *)recordZoneWithIDWasPurgedBlock
{
  id v7 = recordZoneWithIDWasPurgedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08BDB4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneWithIDWasPurgedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordZoneWithIDWasPurgedBlock;
    self->_recordZoneWithIDWasPurgedBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneWithIDWasPurgedBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08BFAC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasPurgedBlock);
  }

  return v8;
}

- (void)setChangeTokenUpdatedBlock:(void *)changeTokenUpdatedBlock
{
  id v7 = changeTokenUpdatedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08C138;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_changeTokenUpdatedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_changeTokenUpdatedBlock;
    self->_changeTokenUpdatedBlock = v11;
LABEL_9:
  }
}

- (void)changeTokenUpdatedBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08C330;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_changeTokenUpdatedBlock);
  }

  return v8;
}

- (void)setFetchDatabaseChangesCompletionBlock:(void *)fetchDatabaseChangesCompletionBlock
{
  id v7 = fetchDatabaseChangesCompletionBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08C4BC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_fetchDatabaseChangesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_fetchDatabaseChangesCompletionBlock;
    self->_fetchDatabaseChangesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchDatabaseChangesCompletionBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08C6B4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchDatabaseChangesCompletionBlock);
  }

  return v8;
}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(void *)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
{
  id v7 = recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B08C840;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
    self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
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
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13D28;
    v16 = sub_18AF138C8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08CA38;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  objc_msgSend_setPreviousServerChangeToken_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_resultsLimit(self, v11, v12, v13);
  objc_msgSend_setResultsLimit_(v4, v15, v14, v16);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v17, v18, v19);
  objc_msgSend_setFetchAllChanges_(v4, v21, AllChanges, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKFetchDatabaseChangesOperation;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKFetchDatabaseChangesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v23 fillFromOperationInfo:v4];
  v8 = objc_msgSend_previousServerChangeToken(v4, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setPreviousServerChangeToken_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_resultsLimit(v4, v11, v12, v13);
  objc_msgSend_setResultsLimit_(self, v15, v14, v16);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v4, v17, v18, v19);

  objc_msgSend_setFetchAllChanges_(self, v21, AllChanges, v22);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v21.receiver = self;
  v21.super_class = (Class)CKFetchDatabaseChangesOperation;
  if ([(CKOperation *)&v21 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordZoneWithIDChangedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_fetchDatabaseChangesCompletionBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock(self, v15, v16, v17);
        BOOL v6 = v19 != 0;
      }
    }
  }
  return v6;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchDatabaseChangesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
    unint64_t v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
    uint64_t v13 = CKDatabaseScopeString(v12);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v13;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Fetching database changes with operation %{public}@ for database scope %{public}@", buf, 0x16u);
  }
  v14.receiver = self;
  v14.super_class = (Class)CKFetchDatabaseChangesOperation;
  [(CKOperation *)&v14 performCKOperation];
}

- (void)handleChangeForRecordZoneID:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    __int16 v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v41 = 138412290;
      id v42 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ changed", (uint8_t *)&v41, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  v28 = objc_msgSend_recordZoneWithIDChangedBlock_wrapper(self, v25, v26, v27);
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    v34 = objc_msgSend_recordZoneWithIDChangedBlock(self, v29, v30, v31);
    v33 = (void (**)(void *, id))_Block_copy(v34);
  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v36 = v35;
      v40 = objc_msgSend_operationID(self, v37, v38, v39);
      int v41 = 138543618;
      id v42 = v40;
      __int16 v43 = 2112;
      id v44 = v4;
      _os_log_debug_impl(&dword_18AF10000, v36, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed zone with ID %@", (uint8_t *)&v41, 0x16u);
    }
    v33[2](v33, v4);
  }
}

- (void)handleDeleteForRecordZoneID:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    __int16 v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v41 = 138412290;
      id v42 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ deleted", (uint8_t *)&v41, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  v28 = objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v25, v26, v27);
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    v34 = objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v29, v30, v31);
    v33 = (void (**)(void *, id))_Block_copy(v34);
  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v36 = v35;
      v40 = objc_msgSend_operationID(self, v37, v38, v39);
      int v41 = 138543618;
      id v42 = v40;
      __int16 v43 = 2112;
      id v44 = v4;
      _os_log_debug_impl(&dword_18AF10000, v36, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted zone with ID %@", (uint8_t *)&v41, 0x16u);
    }
    v33[2](v33, v4);
  }
}

- (void)handlePurgeForRecordZoneID:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    __int16 v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v60 = 138412290;
      id v61 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ purged", (uint8_t *)&v60, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  v28 = objc_msgSend_recordZoneWithIDWasPurgedBlock_wrapper(self, v25, v26, v27);
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    v34 = objc_msgSend_recordZoneWithIDWasPurgedBlock(self, v29, v30, v31);
    v33 = (void (**)(void *, id))_Block_copy(v34);
  }
  uint64_t v38 = objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v35, v36, v37);
  id v42 = v38;
  if (v38)
  {
    __int16 v43 = (void (**)(void *, id))_Block_copy(v38);
  }
  else
  {
    id v44 = objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v39, v40, v41);
    __int16 v43 = (void (**)(void *, id))_Block_copy(v44);
  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v45 = (void *)ck_log_facility_ck;
    BOOL v46 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v33;
    if (v46)
    {
      v48 = v45;
      v52 = objc_msgSend_operationID(self, v49, v50, v51);
      int v60 = 138543618;
      id v61 = v52;
      __int16 v62 = 2112;
      id v63 = v4;
      _os_log_debug_impl(&dword_18AF10000, v48, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a purged zone with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v33;
    }
LABEL_28:
    v47[2](v47, v4);
    goto LABEL_29;
  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v53 = (void *)ck_log_facility_ck;
    BOOL v54 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v43;
    if (v54)
    {
      v55 = v53;
      v59 = objc_msgSend_operationID(self, v56, v57, v58);
      int v60 = 138543618;
      id v61 = v59;
      __int16 v62 = 2112;
      id v63 = v4;
      _os_log_debug_impl(&dword_18AF10000, v55, OS_LOG_TYPE_DEBUG, "Operation %{public}@ making a delete callback about a purged zone with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v43;
    }
    goto LABEL_28;
  }
LABEL_29:
}

- (void)handleEncryptedDataResetForRecordZoneID:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    __int16 v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v60 = 138412290;
      id v61 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Record zone %@ encrypted data reset", (uint8_t *)&v60, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  objc_msgSend_addObject_(v22, v23, (uint64_t)v4, v24);

  v28 = objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper(self, v25, v26, v27);
  v32 = v28;
  if (v28)
  {
    v33 = (void (**)(void *, id))_Block_copy(v28);
  }
  else
  {
    v34 = objc_msgSend_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock(self, v29, v30, v31);
    v33 = (void (**)(void *, id))_Block_copy(v34);
  }
  uint64_t v38 = objc_msgSend_recordZoneWithIDWasDeletedBlock_wrapper(self, v35, v36, v37);
  id v42 = v38;
  if (v38)
  {
    __int16 v43 = (void (**)(void *, id))_Block_copy(v38);
  }
  else
  {
    id v44 = objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v39, v40, v41);
    __int16 v43 = (void (**)(void *, id))_Block_copy(v44);
  }
  if (v33)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v45 = (void *)ck_log_facility_ck;
    BOOL v46 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v33;
    if (v46)
    {
      v48 = v45;
      v52 = objc_msgSend_operationID(self, v49, v50, v51);
      int v60 = 138543618;
      id v61 = v52;
      __int16 v62 = 2112;
      id v63 = v4;
      _os_log_debug_impl(&dword_18AF10000, v48, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a zone deleted due to encrypted data reset with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v33;
    }
LABEL_28:
    v47[2](v47, v4);
    goto LABEL_29;
  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v53 = (void *)ck_log_facility_ck;
    BOOL v54 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG);
    v47 = v43;
    if (v54)
    {
      v55 = v53;
      v59 = objc_msgSend_operationID(self, v56, v57, v58);
      int v60 = 138543618;
      id v61 = v59;
      __int16 v62 = 2112;
      id v63 = v4;
      _os_log_debug_impl(&dword_18AF10000, v55, OS_LOG_TYPE_DEBUG, "Operation %{public}@ making a delete callback about a zone deleted due to encrypted data reset with ID %@", (uint8_t *)&v60, 0x16u);

      v47 = v43;
    }
    goto LABEL_28;
  }
LABEL_29:
}

- (void)handleChangeSetCompletionWithServerChangeToken:(id)a3 databaseChangesStatus:(int64_t)a4 error:(id)a5 reply:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void *))a6;
  id v15 = objc_msgSend_CKClientSuitableError(a5, v12, v13, v14);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  __int16 v17 = signpost;

  if (v15)
  {
    if (!v17) {
      goto LABEL_22;
    }
    if (self) {
      os_signpost_id_t v21 = self->super.super._signpost;
    }
    else {
      os_signpost_id_t v21 = 0;
    }
    uint64_t v22 = v21;
    uint64_t v26 = objc_msgSend_log(v22, v23, v24, v25);

    if (self) {
      uint64_t v27 = self->super.super._signpost;
    }
    else {
      uint64_t v27 = 0;
    }
    v28 = v27;
    uint64_t v32 = objc_msgSend_identifier(v28, v29, v30, v31);

    if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26)) {
      goto LABEL_21;
    }
    *(_DWORD *)v81 = 138412546;
    *(void *)&v81[4] = v10;
    *(_WORD *)&v81[12] = 2112;
    *(void *)&v81[14] = v15;
    v33 = "Server change token updated to %@ with error: %@";
    v34 = v26;
    os_signpost_id_t v35 = v32;
    uint32_t v36 = 22;
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_22;
  }
  if (self) {
    uint64_t v37 = self->super.super._signpost;
  }
  else {
    uint64_t v37 = 0;
  }
  uint64_t v38 = v37;
  uint64_t v26 = objc_msgSend_log(v38, v39, v40, v41);

  if (self) {
    id v42 = self->super.super._signpost;
  }
  else {
    id v42 = 0;
  }
  __int16 v43 = v42;
  uint64_t v47 = objc_msgSend_identifier(v43, v44, v45, v46);

  if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)v81 = 138412290;
    *(void *)&v81[4] = v10;
    v33 = "Server change token updated to %@";
    v34 = v26;
    os_signpost_id_t v35 = v47;
    uint32_t v36 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v34, OS_SIGNPOST_EVENT, v35, "CKFetchDatabaseChangesOperation", v33, v81, v36);
  }
LABEL_21:

LABEL_22:
  if (a4 != -1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v67 = v48;
      v71 = objc_msgSend_operationID(self, v68, v69, v70);
      *(_DWORD *)v81 = 138543618;
      *(void *)&v81[4] = v71;
      *(_WORD *)&v81[12] = 2048;
      *(void *)&v81[14] = a4;
      _os_log_debug_impl(&dword_18AF10000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating databaseChangesStatus to %ld", v81, 0x16u);
    }
    objc_msgSend_setStatus_(self, v49, a4, v50, *(_OWORD *)v81, *(void *)&v81[16], v82);
  }
  if (v10)
  {
    objc_msgSend_setServerChangeToken_(self, v18, (uint64_t)v10, v20);
    BOOL v54 = objc_msgSend_changeTokenUpdatedBlock(self, v51, v52, v53);

    if (v54)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v55 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v72 = v55;
        v76 = objc_msgSend_operationID(self, v73, v74, v75);
        *(_DWORD *)v81 = 138543618;
        *(void *)&v81[4] = v76;
        *(_WORD *)&v81[12] = 2114;
        *(void *)&v81[14] = v10;
        _os_log_debug_impl(&dword_18AF10000, v72, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@", v81, 0x16u);
      }
      objc_msgSend_changeTokenUpdatedBlock(self, v56, v57, v58, *(void *)v81, *(void *)&v81[8]);
      v59 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
      v59[2](v59, v10);
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    int v60 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v59 = v60;
      v80 = objc_msgSend_operationID(self, v77, v78, v79);
      *(_DWORD *)v81 = 138543618;
      *(void *)&v81[4] = v80;
      *(_WORD *)&v81[12] = 2114;
      *(void *)&v81[14] = v10;
      _os_log_debug_impl(&dword_18AF10000, (os_log_t)v59, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a server change token (%{public}@) but no changeTokenUpdatedBlock has been set.", v81, 0x16u);

LABEL_35:
    }
  }
  if (__sTestOverridesAvailable
    && (objc_msgSend_unitTestOverrides(self, v18, v19, v20),
        id v61 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v61, v62, @"FailMetasyncOperationDueToClientReturnedCancellationError", v63), uint64_t v64 = objc_claimAutoreleasedReturnValue(), v64, v61, v64))
  {
    v66 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v65, @"CKInternalErrorDomain", 1, @"Cancelling operation for tests");
  }
  else
  {
    v66 = 0;
  }
  v11[2](v11, v66);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
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
    uint64_t v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    __int16 v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchDatabaseChangesOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_zoneIDsForMetrics(self, v7, v8, v9);
  uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

  if (v26)
  {
    uint64_t v30 = objc_msgSend_zoneIDsForMetrics(self, v27, v28, v29);
    v33 = objc_msgSend_zoneIDsToZoneNamesString_(self, v31, (uint64_t)v30, v32);
    uint64_t v37 = objc_msgSend_operationMetric(self, v34, v35, v36);
    objc_msgSend_setObject_forKeyedSubscript_(v37, v38, (uint64_t)v33, @"zoneNames");
  }
  uint64_t v39 = objc_msgSend_fetchDatabaseChangesCompletionBlock_wrapper(self, v27, v28, v29);
  __int16 v43 = v39;
  if (v39)
  {
    id v44 = _Block_copy(v39);
  }
  else
  {
    uint64_t v45 = objc_msgSend_fetchDatabaseChangesCompletionBlock(self, v40, v41, v42);
    id v44 = _Block_copy(v45);
  }
  if (v44)
  {
    v49 = objc_msgSend_CKClientSuitableError(v4, v46, v47, v48);
    if (v49)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v50 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v85 = v50;
        v89 = objc_msgSend_operationID(self, v86, v87, v88);
        *(_DWORD *)buf = 138543618;
        v101 = v89;
        __int16 v102 = 2112;
        v103 = v49;
        _os_log_debug_impl(&dword_18AF10000, v85, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed - error:%@", buf, 0x16u);
      }
      (*((void (**)(void *, void, void, NSObject *))v44 + 2))(v44, 0, 0, v49);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v68 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v90 = v68;
        v94 = objc_msgSend_operationID(self, v91, v92, v93);
        v98 = objc_msgSend_serverChangeToken(self, v95, v96, v97);
        *(_DWORD *)buf = 138543618;
        v101 = v94;
        __int16 v102 = 2114;
        v103 = v98;
        _os_log_debug_impl(&dword_18AF10000, v90, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed - server-change-token:%{public}@", buf, 0x16u);
      }
      v72 = objc_msgSend_serverChangeToken(self, v69, v70, v71);
      BOOL v76 = objc_msgSend_status(self, v73, v74, v75) == 1;
      (*((void (**)(void *, void *, BOOL, void))v44 + 2))(v44, v72, v76, 0);
    }
    objc_msgSend_setFetchDatabaseChangesCompletionBlock_(self, v51, 0, v52);
    goto LABEL_34;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v53 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v49 = v53;
    v59 = objc_msgSend_operationID(self, v56, v57, v58);
    uint64_t v63 = objc_msgSend_serverChangeToken(self, v60, v61, v62);
    v67 = objc_msgSend_CKClientSuitableError(v4, v64, v65, v66);
    *(_DWORD *)buf = 138543874;
    v101 = v59;
    __int16 v102 = 2114;
    v103 = v63;
    __int16 v104 = 2112;
    v105 = v67;
    _os_log_debug_impl(&dword_18AF10000, v49, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchDatabaseChangesCompletionBlock - server-change-token:%{public}@, error:%@", buf, 0x20u);

LABEL_34:
  }
  objc_msgSend_setRecordZoneWithIDChangedBlock_(self, v54, 0, v55);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(self, v77, 0, v78);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(self, v79, 0, v80);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_(self, v81, 0, v82);
  objc_msgSend_setChangeTokenUpdatedBlock_(self, v83, 0, v84);
  v99.receiver = self;
  v99.super_class = (Class)CKFetchDatabaseChangesOperation;
  [(CKOperation *)&v99 _finishOnCallbackQueueWithError:v4];
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
      uint64_t v11 = self->super.super._signpost;
    }
    else {
      uint64_t v11 = 0;
    }
    unint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
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
      v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchDatabaseChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
    unint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchDatabaseChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-database-changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleChangeSetCompletionWithServerChangeToken_databaseChangesStatus_error_reply_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchDatabaseChangesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
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

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)fetchAllChanges
{
  self->_fetchuint64_t AllChanges = fetchAllChanges;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
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

- (NSMutableSet)zoneIDsForMetrics
{
  return self->_zoneIDsForMetrics;
}

- (void)setZoneIDsForMetrics:(id)a3
{
}

- (id)recordZoneWithIDChangedBlock_wrapper
{
  return self->_recordZoneWithIDChangedBlock_wrapper;
}

- (void)setRecordZoneWithIDChangedBlock_wrapper:(id)a3
{
}

- (id)recordZoneWithIDWasDeletedBlock_wrapper
{
  return self->_recordZoneWithIDWasDeletedBlock_wrapper;
}

- (void)setRecordZoneWithIDWasDeletedBlock_wrapper:(id)a3
{
}

- (id)recordZoneWithIDWasPurgedBlock_wrapper
{
  return self->_recordZoneWithIDWasPurgedBlock_wrapper;
}

- (void)setRecordZoneWithIDWasPurgedBlock_wrapper:(id)a3
{
}

- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper
{
  return self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper;
}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper:(id)a3
{
}

- (id)fetchDatabaseChangesCompletionBlock_wrapper
{
  return self->_fetchDatabaseChangesCompletionBlock_wrapper;
}

- (void)setFetchDatabaseChangesCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_zoneIDsForMetrics, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong(&self->_changeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);

  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
}

@end