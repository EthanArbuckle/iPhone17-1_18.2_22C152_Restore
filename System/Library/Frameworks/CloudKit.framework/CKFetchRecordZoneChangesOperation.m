@interface CKFetchRecordZoneChangesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)fetchAllChanges;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)shouldFetchAssetContents;
- (BOOL)shouldReportAllPerItemFailures;
- (CKFetchRecordZoneChangesOperation)init;
- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs configurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID;
- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs optionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (NSDictionary)optionsByRecordZoneID;
- (NSDictionary)supplementalChangeTokenByZoneID;
- (NSMutableDictionary)perItemErrors;
- (NSMutableDictionary)statusByZoneID;
- (NSMutableSet)zoneIDsWithPendingArchivedRecords;
- (NSMutableSet)zoneIDsWithSyncObligations;
- (id)activityCreate;
- (id)fetchRecordZoneChangesCompletionBlock_wrapper;
- (id)partialFailureForItemsInZone:(id)a3;
- (id)perRecordChangeCompletionBlock;
- (id)recordWasChangedBlock_wrapper;
- (id)recordWithIDWasDeletedBlock_wrapper;
- (id)recordZoneChangesStatusByZoneID;
- (id)recordZoneFetchCompletionBlock_wrapper;
- (id)recordZoneIDsWithPendingArchivedRecords;
- (id)recordZoneIDsWithSyncObligations;
- (id)zoneAttributesChangedBlock;
- (id)zoneAttributesChangedBlock_wrapper;
- (int64_t)changeTypesFromSetCallbacks;
- (int64_t)errorReportingStyle;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchRecordZoneChangesCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleAttributesChangedForZone:(id)a3;
- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 recordChangesStatus:(int64_t)a6 hasPendingArchivedRecords:(BOOL)a7 syncObligationZoneIDs:(id)a8 error:(id)a9 reply:(id)a10;
- (void)handleDeleteForRecordID:(id)a3 recordType:(id)a4;
- (void)performCKOperation;
- (void)recordChangedBlock;
- (void)recordWasChangedBlock;
- (void)recordWithIDWasDeletedBlock;
- (void)recordZoneChangeTokensUpdatedBlock;
- (void)recordZoneFetchCompletionBlock;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setConfigurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID;
- (void)setErrorReportingStyle:(int64_t)a3;
- (void)setFetchAllChanges:(BOOL)fetchAllChanges;
- (void)setFetchRecordZoneChangesCompletionBlock:(void *)fetchRecordZoneChangesCompletionBlock;
- (void)setFetchRecordZoneChangesCompletionBlock_wrapper:(id)a3;
- (void)setOptionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID;
- (void)setPerItemErrors:(id)a3;
- (void)setPerRecordChangeCompletionBlock:(id)a3;
- (void)setRecordChangedBlock:(void *)recordChangedBlock;
- (void)setRecordWasChangedBlock:(void *)recordWasChangedBlock;
- (void)setRecordWasChangedBlock_wrapper:(id)a3;
- (void)setRecordWithIDWasDeletedBlock:(void *)recordWithIDWasDeletedBlock;
- (void)setRecordWithIDWasDeletedBlock_wrapper:(id)a3;
- (void)setRecordZoneChangeTokensUpdatedBlock:(void *)recordZoneChangeTokensUpdatedBlock;
- (void)setRecordZoneFetchCompletionBlock:(void *)recordZoneFetchCompletionBlock;
- (void)setRecordZoneFetchCompletionBlockIVar:(id)a3;
- (void)setRecordZoneFetchCompletionBlock_wrapper:(id)a3;
- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs;
- (void)setShouldFetchAssetContents:(BOOL)a3;
- (void)setShouldReportAllPerItemFailures:(BOOL)a3;
- (void)setStatusByZoneID:(id)a3;
- (void)setSupplementalChangeTokenByZoneID:(id)a3;
- (void)setZoneAttributesChangedBlock:(id)a3;
- (void)setZoneAttributesChangedBlock_wrapper:(id)a3;
- (void)setZoneIDsWithPendingArchivedRecords:(id)a3;
- (void)setZoneIDsWithSyncObligations:(id)a3;
@end

@implementation CKFetchRecordZoneChangesOperation

- (CKFetchRecordZoneChangesOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKFetchRecordZoneChangesOperation;
  v2 = [(CKOperation *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    statusByZoneID = v2->_statusByZoneID;
    v2->_statusByZoneID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    zoneIDsWithPendingArchivedRecords = v2->_zoneIDsWithPendingArchivedRecords;
    v2->_zoneIDsWithPendingArchivedRecords = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    zoneIDsWithSyncObligations = v2->_zoneIDsWithSyncObligations;
    v2->_zoneIDsWithSyncObligations = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v9;

    v2->_shouldFetchAssetContents = 1;
    v2->_fetchAllChanges = 1;
    v2->_errorReportingStyle = 1;
  }
  return v2;
}

- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs configurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID
{
  v6 = recordZoneIDs;
  uint64_t v7 = configurationsByRecordZoneID;
  v14 = (CKFetchRecordZoneChangesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZoneIDs;
    v14->_recordZoneIDs = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_configurationsByRecordZoneID;
    v14->_configurationsByRecordZoneID = (NSDictionary *)v20;
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
    v14[2] = sub_18B12DE38;
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12E030;
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

- (void)setRecordWasChangedBlock:(void *)recordWasChangedBlock
{
  id v7 = recordWasChangedBlock;
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
    v14[2] = sub_18B12E1BC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordWasChangedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordWasChangedBlock;
    self->_recordWasChangedBlock = v11;
LABEL_9:
  }
}

- (void)recordWasChangedBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12E3B4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordWasChangedBlock);
  }

  return v8;
}

