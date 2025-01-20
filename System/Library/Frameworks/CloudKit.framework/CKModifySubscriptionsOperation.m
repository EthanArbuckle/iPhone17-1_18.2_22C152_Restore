@interface CKModifySubscriptionsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKModifySubscriptionsOperation)init;
- (CKModifySubscriptionsOperation)initWithSubscriptionsToSave:(NSArray *)subscriptionsToSave subscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete;
- (NSArray)subscriptionIDsToDelete;
- (NSArray)subscriptionsToSave;
- (id)activityCreate;
- (id)modifySubscriptionsCompletionBlock_wrapper;
- (id)perSubscriptionDeleteBlock_wrapper;
- (id)perSubscriptionSaveBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleSubscriptionDeleteForSubscriptionID:(id)a3 error:(id)a4;
- (void)handleSubscriptionSaveForSubscriptionID:(id)a3 error:(id)a4;
- (void)modifySubscriptionsCompletionBlock;
- (void)perSubscriptionDeleteBlock;
- (void)perSubscriptionSaveBlock;
- (void)setModifySubscriptionsCompletionBlock:(void *)modifySubscriptionsCompletionBlock;
- (void)setModifySubscriptionsCompletionBlockIVar:(id)a3;
- (void)setModifySubscriptionsCompletionBlock_wrapper:(id)a3;
- (void)setPerSubscriptionDeleteBlock:(void *)perSubscriptionDeleteBlock;
- (void)setPerSubscriptionDeleteBlock_wrapper:(id)a3;
- (void)setPerSubscriptionSaveBlock:(void *)perSubscriptionSaveBlock;
- (void)setPerSubscriptionSaveBlock_wrapper:(id)a3;
- (void)setSubscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete;
- (void)setSubscriptionsToSave:(NSArray *)subscriptionsToSave;
@end

@implementation CKModifySubscriptionsOperation

- (CKModifySubscriptionsOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKModifySubscriptionsOperation;
  v2 = [(CKOperation *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    subscriptionsBySubscriptionIDs = v2->_subscriptionsBySubscriptionIDs;
    v2->_subscriptionsBySubscriptionIDs = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    subscriptionErrors = v2->_subscriptionErrors;
    v2->_subscriptionErrors = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    savedSubscriptions = v2->_savedSubscriptions;
    v2->_savedSubscriptions = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    deletedSubscriptionIDs = v2->_deletedSubscriptionIDs;
    v2->_deletedSubscriptionIDs = (NSMutableArray *)v9;
  }
  return v2;
}

- (CKModifySubscriptionsOperation)initWithSubscriptionsToSave:(NSArray *)subscriptionsToSave subscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete
{
  v6 = subscriptionsToSave;
  uint64_t v7 = subscriptionIDsToDelete;
  v14 = (CKModifySubscriptionsOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v11, v12, v13);
    v16 = v14->_subscriptionsToSave;
    v14->_subscriptionsToSave = (NSArray *)v15;

    uint64_t v20 = objc_msgSend_copy(v7, v17, v18, v19);
    v21 = v14->_subscriptionIDsToDelete;
    v14->_subscriptionIDsToDelete = (NSArray *)v20;
  }
  return v14;
}

- (void)setPerSubscriptionSaveBlock:(void *)perSubscriptionSaveBlock
{
  id v7 = perSubscriptionSaveBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B12B8F0;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perSubscriptionSaveBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perSubscriptionSaveBlock;
    self->_perSubscriptionSaveBlock = v11;
LABEL_9:
  }
}

- (void)perSubscriptionSaveBlock
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
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF14048;
    v16 = sub_18AF13978;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12BAE8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perSubscriptionSaveBlock);
  }

  return v8;
}

- (void)setPerSubscriptionDeleteBlock:(void *)perSubscriptionDeleteBlock
{
  id v7 = perSubscriptionDeleteBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B12BC74;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perSubscriptionDeleteBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perSubscriptionDeleteBlock;
    self->_perSubscriptionDeleteBlock = v11;
LABEL_9:
  }
}

