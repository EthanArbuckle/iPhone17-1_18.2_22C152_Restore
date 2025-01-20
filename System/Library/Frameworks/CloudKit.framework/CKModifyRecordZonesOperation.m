@interface CKModifyRecordZonesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)markZonesAsUserPurged;
- (CKModifyRecordZonesOperation)init;
- (CKModifyRecordZonesOperation)initWithRecordZonesToSave:(NSArray *)recordZonesToSave recordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (id)activityCreate;
- (id)modifyRecordZonesCompletionBlock_wrapper;
- (id)perRecordZoneDeleteBlock_wrapper;
- (id)perRecordZoneSaveBlock_wrapper;
- (id)relevantZoneIDs;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleDeleteForRecordZoneID:(id)a3 error:(id)a4;
- (void)handleSaveForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5;
- (void)modifyRecordZonesCompletionBlock;
- (void)perRecordZoneDeleteBlock;
- (void)perRecordZoneSaveBlock;
- (void)performCKOperation;
- (void)setMarkZonesAsUserPurged:(BOOL)a3;
- (void)setModifyRecordZonesCompletionBlock:(void *)modifyRecordZonesCompletionBlock;
- (void)setModifyRecordZonesCompletionBlockIVar:(id)a3;
- (void)setModifyRecordZonesCompletionBlock_wrapper:(id)a3;
- (void)setPerRecordZoneDeleteBlock:(void *)perRecordZoneDeleteBlock;
- (void)setPerRecordZoneDeleteBlock_wrapper:(id)a3;
- (void)setPerRecordZoneSaveBlock:(void *)perRecordZoneSaveBlock;
- (void)setPerRecordZoneSaveBlock_wrapper:(id)a3;
- (void)setRecordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete;
- (void)setRecordZonesToSave:(NSArray *)recordZonesToSave;
@end

@implementation CKModifyRecordZonesOperation

- (CKModifyRecordZonesOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKModifyRecordZonesOperation;
  v2 = [(CKOperation *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordZonesByZoneIDs = v2->_recordZonesByZoneIDs;
    v2->_recordZonesByZoneIDs = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    savedRecordZones = v2->_savedRecordZones;
    v2->_savedRecordZones = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    deletedRecordZoneIDs = v2->_deletedRecordZoneIDs;
    v2->_deletedRecordZoneIDs = (NSMutableArray *)v9;
  }
  return v2;
}

- (CKModifyRecordZonesOperation)initWithRecordZonesToSave:(NSArray *)recordZonesToSave recordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete
{
  v6 = recordZonesToSave;
  uint64_t v7 = recordZoneIDsToDelete;
  v14 = (CKModifyRecordZonesOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_recordZonesToSave;
    v14->_recordZonesToSave = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_recordZoneIDsToDelete;
    v14->_recordZoneIDsToDelete = (NSArray *)v20;
  }
  return v14;
}

- (void)setPerRecordZoneSaveBlock:(void *)perRecordZoneSaveBlock
{
  id v7 = perRecordZoneSaveBlock;
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
    v14[2] = sub_18B028324;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordZoneSaveBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordZoneSaveBlock;
    self->_perRecordZoneSaveBlock = v11;
LABEL_9:
  }
}

- (void)perRecordZoneSaveBlock
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
    id v15 = sub_18AF13AD4;
    v16 = sub_18AF13838;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B02851C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordZoneSaveBlock);
  }

  return v8;
}

- (void)setPerRecordZoneDeleteBlock:(void *)perRecordZoneDeleteBlock
{
  id v7 = perRecordZoneDeleteBlock;
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
    v14[2] = sub_18B0286A8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perRecordZoneDeleteBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perRecordZoneDeleteBlock;
    self->_perRecordZoneDeleteBlock = v11;
LABEL_9:
  }
}

- (void)perRecordZoneDeleteBlock
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
    id v15 = sub_18AF13AD4;
    v16 = sub_18AF13838;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0288A0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perRecordZoneDeleteBlock);
  }

  return v8;
}

- (void)setModifyRecordZonesCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B028A2C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id modifyRecordZonesCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_modifyRecordZonesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id modifyRecordZonesCompletionBlock = self->_modifyRecordZonesCompletionBlock;
    self->_id modifyRecordZonesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)modifyRecordZonesCompletionBlock
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
    id v15 = sub_18AF13AD4;
    v16 = sub_18AF13838;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B028C24;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_modifyRecordZonesCompletionBlock);
  }

  return v8;
}