- (void)setZoneAttributesChangedBlock:(id)a3
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
    v14[2] = sub_18B12E540;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id zoneAttributesChangedBlock = v15;
    goto LABEL_9;
  }
  if (self->_zoneAttributesChangedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id zoneAttributesChangedBlock = self->_zoneAttributesChangedBlock;
    self->_id zoneAttributesChangedBlock = v11;
LABEL_9:
  }
}

- (id)zoneAttributesChangedBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12E738;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_zoneAttributesChangedBlock);
  }

  return v8;
}

- (void)setPerRecordChangeCompletionBlock:(id)a3
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
    v14[2] = sub_18B12E8C4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordChangeCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordChangeCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordChangeCompletionBlock = self->_perRecordChangeCompletionBlock;
    self->_id perRecordChangeCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perRecordChangeCompletionBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12EABC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordChangeCompletionBlock);
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
    v14[2] = sub_18B12EC48;
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12EE40;
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

- (void)setRecordZoneChangeTokensUpdatedBlock:(void *)recordZoneChangeTokensUpdatedBlock
{
  id v7 = recordZoneChangeTokensUpdatedBlock;
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
    v14[2] = sub_18B12EFCC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneChangeTokensUpdatedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_recordZoneChangeTokensUpdatedBlock;
    self->_recordZoneChangeTokensUpdatedBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneChangeTokensUpdatedBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12F1C4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneChangeTokensUpdatedBlock);
  }

  return v8;
}

- (void)setRecordZoneFetchCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B12F350;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordZoneFetchCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneFetchCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordZoneFetchCompletionBlock = self->_recordZoneFetchCompletionBlock;
    self->_id recordZoneFetchCompletionBlock = v11;
LABEL_9:
  }
}

- (void)recordZoneFetchCompletionBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12F548;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordZoneFetchCompletionBlock);
  }

  return v8;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(void *)fetchRecordZoneChangesCompletionBlock
{
  id v7 = fetchRecordZoneChangesCompletionBlock;
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
    v14[2] = sub_18B12F6D4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_fetchRecordZoneChangesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_fetchRecordZoneChangesCompletionBlock;
    self->_fetchRecordZoneChangesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchRecordZoneChangesCompletionBlock
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
    id v15 = sub_18AF14074;
    v16 = sub_18AF13980;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12F8CC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchRecordZoneChangesCompletionBlock);
  }

  return v8;
}

- (void)setRecordZoneFetchCompletionBlock:(void *)recordZoneFetchCompletionBlock
{
  BOOL v4 = recordZoneFetchCompletionBlock == 0;
  id v9 = recordZoneFetchCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setRecordZoneFetchCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (id)recordZoneChangesStatusByZoneID
{
  BOOL v4 = objc_msgSend_statusByZoneID(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)recordZoneIDsWithPendingArchivedRecords
{
  BOOL v4 = objc_msgSend_zoneIDsWithPendingArchivedRecords(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)recordZoneIDsWithSyncObligations
{
  BOOL v4 = objc_msgSend_zoneIDsWithSyncObligations(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_allObjects(v4, v5, v6, v7);

  return v8;
}

- (void)setErrorReportingStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 2, v3);
    uint64_t v8 = objc_opt_class();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v9, (uint64_t)a2, (uint64_t)self, @"CKFetchRecordZoneChangesOperation.m", 121, @"%@ doesn't support error reporting style %lld", v8, 2);
  }
  self->_errorReportingStyle = a3;
}

- (void)fillOutOperationInfo:(id)a3
{
  BOOL v4 = (id *)a3;
  uint64_t v8 = objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v15, (uint64_t)v14, v16);

  char AssetContents = objc_msgSend_shouldFetchAssetContents(self, v17, v18, v19);
  if (v4)
  {
    *((unsigned char *)v4 + 144) = AssetContents;
    v4[21] = (id)objc_msgSend_changeTypesFromSetCallbacks(self, v21, v22, v23);
  }
  else
  {
    objc_msgSend_changeTypesFromSetCallbacks(self, v21, v22, v23);
  }
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v24, v25, v26);
  objc_msgSend_setFetchAllChanges_(v4, v28, AllChanges, v29);
  v33 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v30, v31, v32);
  id v34 = v33;
  if (v4) {
    objc_storeStrong(v4 + 22, v33);
  }

  v38 = objc_msgSend_supplementalChangeTokenByZoneID(self, v35, v36, v37);
  objc_msgSend_setSupplementalChangeTokenByZoneID_(v4, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_errorReportingStyle(self, v41, v42, v43);
  objc_msgSend_setErrorReportingStyle_(v4, v45, v44, v46);
  v47.receiver = self;
  v47.super_class = (Class)CKFetchRecordZoneChangesOperation;
  [(CKDatabaseOperation *)&v47 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CKFetchRecordZoneChangesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v47 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordZoneIDs(v4, v5, v6, v7, v47.receiver, v47.super_class);
  objc_msgSend_setRecordZoneIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_configurationsByRecordZoneID(v4, v11, v12, v13);
  objc_msgSend_setConfigurationsByRecordZoneID_(self, v15, (uint64_t)v14, v16);

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v17, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(self, v21, AssetContents, v22);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v4, v23, v24, v25);
  objc_msgSend_setFetchAllChanges_(self, v27, AllChanges, v28);
  uint64_t v32 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v29, v30, v31);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_supplementalChangeTokenByZoneID(v4, v35, v36, v37);
  objc_msgSend_setSupplementalChangeTokenByZoneID_(self, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_errorReportingStyle(v4, v41, v42, v43);
  objc_msgSend_setErrorReportingStyle_(self, v45, v44, v46);
}

