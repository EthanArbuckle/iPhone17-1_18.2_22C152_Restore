@interface CKCodeOperation
+ (Class)operationInfoClass;
+ (SEL)daemonInvocationSelector;
+ (id)operationDaemonCallbackProtocol;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)dropInMemoryAssetContentASAP;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)shouldFetchAssetContentInMemory;
- (CKCodeOperation)initWithFunctionName:(id)a3 responseClass:(Class)a4;
- (CKCodeOperation)initWithServiceName:(id)a3 functionName:(id)a4 responseClass:(Class)a5;
- (CKCodeOperationMessageMutation)request;
- (CKCodeOperationMessageMutation)response;
- (CKCodeService)codeService;
- (Class)responseClass;
- (NSArray)requestLocalSerializations;
- (NSError)responseError;
- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID;
- (NSString)functionName;
- (NSString)serviceName;
- (NSURL)destinationServerExplicitURL;
- (id)activityCreate;
- (id)codeOperationCompletionBlock;
- (id)didSubstituteRequestRecordTransportsBlock;
- (id)incompleteResponsePreviewBlock;
- (id)perRecordCompletionBlock;
- (id)perRecordProgressBlock;
- (int64_t)destinationServer;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7;
- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4;
- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5;
- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4;
- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6;
- (void)handleReplaceWireSerializationsWithRecords:(id)a3;
- (void)performCKOperation;
- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3;
- (void)setCodeOperationCompletionBlock:(id)a3;
- (void)setCodeService:(id)a3;
- (void)setDestinationServer:(int64_t)a3;
- (void)setDestinationServerExplicitURL:(id)a3;
- (void)setDidSubstituteRequestRecordTransportsBlock:(id)a3;
- (void)setDropInMemoryAssetContentASAP:(BOOL)a3;
- (void)setFunctionName:(id)a3;
- (void)setIncompleteResponsePreviewBlock:(id)a3;
- (void)setPerRecordCompletionBlock:(id)a3;
- (void)setPerRecordProgressBlock:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestLocalSerializations:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseClass:(Class)a3;
- (void)setResponseError:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
@end

@implementation CKCodeOperation

- (CKCodeOperation)initWithFunctionName:(id)a3 responseClass:(Class)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKCodeOperation;
  v9 = [(CKOperation *)&v22 init];
  if (v9)
  {
    if ((objc_msgSend_conformsToProtocol_(a4, v7, (uint64_t)&unk_1ED885818, v8) & 1) == 0)
    {
      v18 = [CKException alloc];
      v19 = NSStringFromClass(a4);
      id v21 = (id)objc_msgSend_initWithCode_format_(v18, v20, 12, @"Response class named %@ doesn't conform to CKCodeOperationMessageMutation", v19);

      objc_exception_throw(v21);
    }
    uint64_t v13 = objc_msgSend_copy(v6, v10, v11, v12);
    functionName = v9->_functionName;
    v9->_functionName = (NSString *)v13;

    objc_storeStrong((id *)&v9->_responseClass, a4);
    v9->_destinationServer = 0;
    v9->_dropInMemoryAssetContentASAP = 1;
    uint64_t v15 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v9->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v9->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v15;
  }
  return v9;
}

- (CKCodeOperation)initWithServiceName:(id)a3 functionName:(id)a4 responseClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CKCodeOperation;
  uint64_t v12 = [(CKOperation *)&v30 init];
  if (v12)
  {
    if ((objc_msgSend_conformsToProtocol_(a5, v10, (uint64_t)&unk_1ED885818, v11) & 1) == 0)
    {
      v26 = [CKException alloc];
      v27 = NSStringFromClass(a5);
      id v29 = (id)objc_msgSend_initWithCode_format_(v26, v28, 12, @"Response class named %@ doesn't conform to CKCodeOperationMessageMutation", v27);

      objc_exception_throw(v29);
    }
    uint64_t v16 = objc_msgSend_copy(v8, v13, v14, v15);
    serviceName = v12->_serviceName;
    v12->_serviceName = (NSString *)v16;

    uint64_t v21 = objc_msgSend_copy(v9, v18, v19, v20);
    functionName = v12->_functionName;
    v12->_functionName = (NSString *)v21;

    objc_storeStrong((id *)&v12->_responseClass, a5);
    v12->_destinationServer = 0;
    v12->_dropInMemoryAssetContentASAP = 1;
    uint64_t v23 = objc_opt_new();
    assetInfoByArrayIndexByRecordKeyByRecordID = v12->_assetInfoByArrayIndexByRecordKeyByRecordID;
    v12->_assetInfoByArrayIndexByRecordKeyByRecordID = (NSMutableDictionary *)v23;
  }
  return v12;
}

