@interface CKDCodeFunctionInvokeURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)requestGETPreAuth;
- (CKDCodeFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 attestationEntropy:(id)a7 pccWrappedInvocationKeys:(id)a8 trustedTargetWrappedInvocationKey:(id)a9;
- (CKDTrustedTargetWrappedKey)trustedTargetWrappedInvocationKey;
- (NSArray)pccWrappedInvocationKeys;
- (NSData)attestationEntropy;
- (NSData)serializedParameters;
- (NSString)functionName;
- (NSString)serviceName;
- (id)additionalHeaderValues;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)serializedResultsCallback;
- (int64_t)databaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAttestationEntropy:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setPccWrappedInvocationKeys:(id)a3;
- (void)setSerializedParameters:(id)a3;
- (void)setSerializedResultsCallback:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setTrustedTargetWrappedInvocationKey:(id)a3;
@end

@implementation CKDCodeFunctionInvokeURLRequest

- (CKDCodeFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 attestationEntropy:(id)a7 pccWrappedInvocationKeys:(id)a8 trustedTargetWrappedInvocationKey:(id)a9
{
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
  v18 = [(CKDURLRequest *)&v25 initWithOperation:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceName, a4);
    objc_storeStrong((id *)&v19->_functionName, a5);
    objc_storeStrong((id *)&v19->_serializedParameters, a6);
    objc_storeStrong((id *)&v19->_pccWrappedInvocationKeys, a8);
    objc_storeStrong((id *)&v19->_trustedTargetWrappedInvocationKey, a9);
    objc_storeStrong((id *)&v19->_attestationEntropy, a7);
  }

  return v19;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_serviceName(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"serviceName");

  v11 = objc_msgSend_functionName(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"functionName");
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)additionalHeaderValues
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  v5 = objc_msgSend_serviceName(self, a2, v2);
  v8 = objc_msgSend_functionName(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v4, v9, @"%@/%@", v5, v8);

  uint64_t v14 = 0x1F204D3D0;
  v15[0] = v10;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v15, &v14, 1);

  return v12;
}

- (int64_t)databaseScope
{
  id v4 = objc_msgSend_operation(self, a2, v2);
  uint64_t v7 = objc_msgSend_operationInfo(v4, v5, v6);

  if (objc_msgSend_enqueuedOnContainerService(v7, v8, v9))
  {
    int64_t v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKDCodeFunctionInvokeURLRequest;
    int64_t v10 = [(CKDURLRequest *)&v12 databaseScope];
  }

  return v10;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)requestGETPreAuth
{
  v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char v6 = objc_msgSend_usePreauth(v3, v4, v5);

  return v6;
}