- (int64_t)changeTypesFromSetCallbacks
{
  return 2;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v33.receiver = self;
  v33.super_class = (Class)CKFetchRecordZoneChangesOperation;
  if ([(CKOperation *)&v33 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordChangedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordWasChangedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_perRecordChangeCompletionBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v22 = objc_msgSend_recordWithIDWasDeletedBlock(self, v15, v16, v17);
        if (v22)
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v26 = objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v19, v20, v21);
          if (v26)
          {
            BOOL v6 = 1;
          }
          else
          {
            uint64_t v30 = objc_msgSend_recordZoneFetchCompletionBlock(self, v23, v24, v25);
            if (v30)
            {
              BOOL v6 = 1;
            }
            else
            {
              uint64_t v31 = objc_msgSend_fetchRecordZoneChangesCompletionBlock(self, v27, v28, v29);
              BOOL v6 = v31 != 0;
            }
          }
        }
      }
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_recordZoneIDs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = objc_msgSend_recordZoneIDs(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v14);
          }
          if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v17, *(void *)(*((void *)&v26 + 1) + 8 * v20), (uint64_t)a3))
          {

            return 0;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v18) {
          continue;
        }
        break;
      }
    }

    v25.receiver = self;
    v25.super_class = (Class)CKFetchRecordZoneChangesOperation;
    return [(CKDatabaseOperation *)&v25 CKOperationShouldRun:a3];
  }
  else
  {
    if (a3)
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, @"CKErrorDomain", 12, @"You must pass at least one zone ID to %@", v23);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchRecordZoneChangesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_recordZoneIDs(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);
    uint64_t v16 = objc_msgSend_recordZoneIDs(self, v13, v14, v15);
    if (objc_msgSend_count(v16, v17, v18, v19) == 1) {
      uint64_t v23 = &stru_1ED7F5C98;
    }
    else {
      uint64_t v23 = @"s";
    }
    if (objc_msgSend_fetchAllChanges(self, v20, v21, v22)) {
      long long v27 = &stru_1ED7F5C98;
    }
    else {
      long long v27 = @" NOT";
    }
    long long v28 = objc_msgSend_configurationsByRecordZoneID(self, v24, v25, v26);
    *(_DWORD *)buf = 134218754;
    uint64_t v31 = v12;
    __int16 v32 = 2114;
    objc_super v33 = v23;
    __int16 v34 = 2114;
    v35 = v27;
    __int16 v36 = 2112;
    uint64_t v37 = v28;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Fetching changes from the server for %lu zone%{public}@. Will%{public}@ fetch all changes. Options by zone:\n%@", buf, 0x2Au);
  }
  v29.receiver = self;
  v29.super_class = (Class)CKFetchRecordZoneChangesOperation;
  [(CKOperation *)&v29 performCKOperation];
}

- (void)handleChangeForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = sub_18B1309B4;
  v119[3] = &unk_1E5464380;
  v119[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v9, v14, (uint64_t)v119, v15);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v17 = signpost;

  if (v13)
  {
    if (!v17) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    uint64_t v23 = objc_msgSend_log(v19, v20, v21, v22);

    if (self) {
      uint64_t v24 = self->super.super._signpost;
    }
    else {
      uint64_t v24 = 0;
    }
    uint64_t v25 = v24;
    uint64_t v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    v121 = v8;
    __int16 v122 = 2112;
    v123 = v13;
    uint64_t v30 = "Record %@ changed with error: %@";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v29;
    uint32_t v33 = 22;
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_22;
  }
  if (self) {
    __int16 v34 = self->super.super._signpost;
  }
  else {
    __int16 v34 = 0;
  }
  v35 = v34;
  uint64_t v23 = objc_msgSend_log(v35, v36, v37, v38);

  if (self) {
    v39 = self->super.super._signpost;
  }
  else {
    v39 = 0;
  }
  uint64_t v40 = v39;
  uint64_t v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 138412290;
    v121 = v8;
    uint64_t v30 = "Record %@ changed";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v44;
    uint32_t v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v31, OS_SIGNPOST_EVENT, v32, "CKFetchRecordZoneChangesOperation", v30, buf, v33);
  }
LABEL_21:

