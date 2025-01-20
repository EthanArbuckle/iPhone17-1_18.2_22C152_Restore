@interface CKFetchArchivedRecordsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)fetchAllChanges;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)shouldFetchAssetContents;
- (CKFetchArchivedRecordsOperation)init;
- (CKFetchArchivedRecordsOperation)initWithRecordZoneIDs:(id)a3 configurationsByRecordZoneID:(id)a4;
- (NSArray)recordZoneIDs;
- (NSDictionary)assetTransferOptionsByRecordTypeAndKey;
- (NSDictionary)configurationsByRecordZoneID;
- (NSMutableDictionary)perItemErrors;
- (NSMutableDictionary)statusByZoneID;
- (id)activityCreate;
- (id)fetchArchivedRecordsCompletionBlock;
- (id)recordFetchedBlock;
- (id)recordZoneArchivesStatusByZoneID;
- (id)recordZoneChangeTokensUpdatedBlock;
- (id)recordZoneFetchCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 archivedRecordStatus:(int64_t)a5 error:(id)a6 reply:(id)a7;
- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchArchivedRecordsCompletionBlock:(id)a3;
- (void)setPerItemErrors:(id)a3;
- (void)setRecordFetchedBlock:(id)a3;
- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3;
- (void)setRecordZoneFetchCompletionBlock:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
- (void)setStatusByZoneID:(id)a3;
@end

@implementation CKFetchArchivedRecordsOperation

- (CKFetchArchivedRecordsOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFetchArchivedRecordsOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    statusByZoneID = v2->_statusByZoneID;
    v2->_statusByZoneID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v5;

    v2->_shouldFetchAssetContents = 1;
    v2->_fetchAllChanges = 1;
  }
  return v2;
}

- (CKFetchArchivedRecordsOperation)initWithRecordZoneIDs:(id)a3 configurationsByRecordZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14 = (CKFetchArchivedRecordsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    recordZoneIDs = v14->_recordZoneIDs;
    v14->_recordZoneIDs = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    configurationsByRecordZoneID = v14->_configurationsByRecordZoneID;
    v14->_configurationsByRecordZoneID = (NSDictionary *)v20;
  }
  return v14;
}

- (void)setRecordFetchedBlock:(id)a3
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
    v14[2] = sub_18B09BB44;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordFetchedBlock = self->_recordFetchedBlock;
    self->_id recordFetchedBlock = v11;
LABEL_9:
  }
}

- (id)recordFetchedBlock
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
    id v15 = sub_18AF13D80;
    v16 = sub_18AF138D8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B09BD3C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_recordFetchedBlock);
  }

  return v8;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
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
    v14[2] = sub_18B09BEC8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordZoneChangeTokensUpdatedBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordZoneChangeTokensUpdatedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordZoneChangeTokensUpdatedBlock = self->_recordZoneChangeTokensUpdatedBlock;
    self->_id recordZoneChangeTokensUpdatedBlock = v11;
LABEL_9:
  }
}

- (id)recordZoneChangeTokensUpdatedBlock
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
    id v15 = sub_18AF13D80;
    v16 = sub_18AF138D8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B09C0C0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_recordZoneChangeTokensUpdatedBlock);
  }

  return v8;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
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
    v14[2] = sub_18B09C24C;
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

- (id)recordZoneFetchCompletionBlock
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
    id v15 = sub_18AF13D80;
    v16 = sub_18AF138D8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B09C444;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_recordZoneFetchCompletionBlock);
  }

  return v8;
}

- (void)setFetchArchivedRecordsCompletionBlock:(id)a3
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
    v14[2] = sub_18B09C5D0;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchArchivedRecordsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchArchivedRecordsCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchArchivedRecordsCompletionBlock = self->_fetchArchivedRecordsCompletionBlock;
    self->_id fetchArchivedRecordsCompletionBlock = v11;
LABEL_9:
  }
}

- (id)fetchArchivedRecordsCompletionBlock
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
    id v15 = sub_18AF13D80;
    v16 = sub_18AF138D8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B09C7C8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_fetchArchivedRecordsCompletionBlock);
  }

  return v8;
}

