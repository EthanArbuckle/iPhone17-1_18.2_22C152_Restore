@interface CKFetchMergeableDeltaMetadataOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchMergeableDeltaMetadataOperation)initWithMergeableValueIDs:(id)a3;
- (NSArray)mergeableValueIDs;
- (NSMutableDictionary)perValueErrors;
- (id)activityCreate;
- (id)fetchMergeableDeltaMetadataCompletionBlock;
- (id)metadataFetchedBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleFetchForMergeableValueID:(id)a3 metadatas:(id)a4 error:(id)a5;
- (void)setFetchMergeableDeltaMetadataCompletionBlock:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
- (void)setMetadataFetchedBlock:(id)a3;
- (void)setPerValueErrors:(id)a3;
@end

@implementation CKFetchMergeableDeltaMetadataOperation

- (void)setMetadataFetchedBlock:(id)a3
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
    v14[2] = sub_18B0A23B4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id metadataFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_metadataFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id metadataFetchedBlock = self->_metadataFetchedBlock;
    self->_id metadataFetchedBlock = v11;
LABEL_9:
  }
}

- (id)metadataFetchedBlock
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
    id v15 = sub_18AF13DAC;
    v16 = sub_18AF138E0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0A25AC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_metadataFetchedBlock);
  }

  return v8;
}

- (void)setFetchMergeableDeltaMetadataCompletionBlock:(id)a3
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
    v14[2] = sub_18B0A2738;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchMergeableDeltaMetadataCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchMergeableDeltaMetadataCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchMergeableDeltaMetadataCompletionBlock = self->_fetchMergeableDeltaMetadataCompletionBlock;
    self->_id fetchMergeableDeltaMetadataCompletionBlock = v11;
LABEL_9:
  }
}

- (id)fetchMergeableDeltaMetadataCompletionBlock
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
    id v15 = sub_18AF13DAC;
    v16 = sub_18AF138E0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0A2930;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchMergeableDeltaMetadataCompletionBlock);
  }

  return v8;
}

- (CKFetchMergeableDeltaMetadataOperation)initWithMergeableValueIDs:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  uint64_t v6 = [(CKOperation *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mergeableValueIDs, a3);
    uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10);
    perValueErrors = v7->_perValueErrors;
    v7->_perValueErrors = (NSMutableDictionary *)v11;
  }
  return v7;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  BOOL v5 = -[CKDatabaseOperation CKOperationShouldRun:](&v18, sel_CKOperationShouldRun_);
  if (v5)
  {
    uint64_t v9 = objc_msgSend_mergeableValueIDs(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

    if (v13)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        objc_super v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKErrorDomain", 12, @"%@ cannot run without a mergeable value ID", v15);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchMergeableDeltaMetadataOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
  uint64_t v8 = objc_msgSend_mergeableValueIDs(self, v5, v6, v7, v11.receiver, v11.super_class);
  objc_msgSend_setMergeableValueIDs_(v4, v9, (uint64_t)v8, v10);
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_mergeableValueIDs(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setMergeableValueIDs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_metadataFetchedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v11 = objc_msgSend_fetchMergeableDeltaMetadataCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v8 = objc_msgSend_perValueErrors(self, v4, v5, v6);
    uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);

    if (v12)
    {
      v43 = @"CKPartialErrors";
      objc_super v13 = objc_msgSend_perValueErrors(self, v4, v5, v6);
      v44[0] = v13;
      id v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v44, (uint64_t)&v43, 1);

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v16, @"CKInternalErrorDomain", 1011, v15, @"Failed to fetch some delta metadata");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  id v17 = objc_msgSend_CKClientSuitableError(v7, v4, v5, v6);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v18 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v28 = v18;
    v32 = objc_msgSend_operationID(self, v29, v30, v31);
    *(_DWORD *)buf = 138543618;
    v40 = v32;
    __int16 v41 = 2112;
    v42 = v17;
    _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling fetch delta metadata completion block with error: %@", buf, 0x16u);
  }
  v22 = objc_msgSend_fetchMergeableDeltaMetadataCompletionBlock(self, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_fetchMergeableDeltaMetadataCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v26)[2](v26, v17);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v33 = v27;
    v37 = objc_msgSend_operationID(self, v34, v35, v36);
    *(_DWORD *)buf = 138543618;
    v40 = v37;
    __int16 v41 = 2112;
    v42 = v17;
    _os_log_debug_impl(&dword_18AF10000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling fetch delta metadata completion block with error: %@", buf, 0x16u);
  }
  v38.receiver = self;
  v38.super_class = (Class)CKFetchMergeableDeltaMetadataOperation;
  [(CKOperation *)&v38 _finishOnCallbackQueueWithError:v17];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-mergeable-delta-metadata", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleFetchForMergeableValueID_metadatas_error_, 1, 0);

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CKFetchMergeableDeltaMetadataOperation;
  objc_msgSendSuper2(&v12, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (void)handleFetchForMergeableValueID:(id)a3 metadatas:(id)a4 error:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_super v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  id v17 = objc_msgSend_perValueErrors(self, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v13, (uint64_t)v8);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v19 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v29 = v19;
    v33 = objc_msgSend_operationID(self, v30, v31, v32);
    int v42 = 138544130;
    v43 = v33;
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2048;
    uint64_t v47 = objc_msgSend_count(v9, v34, v35, v36);
    __int16 v48 = 2112;
    v49 = v13;
    _os_log_debug_impl(&dword_18AF10000, v29, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received fetch batch metadata callback for value %@ with %ld metadatas with error: %@", (uint8_t *)&v42, 0x2Au);
  }
  v23 = objc_msgSend_metadataFetchedBlock(self, v20, v21, v22);

  if (v23)
  {
    objc_msgSend_metadataFetchedBlock(self, v24, v25, v26);
    v27 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, void *))v27)[2](v27, v8, v9, v13);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v28 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v37 = v28;
    __int16 v41 = objc_msgSend_operationID(self, v38, v39, v40);
    int v42 = 138543874;
    v43 = v41;
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v13;
    _os_log_debug_impl(&dword_18AF10000, v37, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished fetch batch metadata callback for value %@ with error: %@", (uint8_t *)&v42, 0x20u);
  }
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (NSMutableDictionary)perValueErrors
{
  return self->_perValueErrors;
}

- (void)setPerValueErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perValueErrors, 0);
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
  objc_storeStrong(&self->_fetchMergeableDeltaMetadataCompletionBlock, 0);

  objc_storeStrong(&self->_metadataFetchedBlock, 0);
}

@end