- (void)perSubscriptionDeleteBlock
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
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF14048;
    v16 = sub_18AF13978;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12BE6C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perSubscriptionDeleteBlock);
  }

  return v8;
}

- (void)setModifySubscriptionsCompletionBlockIVar:(id)a3
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
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B12BFF8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id modifySubscriptionsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_modifySubscriptionsCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id modifySubscriptionsCompletionBlock = self->_modifySubscriptionsCompletionBlock;
    self->_id modifySubscriptionsCompletionBlock = v11;
LABEL_9:
  }
}

- (void)modifySubscriptionsCompletionBlock
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
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF14048;
    v16 = sub_18AF13978;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B12C1F0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_modifySubscriptionsCompletionBlock);
  }

  return v8;
}

- (void)setModifySubscriptionsCompletionBlock:(void *)modifySubscriptionsCompletionBlock
{
  BOOL v4 = modifySubscriptionsCompletionBlock == 0;
  id v9 = modifySubscriptionsCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setModifySubscriptionsCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_subscriptionsToSave(self, v5, v6, v7);
  objc_msgSend_setSubscriptionsToSave_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_subscriptionIDsToDelete(self, v11, v12, v13);
  objc_msgSend_setSubscriptionIDsToDelete_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKModifySubscriptionsOperation;
  [(CKDatabaseOperation *)&v17 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKModifySubscriptionsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v17 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_subscriptionsToSave(v4, v5, v6, v7, v17.receiver, v17.super_class);
  objc_msgSend_setSubscriptionsToSave_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_subscriptionIDsToDelete(v4, v11, v12, v13);

  objc_msgSend_setSubscriptionIDsToDelete_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKModifySubscriptionsOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perSubscriptionSaveBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perSubscriptionDeleteBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v15 = objc_msgSend_modifySubscriptionsCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v8 = objc_msgSend_subscriptionsToSave(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v94, (uint64_t)v99, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v95;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v95 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v94 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v74 = (objc_class *)objc_opt_class();
            v75 = NSStringFromClass(v74);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, @"CKErrorDomain", 12, @"Unexpected subscription object passed to %@: %@", v75, v14);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_43;
        }
        if (self) {
          subscriptionsBySubscriptionIDs = self->_subscriptionsBySubscriptionIDs;
        }
        else {
          subscriptionsBySubscriptionIDs = 0;
        }
        uint64_t v16 = subscriptionsBySubscriptionIDs;
        uint64_t v20 = objc_msgSend_subscriptionID(v14, v17, v18, v19);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v21, (uint64_t)v14, (uint64_t)v20);

        v25 = objc_msgSend_subscriptionID(v14, v22, v23, v24);
        LODWORD(v20) = objc_msgSend_containsObject_(v4, v26, (uint64_t)v25, v27);

        if (v20)
        {
          if (!a3) {
            goto LABEL_43;
          }
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, @"CKErrorDomain", 12, @"You can't save the same subscription twice: %@", v14);
          BOOL v77 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v32 = objc_msgSend_zoneID(v14, v29, v30, v31);
          char v34 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v33, (uint64_t)v32, (uint64_t)a3);

          if ((v34 & 1) == 0) {
            goto LABEL_43;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v38 = objc_msgSend_zoneID(v14, v35, v36, v37);
            int v40 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v39, (uint64_t)v38, (uint64_t)a3);

            if (!v40) {
              goto LABEL_43;
            }
          }
        }
        v41 = objc_msgSend_subscriptionID(v14, v35, v36, v37);
        objc_msgSend_addObject_(v4, v42, (uint64_t)v41, v43);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v44, (uint64_t)&v94, (uint64_t)v99, 16);
      uint64_t v11 = v45;
    }
    while (v45);
  }

  uint64_t v8 = objc_opt_new();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v49 = objc_msgSend_subscriptionIDsToDelete(self, v46, v47, v48);
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v90, (uint64_t)v98, 16);
  if (!v51) {
    goto LABEL_29;
  }
  uint64_t v52 = v51;
  uint64_t v53 = *(void *)v91;
  while (2)
  {
    for (uint64_t i = 0; i != v52; ++i)
    {
      if (*(void *)v91 != v53) {
        objc_enumerationMutation(v49);
      }
      uint64_t v55 = *(void *)(*((void *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          v78 = (objc_class *)objc_opt_class();
          v79 = NSStringFromClass(v78);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v80, @"CKErrorDomain", 12, @"Unexpected subscription ID object passed to %@: %@", v79, v55);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_42;
      }
      if (objc_msgSend_containsObject_(v4, v56, v55, v57))
      {
        v81 = a3;
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v58, @"CKErrorDomain", 12, @"You can't save and delete a subscription in the same operation: %@", v55);
LABEL_41:
          id *v81 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_42:

        goto LABEL_43;
      }
      if (objc_msgSend_containsObject_(v8, v58, v55, v59))
      {
        v81 = a3;
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v60, @"CKErrorDomain", 12, @"You can't delete the same subscription twice: %@", v55);
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      objc_msgSend_addObject_(v8, v60, v55, v61);
    }
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v62, (uint64_t)&v90, (uint64_t)v98, 16);
    if (v52) {
      continue;
    }
    break;
  }