- (void)setCodeService:(id)a3
{
  id v31 = a3;
  objc_storeStrong((id *)&self->_codeService, a3);
  id v8 = objc_msgSend_container(v31, v5, v6, v7);
  uint64_t v12 = objc_msgSend_boxedDatabaseScope(v31, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_boxedDatabaseScope(v31, v13, v14, v15);
    uint64_t v20 = objc_msgSend_integerValue(v16, v17, v18, v19);
    uint64_t v23 = objc_msgSend_databaseWithDatabaseScope_(v8, v21, v20, v22);

    objc_msgSend_setDatabase_(self, v24, (uint64_t)v23, v25);
  }
  else
  {
    objc_msgSend_setDatabase_(self, v13, 0, v15);
    uint64_t v23 = objc_msgSend_configuration(self, v26, v27, v28);
    objc_msgSend_setContainer_(v23, v29, (uint64_t)v8, v30);
  }
}

- (void)setPerRecordProgressBlock:(id)a3
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
    v14[2] = sub_18B0C5738;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordProgressBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordProgressBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordProgressBlock = self->_perRecordProgressBlock;
    self->_id perRecordProgressBlock = v11;
LABEL_9:
  }
}

- (id)perRecordProgressBlock
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
    id v15 = sub_18AF13E40;
    uint64_t v16 = sub_18AF13900;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C5930;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perRecordProgressBlock);
  }

  return v8;
}

- (void)setPerRecordCompletionBlock:(id)a3
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
    v14[2] = sub_18B0C5ABC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordCompletionBlock = self->_perRecordCompletionBlock;
    self->_id perRecordCompletionBlock = v11;
LABEL_9:
  }
}

- (id)perRecordCompletionBlock
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
    id v15 = sub_18AF13E40;
    uint64_t v16 = sub_18AF13900;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C5CB4;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perRecordCompletionBlock);
  }

  return v8;
}

- (void)setCodeOperationCompletionBlock:(id)a3
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
    v14[2] = sub_18B0C5E40;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id codeOperationCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_codeOperationCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id codeOperationCompletionBlock = self->_codeOperationCompletionBlock;
    self->_id codeOperationCompletionBlock = v11;
LABEL_9:
  }
}

- (id)codeOperationCompletionBlock
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
    id v15 = sub_18AF13E40;
    uint64_t v16 = sub_18AF13900;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C6038;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_codeOperationCompletionBlock);
  }

  return v8;
}

- (void)setIncompleteResponsePreviewBlock:(id)a3
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
    v14[2] = sub_18B0C61C4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id incompleteResponsePreviewBlock = v15;
    goto LABEL_9;
  }
  if (self->_incompleteResponsePreviewBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id incompleteResponsePreviewBlock = self->_incompleteResponsePreviewBlock;
    self->_id incompleteResponsePreviewBlock = v11;
LABEL_9:
  }
}

- (id)incompleteResponsePreviewBlock
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
    id v15 = sub_18AF13E40;
    uint64_t v16 = sub_18AF13900;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C63BC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_incompleteResponsePreviewBlock);
  }

  return v8;
}