LABEL_22:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v45 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v92 = v45;
    objc_msgSend_operationID(self, v93, v94, v95);
    v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isMergeableValueDeltaRecord(v9, v97, v98, v99)) {
      v103 = @"mergeable delta partial ";
    }
    else {
      v103 = &stru_1ED7F5C98;
    }
    v104 = objc_msgSend_recordChangeTag(v9, v100, v101, v102);
    *(_DWORD *)buf = 138544386;
    v121 = v96;
    __int16 v122 = 2112;
    v123 = v103;
    __int16 v124 = 2112;
    v125 = v8;
    __int16 v126 = 2112;
    v127 = v104;
    __int16 v128 = 2112;
    v129 = v13;
    _os_log_debug_impl(&dword_18AF10000, v92, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a changed %@record with id %@ etag=%@, error %@", buf, 0x34u);

    if (!v13) {
      goto LABEL_31;
    }
  }
  else if (!v13)
  {
    goto LABEL_31;
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48) & 1) == 0)
  {
    v52 = objc_msgSend_perItemErrors(self, v49, v50, v51);
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v13, (uint64_t)v8);
  }
  if (objc_msgSend_CKHasTopLevelUnderlyingError(v13, v49, v50, v51))
  {
    v57 = objc_msgSend_perItemErrors(self, v54, v55, v56);
    v61 = objc_msgSend_zoneID(v8, v58, v59, v60);
    objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)v13, (uint64_t)v61);
  }
  id v9 = 0;
LABEL_31:
  v63 = objc_msgSend_recordWasChangedBlock_wrapper(self, v46, v47, v48);
  v67 = v63;
  if (v63)
  {
    v68 = (void (**)(void *, id, id, void *))_Block_copy(v63);
  }
  else
  {
    v69 = objc_msgSend_recordWasChangedBlock(self, v64, v65, v66);
    v68 = (void (**)(void *, id, id, void *))_Block_copy(v69);
  }
  if (v68)
  {
    v68[2](v68, v8, v9, v13);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v73 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
LABEL_51:
      v87 = v73;
      objc_msgSend_operationID(self, v88, v89, v90);
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v121 = v91;
      __int16 v122 = 2112;
      v123 = v8;
      _os_log_debug_impl(&dword_18AF10000, v87, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ recordID %@ is done", buf, 0x16u);
LABEL_52:
    }
  }
  else
  {
    v77 = objc_msgSend_perRecordChangeCompletionBlock(self, v70, v71, v72);

    if (v77)
    {
      objc_msgSend_perRecordChangeCompletionBlock(self, v78, v79, v80);
      v81 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, __CFString *, __CFString *))v81)[2](v81, v9, v8, v13);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v73 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_51;
      }
    }
    else
    {
      v82 = objc_msgSend_recordChangedBlock(self, v78, v79, v80);

      if (v82)
      {
        if (!v13 && v9)
        {
          objc_msgSend_recordChangedBlock(self, v83, v84, v85);
          v86 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, id))v86)[2](v86, v9);
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v73 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_51;
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v105 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v87 = v105;
          objc_msgSend_operationID(self, v112, v113, v114);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v9, v115, v116, v117);
          v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v121 = v91;
          __int16 v122 = 2112;
          v123 = v118;
          _os_log_debug_impl(&dword_18AF10000, v87, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a changed record (%@), but no recordWasChangedBlock or recordChangedBlock has been set.", buf, 0x16u);

          goto LABEL_52;
        }
      }
    }
  }
  v106 = objc_msgSend_configuration(self, v74, v75, v76);
  v110 = objc_msgSend_container(v106, v107, v108, v109);
  objc_msgSend_handleRecordChanged_changeType_record_error_(v110, v111, (uint64_t)v8, 1, v9, v13);
}

- (void)handleDeleteForRecordID:(id)a3 recordType:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v9 = signpost;

  if (v9)
  {
    if (self) {
      uint64_t v13 = self->super.super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    uint64_t v18 = objc_msgSend_log(v14, v15, v16, v17);

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
      *(_DWORD *)v58 = 138412290;
      *(void *)&v58[4] = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v18, OS_SIGNPOST_EVENT, v24, "CKFetchRecordZoneChangesOperation", "Record %@ deleted", v58, 0xCu);
    }
  }
  uint64_t v25 = objc_msgSend_recordWithIDWasDeletedBlock_wrapper(self, v10, v11, v12);
  uint64_t v29 = v25;
  if (v25)
  {
    uint64_t v30 = (void (**)(void *, id, id))_Block_copy(v25);
  }
  else
  {
    uint64_t v31 = objc_msgSend_recordWithIDWasDeletedBlock(self, v26, v27, v28);
    uint64_t v30 = (void (**)(void *, id, id))_Block_copy(v31);
  }
  if (v30)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    os_signpost_id_t v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v50 = v32;
      v54 = objc_msgSend_operationID(self, v51, v52, v53);
      *(_DWORD *)v58 = 138543618;
      *(void *)&v58[4] = v54;
      *(_WORD *)&v58[12] = 2112;
      *(void *)&v58[14] = v6;
      _os_log_debug_impl(&dword_18AF10000, v50, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a deleted record with id %@", v58, 0x16u);
    }
    v30[2](v30, v6, v7);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint32_t v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = v33;
      v41 = objc_msgSend_operationID(self, v38, v39, v40);
      *(_DWORD *)v58 = 138543618;
      *(void *)&v58[4] = v41;
      *(_WORD *)&v58[12] = 2112;
      *(void *)&v58[14] = v6;
      uint64_t v42 = "Progress callback for operation %{public}@ recordID %@ is done";