- (void)setModifyRecordZonesCompletionBlock:(void *)modifyRecordZonesCompletionBlock
{
  BOOL v4 = modifyRecordZonesCompletionBlock == 0;
  id v9 = modifyRecordZonesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifyRecordZonesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (id)relevantZoneIDs
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_recordZoneIDsToDelete(self, a2, v2, v3);
  id v9 = objc_msgSend_recordZonesToSave(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);
  id v17 = (void *)(objc_msgSend_count(v5, v14, v15, v16) + v13);
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v17 = objc_msgSend_initWithCapacity_(v18, v19, (uint64_t)v17, v20);
    objc_msgSend_addObjectsFromArray_(v17, v21, (uint64_t)v5, v22);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v9;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v25)
    {
      uint64_t v29 = v25;
      uint64_t v30 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v23);
          }
          v34 = objc_msgSend_zoneID(*(void **)(*((void *)&v36 + 1) + 8 * i), v26, v27, v28, (void)v36);
          if (v34) {
            objc_msgSend_addObject_(v17, v32, (uint64_t)v34, v33);
          }
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v29);
    }
  }

  return v17;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordZonesToSave(self, v5, v6, v7);
  objc_msgSend_setRecordZonesToSave_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordZoneIDsToDelete(self, v11, v12, v13);
  objc_msgSend_setRecordZoneIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_markZonesAsUserPurged(self, v17, v18, v19);
  objc_msgSend_setMarkZonesAsUserPurged_(v4, v21, v20, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKModifyRecordZonesOperation;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKModifyRecordZonesOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v23 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_recordZonesToSave(v4, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setRecordZonesToSave_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_recordZoneIDsToDelete(v4, v11, v12, v13);
  objc_msgSend_setRecordZoneIDsToDelete_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_markZonesAsUserPurged(v4, v17, v18, v19);
  objc_msgSend_setMarkZonesAsUserPurged_(self, v21, v20, v22);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKModifyRecordZonesOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perRecordZoneSaveBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perRecordZoneDeleteBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v15 = objc_msgSend_modifyRecordZonesCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v8 = objc_msgSend_recordZonesToSave(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v73, (uint64_t)v78, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v74;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v74 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v73 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a3) {
          goto LABEL_41;
        }
        v54 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v54);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v55, @"CKErrorDomain", 12, @"Unexpected record zone object passed to %@: %@", v20, v14);
        goto LABEL_38;
      }
      uint64_t v18 = objc_msgSend_zoneID(v14, v15, v16, v17);
      if (!v18)
      {
        if (a3)
        {
          v56 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, @"CKErrorDomain", 12, @"Record zone object missing unique client id %@", v14);
          uint64_t v20 = 0;
          goto LABEL_39;
        }
        uint64_t v20 = 0;
        goto LABEL_40;
      }
      uint64_t v20 = (void *)v18;
      if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v19, v18, (uint64_t)a3)) {
        goto LABEL_40;
      }
      objc_msgSend_setObject_forKeyedSubscript_(self->_recordZonesByZoneIDs, v21, (uint64_t)v14, (uint64_t)v20);
      if (objc_msgSend_containsObject_(v4, v22, (uint64_t)v20, v23)) {
        break;
      }
      objc_msgSend_addObject_(v4, v24, (uint64_t)v20, v25);

      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v26, (uint64_t)&v73, (uint64_t)v78, 16);
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if (!a3) {
      goto LABEL_40;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, @"CKErrorDomain", 12, @"You can't save the same record zone twice %@", v14);
    goto LABEL_38;
  }
LABEL_12:

  uint64_t v8 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v20 = objc_msgSend_recordZoneIDsToDelete(self, v27, v28, v29);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v30, (uint64_t)&v69, (uint64_t)v77, 16);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v70;
LABEL_14:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v70 != v33) {
        objc_enumerationMutation(v20);
      }
      uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v57 = (objc_class *)objc_opt_class();
          v58 = NSStringFromClass(v57);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v59, @"CKErrorDomain", 12, @"Unexpected recordZoneID in property recordZoneIDsToDelete passed to %@: %@", v58, v35);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
      if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v36, v35, (uint64_t)a3)) {
        goto LABEL_40;
      }
      if (objc_msgSend_containsObject_(v4, v37, v35, v38))
      {
        if (!a3) {
          goto LABEL_40;
        }
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 12, @"You can't save and delete the same zone (%@) in the same operation", v35);
        goto LABEL_38;
      }
      if (objc_msgSend_containsObject_(v8, v39, v35, v40)) {
        break;
      }
      objc_msgSend_addObject_(v8, v41, v35, v42);
      if (v32 == ++v34)
      {
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v43, (uint64_t)&v69, (uint64_t)v77, 16);
        if (v32) {
          goto LABEL_14;
        }
        goto LABEL_23;
      }
    }
    if (!a3) {
      goto LABEL_40;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, @"CKErrorDomain", 12, @"You can't delete the same zone (%@) twice in the same operation", v35);
    v56 = LABEL_38:;
