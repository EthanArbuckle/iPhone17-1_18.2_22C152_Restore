@interface CKCompleteParticipantVettingOperation
+ (SEL)daemonInvocationSelector;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKCompleteParticipantVettingOperation)init;
- (CKCompleteParticipantVettingOperation)initWithVettingToken:(id)a3 vettingRecord:(id)a4 displayedHostname:(id)a5;
- (CKShareMetadata)shareMetadata;
- (NSData)encryptedKey;
- (NSString)baseToken;
- (NSString)displayedHostname;
- (NSString)routingKey;
- (NSString)vettingEmail;
- (NSString)vettingPhone;
- (NSString)vettingToken;
- (NSURL)reconstructedShareURL;
- (id)activityCreate;
- (id)completeParticipantVettingCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleReconstructedShareURL:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setCompleteParticipantVettingCompletionBlock:(id)a3;
- (void)setDisplayedHostname:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setReconstructedShareURL:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShareMetadata:(id)a3;
- (void)setVettingEmail:(id)a3;
- (void)setVettingPhone:(id)a3;
- (void)setVettingToken:(id)a3;
@end

@implementation CKCompleteParticipantVettingOperation

- (CKCompleteParticipantVettingOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKCompleteParticipantVettingOperation;
  v2 = [(CKOperation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    vettingToken = v2->_vettingToken;
    v2->_vettingToken = 0;
  }
  return v3;
}

- (CKCompleteParticipantVettingOperation)initWithVettingToken:(id)a3 vettingRecord:(id)a4 displayedHostname:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = (CKCompleteParticipantVettingOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v8, v14, v15, v16);
    vettingToken = v17->_vettingToken;
    v17->_vettingToken = (NSString *)v18;

    v22 = objc_msgSend_objectForKeyedSubscript_(v9, v20, @"email", v21);
    uint64_t v26 = objc_msgSend_copy(v22, v23, v24, v25);
    vettingEmail = v17->_vettingEmail;
    v17->_vettingEmail = (NSString *)v26;

    v30 = objc_msgSend_objectForKeyedSubscript_(v9, v28, @"phone", v29);
    uint64_t v34 = objc_msgSend_copy(v30, v31, v32, v33);
    vettingPhone = v17->_vettingPhone;
    v17->_vettingPhone = (NSString *)v34;

    v38 = objc_msgSend_objectForKeyedSubscript_(v9, v36, @"shareRoutingKey", v37);
    uint64_t v42 = objc_msgSend_copy(v38, v39, v40, v41);
    routingKey = v17->_routingKey;
    v17->_routingKey = (NSString *)v42;

    v46 = objc_msgSend_objectForKeyedSubscript_(v9, v44, @"encryptedKey", v45);
    uint64_t v50 = objc_msgSend_copy(v46, v47, v48, v49);
    encryptedKey = v17->_encryptedKey;
    v17->_encryptedKey = (NSData *)v50;

    v54 = objc_msgSend_objectForKeyedSubscript_(v9, v52, @"baseToken", v53);
    uint64_t v58 = objc_msgSend_copy(v54, v55, v56, v57);
    baseToken = v17->_baseToken;
    v17->_baseToken = (NSString *)v58;

    uint64_t v63 = objc_msgSend_copy(v10, v60, v61, v62);
    displayedHostname = v17->_displayedHostname;
    v17->_displayedHostname = (NSString *)v63;
  }
  return v17;
}

- (void)setCompleteParticipantVettingCompletionBlock:(id)a3
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
    v14[2] = sub_18B14ECE8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id completeParticipantVettingCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_completeParticipantVettingCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id completeParticipantVettingCompletionBlock = self->_completeParticipantVettingCompletionBlock;
    self->_id completeParticipantVettingCompletionBlock = v11;
LABEL_9:
  }
}