LABEL_29:
      _os_log_debug_impl(&dword_18AF10000, v37, OS_LOG_TYPE_DEBUG, v42, v58, 0x16u);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v43 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = v43;
      v41 = objc_msgSend_operationID(self, v55, v56, v57);
      *(_DWORD *)v58 = 138543618;
      *(void *)&v58[4] = v41;
      *(_WORD *)&v58[12] = 2112;
      *(void *)&v58[14] = v6;
      uint64_t v42 = "Operation %{public}@ received a deleted record (%@), but no recordWithIDWasDeletedBlock has been set.";
      goto LABEL_29;
    }
  }
  uint64_t v44 = objc_msgSend_configuration(self, v34, v35, v36, *(_OWORD *)v58, *(void *)&v58[16], v59);
  uint64_t v48 = objc_msgSend_container(v44, v45, v46, v47);
  objc_msgSend_handleRecordChanged_changeType_record_error_(v48, v49, (uint64_t)v6, 3, 0, 0);
}

- (void)handleAttributesChangedForZone:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
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
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
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
      uint64_t v25 = objc_msgSend_zoneID(v4, v22, v23, v24);
      *(_DWORD *)uint64_t v71 = 138412290;
      *(void *)&v71[4] = v25;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZoneChangesOperation", "Zone %@ attributes changed", v71, 0xCu);
    }
  }
  uint64_t v26 = objc_msgSend_zoneAttributesChangedBlock_wrapper(self, v7, v8, v9);
  uint64_t v30 = v26;
  if (v26)
  {
    uint64_t v31 = (void (**)(void *, id))_Block_copy(v26);
  }
  else
  {
    os_signpost_id_t v32 = objc_msgSend_zoneAttributesChangedBlock(self, v27, v28, v29);
    uint64_t v31 = (void (**)(void *, id))_Block_copy(v32);
  }
  if (v31)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint32_t v33 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = v33;
      uint64_t v60 = objc_msgSend_operationID(self, v57, v58, v59);
      v64 = objc_msgSend_zoneID(v4, v61, v62, v63);
      *(_DWORD *)uint64_t v71 = 138543618;
      *(void *)&v71[4] = v60;
      *(_WORD *)&v71[12] = 2112;
      *(void *)&v71[14] = v64;
      _os_log_debug_impl(&dword_18AF10000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about zone attributes changed for zone with ID %@", v71, 0x16u);
    }
    v31[2](v31, v4);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    __int16 v34 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = v34;
      uint64_t v42 = objc_msgSend_operationID(self, v39, v40, v41);
      uint64_t v46 = objc_msgSend_zoneID(v4, v43, v44, v45);
      *(_DWORD *)uint64_t v71 = 138543618;
      *(void *)&v71[4] = v42;
      *(_WORD *)&v71[12] = 2112;
      *(void *)&v71[14] = v46;
      uint64_t v47 = "Progress callback for zone attributes changed operation %{public}@ zoneID %@ is done";
LABEL_29:
      _os_log_debug_impl(&dword_18AF10000, v38, OS_LOG_TYPE_DEBUG, v47, v71, 0x16u);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = v48;
      uint64_t v42 = objc_msgSend_operationID(self, v65, v66, v67);
      uint64_t v46 = objc_msgSend_zoneID(v4, v68, v69, v70);
      *(_DWORD *)uint64_t v71 = 138543618;
      *(void *)&v71[4] = v42;
      *(_WORD *)&v71[12] = 2112;
      *(void *)&v71[14] = v46;
      uint64_t v47 = "Operation %{public}@ received a zone attributes change (%@), but no zoneAttributesChangedBlock has been set.";
      goto LABEL_29;
    }
  }
  v49 = objc_msgSend_configuration(self, v35, v36, v37, *(_OWORD *)v71, *(void *)&v71[16], v72);
  uint64_t v53 = objc_msgSend_container(v49, v50, v51, v52);
  objc_msgSend_handleAttributesChangedForZone_(v53, v54, (uint64_t)v4, v55);
}

- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 recordChangesStatus:(int64_t)a6 hasPendingArchivedRecords:(BOOL)a7 syncObligationZoneIDs:(id)a8 error:(id)a9 reply:(id)a10
{
  BOOL v11 = a7;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v130 = a4;
  id v131 = a5;
  id v16 = a8;
  uint64_t v17 = (void (**)(id, void))a10;
  objc_msgSend_CKClientSuitableError(a9, v18, v19, v20);
  uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    uint64_t v25 = objc_msgSend_perItemErrors(self, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v24, (uint64_t)v15);
  }
  if (a6 != -1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v107 = v27;
      v111 = objc_msgSend_operationID(self, v108, v109, v110);
      *(_DWORD *)buf = 138543874;
      v134 = v111;
      __int16 v135 = 2048;
      int64_t v136 = a6;
      __int16 v137 = 2112;
      id v138 = v15;
      _os_log_debug_impl(&dword_18AF10000, v107, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating recordChangesStatus to %ld for record zone %@", buf, 0x20u);
    }
    uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v28, a6, v29);
    __int16 v34 = objc_msgSend_statusByZoneID(self, v31, v32, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v30, (uint64_t)v15);
  }
  if (v11)
  {
    uint64_t v36 = objc_msgSend_zoneIDsWithPendingArchivedRecords(self, v21, v22, v23);
    objc_msgSend_addObject_(v36, v37, (uint64_t)v15, v38);
  }
  if (objc_msgSend_count(v16, v21, v22, v23))
  {
    uint64_t v42 = objc_msgSend_zoneIDsWithSyncObligations(self, v39, v40, v41);
    objc_msgSend_unionSet_(v42, v43, (uint64_t)v16, v44);
  }
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v46 = signpost;

  if (v46)
  {
    if (self) {
      uint64_t v50 = self->super.super._signpost;
    }
    else {
      uint64_t v50 = 0;
    }
    uint64_t v51 = v50;
    uint64_t v55 = objc_msgSend_log(v51, v52, v53, v54);

    if (self) {
      uint64_t v56 = self->super.super._signpost;
    }
    else {
      uint64_t v56 = 0;
    }
    uint64_t v57 = v56;
    os_signpost_id_t v61 = objc_msgSend_identifier(v57, v58, v59, v60);

    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v55, OS_SIGNPOST_EVENT, v61, "CKFetchRecordZoneChangesOperation", "Progress callback", buf, 2u);
    }
  }
  int AllChanges = objc_msgSend_fetchAllChanges(self, v47, v48, v49);
  if (v24 || a6 == 3 || !AllChanges)
  {
    uint64_t v65 = v130;
    if (v24)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v76 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v117 = v76;
        v121 = objc_msgSend_operationID(self, v118, v119, v120);
        *(_DWORD *)buf = 138544386;
        v134 = v121;
        __int16 v135 = 2114;
        int64_t v136 = (int64_t)v130;
        __int16 v137 = 2114;
        id v138 = v131;
        __int16 v139 = 2112;
        id v140 = v15;
        __int16 v141 = 2112;
        v142 = v24;
        _os_log_debug_impl(&dword_18AF10000, v117, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %{public}@, client change token data %{public}@ for zoneID %@. Error was: %@", buf, 0x34u);
      }
      uint64_t v80 = objc_msgSend_recordZoneFetchCompletionBlock_wrapper(self, v77, v78, v79);
      uint64_t v84 = v80;
      if (v80)
      {
        uint64_t v75 = (__CFString *)_Block_copy(v80);
      }
      else
      {
        uint64_t v99 = objc_msgSend_recordZoneFetchCompletionBlock(self, v81, v82, v83);
        uint64_t v75 = (__CFString *)_Block_copy(v99);
      }
      uint64_t v66 = v131;
      if (v75) {
        ((void (*)(__CFString *, id, void, void, void, __CFString *))v75->data)(v75, v15, 0, 0, 0, v24);
      }
    }
    else
    {
      uint64_t v85 = objc_msgSend_partialFailureForItemsInZone_(self, v63, (uint64_t)v15, v64);
      objc_msgSend_CKClientSuitableError(v85, v86, v87, v88);
      uint64_t v75 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v89 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        __int16 v122 = v89;
        __int16 v126 = objc_msgSend_operationID(self, v123, v124, v125);
        *(_DWORD *)buf = 138544642;
        v127 = @" Error was: ";
        v134 = v126;
        __int16 v128 = &stru_1ED7F5C98;
        __int16 v135 = 2112;
        if (!v75) {
          v127 = &stru_1ED7F5C98;
        }
        int64_t v136 = (int64_t)v130;
        if (v75) {
          __int16 v128 = v75;
        }
        __int16 v137 = 2114;
        id v138 = v131;
        __int16 v139 = 2112;
        id v140 = v15;
        __int16 v141 = 2114;
        v142 = v127;
        __int16 v143 = 2112;
        v144 = v128;
        _os_log_debug_impl(&dword_18AF10000, v122, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %@, client change token data %{public}@ for zoneID %@.%{public}@%@", buf, 0x3Eu);
      }
      v93 = objc_msgSend_recordZoneFetchCompletionBlock_wrapper(self, v90, v91, v92, v16);
      v97 = v93;
      if (v93)
      {
        uint64_t v98 = (void (**)(void *, id, void *, id, BOOL, void))_Block_copy(v93);
      }
      else
      {
        v100 = objc_msgSend_recordZoneFetchCompletionBlock(self, v94, v95, v96);
        uint64_t v98 = (void (**)(void *, id, void *, id, BOOL, void))_Block_copy(v100);

        uint64_t v65 = v130;
      }

      if (v98) {
        ((void (**)(void *, id, void *, id, BOOL, __CFString *))v98)[2](v98, v15, v65, v131, a6 != 3, v75);
      }

      uint64_t v66 = v131;
      id v16 = v129;
    }
    goto LABEL_52;
  }
  uint64_t v65 = v130;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v66 = v131;
  uint64_t v67 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v112 = v67;
    uint64_t v116 = objc_msgSend_operationID(self, v113, v114, v115);
    *(_DWORD *)buf = 138544130;
    v134 = v116;
    __int16 v135 = 2114;
    int64_t v136 = (int64_t)v130;
    __int16 v137 = 2114;
    id v138 = v131;
    __int16 v139 = 2112;
    id v140 = v15;
    _os_log_debug_impl(&dword_18AF10000, v112, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@, client change token data %{public}@ for zoneID %@", buf, 0x2Au);

    uint64_t v66 = v131;
  }
  uint64_t v71 = objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v68, v69, v70);

  if (v71)
  {
    objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v72, v73, v74);
    uint64_t v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    ((void (*)(__CFString *, id, id, void *))v75->data)(v75, v15, v130, v66);
LABEL_52:
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v101 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v102 = v101;
    v106 = objc_msgSend_operationID(self, v103, v104, v105);
    *(_DWORD *)buf = 138543618;
    v134 = v106;
    __int16 v135 = 2112;
    int64_t v136 = (int64_t)v15;
    _os_log_debug_impl(&dword_18AF10000, v102, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ zoneID %@ is done", buf, 0x16u);

    uint64_t v65 = v130;
  }
  v17[2](v17, 0);
}

