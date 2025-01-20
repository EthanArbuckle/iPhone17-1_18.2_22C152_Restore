@interface CKArchiveRecordsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKArchiveRecordsOperation)init;
- (CKArchiveRecordsOperation)initWithRecordIDs:(id)a3;
- (NSArray)recordIDs;
- (NSMutableDictionary)perItemErrors;
- (id)activityCreate;
- (id)archiveRecordsCompletionBlock;
- (id)recordArchivedBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleRecordArchivalForRecordID:(id)a3 error:(id)a4;
- (void)setArchiveRecordsCompletionBlock:(id)a3;
- (void)setPerItemErrors:(id)a3;
- (void)setRecordArchivedBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
@end

@implementation CKArchiveRecordsOperation

- (CKArchiveRecordsOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKArchiveRecordsOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    perItemErrors = v2->_perItemErrors;
    v2->_perItemErrors = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKArchiveRecordsOperation)initWithRecordIDs:(id)a3
{
  id v4 = a3;
  v11 = (CKArchiveRecordsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    recordIDs = v11->_recordIDs;
    v11->_recordIDs = (NSArray *)v12;
  }
  return v11;
}

- (void)setRecordArchivedBlock:(id)a3
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
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B041F40;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id recordArchivedBlock = v15;
    goto LABEL_9;
  }
  if (self->_recordArchivedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id recordArchivedBlock = self->_recordArchivedBlock;
    self->_id recordArchivedBlock = v11;
LABEL_9:
  }
}

- (id)recordArchivedBlock
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
    id v15 = sub_18AF13B4C;
    v16 = sub_18AF13858;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B042138;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_recordArchivedBlock);
  }

  return v8;
}

- (void)setArchiveRecordsCompletionBlock:(id)a3
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
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0422C4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id archiveRecordsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_archiveRecordsCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id archiveRecordsCompletionBlock = self->_archiveRecordsCompletionBlock;
    self->_id archiveRecordsCompletionBlock = v11;
LABEL_9:
  }
}

- (id)archiveRecordsCompletionBlock
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
    id v15 = sub_18AF13B4C;
    v16 = sub_18AF13858;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0424BC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_archiveRecordsCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_recordIDs(self, v5, v6, v7);
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKArchiveRecordsOperation;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKArchiveRecordsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  v8 = objc_msgSend_recordIDs(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKArchiveRecordsOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_recordArchivedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v11 = objc_msgSend_archiveRecordsCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = objc_msgSend_recordIDs(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v32;
      while (2)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v14);
          }
          v23 = objc_msgSend_zoneID(*(void **)(*((void *)&v31 + 1) + 8 * v22), v17, v18, v19);
          int v25 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v24, (uint64_t)v23, (uint64_t)a3);

          if (!v25)
          {

            return 0;
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }

    v30.receiver = self;
    v30.super_class = (Class)CKArchiveRecordsOperation;
    return [(CKDatabaseOperation *)&v30 CKOperationShouldRun:a3];
  }
  else
  {
    if (a3)
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, @"CKErrorDomain", 12, @"You must pass at least one record ID to %@", v28);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performArchiveRecordsOperation_withBlock_;
}

- (void)handleRecordArchivalForRecordID:(id)a3 error:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v11 = objc_msgSend_CKClientSuitableError(v7, v8, v9, v10);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v13 = signpost;

  if (v11)
  {
    if (v13)
    {
      if (self) {
        id v17 = self->super.super._signpost;
      }
      else {
        id v17 = 0;
      }
      uint64_t v18 = v17;
      uint64_t v22 = objc_msgSend_log(v18, v19, v20, v21);

      if (self) {
        v23 = self->super.super._signpost;
      }
      else {
        v23 = 0;
      }
      v24 = v23;
      os_signpost_id_t v28 = objc_msgSend_identifier(v24, v25, v26, v27);

      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        int v54 = 138412546;
        id v55 = v6;
        __int16 v56 = 2112;
        id v57 = v11;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v22, OS_SIGNPOST_EVENT, v28, "CKArchiveRecordsOperation", "Record %@ archived with error: %@", (uint8_t *)&v54, 0x16u);
      }
    }
    v29 = objc_msgSend_perItemErrors(self, v14, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)v11, (uint64_t)v6);