LABEL_39:
    *a3 = v56;
LABEL_40:

    goto LABEL_41;
  }
LABEL_23:

  v47 = objc_msgSend_recordZonesToSave(self, v44, v45, v46);
  if (objc_msgSend_count(v47, v48, v49, v50))
  {

LABEL_44:
    v68.receiver = self;
    v68.super_class = (Class)CKModifyRecordZonesOperation;
    BOOL v60 = [(CKDatabaseOperation *)&v68 CKOperationShouldRun:a3];
    goto LABEL_42;
  }
  v62 = objc_msgSend_recordZoneIDsToDelete(self, v51, v52, v53);
  uint64_t v66 = objc_msgSend_count(v62, v63, v64, v65);

  if (v66) {
    goto LABEL_44;
  }
LABEL_41:
  BOOL v60 = 0;
LABEL_42:

  return v60;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifyRecordZonesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_recordZonesToSave(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_recordZoneIDsToDelete(self, v13, v14, v15);
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 1024;
    int v28 = objc_msgSend_markZonesAsUserPurged(self, v17, v18, v19);
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Modifying record zones with operation %{public}@ zonesToSave=%@ zonesToDelete=%@ markZonesAsUserPurged=%d", buf, 0x26u);
  }
  v20.receiver = self;
  v20.super_class = (Class)CKModifyRecordZonesOperation;
  [(CKOperation *)&v20 performCKOperation];
}

- (void)handleSaveForRecordZoneID:(id)a3 recordZone:(id)a4 error:(id)a5
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v15 = signpost;

  if (v13)
  {
    if (!v15) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    __int16 v23 = objc_msgSend_log(v19, v20, v21, v22);

    if (self) {
      v24 = self->super.super._signpost;
    }
    else {
      v24 = 0;
    }
    __int16 v25 = v24;
    uint64_t v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23)) {
      goto LABEL_21;
    }
    *(_DWORD *)v123 = 138412546;
    *(void *)&v123[4] = v8;
    *(_WORD *)&v123[12] = 2112;
    *(void *)&v123[14] = v13;
    uint64_t v30 = "Record zone %@ saved with error: %@";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v29;
    uint32_t v33 = 22;
    goto LABEL_20;
  }
  if (!v15) {
    goto LABEL_22;
  }
  if (self) {
    uint64_t v34 = self->super.super._signpost;
  }
  else {
    uint64_t v34 = 0;
  }
  uint64_t v35 = v34;
  __int16 v23 = objc_msgSend_log(v35, v36, v37, v38);

  if (self) {
    long long v39 = self->super.super._signpost;
  }
  else {
    long long v39 = 0;
  }
  uint64_t v40 = v39;
  uint64_t v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)v123 = 138412290;
    *(void *)&v123[4] = v8;
    uint64_t v30 = "Record zone %@ saved";
    uint64_t v31 = v23;
    os_signpost_id_t v32 = v44;
    uint32_t v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v31, OS_SIGNPOST_EVENT, v32, "CKModifyRecordZonesOperation", v30, v123, v33);
  }
LABEL_21:

