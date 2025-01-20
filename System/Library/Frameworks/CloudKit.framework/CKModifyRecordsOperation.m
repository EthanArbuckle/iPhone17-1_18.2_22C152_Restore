@interface CKModifyRecordsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)_prepareFieldValuesForUploadWithError:(id *)a3;
- (BOOL)alwaysFetchPCSFromServer;
- (BOOL)atomic;
- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldOnlySaveAssetContent;
- (BOOL)shouldReportRecordsInFlight;
- (CKModifyRecordsOperation)init;
- (CKModifyRecordsOperation)initWithRecordsToSave:(NSArray *)records recordIDsToDelete:(NSArray *)recordIDs;
- (CKRecordSavePolicy)savePolicy;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)clientChangeTokenData;
- (NSDictionary)conflictLosersToResolveByRecordID;
- (NSDictionary)pluginFieldsForRecordDeletesByID;
- (NSDictionary)recordIDsToDeleteToEtags;
- (NSMutableArray)deletedRecordIDs;
- (NSMutableArray)savedRecords;
- (NSMutableDictionary)assetsByRecordIDAndRecordKey;
- (NSMutableDictionary)recordErrors;
- (NSMutableDictionary)recordsByRecordIDs;
- (NSMutableSet)packagesToDestroy;
- (id)activityCreate;
- (id)modifyRecordsCompletionBlock_wrapper;
- (id)perRecordDeleteBlock_wrapper;
- (id)perRecordProgressBlock_wrapper;
- (id)perRecordSaveBlock_wrapper;
- (id)recordsInFlightBlock;
- (id)recordsInFlightBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)destroyPackages:(id)a3;
- (void)destroyPackagesInRecords:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleDeleteForRecordID:(id)a3 error:(id)a4;
- (void)handleRecordIDsInFlight:(id)a3 reply:(id)a4;
- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4;
- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14;
- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5;
- (void)modifyRecordsCompletionBlock;
- (void)perRecordCompletionBlock;
- (void)perRecordDeleteBlock;
- (void)perRecordProgressBlock;
- (void)perRecordSaveBlock;
- (void)performCKOperation;
- (void)setAlwaysFetchPCSFromServer:(BOOL)a3;
- (void)setAssetsByRecordIDAndRecordKey:(id)a3;
- (void)setAtomic:(BOOL)atomic;
- (void)setClientChangeTokenData:(NSData *)clientChangeTokenData;
- (void)setConflictLosersToResolveByRecordID:(id)a3;
- (void)setDeletedRecordIDs:(id)a3;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
- (void)setModifyRecordsCompletionBlock:(void *)modifyRecordsCompletionBlock;
- (void)setModifyRecordsCompletionBlockIVar:(id)a3;
- (void)setModifyRecordsCompletionBlock_wrapper:(id)a3;
- (void)setPackagesToDestroy:(id)a3;
- (void)setPerRecordCompletionBlock:(void *)perRecordCompletionBlock;
- (void)setPerRecordDeleteBlock:(void *)perRecordDeleteBlock;
- (void)setPerRecordDeleteBlock_wrapper:(id)a3;
- (void)setPerRecordProgressBlock:(void *)perRecordProgressBlock;
- (void)setPerRecordProgressBlock_wrapper:(id)a3;
- (void)setPerRecordSaveBlock:(void *)perRecordSaveBlock;
- (void)setPerRecordSaveBlock_wrapper:(id)a3;
- (void)setPluginFieldsForRecordDeletesByID:(id)a3;
- (void)setRecordErrors:(id)a3;
- (void)setRecordIDsToDelete:(NSArray *)recordIDsToDelete;
- (void)setRecordIDsToDeleteToEtags:(id)a3;
- (void)setRecordsByRecordIDs:(id)a3;
- (void)setRecordsInFlightBlock:(id)a3;
- (void)setRecordsInFlightBlock_wrapper:(id)a3;
- (void)setRecordsToSave:(NSArray *)recordsToSave;
- (void)setSavePolicy:(CKRecordSavePolicy)savePolicy;
- (void)setSavedRecords:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldOnlySaveAssetContent:(BOOL)a3;
- (void)setShouldReportRecordsInFlight:(BOOL)a3;
@end

@implementation CKModifyRecordsOperation

- (CKModifyRecordsOperation)init
{
  v16.receiver = self;
  v16.super_class = (Class)CKModifyRecordsOperation;
  v2 = [(CKOperation *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordsByRecordIDs = v2->_recordsByRecordIDs;
    v2->_recordsByRecordIDs = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    savedRecords = v2->_savedRecords;
    v2->_savedRecords = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    deletedRecordIDs = v2->_deletedRecordIDs;
    v2->_deletedRecordIDs = (NSMutableArray *)v9;

    v2->_savePolicy = 0;
    uint64_t v11 = objc_opt_new();
    assetsByRecordIDAndRecordKey = v2->_assetsByRecordIDAndRecordKey;
    v2->_assetsByRecordIDAndRecordKey = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v13;

    v2->_atomic = 1;
  }
  return v2;
}

- (CKModifyRecordsOperation)initWithRecordsToSave:(NSArray *)records recordIDsToDelete:(NSArray *)recordIDs
{
  v6 = records;
  uint64_t v7 = recordIDs;
  v14 = (CKModifyRecordsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordsToSave = v14->_recordsToSave;
    v14->_recordsToSave = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    recordIDsToDelete = v14->_recordIDsToDelete;
    v14->_recordIDsToDelete = (NSArray *)v20;
  }
  return v14;
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
    v14[2] = sub_18B13438C;
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B134584;
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
    v14[2] = sub_18B134710;
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B134908;
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

- (void)setPerRecordSaveBlock:(void *)perRecordSaveBlock
{
  id v7 = perRecordSaveBlock;
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
    v14[2] = sub_18B134A94;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordSaveBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordSaveBlock;
    self->_perRecordSaveBlock = v11;
LABEL_9:
  }
}

- (void)perRecordSaveBlock
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B134C8C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordSaveBlock);
  }

  return v8;
}

- (void)setPerRecordDeleteBlock:(void *)perRecordDeleteBlock
{
  id v7 = perRecordDeleteBlock;
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
    v14[2] = sub_18B134E18;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordDeleteBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordDeleteBlock;
    self->_perRecordDeleteBlock = v11;
LABEL_9:
  }
}

- (void)perRecordDeleteBlock
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B135010;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordDeleteBlock);
  }

  return v8;
}

- (void)setModifyRecordsCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B13519C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id modifyRecordsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_modifyRecordsCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id modifyRecordsCompletionBlock = self->_modifyRecordsCompletionBlock;
    self->_id modifyRecordsCompletionBlock = v11;
LABEL_9:
  }
}

- (void)modifyRecordsCompletionBlock
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B135394;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_modifyRecordsCompletionBlock);
  }

  return v8;
}

- (void)setRecordsInFlightBlock:(id)a3
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
    v14[2] = sub_18B135520;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordsInFlightBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordsInFlightBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordsInFlightBlock = self->_recordsInFlightBlock;
    self->_id recordsInFlightBlock = v11;
LABEL_9:
  }
}

- (id)recordsInFlightBlock
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
    id v15 = sub_18AF140A0;
    objc_super v16 = sub_18AF13988;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B135718;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordsInFlightBlock);
  }

  return v8;
}