- (id)recordZoneArchivesStatusByZoneID
{
  v4 = objc_msgSend_statusByZoneID(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  objc_super v8 = objc_msgSend_recordZoneIDs(self, v5, v6, v7);
  objc_msgSend_setRecordZoneIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_configurationsByRecordZoneID(self, v11, v12, v13);
  objc_msgSend_setConfigurationsByRecordZoneID_(v4, v15, (uint64_t)v14, v16);

  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(self, v17, v18, v19);
  objc_msgSend_setShouldFetchAssetContents_(v4, v21, AssetContents, v22);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v23, v24, v25);
  objc_msgSend_setFetchAllChanges_(v4, v27, AllChanges, v28);
  v32 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v29, v30, v31);
  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v4, v33, (uint64_t)v32, v34);

  v35.receiver = self;
  v35.super_class = (Class)CKFetchArchivedRecordsOperation;
  [(CKDatabaseOperation *)&v35 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)CKFetchArchivedRecordsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v35 fillFromOperationInfo:v4];
  uint64_t AssetContents = objc_msgSend_shouldFetchAssetContents(v4, v5, v6, v7, v35.receiver, v35.super_class);
  objc_msgSend_setShouldFetchAssetContents_(self, v9, AssetContents, v10);
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(v4, v11, v12, v13);
  objc_msgSend_setFetchAllChanges_(self, v15, AllChanges, v16);
  uint64_t v20 = objc_msgSend_configurationsByRecordZoneID(v4, v17, v18, v19);
  objc_msgSend_setConfigurationsByRecordZoneID_(self, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_recordZoneIDs(v4, v23, v24, v25);
  objc_msgSend_setRecordZoneIDs_(self, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v4, v29, v30, v31);

  objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(self, v33, (uint64_t)v32, v34);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v21.receiver = self;
  v21.super_class = (Class)CKFetchArchivedRecordsOperation;
  if ([(CKOperation *)&v21 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordFetchedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_recordZoneFetchCompletionBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v15, v16, v17);
        BOOL v6 = v19 != 0;
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
    v25.super_class = (Class)CKFetchArchivedRecordsOperation;
    return [(CKDatabaseOperation *)&v25 CKOperationShouldRun:a3];
  }
  else
  {
    if (a3)
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, @"CKErrorDomain", 12, @"You must pass at least one zone ID to %@", v23);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchArchivedRecordsOperation_withBlock_;
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v15 = signpost;

  if (v13)
  {
    if (v15)
    {
      if (self) {
        uint64_t v19 = self->super.super._signpost;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v20 = v19;
      uint64_t v24 = objc_msgSend_log(v20, v21, v22, v23);

      if (self) {
        objc_super v25 = self->super.super._signpost;
      }
      else {
        objc_super v25 = 0;
      }
      long long v26 = v25;
      os_signpost_id_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        int v70 = 138412546;
        id v71 = v8;
        __int16 v72 = 2112;
        v73 = v13;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchArchivedRecordsOperation", "Record %@ fetched with error: %@", (uint8_t *)&v70, 0x16u);
      }
    }
    uint64_t v31 = objc_msgSend_perItemErrors(self, v16, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);
LABEL_14:

    goto LABEL_15;
  }
  if (v15)
  {
    if (self) {
      v39 = self->super.super._signpost;
    }
    else {
      v39 = 0;
    }
    v40 = v39;
    uint64_t v31 = objc_msgSend_log(v40, v41, v42, v43);

    if (self) {
      v44 = self->super.super._signpost;
    }
    else {
      v44 = 0;
    }
    v45 = v44;
    os_signpost_id_t v49 = objc_msgSend_identifier(v45, v46, v47, v48);

    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      int v70 = 138412290;
      id v71 = v8;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v31, OS_SIGNPOST_EVENT, v49, "CKFetchArchivedRecordsOperation", "Record %@ fetched", (uint8_t *)&v70, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  if (!v9) {
    goto LABEL_22;
  }
  v33 = objc_msgSend_recordFetchedBlock(self, v16, v17, v18);

  if (v33)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v34 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v52 = v34;
      v56 = objc_msgSend_operationID(self, v53, v54, v55);
      v60 = objc_msgSend_recordID(v9, v57, v58, v59);
      int v70 = 138543618;
      id v71 = v56;
      __int16 v72 = 2112;
      v73 = v60;
      _os_log_debug_impl(&dword_18AF10000, v52, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a fetched record with id %@", (uint8_t *)&v70, 0x16u);
    }
    objc_msgSend_recordFetchedBlock(self, v35, v36, v37);
    v38 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v38)[2](v38, v9);

    goto LABEL_22;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v50 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v61 = v50;
    v65 = objc_msgSend_operationID(self, v62, v63, v64);
    v69 = objc_msgSend_recordID(v9, v66, v67, v68);
    int v70 = 138543618;
    id v71 = v65;
    __int16 v72 = 2112;
    v73 = v69;
    _os_log_debug_impl(&dword_18AF10000, v61, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received a fetched record (%@), but no recordFetchedBlock has been set.", (uint8_t *)&v70, 0x16u);

LABEL_22:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
  }
  v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v70 = 138412290;
    id v71 = v8;
    _os_log_debug_impl(&dword_18AF10000, v51, OS_LOG_TYPE_DEBUG, "Progress callback for record %@ is done", (uint8_t *)&v70, 0xCu);
  }
}

