@interface CKDiscoverUserIdentitiesOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKDiscoverUserIdentitiesOperation)init;
- (CKDiscoverUserIdentitiesOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos;
- (NSArray)userIdentityLookupInfos;
- (NSMutableSet)discoveredLookupInfos;
- (id)activityCreate;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)discoverUserIdentitiesCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleUserIdentityDiscoveryForLookupInfo:(id)a3 userIdentity:(id)a4;
- (void)setDiscoverUserIdentitiesCompletionBlock:(void *)discoverUserIdentitiesCompletionBlock;
- (void)setDiscoveredLookupInfos:(id)a3;
- (void)setUserIdentityDiscoveredBlock:(void *)userIdentityDiscoveredBlock;
- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos;
- (void)userIdentityDiscoveredBlock;
@end

@implementation CKDiscoverUserIdentitiesOperation

- (CKDiscoverUserIdentitiesOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    userIdentityLookupInfos = v2->_userIdentityLookupInfos;
    v2->_userIdentityLookupInfos = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    discoveredLookupInfos = v2->_discoveredLookupInfos;
    v2->_discoveredLookupInfos = (NSMutableSet *)v5;
  }
  return v2;
}

- (CKDiscoverUserIdentitiesOperation)initWithUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
  v4 = userIdentityLookupInfos;
  v11 = (CKDiscoverUserIdentitiesOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_userIdentityLookupInfos;
    v11->_userIdentityLookupInfos = (NSArray *)v12;
  }
  return v11;
}

- (void)setUserIdentityDiscoveredBlock:(void *)userIdentityDiscoveredBlock
{
  id v7 = userIdentityDiscoveredBlock;
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
    v14[2] = sub_18B1B1198;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_userIdentityDiscoveredBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_userIdentityDiscoveredBlock;
    self->_userIdentityDiscoveredBlock = v11;
LABEL_9:
  }
}

- (void)userIdentityDiscoveredBlock
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
    id v15 = sub_18AF143DC;
    v16 = sub_18AF13A44;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1B1390;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_userIdentityDiscoveredBlock);
  }

  return v8;
}