- (void)setDidSubstituteRequestRecordTransportsBlock:(id)a3
{
  id v8 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v5, v6, v7))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v5, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (v8 && !__sTestOverridesAvailable)
  {
    id v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"CKCodeOperation.m", 92, @"Only suitable for testing");
  }
  if (objc_msgSend_queueHasStarted(self, v5, v6, v7)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v14 = objc_msgSend_callbackQueue(self, v9, v10, v11);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18B0C6594;
    v17[3] = &unk_1E5460058;
    v17[4] = self;
    id v18 = v8;
    dispatch_sync(v14, v17);

    id didSubstituteRequestRecordTransportsBlock = v18;
    goto LABEL_12;
  }
  if (self->_didSubstituteRequestRecordTransportsBlock != v8)
  {
    uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
    id didSubstituteRequestRecordTransportsBlock = self->_didSubstituteRequestRecordTransportsBlock;
    self->_id didSubstituteRequestRecordTransportsBlock = v12;
LABEL_12:
  }
}

- (id)didSubstituteRequestRecordTransportsBlock
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
    id v15 = sub_18AF13E40;
    uint64_t v16 = sub_18AF13900;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C678C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_didSubstituteRequestRecordTransportsBlock);
  }

  return v8;
}

- (BOOL)hasCKOperationCallbacksSet
{
  v21.receiver = self;
  v21.super_class = (Class)CKCodeOperation;
  if ([(CKOperation *)&v21 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perRecordCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perRecordProgressBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v18 = objc_msgSend_codeOperationCompletionBlock(self, v11, v12, v13);
      if (v18)
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_incompleteResponsePreviewBlock(self, v15, v16, v17);
        BOOL v6 = v19 != 0;
      }
    }
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  BOOL v6 = objc_msgSend_codeService(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
  }
  else
  {
    uint64_t v13 = objc_msgSend_serviceName(self, v7, v8, v9);

    if (!v13)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKErrorDomain", 12, @"You must a enqueue this on a CKCodeService, b) set the codeService property, or c) use the deprecated initializer to specify a serviceName at init-time"));
        goto LABEL_17;
      }
      return 0;
    }
  }
  uint64_t v14 = objc_msgSend_request(self, v10, v11, v12);

  if (v14)
  {
    id v18 = objc_msgSend_resolvedConfiguration(self, v15, v16, v17);
    int isLongLived = objc_msgSend_isLongLived(v18, v19, v20, v21);

    if (isLongLived)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v23, @"CKErrorDomain", 12, @"This operation cannot be long lived");
LABEL_17:
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        BOOL result = 0;
        *a3 = v32;
        return result;
      }
    }
    else
    {
      if (objc_msgSend_destinationServer(self, v23, v24, v25) != 2
        || (objc_msgSend_destinationServerExplicitURL(self, v26, v27, v28),
            id v29 = objc_claimAutoreleasedReturnValue(),
            v29,
            v29))
      {
        v33.receiver = self;
        v33.super_class = (Class)CKCodeOperation;
        return [(CKDatabaseOperation *)&v33 CKOperationShouldRun:a3];
      }
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, @"CKErrorDomain", 12, @"You must provide a destinationServerExplictURL if you specify destinationServer == .explicitURL");
        goto LABEL_17;
      }
    }
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKErrorDomain", 12, @"You must provide a non-nil request");
    goto LABEL_17;
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCodeOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_request(self, a2, v2, v3);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v10 = objc_msgSend_request(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_extractRecordTransports(v10, v11, v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v14;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend_contents(v25, v19, v20, v21) != 1)
        {
          v34 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKErrorDomain", 12, @"Request RecordTransport had unexpected contents: %@", v25);
          objc_msgSend_finishWithError_(self, v35, (uint64_t)v34, v36);

          goto LABEL_14;
        }
        id v29 = objc_msgSend_localSerialization(v25, v26, v27, v28);
        objc_msgSend_addObject_(v15, v30, (uint64_t)v29, v31);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v22) {
        continue;
      }
      break;
    }
  }

  objc_msgSend_setRequestLocalSerializations_(self, v32, (uint64_t)v15, v33);
  v37.receiver = self;
  v37.super_class = (Class)CKCodeOperation;
  [(CKOperation *)&v37 performCKOperation];
