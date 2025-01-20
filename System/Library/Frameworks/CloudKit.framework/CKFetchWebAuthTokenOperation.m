@interface CKFetchWebAuthTokenOperation
+ (SEL)daemonCallbackCompletionSelector;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchWebAuthTokenOperation)init;
- (CKFetchWebAuthTokenOperation)initWithAPIToken:(NSString *)APIToken;
- (NSString)APIToken;
- (NSString)webAuthToken;
- (id)activityCreate;
- (id)fetchWebAuthTokenCompletionBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchWebAuthTokenCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleOperationDidCompleteWithWebAuthToken:(id)a3 metrics:(id)a4 error:(id)a5;
- (void)setAPIToken:(NSString *)APIToken;
- (void)setFetchWebAuthTokenCompletionBlock:(void *)fetchWebAuthTokenCompletionBlock;
- (void)setFetchWebAuthTokenCompletionBlock_wrapper:(id)a3;
- (void)setWebAuthToken:(id)a3;
@end

@implementation CKFetchWebAuthTokenOperation

- (CKFetchWebAuthTokenOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchWebAuthTokenOperation;
  return [(CKOperation *)&v3 init];
}

- (CKFetchWebAuthTokenOperation)initWithAPIToken:(NSString *)APIToken
{
  v4 = APIToken;
  v11 = (CKFetchWebAuthTokenOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_APIToken;
    v11->_APIToken = (NSString *)v12;
  }
  return v11;
}

- (void)setFetchWebAuthTokenCompletionBlock:(void *)fetchWebAuthTokenCompletionBlock
{
  id v7 = fetchWebAuthTokenCompletionBlock;
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
    v14[2] = sub_18B0F9760;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_fetchWebAuthTokenCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_fetchWebAuthTokenCompletionBlock;
    self->_fetchWebAuthTokenCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchWebAuthTokenCompletionBlock
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
    id v15 = sub_18AF13EF4;
    v16 = sub_18AF13930;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0F9958;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_fetchWebAuthTokenCompletionBlock);
  }

  return v8;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v6 = objc_msgSend_APIToken(self, a2, (uint64_t)a3, v3);

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)CKFetchWebAuthTokenOperation;
    return [(CKDatabaseOperation *)&v10 CKOperationShouldRun:a3];
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKErrorDomain", 12, @"You must provide an APIToken");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKFetchWebAuthTokenOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_fetchWebAuthTokenCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchWebAuthTokenOperation_withBlock_;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_APIToken(self, v5, v6, v7);
  objc_msgSend_setAPIToken_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKFetchWebAuthTokenOperation;
  [(CKDatabaseOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKFetchWebAuthTokenOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v11 fillFromOperationInfo:v4];
  v8 = objc_msgSend_APIToken(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setAPIToken_(self, v9, (uint64_t)v8, v10);
}

- (void)handleOperationDidCompleteWithWebAuthToken:(id)a3 metrics:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ((objc_msgSend_isCancelled(self, v11, v12, v13) & 1) == 0) {
    objc_msgSend_setWebAuthToken_(self, v14, (uint64_t)v8, v15);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v16 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    id v17 = v16;
    v21 = objc_msgSend_operationID(self, v18, v19, v20);
    *(_DWORD *)buf = 138543618;
    v24 = v21;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_debug_impl(&dword_18AF10000, v17, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with web auth token %@", buf, 0x16u);
  }
  v22.receiver = self;
  v22.super_class = (Class)CKFetchWebAuthTokenOperation;
  [(CKOperation *)&v22 handleOperationDidCompleteWithMetrics:v10 error:v9];
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super.super._signpost;
    }
    else {
      id v10 = 0;
    }
    objc_super v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchWebAuthTokenOperation", "Finishing", buf, 2u);
    }
  }
  objc_super v22 = objc_msgSend_fetchWebAuthTokenCompletionBlock_wrapper(self, v7, v8, v9);
  id v26 = v22;
  if (v22)
  {
    uint64_t v27 = (void (**)(void *, void *, uint64_t))_Block_copy(v22);
  }
  else
  {
    v28 = objc_msgSend_fetchWebAuthTokenCompletionBlock(self, v23, v24, v25);
    uint64_t v27 = (void (**)(void *, void *, uint64_t))_Block_copy(v28);
  }
  if (v27)
  {
    uint64_t v32 = objc_msgSend_CKClientSuitableError(v4, v29, v30, v31);
    uint64_t v36 = objc_msgSend_webAuthToken(self, v33, v34, v35);
    uint64_t v37 = v36 | v32;

    if (!v37)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v38, @"CKErrorDomain", 1, @"No web auth token to return, but no error either");
    }
    v41 = objc_msgSend_webAuthToken(self, v38, v39, v40);
    v27[2](v27, v41, v32);

    objc_msgSend_setFetchWebAuthTokenCompletionBlock_(self, v42, 0, v43);
  }
  v44.receiver = self;
  v44.super_class = (Class)CKFetchWebAuthTokenOperation;
  [(CKOperation *)&v44 _finishOnCallbackQueueWithError:v4];
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
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

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
      v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchWebAuthTokenOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchWebAuthTokenOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-web-auth-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleOperationDidCompleteWithWebAuthToken_metrics_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchWebAuthTokenOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithWebAuthToken_metrics_error_;
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(NSString *)APIToken
{
}

- (NSString)webAuthToken
{
  return self->_webAuthToken;
}

- (void)setWebAuthToken:(id)a3
{
}

- (id)fetchWebAuthTokenCompletionBlock_wrapper
{
  return self->_fetchWebAuthTokenCompletionBlock_wrapper;
}

- (void)setFetchWebAuthTokenCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchWebAuthTokenCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_webAuthToken, 0);
  objc_storeStrong((id *)&self->_APIToken, 0);

  objc_storeStrong(&self->_fetchWebAuthTokenCompletionBlock, 0);
}

@end