- (void)setDiscoverUserIdentitiesCompletionBlock:(void *)discoverUserIdentitiesCompletionBlock
{
  id v7 = discoverUserIdentitiesCompletionBlock;
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
    v14[2] = sub_18B1B151C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_discoverUserIdentitiesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_discoverUserIdentitiesCompletionBlock;
    self->_discoverUserIdentitiesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)discoverUserIdentitiesCompletionBlock
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
    id v15 = sub_18AF143DC;
    v16 = sub_18AF13A44;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1B1714;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    objc_super v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_super v8 = _Block_copy(self->_discoverUserIdentitiesCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  objc_super v8 = objc_msgSend_userIdentityLookupInfos(self, v5, v6, v7);
  objc_msgSend_setUserIdentityLookupInfos_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  [(CKOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  id v4 = a3;
  [(CKOperation *)&v11 fillFromOperationInfo:v4];
  objc_super v8 = objc_msgSend_userIdentityLookupInfos(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setUserIdentityLookupInfos_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = objc_msgSend_userIdentityLookupInfos(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a3)
          {
            v27 = (objc_class *)objc_opt_class();
            v28 = NSStringFromClass(v27);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, @"CKErrorDomain", 12, @"Unexpected user identity lookup info passed to %@: %@", v28, v12);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_15;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v17 = objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v14, v15, v16);
  if (v17)
  {
    v21 = (void *)v17;
    v22 = objc_msgSend_userIdentityLookupInfos(self, v18, v19, v20);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      v31.receiver = self;
      v31.super_class = (Class)CKDiscoverUserIdentitiesOperation;
      LOBYTE(v17) = [(CKOperation *)&v31 CKOperationShouldRun:a3];
    }
    else
    {
LABEL_15:
      LOBYTE(v17) = 0;
    }
  }
  return v17;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDiscoverUserIdentitiesOperation_withBlock_;
}

- (void)handleUserIdentityDiscoveryForLookupInfo:(id)a3 userIdentity:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v9 = signpost;

  if (v9)
  {
    if (self) {
      v13 = self->super._signpost;
    }
    else {
      v13 = 0;
    }
    uint64_t v14 = v13;
    v18 = objc_msgSend_log(v14, v15, v16, v17);

    if (self) {
      uint64_t v19 = self->super._signpost;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = v19;
    os_signpost_id_t v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v36 = 138412290;
      id v37 = v6;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v18, OS_SIGNPOST_EVENT, v24, "CKDiscoverUserIdentitiesOperation", "User identity discovered for %@", (uint8_t *)&v36, 0xCu);
    }
  }
  uint64_t v25 = objc_msgSend_discoveredLookupInfos(self, v10, v11, v12);
  objc_msgSend_addObject_(v25, v26, (uint64_t)v6, v27);

  objc_super v31 = objc_msgSend_userIdentityDiscoveredBlock(self, v28, v29, v30);

  if (v31)
  {
    objc_msgSend_userIdentityDiscoveredBlock(self, v32, v33, v34);
    long long v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v35)[2](v35, v7, v6);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
      id v7 = self->super._signpost;
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      v13 = self->super._signpost;
    }
    else {
      v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_EVENT, v18, "CKDiscoverUserIdentitiesOperation", "Finishing", buf, 2u);
    }
  }
  if ((CKCurrentProcessLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24() & 1) == 0)
  {
    uint64_t v22 = objc_msgSend_userIdentityDiscoveredBlock(self, v19, v20, v21);

    if (v22)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v23 = objc_msgSend_userIdentityLookupInfos(self, v19, v20, v21);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v50, (uint64_t)v55, 16);
      if (v25)
      {
        uint64_t v29 = v25;
        uint64_t v30 = *(void *)v51;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v51 != v30) {
              objc_enumerationMutation(v23);
            }
            uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * v31);
            uint64_t v33 = objc_msgSend_discoveredLookupInfos(self, v26, v27, v28);
            char v36 = objc_msgSend_containsObject_(v33, v34, v32, v35);

            if ((v36 & 1) == 0)
            {
              objc_msgSend_userIdentityDiscoveredBlock(self, v26, v27, v28);
              id v37 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
              v37[2](v37, 0, v32);
            }
            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v50, (uint64_t)v55, 16);
        }
        while (v29);
      }
    }
  }
  uint64_t v38 = objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v19, v20, v21);

  if (v38)
  {
    objc_msgSend_discoverUserIdentitiesCompletionBlock(self, v39, v40, v41);
    v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_CKClientSuitableError(v4, v43, v44, v45);
    ((void (**)(void, void *))v42)[2](v42, v46);

    objc_msgSend_setDiscoverUserIdentitiesCompletionBlock_(self, v47, 0, v48);
  }
  objc_msgSend_setUserIdentityDiscoveredBlock_(self, v39, 0, v41);
  v49.receiver = self;
  v49.super_class = (Class)CKDiscoverUserIdentitiesOperation;
  [(CKOperation *)&v49 _finishOnCallbackQueueWithError:v4];
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
      os_signpost_id_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      char v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      long long v53 = CKStringForQOS(v49, v50, v51, v52);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDiscoverUserIdentitiesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      id v7 = self->super._signpost;
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      v13 = self->super._signpost;
    }
    else {
      v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDiscoverUserIdentitiesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/discover-user-identities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(NSArray *)userIdentityLookupInfos
{
}

- (NSMutableSet)discoveredLookupInfos
{
  return self->_discoveredLookupInfos;
}

- (void)setDiscoveredLookupInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredLookupInfos, 0);
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong(&self->_discoverUserIdentitiesCompletionBlock, 0);

  objc_storeStrong(&self->_userIdentityDiscoveredBlock, 0);
}

@end