LABEL_29:

  v66 = objc_msgSend_subscriptionsToSave(self, v63, v64, v65);
  if (objc_msgSend_count(v66, v67, v68, v69))
  {

    v73 = a3;
    goto LABEL_46;
  }
  v83 = objc_msgSend_subscriptionIDsToDelete(self, v70, v71, v72);
  uint64_t v87 = objc_msgSend_count(v83, v84, v85, v86);

  v73 = a3;
  if (v87)
  {
LABEL_46:
    v89.receiver = self;
    v89.super_class = (Class)CKModifySubscriptionsOperation;
    BOOL v77 = [(CKDatabaseOperation *)&v89 CKOperationShouldRun:v73];
    goto LABEL_44;
  }
LABEL_43:
  BOOL v77 = 0;
LABEL_44:

  return v77;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performModifySubscriptionsOperation_withBlock_;
}

- (void)handleSubscriptionSaveForSubscriptionID:(id)a3 error:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (v10)
  {
    if (v12)
    {
      if (self) {
        uint64_t v16 = self->super.super._signpost;
      }
      else {
        uint64_t v16 = 0;
      }
      objc_super v17 = v16;
      v21 = objc_msgSend_log(v17, v18, v19, v20);

      if (self) {
        v22 = self->super.super._signpost;
      }
      else {
        v22 = 0;
      }
      uint64_t v23 = v22;
      os_signpost_id_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        int v54 = 138412546;
        id v55 = v6;
        __int16 v56 = 2112;
        uint64_t v57 = v10;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v21, OS_SIGNPOST_EVENT, v27, "CKModifySubscriptionsOperation", "Subscription %@ saved with error: %@", (uint8_t *)&v54, 0x16u);
      }
    }
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0)
    {
      if (self) {
        objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v28, (uint64_t)v10, (uint64_t)v6);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(0, v28, (uint64_t)v10, (uint64_t)v6);
      }
    }
    uint64_t v31 = 0;
  }
  else
  {
    if (v12)
    {
      if (self) {
        v32 = self->super.super._signpost;
      }
      else {
        v32 = 0;
      }
      v33 = v32;
      uint64_t v37 = objc_msgSend_log(v33, v34, v35, v36);

      if (self) {
        v38 = self->super.super._signpost;
      }
      else {
        v38 = 0;
      }
      v39 = v38;
      os_signpost_id_t v43 = objc_msgSend_identifier(v39, v40, v41, v42);

      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        int v54 = 138412290;
        id v55 = v6;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v37, OS_SIGNPOST_EVENT, v43, "CKModifySubscriptionsOperation", "Subscription %@ saved", (uint8_t *)&v54, 0xCu);
      }
    }
    if (self) {
      objc_msgSend_objectForKeyedSubscript_(self->_subscriptionsBySubscriptionIDs, v13, (uint64_t)v6, v15);
    }
    else {
    uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(0, v13, (uint64_t)v6, v15);
    }
    if ((objc_msgSend_canDropItemResultsEarly(self, v44, v45, v46) & 1) == 0)
    {
      if (self) {
        objc_msgSend_addObject_(self->_savedSubscriptions, v28, (uint64_t)v31, v30);
      }
      else {
        objc_msgSend_addObject_(0, v28, (uint64_t)v31, v30);
      }
    }
  }
  uint64_t v47 = objc_msgSend_perSubscriptionSaveBlock_wrapper(self, v28, v29, v30);
  uint64_t v51 = v47;
  if (v47)
  {
    uint64_t v52 = (void (**)(void *, id, void *, void *))_Block_copy(v47);
  }
  else
  {
    uint64_t v53 = objc_msgSend_perSubscriptionSaveBlock(self, v48, v49, v50);
    uint64_t v52 = (void (**)(void *, id, void *, void *))_Block_copy(v53);
  }
  if (v52) {
    v52[2](v52, v6, v31, v10);
  }
}

