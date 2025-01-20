@interface CKUploadMergeableDeltasOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKUploadMergeableDeltasOperation)initWithDeltas:(id)a3 replacementRequests:(id)a4;
- (id)activityCreate;
- (id)perDeltaCompletionBlock;
- (id)perReplacementCompletionBlock;
- (id)uploadDeltasCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleReplacementRequest:(id)a3 error:(id)a4;
- (void)handleUploadForDeltaIdentifier:(id)a3 error:(id)a4;
- (void)setPerDeltaCompletionBlock:(id)a3;
- (void)setPerReplacementCompletionBlock:(id)a3;
- (void)setUploadDeltasCompletionBlock:(id)a3;
@end

@implementation CKUploadMergeableDeltasOperation

- (void)setPerDeltaCompletionBlock:(id)a3
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
    v14[2] = sub_18B14CF54;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perDeltaCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perDeltaCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perDeltaCompletionBlock = self->_perDeltaCompletionBlock;
    self->_id perDeltaCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perDeltaCompletionBlock
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
    id v15 = sub_18AF14118;
    v16 = sub_18AF139A8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B14D14C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perDeltaCompletionBlock);
  }

  return v8;
}

- (void)setPerReplacementCompletionBlock:(id)a3
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
    v14[2] = sub_18B14D2D8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perReplacementCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perReplacementCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perReplacementCompletionBlock = self->_perReplacementCompletionBlock;
    self->_id perReplacementCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perReplacementCompletionBlock
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
    id v15 = sub_18AF14118;
    v16 = sub_18AF139A8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B14D4D0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perReplacementCompletionBlock);
  }

  return v8;
}

- (void)setUploadDeltasCompletionBlock:(id)a3
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
    v14[2] = sub_18B14D65C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id uploadDeltasCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_uploadDeltasCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id uploadDeltasCompletionBlock = self->_uploadDeltasCompletionBlock;
    self->_id uploadDeltasCompletionBlock = v11;
LABEL_9:
  }
}

- (id)uploadDeltasCompletionBlock
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
    id v15 = sub_18AF14118;
    v16 = sub_18AF139A8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B14D854;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_uploadDeltasCompletionBlock);
  }

  return v8;
}

