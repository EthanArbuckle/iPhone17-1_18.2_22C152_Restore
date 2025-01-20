@interface CKFetchSubscriptionsOperation
+ (CKFetchSubscriptionsOperation)fetchAllSubscriptionsOperation;
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)isFetchAllSubscriptionsOperation;
- (CKFetchSubscriptionsOperation)init;
- (CKFetchSubscriptionsOperation)initWithSubscriptionIDs:(NSArray *)subscriptionIDs;
- (NSArray)subscriptionIDs;
- (id)activityCreate;
- (id)fetchSubscriptionCompletionBlock_wrapper;
- (id)perSubscriptionCompletionBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchSubscriptionCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleSubscriptionFetchForSubscriptionID:(id)a3 subscription:(id)a4 error:(id)a5;
- (void)perSubscriptionCompletionBlock;
- (void)setFetchSubscriptionCompletionBlock:(void *)fetchSubscriptionCompletionBlock;
- (void)setFetchSubscriptionCompletionBlockIVar:(id)a3;
- (void)setFetchSubscriptionCompletionBlock_wrapper:(id)a3;
- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3;
- (void)setPerSubscriptionCompletionBlock:(void *)perSubscriptionCompletionBlock;
- (void)setPerSubscriptionCompletionBlock_wrapper:(id)a3;
- (void)setSubscriptionIDs:(NSArray *)subscriptionIDs;
@end

@implementation CKFetchSubscriptionsOperation

- (CKFetchSubscriptionsOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFetchSubscriptionsOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    subscriptionsBySubscriptionID = v2->_subscriptionsBySubscriptionID;
    v2->_subscriptionsBySubscriptionID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    subscriptionErrors = v2->_subscriptionErrors;
    v2->_subscriptionErrors = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)setPerSubscriptionCompletionBlock:(void *)perSubscriptionCompletionBlock
{
  id v7 = perSubscriptionCompletionBlock;
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
    v14[2] = sub_18B1517B4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perSubscriptionCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perSubscriptionCompletionBlock;
    self->_perSubscriptionCompletionBlock = v11;
LABEL_9:
  }
}

- (void)perSubscriptionCompletionBlock
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
    id v15 = sub_18AF14170;
    v16 = sub_18AF139B8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1519AC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_perSubscriptionCompletionBlock);
  }

  return v8;
}

- (void)setFetchSubscriptionCompletionBlockIVar:(id)a3
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
    v14[2] = sub_18B151B38;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchSubscriptionCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchSubscriptionCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchSubscriptionCompletionBlock = self->_fetchSubscriptionCompletionBlock;
    self->_id fetchSubscriptionCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchSubscriptionCompletionBlock
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
    id v15 = sub_18AF14170;
    v16 = sub_18AF139B8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B151D30;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_fetchSubscriptionCompletionBlock);
  }

  return v8;
}

- (void)setFetchSubscriptionCompletionBlock:(void *)fetchSubscriptionCompletionBlock
{
  BOOL v4 = fetchSubscriptionCompletionBlock == 0;
  id v9 = fetchSubscriptionCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchSubscriptionCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

+ (CKFetchSubscriptionsOperation)fetchAllSubscriptionsOperation
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(v2, v3, 1, v4);

  return (CKFetchSubscriptionsOperation *)v2;
}

