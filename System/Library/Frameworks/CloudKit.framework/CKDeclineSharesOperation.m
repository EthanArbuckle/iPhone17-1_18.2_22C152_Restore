@interface CKDeclineSharesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKDeclineSharesOperation)init;
- (CKDeclineSharesOperation)initWithShareMetadatas:(id)a3;
- (NSArray)shareMetadatas;
- (NSMutableDictionary)errorsByShareURL;
- (NSMutableDictionary)shareMetadatasByShareURL;
- (id)activityCreate;
- (id)declineSharesCompletionBlock;
- (id)perShareCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleShareDeclineForURL:(id)a3 error:(id)a4;
- (void)setDeclineSharesCompletionBlock:(id)a3;
- (void)setDeclineSharesCompletionBlockIVar:(id)a3;
- (void)setErrorsByShareURL:(id)a3;
- (void)setPerShareCompletionBlock:(id)a3;
- (void)setShareMetadatas:(id)a3;
- (void)setShareMetadatasByShareURL:(id)a3;
@end

@implementation CKDeclineSharesOperation

- (CKDeclineSharesOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKDeclineSharesOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorsByShareURL = v2->_errorsByShareURL;
    v2->_errorsByShareURL = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKDeclineSharesOperation)initWithShareMetadatas:(id)a3
{
  id v4 = a3;
  v8 = (CKDeclineSharesOperation *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8) {
    objc_msgSend_setShareMetadatas_(v8, v9, (uint64_t)v4, v10);
  }

  return v11;
}

- (void)setShareMetadatas:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7);
  shareMetadatas = self->_shareMetadatas;
  self->_shareMetadatas = v8;

  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  shareMetadatasByShareURL = self->_shareMetadatasByShareURL;
  self->_shareMetadatasByShareURL = v10;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v4;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v12);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v22 = objc_msgSend_share(v21, v15, v16, v17, (void)v28);
        v26 = objc_msgSend_URL(v22, v23, v24, v25);

        if (v26) {
          objc_msgSend_setObject_forKeyedSubscript_(self->_shareMetadatasByShareURL, v27, (uint64_t)v21, (uint64_t)v26);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v18);
  }
}

- (void)setPerShareCompletionBlock:(id)a3
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
    v14[2] = sub_18B04ACEC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perShareCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perShareCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perShareCompletionBlock = self->_perShareCompletionBlock;
    self->_id perShareCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perShareCompletionBlock
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
    id v15 = sub_18AF13B88;
    uint64_t v16 = sub_18AF13868;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B04AEE4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perShareCompletionBlock);
  }

  return v8;
}

- (void)setDeclineSharesCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B04B070;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id declineSharesCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_declineSharesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id declineSharesCompletionBlock = self->_declineSharesCompletionBlock;
    self->_id declineSharesCompletionBlock = v11;
LABEL_9:
  }
}

- (id)declineSharesCompletionBlock
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
    id v15 = sub_18AF13B88;
    uint64_t v16 = sub_18AF13868;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B04B268;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_declineSharesCompletionBlock);
  }

  return v8;
}

- (void)setDeclineSharesCompletionBlock:(id)a3
{
  BOOL v4 = a3 == 0;
  id v9 = a3;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setDeclineSharesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shareMetadatas(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatasToDecline_(v4, v13, (uint64_t)v12, v14);

  v15.receiver = self;
  v15.super_class = (Class)CKDeclineSharesOperation;
  [(CKOperation *)&v15 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDeclineSharesOperation;
  id v4 = a3;
  [(CKOperation *)&v15 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_shareMetadatasToDecline(v4, v5, v6, v7, v15.receiver, v15.super_class);

  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatas_(self, v13, (uint64_t)v12, v14);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKDeclineSharesOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perShareCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_declineSharesCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  BOOL v6 = objc_msgSend_shareMetadatas(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v50, (uint64_t)v54, 16);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v51;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v51 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, @"CKErrorDomain", 12, @"Unexpected shareMetadata in shares to decline: %@", v12);
LABEL_17:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_18:

        return 0;
      }
      uint64_t v16 = objc_msgSend_share(v12, v13, v14, v15);
      v20 = objc_msgSend_URL(v16, v17, v18, v19);

      if (!v20)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v21, @"CKErrorDomain", 12, @"shareMetadata lacks share URL: %@", v12);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v21, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:

  uint64_t v25 = objc_msgSend_resolvedConfiguration(self, v22, v23, v24);
  long long v29 = objc_msgSend_container(v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_options(v29, v30, v31, v32);
  int v37 = objc_msgSend_useAnonymousToServerShareParticipants(v33, v34, v35, v36);

  if (v37)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v38, @"CKErrorDomain", 12, @"Decline does not yet support Anonymous to Apple shares");
      goto LABEL_25;
    }
    return 0;
  }
  else
  {
    v42 = objc_msgSend_shareMetadatas(self, v38, v39, v40);
    uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45);

    if (v46)
    {
      v49.receiver = self;
      v49.super_class = (Class)CKDeclineSharesOperation;
      return [(CKOperation *)&v49 CKOperationShouldRun:a3];
    }
    else
    {
      if (!a3) {
        return 0;
      }
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v47, @"CKErrorDomain", 12, @"You must specify some share metadatas to decline");
LABEL_25:
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v48;
    }
  }
  return result;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDeclineSharesOperation_withBlock_;
}