- (void)setModifyRecordsCompletionBlock:(void *)modifyRecordsCompletionBlock
{
  BOOL v4 = modifyRecordsCompletionBlock == 0;
  id v9 = modifyRecordsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifyRecordsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordsToSave(self, v5, v6, v7);
  objc_msgSend_setRecordsToSave_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  objc_msgSend_setRecordIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_savePolicy(self, v17, v18, v19);
  objc_msgSend_setSavePolicy_(v4, v21, v20, v22);
  v26 = objc_msgSend_clientChangeTokenData(self, v23, v24, v25);
  objc_msgSend_setClientChangeTokenData_(v4, v27, (uint64_t)v26, v28);

  uint64_t shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(self, v29, v30, v31);
  objc_msgSend_setShouldOnlySaveAssetContent_(v4, v33, shouldOnlySaveAssetContent, v34);
  v38 = objc_msgSend_recordIDsToDeleteToEtags(self, v35, v36, v37);
  objc_msgSend_setRecordIDsToDeleteToEtags_(v4, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_atomic(self, v41, v42, v43);
  objc_msgSend_setAtomic_(v4, v45, v44, v46);
  v50 = objc_msgSend_conflictLosersToResolveByRecordID(self, v47, v48, v49);
  objc_msgSend_setConflictLosersToResolveByRecordID_(v4, v51, (uint64_t)v50, v52);

  v56 = objc_msgSend_pluginFieldsForRecordDeletesByID(self, v53, v54, v55);
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(v4, v57, (uint64_t)v56, v58);

  v62 = objc_msgSend_recordsInFlightBlock(self, v59, v60, v61);
  objc_msgSend_setShouldReportRecordsInFlight_(v4, v63, v62 != 0, v64);

  uint64_t v68 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v65, v66, v67);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(v4, v69, v68, v70);
  uint64_t PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(self, v71, v72, v73);
  objc_msgSend_setAlwaysFetchPCSFromServer_(v4, v75, PCSFromServer, v76);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v77, v78, v79);
  objc_msgSend_setShouldCloneFileInAssetCache_(v4, v81, shouldCloneFileInAssetCache, v82);
  v83.receiver = self;
  v83.super_class = (Class)CKModifyRecordsOperation;
  [(CKDatabaseOperation *)&v83 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v77.receiver = self;
  v77.super_class = (Class)CKModifyRecordsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v77 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordsToSave(v4, v5, v6, v7, v77.receiver, v77.super_class);
  objc_msgSend_setRecordsToSave_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordIDsToDelete(v4, v11, v12, v13);
  objc_msgSend_setRecordIDsToDelete_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_savePolicy(v4, v17, v18, v19);
  objc_msgSend_setSavePolicy_(self, v21, v20, v22);
  v26 = objc_msgSend_clientChangeTokenData(v4, v23, v24, v25);
  objc_msgSend_setClientChangeTokenData_(self, v27, (uint64_t)v26, v28);

  uint64_t shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v4, v29, v30, v31);
  objc_msgSend_setShouldOnlySaveAssetContent_(self, v33, shouldOnlySaveAssetContent, v34);
  v38 = objc_msgSend_recordIDsToDeleteToEtags(v4, v35, v36, v37);
  objc_msgSend_setRecordIDsToDeleteToEtags_(self, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_atomic(v4, v41, v42, v43);
  objc_msgSend_setAtomic_(self, v45, v44, v46);
  v50 = objc_msgSend_conflictLosersToResolveByRecordID(v4, v47, v48, v49);
  objc_msgSend_setConflictLosersToResolveByRecordID_(self, v51, (uint64_t)v50, v52);

  v56 = objc_msgSend_pluginFieldsForRecordDeletesByID(v4, v53, v54, v55);
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(self, v57, (uint64_t)v56, v58);

  uint64_t v62 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(v4, v59, v60, v61);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(self, v63, v62, v64);
  uint64_t PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(v4, v65, v66, v67);
  objc_msgSend_setAlwaysFetchPCSFromServer_(self, v69, PCSFromServer, v70);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v4, v71, v72, v73);

  objc_msgSend_setShouldCloneFileInAssetCache_(self, v75, shouldCloneFileInAssetCache, v76);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v29.receiver = self;
  v29.super_class = (Class)CKModifyRecordsOperation;
  if ([(CKOperation *)&v29 hasCKOperationCallbacksSet]) {
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
      uint64_t v18 = objc_msgSend_perRecordSaveBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v22 = objc_msgSend_perRecordDeleteBlock(self, v15, v16, v17);
        if (v22)
        {
          BOOL v6 = 1;
        }
        else
        {
          v26 = objc_msgSend_recordsInFlightBlock(self, v19, v20, v21);
          if (v26)
          {
            BOOL v6 = 1;
          }
          else
          {
            v27 = objc_msgSend_modifyRecordsCompletionBlock(self, v23, v24, v25);
            BOOL v6 = v27 != 0;
          }
        }
      }
    }
  }
  return v6;
}

- (void)destroyPackages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_removeDB(*(void **)(*((void *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }
}

- (void)destroyPackagesInRecords:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_removePackages(*(void **)(*((void *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v549 = *MEMORY[0x1E4F143B8];
  v483 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v535 = 0u;
  long long v536 = 0u;
  long long v537 = 0u;
  long long v538 = 0u;
  v484 = self;
  objc_msgSend_recordIDsToDelete(self, v5, v6, v7);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v535, (uint64_t)v548, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v536;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v536 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v535 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v321 = (objc_class *)objc_opt_class();
            v322 = NSStringFromClass(v321);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v323, @"CKErrorDomain", 12, @"Unexpected recordID in property recordIDsToDelete passed to %@: %@", v322, v13);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_130;
        }
        if (objc_msgSend_containsObject_(v4, v14, v13, v15))
        {
          if (a3)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKErrorDomain", 12, @"You can't delete the same record (%@) twice in a single operation", v13);
            BOOL v324 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_137;
          }
LABEL_130:
          BOOL v324 = 0;
          goto LABEL_137;
        }
        objc_msgSend_addObject_(v4, v16, v13, v17);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v535, (uint64_t)v548, 16);
    }
    while (v10);
  }

  obuint64_t j = (id)objc_opt_new();
  v482 = objc_opt_new();
  long long v531 = 0u;
  long long v532 = 0u;
  long long v533 = 0u;
  long long v534 = 0u;
  uint64_t v19 = v484;
  objc_msgSend_recordsToSave(v484, v20, v21, v22);
  id v480 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v480, v23, (uint64_t)&v531, (uint64_t)v547, 16);
  v486 = v4;
  uint64_t v25 = a3;
  if (!v24) {
    goto LABEL_123;
  }
  uint64_t v26 = v24;
  uint64_t v27 = *(void *)v532;
  uint64_t v475 = *(void *)v532;
  do
  {
    uint64_t v28 = 0;
    uint64_t v476 = v26;
    do
    {
      if (*(void *)v532 != v27)
      {
        uint64_t v29 = v28;
        objc_enumerationMutation(v480);
        uint64_t v28 = v29;
      }
      uint64_t v478 = v28;
      uint64_t v30 = *(void **)(*((void *)&v531 + 1) + 8 * v28);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v25) {
          goto LABEL_134;
        }
        v431 = (objc_class *)objc_opt_class();
        v479 = NSStringFromClass(v431);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v432, @"CKErrorDomain", 12, @"Unexpected record in property recordsToSave passed to %@: %@", v479, v30);
LABEL_180:
        *uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      v479 = objc_msgSend_recordID(v30, v31, v32, v33);
      if (objc_msgSend_containsObject_(v4, v34, (uint64_t)v479, v35))
      {
        if (!v25) {
          goto LABEL_133;
        }
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v36, @"CKErrorDomain", 12, @"You can't save and delete the same record (%@) in a single operation", v479, v472);
        goto LABEL_180;
      }
      v39 = objc_msgSend_configuration(v19, v36, v37, v38);
      uint64_t v43 = objc_msgSend_container(v39, v40, v41, v42);
      objc_msgSend_options(v43, v44, v45, v46);
      v47 = v487 = v30;
      int v51 = objc_msgSend_useZoneWidePCS(v47, v48, v49, v50);

      uint64_t v52 = v487;
      if (!v51) {
        goto LABEL_20;
      }
      v56 = objc_msgSend_parent(v487, v53, v54, v55);

      if (v56)
      {
        if (!v25) {
          goto LABEL_133;
        }
        v434 = objc_msgSend_recordID(v487, v57, v58, v59);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v435, @"CKErrorDomain", 12, @"Records with a parent reference cannot use zoneish PCS: %@", v434);
LABEL_191:
        *uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_133;
      }
      uint64_t v60 = objc_msgSend_share(v487, v57, v58, v59);

      if (v60)
      {
        if (!v25) {
          goto LABEL_133;
        }
        v434 = objc_msgSend_recordID(v487, v53, v54, v55);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v436, @"CKErrorDomain", 12, @"Records with a share reference (root records) cannot use zoneish PCS: %@", v434);
        goto LABEL_191;
      }
LABEL_20:
      uint64_t v61 = objc_msgSend_changedKeys(v487, v53, v54, v55);
      uint64_t v62 = CKValidateIndexedArrayKeys(v61, 0);

      if (v25 && v62)
      {
        id v433 = v62;
        *uint64_t v25 = v433;

        goto LABEL_133;
      }
      v489 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v63, v64, v65);
      v488 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v66, v67, v68);
      long long v527 = 0u;
      long long v528 = 0u;
      long long v529 = 0u;
      long long v530 = 0u;
      objc_msgSend_changedKeys(v487, v69, v70, v71);
      id v485 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v485, v72, (uint64_t)&v527, (uint64_t)v546, 16);
      if (!v73)
      {
        uint64_t v76 = 0;
        BOOL v136 = 1;
        v137 = a3;
        goto LABEL_70;
      }
      uint64_t v74 = v73;
      v477 = v62;
      uint64_t v490 = *(void *)v528;
