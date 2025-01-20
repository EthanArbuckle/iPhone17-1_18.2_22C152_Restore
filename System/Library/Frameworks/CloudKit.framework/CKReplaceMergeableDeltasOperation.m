@interface CKReplaceMergeableDeltasOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKReplaceMergeableDeltasOperation)initWithReplaceDeltasRequests:(id)a3;
- (NSArray)replaceDeltasRequests;
- (NSMutableDictionary)perValueErrors;
- (id)activityCreate;
- (id)perReplacementBlock;
- (id)replaceMergeableDeltasCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleCompletedReplaceDeltasRequest:(id)a3 error:(id)a4;
- (void)setPerReplacementBlock:(id)a3;
- (void)setPerValueErrors:(id)a3;
- (void)setReplaceDeltasRequests:(id)a3;
- (void)setReplaceMergeableDeltasCompletionBlock:(id)a3;
@end

@implementation CKReplaceMergeableDeltasOperation

- (void)setPerReplacementBlock:(id)a3
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
    v14[2] = sub_18B1AB8C4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perReplacementBlock = v15;
    goto LABEL_9;
  }
  if (self->_perReplacementBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perReplacementBlock = self->_perReplacementBlock;
    self->_id perReplacementBlock = v11;
LABEL_9:
  }
}

- (id)perReplacementBlock
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
    id v15 = sub_18AF143B0;
    v16 = sub_18AF13A3C;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1ABABC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perReplacementBlock);
  }

  return v8;
}

- (void)setReplaceMergeableDeltasCompletionBlock:(id)a3
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
    v14[2] = sub_18B1ABC48;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id replaceMergeableDeltasCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_replaceMergeableDeltasCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id replaceMergeableDeltasCompletionBlock = self->_replaceMergeableDeltasCompletionBlock;
    self->_id replaceMergeableDeltasCompletionBlock = v11;
LABEL_9:
  }
}

- (id)replaceMergeableDeltasCompletionBlock
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
    id v15 = sub_18AF143B0;
    v16 = sub_18AF13A3C;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1ABE40;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_replaceMergeableDeltasCompletionBlock);
  }

  return v8;
}

- (CKReplaceMergeableDeltasOperation)initWithReplaceDeltasRequests:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKReplaceMergeableDeltasOperation;
  v8 = [(CKOperation *)&v17 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    replaceDeltasRequests = v8->_replaceDeltasRequests;
    v8->_replaceDeltasRequests = (NSArray *)v9;

    uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12, v13);
    perValueErrors = v8->_perValueErrors;
    v8->_perValueErrors = (NSMutableDictionary *)v14;
  }
  return v8;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKReplaceMergeableDeltasOperation;
  BOOL v5 = -[CKDatabaseOperation CKOperationShouldRun:](&v20, sel_CKOperationShouldRun_);
  if (v5)
  {
    uint64_t v9 = objc_msgSend_replaceDeltasRequests(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

    if (v13)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        v16 = (objc_class *)objc_opt_class();
        objc_super v17 = NSStringFromClass(v16);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, @"CKErrorDomain", 12, @"%@ cannot run without a %@", v15, v17);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performReplaceMergeableDeltasOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKReplaceMergeableDeltasOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
  uint64_t v8 = objc_msgSend_replaceDeltasRequests(self, v5, v6, v7, v11.receiver, v11.super_class);
  objc_msgSend_setReplaceDeltasRequests_(v4, v9, (uint64_t)v8, v10);
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKReplaceMergeableDeltasOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_replaceDeltasRequests(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setReplaceDeltasRequests_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKReplaceMergeableDeltasOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perReplacementBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v11 = objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v7, v8, v9);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v16, @"CKInternalErrorDomain", 1011, v15, @"Failed to replace some delta metadata");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  objc_super v17 = objc_msgSend_CKClientSuitableError(v7, v4, v5, v6);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v18 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v28 = v18;
    v32 = objc_msgSend_operationID(self, v29, v30, v31);
    *(_DWORD *)buf = 138543618;
    v40 = v32;
    __int16 v41 = 2112;
    v42 = v17;
    _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling replace mergeable deltas completion block with error: %@", buf, 0x16u);
  }
  v22 = objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_replaceMergeableDeltasCompletionBlock(self, v23, v24, v25);
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
    _os_log_debug_impl(&dword_18AF10000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling replace mergeable deltas completion block with error: %@", buf, 0x16u);
  }
  v38.receiver = self;
  v38.super_class = (Class)CKReplaceMergeableDeltasOperation;
  [(CKOperation *)&v38 _finishOnCallbackQueueWithError:v17];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/replace-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (void)handleCompletedReplaceDeltasRequest:(id)a3 error:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v13 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_perValueErrors(self, v10, v11, v12);
    v18 = objc_msgSend_valueID(v6, v15, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v13, (uint64_t)v18);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v20 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = v20;
    v34 = objc_msgSend_operationID(self, v31, v32, v33);
    int v40 = 138543874;
    __int16 v41 = v34;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    v45 = v13;
    _os_log_debug_impl(&dword_18AF10000, v30, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received replace mergeable deltas request callback for %@ with error: %@", (uint8_t *)&v40, 0x20u);
  }
  uint64_t v24 = objc_msgSend_perReplacementBlock(self, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_perReplacementBlock(self, v25, v26, v27);
    v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v28)[2](v28, v6, v13);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v29 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = v29;
    v39 = objc_msgSend_operationID(self, v36, v37, v38);
    int v40 = 138543874;
    __int16 v41 = v39;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    v45 = v13;
    _os_log_debug_impl(&dword_18AF10000, v35, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished replace mergeable deltas request callback for %@ with error: %@", (uint8_t *)&v40, 0x20u);
  }
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
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
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
  objc_storeStrong(&self->_replaceMergeableDeltasCompletionBlock, 0);

  objc_storeStrong(&self->_perReplacementBlock, 0);
}

@end