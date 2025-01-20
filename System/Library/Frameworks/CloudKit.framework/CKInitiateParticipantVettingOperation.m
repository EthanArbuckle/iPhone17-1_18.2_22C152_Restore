@interface CKInitiateParticipantVettingOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKInitiateParticipantVettingOperation)initWithShareMetadata:(id)a3 participantID:(id)a4 address:(id)a5;
- (CKShareMetadata)shareMetadata;
- (NSString)address;
- (NSString)participantID;
- (id)participantVettingInitiatedBlock;
- (id)participantVettingInitiationCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleParticipantVettingProgressWithError:(id)a3;
- (void)retryTimes:(unint64_t)a3 container:(id)a4 participantVettingInitiatedBlock:(id)a5 participantVettingInitiationCompletionBlock:(id)a6;
- (void)setAddress:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setParticipantVettingInitiatedBlock:(id)a3;
- (void)setParticipantVettingInitiationCompletionBlock:(id)a3;
- (void)setShareMetadata:(id)a3;
@end

@implementation CKInitiateParticipantVettingOperation

- (CKInitiateParticipantVettingOperation)initWithShareMetadata:(id)a3 participantID:(id)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKInitiateParticipantVettingOperation;
  v14 = [(CKOperation *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    shareMetadata = v14->_shareMetadata;
    v14->_shareMetadata = (CKShareMetadata *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    address = v14->_address;
    v14->_address = (NSString *)v25;
  }
  return v14;
}

- (void)setParticipantVettingInitiatedBlock:(id)a3
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
    v14[2] = sub_18B0FC334;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id participantVettingInitiatedBlock = v15;
    goto LABEL_9;
  }
  if (self->_participantVettingInitiatedBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id participantVettingInitiatedBlock = self->_participantVettingInitiatedBlock;
    self->_id participantVettingInitiatedBlock = v11;
LABEL_9:
  }
}

- (id)participantVettingInitiatedBlock
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
    id v15 = sub_18AF13F4C;
    v16 = sub_18AF13940;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0FC52C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_participantVettingInitiatedBlock);
  }

  return v8;
}

- (void)setParticipantVettingInitiationCompletionBlock:(id)a3
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
    v14[2] = sub_18B0FC6B8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id participantVettingInitiationCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_participantVettingInitiationCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id participantVettingInitiationCompletionBlock = self->_participantVettingInitiationCompletionBlock;
    self->_id participantVettingInitiationCompletionBlock = v11;
LABEL_9:
  }
}