LABEL_22:
  if (self) {
    objc_msgSend_objectForKeyedSubscript_(self->_recordZonesByZoneIDs, v16, (uint64_t)v8, v17, *(_OWORD *)v123, *(void *)&v123[16]);
  }
  else {
  v48 = objc_msgSend_objectForKeyedSubscript_(0, v16, (uint64_t)v8, v17, *(_OWORD *)v123, *(void *)&v123[16]);
  }
  if (v9)
  {
    uint64_t v49 = objc_msgSend_resolvedConfiguration(self, v45, v46, v47);
    uint64_t v53 = objc_msgSend_container(v49, v50, v51, v52);
    v57 = objc_msgSend_options(v53, v54, v55, v56);
    int v61 = objc_msgSend_returnPCSMetadata(v57, v58, v59, v60);

    if (v61)
    {
      uint64_t v65 = objc_msgSend_pcsKeyID(v9, v62, v63, v64);
      objc_msgSend_setPcsKeyID_(v48, v66, (uint64_t)v65, v67);

      long long v71 = objc_msgSend_zoneishKeyID(v9, v68, v69, v70);
      objc_msgSend_setZoneishKeyID_(v48, v72, (uint64_t)v71, v73);
    }
    uint64_t v74 = objc_msgSend_capabilities(v9, v62, v63, v64);
    objc_msgSend_setCapabilities_(v48, v75, v74, v76);
    v80 = objc_msgSend_expirationDate(v9, v77, v78, v79);
    objc_msgSend_setExpirationDate_(v48, v81, (uint64_t)v80, v82);

    uint64_t isExpired = objc_msgSend_isExpired(v9, v83, v84, v85);
    objc_msgSend_setExpired_(v48, v87, isExpired, v88);
    objc_msgSend_setHasUpdatedExpirationTimeInterval_(v48, v89, 0, v90);
    objc_msgSend_setUpdatedExpirationTimeInterval_(v48, v91, 0, v92);
    v96 = objc_msgSend_requiredFeatures(v9, v93, v94, v95);
    objc_msgSend_setRequiredFeatures_(v48, v97, (uint64_t)v96, v98);

    v102 = objc_msgSend_originalRequiredFeatures(v9, v99, v100, v101);
    objc_msgSend_setOriginalRequiredFeatures_(v48, v103, (uint64_t)v102, v104);
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v45, v46, v47) & 1) == 0)
  {
    if (v13)
    {
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v105, (uint64_t)v13, (uint64_t)v8);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(0, v105, (uint64_t)v13, (uint64_t)v8);
      }
    }
    else if (self)
    {
      objc_msgSend_addObject_(self->_savedRecordZones, v105, (uint64_t)v48, v107);
    }
    else
    {
      objc_msgSend_addObject_(0, v105, (uint64_t)v48, v107);
    }
  }
  v108 = objc_msgSend_perRecordZoneSaveBlock_wrapper(self, v105, v106, v107);
  v112 = v108;
  if (v108)
  {
    v113 = (void (**)(void *, id, void *, void *))_Block_copy(v108);
  }
  else
  {
    v114 = objc_msgSend_perRecordZoneSaveBlock(self, v109, v110, v111);
    v113 = (void (**)(void *, id, void *, void *))_Block_copy(v114);
  }
  if (v113)
  {
    id v115 = v48;
    v116 = v115;
    if (v13)
    {

      v116 = 0;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v117 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v118 = v117;
      v122 = objc_msgSend_operationID(self, v119, v120, v121);
      *(_DWORD *)v123 = 138543874;
      *(void *)&v123[4] = v122;
      *(_WORD *)&v123[12] = 2112;
      *(void *)&v123[14] = v8;
      *(_WORD *)&v123[22] = 2112;
      v124 = v13;
      _os_log_debug_impl(&dword_18AF10000, v118, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about saved zone with ID %@: %@", v123, 0x20u);
    }
    v113[2](v113, v8, v116, v13);
  }
}

- (void)handleDeleteForRecordZoneID:(id)a3 error:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
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
      if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    if (self) {
      os_signpost_id_t v32 = self->super.super._signpost;
    }
    else {
      os_signpost_id_t v32 = 0;
    }
    uint32_t v33 = v32;
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
    *(_DWORD *)v62 = 138412290;
    *(void *)&v62[4] = v6;
    uint64_t v28 = "Record zone %@ deleted";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v42;
    uint32_t v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_30;
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
  __int16 v23 = v22;
  uint64_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)v62 = 138412546;
    *(void *)&v62[4] = v6;
    *(_WORD *)&v62[12] = 2112;
    *(void *)&v62[14] = v10;
    uint64_t v28 = "Record zone %@ deleted with error: %@";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v27;
    uint32_t v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v30, "CKModifyRecordZonesOperation", v28, v62, v31);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45) & 1) == 0)
  {
    if (!v10)
    {
LABEL_28:
      if (self) {
        objc_msgSend_addObject_(self->_deletedRecordZoneIDs, v46, (uint64_t)v6, v48, *(void *)v62, *(_OWORD *)&v62[8]);
      }
      else {
        objc_msgSend_addObject_(0, v46, (uint64_t)v6, v48, *(void *)v62, *(_OWORD *)&v62[8]);
      }
      goto LABEL_30;
    }
LABEL_25:
    if (self) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v62, *(void *)&v62[16]);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(0, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v62, *(void *)&v62[16]);
    }
  }
