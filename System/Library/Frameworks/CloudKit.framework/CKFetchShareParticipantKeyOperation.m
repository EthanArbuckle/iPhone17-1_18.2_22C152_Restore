@interface CKFetchShareParticipantKeyOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKFetchShareParticipantKeyOperation)initWithShareIDs:(id)a3;
- (NSArray)shareIDs;
- (NSDictionary)baseTokensByShareID;
- (NSDictionary)childRecordIDsByShareID;
- (NSMutableDictionary)errorsByShareID;
- (id)activityCreate;
- (id)shareParticipantKeyCompletionBlock;
- (id)shareParticipantKeyFetchedBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleParticipantKeyFetchForRecordID:(id)a3 participantKey:(id)a4 error:(id)a5;
- (void)setBaseTokensByShareID:(id)a3;
- (void)setChildRecordIDsByShareID:(id)a3;
- (void)setErrorsByShareID:(id)a3;
- (void)setShareIDs:(id)a3;
- (void)setShareParticipantKeyCompletionBlock:(id)a3;
- (void)setShareParticipantKeyFetchedBlock:(id)a3;
@end

@implementation CKFetchShareParticipantKeyOperation

- (CKFetchShareParticipantKeyOperation)initWithShareIDs:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKFetchShareParticipantKeyOperation;
  v8 = [(CKOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    shareIDs = v8->_shareIDs;
    v8->_shareIDs = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    errorsByShareID = v8->_errorsByShareID;
    v8->_errorsByShareID = (NSMutableDictionary *)v11;
  }
  return v8;
}

- (void)setShareParticipantKeyFetchedBlock:(id)a3
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
    v14[2] = sub_18B118288;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id shareParticipantKeyFetchedBlock = v15;
    goto LABEL_9;
  }
  if (self->_shareParticipantKeyFetchedBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id shareParticipantKeyFetchedBlock = self->_shareParticipantKeyFetchedBlock;
    self->_id shareParticipantKeyFetchedBlock = v11;
LABEL_9:
  }
}

- (id)shareParticipantKeyFetchedBlock
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
    id v15 = sub_18AF1400C;
    v16 = sub_18AF13968;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B118480;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_shareParticipantKeyFetchedBlock);
  }

  return v8;
}

- (void)setShareParticipantKeyCompletionBlock:(id)a3
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
    v14[2] = sub_18B11860C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id shareParticipantKeyCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_shareParticipantKeyCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id shareParticipantKeyCompletionBlock = self->_shareParticipantKeyCompletionBlock;
    self->_id shareParticipantKeyCompletionBlock = v11;
LABEL_9:
  }
}

- (id)shareParticipantKeyCompletionBlock
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
    id v15 = sub_18AF1400C;
    v16 = sub_18AF13968;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B118804;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_shareParticipantKeyCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_shareIDs(self, v5, v6, v7);
  objc_msgSend_setShareIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_baseTokensByShareID(self, v11, v12, v13);
  objc_msgSend_setBaseTokensByShareID_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_childRecordIDsByShareID(self, v17, v18, v19);
  objc_msgSend_setChildRecordIDsByShareID_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKFetchShareParticipantKeyOperation;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKFetchShareParticipantKeyOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v23 fillFromOperationInfo:v4];
  v8 = objc_msgSend_shareIDs(v4, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setShareIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_baseTokensByShareID(v4, v11, v12, v13);
  objc_msgSend_setBaseTokensByShareID_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_childRecordIDsByShareID(v4, v17, v18, v19);

  objc_msgSend_setChildRecordIDsByShareID_(self, v21, (uint64_t)v20, v22);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchShareParticipantKeyOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_shareParticipantKeyFetchedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_shareParticipantKeyCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_shareIDs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = objc_msgSend_shareIDs(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v32;
      while (2)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v14);
          }
          objc_super v23 = objc_msgSend_zoneID(*(void **)(*((void *)&v31 + 1) + 8 * v22), v17, v18, v19);
          int v25 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v24, (uint64_t)v23, (uint64_t)a3);

          if (!v25)
          {

            return 0;
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }

    v30.receiver = self;
    v30.super_class = (Class)CKFetchShareParticipantKeyOperation;
    return [(CKDatabaseOperation *)&v30 CKOperationShouldRun:a3];
  }
  else
  {
    if (a3)
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v29, @"CKErrorDomain", 12, @"No share IDs were passed to %@", v28);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareParticipantKeyOperation_withBlock_;
}