- (CKFetchSubscriptionsOperation)initWithSubscriptionIDs:(NSArray *)subscriptionIDs
{
  uint64_t v4 = subscriptionIDs;
  v11 = (CKFetchSubscriptionsOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_subscriptionIDs;
    v11->_subscriptionIDs = (NSArray *)v12;
  }
  return v11;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_subscriptionIDs(self, v5, v6, v7);
  objc_msgSend_setSubscriptionIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v11, v12, v13);
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(v4, v15, AllSubscriptionsOperation, v16);
  v17.receiver = self;
  v17.super_class = (Class)CKFetchSubscriptionsOperation;
  [(CKDatabaseOperation *)&v17 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKFetchSubscriptionsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v17 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_subscriptionIDs(v4, v5, v6, v7, v17.receiver, v17.super_class);
  objc_msgSend_setSubscriptionIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(v4, v11, v12, v13);
  objc_msgSend_setIsFetchAllSubscriptionsOperation_(self, v15, AllSubscriptionsOperation, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchSubscriptionsOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perSubscriptionCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    v11 = objc_msgSend_fetchSubscriptionCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_subscriptionIDs(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
  }
  else if ((objc_msgSend_isFetchAllSubscriptionsOperation(self, v7, v8, v9) & 1) == 0)
  {
    if (a3)
    {
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, @"CKErrorDomain", 12, @"property subscriptionIDs must not be be nil for %@", v41);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  objc_super v13 = objc_msgSend_subscriptionIDs(self, v10, v11, v12);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v46;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v38, @"CKErrorDomain", 12, @"Unexpected subscriptionID passed to %@: %@", v37, v19);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          return 0;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v20, (uint64_t)&v45, (uint64_t)v49, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }

  if ((objc_msgSend_isFetchAllSubscriptionsOperation(self, v21, v22, v23) & 1) == 0)
  {
    v27 = objc_msgSend_subscriptionIDs(self, v24, v25, v26);
    uint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

    if (!v31) {
      return 0;
    }
  }
  v32 = objc_msgSend_fetchSubscriptionCompletionBlock(self, v24, v25, v26);
  if (!v32)
  {
    v43 = objc_msgSend_perSubscriptionCompletionBlock(self, v33, v34, v35);

    if (v43) {
      goto LABEL_23;
    }
    return 0;
  }

LABEL_23:
  v44.receiver = self;
  v44.super_class = (Class)CKFetchSubscriptionsOperation;
  return [(CKDatabaseOperation *)&v44 CKOperationShouldRun:a3];
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchSubscriptionsOperation_withBlock_;
}

- (void)handleSubscriptionFetchForSubscriptionID:(id)a3 subscription:(id)a4 error:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_super v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v15 = signpost;

  if (!v13)
  {
    if (!v15)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18) & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_29;
    }
    if (self) {
      uint64_t v35 = self->super.super._signpost;
    }
    else {
      uint64_t v35 = 0;
    }
    v36 = v35;
    v24 = objc_msgSend_log(v36, v37, v38, v39);

    if (self) {
      v40 = self->super.super._signpost;
    }
    else {
      v40 = 0;
    }
    v41 = v40;
    uint64_t v45 = objc_msgSend_identifier(v41, v42, v43, v44);

    if ((unint64_t)(v45 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_21;
    }
    *(_DWORD *)v59 = 138412290;
    *(void *)&v59[4] = v8;
    uint64_t v31 = "Subscription %@ fetched";
    v32 = v24;
    os_signpost_id_t v33 = v45;
    uint32_t v34 = 12;
    goto LABEL_20;
  }
  if (!v15)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v16, v17, v18) & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  if (self) {
    uint64_t v19 = self->super.super._signpost;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = v19;
  v24 = objc_msgSend_log(v20, v21, v22, v23);

  if (self) {
    uint64_t v25 = self->super.super._signpost;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v25;
  uint64_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

  if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)v59 = 138412546;
    *(void *)&v59[4] = v8;
    *(_WORD *)&v59[12] = 2112;
    *(void *)&v59[14] = v13;
    uint64_t v31 = "Subscription %@ fetched with error: %@";
    v32 = v24;
    os_signpost_id_t v33 = v30;
    uint32_t v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v32, OS_SIGNPOST_EVENT, v33, "CKFetchSubscriptionsOperation", v31, v59, v34);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v46, v47, v48) & 1) == 0)
  {
    if (!v13)
    {
LABEL_27:
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionsBySubscriptionID, v49, (uint64_t)v9, (uint64_t)v8, *(void *)v59, *(void *)&v59[8]);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(0, v49, (uint64_t)v9, (uint64_t)v8, *(void *)v59, *(void *)&v59[8]);
      }
      goto LABEL_29;
    }