- (void)handleSubscriptionDeleteForSubscriptionID:(id)a3 error:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v12 = signpost;

  if (!v10)
  {
    if (!v12)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    if (self) {
      v32 = self->super.super._signpost;
    }
    else {
      v32 = 0;
    }
    v33 = v32;
    v21 = objc_msgSend_log(v33, v34, v35, v36);

    if (self) {
      uint64_t v37 = self->super.super._signpost;
    }
    else {
      uint64_t v37 = 0;
    }
    v38 = v37;
    uint64_t v42 = objc_msgSend_identifier(v38, v39, v40, v41);

    if ((unint64_t)(v42 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_21;
    }
    *(_DWORD *)__int16 v56 = 138412290;
    *(void *)&v56[4] = v6;
    v28 = "Subscription %@ deleted";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v42;
    uint32_t v31 = 12;
    goto LABEL_20;
  }
  if (!v12)
  {
    if ((objc_msgSend_canDropItemResultsEarly(self, v13, v14, v15) & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
  if (self) {
    uint64_t v16 = self->super.super._signpost;
  }
  else {
    uint64_t v16 = 0;
  }
  objc_super v17 = v16;
  v21 = objc_msgSend_log(v17, v18, v19, v20);

  if (self) {
    v22 = self->super.super._signpost;
  }
  else {
    v22 = 0;
  }
  uint64_t v23 = v22;
  uint64_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)__int16 v56 = 138412546;
    *(void *)&v56[4] = v6;
    *(_WORD *)&v56[12] = 2112;
    *(void *)&v56[14] = v10;
    v28 = "Subscription %@ deleted with error: %@";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v27;
    uint32_t v31 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v30, "CKModifySubscriptionsOperation", v28, v56, v31);
  }
LABEL_21:

  if ((objc_msgSend_canDropItemResultsEarly(self, v43, v44, v45) & 1) == 0)
  {
    if (!v10)
    {
LABEL_28:
      if (self) {
        objc_msgSend_addObject_(self->_deletedSubscriptionIDs, v46, (uint64_t)v6, v48, *(void *)v56, *(_OWORD *)&v56[8], v57);
      }
      else {
        objc_msgSend_addObject_(0, v46, (uint64_t)v6, v48, *(void *)v56, *(_OWORD *)&v56[8], v57);
      }
      goto LABEL_30;
    }
LABEL_25:
    if (self) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_subscriptionErrors, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v56, *(void *)&v56[16], v57);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(0, v46, (uint64_t)v10, (uint64_t)v6, *(_OWORD *)v56, *(void *)&v56[16], v57);
    }
  }
