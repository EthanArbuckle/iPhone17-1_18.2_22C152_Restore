@interface CKCodeFunctionInvokeOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)local;
- (BOOL)shouldFetchAssetContentInMemory;
- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5;
- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5 local:(BOOL)a6;
- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5;
- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5 local:(BOOL)a6;
- (NSData)serializedRequest;
- (NSData)serializedResponse;
- (NSError)responseError;
- (NSString)functionName;
- (NSString)serviceName;
- (NSURL)clientRuntimeProvidedServiceURL;
- (id)activityCreate;
- (id)functionInvokeCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4;
- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6;
- (void)setClientRuntimeProvidedServiceURL:(id)a3;
- (void)setFunctionInvokeCompletionBlock:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setLocal:(BOOL)a3;
- (void)setResponseError:(id)a3;
- (void)setSerializedRequest:(id)a3;
- (void)setSerializedResponse:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
@end

@implementation CKCodeFunctionInvokeOperation

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5 local:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v47 = 0;
  char v13 = _CKCheckArgument((uint64_t)"serviceName", v10, 0, 0, 0, &v47);
  id v14 = v47;
  if ((v13 & 1) == 0
    || (v14,
        id v46 = 0,
        char v15 = _CKCheckArgument((uint64_t)"functionName", v11, 0, 0, 0, &v46),
        id v14 = v46,
        (v15 & 1) == 0))
  {
    v33 = v14;
    v34 = [CKException alloc];
    uint64_t v38 = objc_msgSend_code(v33, v35, v36, v37);
    v42 = objc_msgSend_localizedDescription(v33, v39, v40, v41);
    id v44 = (id)objc_msgSend_initWithCode_format_(v34, v43, v38, @"%@", v42);

    objc_exception_throw(v44);
  }

  v45.receiver = self;
  v45.super_class = (Class)CKCodeFunctionInvokeOperation;
  v19 = [(CKOperation *)&v45 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v10, v16, v17, v18);
    serviceName = v19->_serviceName;
    v19->_serviceName = (NSString *)v20;

    uint64_t v25 = objc_msgSend_copy(v11, v22, v23, v24);
    functionName = v19->_functionName;
    v19->_functionName = (NSString *)v25;

    uint64_t v30 = objc_msgSend_copy(v12, v27, v28, v29);
    serializedRequest = v19->_serializedRequest;
    v19->_serializedRequest = (NSData *)v30;

    v19->_local = a6;
  }

  return v19;
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedRequest:(id)a5
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1F4181798](self, sel_initWithServiceName_functionName_serializedRequest_local_, a3, a4);
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5 local:(BOOL)a6
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1F4181798](self, sel_initWithServiceName_functionName_serializedRequest_local_, a3, a4);
}

- (CKCodeFunctionInvokeOperation)initWithServiceName:(id)a3 functionName:(id)a4 serializedParameters:(id)a5
{
  return (CKCodeFunctionInvokeOperation *)MEMORY[0x1F4181798](self, sel_initWithServiceName_functionName_serializedRequest_, a3, a4);
}

- (void)setFunctionInvokeCompletionBlock:(id)a3
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
    char v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B168990;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id functionInvokeCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_functionInvokeCompletionBlock != v7)
  {
    id v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id functionInvokeCompletionBlock = self->_functionInvokeCompletionBlock;
    self->_id functionInvokeCompletionBlock = v11;
LABEL_9:
  }
}

- (id)functionInvokeCompletionBlock
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
    char v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF14220;
    v16 = sub_18AF139D8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B168B88;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_functionInvokeCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_serviceName(self, v5, v6, v7);
  objc_msgSend_setServiceName_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_functionName(self, v11, v12, v13);
  objc_msgSend_setFunctionName_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_local(self, v17, v18, v19);
  objc_msgSend_setLegacyIsLocalBit_(v4, v21, v20, v22);
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v23, v24, v25);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v27, AssetContentInMemory, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKCodeFunctionInvokeOperation;
  [(CKDatabaseOperation *)&v29 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CKCodeFunctionInvokeOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v29 fillFromOperationInfo:v4];
  v8 = objc_msgSend_serviceName(v4, v5, v6, v7, v29.receiver, v29.super_class);
  objc_msgSend_setServiceName_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_functionName(v4, v11, v12, v13);
  objc_msgSend_setFunctionName_(self, v15, (uint64_t)v14, v16);

  uint64_t IsLocalBit = objc_msgSend_legacyIsLocalBit(v4, v17, v18, v19);
  objc_msgSend_setLocal_(self, v21, IsLocalBit, v22);
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v4, v23, v24, v25);

  objc_msgSend_setShouldFetchAssetContentInMemory_(self, v27, AssetContentInMemory, v28);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKCodeFunctionInvokeOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_functionInvokeCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  BOOL v6 = objc_msgSend_serviceName(self, a2, (uint64_t)a3, v3);

  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, @"CKErrorDomain", 12, @"Service name was not specified on %@", v17);