- (void)handleParticipantKeyFetchForRecordID:(id)a3 participantKey:(id)a4 error:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  if (self) {
    signpost = self->super.super._signpost;
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
        uint64_t v19 = self->super.super._signpost;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v20 = v19;
      v24 = objc_msgSend_log(v20, v21, v22, v23);

      if (self) {
        int v25 = self->super.super._signpost;
      }
      else {
        int v25 = 0;
      }
      v26 = v25;
      os_signpost_id_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        int v49 = 138412546;
        id v50 = v8;
        __int16 v51 = 2112;
        v52 = v13;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v24, OS_SIGNPOST_EVENT, v30, "CKFetchShareParticipantKeyOperation", "Share %@ fetched participant key with error: %@", (uint8_t *)&v49, 0x16u);
      }
    }
    long long v31 = objc_msgSend_errorsByShareID(self, v16, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v13, (uint64_t)v8);
LABEL_14:

    goto LABEL_15;
  }
  if (v15)
  {
    if (self) {
      v38 = self->super.super._signpost;
    }
    else {
      v38 = 0;
    }
    v39 = v38;
    long long v31 = objc_msgSend_log(v39, v40, v41, v42);

    if (self) {
      v43 = self->super.super._signpost;
    }
    else {
      v43 = 0;
    }
    v44 = v43;
    os_signpost_id_t v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      int v49 = 138412290;
      id v50 = v8;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v31, OS_SIGNPOST_EVENT, v48, "CKFetchShareParticipantKeyOperation", "Share %@ fetched participant key", (uint8_t *)&v49, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  long long v33 = objc_msgSend_shareParticipantKeyFetchedBlock(self, v16, v17, v18);

  if (v33)
  {
    objc_msgSend_shareParticipantKeyFetchedBlock(self, v34, v35, v36);
    v37 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, void *))v37)[2](v37, v8, v9, v13);
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
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
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
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_EVENT, v18, "CKFetchShareParticipantKeyOperation", "Finishing", buf, 2u);
    }
  }
  id v22 = v4;
  uint64_t v23 = v22;
  if (!v22)
  {
    v24 = objc_msgSend_errorsByShareID(self, v19, v20, v21);
    uint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);

    if (v28)
    {
      uint64_t v29 = objc_msgSend_userInfo(0, v19, v20, v21);
      long long v33 = objc_msgSend_mutableCopy(v29, v30, v31, v32);
      v37 = v33;
      if (v33)
      {
        id v38 = v33;
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v34, v35, v36);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      v39 = v38;

      v43 = objc_msgSend_errorsByShareID(self, v40, v41, v42);
      objc_msgSend_setObject_forKeyedSubscript_(v39, v44, (uint64_t)v43, @"CKPartialErrors");

      uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v45, @"CKInternalErrorDomain", 1011, v39, @"Failed to fetch some share participant keys");
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  uint64_t v46 = objc_msgSend_shareParticipantKeyCompletionBlock(self, v19, v20, v21);

  if (v46)
  {
    objc_msgSend_shareParticipantKeyCompletionBlock(self, v47, v48, v49);
    id v50 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_CKClientSuitableError(v23, v51, v52, v53);
    ((void (**)(void, void *))v50)[2](v50, v54);

    objc_msgSend_setShareParticipantKeyCompletionBlock_(self, v55, 0, v56);
  }
  objc_msgSend_setShareParticipantKeyFetchedBlock_(self, v47, 0, v49);
  v57.receiver = self;
  v57.super_class = (Class)CKFetchShareParticipantKeyOperation;
  [(CKOperation *)&v57 _finishOnCallbackQueueWithError:v23];
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
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      objc_super v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareParticipantKeyOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareParticipantKeyOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-share-participant-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleParticipantKeyFetchForRecordID_participantKey_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareParticipantKeyOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
}

- (NSArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
}

- (NSMutableDictionary)errorsByShareID
{
  return self->_errorsByShareID;
}

- (void)setErrorsByShareID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByShareID, 0);
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);
  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
  objc_storeStrong(&self->_shareParticipantKeyCompletionBlock, 0);

  objc_storeStrong(&self->_shareParticipantKeyFetchedBlock, 0);
}

@end