- (void)handleChangeSetCompletionForRecordZoneID:(id)a3 serverChangeToken:(id)a4 archivedRecordStatus:(int64_t)a5 error:(id)a6 reply:(id)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void))a7;
  objc_msgSend_CKClientSuitableError(a6, v15, v16, v17);
  uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v20 = signpost;

  if (v20)
  {
    if (self) {
      objc_super v21 = self->super.super._signpost;
    }
    else {
      objc_super v21 = 0;
    }
    uint64_t v22 = v21;
    long long v26 = objc_msgSend_log(v22, v23, v24, v25);

    if (self) {
      long long v27 = self->super.super._signpost;
    }
    else {
      long long v27 = 0;
    }
    uint64_t v28 = v27;
    os_signpost_id_t v32 = objc_msgSend_identifier(v28, v29, v30, v31);

    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)v89 = 138412546;
      *(void *)&v89[4] = v13;
      *(_WORD *)&v89[12] = 2112;
      *(void *)&v89[14] = v18;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v26, OS_SIGNPOST_EVENT, v32, "CKFetchArchivedRecordsOperation", "Server change token updated to %@ with error: %@", v89, 0x16u);
    }
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v33 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v67 = v33;
    id v71 = objc_msgSend_operationID(self, v68, v69, v70);
    *(_DWORD *)v89 = 138543874;
    *(void *)&v89[4] = v71;
    *(_WORD *)&v89[12] = 2048;
    *(void *)&v89[14] = a5;
    *(_WORD *)&v89[22] = 2112;
    id v90 = v12;
    _os_log_debug_impl(&dword_18AF10000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ updating archivedRecordStatus to %ld for record zone %@", v89, 0x20u);
  }
  uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v34, a5, v35);
  v40 = objc_msgSend_statusByZoneID(self, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)v36, (uint64_t)v12);

  if (v18)
  {
    v45 = objc_msgSend_perItemErrors(self, v42, v43, v44);
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, (uint64_t)v18, (uint64_t)v12);
  }
  int AllChanges = objc_msgSend_fetchAllChanges(self, v42, v43, v44);
  if (!v18 && a5 && AllChanges)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v48 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v77 = v48;
      v81 = objc_msgSend_operationID(self, v78, v79, v80);
      *(_DWORD *)v89 = 138543874;
      *(void *)&v89[4] = v81;
      *(_WORD *)&v89[12] = 2114;
      *(void *)&v89[14] = v13;
      *(_WORD *)&v89[22] = 2112;
      id v90 = v12;
      _os_log_debug_impl(&dword_18AF10000, v77, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a server change token %{public}@ for zoneID %@", v89, 0x20u);
    }
    v52 = objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v49, v50, v51);

    if (v52)
    {
      objc_msgSend_recordZoneChangeTokensUpdatedBlock(self, v53, v54, v55);
      v56 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id))v56)[2](v56, v12, v13);