- (void)handleShareDeclineForURL:(id)a3 error:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (v10)
  {
    if (!v12) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v16 = self->super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    v21 = objc_msgSend_log(v17, v18, v19, v20);

    if (self) {
      v22 = self->super._signpost;
    }
    else {
      v22 = 0;
    }
    uint64_t v23 = v22;
    uint64_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

    if ((unint64_t)(v27 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_21;
    }
    *(_DWORD *)v81 = 138412546;
    *(void *)&v81[4] = v6;
    *(_WORD *)&v81[12] = 2112;
    *(void *)&v81[14] = v10;
    uint64_t v28 = "Share %@ declined with error: %@";
    long long v29 = v21;
    os_signpost_id_t v30 = v27;
    uint32_t v31 = 22;
    goto LABEL_20;
  }
  if (!v12) {
    goto LABEL_22;
  }
  if (self) {
    uint64_t v32 = self->super._signpost;
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v33 = v32;
  v21 = objc_msgSend_log(v33, v34, v35, v36);

  if (self) {
    int v37 = self->super._signpost;
  }
  else {
    int v37 = 0;
  }
  v38 = v37;
  uint64_t v42 = objc_msgSend_identifier(v38, v39, v40, v41);

  if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)v81 = 138412290;
    *(void *)&v81[4] = v6;
    uint64_t v28 = "Share %@ declined";
    long long v29 = v21;
    os_signpost_id_t v30 = v42;
    uint32_t v31 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v30, "CKDeclineSharesOperation", v28, v81, v31);
  }
LABEL_21:

LABEL_22:
  v43 = objc_msgSend_shareMetadatasByShareURL(self, v13, v14, v15, *(_OWORD *)v81, *(void *)&v81[16], v82);
  uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v43, v44, (uint64_t)v6, v45);

  if (v46)
  {
    if (v10 && (objc_msgSend_canDropItemResultsEarly(self, v47, v48, v49) & 1) == 0)
    {
      long long v50 = objc_msgSend_errorsByShareURL(self, v47, v48, v49);
      v54 = objc_msgSend_share(v46, v51, v52, v53);
      v58 = objc_msgSend_URL(v54, v55, v56, v57);
      objc_msgSend_setObject_forKeyedSubscript_(v50, v59, (uint64_t)v10, (uint64_t)v58);
    }
    v60 = objc_msgSend_perShareCompletionBlock(self, v47, v48, v49);

    if (v60)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v61 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v67 = v61;
        v71 = objc_msgSend_operationID(self, v68, v69, v70);
        *(_DWORD *)v81 = 138543618;
        *(void *)&v81[4] = v71;
        *(_WORD *)&v81[12] = 2112;
        *(void *)&v81[14] = v10;
        _os_log_debug_impl(&dword_18AF10000, v67, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about decline share: %@", v81, 0x16u);
      }
      objc_msgSend_perShareCompletionBlock(self, v62, v63, v64);
      v65 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void *))v65)[2](v65, v46, v10);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v66 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v72 = v66;
      v76 = objc_msgSend_shareMetadatasByShareURL(self, v73, v74, v75);
      v80 = objc_msgSend_allKeys(v76, v77, v78, v79);
      *(_DWORD *)v81 = 138412546;
      *(void *)&v81[4] = v6;
      *(_WORD *)&v81[12] = 2112;
      *(void *)&v81[14] = v80;
      _os_log_error_impl(&dword_18AF10000, v72, OS_LOG_TYPE_ERROR, "Received callback for URL I don't know about: %@ %@", v81, 0x16u);
    }
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKDeclineSharesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    v22 = objc_msgSend_errorsByShareURL(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint32_t v31 = objc_msgSend_errorsByShareURL(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to decline some shares");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  v34 = objc_msgSend_declineSharesCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    objc_msgSend_declineSharesCompletionBlock(self, v35, v36, v37);
    v38 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v42 = objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    ((void (**)(void, void *))v38)[2](v38, v42);

    objc_msgSend_setDeclineSharesCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setPerShareCompletionBlock_(self, v35, 0, v37);
  v45.receiver = self;
  v45.super_class = (Class)CKDeclineSharesOperation;
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
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      objc_super v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDeclineSharesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDeclineSharesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/decline-shares", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareDeclineForURL_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKDeclineSharesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)shareMetadatas
{
  return self->_shareMetadatas;
}

- (NSMutableDictionary)errorsByShareURL
{
  return self->_errorsByShareURL;
}

- (void)setErrorsByShareURL:(id)a3
{
}

- (NSMutableDictionary)shareMetadatasByShareURL
{
  return self->_shareMetadatasByShareURL;
}

- (void)setShareMetadatasByShareURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadatasByShareURL, 0);
  objc_storeStrong((id *)&self->_errorsByShareURL, 0);
  objc_storeStrong((id *)&self->_shareMetadatas, 0);
  objc_storeStrong(&self->_declineSharesCompletionBlock, 0);

  objc_storeStrong(&self->_perShareCompletionBlock, 0);
}

@end