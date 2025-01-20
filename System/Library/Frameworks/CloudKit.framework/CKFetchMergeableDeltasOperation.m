@interface CKFetchMergeableDeltasOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchMergeableDeltasOperation)initWithMergeableValueIDs:(id)a3;
- (NSArray)mergeableValueIDs;
- (id)activityCreate;
- (id)deltasFetchedBlock;
- (id)fetchMergeableDeltasCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleFetchForMergeableValueID:(id)a3 fetchedDeltas:(id)a4 error:(id)a5;
- (void)setDeltasFetchedBlock:(id)a3;
- (void)setFetchMergeableDeltasCompletionBlock:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
@end

@implementation CKFetchMergeableDeltasOperation

- (void)setDeltasFetchedBlock:(id)a3
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
    v14[2] = sub_18B164790;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id deltasFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_deltasFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id deltasFetchedBlock = self->_deltasFetchedBlock;
    self->_id deltasFetchedBlock = v11;
LABEL_9:
  }
}

- (id)deltasFetchedBlock
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
    id v15 = sub_18AF141F4;
    v16 = sub_18AF139D0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B164988;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_deltasFetchedBlock);
  }

  return v8;
}

- (void)setFetchMergeableDeltasCompletionBlock:(id)a3
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
    v14[2] = sub_18B164B14;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchMergeableDeltasCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchMergeableDeltasCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchMergeableDeltasCompletionBlock = self->_fetchMergeableDeltasCompletionBlock;
    self->_id fetchMergeableDeltasCompletionBlock = v11;
LABEL_9:
  }
}

- (id)fetchMergeableDeltasCompletionBlock
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
    id v15 = sub_18AF141F4;
    v16 = sub_18AF139D0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B164D0C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchMergeableDeltasCompletionBlock);
  }

  return v8;
}

- (CKFetchMergeableDeltasOperation)initWithMergeableValueIDs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKFetchMergeableDeltasOperation;
  uint64_t v5 = [(CKOperation *)&v10 init];
  v8 = v5;
  if (v5) {
    objc_msgSend_setMergeableValueIDs_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CKFetchMergeableDeltasOperation;
  if (!-[CKDatabaseOperation CKOperationShouldRun:](&v18, sel_CKOperationShouldRun_)) {
    return 0;
  }
  v8 = objc_msgSend_mergeableValueIDs(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);
  BOOL v13 = v12 != 0;

  if (a3 && !v12)
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKErrorDomain", 12, @"%@ must have at least one mergeable ID to fetch", v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return v13;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchMergeableDeltasOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_mergeableValueIDs(self, v5, v6, v7);
  objc_msgSend_setMergeableValueIDs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKFetchMergeableDeltasOperation;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKFetchMergeableDeltasOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  v8 = objc_msgSend_mergeableValueIDs(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setMergeableValueIDs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKFetchMergeableDeltasOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_CKClientSuitableError(a3, a2, (uint64_t)a3, v3);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v6;
    v20 = objc_msgSend_operationID(self, v17, v18, v19);
    *(_DWORD *)buf = 138543618;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_18AF10000, v16, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling fetch completion block with error: %@", buf, 0x16u);
  }
  uint64_t v10 = objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_fetchMergeableDeltasCompletionBlock(self, v11, v12, v13);
    uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v14)[2](v14, v5);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v15 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v21 = v15;
    v25 = objc_msgSend_operationID(self, v22, v23, v24);
    *(_DWORD *)buf = 138543618;
    v28 = v25;
    __int16 v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_18AF10000, v21, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling fetch completion block with error: %@", buf, 0x16u);
  }
  v26.receiver = self;
  v26.super_class = (Class)CKFetchMergeableDeltasOperation;
  [(CKOperation *)&v26 _finishOnCallbackQueueWithError:v5];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___CKFetchMergeableDeltasOperation;
  id v3 = a3;
  objc_msgSendSuper2(&v11, sel_applyDaemonCallbackInterfaceTweaks_, v3);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_setWithObjects_(v4, v7, v5, v8, v6, 0, v11.receiver, v11.super_class);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v10, (uint64_t)v9, (uint64_t)sel_handleFetchForMergeableValueID_fetchedDeltas_error_, 1, 0);
}

- (void)handleFetchForMergeableValueID:(id)a3 fetchedDeltas:(id)a4 error:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = v14;
    v28 = objc_msgSend_operationID(self, v25, v26, v27);
    int v37 = 138544130;
    v38 = v28;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2048;
    uint64_t v42 = objc_msgSend_count(v9, v29, v30, v31);
    __int16 v43 = 2112;
    v44 = v13;
    _os_log_debug_impl(&dword_18AF10000, v24, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received deltas fetched callback for mergeable %@ with %ld deltas and error: %@", (uint8_t *)&v37, 0x2Au);
  }
  uint64_t v18 = objc_msgSend_deltasFetchedBlock(self, v15, v16, v17);

  if (v18)
  {
    objc_msgSend_deltasFetchedBlock(self, v19, v20, v21);
    v22 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, void *))v22)[2](v22, v8, v9, v13);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v23 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v32 = v23;
    v36 = objc_msgSend_operationID(self, v33, v34, v35);
    int v37 = 138543874;
    v38 = v36;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2112;
    uint64_t v42 = (uint64_t)v13;
    _os_log_debug_impl(&dword_18AF10000, v32, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished deltas fetched callback for mergeable %@ with error: %@", (uint8_t *)&v37, 0x20u);
  }
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
  objc_storeStrong(&self->_fetchMergeableDeltasCompletionBlock, 0);

  objc_storeStrong(&self->_deltasFetchedBlock, 0);
}

@end