LABEL_14:
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
    char v6 = v5;
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
      id v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      long long v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      v45 = CKStringForDiscretionaryNetworkBehavior(v44);
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCodeOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  char v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCodeOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/code-operation-objc", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (Class)operationInfoClass
{
  return (Class)objc_opt_class();
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_codeService(self, v5, v6, v7);
  uint64_t v15 = objc_msgSend_serviceName(v8, v9, v10, v11);
  if (v15)
  {
    objc_msgSend_setServiceName_(v4, v12, (uint64_t)v15, v14);
  }
  else
  {
    uint64_t v16 = objc_msgSend_serviceName(self, v12, v13, v14);
    objc_msgSend_setServiceName_(v4, v17, (uint64_t)v16, v18);
  }
  uint64_t v22 = objc_msgSend_functionName(self, v19, v20, v21);
  objc_msgSend_setFunctionName_(v4, v23, (uint64_t)v22, v24);

  uint64_t v28 = objc_msgSend_requestLocalSerializations(self, v25, v26, v27);
  objc_msgSend_setRequestLocalSerializations_(v4, v29, (uint64_t)v28, v30);

  uint64_t v34 = objc_msgSend_codeService(self, v31, v32, v33);

  if (v34)
  {
    uint64_t v38 = objc_msgSend_codeService(self, v35, v36, v37);
    uint64_t v42 = objc_msgSend_serviceInstanceURL(v38, v39, v40, v41);
    objc_msgSend_setClientRuntimeProvidedServiceURL_(v4, v43, (uint64_t)v42, v44);

    uint64_t v48 = objc_msgSend_codeService(self, v45, v46, v47);
    uint64_t v52 = objc_msgSend_boxedDatabaseScope(v48, v49, v50, v51);
    objc_msgSend_setEnqueuedOnContainerService_(v4, v53, v52 == 0, v54);

LABEL_6:
    goto LABEL_13;
  }
  uint64_t v58 = objc_msgSend_destinationServer(self, v35, v36, v37);
  switch(v58)
  {
    case 2:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 1, v57);
      uint64_t v48 = objc_msgSend_destinationServerExplicitURL(self, v59, v60, v61);
      objc_msgSend_setClientRuntimeProvidedServiceURL_(v4, v62, (uint64_t)v48, v63);
      goto LABEL_6;
    case 1:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 1, v57);
      break;
    case 0:
      objc_msgSend_setLegacyIsLocalBit_(v4, v55, 0, v57);
      break;
  }
LABEL_13:
  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v55, v56, v57);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v4, v65, AssetContentInMemory, v66);
  v67.receiver = self;
  v67.super_class = (Class)CKCodeOperation;
  [(CKDatabaseOperation *)&v67 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_currentHandler(v5, v7, v8, v9);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, @"CKCodeOperation.m", 195, @"You cannot inflate a CKCodeOperation from operation info; they are not suitable as long lived operations");

  v12.receiver = self;
  v12.super_class = (Class)CKCodeOperation;
  [(CKDatabaseOperation *)&v12 fillFromOperationInfo:v6];
}

+ (id)operationDaemonCallbackProtocol
{
  return &unk_1ED861988;
}

- (void)setDestinationServerExplicitURL:(id)a3
{
  BOOL v4 = a3 != 0;
  objc_storeStrong((id *)&self->_destinationServerExplicitURL, a3);
  self->_destinationServer = 2 * v4;
}

- (void)handleReplaceLocalWithWireSerializations:(id)a3 encryptedMasterKeys:(id)a4 wireEnvelopes:(id)a5 reply:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *, void))a6;
  if (!objc_msgSend_count(v9, v12, v13, v14)) {
    goto LABEL_12;
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_18B0C7560;
  v50[3] = &unk_1E5463D90;
  id v51 = v10;
  uint64_t v20 = objc_msgSend_CKMapWithIndex_(v9, v18, (uint64_t)v50, v19);
  uint64_t v24 = objc_msgSend_request(self, v21, v22, v23);
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    id v29 = objc_msgSend_request(self, v26, v27, v28);
    objc_msgSend_substituteRecordTransports_(v29, v30, (uint64_t)v20, v31);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v35 = (void *)ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v29 = v35;
    uint64_t v49 = objc_msgSend_request(self, v46, v47, v48);
    *(_DWORD *)buf = 138412290;
    v53 = v49;
    _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Found wire serializations to substitute, but request claims to not support substituting: %@", buf, 0xCu);
  }
