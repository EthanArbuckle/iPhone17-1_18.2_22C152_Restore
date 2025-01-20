@interface CKFetchUserQuotaOperation
+ (SEL)daemonCallbackCompletionSelector;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchUserQuotaOperation)init;
- (id)activityCreate;
- (id)fetchUserQuotaCompletionBlock;
- (id)fetchUserQuotaCompletionBlock_wrapper;
- (unint64_t)quotaAvailable;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)handleOperationDidCompleteWithQuotaAvailable:(unint64_t)a3 metrics:(id)a4 error:(id)a5;
- (void)setFetchUserQuotaCompletionBlock:(id)a3;
- (void)setFetchUserQuotaCompletionBlock_wrapper:(id)a3;
- (void)setQuotaAvailable:(unint64_t)a3;
@end

@implementation CKFetchUserQuotaOperation

- (CKFetchUserQuotaOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchUserQuotaOperation;
  return [(CKOperation *)&v3 init];
}

- (void)setFetchUserQuotaCompletionBlock:(id)a3
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
    v14[2] = sub_18B1A7B1C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchUserQuotaCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchUserQuotaCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchUserQuotaCompletionBlock = self->_fetchUserQuotaCompletionBlock;
    self->_id fetchUserQuotaCompletionBlock = v11;
LABEL_9:
  }
}

- (id)fetchUserQuotaCompletionBlock
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
    id v15 = sub_18AF14384;
    v16 = sub_18AF13A34;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A7D14;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchUserQuotaCompletionBlock);
  }

  return v8;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKFetchUserQuotaOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_fetchUserQuotaCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchUserQuotaOperation_withBlock_;
}

- (void)handleOperationDidCompleteWithQuotaAvailable:(unint64_t)a3 metrics:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  if ((objc_msgSend_isCancelled(self, v10, v11, v12) & 1) == 0) {
    objc_msgSend_setQuotaAvailable_(self, v13, a3, v14);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v15 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v15;
    v20 = objc_msgSend_operationID(self, v17, v18, v19);
    *(_DWORD *)buf = 138543618;
    v23 = v20;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    _os_log_debug_impl(&dword_18AF10000, v16, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with quota %llu;",
      buf,
      0x16u);
  }
  v21.receiver = self;
  v21.super_class = (Class)CKFetchUserQuotaOperation;
  [(CKOperation *)&v21 handleOperationDidCompleteWithMetrics:v9 error:v8];
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
      v16 = self->super.super._signpost;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchUserQuotaOperation", "Finishing", buf, 2u);
    }
  }
  v22 = objc_msgSend_fetchUserQuotaCompletionBlock_wrapper(self, v7, v8, v9);
  uint64_t v26 = v22;
  if (v22)
  {
    v27 = (void (**)(void *, uint64_t, void *))_Block_copy(v22);
  }
  else
  {
    v28 = objc_msgSend_fetchUserQuotaCompletionBlock(self, v23, v24, v25);
    v27 = (void (**)(void *, uint64_t, void *))_Block_copy(v28);
  }
  if (v27)
  {
    uint64_t v32 = objc_msgSend_quotaAvailable(self, v29, v30, v31);
    v36 = objc_msgSend_CKClientSuitableError(v4, v33, v34, v35);
    v27[2](v27, v32, v36);

    objc_msgSend_setFetchUserQuotaCompletionBlock_(self, v37, 0, v38);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKFetchUserQuotaOperation;
  [(CKOperation *)&v39 _finishOnCallbackQueueWithError:v4];
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
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchUserQuotaOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchUserQuotaOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-user-quota", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleOperationDidCompleteWithQuotaAvailable_metrics_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchUserQuotaOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithQuotaAvailable_metrics_error_;
}

- (unint64_t)quotaAvailable
{
  return self->_quotaAvailable;
}

- (void)setQuotaAvailable:(unint64_t)a3
{
  self->_quotaAvailable = a3;
}

- (id)fetchUserQuotaCompletionBlock_wrapper
{
  return self->_fetchUserQuotaCompletionBlock_wrapper;
}

- (void)setFetchUserQuotaCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchUserQuotaCompletionBlock_wrapper, 0);

  objc_storeStrong(&self->_fetchUserQuotaCompletionBlock, 0);
}

@end