LABEL_24:
      uint64_t v75 = 0;
      while (1)
      {
        if (*(void *)v528 != v490) {
          objc_enumerationMutation(v485);
        }
        uint64_t v76 = *(void **)(*((void *)&v527 + 1) + 8 * v75);
        uint64_t v526 = 0;
        uint64_t v525 = 0;
        id v524 = 0;
        objc_super v77 = CKProcessIndexedArrayKey(v76, &v524, &v526, &v525);
        id v78 = v524;
        uint64_t v82 = v78;
        if (v77)
        {
          v132 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v79, v80, v81);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v132, v133, (uint64_t)a2, (uint64_t)v484, @"CKModifyRecordsOperation.m", 230, @"Error processing indexed array key, which should have been caught earlier: %@", v77);

          if (!v82)
          {
LABEL_54:

            goto LABEL_55;
          }
        }
        else if (!v78)
        {
          goto LABEL_54;
        }
        objc_super v83 = objc_msgSend_valueStore(v52, v79, v80, v81);
        v86 = objc_msgSend_objectForKeyedSubscript_(v83, v84, (uint64_t)v76, v85);
        v90 = v86;
        if (v86)
        {
          id v91 = v86;
        }
        else
        {
          v92 = objc_msgSend_encryptedValueStore(v52, v87, v88, v89);
          objc_msgSend_objectForKeyedSubscript_(v92, v93, (uint64_t)v76, v94);
          id v91 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v137 = a3;
          if (a3)
          {
            v138 = objc_msgSend_recordID(v487, v95, v96, v97);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v139, @"CKErrorDomain", 12, @"Value type for indexed list key %@ in record %@ needs to be NSArray", v76, v138);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v76 = 0;
          BOOL v136 = 0;
          uint64_t v52 = v487;
LABEL_62:
          uint64_t v62 = v477;
          goto LABEL_70;
        }
        v98 = objc_msgSend_objectForKeyedSubscript_(v489, v95, (uint64_t)v82, v97);
        v99 = v98;
        if (v98)
        {
          id v100 = v98;
        }
        else
        {
          id v100 = (id)objc_opt_new();
        }
        v103 = objc_msgSend_objectForKeyedSubscript_(v488, v101, (uint64_t)v82, v102);
        uint64_t v104 = v526;
        uint64_t v105 = v525;
        if (v105 == objc_msgSend_count(v91, v106, v107, v108))
        {
          if (v526 < 0)
          {
            v473 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v109, v110, v111);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v473, v134, (uint64_t)a2, (uint64_t)v484, @"CKModifyRecordsOperation.m", 262, @"For now, negative indexed list keys (%@) can only be appends: should have been caught in CKProcessIndexedArrayKey", v76);
          }
          if (objc_msgSend_containsIndexesInRange_(v100, v109, v104, v105))
          {
            v474 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v112, v113, v114);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v474, v135, (uint64_t)a2, (uint64_t)v484, @"CKModifyRecordsOperation.m", 264, @"Overlapping replacements: should have been caught in CKValidateIndexedArrayKeys");
          }
          objc_msgSend_addIndexesInRange_(v100, v112, v104, v105);
          if (v103)
          {
            if ((objc_msgSend_integerValue(v103, v115, v116, v117) & 0x8000000000000000) == 0
              && objc_msgSend_lastIndex(v100, v115, v118, v119) != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v122 = objc_msgSend_integerValue(v103, v115, v120, v121);
              if (v122 <= objc_msgSend_lastIndex(v100, v123, v124, v125))
              {
LABEL_63:
                id v140 = v76;

                goto LABEL_65;
              }
            }
          }
          objc_msgSend_setObject_forKeyedSubscript_(v489, v115, (uint64_t)v100, (uint64_t)v82);
          goto LABEL_52;
        }
        if (v103) {
          goto LABEL_63;
        }
        uint64_t v126 = v526;
        if (v526 >= 1)
        {
          uint64_t Index = objc_msgSend_lastIndex(v100, v109, v110, v111);
          uint64_t v126 = v526;
          if (Index != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
        }
LABEL_51:
        v129 = objc_msgSend_numberWithInteger_(NSNumber, v109, v126, v111);
        objc_msgSend_setObject_forKeyedSubscript_(v488, v130, (uint64_t)v129, (uint64_t)v82);

LABEL_52:
        uint64_t v4 = v486;
        uint64_t v52 = v487;
LABEL_55:
        if (v74 == ++v75)
        {
          uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v485, v131, (uint64_t)&v527, (uint64_t)v546, 16);
          if (v74) {
            goto LABEL_24;
          }
          uint64_t v76 = 0;
          BOOL v136 = 1;
          v137 = a3;
          goto LABEL_62;
        }
      }
      if (v126 > objc_msgSend_lastIndex(v100, v109, v128, v111))
      {
        uint64_t v126 = v526;
        goto LABEL_51;
      }
      id v141 = v76;
LABEL_65:

      BOOL v136 = v76 == 0;
      BOOL v145 = a3 == 0;
      if (!v76) {
        BOOL v145 = 1;
      }
      uint64_t v4 = v486;
      v137 = a3;
      uint64_t v62 = v477;
      if (v145)
      {
        uint64_t v52 = v487;
        goto LABEL_71;
      }
      uint64_t v52 = v487;
      objc_msgSend_recordID(v487, v142, v143, v144);
      id v485 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v146, @"CKErrorDomain", 12, @"Found non-commutative indexed list key %@ in record %@: every mutation for a given list key must commute", v76, v485);
      BOOL v136 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:

LABEL_71:
      if (!v136) {
        goto LABEL_133;
      }
      long long v522 = 0u;
      long long v523 = 0u;
      long long v520 = 0u;
      long long v521 = 0u;
      v150 = objc_msgSend_valueStore(v52, v147, v148, v149);
      v154 = objc_msgSend_allRawValues(v150, v151, v152, v153);

      uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v155, (uint64_t)&v520, (uint64_t)v545, 16);
      if (v156)
      {
        uint64_t v157 = v156;
        uint64_t v158 = *(void *)v521;
        v491 = v154;
        do
        {
          uint64_t v159 = 0;
          v160 = v484;
          do
          {
            if (*(void *)v521 != v158) {
              objc_enumerationMutation(v154);
            }
            v161 = *(void **)(*((void *)&v520 + 1) + 8 * v159);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_18B137558;
            aBlock[3] = &unk_1E5465088;
            aBlock[4] = v160;
            aBlock[5] = v487;
            v162 = (uint64_t (**)(void *, void *, id *))_Block_copy(aBlock);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v162[2](v162, v161, v137)) {
                goto LABEL_91;
              }
LABEL_132:

              goto LABEL_133;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_91;
            }
            long long v517 = 0u;
            long long v518 = 0u;
            long long v515 = 0u;
            long long v516 = 0u;
            id v163 = v161;
            uint64_t v165 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v164, (uint64_t)&v515, (uint64_t)v544, 16);
            if (!v165) {
              goto LABEL_90;
            }
            uint64_t v166 = v165;
            uint64_t v167 = *(void *)v516;
            do
            {
              for (uint64_t j = 0; j != v166; ++j)
              {
                if (*(void *)v516 != v167) {
                  objc_enumerationMutation(v163);
                }
                v169 = *(void **)(*((void *)&v515 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && !v162[2](v162, v169, a3))
                {

                  uint64_t v4 = v486;
                  v154 = v491;
                  goto LABEL_132;
                }
              }
              uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v170, (uint64_t)&v515, (uint64_t)v544, 16);
            }
            while (v166);
LABEL_90:

            uint64_t v4 = v486;
            v154 = v491;
            v137 = a3;
            v160 = v484;