LABEL_8:
  if (__sTestOverridesAvailable)
  {
    uint64_t v36 = objc_msgSend_didSubstituteRequestRecordTransportsBlock(self, v32, v33, v34);

    if (v36)
    {
      objc_msgSend_didSubstituteRequestRecordTransportsBlock(self, v37, v38, v39);
      uint64_t v40 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v40[2]();
    }
  }

LABEL_12:
  uint64_t v41 = objc_msgSend_request(self, v15, v16, v17);
  v45 = objc_msgSend_data(v41, v42, v43, v44);
  v11[2](v11, v45, 0);
}

- (void)handleInitialResponseReceived:(id)a3 reply:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v11 = objc_msgSend_responseClass(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_alloc(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_initWithData_(v15, v16, (uint64_t)v6, v17);
  objc_msgSend_setResponse_(self, v19, (uint64_t)v18, v20);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v24 = objc_msgSend_extractRecordTransports(v18, v21, v22, v23);
  }
  else
  {
    uint64_t v24 = 0;
  }
  char v25 = objc_opt_new();
  if (objc_msgSend_count(v24, v26, v27, v28))
  {
    id v89 = v6;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v32 = v24;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v90, (uint64_t)v96, 16);
    if (v34)
    {
      uint64_t v38 = v34;
      uint64_t v39 = *(void *)v91;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v91 != v39) {
            objc_enumerationMutation(v32);
          }
          uint64_t v41 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          if (objc_msgSend_contents(v41, v35, v36, v37) != 2)
          {
            v68 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, @"CKErrorDomain", 12, @"Request RecordTransport had unexpected contents: %@", v41);
            objc_msgSend_finishWithError_(self, v69, (uint64_t)v68, v70);
            v7[2](v7, 0, v68);

            id v6 = v89;
            goto LABEL_28;
          }
          v45 = objc_msgSend_wireSerialization(v41, v42, v43, v44);
          objc_msgSend_addObject_(v25, v46, (uint64_t)v45, v47);
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v90, (uint64_t)v96, 16);
        if (v38) {
          continue;
        }
        break;
      }
    }

    uint64_t v48 = objc_opt_new();
    uint64_t v49 = objc_opt_new();
    if (objc_msgSend_count(v25, v50, v51, v52))
    {
      unint64_t v56 = 0;
      do
      {
        objc_msgSend_addObject_(v49, v53, (uint64_t)v48, v55);
        ++v56;
      }
      while (v56 < objc_msgSend_count(v25, v57, v58, v59));
    }
    uint64_t v60 = objc_msgSend_response(self, v53, v54, v55);
    char v61 = objc_opt_respondsToSelector();

    if (v61)
    {
      v65 = objc_msgSend_response(self, v62, v63, v64);
      objc_msgSend_substituteRecordTransports_(v65, v66, (uint64_t)v49, v67);

      id v6 = v89;
    }
    else
    {
      id v6 = v89;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v71 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v84 = v71;
        v88 = objc_msgSend_response(self, v85, v86, v87);
        *(_DWORD *)buf = 138412290;
        v95 = v88;
        _os_log_error_impl(&dword_18AF10000, v84, OS_LOG_TYPE_ERROR, "Found record transports to substitute, but response claims to not support substituting: %@", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend_count(v25, v29, v30, v31))
  {
    v75 = objc_msgSend_incompleteResponsePreviewBlock(self, v72, v73, v74);

    if (v75)
    {
      objc_msgSend_incompleteResponsePreviewBlock(self, v76, v77, v78);
      v79 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend_response(self, v80, v81, v82);
      ((void (**)(void, void *))v79)[2](v79, v83);
    }
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v25, 0);
LABEL_28:
}

