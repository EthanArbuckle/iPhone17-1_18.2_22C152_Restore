@interface CKDiscoverAllUserIdentitiesOperation
+ (Class)operationInfoClass;
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKDiscoverAllUserIdentitiesOperation)init;
- (NSMutableDictionary)identityToContactIdentifiers;
- (id)activityCreate;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)discoverAllUserIdentitiesCompletionBlock;
- (void)handleUserIdentityDiscovery:(id)a3;
- (void)performCKOperation;
- (void)setDiscoverAllUserIdentitiesCompletionBlock:(void *)discoverAllUserIdentitiesCompletionBlock;
- (void)setIdentityToContactIdentifiers:(id)a3;
- (void)setUserIdentityDiscoveredBlock:(void *)userIdentityDiscoveredBlock;
- (void)userIdentityDiscoveredBlock;
@end

@implementation CKDiscoverAllUserIdentitiesOperation

- (CKDiscoverAllUserIdentitiesOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKDiscoverAllUserIdentitiesOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    identityToContactIdentifiers = v2->_identityToContactIdentifiers;
    v2->_identityToContactIdentifiers = (NSMutableDictionary *)v3;
  }
  return v2;
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
    v14[2] = sub_18B0710E4;
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
    id v15 = sub_18AF13C2C;
    v16 = sub_18AF13890;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0712DC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_userIdentityDiscoveredBlock);
  }

  return v8;
}

- (void)setDiscoverAllUserIdentitiesCompletionBlock:(void *)discoverAllUserIdentitiesCompletionBlock
{
  id v7 = discoverAllUserIdentitiesCompletionBlock;
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
    v14[2] = sub_18B071468;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_discoverAllUserIdentitiesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_discoverAllUserIdentitiesCompletionBlock;
    self->_discoverAllUserIdentitiesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)discoverAllUserIdentitiesCompletionBlock
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
    id v15 = sub_18AF13C2C;
    v16 = sub_18AF13890;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B071660;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_discoverAllUserIdentitiesCompletionBlock);
  }

  return v8;
}

+ (Class)operationInfoClass
{
  return (Class)objc_opt_class();
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v6 = objc_msgSend_discoverAllUserIdentitiesCompletionBlock(self, a2, (uint64_t)a3, v3);

  if (!v6) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CKDiscoverAllUserIdentitiesOperation;
  return [(CKOperation *)&v8 CKOperationShouldRun:a3];
}

+ (SEL)daemonInvocationSelector
{
  return sel_performDiscoverAllUserIdentitiesOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v6 = objc_msgSend_configuration(self, a2, v2, v3);
  int isLongLived = objc_msgSend_isLongLived(v6, v7, v8, v9);

  if (isLongLived)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
    uint64_t v15 = objc_opt_class();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v16, (uint64_t)a2, (uint64_t)self, @"CKDiscoverAllUserIdentitiesOperation.m", 64, @"%@ isn't allowed to be long lived.", v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)CKDiscoverAllUserIdentitiesOperation;
  [(CKOperation *)&v17 performCKOperation];
}

- (void)handleUserIdentityDiscovery:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      v16 = self->super._signpost;
    }
    else {
      v16 = 0;
    }
    objc_super v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(v64) = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKDiscoverAllUserIdentitiesOperation", "User identity discovered", (uint8_t *)&v64, 2u);
    }
  }
  v22 = objc_msgSend_identityToContactIdentifiers(self, v7, v8, v9);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v4, v24);

  v26 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v30 = objc_msgSend_contactIdentifiers(v4, v27, v28, v29);
  v33 = (void *)v30;
  if (v30) {
    objc_msgSend_setWithArray_(v26, v31, v30, v32);
  }
  else {
  v34 = objc_msgSend_setWithArray_(v26, v31, MEMORY[0x1E4F1CBF0], v32);
  }

  if (v25)
  {
    if (!v34 || (objc_msgSend_isSubsetOfSet_(v34, v35, (uint64_t)v25, v37) & 1) != 0)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v41 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        int v64 = 138412290;
        id v65 = v4;
        _os_log_debug_impl(&dword_18AF10000, v41, OS_LOG_TYPE_DEBUG, "Not returning user identity we already saw: %@", (uint8_t *)&v64, 0xCu);
      }
      goto LABEL_27;
    }
    v45 = objc_msgSend_mutableCopy(v34, v38, v39, v40);
    objc_msgSend_unionSet_(v45, v46, (uint64_t)v25, v47);
    v51 = objc_msgSend_allObjects(v45, v48, v49, v50);
    objc_msgSend_setContactIdentifiers_(v4, v52, (uint64_t)v51, v53);
  }
  else
  {
    v45 = objc_msgSend_mutableCopy(v34, v35, v36, v37);
  }
  v54 = objc_msgSend_identityToContactIdentifiers(self, v42, v43, v44);
  objc_msgSend_setObject_forKeyedSubscript_(v54, v55, (uint64_t)v45, (uint64_t)v4);

  v59 = objc_msgSend_userIdentityDiscoveredBlock(self, v56, v57, v58);

  if (v59)
  {
    objc_msgSend_userIdentityDiscoveredBlock(self, v60, v61, v62);
    v63 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v63)[2](v63, v4);
  }
LABEL_27:
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      v16 = self->super._signpost;
    }
    else {
      v16 = 0;
    }
    objc_super v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKDiscoverAllUserIdentitiesOperation", "Finishing", buf, 2u);
    }
  }
  v22 = objc_msgSend_discoverAllUserIdentitiesCompletionBlock(self, v7, v8, v9);

  if (v22)
  {
    objc_msgSend_discoverAllUserIdentitiesCompletionBlock(self, v23, v24, v25);
    v26 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_CKClientSuitableError(v4, v27, v28, v29);
    ((void (**)(void, void *))v26)[2](v26, v30);

    objc_msgSend_setDiscoverAllUserIdentitiesCompletionBlock_(self, v31, 0, v32);
  }
  objc_msgSend_setUserIdentityDiscoveredBlock_(self, v23, 0, v25);
  v33.receiver = self;
  v33.super_class = (Class)CKDiscoverAllUserIdentitiesOperation;
  [(CKOperation *)&v33 _finishOnCallbackQueueWithError:v4];
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
    uint64_t v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      v11 = self->super._signpost;
    }
    else {
      v11 = 0;
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
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      id v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKDiscoverAllUserIdentitiesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  uint64_t v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKDiscoverAllUserIdentitiesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/discover-all-identities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (NSMutableDictionary)identityToContactIdentifiers
{
  return self->_identityToContactIdentifiers;
}

- (void)setIdentityToContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityToContactIdentifiers, 0);
  objc_storeStrong(&self->_discoverAllUserIdentitiesCompletionBlock, 0);

  objc_storeStrong(&self->_userIdentityDiscoveredBlock, 0);
}

@end