- (id)participantVettingInitiationCompletionBlock
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
    id v15 = sub_18AF13F4C;
    v16 = sub_18AF13940;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0FC8B0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_participantVettingInitiationCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_shareMetadata(self, v5, v6, v7);
  objc_msgSend_setShareMetadata_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_participantID(self, v11, v12, v13);
  objc_msgSend_setParticipantID_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_address(self, v17, v18, v19);
  objc_msgSend_setAddress_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKInitiateParticipantVettingOperation;
  [(CKOperation *)&v23 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKInitiateParticipantVettingOperation;
  id v4 = a3;
  [(CKOperation *)&v23 fillFromOperationInfo:v4];
  id v8 = objc_msgSend_shareMetadata(v4, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setShareMetadata_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_participantID(v4, v11, v12, v13);
  objc_msgSend_setParticipantID_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_address(v4, v17, v18, v19);

  objc_msgSend_setAddress_(self, v21, (uint64_t)v20, v22);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v6 = objc_msgSend_shareMetadata(self, a2, (uint64_t)a3, v3);
  if (v6
    && (uint64_t v10 = (void *)v6,
        objc_msgSend_participantID(self, v7, v8, v9),
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v16.receiver = self;
    v16.super_class = (Class)CKInitiateParticipantVettingOperation;
    return [(CKOperation *)&v16 CKOperationShouldRun:a3];
  }
  else
  {
    if (a3)
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKErrorDomain", 12, @"You must set share metadata and a participant ID on %@", v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (void)retryTimes:(unint64_t)a3 container:(id)a4 participantVettingInitiatedBlock:(id)a5 participantVettingInitiationCompletionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = a3 - 1;
  objc_msgSend_setParticipantVettingInitiatedBlock_(self, v14, (uint64_t)v11, v15);
  uint64_t v19 = objc_msgSend_description(self, v16, v17, v18);
  objc_super v23 = objc_msgSend_shareMetadata(self, v20, v21, v22);
  v27 = objc_msgSend_participantID(self, v24, v25, v26);
  v31 = objc_msgSend_address(self, v28, v29, v30);
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  v45 = sub_18B0FCD14;
  v46 = &unk_1E5464920;
  id v47 = v19;
  id v48 = v23;
  id v49 = v27;
  id v50 = v31;
  id v51 = v10;
  id v52 = v12;
  id v53 = v11;
  unint64_t v54 = v13;
  id v32 = v11;
  id v33 = v10;
  id v34 = v31;
  id v35 = v27;
  id v36 = v23;
  id v37 = v19;
  id v38 = v12;
  objc_msgSend_setParticipantVettingInitiationCompletionBlock_(self, v39, (uint64_t)&v43, v40);
  objc_msgSend_addOperation_(v33, v41, (uint64_t)self, v42, v43, v44, v45, v46);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performInitiateParticipantVettingOperation_withBlock_;
}

- (void)handleParticipantVettingProgressWithError:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_CKClientSuitableError(a3, a2, (uint64_t)a3, v3);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v7 = signpost;

  if (v5)
  {
    if (!v7) {
      goto LABEL_22;
    }
    if (self) {
      id v11 = self->super._signpost;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    objc_super v16 = objc_msgSend_log(v12, v13, v14, v15);

    if (self) {
      uint64_t v17 = self->super._signpost;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = v17;
    uint64_t v22 = objc_msgSend_identifier(v18, v19, v20, v21);

    if ((unint64_t)(v22 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
      goto LABEL_21;
    }
    *(_DWORD *)uint64_t v43 = 138412290;
    *(void *)&v43[4] = v5;
    objc_super v23 = "Participant vetting initialiated with error: %@";
    uint64_t v24 = v16;
    os_signpost_id_t v25 = v22;
    uint32_t v26 = 12;
    goto LABEL_20;
  }
  if (!v7) {
    goto LABEL_22;
  }
  if (self) {
    v27 = self->super._signpost;
  }
  else {
    v27 = 0;
  }
  objc_super v28 = v27;
  objc_super v16 = objc_msgSend_log(v28, v29, v30, v31);

  if (self) {
    id v32 = self->super._signpost;
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;
  uint64_t v37 = objc_msgSend_identifier(v33, v34, v35, v36);

  if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)uint64_t v43 = 0;
    objc_super v23 = "Participant vetting initialiated";
    uint64_t v24 = v16;
    os_signpost_id_t v25 = v37;
    uint32_t v26 = 2;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v24, OS_SIGNPOST_EVENT, v25, "CKInitiateParticipantVettingOperation", v23, v43, v26);
  }
LABEL_21:

LABEL_22:
  id v38 = objc_msgSend_participantVettingInitiatedBlock(self, v8, v9, v10, *(_OWORD *)v43);

  if (v38)
  {
    objc_msgSend_participantVettingInitiatedBlock(self, v39, v40, v41);
    uint64_t v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v42)[2](v42, v5);
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      objc_super v16 = self->super._signpost;
    }
    else {
      objc_super v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKInitiateParticipantVettingOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_participantVettingInitiationCompletionBlock(self, v7, v8, v9);

  if (v22)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    os_signpost_id_t v25 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = v25;
      uint64_t v37 = (objc_class *)objc_opt_class();
      id v38 = NSStringFromClass(v37);
      uint64_t v42 = objc_msgSend_ckShortDescription(self, v39, v40, v41);
      v46 = objc_msgSend_CKClientSuitableError(v4, v43, v44, v45);
      *(_DWORD *)buf = 138544130;
      id v49 = v38;
      __int16 v50 = 2048;
      id v51 = self;
      __int16 v52 = 2114;
      id v53 = v42;
      __int16 v54 = 2112;
      v55 = v46;
      _os_log_debug_impl(&dword_18AF10000, v36, OS_LOG_TYPE_DEBUG, "Calling participantVettingInitiationCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_participantVettingInitiationCompletionBlock(self, v26, v27, v28);
    uint64_t v29 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    id v33 = objc_msgSend_CKClientSuitableError(v4, v30, v31, v32);
    ((void (**)(void, void *))v29)[2](v29, v33);

    objc_msgSend_setParticipantVettingInitiationCompletionBlock_(self, v34, 0, v35);
  }
  objc_msgSend_setParticipantVettingInitiatedBlock_(self, v23, 0, v24);
  v47.receiver = self;
  v47.super_class = (Class)CKInitiateParticipantVettingOperation;
  [(CKOperation *)&v47 _finishOnCallbackQueueWithError:v4];
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
      id v11 = self->super._signpost;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
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
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKInitiateParticipantVettingOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
    id v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKInitiateParticipantVettingOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleParticipantVettingProgressWithError_, 0, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKInitiateParticipantVettingOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong(&self->_participantVettingInitiationCompletionBlock, 0);

  objc_storeStrong(&self->_participantVettingInitiatedBlock, 0);
}

@end