- (void)handleReplaceWireSerializationsWithRecords:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v8 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = v4;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v40, (uint64_t)v46, 16);
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v12, (uint64_t)self, v16, 0, 0, (void)v40);
          uint64_t v17 = [CKCodeRecordTransport alloc];
          uint64_t v20 = objc_msgSend_initWithRecord_(v17, v18, v16, v19);
          objc_msgSend_addObject_(v8, v21, (uint64_t)v20, v22);
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v40, (uint64_t)v46, 16);
      }
      while (v13);
    }

    uint64_t v26 = objc_msgSend_response(self, v23, v24, v25);
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      uint64_t v31 = objc_msgSend_response(self, v28, v29, v30);
      objc_msgSend_substituteRecordTransports_(v31, v32, (uint64_t)v8, v33);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v34 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = v34;
        uint64_t v39 = objc_msgSend_response(self, v36, v37, v38);
        *(_DWORD *)buf = 138412290;
        v45 = v39;
        _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "Found record transports to substitute, but response claims to not support substituting: %@", buf, 0xCu);
      }
    }
  }
}

- (void)handleFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  objc_super v12 = signpost;

  if (v10)
  {
    if (!v12) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    uint64_t v21 = objc_msgSend_log(v17, v18, v19, v20);

    if (self) {
      uint64_t v22 = self->super.super._signpost;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v22;
    uint64_t v27 = objc_msgSend_identifier(v23, v24, v25, v26);

    if ((unint64_t)(v27 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    id v62 = v8;
    __int16 v63 = 2112;
    id v64 = v10;
    uint64_t v28 = "Record %@ fetched with error: %@";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v27;
    uint32_t v31 = 22;
    goto LABEL_20;
  }
  if (!v12) {
    goto LABEL_22;
  }
  if (self) {
    id v32 = self->super.super._signpost;
  }
  else {
    id v32 = 0;
  }
  uint64_t v33 = v32;
  uint64_t v21 = objc_msgSend_log(v33, v34, v35, v36);

  if (self) {
    uint64_t v37 = self->super.super._signpost;
  }
  else {
    uint64_t v37 = 0;
  }
  uint64_t v38 = v37;
  uint64_t v42 = objc_msgSend_identifier(v38, v39, v40, v41);

  if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v8;
    uint64_t v28 = "Record %@ fetched";
    uint64_t v29 = v21;
    os_signpost_id_t v30 = v42;
    uint32_t v31 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v29, OS_SIGNPOST_EVENT, v30, "CKCodeOperation", v28, buf, v31);
  }
LABEL_21:

LABEL_22:
  long long v43 = objc_msgSend_perRecordCompletionBlock(self, v13, v14, v15);

  if (v43)
  {
    if (v9)
    {
      id v60 = v10;
      objc_msgSend__wireUpAssetContentForOperation_inRecord_checkSignatures_outError_(CKOperation, v44, (uint64_t)self, (uint64_t)v9, 0, &v60);
      id v47 = v60;

      id v10 = v47;
    }
    if (objc_msgSend_dropInMemoryAssetContentASAP(self, v44, v45, v46))
    {
      uint64_t v51 = (void *)MEMORY[0x18C12ADA0]();
      objc_msgSend_perRecordCompletionBlock(self, v52, v53, v54);
      uint64_t v55 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id, id))v55)[2](v55, v9, v8, v10);
    }
    else
    {
      objc_msgSend_perRecordCompletionBlock(self, v48, v49, v50);
      unint64_t v56 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id, id))v56)[2](v56, v9, v8, v10);
    }
  }
  if (objc_msgSend_shouldFetchAssetContentInMemory(self, v44, v45, v46)
    && objc_msgSend_dropInMemoryAssetContentASAP(self, v57, v58, v59))
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_assetInfoByArrayIndexByRecordKeyByRecordID, v57, 0, (uint64_t)v8);
  }
  if (v10) {
    objc_msgSend_setResponseError_(self, v57, (uint64_t)v10, v59);
  }
}

- (void)handleFetchForRecordID:(id)a3 didProgress:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v8 = signpost;

  if (v8)
  {
    if (self) {
      objc_super v12 = self->super.super._signpost;
    }
    else {
      objc_super v12 = 0;
    }
    uint64_t v13 = v12;
    uint64_t v17 = objc_msgSend_log(v13, v14, v15, v16);

    if (self) {
      uint64_t v18 = self->super.super._signpost;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = v18;
    os_signpost_id_t v23 = objc_msgSend_identifier(v19, v20, v21, v22);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v29 = 138412546;
      id v30 = v6;
      __int16 v31 = 2048;
      double v32 = a4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v17, OS_SIGNPOST_EVENT, v23, "CKCodeOperation", "Record %@ updated progress %f", (uint8_t *)&v29, 0x16u);
    }
  }
  uint64_t v24 = objc_msgSend_perRecordProgressBlock(self, v9, v10, v11);

  if (v24)
  {
    objc_msgSend_perRecordProgressBlock(self, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, double))v28)[2](v28, v6, a4);
  }
}

