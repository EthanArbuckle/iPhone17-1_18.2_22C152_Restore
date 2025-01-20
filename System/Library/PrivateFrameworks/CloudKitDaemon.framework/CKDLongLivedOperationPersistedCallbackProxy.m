@interface CKDLongLivedOperationPersistedCallbackProxy
- (CKDLongLivedOperationPersistedCallbackProxy)initWithOperationID:(id)a3 callbackProtocol:(id)a4 completionSelector:(SEL)a5 operationInfoCache:(id)a6;
- (CKDOperationInfoCache)operationInfoCache;
- (NSString)operationID;
- (Protocol)callbackProtocol;
- (SEL)completionSelector;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addBarrierBlock:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setCallbackProtocol:(id)a3;
- (void)setCompletionSelector:(SEL)a3;
- (void)setOperationID:(id)a3;
- (void)setOperationInfoCache:(id)a3;
@end

@implementation CKDLongLivedOperationPersistedCallbackProxy

- (CKDLongLivedOperationPersistedCallbackProxy)initWithOperationID:(id)a3 callbackProtocol:(id)a4 completionSelector:(SEL)a5 operationInfoCache:(id)a6
{
  v10 = (Protocol *)a4;
  v11 = (CKDOperationInfoCache *)a6;
  v14 = (NSString *)objc_msgSend_copy(a3, v12, v13);
  operationID = self->_operationID;
  self->_operationID = v14;

  callbackProtocol = self->_callbackProtocol;
  self->_callbackProtocol = v10;
  v17 = v10;

  if (a5) {
    v18 = a5;
  }
  else {
    v18 = 0;
  }
  operationInfoCache = self->_operationInfoCache;
  self->_completionSelector = v18;
  self->_operationInfoCache = v11;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend_callbackProtocol(self, a2, (uint64_t)a3);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (MethodDescription.name)
  {
    v8 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v7, (uint64_t)MethodDescription.types);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      v12 = NSStringFromSelector(a3);
      objc_msgSend_callbackProtocol(self, v13, v14);
      v15 = (Protocol *)objc_claimAutoreleasedReturnValue();
      v16 = NSStringFromProtocol(v15);
      int v17 = 138412546;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Unexpectedly found nil for SEL %@ in protocol named %@", (uint8_t *)&v17, 0x16u);
    }
    v8 = 0;
  }
  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v28 = a3;
  objc_msgSend_retainArguments(v28, v4, v5);
  v8 = objc_msgSend_callbackProtocol(self, v6, v7);
  objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v28, v9, 0, v8);

  v12 = (const char *)objc_msgSend_selector(v28, v10, v11);
  if (self->_completionSelector) {
    completionSelector = self->_completionSelector;
  }
  else {
    completionSelector = 0;
  }
  BOOL isEqual = sel_isEqual(v12, completionSelector);
  v15 = [CKDLongLivedOperationPersistedCallback alloc];
  v18 = objc_msgSend_callbackProtocol(self, v16, v17);
  isCompletionCallback = objc_msgSend_initWithProtocol_invocation_isCompletionCallback_(v15, v19, (uint64_t)v18, v28, isEqual);

  v23 = objc_msgSend_operationInfoCache(self, v21, v22);
  v26 = objc_msgSend_operationID(self, v24, v25);
  objc_msgSend_archiveCallback_forOperationID_(v23, v27, (uint64_t)isCompletionCallback, v26);
}

- (void)addBarrierBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (Protocol)callbackProtocol
{
  return self->_callbackProtocol;
}

- (void)setCallbackProtocol:(id)a3
{
}

- (SEL)completionSelector
{
  if (self->_completionSelector) {
    return self->_completionSelector;
  }
  else {
    return 0;
  }
}

- (void)setCompletionSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_completionSelector = v3;
}

- (CKDOperationInfoCache)operationInfoCache
{
  return self->_operationInfoCache;
}

- (void)setOperationInfoCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationInfoCache, 0);
  objc_storeStrong((id *)&self->_callbackProtocol, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end