- (CKUploadMergeableDeltasOperation)initWithDeltas:(id)a3 replacementRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CKUploadMergeableDeltasOperation;
  v11 = [(CKOperation *)&v25 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    deltas = v11->_deltas;
    v11->_deltas = (NSArray *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    replacementRequests = v11->_replacementRequests;
    v11->_replacementRequests = (NSArray *)v17;

    uint64_t v22 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v19, v20, v21);
    perItemErrors = v11->_perItemErrors;
    v11->_perItemErrors = (NSMutableDictionary *)v22;
  }
  return v11;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CKUploadMergeableDeltasOperation;
  if (!-[CKDatabaseOperation CKOperationShouldRun:](&v21, sel_CKOperationShouldRun_)) {
    return 0;
  }
  if (self) {
    deltas = self->_deltas;
  }
  else {
    deltas = 0;
  }
  id v6 = deltas;
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);
  BOOL v14 = v10 != 0;
  if (v10) {
    goto LABEL_10;
  }
  if (self) {
    uint64_t v15 = objc_msgSend_count(self->_replacementRequests, v11, v12, v13);
  }
  else {
    uint64_t v15 = objc_msgSend_count(0, v11, v12, v13);
  }
  uint64_t v16 = v15;
  BOOL v17 = v15 != 0;

  if (a3 && !v16)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, @"CKErrorDomain", 12, @"%@ must have at least one delta or replacement", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    return v14;
  }
  return v17;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performUploadMergeableDeltasOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  if (self)
  {
    deltas = self->_deltas;
    id v6 = a3;
    objc_msgSend_setDeltas_(v6, v7, (uint64_t)deltas, v8);
    objc_msgSend_setReplacementRequests_(a3, v9, (uint64_t)self->_replacementRequests, v10);
  }
  else
  {
    id v11 = a3;
    objc_msgSend_setDeltas_(v11, v12, 0, v13);
    objc_msgSend_setReplacementRequests_(a3, v14, 0, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CKUploadMergeableDeltasOperation;
  [(CKDatabaseOperation *)&v16 fillOutOperationInfo:a3];
}

- (void)fillFromOperationInfo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKUploadMergeableDeltasOperation;
  [(CKDatabaseOperation *)&v15 fillFromOperationInfo:v4];
  uint64_t v9 = objc_msgSend_deltas(v4, v5, v6, v7);
  if (self) {
    objc_setProperty_nonatomic_copy(self, v8, v9, 536);
  }

  BOOL v14 = objc_msgSend_replacementRequests(v4, v10, v11, v12);
  if (self) {
    objc_setProperty_nonatomic_copy(self, v13, v14, 544);
  }
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKUploadMergeableDeltasOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perDeltaCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v14 = objc_msgSend_perReplacementCompletionBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      objc_super v15 = objc_msgSend_uploadDeltasCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    if (self) {
      uint64_t v8 = objc_msgSend_count(self->_perItemErrors, v4, v5, v6);
    }
    else {
      uint64_t v8 = objc_msgSend_count(0, v4, v5, v6);
    }
    if (v8)
    {
      v41 = @"CKPartialErrors";
      if (self) {
        perItemErrors = self->_perItemErrors;
      }
      else {
        perItemErrors = 0;
      }
      v42[0] = perItemErrors;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = perItemErrors;
      uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v10, v12, (uint64_t)v42, (uint64_t)&v41, 1);

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v14, @"CKInternalErrorDomain", 1011, v13, @"Failed to upload some deltas");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  objc_super v15 = objc_msgSend_CKClientSuitableError(v7, v4, v5, v6);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v16 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v26 = v16;
    v30 = objc_msgSend_operationID(self, v27, v28, v29);
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    __int16 v39 = 2112;
    v40 = v15;
    _os_log_debug_impl(&dword_18AF10000, v26, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling upload completion block with error: %@", buf, 0x16u);
  }
  uint64_t v20 = objc_msgSend_uploadDeltasCompletionBlock(self, v17, v18, v19);

  if (v20)
  {
    objc_msgSend_uploadDeltasCompletionBlock(self, v21, v22, v23);
    v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v24)[2](v24, v15);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v25 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v31 = v25;
    v35 = objc_msgSend_operationID(self, v32, v33, v34);
    *(_DWORD *)buf = 138543618;
    v38 = v35;
    __int16 v39 = 2112;
    v40 = v15;
    _os_log_debug_impl(&dword_18AF10000, v31, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished calling upload completion block with error: %@", buf, 0x16u);
  }
  v36.receiver = self;
  v36.super_class = (Class)CKUploadMergeableDeltasOperation;
  [(CKOperation *)&v36 _finishOnCallbackQueueWithError:v15];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/upload-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (void)handleUploadForDeltaIdentifier:(id)a3 error:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    deltas = self->_deltas;
  }
  else {
    deltas = 0;
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_18B14E364;
  v41[3] = &unk_1E5465260;
  id v12 = v6;
  id v42 = v12;
  objc_super v16 = objc_msgSend_CKFirstObjectPassingTest_(deltas, v13, (uint64_t)v41, v14);
  if (v16)
  {
    if (self) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_perItemErrors, v15, (uint64_t)v10, (uint64_t)v12);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(0, v15, (uint64_t)v10, (uint64_t)v12);
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    objc_super v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = v17;
      v37 = objc_msgSend_operationID(self, v34, v35, v36);
      *(_DWORD *)buf = 138543874;
      v44 = v37;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_18AF10000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received delta upload callback for identifier %@ with error: %@", buf, 0x20u);
    }
    objc_super v21 = objc_msgSend_perDeltaCompletionBlock(self, v18, v19, v20);

    if (v21)
    {
      objc_msgSend_perDeltaCompletionBlock(self, v22, v23, v24);
      objc_super v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void *))v25)[2](v25, v16, v10);
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v26 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v27 = v26;
      v31 = objc_msgSend_operationID(self, v28, v29, v30);
      *(_DWORD *)buf = 138543874;
      v44 = v31;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_18AF10000, v27, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished delta upload callback for identifier %@ with error: %@", buf, 0x20u);
LABEL_21:
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v32 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v27 = v32;
      v31 = objc_msgSend_operationID(self, v38, v39, v40);
      *(_DWORD *)buf = 138543618;
      v44 = v31;
      __int16 v45 = 2112;
      id v46 = v12;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Operation %{public}@ received delta upload callback for unknown delta with identifier: %@", buf, 0x16u);
      goto LABEL_21;
    }
  }
}

- (void)handleReplacementRequest:(id)a3 error:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    perItemErrors = self->_perItemErrors;
  }
  else {
    perItemErrors = 0;
  }
  id v12 = perItemErrors;
  objc_super v16 = objc_msgSend_valueID(v6, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v17, (uint64_t)v10, (uint64_t)v16);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v18 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v18;
    v32 = objc_msgSend_operationID(self, v29, v30, v31);
    int v38 = 138543874;
    uint64_t v39 = v32;
    __int16 v40 = 2112;
    id v41 = v6;
    __int16 v42 = 2112;
    v43 = v10;
    _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received replacement callback for request %@ with error: %@", (uint8_t *)&v38, 0x20u);
  }
  uint64_t v22 = objc_msgSend_perReplacementCompletionBlock(self, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_perReplacementCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v26)[2](v26, v6, v10);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = v27;
    v37 = objc_msgSend_operationID(self, v34, v35, v36);
    int v38 = 138543362;
    uint64_t v39 = v37;
    _os_log_debug_impl(&dword_18AF10000, v33, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished replacement callback", (uint8_t *)&v38, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrors, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong(&self->_uploadDeltasCompletionBlock, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);

  objc_storeStrong(&self->_perDeltaCompletionBlock, 0);
}

@end