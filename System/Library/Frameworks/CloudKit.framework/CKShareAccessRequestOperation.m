@interface CKShareAccessRequestOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKShareAccessRequestOperation)init;
- (CKShareAccessRequestOperation)initWithShareURLs:(id)a3;
- (NSArray)shareURLs;
- (NSMutableDictionary)errorsByShareURL;
- (id)activityCreate;
- (id)perShareAccessRequestCompletionBlock;
- (id)shareAccessRequestCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleShareAccessRequestForURL:(id)a3 error:(id)a4;
- (void)setErrorsByShareURL:(id)a3;
- (void)setPerShareAccessRequestCompletionBlock:(id)a3;
- (void)setShareAccessRequestCompletionBlock:(id)a3;
- (void)setShareAccessRequestCompletionBlockIVar:(id)a3;
- (void)setShareURLs:(id)a3;
@end

@implementation CKShareAccessRequestOperation

- (CKShareAccessRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKShareAccessRequestOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorsByShareURL = v2->_errorsByShareURL;
    v2->_errorsByShareURL = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKShareAccessRequestOperation)initWithShareURLs:(id)a3
{
  id v4 = a3;
  v11 = (CKShareAccessRequestOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    shareURLs = v11->_shareURLs;
    v11->_shareURLs = (NSArray *)v12;
  }
  return v11;
}

- (void)setPerShareAccessRequestCompletionBlock:(id)a3
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
    v14[2] = sub_18B0B9270;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perShareAccessRequestCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perShareAccessRequestCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perShareAccessRequestCompletionBlock = self->_perShareAccessRequestCompletionBlock;
    self->_id perShareAccessRequestCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perShareAccessRequestCompletionBlock
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
    id v15 = sub_18AF13DE8;
    v16 = sub_18AF138F0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0B9468;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perShareAccessRequestCompletionBlock);
  }

  return v8;
}

- (void)setShareAccessRequestCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B0B95F4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id shareAccessRequestCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_shareAccessRequestCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id shareAccessRequestCompletionBlock = self->_shareAccessRequestCompletionBlock;
    self->_id shareAccessRequestCompletionBlock = v11;
LABEL_9:
  }
}

- (id)shareAccessRequestCompletionBlock
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
    id v15 = sub_18AF13DE8;
    v16 = sub_18AF138F0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0B97EC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_shareAccessRequestCompletionBlock);
  }

  return v8;
}

- (void)setShareAccessRequestCompletionBlock:(id)a3
{
  BOOL v4 = a3 == 0;
  id v9 = a3;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setShareAccessRequestCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shareURLs(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareURLsToRequestAccessFor_(v4, v13, (uint64_t)v12, v14);

  v15.receiver = self;
  v15.super_class = (Class)CKShareAccessRequestOperation;
  [(CKOperation *)&v15 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKShareAccessRequestOperation;
  id v4 = a3;
  [(CKOperation *)&v15 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_shareURLsToRequestAccessFor(v4, v5, v6, v7, v15.receiver, v15.super_class);

  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareURLs_(self, v13, (uint64_t)v12, v14);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKShareAccessRequestOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perShareAccessRequestCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_shareAccessRequestCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v6 = objc_msgSend_shareURLs(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v10 = v8;
  uint64_t v11 = *(void *)v27;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
      if (!v13)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, @"CKErrorDomain", 12, @"share URL to request access for is invalid. url: %@", 0);
LABEL_16:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_17:

        return 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, @"CKErrorDomain", 12, @"Object in share URLs to request access for is not a url: %@", v13);
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v10) {
      continue;
    }
    break;
  }
LABEL_10:

  id v17 = objc_msgSend_shareURLs(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);

  if (v21)
  {
    v25.receiver = self;
    v25.super_class = (Class)CKShareAccessRequestOperation;
    return [(CKOperation *)&v25 CKOperationShouldRun:a3];
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, @"CKErrorDomain", 12, @"You must specify some share URLs to request access to.");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v24;
  }
  else
  {
    return 0;
  }
  return result;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performShareAccessRequestOperation_withBlock_;
}

- (void)handleShareAccessRequestForURL:(id)a3 error:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (!v10)
  {
    if (!v12) {
      goto LABEL_24;
    }
    if (self) {
      v30 = self->super._signpost;
    }
    else {
      v30 = 0;
    }
    uint64_t v31 = v30;
    long long v28 = objc_msgSend_log(v31, v32, v33, v34);

    if (self) {
      v35 = self->super._signpost;
    }
    else {
      v35 = 0;
    }
    v36 = v35;
    os_signpost_id_t v40 = objc_msgSend_identifier(v36, v37, v38, v39);

    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      int v52 = 138412290;
      id v53 = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v28, OS_SIGNPOST_EVENT, v40, "CKShareAccessRequestOperation", "Requested access for share: %@", (uint8_t *)&v52, 0xCu);
    }
    goto LABEL_23;
  }
  if (v12)
  {
    if (self) {
      uint64_t v16 = self->super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    uint64_t v21 = objc_msgSend_log(v17, v18, v19, v20);

    if (self) {
      v22 = self->super._signpost;
    }
    else {
      v22 = 0;
    }
    v23 = v22;
    os_signpost_id_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      int v52 = 138412546;
      id v53 = v6;
      __int16 v54 = 2112;
      v55 = v10;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v21, OS_SIGNPOST_EVENT, v27, "CKShareAccessRequestOperation", "Requested access for share: %@ with error: %@", (uint8_t *)&v52, 0x16u);
    }
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
  {
    long long v28 = objc_msgSend_errorsByShareURL(self, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v10, (uint64_t)v6);
LABEL_23:
  }
LABEL_24:
  v41 = objc_msgSend_perShareAccessRequestCompletionBlock(self, v13, v14, v15);

  if (v41)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v42 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v47 = v42;
      v51 = objc_msgSend_operationID(self, v48, v49, v50);
      int v52 = 138543618;
      id v53 = v51;
      __int16 v54 = 2112;
      v55 = v10;
      _os_log_debug_impl(&dword_18AF10000, v47, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about requested access for share: %@", (uint8_t *)&v52, 0x16u);
    }
    objc_msgSend_perShareAccessRequestCompletionBlock(self, v43, v44, v45);
    v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v46)[2](v46, v6, v10);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKShareAccessRequestOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    v22 = objc_msgSend_errorsByShareURL(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      os_signpost_id_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_errorsByShareURL(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to request access to some shares");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_shareAccessRequestCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    objc_msgSend_shareAccessRequestCompletionBlock(self, v35, v36, v37);
    uint64_t v38 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    ((void (**)(void, void *))v38)[2](v38, v42);

    objc_msgSend_setShareAccessRequestCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setPerShareAccessRequestCompletionBlock_(self, v35, 0, v37);
  v45.receiver = self;
  v45.super_class = (Class)CKShareAccessRequestOperation;
  [(CKOperation *)&v45 _finishOnCallbackQueueWithError:v4];
}

- (void)ckSignpostBegin
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super._signpost;
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
      long long v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      objc_super v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      id v53 = CKStringForQOS(v49, v50, v51, v52);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKShareAccessRequestOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      uint64_t v13 = self->super._signpost;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKShareAccessRequestOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/share-access-request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareAccessRequestForURL_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKShareAccessRequestOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
}

- (NSMutableDictionary)errorsByShareURL
{
  return self->_errorsByShareURL;
}

- (void)setErrorsByShareURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_shareAccessRequestCompletionBlock, 0);

  objc_storeStrong(&self->_perShareAccessRequestCompletionBlock, 0);
}

@end