LABEL_91:

            ++v159;
          }
          while (v159 != v157);
          uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v171, (uint64_t)&v520, (uint64_t)v545, 16);
        }
        while (v157);
      }

      objc_msgSend_addObject_(v482, v172, (uint64_t)v479, v173);
      v177 = objc_msgSend_recordType(v487, v174, v175, v176);
      int isEqualToString = objc_msgSend_isEqualToString_(v177, v178, @"cloudkit.share", v179);

      if (isEqualToString)
      {
        id v184 = v487;
        v191 = objc_msgSend_rootRecordID(v184, v185, v186, v187);
        if (v191 && (objc_msgSend_isKnownToServer(v184, v188, v189, v190) & 1) == 0)
        {
          v195 = objc_msgSend_recordID(v184, v192, v193, v194);
          objc_msgSend_setObject_forKeyedSubscript_(obj, v196, (uint64_t)v195, (uint64_t)v191);
        }
      }
      v197 = objc_msgSend_configuration(v484, v181, v182, v183);
      v201 = objc_msgSend_container(v197, v198, v199, v200);
      v205 = objc_msgSend_options(v201, v202, v203, v204);
      if (objc_msgSend_bypassPCSEncryption(v205, v206, v207, v208))
      {
      }
      else
      {
        v215 = objc_msgSend_configuration(v484, v209, v210, v211);
        v219 = objc_msgSend_container(v215, v216, v217, v218);
        v223 = objc_msgSend_options(v219, v220, v221, v222);
        int OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v223, v224, v225, v226);

        if (!OnlyManatee) {
          goto LABEL_121;
        }
      }
      v228 = objc_msgSend_configuration(v484, v212, v213, v214);
      v232 = objc_msgSend_container(v228, v229, v230, v231);
      v236 = objc_msgSend_options(v232, v233, v234, v235);
      char v240 = objc_msgSend_bypassPCSEncryption(v236, v237, v238, v239);

      v244 = @"no encryption";
      if ((v240 & 1) == 0)
      {
        v245 = objc_msgSend_configuration(v484, v241, v242, v243);
        v249 = objc_msgSend_container(v245, v246, v247, v248);
        v253 = objc_msgSend_options(v249, v250, v251, v252);
        int v257 = objc_msgSend_forceEnableReadOnlyManatee(v253, v254, v255, v256);

        if (v257) {
          v244 = @"manatee force enabled";
        }
        else {
          v244 = @"?";
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!a3) {
          goto LABEL_133;
        }
        v471 = @"This container has requested %@ but record %@ is a share";
LABEL_220:
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v258, @"CKErrorDomain", 12, v471, v244, v479);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      v261 = objc_msgSend_share(v487, v258, v259, v260);

      if (v261)
      {
        if (!a3) {
          goto LABEL_133;
        }
        v471 = @"This container has requested %@ but record %@ has a share reference";
        goto LABEL_220;
      }
      v264 = objc_msgSend_parent(v487, v258, v262, v263);

      if (v264)
      {
        if (!a3) {
          goto LABEL_133;
        }
        v471 = @"This container has requested %@ but record %@ has a parent reference";
        goto LABEL_220;
      }
      if (objc_msgSend_wantsChainPCS(v487, v258, v265, v266))
      {
        if (!a3) {
          goto LABEL_133;
        }
        v471 = @"This container has requested %@ but record %@ wants chain PCS";
        goto LABEL_220;
      }
      v269 = objc_msgSend_encryptedValueStore(v487, v258, v267, v268);
      v273 = objc_msgSend_allKeys(v269, v270, v271, v272);
      uint64_t v277 = objc_msgSend_count(v273, v274, v275, v276);

      if (v277)
      {
        if (!a3) {
          goto LABEL_133;
        }
        v471 = @"This container has requested %@ but record %@ has encrypted values";
        goto LABEL_220;
      }
      long long v513 = 0u;
      long long v514 = 0u;
      long long v511 = 0u;
      long long v512 = 0u;
      v280 = objc_msgSend_valueStore(v487, v258, v278, v279);
      v284 = objc_msgSend_allRawValues(v280, v281, v282, v283);

      uint64_t v286 = objc_msgSend_countByEnumeratingWithState_objects_count_(v284, v285, (uint64_t)&v511, (uint64_t)v543, 16);
      if (!v286) {
        goto LABEL_120;
      }
      uint64_t v287 = v286;
      uint64_t v288 = *(void *)v512;
      do
      {
        for (uint64_t k = 0; k != v287; ++k)
        {
          if (*(void *)v512 != v288) {
            objc_enumerationMutation(v284);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
          }
          if (a3)
          {
            v326 = (objc_class *)objc_opt_class();
            v327 = NSStringFromClass(v326);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v328, @"CKErrorDomain", 12, @"This container has requested %@ but record %@ has a value of class %@", v244, v479, v327);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_133:

LABEL_134:
          goto LABEL_135;
        }
        uint64_t v287 = objc_msgSend_countByEnumeratingWithState_objects_count_(v284, v290, (uint64_t)&v511, (uint64_t)v543, 16);
      }
      while (v287);
LABEL_120:

LABEL_121:
      uint64_t v28 = v478 + 1;
      uint64_t v27 = v475;
      uint64_t v25 = a3;
      uint64_t v19 = v484;
    }
    while (v478 + 1 != v476);
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v480, v291, (uint64_t)&v531, (uint64_t)v547, 16);
  }
  while (v26);
LABEL_123:

  objc_msgSend_database(v19, v292, v293, v294);
  v296 = v295 = v19;
  if (objc_msgSend_databaseScope(v296, v297, v298, v299) == 3)
  {
    v303 = objc_msgSend_configuration(v295, v300, v301, v302);
    v307 = objc_msgSend_container(v303, v304, v305, v306);
    v311 = objc_msgSend_options(v307, v308, v309, v310);
    if (objc_msgSend_bypassPCSEncryption(v311, v312, v313, v314))
    {

LABEL_143:
      if (v25)
      {
        v342 = objc_msgSend_operationID(v484, v318, v319, v320);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v343, @"CKErrorDomain", 12, @"This container has requested no encryption but CKModifyRecordsOperation %@ is targeting the shared database, which requires encryption", v342);
        *uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_135:
      BOOL v324 = 0;
      goto LABEL_136;
    }
    v329 = objc_msgSend_configuration(v295, v315, v316, v317);
    v333 = objc_msgSend_container(v329, v330, v331, v332);
    v337 = objc_msgSend_options(v333, v334, v335, v336);
    char v341 = objc_msgSend_forceEnableReadOnlyManatee(v337, v338, v339, v340);

    uint64_t v25 = a3;
    if (v341) {
      goto LABEL_143;
    }
  }
  else
  {
  }
  if (objc_msgSend_count(obj, v318, v319, v320) && (objc_msgSend_atomic(v484, v344, v345, v346) & 1) == 0)
  {
    if (v25)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v344, @"CKErrorDomain", 12, @"When saving an added share with its rootRecord, the operation must be marked as atomic = YES");
      BOOL v324 = 0;
      *uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_136;
    }
    goto LABEL_135;
  }
  long long v509 = 0u;
  long long v510 = 0u;
  long long v507 = 0u;
  long long v508 = 0u;
  v347 = objc_msgSend_allKeys(obj, v344, v345, v346);
  uint64_t v349 = objc_msgSend_countByEnumeratingWithState_objects_count_(v347, v348, (uint64_t)&v507, (uint64_t)v542, 16);
  if (!v349) {
    goto LABEL_155;
  }
  uint64_t v352 = v349;
  uint64_t v353 = *(void *)v508;
  do
  {
    for (uint64_t m = 0; m != v352; ++m)
    {
      if (*(void *)v508 != v353) {
        objc_enumerationMutation(v347);
      }
      v355 = *(void **)(*((void *)&v507 + 1) + 8 * m);
      if ((objc_msgSend_containsObject_(v482, v350, (uint64_t)v355, v351) & 1) == 0)
      {
        if (a3)
        {
          v419 = objc_msgSend_objectForKeyedSubscript_(obj, v350, (uint64_t)v355, v351);
          v423 = objc_msgSend_ckShortDescription(v419, v420, v421, v422);
          v427 = objc_msgSend_ckShortDescription(v355, v424, v425, v426);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v428, @"CKErrorDomain", 12, @"An added share is being saved without its rootRecord being saved in the same operation. (Share ID: %@, Root Record ID: %@)", v423, v427);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_135;
      }
    }
    uint64_t v352 = objc_msgSend_countByEnumeratingWithState_objects_count_(v347, v350, (uint64_t)&v507, (uint64_t)v542, 16);
  }
  while (v352);
LABEL_155:

  v356 = objc_opt_new();
  v357 = objc_opt_new();
  long long v503 = 0u;
  long long v504 = 0u;
  long long v505 = 0u;
  long long v506 = 0u;
  v361 = objc_msgSend_recordsToSave(v484, v358, v359, v360);
  uint64_t v363 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v362, (uint64_t)&v503, (uint64_t)v541, 16);
  if (!v363) {
    goto LABEL_166;
  }
  uint64_t v367 = v363;
  uint64_t v368 = *(void *)v504;
  while (2)
  {
    uint64_t v369 = 0;
    while (2)
    {
      if (*(void *)v504 != v368) {
        objc_enumerationMutation(v361);
      }
      v370 = *(void **)(*((void *)&v503 + 1) + 8 * v369);
      v371 = objc_msgSend_recordID(v370, v364, v365, v366);
      int v374 = objc_msgSend_containsObject_(v483, v372, (uint64_t)v371, v373);

      if (v374)
      {
        if (a3)
        {
          v429 = objc_msgSend_recordID(v370, v375, v376, v377);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v430, @"CKErrorDomain", 12, @"You can't save the same record twice: %@", v429);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_destroyPackagesInRecords_(v484, v375, (uint64_t)v356, v377);
        goto LABEL_183;
      }
      id v378 = v370;
      if (!objc_msgSend_containsPackageValues(v378, v379, v380, v381)) {
        goto LABEL_164;
      }
      uint64_t v385 = objc_msgSend_recordWithDuplicatedPackagesOfRecord_error_(CKRecord, v382, (uint64_t)v378, (uint64_t)a3);
      if (!v385)
      {
        objc_msgSend_destroyPackagesInRecords_(v484, v386, (uint64_t)v356, v387);

LABEL_183:
        uint64_t v4 = v486;
        goto LABEL_184;
      }
      v388 = (void *)v385;
      objc_msgSend_addObject_(v356, v386, v385, v387);
      id v389 = v388;

      id v378 = v389;
LABEL_164:
      v390 = objc_msgSend_recordsByRecordIDs(v484, v382, v383, v384);
      v394 = objc_msgSend_recordID(v378, v391, v392, v393);
      objc_msgSend_setObject_forKeyedSubscript_(v390, v395, (uint64_t)v378, (uint64_t)v394);

      v399 = objc_msgSend_recordID(v378, v396, v397, v398);
      objc_msgSend_addObject_(v483, v400, (uint64_t)v399, v401);

      objc_msgSend_addObject_(v357, v402, (uint64_t)v378, v403);
      if (v367 != ++v369) {
        continue;
      }
      break;
    }
    uint64_t v367 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v364, (uint64_t)&v503, (uint64_t)v541, 16);
    if (v367) {
      continue;
    }
    break;
  }