LABEL_25:
    if (self) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v49, (uint64_t)v13, (uint64_t)v8, *(_OWORD *)v59, *(void *)&v59[16], v60);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(0, v49, (uint64_t)v13, (uint64_t)v8, *(_OWORD *)v59, *(void *)&v59[16], v60);
    }
    goto LABEL_27;
  }
LABEL_29:
  v52 = objc_msgSend_perSubscriptionCompletionBlock_wrapper(self, v49, v50, v51, *(void *)v59, *(void *)&v59[8]);
  v56 = v52;
  if (v52)
  {
    v57 = (void (**)(void *, id, id, void *))_Block_copy(v52);
  }
  else
  {
    v58 = objc_msgSend_perSubscriptionCompletionBlock(self, v53, v54, v55);
    v57 = (void (**)(void *, id, id, void *))_Block_copy(v58);
  }
  if (v57) {
    v57[2](v57, v8, v9, v13);
  }
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
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchSubscriptionsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    if (self) {
      uint64_t v22 = objc_msgSend_count(self->_subscriptionErrors, v7, v8, v9);
    }
    else {
      uint64_t v22 = objc_msgSend_count(0, v7, v8, v9);
    }
    if (v22)
    {
      uint64_t v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v25 = v23;
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_subscriptionErrors, @"CKPartialErrors");
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, @"CKPartialErrors");
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 1011, v25, @"Failed to fetch some subscriptions");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  v27 = objc_msgSend_fetchSubscriptionCompletionBlock_wrapper(self, v7, v8, v9);
  uint64_t v31 = v27;
  if (v27)
  {
    v32 = (void (**)(void *, id, void *))_Block_copy(v27);
  }
  else
  {
    os_signpost_id_t v33 = objc_msgSend_fetchSubscriptionCompletionBlock(self, v28, v29, v30);
    v32 = (void (**)(void *, id, void *))_Block_copy(v33);
  }
  if (v32)
  {
    if (self) {
      subscriptionsBySubscriptionID = self->_subscriptionsBySubscriptionID;
    }
    else {
      subscriptionsBySubscriptionID = 0;
    }
    v37 = subscriptionsBySubscriptionID;
    v41 = objc_msgSend_CKClientSuitableError(v4, v38, v39, v40);
    v32[2](v32, v37, v41);

    objc_msgSend_setFetchSubscriptionCompletionBlock_(self, v42, 0, v43);
  }
  objc_msgSend_setPerSubscriptionCompletionBlock_(self, v34, 0, v35);
  v44.receiver = self;
  v44.super_class = (Class)CKFetchSubscriptionsOperation;
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
      v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchSubscriptionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchSubscriptionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-subscriptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleSubscriptionFetchForSubscriptionID_subscription_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchSubscriptionsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(NSArray *)subscriptionIDs
{
}

- (id)perSubscriptionCompletionBlock_wrapper
{
  return self->_perSubscriptionCompletionBlock_wrapper;
}

- (void)setPerSubscriptionCompletionBlock_wrapper:(id)a3
{
}

- (id)fetchSubscriptionCompletionBlock_wrapper
{
  return self->_fetchSubscriptionCompletionBlock_wrapper;
}

- (void)setFetchSubscriptionCompletionBlock_wrapper:(id)a3
{
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchuint64_t AllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionErrors, 0);
  objc_storeStrong((id *)&self->_subscriptionsBySubscriptionID, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong(&self->_fetchSubscriptionCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_fetchSubscriptionCompletionBlock, 0);

  objc_storeStrong(&self->_perSubscriptionCompletionBlock, 0);
}

@end