- (id)partialFailureForItemsInZone:(id)a3
{
  id v7 = a3;
  if (v7
    && (objc_msgSend_perItemErrors(self, v4, v5, v6),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11),
        v8,
        v12))
  {
    id v16 = objc_msgSend_perItemErrors(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_allKeys(v16, v17, v18, v19);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_18B131B60;
    v36[3] = &unk_1E5465018;
    id v21 = v7;
    id v37 = v21;
    uint64_t v38 = self;
    uint64_t v24 = objc_msgSend_CKCompactMapToDictionary_(v20, v22, (uint64_t)v36, v23);

    if (objc_msgSend_count(v24, v25, v26, v27))
    {
      uint64_t v31 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v24, @"CKPartialErrors");
      __int16 v34 = objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v31, @"Couldn't fetch some items when fetching changes in zone %@", v21);
    }
    else
    {
      __int16 v34 = 0;
    }
  }
  else
  {
    __int16 v34 = 0;
  }

  return v34;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
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
      id v16 = self->super.super._signpost;
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchRecordZoneChangesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_perItemErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_perItemErrors(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Couldn't fetch some items when fetching changes");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  __int16 v34 = objc_msgSend_fetchRecordZoneChangesCompletionBlock_wrapper(self, v7, v8, v9);
  uint64_t v38 = v34;
  if (v34)
  {
    uint64_t v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    uint64_t v40 = objc_msgSend_fetchRecordZoneChangesCompletionBlock(self, v35, v36, v37);
    uint64_t v39 = (void (**)(void *, void *))_Block_copy(v40);
  }
  if (v39)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v41 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v118 = objc_msgSend_operationID(self, v42, v43, v44);
      uint64_t v119 = &stru_1ED7F5C98;
      if (v4) {
        uint64_t v120 = @" Error was: ";
      }
      else {
        uint64_t v120 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v115, v116, v117);
        uint64_t v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v129 = v118;
      __int16 v130 = 2114;
      id v131 = v120;
      __int16 v132 = 2112;
      v133 = v119;
      _os_log_debug_impl(&dword_18AF10000, v41, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
    uint64_t v48 = objc_msgSend_CKClientSuitableError(v4, v45, v46, v47);
    v39[2](v39, v48);

    objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(self, v49, 0, v50);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v53 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v124 = objc_msgSend_operationID(self, v54, v55, v56);
      uint64_t v125 = &stru_1ED7F5C98;
      if (v4) {
        __int16 v126 = @" Error was: ";
      }
      else {
        __int16 v126 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v121, v122, v123);
        uint64_t v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v129 = v124;
      __int16 v130 = 2114;
      id v131 = v126;
      __int16 v132 = 2112;
      v133 = v125;
      _os_log_debug_impl(&dword_18AF10000, v53, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchRecordZoneChangesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
  }
  objc_msgSend_setRecordChangedBlock_(self, v51, 0, v52);
  objc_msgSend_setRecordWasChangedBlock_(self, v57, 0, v58);
  objc_msgSend_setRecordWithIDWasDeletedBlock_(self, v59, 0, v60);
  objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(self, v61, 0, v62);
  objc_msgSend_setRecordZoneFetchCompletionBlock_(self, v63, 0, v64);
  objc_msgSend_setPerRecordChangeCompletionBlock_(self, v65, 0, v66);
  if (self)
  {
    unint64_t mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      uint64_t v71 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v67, mergeableValueCount, v69);
      uint64_t v75 = objc_msgSend_operationMetric(self, v72, v73, v74);
      objc_msgSend_setObject_forKeyedSubscript_(v75, v76, (uint64_t)v71, @"mergeable_valueCount");
    }
    unint64_t mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      uint64_t v78 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v67, mergeableDeltaCount, v69);
      uint64_t v82 = objc_msgSend_operationMetric(self, v79, v80, v81);
      objc_msgSend_setObject_forKeyedSubscript_(v82, v83, (uint64_t)v78, @"mergeable_fetchedDeltaCount");
    }
    unint64_t assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      uint64_t v84 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v67, assetBackedMergeableDeltaCount, v69);
      uint64_t v88 = objc_msgSend_operationMetric(self, v85, v86, v87);
      objc_msgSend_setObject_forKeyedSubscript_(v88, v89, (uint64_t)v84, @"mergeable_assetCount");
    }
  }
  uint64_t v90 = objc_msgSend_recordZoneIDs(self, v67, assetBackedMergeableDeltaCount, v69);
  uint64_t v94 = objc_msgSend_count(v90, v91, v92, v93);

  if (v94)
  {
    uint64_t v98 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v99 = (void *)MEMORY[0x1E4F1C978];
    v100 = objc_msgSend_recordZoneIDs(self, v95, v96, v97);
    v103 = objc_msgSend_arrayWithObjects_(v99, v101, (uint64_t)v100, v102, 0);
    v106 = objc_msgSend_setWithArray_(v98, v104, (uint64_t)v103, v105);

    uint64_t v109 = objc_msgSend_zoneIDsToZoneNamesString_(self, v107, (uint64_t)v106, v108);
    uint64_t v113 = objc_msgSend_operationMetric(self, v110, v111, v112);
    objc_msgSend_setObject_forKeyedSubscript_(v113, v114, (uint64_t)v109, @"zoneNames");
  }
  v127.receiver = self;
  v127.super_class = (Class)CKFetchRecordZoneChangesOperation;
  [(CKOperation *)&v127 _finishOnCallbackQueueWithError:v4];
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
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      os_signpost_id_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchRecordZoneChangesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      id v7 = self->super.super._signpost;
    }
    else {
      id v7 = 0;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchRecordZoneChangesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
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

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v13, (uint64_t)v12, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_clientChangeTokenData_recordChangesStatus_hasPendingArchivedRecords_syncObligationZoneIDs_error_reply_, 5, 0);

  uint64_t v14 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v15, (uint64_t)v14, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_clientChangeTokenData_recordChangesStatus_hasPendingArchivedRecords_syncObligationZoneIDs_error_reply_, 6, 0);

  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CKFetchRecordZoneChangesOperation;
  objc_msgSendSuper2(&v16, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(NSArray *)recordZoneIDs
{
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(NSDictionary *)configurationsByRecordZoneID
{
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)fetchAllChanges
{
  self->_fetchint AllChanges = fetchAllChanges;
}

- (NSMutableDictionary)statusByZoneID
{
  return self->_statusByZoneID;
}

- (void)setStatusByZoneID:(id)a3
{
}

- (NSMutableSet)zoneIDsWithPendingArchivedRecords
{
  return self->_zoneIDsWithPendingArchivedRecords;
}

- (void)setZoneIDsWithPendingArchivedRecords:(id)a3
{
}

- (NSMutableSet)zoneIDsWithSyncObligations
{
  return self->_zoneIDsWithSyncObligations;
}

- (void)setZoneIDsWithSyncObligations:(id)a3
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

- (NSMutableDictionary)perItemErrors
{
  return self->_perItemErrors;
}

- (void)setPerItemErrors:(id)a3
{
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

- (BOOL)shouldReportAllPerItemFailures
{
  return self->_shouldReportAllPerItemFailures;
}

- (void)setShouldReportAllPerItemFailures:(BOOL)a3
{
  self->_shouldReportAllPerItemFailures = a3;
}

- (id)recordWasChangedBlock_wrapper
{
  return self->_recordWasChangedBlock_wrapper;
}

- (void)setRecordWasChangedBlock_wrapper:(id)a3
{
}

- (id)recordWithIDWasDeletedBlock_wrapper
{
  return self->_recordWithIDWasDeletedBlock_wrapper;
}

- (void)setRecordWithIDWasDeletedBlock_wrapper:(id)a3
{
}

- (id)recordZoneFetchCompletionBlock_wrapper
{
  return self->_recordZoneFetchCompletionBlock_wrapper;
}

- (void)setRecordZoneFetchCompletionBlock_wrapper:(id)a3
{
}

- (id)fetchRecordZoneChangesCompletionBlock_wrapper
{
  return self->_fetchRecordZoneChangesCompletionBlock_wrapper;
}

- (void)setFetchRecordZoneChangesCompletionBlock_wrapper:(id)a3
{
}

- (id)zoneAttributesChangedBlock_wrapper
{
  return self->_zoneAttributesChangedBlock_wrapper;
}

- (void)setZoneAttributesChangedBlock_wrapper:(id)a3
{
}

- (int64_t)errorReportingStyle
{
  return self->_errorReportingStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_zoneAttributesChangedBlock_wrapper, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock_wrapper, 0);
  objc_storeStrong(&self->_recordWasChangedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithSyncObligations, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithPendingArchivedRecords, 0);
  objc_storeStrong((id *)&self->_statusByZoneID, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_perRecordChangeCompletionBlock, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordWasChangedBlock, 0);

  objc_storeStrong(&self->_recordChangedBlock, 0);
}

- (CKFetchRecordZoneChangesOperation)initWithRecordZoneIDs:(NSArray *)recordZoneIDs optionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID
{
  uint64_t v6 = optionsByRecordZoneID;
  id v7 = recordZoneIDs;
  uint64_t v11 = objc_msgSend_allKeys(v6, v8, v9, v10);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B13312C;
  v19[3] = &unk_1E5465040;
  id v20 = v6;
  uint64_t v12 = v6;
  uint64_t v15 = objc_msgSend_CKMapToDictionary_(v11, v13, (uint64_t)v19, v14);

  uint64_t v17 = (CKFetchRecordZoneChangesOperation *)objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(self, v16, (uint64_t)v7, (uint64_t)v15);
  return v17;
}

- (NSDictionary)optionsByRecordZoneID
{
  uint64_t v5 = objc_msgSend_configurationsByRecordZoneID(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = objc_msgSend_configurationsByRecordZoneID(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_allKeys(v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_18B133294;
    v18[3] = &unk_1E5465040;
    v18[4] = self;
    objc_super v16 = objc_msgSend_CKMapToDictionary_(v13, v14, (uint64_t)v18, v15);
  }
  else
  {
    objc_super v16 = 0;
  }

  return (NSDictionary *)v16;
}

- (void)setOptionsByRecordZoneID:(NSDictionary *)optionsByRecordZoneID
{
  if (optionsByRecordZoneID)
  {
    objc_msgSend_CKMapValues_(optionsByRecordZoneID, a2, (uint64_t)&unk_1ED7EF498, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConfigurationsByRecordZoneID_(self, v5, (uint64_t)v7, v6);
  }
  else
  {
    objc_msgSend_setConfigurationsByRecordZoneID_(self, a2, 0, v3);
  }
}

@end