LABEL_14:

    goto LABEL_15;
  }
  if (v13)
  {
    if (self) {
      v38 = self->super.super._signpost;
    }
    else {
      v38 = 0;
    }
    v39 = v38;
    v29 = objc_msgSend_log(v39, v40, v41, v42);

    if (self) {
      v43 = self->super.super._signpost;
    }
    else {
      v43 = 0;
    }
    v44 = v43;
    os_signpost_id_t v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      int v54 = 138412290;
      id v55 = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v48, "CKArchiveRecordsOperation", "Record %@ archived", (uint8_t *)&v54, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  long long v31 = objc_msgSend_recordArchivedBlock(self, v14, v15, v16);

  if (v31)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v49 = v32;
      v53 = objc_msgSend_operationID(self, v50, v51, v52);
      int v54 = 138543618;
      id v55 = v53;
      __int16 v56 = 2112;
      id v57 = v6;
      _os_log_debug_impl(&dword_18AF10000, v49, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about an archived record with id %@", (uint8_t *)&v54, 0x16u);
    }
    objc_msgSend_recordArchivedBlock(self, v33, v34, v35);
    uint64_t v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v36)[2](v36, v6, v7);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v37 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v54 = 138412290;
    id v55 = v6;
    _os_log_debug_impl(&dword_18AF10000, v37, OS_LOG_TYPE_DEBUG, "Progress callback for record id %@ is done", (uint8_t *)&v54, 0xCu);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
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
    objc_super v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKArchiveRecordsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_perItemErrors(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_super v30 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v27, v28, v29);
      uint64_t v34 = objc_msgSend_perItemErrors(self, v31, v32, v33);
      objc_msgSend_setObject_forKeyedSubscript_(v30, v35, (uint64_t)v34, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v36, @"CKInternalErrorDomain", 1011, v30, @"Couldn't archive some records");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v41 = objc_msgSend_recordIDs(self, v38, v39, v40);
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v99, (uint64_t)v109, 16);
  if (v43)
  {
    uint64_t v47 = v43;
    uint64_t v48 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v100 != v48) {
          objc_enumerationMutation(v41);
        }
        v50 = objc_msgSend_zoneID(*(void **)(*((void *)&v99 + 1) + 8 * i), v44, v45, v46);
        objc_msgSend_addObject_(v37, v51, (uint64_t)v50, v52);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v99, (uint64_t)v109, 16);
    }
    while (v47);
  }

  if (objc_msgSend_count(v37, v53, v54, v55))
  {
    v59 = objc_msgSend_zoneIDsToZoneNamesString_(self, v56, (uint64_t)v37, v58);
    v63 = objc_msgSend_operationMetric(self, v60, v61, v62);
    objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v59, @"zoneNames");
  }
  v65 = objc_msgSend_archiveRecordsCompletionBlock(self, v56, v57, v58);

  if (v65)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v66 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      v89 = objc_msgSend_operationID(self, v67, v68, v69);
      v90 = &stru_1ED7F5C98;
      if (v4) {
        v91 = @" Error was: ";
      }
      else {
        v91 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v86, v87, v88);
        v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v104 = v89;
      __int16 v105 = 2112;
      v106 = v91;
      __int16 v107 = 2112;
      v108 = v90;
      _os_log_debug_impl(&dword_18AF10000, v66, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. %@%@", buf, 0x20u);
      if (v4) {
    }
      }
    objc_msgSend_archiveRecordsCompletionBlock(self, v70, v71, v72);
    v73 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_CKClientSuitableError(v4, v74, v75, v76);
    ((void (**)(void, void *))v73)[2](v73, v77);

    objc_msgSend_setArchiveRecordsCompletionBlock_(self, v78, 0, v79);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v82 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      v95 = objc_msgSend_operationID(self, v83, v84, v85);
      v96 = &stru_1ED7F5C98;
      if (v4) {
        v97 = @" Error was: ";
      }
      else {
        v97 = &stru_1ED7F5C98;
      }
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v92, v93, v94);
        v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v104 = v95;
      __int16 v105 = 2112;
      v106 = v97;
      __int16 v107 = 2112;
      v108 = v96;
      _os_log_debug_impl(&dword_18AF10000, v82, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no archiveRecordsCompletionBlock was set.%@%@", buf, 0x20u);
      if (v4) {
    }
      }
  }
  objc_msgSend_setRecordArchivedBlock_(self, v80, 0, v81);
  v98.receiver = self;
  v98.super_class = (Class)CKArchiveRecordsOperation;
  [(CKOperation *)&v98 _finishOnCallbackQueueWithError:v4];
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
      objc_super v11 = self->super.super._signpost;
    }
    else {
      objc_super v11 = 0;
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
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKArchiveRecordsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKArchiveRecordsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/archive-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleRecordArchivalForRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKArchiveRecordsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSMutableDictionary)perItemErrors
{
  return self->_perItemErrors;
}

- (void)setPerItemErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_archiveRecordsCompletionBlock, 0);

  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end