LABEL_166:

  objc_msgSend_setRecordsToSave_(v484, v404, (uint64_t)v357, v405);
  v409 = objc_msgSend_recordsToSave(v484, v406, v407, v408);
  if (objc_msgSend_count(v409, v410, v411, v412))
  {

    uint64_t v4 = v486;
    goto LABEL_193;
  }
  v437 = objc_msgSend_recordIDsToDelete(v484, v413, v414, v415);
  uint64_t v441 = objc_msgSend_count(v437, v438, v439, v440);

  uint64_t v4 = v486;
  if (!v441) {
    goto LABEL_185;
  }
LABEL_193:
  long long v501 = 0u;
  long long v502 = 0u;
  long long v499 = 0u;
  long long v500 = 0u;
  v361 = objc_msgSend_recordsToSave(v484, v416, v417, v418);
  uint64_t v443 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v442, (uint64_t)&v499, (uint64_t)v540, 16);
  if (v443)
  {
    uint64_t v447 = v443;
    uint64_t v448 = *(void *)v500;
LABEL_195:
    uint64_t v449 = 0;
    while (1)
    {
      if (*(void *)v500 != v448) {
        objc_enumerationMutation(v361);
      }
      v450 = objc_msgSend_recordID(*(void **)(*((void *)&v499 + 1) + 8 * v449), v444, v445, v446);
      v454 = objc_msgSend_zoneID(v450, v451, v452, v453);
      int v456 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(v484, v455, (uint64_t)v454, (uint64_t)a3);

      if (!v456) {
        break;
      }
      if (v447 == ++v449)
      {
        uint64_t v447 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v444, (uint64_t)&v499, (uint64_t)v540, 16);
        if (v447) {
          goto LABEL_195;
        }
        goto LABEL_201;
      }
    }
LABEL_184:

LABEL_185:
    BOOL v324 = 0;
  }
  else
  {
LABEL_201:

    long long v497 = 0u;
    long long v498 = 0u;
    long long v495 = 0u;
    long long v496 = 0u;
    v361 = objc_msgSend_recordIDsToDelete(v484, v457, v458, v459);
    uint64_t v461 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v460, (uint64_t)&v495, (uint64_t)v539, 16);
    if (v461)
    {
      uint64_t v465 = v461;
      uint64_t v466 = *(void *)v496;
LABEL_203:
      uint64_t v467 = 0;
      while (1)
      {
        if (*(void *)v496 != v466) {
          objc_enumerationMutation(v361);
        }
        v468 = objc_msgSend_zoneID(*(void **)(*((void *)&v495 + 1) + 8 * v467), v462, v463, v464);
        int v470 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(v484, v469, (uint64_t)v468, (uint64_t)a3);

        if (!v470) {
          goto LABEL_184;
        }
        if (v465 == ++v467)
        {
          uint64_t v465 = objc_msgSend_countByEnumeratingWithState_objects_count_(v361, v462, (uint64_t)&v495, (uint64_t)v539, 16);
          if (v465) {
            goto LABEL_203;
          }
          break;
        }
      }
    }

    v494.receiver = v484;
    v494.super_class = (Class)CKModifyRecordsOperation;
    BOOL v324 = [(CKDatabaseOperation *)&v494 CKOperationShouldRun:a3];
  }

LABEL_136:
LABEL_137:

  return v324;
}

- (BOOL)_prepareFieldValuesForUploadWithError:(id *)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v104 = 0;
  uint64_t v105 = &v104;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = &v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = 0;
  uint64_t v73 = self;
  uint64_t v7 = objc_msgSend_database(self, v4, v5, v6);
  uint64_t v75 = objc_msgSend_container(v7, v8, v9, v10);

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v14 = objc_msgSend_recordsToSave(self, v11, v12, v13);
  id v16 = 0;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v84, (uint64_t)v109, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v85;
LABEL_3:
    uint64_t v20 = 0;
    uint64_t v21 = v16;
    while (1)
    {
      if (*(void *)v85 != v19) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void **)(*((void *)&v84 + 1) + 8 * v20);
      id v83 = v21;
      char v23 = objc_msgSend_prepareMergeablesForUploadInContainer_useAssetsIfNecessary_error_(v22, v17, (uint64_t)v75, 1, &v83);
      id v16 = v83;

      if ((v23 & 1) == 0) {
        break;
      }
      v108[0] = objc_opt_class();
      v108[1] = objc_opt_class();
      v108[2] = objc_opt_class();
      uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v108, 3);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = sub_18B137C64;
      v76[3] = &unk_1E54650B0;
      id v77 = v74;
      id v78 = &v88;
      uint64_t v79 = &v96;
      uint64_t v80 = &v92;
      uint64_t v81 = &v104;
      uint64_t v82 = &v100;
      objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v22, v26, (uint64_t)v25, (uint64_t)v76);

      ++v20;
      uint64_t v21 = v16;
      if (v18 == v20)
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v84, (uint64_t)v109, 16);
        if (v18) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v29 = v105[3];
  if (v29)
  {
    uint64_t v30 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, v29, v28);
    uint64_t v34 = objc_msgSend_operationMetric(v73, v31, v32, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v30, @"mergeable_valueCount");
  }
  uint64_t v36 = v101[3];
  if (v36)
  {
    uint64_t v37 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, v36, v28);
    uint64_t v41 = objc_msgSend_operationMetric(v73, v38, v39, v40);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v37, @"mergeable_savedDeltaCount");
  }
  uint64_t v43 = v97[3];
  if (v43)
  {
    uint64_t v44 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, v43, v28);
    uint64_t v48 = objc_msgSend_operationMetric(v73, v45, v46, v47);
    objc_msgSend_setObject_forKeyedSubscript_(v48, v49, (uint64_t)v44, @"mergeable_savedReplacementDeltaCount");
  }
  uint64_t v50 = v93[3];
  if (v50)
  {
    int v51 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, v50, v28);
    uint64_t v55 = objc_msgSend_operationMetric(v73, v52, v53, v54);
    objc_msgSend_setObject_forKeyedSubscript_(v55, v56, (uint64_t)v51, @"mergeable_replacedDeltaCount");
  }
  uint64_t v57 = v89[3];
  if (v57)
  {
    uint64_t v58 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v27, v57, v28);
    uint64_t v62 = objc_msgSend_operationMetric(v73, v59, v60, v61);
    objc_msgSend_setObject_forKeyedSubscript_(v62, v63, (uint64_t)v58, @"mergeable_assetCount");
  }
  if (!v16)
  {
    uint64_t v64 = objc_msgSend_deviceContext(v73, v27, v57, v28);
    uint64_t v68 = objc_msgSend_deviceScopedStateManager(v64, v65, v66, v67);
    objc_msgSend_trackAssets_(v68, v69, (uint64_t)v74, v70);
  }
  if (a3) {
    *a3 = v16;
  }

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);

  return v16 == 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_recordsToSave(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_CKMap_(v5, v6, (uint64_t)&unk_1ED7EF4B8, v7);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v9 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    id v16 = v9;
    uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
    uint64_t v24 = objc_msgSend_recordIDsToDelete(self, v21, v22, v23);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v8;
    __int16 v31 = 2112;
    uint64_t v32 = v24;
    _os_log_debug_impl(&dword_18AF10000, v16, OS_LOG_TYPE_DEBUG, "Modifying records with operation %{public}@ recordsToSave=%@ recordIDsToDelete=%@", buf, 0x20u);
  }
  id v26 = 0;
  char v12 = objc_msgSend__prepareFieldValuesForUploadWithError_(self, v10, (uint64_t)&v26, v11);
  id v15 = v26;
  if (v12)
  {
    v25.receiver = self;
    v25.super_class = (Class)CKModifyRecordsOperation;
    [(CKOperation *)&v25 performCKOperation];
  }
  else
  {
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v15, v14);
  }
}

- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18B1384A8;
  v23[4] = sub_18B1384B8;
  uint64_t v24 = self;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_18B1384A8;
  uint64_t v17 = sub_18B1384B8;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B1384C0;
  v12[3] = &unk_1E5462958;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B138514;
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

- (void)handleRecordIDsInFlight:(id)a3 reply:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  char v9 = signpost;

  if (v9)
  {
    if (self) {
      uint64_t v13 = self->super.super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    id v18 = objc_msgSend_log(v14, v15, v16, v17);

    if (self) {
      uint64_t v19 = self->super.super._signpost;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = v19;
    os_signpost_id_t v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v48 = 138412290;
      id v49 = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v18, OS_SIGNPOST_EVENT, v24, "CKModifyRecordsOperation", "Records in flight: %@", (uint8_t *)&v48, 0xCu);
    }
  }
  objc_super v25 = objc_msgSend_recordsInFlightBlock_wrapper(self, v10, v11, v12);
  __int16 v29 = v25;
  if (v25)
  {
    uint64_t v30 = (void (**)(void *, id))_Block_copy(v25);
  }
  else
  {
    __int16 v31 = objc_msgSend_recordsInFlightBlock(self, v26, v27, v28);
    uint64_t v30 = (void (**)(void *, id))_Block_copy(v31);
  }
  if (v30)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = v32;
      uint64_t v38 = objc_msgSend_operationID(self, v35, v36, v37);
      int v48 = 138543618;
      id v49 = v38;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v6;
      _os_log_debug_impl(&dword_18AF10000, v34, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about records in flight %@", (uint8_t *)&v48, 0x16u);
    }
    v30[2](v30, v6);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = v33;
      uint64_t v43 = objc_msgSend_operationID(self, v40, v41, v42);
      uint64_t v47 = objc_msgSend_count(v6, v44, v45, v46);
      int v48 = 138543618;
      id v49 = v43;
      __int16 v50 = 2048;
      uint64_t v51 = v47;
      _os_log_debug_impl(&dword_18AF10000, v39, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received %lu records in flight, but no recordsInFlightBlock has been set.", (uint8_t *)&v48, 0x16u);
    }
  }
  v7[2](v7, 0);
}

- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
      id v18 = self->super.super._signpost;
    }
    else {
      id v18 = 0;
    }
    uint64_t v19 = v18;
    os_signpost_id_t v23 = objc_msgSend_identifier(v19, v20, v21, v22);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v39 = 138412546;
      id v40 = v6;
      __int16 v41 = 2048;
      double v42 = a4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v17, OS_SIGNPOST_EVENT, v23, "CKModifyRecordsOperation", "Record %@ updated progress %f", (uint8_t *)&v39, 0x16u);
    }
  }
  os_signpost_id_t v24 = objc_msgSend_recordsByRecordIDs(self, v9, v10, v11);
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v6, v26);

  if (v27)
  {
    __int16 v31 = objc_msgSend_perRecordProgressBlock_wrapper(self, v28, v29, v30);
    uint64_t v35 = v31;
    if (v31)
    {
      uint64_t v36 = (void (**)(void *, void *, double))_Block_copy(v31);
    }
    else
    {
      uint64_t v38 = objc_msgSend_perRecordProgressBlock(self, v32, v33, v34);
      uint64_t v36 = (void (**)(void *, void *, double))_Block_copy(v38);
    }
    if (v36) {
      v36[2](v36, v27, a4);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v37 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      int v39 = 138412290;
      id v40 = v6;
      _os_log_error_impl(&dword_18AF10000, v37, OS_LOG_TYPE_ERROR, "Received progress callback with nil record for recordID %@", (uint8_t *)&v39, 0xCu);
    }
  }
}

- (void)handleDeleteForRecordID:(id)a3 error:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (!v10)
  {
    if (!v12)
    {
      if (objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15)) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    if (self) {
      uint64_t v32 = self->super.super._signpost;
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v33 = v32;
    uint64_t v21 = objc_msgSend_log(v33, v34, v35, v36);

    if (self) {
      uint64_t v37 = self->super.super._signpost;
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v38 = v37;
    uint64_t v42 = objc_msgSend_identifier(v38, v39, v40, v41);

    if ((unint64_t)(v42 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_21;
    }
    *(_DWORD *)uint64_t v75 = 138412290;
    *(void *)&v75[4] = v6;
    uint64_t v28 = "Record %@ deleted";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v42;
    uint32_t v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if (objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15)) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  if (self) {
    uint64_t v16 = self->super.super._signpost;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v16;
  uint64_t v21 = objc_msgSend_log(v17, v18, v19, v20);

  if (self) {
    uint64_t v22 = self->super.super._signpost;
  }
  else {
    uint64_t v22 = 0;
  }
  os_signpost_id_t v23 = v22;
  uint64_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)uint64_t v75 = 138412546;
    *(void *)&v75[4] = v6;
    *(_WORD *)&v75[12] = 2112;
    *(void *)&v75[14] = v10;
    uint64_t v28 = "Record %@ deleted with error: %@";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v27;
    uint32_t v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v30, "CKModifyRecordsOperation", v28, v75, v31);
  }
LABEL_21:

  if (objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45)) {
    goto LABEL_29;
  }
  if (!v10)
  {
LABEL_27:
    id v49 = objc_msgSend_deletedRecordIDs(self, v46, v47, v48, *(void *)v75, *(_OWORD *)&v75[8]);
    objc_msgSend_addObject_(v49, v51, (uint64_t)v6, v52);
    goto LABEL_28;
  }
LABEL_25:
  id v49 = objc_msgSend_recordErrors(self, v46, v47, v48, *(_OWORD *)v75, *(void *)&v75[16]);
  objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v10, (uint64_t)v6);
LABEL_28:

LABEL_29:
  uint64_t v53 = objc_msgSend_perRecordDeleteBlock_wrapper(self, v46, v47, v48, *(void *)v75, *(void *)&v75[8]);
  uint64_t v57 = v53;
  if (v53)
  {
    uint64_t v58 = (void (**)(void *, id, void *))_Block_copy(v53);
  }
  else
  {
    uint64_t v59 = objc_msgSend_perRecordDeleteBlock(self, v54, v55, v56);
    uint64_t v58 = (void (**)(void *, id, void *))_Block_copy(v59);
  }
  if (v58)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v63 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v70 = v63;
      id v74 = objc_msgSend_operationID(self, v71, v72, v73);
      *(_DWORD *)uint64_t v75 = 138543874;
      *(void *)&v75[4] = v74;
      *(_WORD *)&v75[12] = 2112;
      *(void *)&v75[14] = v6;
      *(_WORD *)&v75[22] = 2112;
      uint64_t v76 = v10;
      _os_log_debug_impl(&dword_18AF10000, v70, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about deleted record with ID %@: %@", v75, 0x20u);
    }
    v58[2](v58, v6, v10);
  }
  uint64_t v64 = objc_msgSend_configuration(self, v60, v61, v62);
  uint64_t v68 = objc_msgSend_container(v64, v65, v66, v67);
  objc_msgSend_handleRecordChanged_changeType_record_error_(v68, v69, (uint64_t)v6, 3, 0, v10);
}

- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v15 = objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v17 = signpost;

  if (v15)
  {
    if (!v17) {
      goto LABEL_22;
    }
    id v21 = v11;
    if (self) {
      uint64_t v22 = self->super.super._signpost;
    }
    else {
      uint64_t v22 = 0;
    }
    os_signpost_id_t v23 = v22;
    uint64_t v27 = objc_msgSend_log(v23, v24, v25, v26);

    if (self) {
      uint64_t v28 = self->super.super._signpost;
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = v28;
    uint64_t v33 = objc_msgSend_identifier(v29, v30, v31, v32);

    if ((unint64_t)(v33 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    id v185 = v9;
    __int16 v186 = 2112;
    id v187 = v15;
    uint64_t v34 = "Record %@ saved with error: %@";
    uint64_t v35 = v27;
    os_signpost_id_t v36 = v33;
    uint32_t v37 = 22;
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_22;
  }
  id v21 = v11;
  if (self) {
    uint64_t v38 = self->super.super._signpost;
  }
  else {
    uint64_t v38 = 0;
  }
  int v39 = v38;
  uint64_t v27 = objc_msgSend_log(v39, v40, v41, v42);

  if (self) {
    uint64_t v43 = self->super.super._signpost;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v44 = v43;
  uint64_t v48 = objc_msgSend_identifier(v44, v45, v46, v47);

  if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 138412290;
    id v185 = v9;
    uint64_t v34 = "Record %@ saved";
    uint64_t v35 = v27;
    os_signpost_id_t v36 = v48;
    uint32_t v37 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v35, OS_SIGNPOST_EVENT, v36, "CKModifyRecordsOperation", v34, buf, v37);
  }
LABEL_21:

  id v11 = v21;
LABEL_22:
  id v49 = objc_msgSend_recordsByRecordIDs(self, v18, v19, v20);
  uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)v9, v51);

  if (v52)
  {
    id v183 = 0;
    v178 = self;
    int v54 = objc_msgSend_claimPackagesInRecord_error_(self, v53, (uint64_t)v52, (uint64_t)&v183);
    id v176 = v183;
    BOOL v58 = v176 != 0;
    if (!v54) {
      BOOL v58 = v176 == 0;
    }
    if (v58)
    {
      uint64_t v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v55, v56, v57);
      uint64_t v64 = v62;
      if (v54) {
        uint64_t v65 = "succeeded";
      }
      else {
        uint64_t v65 = "failed";
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)v178, @"CKModifyRecordsOperation.m", 644, @"Expecting packageClaimError(%@) only on failure (%s)", v176, v65);

      if (v54) {
        goto LABEL_27;
      }
    }
    else if (v54)
    {
LABEL_27:
      uint64_t v59 = v178;
      goto LABEL_43;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v66 = ck_log_facility_ck;
    uint64_t v59 = v178;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v185 = v52;
      __int16 v186 = 2112;
      id v187 = v176;
      _os_log_impl(&dword_18AF10000, v66, OS_LOG_TYPE_INFO, "Claim package failed for record: %@, error: %@", buf, 0x16u);
    }
    if (!v11) {
      id v11 = v176;
    }