LABEL_32:
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v57 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v82 = v57;
      v86 = objc_msgSend_operationID(self, v83, v84, v85);
      *(_DWORD *)v89 = 138544386;
      v87 = @", error ";
      *(void *)&v89[4] = v86;
      v88 = &stru_1ED7F5C98;
      *(_WORD *)&v89[12] = 2112;
      if (!v18) {
        v87 = &stru_1ED7F5C98;
      }
      *(void *)&v89[14] = v13;
      if (v18) {
        v88 = v18;
      }
      *(_WORD *)&v89[22] = 2112;
      id v90 = v12;
      __int16 v91 = 2114;
      v92 = v87;
      __int16 v93 = 2112;
      v94 = v88;
      _os_log_debug_impl(&dword_18AF10000, v82, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about per-zone completion with server change token %@ for zoneID %@%{public}@%@", v89, 0x34u);
    }
    v61 = objc_msgSend_recordZoneFetchCompletionBlock(self, v58, v59, v60, *(_OWORD *)v89, *(void *)&v89[16]);

    if (v61)
    {
      BOOL v65 = a5 != 0;
      objc_msgSend_recordZoneFetchCompletionBlock(self, v62, v63, v64);
      v56 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void, void, void), id, id, BOOL, __CFString *))v56[2])(v56, v12, v13, v65, v18);
      goto LABEL_32;
    }
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v66 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    __int16 v72 = v66;
    v76 = objc_msgSend_operationID(self, v73, v74, v75);
    *(_DWORD *)v89 = 138543618;
    *(void *)&v89[4] = v76;
    *(_WORD *)&v89[12] = 2112;
    *(void *)&v89[14] = v12;
    _os_log_debug_impl(&dword_18AF10000, v72, OS_LOG_TYPE_DEBUG, "Progress callback for operation %{public}@ zoneID %@ is done", v89, 0x16u);
  }
  v14[2](v14, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

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
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchArchivedRecordsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_perItemErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      long long v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
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
  uint64_t v34 = objc_msgSend_recordZoneIDs(self, v7, v8, v9);
  uint64_t v38 = objc_msgSend_count(v34, v35, v36, v37);

  if (v38)
  {
    uint64_t v42 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v43 = objc_msgSend_recordZoneIDs(self, v39, v40, v41);
    v46 = objc_msgSend_setWithArray_(v42, v44, (uint64_t)v43, v45);

    os_signpost_id_t v49 = objc_msgSend_zoneIDsToZoneNamesString_(self, v47, (uint64_t)v46, v48);
    v53 = objc_msgSend_operationMetric(self, v50, v51, v52);
    objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)v49, @"zoneNames");
  }
  uint64_t v55 = objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v39, v40, v41);

  if (v55)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v56 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v83 = objc_msgSend_operationID(self, v57, v58, v59);
      uint64_t v84 = &stru_1ED7F5C98;
      if (v4) {
        uint64_t v85 = @" Error was: ";
      }
      else {
        uint64_t v85 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v80, v81, v82);
        uint64_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v94 = v83;
      __int16 v95 = 2114;
      v96 = v85;
      __int16 v97 = 2112;
      v98 = v84;
      _os_log_debug_impl(&dword_18AF10000, v56, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
    objc_msgSend_fetchArchivedRecordsCompletionBlock(self, v60, v61, v62);
    uint64_t v63 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v67 = objc_msgSend_CKClientSuitableError(v4, v64, v65, v66);
    ((void (**)(void, void *))v63)[2](v63, v67);

    objc_msgSend_setFetchArchivedRecordsCompletionBlock_(self, v68, 0, v69);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    __int16 v72 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      v89 = objc_msgSend_operationID(self, v73, v74, v75);
      id v90 = &stru_1ED7F5C98;
      if (v4) {
        __int16 v91 = @" Error was: ";
      }
      else {
        __int16 v91 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v86, v87, v88);
        id v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v94 = v89;
      __int16 v95 = 2114;
      v96 = v91;
      __int16 v97 = 2112;
      v98 = v90;
      _os_log_debug_impl(&dword_18AF10000, v72, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no fetchArchivedRecordsCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4) {
    }
      }
  }
  objc_msgSend_setRecordFetchedBlock_(self, v70, 0, v71);
  objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(self, v76, 0, v77);
  objc_msgSend_setRecordZoneFetchCompletionBlock_(self, v78, 0, v79);
  v92.receiver = self;
  v92.super_class = (Class)CKFetchArchivedRecordsOperation;
  [(CKOperation *)&v92 _finishOnCallbackQueueWithError:v4];
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
    BOOL v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super.super._signpost;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      os_signpost_id_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchArchivedRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  BOOL v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchArchivedRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-archived-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleFetchForRecordID_record_error_, 2, 0);

  uint64_t v7 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleChangeSetCompletionForRecordZoneID_serverChangeToken_archivedRecordStatus_error_reply_, 3, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKFetchArchivedRecordsOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
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

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchint AllChanges = a3;
}

- (NSMutableDictionary)statusByZoneID
{
  return self->_statusByZoneID;
}

- (void)setStatusByZoneID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_statusByZoneID, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_fetchArchivedRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);

  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end