LABEL_30:
  uint64_t v49 = objc_msgSend_perSubscriptionDeleteBlock_wrapper(self, v46, v47, v48, *(void *)v56, *(void *)&v56[8]);
  uint64_t v53 = v49;
  if (v49)
  {
    int v54 = (void (**)(void *, id, void *))_Block_copy(v49);
  }
  else
  {
    id v55 = objc_msgSend_perSubscriptionDeleteBlock(self, v50, v51, v52);
    int v54 = (void (**)(void *, id, void *))_Block_copy(v55);
  }
  if (v54) {
    v54[2](v54, v6, v10);
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
  id v6 = signpost;

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
    objc_super v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKModifySubscriptionsOperation", "Finishing", buf, 2u);
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
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 1011, v25, @"Failed to modify some subscriptions");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v27 = objc_msgSend_modifySubscriptionsCompletionBlock_wrapper(self, v7, v8, v9);
  uint32_t v31 = v27;
  if (v27)
  {
    v32 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v27);
  }
  else
  {
    v33 = objc_msgSend_modifySubscriptionsCompletionBlock(self, v28, v29, v30);
    v32 = (void (**)(void *, NSMutableArray *, id, void *))_Block_copy(v33);
  }
  if (v32)
  {
    if (self)
    {
      uint64_t v36 = self->_savedSubscriptions;
      deletedSubscriptionIDs = self->_deletedSubscriptionIDs;
    }
    else
    {
      uint64_t v36 = 0;
      deletedSubscriptionIDs = 0;
    }
    v38 = deletedSubscriptionIDs;
    uint64_t v42 = objc_msgSend_CKClientSuitableError(v4, v39, v40, v41);
    v32[2](v32, v36, v38, v42);

    objc_msgSend_setModifySubscriptionsCompletionBlock_(self, v43, 0, v44);
  }
  objc_msgSend_setPerSubscriptionSaveBlock_(self, v34, 0, v35);
  objc_msgSend_setPerSubscriptionDeleteBlock_(self, v45, 0, v46);
  v47.receiver = self;
  v47.super_class = (Class)CKModifySubscriptionsOperation;
  [(CKOperation *)&v47 _finishOnCallbackQueueWithError:v4];
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
    id v6 = v5;
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
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      id v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKModifySubscriptionsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  id v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKModifySubscriptionsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/modify-subscriptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleSubscriptionSaveForSubscriptionID_error_, 1, 0);

  uint64_t v7 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v8, (uint64_t)v7, (uint64_t)sel_handleSubscriptionDeleteForSubscriptionID_error_, 1, 0);

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKModifySubscriptionsOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(NSArray *)subscriptionsToSave
{
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(NSArray *)subscriptionIDsToDelete
{
}

- (id)perSubscriptionSaveBlock_wrapper
{
  return self->_perSubscriptionSaveBlock_wrapper;
}

- (void)setPerSubscriptionSaveBlock_wrapper:(id)a3
{
}

- (id)perSubscriptionDeleteBlock_wrapper
{
  return self->_perSubscriptionDeleteBlock_wrapper;
}

- (void)setPerSubscriptionDeleteBlock_wrapper:(id)a3
{
}

- (id)modifySubscriptionsCompletionBlock_wrapper
{
  return self->_modifySubscriptionsCompletionBlock_wrapper;
}

- (void)setModifySubscriptionsCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionDeleteBlock_wrapper, 0);
  objc_storeStrong(&self->_perSubscriptionSaveBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_subscriptionErrors, 0);
  objc_storeStrong((id *)&self->_subscriptionsBySubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_savedSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock, 0);
  objc_storeStrong(&self->_perSubscriptionDeleteBlock, 0);

  objc_storeStrong(&self->_perSubscriptionSaveBlock, 0);
}

@end