LABEL_43:
    uint64_t v61 = objc_msgSend_CKClientSuitableError(v11, v55, v56, v57);

    v177 = v52;
    if (v61)
    {
      if (objc_msgSend_canDropItemResultsEarly(v59, v67, v68, v69)) {
        goto LABEL_60;
      }
      uint64_t v73 = objc_msgSend_recordErrors(v59, v70, v71, v72);
      objc_msgSend_setObject_forKeyedSubscript_(v73, v74, (uint64_t)v61, (uint64_t)v9);
    }
    else
    {
      uint64_t v75 = objc_msgSend_assetsByRecordIDAndRecordKey(v59, v67, v68, v69);
      uint64_t v79 = objc_msgSend_count(v75, v76, v77, v78);

      if (v79)
      {
        id v174 = v11;
        id v175 = v10;
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v83 = objc_msgSend_allKeys(v52, v80, v81, v82);
        uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v179, (uint64_t)v192, 16);
        if (v85)
        {
          uint64_t v88 = v85;
          uint64_t v89 = *(void *)v180;
          do
          {
            for (uint64_t i = 0; i != v88; ++i)
            {
              if (*(void *)v180 != v89) {
                objc_enumerationMutation(v83);
              }
              uint64_t v91 = *(void *)(*((void *)&v179 + 1) + 8 * i);
              uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(v52, v86, v91, v87);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v93 = v92;
                uint64_t v97 = objc_msgSend_assetsByRecordIDAndRecordKey(v178, v94, v95, v96);
                uint64_t v100 = objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)v9, v99);
                uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(v100, v101, v91, v102);
                objc_msgSend_setAssets_(v93, v104, (uint64_t)v103, v105);

                uint64_t v52 = v177;
              }
            }
            uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v179, (uint64_t)v192, 16);
          }
          while (v88);
        }

        id v11 = v174;
        id v10 = v175;
        uint64_t v59 = v178;
        uint64_t v61 = 0;
      }
      uint64_t shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v59, v80, v81, v82);
      objc_msgSend_updateWithSavedRecordXPCMetadata_shouldOnlySaveAssetContent_(v52, v107, (uint64_t)v10, shouldOnlySaveAssetContent);
      if (objc_msgSend_canDropItemResultsEarly(v59, v108, v109, v110))
      {
LABEL_60:
        uint64_t v113 = objc_msgSend_perRecordSaveBlock_wrapper(v59, v70, v71, v72);
        uint64_t v117 = v113;
        if (v113)
        {
          uint64_t v118 = (void (**)(void *, void *, id, void))_Block_copy(v113);
        }
        else
        {
          uint64_t v119 = objc_msgSend_perRecordSaveBlock(v59, v114, v115, v116);
          uint64_t v118 = (void (**)(void *, void *, id, void))_Block_copy(v119);
        }
        if (v118)
        {
          v123 = v61;
          if (v61) {
            uint64_t v124 = 0;
          }
          else {
            uint64_t v124 = v52;
          }
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v133 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            id v144 = v10;
            BOOL v145 = v133;
            uint64_t v149 = objc_msgSend_operationID(v178, v146, v147, v148);
            uint64_t v153 = objc_msgSend_recordID(v52, v150, v151, v152);
            uint64_t v157 = objc_msgSend_recordChangeTag(v52, v154, v155, v156);
            *(_DWORD *)buf = 138544130;
            id v185 = v149;
            __int16 v186 = 2112;
            id v187 = v153;
            __int16 v188 = 2112;
            uint64_t v189 = v157;
            __int16 v190 = 2112;
            v191 = v123;
            _os_log_debug_impl(&dword_18AF10000, v145, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved record with ID %@ etag=%@: %@", buf, 0x2Au);

            uint64_t v52 = v177;
            id v10 = v144;
          }
          v137 = objc_msgSend_recordID(v52, v134, v135, v136);
          ((void (**)(void *, void *, id, void *))v118)[2](v118, v137, v124, v123);
        }
        else
        {
          uint64_t v125 = objc_msgSend_perRecordCompletionBlock(v59, v120, v121, v122);

          if (!v125)
          {
LABEL_79:
            v138 = objc_msgSend_configuration(v59, v126, v127, v128);
            v142 = objc_msgSend_container(v138, v139, v140, v141);
            objc_msgSend_handleRecordChanged_changeType_record_error_(v142, v143, (uint64_t)v9, 2, v52, v61);

            goto LABEL_80;
          }
          v123 = v61;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v129 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v158 = v129;
            v162 = objc_msgSend_operationID(v178, v159, v160, v161);
            uint64_t v166 = objc_msgSend_recordID(v52, v163, v164, v165);
            v170 = objc_msgSend_recordChangeTag(v52, v167, v168, v169);
            *(_DWORD *)buf = 138544130;
            id v185 = v162;
            __int16 v186 = 2112;
            id v187 = v166;
            __int16 v188 = 2112;
            uint64_t v189 = v170;
            __int16 v190 = 2112;
            v191 = v123;
            _os_log_debug_impl(&dword_18AF10000, v158, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved record with ID %@ etag=%@: %@", buf, 0x2Au);

            uint64_t v52 = v177;
            objc_msgSend_perRecordCompletionBlock(v178, v171, v172, v173);
          }
          else
          {
            objc_msgSend_perRecordCompletionBlock(v59, v130, v131, v132);
          }
          uint64_t v124 = (void (**)(id, void *, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v124)[2](v124, v52, v123);
        }

        uint64_t v59 = v178;
        uint64_t v61 = v123;
        goto LABEL_79;
      }
      uint64_t v73 = objc_msgSend_savedRecords(v59, v70, v71, v72);
      objc_msgSend_addObject_(v73, v111, (uint64_t)v52, v112);
    }

    goto LABEL_60;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v60 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v185 = v9;
    _os_log_error_impl(&dword_18AF10000, v60, OS_LOG_TYPE_ERROR, "Received progress callback with nil record for recordID %@", buf, 0xCu);
  }
  uint64_t v61 = v15;
LABEL_80:
}

- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v119 = a10;
  id v22 = a12;
  id v118 = a13;
  id v23 = a14;
  uint64_t v27 = objc_msgSend_recordsByRecordIDs(self, v24, v25, v26);
  os_signpost_id_t v30 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v19, v29);

  if (v20 && v30)
  {
    uint64_t v115 = (uint64_t)v22;
    objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v20, v32);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    uint64_t v114 = (uint64_t)v23;
    if (objc_opt_isKindOfClass())
    {
      id v33 = v33;
      id v36 = 0;
      inited = v33;
      uint64_t v38 = v21;
LABEL_5:
      if (inited)
      {
        objc_msgSend_setArrayIndex_(inited, v34, a5, v35);
        objc_msgSend_setSignature_(inited, v39, (uint64_t)v38, v40);
        objc_msgSend_setSize_(inited, v41, a7, v42);
        objc_msgSend_setPaddedFileSize_(inited, v43, a8, v44);
        objc_msgSend_setUploaded_(inited, v45, a9, v46);
        objc_msgSend_setUploadReceipt_(inited, v47, (uint64_t)v119, v48);
        objc_msgSend_setUploadReceiptExpiration_(inited, v49, v50, v51, a11);
        objc_msgSend_setWrappedAssetKey_(inited, v52, v115, v53);
        objc_msgSend_setClearAssetKey_(inited, v54, (uint64_t)v118, v55);
        objc_msgSend_setReferenceSignature_(inited, v56, v114, v57);
        if (v36)
        {
          uint64_t v61 = objc_msgSend_assetsByRecordIDAndRecordKey(self, v58, v59, v60);
          objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v19, v63);
          id v64 = (id)objc_claimAutoreleasedReturnValue();

          if (!v64)
          {
            id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v70 = objc_msgSend_assetsByRecordIDAndRecordKey(self, v67, v68, v69);
            objc_msgSend_setObject_forKeyedSubscript_(v70, v71, (uint64_t)v64, (uint64_t)v19);
          }
          id v74 = objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v20, v66, v114);
          if (!v74)
          {
            id v75 = objc_alloc(MEMORY[0x1E4F1CA48]);
            id v74 = objc_msgSend_initWithCapacity_(v75, v76, 2, v77);
            objc_msgSend_setObject_forKeyedSubscript_(v64, v78, (uint64_t)v74, (uint64_t)v20);
            objc_msgSend_setUploaded_(v36, v79, a9, v80);
          }
          objc_msgSend_addObject_(v74, v72, (uint64_t)inited, v73);
          unsigned __int8 v84 = objc_msgSend_uploaded(v36, v81, v82, v83);
          objc_msgSend_setUploaded_(v36, v85, v84 & a9, v86);
        }
      }
      goto LABEL_30;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v88 = v33;
      uint64_t v92 = v88;
      if (a5 < 0 || objc_msgSend_count(v88, v89, v90, v91) <= (unint64_t)a5)
      {
        uint64_t v38 = v21;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v102 = (void *)ck_log_facility_ck;
        id v33 = v92;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          uint64_t v109 = v102;
          uint64_t v113 = objc_msgSend_recordID(v30, v110, v111, v112);
          *(_DWORD *)buf = 134218242;
          int64_t v121 = a5;
          __int16 v122 = 2112;
          id v123 = v113;
          _os_log_error_impl(&dword_18AF10000, v109, OS_LOG_TYPE_ERROR, "Invalid arrayIndex %ld for record %@", buf, 0x16u);

          id v33 = v92;
        }
      }
      else
      {
        objc_msgSend_objectAtIndex_(v92, v93, a5, v94);
        id v33 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        uint64_t v38 = v21;
        if (objc_opt_isKindOfClass())
        {
          id v33 = v33;

          id v36 = 0;
          inited = v33;
          goto LABEL_5;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v103 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          uint64_t v104 = v103;
          uint64_t v108 = objc_msgSend_recordID(v30, v105, v106, v107);
          *(_DWORD *)buf = 134218242;
          int64_t v121 = a5;
          __int16 v122 = 2112;
          id v123 = v108;
          _os_log_error_impl(&dword_18AF10000, v104, OS_LOG_TYPE_ERROR, "Invalid asset at arrayIndex %ld for record %@", buf, 0x16u);
        }
      }
    }
    else
    {
      objc_opt_class();
      uint64_t v38 = v21;
      if (objc_opt_isKindOfClass())
      {
        id v36 = v33;
        if (objc_msgSend_shouldOnlySaveAssetContent(self, v95, v96, v97))
        {
          uint64_t v98 = [CKAsset alloc];
          inited = objc_msgSend_initInternal(v98, v99, v100, v101);
          id v33 = v36;
          goto LABEL_5;
        }
        inited = 0;
        id v33 = v36;
LABEL_30:

        id v23 = (id)v114;
        id v22 = (id)v115;
        goto LABEL_31;
      }
    }
    id v36 = 0;
    inited = 0;
    goto LABEL_30;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v38 = v21;
  uint64_t v87 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v121 = (int64_t)v30;
    __int16 v122 = 2114;
    id v123 = v20;
    __int16 v124 = 2112;
    id v125 = v19;
    _os_log_error_impl(&dword_18AF10000, v87, OS_LOG_TYPE_ERROR, "Received upload completion callback with nil record %p or recordKey %{public}@ for recordID %@", buf, 0x20u);
  }