LABEL_30:
  uint64_t v49 = objc_msgSend_perRecordZoneDeleteBlock_wrapper(self, v46, v47, v48, *(void *)v62, *(void *)&v62[8]);
  uint64_t v53 = v49;
  if (v49)
  {
    v54 = (void (**)(void *, id, void *))_Block_copy(v49);
  }
  else
  {
    uint64_t v55 = objc_msgSend_perRecordZoneDeleteBlock(self, v50, v51, v52);
    v54 = (void (**)(void *, id, void *))_Block_copy(v55);
  }
  if (v54)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v56 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v57 = v56;
      int v61 = objc_msgSend_operationID(self, v58, v59, v60);
      *(_DWORD *)v62 = 138543874;
      *(void *)&v62[4] = v61;
      *(_WORD *)&v62[12] = 2112;
      *(void *)&v62[14] = v6;
      *(_WORD *)&v62[22] = 2112;
      uint64_t v63 = v10;
      _os_log_debug_impl(&dword_18AF10000, v57, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about deleted zone with ID %@: %@", v62, 0x20u);
    }
    v54[2](v54, v6, v10);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
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
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKModifyRecordZonesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    if (self) {
      uint64_t v22 = objc_msgSend_count(self->_recordZoneErrors, v7, v8, v9);
    }
    else {
      uint64_t v22 = objc_msgSend_count(0, v7, v8, v9);
    }
    if (v22)
    {
      __int16 v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v25 = v23;
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_recordZoneErrors, @"CKPartialErrors");
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, @"CKPartialErrors");
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 1011, v25, @"Failed to modify some record zones");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  if (self) {
    objc_msgSend_allKeys(self->_recordZonesByZoneIDs, v7, v8, v9);
  }
  else {
  uint64_t v27 = objc_msgSend_allKeys(0, v7, v8, v9);
  }
  uint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

  if (v31)
  {
    uint64_t v35 = (void *)MEMORY[0x1E4F1CA80];
    if (self) {
      objc_msgSend_allKeys(self->_recordZonesByZoneIDs, v32, v33, v34);
    }
    else {
    uint64_t v36 = objc_msgSend_allKeys(0, v32, v33, v34);
    }
    long long v39 = objc_msgSend_setWithArray_(v35, v37, (uint64_t)v36, v38);

    uint64_t v42 = objc_msgSend_zoneIDsToZoneNamesString_(self, v40, (uint64_t)v39, v41);
    uint64_t v46 = objc_msgSend_operationMetric(self, v43, v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v46, v47, (uint64_t)v42, @"zoneNames");
  }
  uint64_t v48 = objc_msgSend_modifyRecordZonesCompletionBlock_wrapper(self, v32, v33, v34);
  uint64_t v52 = v48;
  if (v48)
  {
    uint64_t v53 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v48);
  }
  else
  {
    v54 = objc_msgSend_modifyRecordZonesCompletionBlock(self, v49, v50, v51);
    uint64_t v53 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v54);
  }
  if (v53)
  {
    if (self)
    {
      v57 = self->_savedRecordZones;
      deletedRecordZoneIDs = self->_deletedRecordZoneIDs;
    }
    else
    {
      v57 = 0;
      deletedRecordZoneIDs = 0;
    }
    uint64_t v59 = deletedRecordZoneIDs;
    uint64_t v63 = objc_msgSend_CKClientSuitableError(v4, v60, v61, v62);
    v53[2](v53, v57, v59, v63);

    objc_msgSend_setModifyRecordZonesCompletionBlock_(self, v64, 0, v65);
  }
  objc_msgSend_setPerRecordZoneSaveBlock_(self, v55, 0, v56);
  objc_msgSend_setPerRecordZoneDeleteBlock_(self, v66, 0, v67);
  v68.receiver = self;
  v68.super_class = (Class)CKModifyRecordZonesOperation;
  [(CKOperation *)&v68 _finishOnCallbackQueueWithError:v4];
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
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      os_signpost_id_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifyRecordZonesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifyRecordZonesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/modify-record-zones", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleDeleteForRecordZoneID_error_, 1, 0);

  uint64_t v7 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleSaveForRecordZoneID_recordZone_error_, 2, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifyRecordZonesOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(NSArray *)recordZonesToSave
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(NSArray *)recordZoneIDsToDelete
{
}

- (id)perRecordZoneSaveBlock_wrapper
{
  return self->_perRecordZoneSaveBlock_wrapper;
}

- (void)setPerRecordZoneSaveBlock_wrapper:(id)a3
{
}

- (id)perRecordZoneDeleteBlock_wrapper
{
  return self->_perRecordZoneDeleteBlock_wrapper;
}

- (void)setPerRecordZoneDeleteBlock_wrapper:(id)a3
{
}

- (id)modifyRecordZonesCompletionBlock_wrapper
{
  return self->_modifyRecordZonesCompletionBlock_wrapper;
}

- (void)setModifyRecordZonesCompletionBlock_wrapper:(id)a3
{
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perRecordZoneSaveBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_savedRecordZones, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock, 0);

  objc_storeStrong(&self->_perRecordZoneSaveBlock, 0);
}

@end