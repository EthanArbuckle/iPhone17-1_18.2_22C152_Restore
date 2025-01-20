@interface CKFetchShareParticipantsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchShareParticipantsOperation)init;
- (CKFetchShareParticipantsOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos;
- (NSArray)userIdentityLookupInfos;
- (NSMutableDictionary)lookupErrors;
- (NSMutableSet)discoveredUserIdentities;
- (id)activityCreate;
- (id)fetchShareParticipantsCompletionBlock_wrapper;
- (id)perShareParticipantCompletionBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchShareParticipantsCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleShareParticipantFetchForLookupInfo:(id)a3 shareParticipant:(id)a4 error:(id)a5;
- (void)perShareParticipantCompletionBlock;
- (void)setDiscoveredUserIdentities:(id)a3;
- (void)setFetchShareParticipantsCompletionBlock:(void *)fetchShareParticipantsCompletionBlock;
- (void)setFetchShareParticipantsCompletionBlockIVar:(id)a3;
- (void)setFetchShareParticipantsCompletionBlock_wrapper:(id)a3;
- (void)setLookupErrors:(id)a3;
- (void)setPerShareParticipantCompletionBlock:(void *)perShareParticipantCompletionBlock;
- (void)setPerShareParticipantCompletionBlock_wrapper:(id)a3;
- (void)setShareParticipantFetchedBlock:(void *)shareParticipantFetchedBlock;
- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos;
- (void)shareParticipantFetchedBlock;
@end

@implementation CKFetchShareParticipantsOperation

- (CKFetchShareParticipantsOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFetchShareParticipantsOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    discoveredUserIdentities = v2->_discoveredUserIdentities;
    v2->_discoveredUserIdentities = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    lookupErrors = v2->_lookupErrors;
    v2->_lookupErrors = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (CKFetchShareParticipantsOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  v4 = userIdentityLookupInfos;
  v11 = (CKFetchShareParticipantsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_userIdentityLookupInfos;
    v11->_userIdentityLookupInfos = (NSArray *)v12;
  }
  return v11;
}

- (void)setShareParticipantFetchedBlock:(void *)shareParticipantFetchedBlock
{
  id v7 = shareParticipantFetchedBlock;
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
    v14[2] = sub_18B1A5368;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_shareParticipantFetchedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_shareParticipantFetchedBlock;
    self->_shareParticipantFetchedBlock = v11;
LABEL_9:
  }
}

- (void)shareParticipantFetchedBlock
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
    id v15 = sub_18AF14358;
    v16 = sub_18AF13A2C;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A5560;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_shareParticipantFetchedBlock);
  }

  return v8;
}

- (void)setPerShareParticipantCompletionBlock:(void *)perShareParticipantCompletionBlock
{
  id v7 = perShareParticipantCompletionBlock;
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
    v14[2] = sub_18B1A56EC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perShareParticipantCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perShareParticipantCompletionBlock;
    self->_perShareParticipantCompletionBlock = v11;
LABEL_9:
  }
}

- (void)perShareParticipantCompletionBlock
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
    id v15 = sub_18AF14358;
    v16 = sub_18AF13A2C;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A58E4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_perShareParticipantCompletionBlock);
  }

  return v8;
}

- (void)setFetchShareParticipantsCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B1A5A70;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchShareParticipantsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchShareParticipantsCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchShareParticipantsCompletionBlock = self->_fetchShareParticipantsCompletionBlock;
    self->_id fetchShareParticipantsCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchShareParticipantsCompletionBlock
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
    id v15 = sub_18AF14358;
    v16 = sub_18AF13A2C;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A5C68;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_fetchShareParticipantsCompletionBlock);
  }

  return v8;
}

- (void)setFetchShareParticipantsCompletionBlock:(void *)fetchShareParticipantsCompletionBlock
{
  BOOL v4 = fetchShareParticipantsCompletionBlock == 0;
  id v9 = fetchShareParticipantsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchShareParticipantsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_userIdentityLookupInfos(self, v5, v6, v7);
  objc_msgSend_setUserIdentityLookupInfos_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKFetchShareParticipantsOperation;
  [(CKOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKFetchShareParticipantsOperation;
  id v4 = a3;
  [(CKOperation *)&v11 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_userIdentityLookupInfos(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setUserIdentityLookupInfos_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKFetchShareParticipantsOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_shareParticipantFetchedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perShareParticipantCompletionBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v15 = objc_msgSend_fetchShareParticipantsCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, (uint64_t)a3, v3);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v10 = objc_msgSend_userIdentityLookupInfos(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v49, (uint64_t)v53, 16);
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v50;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v50 != v14) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v44, @"CKErrorDomain", 12, @"Unexpected identity fetch info passed to %@: %@", v43, v16);
LABEL_19:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_20:

        goto LABEL_21;
      }
      if (objc_msgSend_containsObject_(v6, v17, (uint64_t)v16, v18))
      {
        if (a3)
        {
          v43 = objc_msgSend_emailAddress(v16, v19, v20, v21);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKErrorDomain", 12, @"Email addresses must be unique. \"%@\" was used in two different CKUserIdentityLookupInfos", v43);
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      objc_msgSend_addObject_(v6, v19, (uint64_t)v16, v21);
    }
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v22, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v13) {
      continue;
    }
    break;
  }