- (id)generateRequestOperations
{
  v79[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  char v6 = objc_msgSend_serviceName(self, v4, v5);
  objc_msgSend_setServiceName_(v3, v7, (uint64_t)v6);

  int64_t v10 = objc_msgSend_functionName(self, v8, v9);
  objc_msgSend_setFunctionName_(v3, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_serializedParameters(self, v12, v13);
  objc_msgSend_setSerializedParameters_(v3, v15, (uint64_t)v14);

  v18 = objc_msgSend_pccWrappedInvocationKeys(self, v16, v17);

  if (v18)
  {
    id v21 = objc_msgSend_pccWrappedInvocationKeys(self, v19, v20);
    id v23 = objc_msgSend_CKMap_(v21, v22, (uint64_t)&unk_1F2043970);

    id v24 = objc_opt_new();
    v27 = objc_msgSend_mutableCopy(v23, v25, v26);
    objc_msgSend_setCryptoSessions_(v24, v28, (uint64_t)v27);

    objc_msgSend_setProtectedCloudComputeMetadata_(v3, v29, (uint64_t)v24);
  }
  v30 = objc_msgSend_attestationEntropy(self, v19, v20);

  if (v30)
  {
    v33 = objc_alloc_init(CKDPCodeFunctionInvokeRequestAttestationRequest);
    v36 = objc_msgSend_attestationEntropy(self, v34, v35);
    objc_msgSend_setEntropy_(v33, v37, (uint64_t)v36);

    objc_msgSend_setAttestationRequest_(v3, v38, (uint64_t)v33);
  }
  v39 = objc_msgSend_trustedTargetWrappedInvocationKey(self, v31, v32);

  if (v39)
  {
    v42 = objc_opt_new();
    v45 = objc_msgSend_trustedTargetWrappedInvocationKey(self, v43, v44);
    v48 = objc_msgSend_wrappedKey(v45, v46, v47);
    objc_msgSend_setEncryptedInvocationKey_(v42, v49, (uint64_t)v48);

    v52 = objc_msgSend_trustedTargetWrappedInvocationKey(self, v50, v51);
    v55 = objc_msgSend_publicKey(v52, v53, v54);
    v58 = objc_msgSend_protectionSource(v55, v56, v57);
    objc_msgSend_setProtectionSource_(v42, v59, (uint64_t)v58);

    v62 = objc_msgSend_trustedTargetWrappedInvocationKey(self, v60, v61);
    v65 = objc_msgSend_publicKey(v62, v63, v64);
    uint64_t v68 = objc_msgSend_version(v65, v66, v67);
    objc_msgSend_setKeyVersion_(v42, v69, v68);

    objc_msgSend_setScheme_(v42, v70, 1);
    objc_msgSend_setTrustedTargetCryptoMetadata_(v3, v71, (uint64_t)v42);
  }
  uint64_t v72 = objc_msgSend_operationType(self, v40, v41);
  v74 = objc_msgSend_operationRequestWithType_(self, v73, v72);
  objc_msgSend_setFunctionInvokeRequest_(v74, v75, (uint64_t)v3);
  v79[0] = v74;
  v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v76, (uint64_t)v79, 1);

  return v77;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fakeResponseOperationResultByItemID(self, v5, v6);

  if (v7)
  {
    int64_t v10 = objc_msgSend_fakeResponseOperationResultByItemID(self, v8, v9);
    uint64_t v13 = objc_msgSend_functionName(self, v11, v12);
    v15 = objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13);

    if (v15)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v16 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = v16;
        uint64_t v44 = objc_msgSend_requestUUID(self, v42, v43);
        uint64_t v47 = objc_msgSend_functionName(self, v45, v46);
        int v48 = 138543618;
        v49 = v44;
        __int16 v50 = 2114;
        uint64_t v51 = v47;
        _os_log_error_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for function %{public}@\"", (uint8_t *)&v48, 0x16u);
      }
      objc_msgSend_setResult_(v4, v17, (uint64_t)v15);
    }
  }
  if (objc_msgSend_hasFunctionInvokeResponse(v4, v8, v9))
  {
    uint64_t v20 = objc_msgSend_functionInvokeResponse(v4, v18, v19);
    if (objc_msgSend_hasAttestationResponse(v20, v21, v22))
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F94098]);
      v28 = objc_msgSend_attestationResponse(v20, v26, v27);
      objc_msgSend_writeTo_(v28, v29, (uint64_t)v25);

      uint64_t v32 = objc_msgSend_data(v25, v30, v31);
    }
    else
    {
      uint64_t v32 = objc_msgSend_serializedResult(v20, v23, v24);
    }
  }
  else
  {
    uint64_t v32 = 0;
  }
  v33 = objc_msgSend_serializedResultsCallback(self, v18, v19);

  if (v33)
  {
    objc_msgSend_serializedResultsCallback(self, v34, v35);
    v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_result(v4, v37, v38);
    ((void (**)(void, void *, void *))v36)[2](v36, v32, v39);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_serializedResultsCallback(self, v4, v5);

  if (v6)
  {
    objc_msgSend_serializedResultsCallback(self, v7, v8);
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (id)serializedResultsCallback
{
  return self->_serializedResultsCallback;
}

- (void)setSerializedResultsCallback:(id)a3
{
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

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
}

- (NSData)attestationEntropy
{
  return self->_attestationEntropy;
}

- (void)setAttestationEntropy:(id)a3
{
}

- (NSArray)pccWrappedInvocationKeys
{
  return self->_pccWrappedInvocationKeys;
}

- (void)setPccWrappedInvocationKeys:(id)a3
{
}

- (CKDTrustedTargetWrappedKey)trustedTargetWrappedInvocationKey
{
  return self->_trustedTargetWrappedInvocationKey;
}

- (void)setTrustedTargetWrappedInvocationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedTargetWrappedInvocationKey, 0);
  objc_storeStrong((id *)&self->_pccWrappedInvocationKeys, 0);
  objc_storeStrong((id *)&self->_attestationEntropy, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_serializedResultsCallback, 0);
}

@end