- (void)handleAssetDataForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 data:(id)a6 offset:(unint64_t)a7
{
  id v15 = a6;
  uint64_t v14 = objc_msgSend_assetInfoForOperation_recordID_recordKey_arrayIndex_(CKOperation, v12, (uint64_t)self, (uint64_t)a3, a4, a5);
  if (v15) {
    objc_msgSend_writeData_atOffset_(v14, v13, (uint64_t)v15, a7);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKCodeOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    objc_msgSend_responseError(self, v7, v8, v9);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      uint64_t v22 = objc_msgSend_response(self, v7, v8, v9);

      if (v22)
      {
        id v4 = 0;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKErrorDomain", 1, @"No response received");
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  os_signpost_id_t v23 = objc_msgSend_codeOperationCompletionBlock(self, v7, v8, v9);

  if (v23)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v24 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = v24;
      uint64_t v41 = (objc_class *)objc_opt_class();
      uint64_t v42 = NSStringFromClass(v41);
      uint64_t v46 = objc_msgSend_ckShortDescription(self, v43, v44, v45);
      *(_DWORD *)buf = 138544130;
      uint64_t v49 = v42;
      __int16 v50 = 2048;
      uint64_t v51 = self;
      __int16 v52 = 2114;
      uint64_t v53 = v46;
      __int16 v54 = 2112;
      id v55 = v4;
      _os_log_debug_impl(&dword_18AF10000, v40, OS_LOG_TYPE_DEBUG, "Calling codeOperationCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    uint64_t v28 = objc_msgSend_response(self, v25, v26, v27);
    double v32 = v28;
    if (v4)
    {

      double v32 = 0;
    }
    objc_msgSend_codeOperationCompletionBlock(self, v29, v30, v31);
    uint64_t v33 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_CKClientSuitableError(v4, v34, v35, v36);
    ((void (**)(void, void *, void *))v33)[2](v33, v32, v37);

    objc_msgSend_setCodeOperationCompletionBlock_(self, v38, 0, v39);
  }
  v47.receiver = self;
  v47.super_class = (Class)CKCodeOperation;
  [(CKOperation *)&v47 _finishOnCallbackQueueWithError:v4];
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  objc_msgSend_applyDaemonCallbackInterfaceTweaks_(CKCodeFunctionInvokeOperation, v5, (uint64_t)v4, v6);
  objc_msgSend_applyDaemonCallbackInterfaceTweaks_(CKFetchRecordsOperation, v7, (uint64_t)v4, v8);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKCodeOperation;
  objc_msgSendSuper2(&v9, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSMutableDictionary)assetInfoByArrayIndexByRecordKeyByRecordID
{
  return self->_assetInfoByArrayIndexByRecordKeyByRecordID;
}

- (void)setAssetInfoByArrayIndexByRecordKeyByRecordID:(id)a3
{
}

- (CKCodeOperationMessageMutation)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContentInMemory = a3;
}

- (CKCodeService)codeService
{
  return self->_codeService;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int64_t)destinationServer
{
  return self->_destinationServer;
}

- (void)setDestinationServer:(int64_t)a3
{
  self->_destinationServer = a3;
}

- (NSURL)destinationServerExplicitURL
{
  return self->_destinationServerExplicitURL;
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
}

- (CKCodeOperationMessageMutation)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
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
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_destinationServerExplicitURL, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_codeService, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_didSubstituteRequestRecordTransportsBlock, 0);
  objc_storeStrong(&self->_incompleteResponsePreviewBlock, 0);
  objc_storeStrong(&self->_codeOperationCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);

  objc_storeStrong((id *)&self->_assetInfoByArrayIndexByRecordKeyByRecordID, 0);
}

@end