LABEL_31:
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
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
      id v10 = self->super.super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    id v22 = objc_msgSend_recordErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_recordErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to modify some records");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_modifyRecordsCompletionBlock_wrapper(self, v7, v8, v9);
  uint64_t v38 = v34;
  if (v34)
  {
    int v39 = (void (**)(void *, void *, void *, void *))_Block_copy(v34);
  }
  else
  {
    uint64_t v40 = objc_msgSend_modifyRecordsCompletionBlock(self, v35, v36, v37);
    int v39 = (void (**)(void *, void *, void *, void *))_Block_copy(v40);
  }
  if (v39)
  {
    uint64_t v44 = objc_msgSend_savedRecords(self, v41, v42, v43);
    uint64_t v48 = objc_msgSend_deletedRecordIDs(self, v45, v46, v47);
    uint64_t v52 = objc_msgSend_CKClientSuitableError(v4, v49, v50, v51);
    v39[2](v39, v44, v48, v52);

    objc_msgSend_setModifyRecordsCompletionBlock_(self, v53, 0, v54);
  }
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  uint64_t v59 = objc_msgSend_savedRecords(self, v56, v57, v58);
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v130, (uint64_t)v137, 16);
  if (v61)
  {
    uint64_t v65 = v61;
    uint64_t v66 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v131 != v66) {
          objc_enumerationMutation(v59);
        }
        uint64_t v68 = objc_msgSend_recordID(*(void **)(*((void *)&v130 + 1) + 8 * i), v62, v63, v64);
        uint64_t v72 = objc_msgSend_zoneID(v68, v69, v70, v71);
        objc_msgSend_addObject_(v55, v73, (uint64_t)v72, v74);
      }
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v130, (uint64_t)v137, 16);
    }
    while (v65);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v78 = objc_msgSend_deletedRecordIDs(self, v75, v76, v77);
  uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v126, (uint64_t)v136, 16);
  if (v80)
  {
    uint64_t v84 = v80;
    uint64_t v85 = *(void *)v127;
    do
    {
      for (uint64_t j = 0; j != v84; ++j)
      {
        if (*(void *)v127 != v85) {
          objc_enumerationMutation(v78);
        }
        uint64_t v87 = objc_msgSend_zoneID(*(void **)(*((void *)&v126 + 1) + 8 * j), v81, v82, v83);
        objc_msgSend_addObject_(v55, v88, (uint64_t)v87, v89);
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v81, (uint64_t)&v126, (uint64_t)v136, 16);
    }
    while (v84);
  }

  if (objc_msgSend_count(v55, v90, v91, v92))
  {
    uint64_t v96 = objc_msgSend_zoneIDsToZoneNamesString_(self, v93, (uint64_t)v55, v95);
    uint64_t v100 = objc_msgSend_operationMetric(self, v97, v98, v99);
    objc_msgSend_setObject_forKeyedSubscript_(v100, v101, (uint64_t)v96, @"zoneNames");
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v102 = objc_msgSend_packagesToDestroy(self, v93, v94, v95);
  uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v103, (uint64_t)&v122, (uint64_t)v135, 16);
  if (v104)
  {
    uint64_t v108 = v104;
    uint64_t v109 = *(void *)v123;
    do
    {
      for (uint64_t k = 0; k != v108; ++k)
      {
        if (*(void *)v123 != v109) {
          objc_enumerationMutation(v102);
        }
        objc_msgSend_removeDB(*(void **)(*((void *)&v122 + 1) + 8 * k), v105, v106, v107);
      }
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v105, (uint64_t)&v122, (uint64_t)v135, 16);
    }
    while (v108);
  }

  objc_msgSend_setPerRecordProgressBlock_(self, v111, 0, v112);
  objc_msgSend_setPerRecordCompletionBlock_(self, v113, 0, v114);
  objc_msgSend_setPerRecordSaveBlock_(self, v115, 0, v116);
  objc_msgSend_setPerRecordDeleteBlock_(self, v117, 0, v118);
  objc_msgSend_setRecordsInFlightBlock_(self, v119, 0, v120);
  v121.receiver = self;
  v121.super_class = (Class)CKModifyRecordsOperation;
  [(CKOperation *)&v121 _finishOnCallbackQueueWithError:v4];
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
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super.super._signpost;
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = v11;
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
      id v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/modify-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleRecordIDsInFlight_reply_, 0, 0);

  uint64_t v12 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleDeleteForRecordID_error_, 1, 0);

  uint64_t v14 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v15, (uint64_t)v14, (uint64_t)sel_handleSaveForRecordID_recordMetadata_error_, 2, 0);

  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CKModifyRecordsOperation;
  objc_msgSendSuper2(&v16, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(NSArray *)recordsToSave
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(NSArray *)recordIDsToDelete
{
}

- (CKRecordSavePolicy)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(CKRecordSavePolicy)savePolicy
{
  self->_savePolicy = savePolicy;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(NSData *)clientChangeTokenData
{
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)atomic
{
  self->_atomic = atomic;
}

- (NSMutableArray)savedRecords
{
  return self->_savedRecords;
}

- (void)setSavedRecords:(id)a3
{
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
}

- (NSMutableDictionary)recordsByRecordIDs
{
  return self->_recordsByRecordIDs;
}

- (void)setRecordsByRecordIDs:(id)a3
{
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
}

- (NSMutableDictionary)assetsByRecordIDAndRecordKey
{
  return self->_assetsByRecordIDAndRecordKey;
}

- (void)setAssetsByRecordIDAndRecordKey:(id)a3
{
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_shouldReportRecordsInFlight = a3;
}

- (NSMutableSet)packagesToDestroy
{
  return self->_packagesToDestroy;
}

- (void)setPackagesToDestroy:(id)a3
{
}

- (id)recordsInFlightBlock_wrapper
{
  return self->_recordsInFlightBlock_wrapper;
}

- (void)setRecordsInFlightBlock_wrapper:(id)a3
{
}

- (id)perRecordProgressBlock_wrapper
{
  return self->_perRecordProgressBlock_wrapper;
}

- (void)setPerRecordProgressBlock_wrapper:(id)a3
{
}

- (id)perRecordSaveBlock_wrapper
{
  return self->_perRecordSaveBlock_wrapper;
}

- (void)setPerRecordSaveBlock_wrapper:(id)a3
{
}

- (id)perRecordDeleteBlock_wrapper
{
  return self->_perRecordDeleteBlock_wrapper;
}

- (void)setPerRecordDeleteBlock_wrapper:(id)a3
{
}

- (id)modifyRecordsCompletionBlock_wrapper
{
  return self->_modifyRecordsCompletionBlock_wrapper;
}

- (void)setModifyRecordsCompletionBlock_wrapper:(id)a3
{
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchuint64_t PCSFromServer = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_uint64_t shouldOnlySaveAssetContent = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong(&self->_modifyRecordsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordSaveBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordProgressBlock_wrapper, 0);
  objc_storeStrong(&self->_recordsInFlightBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_assetsByRecordIDAndRecordKey, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_recordsByRecordIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_recordsInFlightBlock, 0);
  objc_storeStrong(&self->_modifyRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordSaveBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);

  objc_storeStrong(&self->_perRecordProgressBlock, 0);
}

@end