- (id)completeParticipantVettingCompletionBlock
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
    id v15 = sub_18AF14144;
    uint64_t v16 = sub_18AF139B0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B14EEE0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_completeParticipantVettingCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_vettingToken(self, v5, v6, v7);
  objc_msgSend_setVettingToken_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_vettingEmail(self, v11, v12, v13);
  objc_msgSend_setVettingEmail_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_vettingPhone(self, v17, v18, v19);
  objc_msgSend_setVettingPhone_(v4, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_routingKey(self, v23, v24, v25);
  objc_msgSend_setRoutingKey_(v4, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_encryptedKey(self, v29, v30, v31);
  objc_msgSend_setEncryptedKey_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_baseToken(self, v35, v36, v37);
  objc_msgSend_setBaseToken_(v4, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_displayedHostname(self, v41, v42, v43);
  objc_msgSend_setDisplayedHostname_(v4, v45, (uint64_t)v44, v46);

  v47.receiver = self;
  v47.super_class = (Class)CKCompleteParticipantVettingOperation;
  [(CKOperation *)&v47 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CKCompleteParticipantVettingOperation;
  id v4 = a3;
  [(CKOperation *)&v47 fillFromOperationInfo:v4];
  id v8 = objc_msgSend_vettingToken(v4, v5, v6, v7, v47.receiver, v47.super_class);
  objc_msgSend_setVettingToken_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_vettingEmail(v4, v11, v12, v13);
  objc_msgSend_setVettingEmail_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_vettingPhone(v4, v17, v18, v19);
  objc_msgSend_setVettingPhone_(self, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_routingKey(v4, v23, v24, v25);
  objc_msgSend_setRoutingKey_(self, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_encryptedKey(v4, v29, v30, v31);
  objc_msgSend_setEncryptedKey_(self, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_baseToken(v4, v35, v36, v37);
  objc_msgSend_setBaseToken_(self, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_displayedHostname(v4, v41, v42, v43);

  objc_msgSend_setDisplayedHostname_(self, v45, (uint64_t)v44, v46);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v7 = objc_msgSend_vettingToken(self, a2, (uint64_t)a3, v3);
  if (!v7) {
    goto LABEL_15;
  }
  v11 = (void *)v7;
  id v15 = objc_msgSend_vettingEmail(self, v8, v9, v10);
  if (!v15)
  {
    id v4 = objc_msgSend_vettingPhone(self, v12, v13, v14);
    if (!v4)
    {
LABEL_11:

      goto LABEL_15;
    }
  }
  uint64_t v16 = objc_msgSend_routingKey(self, v12, v13, v14);
  if (!v16)
  {
    if (v15) {
      uint64_t v22 = v15;
    }
    else {
      uint64_t v22 = v4;
    }

    goto LABEL_11;
  }
  v20 = (void *)v16;
  uint64_t v21 = objc_msgSend_encryptedKey(self, v17, v18, v19);

  if (v15) {
  else
  }

  if (v21)
  {
    v42.receiver = self;
    v42.super_class = (Class)CKCompleteParticipantVettingOperation;
    return [(CKOperation *)&v42 CKOperationShouldRun:a3];
  }
LABEL_15:
  if (a3)
  {
    uint64_t v24 = objc_msgSend_vettingToken(self, v8, v9, v10);
    uint64_t v28 = objc_msgSend_vettingEmail(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_vettingPhone(self, v29, v30, v31);
    uint64_t v36 = objc_msgSend_routingKey(self, v33, v34, v35);
    uint64_t v40 = objc_msgSend_encryptedKey(self, v37, v38, v39);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, @"CKErrorDomain", 12, @"Incomplete vetting info: vettingToken: %@, vettingEmail: %@, vettingPhone: %@, routingKey: %@, encryptedKey: %@", v24, v28, v32, v36, v40);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCompleteParticipantVettingOperation_withBlock_;
}

- (void)handleReconstructedShareURL:(id)a3
{
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKCompleteParticipantVettingOperation", "Finishing", buf, 2u);
    }
  }
  uint64_t v22 = objc_msgSend_completeParticipantVettingCompletionBlock(self, v7, v8, v9);

  if (v22)
  {
    objc_msgSend_completeParticipantVettingCompletionBlock(self, v23, v24, v25);
    uint64_t v26 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_CKClientSuitableError(v4, v27, v28, v29);
    uint64_t v34 = objc_msgSend_reconstructedShareURL(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_shareMetadata(self, v35, v36, v37);
    ((void (**)(void, void *, void *, void *))v26)[2](v26, v30, v34, v38);

    objc_msgSend_setCompleteParticipantVettingCompletionBlock_(self, v39, 0, v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CKCompleteParticipantVettingOperation;
  [(CKOperation *)&v41 _finishOnCallbackQueueWithError:v4];
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
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
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
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCompleteParticipantVettingOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCompleteParticipantVettingOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/verify-share-vetting", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (void)setVettingToken:(id)a3
{
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (void)setVettingEmail:(id)a3
{
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (void)setVettingPhone:(id)a3
{
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
}

- (NSURL)reconstructedShareURL
{
  return self->_reconstructedShareURL;
}

- (void)setReconstructedShareURL:(id)a3
{
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_reconstructedShareURL, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);
  objc_storeStrong((id *)&self->_vettingToken, 0);

  objc_storeStrong(&self->_completeParticipantVettingCompletionBlock, 0);
}

@end