LABEL_10:

  v26 = objc_msgSend_userIdentityLookupInfos(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_count(v26, v27, v28, v29);

  if (!v30) {
    goto LABEL_21;
  }
  v34 = objc_msgSend_fetchShareParticipantsCompletionBlock(self, v31, v32, v33);
  if (v34
    || (objc_msgSend_shareParticipantFetchedBlock(self, v35, v36, v37),
        (v34 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_14;
  }
  v47 = objc_msgSend_perShareParticipantCompletionBlock(self, v38, v39, v40);

  if (v47)
  {
LABEL_14:
    v48.receiver = self;
    v48.super_class = (Class)CKFetchShareParticipantsOperation;
    BOOL v41 = [(CKOperation *)&v48 CKOperationShouldRun:a3];
  }
  else
  {
LABEL_21:
    BOOL v41 = 0;
  }

  return v41;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareParticipantsOperation_withBlock_;
}

- (void)handleShareParticipantFetchForLookupInfo:(id)a3 shareParticipant:(id)a4 error:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v15 = signpost;

  if (v13)
  {
    if (v15)
    {
      if (self) {
        v19 = self->super._signpost;
      }
      else {
        v19 = 0;
      }
      uint64_t v20 = v19;
      uint64_t v24 = objc_msgSend_log(v20, v21, v22, v23);

      if (self) {
        uint64_t v25 = self->super._signpost;
      }
      else {
        uint64_t v25 = 0;
      }
      v26 = v25;
      uint64_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
        goto LABEL_21;
      }
      *(_DWORD *)v77 = 138412546;
      *(void *)&v77[4] = v8;
      *(_WORD *)&v77[12] = 2112;
      *(void *)&v77[14] = v13;
      v31 = "Share participant %@ fetched with error: %@";
      uint64_t v32 = v24;
      os_signpost_id_t v33 = v30;
      uint32_t v34 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchShareParticipantsOperation", v31, v77, v34);
LABEL_21:
    }
  }
  else if (v15)
  {
    if (self) {
      v35 = self->super._signpost;
    }
    else {
      v35 = 0;
    }
    uint64_t v36 = v35;
    uint64_t v24 = objc_msgSend_log(v36, v37, v38, v39);

    if (self) {
      uint64_t v40 = self->super._signpost;
    }
    else {
      uint64_t v40 = 0;
    }
    BOOL v41 = v40;
    uint64_t v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_21;
    }
    *(_DWORD *)v77 = 138412290;
    *(void *)&v77[4] = v8;
    v31 = "Share participant %@ fetched";
    uint64_t v32 = v24;
    os_signpost_id_t v33 = v45;
    uint32_t v34 = 12;
    goto LABEL_20;
  }
  if (v9)
  {
    v46 = objc_msgSend_userIdentity(v9, v16, v17, v18);
    long long v50 = objc_msgSend_lookupInfo(v46, v47, v48, v49);

    if (!v50)
    {
      long long v51 = objc_msgSend_userIdentity(v9, v16, v17, v18);
      objc_msgSend_setLookupInfo_(v51, v52, (uint64_t)v8, v53);
    }
  }
  if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18, *(_OWORD *)v77, *(void *)&v77[16], v78) & 1) == 0)
  {
    if (a5)
    {
      v57 = objc_msgSend_lookupErrors(self, v54, v55, v56);
      objc_msgSend_setObject_forKeyedSubscript_(v57, v58, (uint64_t)v13, (uint64_t)v8);
    }
    v59 = objc_msgSend_discoveredUserIdentities(self, v54, v55, v56);
    objc_msgSend_addObject_(v59, v60, (uint64_t)v8, v61);
  }
  v62 = objc_msgSend_perShareParticipantCompletionBlock_wrapper(self, v54, v55, v56);
  v66 = v62;
  if (v62)
  {
    v67 = (void (**)(void *, id, id, void *))_Block_copy(v62);
  }
  else
  {
    v68 = objc_msgSend_perShareParticipantCompletionBlock(self, v63, v64, v65);
    v67 = (void (**)(void *, id, id, void *))_Block_copy(v68);
  }
  if (v67)
  {
    v67[2](v67, v8, v9, v13);
  }
  else
  {
    v72 = objc_msgSend_shareParticipantFetchedBlock(self, v69, v70, v71);

    if (v9 && v72)
    {
      objc_msgSend_shareParticipantFetchedBlock(self, v73, v74, v75);
      v76 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v76)[2](v76, v9);
    }
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      v16 = self->super._signpost;
    }
    else {
      v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchShareParticipantsOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v23 = objc_msgSend_userIdentityLookupInfos(self, v7, v8, v9);
  v26 = objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23, v25);

  uint64_t v30 = objc_msgSend_discoveredUserIdentities(self, v27, v28, v29);
  objc_msgSend_minusSet_(v26, v31, (uint64_t)v30, v32);

  if (objc_msgSend_count(v26, v33, v34, v35))
  {
    id v83 = v4;
    uint64_t v39 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v36, @"CKErrorDomain", 11, @"Share participant not found in iCloud");
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v40 = v26;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v85, (uint64_t)v90, 16);
    if (v42)
    {
      uint64_t v46 = v42;
      uint64_t v47 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v86 != v47) {
            objc_enumerationMutation(v40);
          }
          uint64_t v49 = *(void *)(*((void *)&v85 + 1) + 8 * i);
          long long v50 = objc_msgSend_lookupErrors(self, v43, v44, v45);
          uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v50, v51, v49, v52);

          if (!v53)
          {
            uint64_t v54 = objc_msgSend_lookupErrors(self, v43, v44, v45);
            objc_msgSend_setObject_forKeyedSubscript_(v54, v55, (uint64_t)v39, v49);
          }
        }
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v85, (uint64_t)v90, 16);
      }
      while (v46);
    }

    id v4 = v83;
  }
  if (!v4)
  {
    uint64_t v56 = objc_msgSend_lookupErrors(self, v36, v37, v38);
    uint64_t v60 = objc_msgSend_count(v56, v57, v58, v59);

    if (v60)
    {
      uint64_t v61 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v36, v37, v38);
      uint64_t v65 = objc_msgSend_lookupErrors(self, v62, v63, v64);
      objc_msgSend_setObject_forKeyedSubscript_(v61, v66, (uint64_t)v65, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v67, @"CKInternalErrorDomain", 1011, v61, @"Failed to lookup some share participants");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  v68 = objc_msgSend_fetchShareParticipantsCompletionBlock_wrapper(self, v36, v37, v38);
  v72 = v68;
  if (v68)
  {
    v73 = (void (**)(void *, void *))_Block_copy(v68);
  }
  else
  {
    uint64_t v74 = objc_msgSend_fetchShareParticipantsCompletionBlock(self, v69, v70, v71);
    v73 = (void (**)(void *, void *))_Block_copy(v74);
  }
  if (v73)
  {
    uint64_t v78 = objc_msgSend_CKClientSuitableError(v4, v75, v76, v77);
    v73[2](v73, v78);

    objc_msgSend_setFetchShareParticipantsCompletionBlock_(self, v79, 0, v80);
  }
  objc_msgSend_setShareParticipantFetchedBlock_(self, v75, 0, v77);
  objc_msgSend_setPerShareParticipantCompletionBlock_(self, v81, 0, v82);
  v84.receiver = self;
  v84.super_class = (Class)CKFetchShareParticipantsOperation;
  [(CKOperation *)&v84 _finishOnCallbackQueueWithError:v4];
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
    BOOL v6 = v5;
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
      id v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareParticipantsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  BOOL v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareParticipantsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-user-identities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareParticipantFetchForLookupInfo_shareParticipant_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareParticipantsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
}

- (NSMutableSet)discoveredUserIdentities
{
  return self->_discoveredUserIdentities;
}

- (void)setDiscoveredUserIdentities:(id)a3
{
}

- (NSMutableDictionary)lookupErrors
{
  return self->_lookupErrors;
}

- (void)setLookupErrors:(id)a3
{
}

- (id)perShareParticipantCompletionBlock_wrapper
{
  return self->_perShareParticipantCompletionBlock_wrapper;
}

- (void)setPerShareParticipantCompletionBlock_wrapper:(id)a3
{
}

- (id)fetchShareParticipantsCompletionBlock_wrapper
{
  return self->_fetchShareParticipantsCompletionBlock_wrapper;
}

- (void)setFetchShareParticipantsCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShareParticipantsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareParticipantCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_lookupErrors, 0);
  objc_storeStrong((id *)&self->_discoveredUserIdentities, 0);
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong(&self->_fetchShareParticipantsCompletionBlock, 0);
  objc_storeStrong(&self->_perShareParticipantCompletionBlock, 0);

  objc_storeStrong(&self->_shareParticipantFetchedBlock, 0);
}

@end