LABEL_11:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  uint64_t v10 = objc_msgSend_functionName(self, v7, v8, v9);

  if (!v10)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v19 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v19);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v20, @"CKErrorDomain", 12, @"Function name was not specified on %@", v17);
    goto LABEL_11;
  }
  uint64_t v14 = objc_msgSend_serializedRequest(self, v11, v12, v13);

  if (v14)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKCodeFunctionInvokeOperation;
    return [(CKDatabaseOperation *)&v23 CKOperationShouldRun:a3];
  }
  if (a3)
  {
    v21 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v21);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, @"CKErrorDomain", 12, @"Serialized parameters were not specified on %@", v17);
    goto LABEL_11;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCodeFunctionInvokeOperation_withBlock_;
}

- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6
{
  id v8 = a6;
  objc_msgSend_serializedRequest(self, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a6 + 2))(v8, v12, 0);
}

- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4
{
  id v8 = a4;
  objc_msgSend_setSerializedResponse_(self, v6, (uint64_t)a3, v7);
  (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    objc_msgSend_responseError(self, v4, v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = objc_msgSend_functionInvokeCompletionBlock(self, v4, v5, v6);

  if (v8)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v9 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = v9;
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      uint64_t v30 = objc_msgSend_ckShortDescription(self, v27, v28, v29);
      *(_DWORD *)buf = 138544130;
      v33 = v26;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      uint64_t v37 = v30;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_debug_impl(&dword_18AF10000, v24, OS_LOG_TYPE_DEBUG, "Calling functionInvokeCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_functionInvokeCompletionBlock(self, v10, v11, v12);
    uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    id v17 = objc_msgSend_serializedResponse(self, v14, v15, v16);
    v21 = objc_msgSend_CKClientSuitableError(v7, v18, v19, v20);
    ((void (**)(void, void *, void *))v13)[2](v13, v17, v21);

    objc_msgSend_setFunctionInvokeCompletionBlock_(self, v22, 0, v23);
  }
  v31.receiver = self;
  v31.super_class = (Class)CKCodeFunctionInvokeOperation;
  [(CKOperation *)&v31 _finishOnCallbackQueueWithError:v7];
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
  uint64_t v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super.super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
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
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      __int16 v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      objc_super v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      v53 = CKStringForQOS(v49, v50, v51, v52);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCodeFunctionInvokeOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      id v7 = self->super.super._signpost;
    }
    else {
      id v7 = 0;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCodeFunctionInvokeOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/ckcode-function-invoke", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (BOOL)local
{
  uint64_t v5 = objc_msgSend_clientRuntimeProvidedServiceURL(self, a2, v2, v3);
  if (v5) {
    BOOL local = 1;
  }
  else {
    BOOL local = self->_local;
  }

  return local;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v11, (uint64_t)v10, (uint64_t)sel_handleReplaceWireSerializationsWithRecords_, 0, 0);

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CKCodeFunctionInvokeOperation;
  objc_msgSendSuper2(&v12, sel_applyDaemonCallbackInterfaceTweaks_, v5);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSData)serializedRequest
{
  return self->_serializedRequest;
}

- (void)setSerializedRequest:(id)a3
{
}

- (void)setLocal:(BOOL)a3
{
  self->_BOOL local = a3;
}

- (NSURL)clientRuntimeProvidedServiceURL
{
  return self->_clientRuntimeProvidedServiceURL;
}

- (void)setClientRuntimeProvidedServiceURL:(id)a3
{
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContentInMemory = a3;
}

- (NSData)serializedResponse
{
  return self->_serializedResponse;
}

- (void)setSerializedResponse:(id)a3
{
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_serializedResponse, 0);
  objc_storeStrong((id *)&self->_clientRuntimeProvidedServiceURL, 0);
  objc_storeStrong((id *)&self->_serializedRequest, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong(&self->_functionInvokeCompletionBlock, 0);
}

@end