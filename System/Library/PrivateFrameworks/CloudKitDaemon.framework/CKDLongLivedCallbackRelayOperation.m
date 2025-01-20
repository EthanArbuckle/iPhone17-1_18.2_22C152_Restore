@interface CKDLongLivedCallbackRelayOperation
- (BOOL)isInvalidated;
- (BOOL)isLongLivedCallbackRelayOperation;
- (BOOL)shouldCheckAppVersion;
- (CKDLongLivedCallbackRelayOperation)operationWithID:(id)a3 receivedCallback:(id)a4;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)cancel;
- (void)main;
- (void)wasUnexpectedlyUnregisteredForOperationID:(id)a3;
@end

@implementation CKDLongLivedCallbackRelayOperation

- (BOOL)isInvalidated
{
  int isCancelled = objc_msgSend_isCancelled(self, a2, v2);
  if (isCancelled) {
    LOBYTE(isCancelled) = objc_msgSend_isFinished(self, v5, v6) ^ 1;
  }
  return isCancelled;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (BOOL)isLongLivedCallbackRelayOperation
{
  return 1;
}

- (void)main
{
  objc_msgSend_deviceContext(self, a2, v2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_operationInfoCache(v11, v4, v5);
  v9 = objc_msgSend_operationID(self, v7, v8);
  objc_msgSend_registerDelegate_forOperationWithID_(v6, v10, (uint64_t)self, v9);
}

- (void)wasUnexpectedlyUnregisteredForOperationID:(id)a3
{
}

- (CKDLongLivedCallbackRelayOperation)operationWithID:(id)a3 receivedCallback:(id)a4
{
  id v19 = a4;
  if ((objc_msgSend_isCancelled(self, v5, v6) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_invocation(v19, (const char *)v19, v7);
    id v11 = objc_msgSend_clientOperationCallbackProxy(self, v9, v10);
    objc_msgSend_setTarget_(v8, v12, (uint64_t)v11);

    objc_msgSend_invoke(v8, v13, v14);
    if (objc_msgSend_isCompletionCallback(v19, v15, v16)) {
      objc_msgSend_finishWithError_(self, v17, 0);
    }
  }
  return (CKDLongLivedCallbackRelayOperation *)MEMORY[0x1F41817F8]();
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_deviceContext(self, v5, v6);
  uint64_t v10 = objc_msgSend_operationInfoCache(v7, v8, v9);
  v13 = objc_msgSend_operationID(self, v11, v12);
  objc_msgSend_unregisterDelegate_forOperationWithID_(v10, v14, (uint64_t)self, v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDLongLivedCallbackRelayOperation;
  [(CKDOperation *)&v15 _finishOnCallbackQueueWithError:v4];
}

- (void)cancel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CKDLongLivedCallbackRelayOperation;
  [(CKDOperation *)&v17 cancel];
  if (objc_msgSend_isExecuting(self, v3, v4))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v8 = *MEMORY[0x1E4F19DD8];
    uint64_t v9 = objc_msgSend_operationID(self, v5, v6);
    id v11 = objc_msgSend_errorWithDomain_code_format_(v7, v10, v8, 1, @"Operation %@ was cancelled", v9);

    objc_msgSend_finishWithError_(self, v12, (uint64_t)v11);
LABEL_3:

    return;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v13 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v11 = v13;
    uint64_t v16 = objc_msgSend_operationID(self, v14, v15);
    *(_DWORD *)buf = 138543362;
    id v19 = v16;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "CallbackRelayOperation %{public}@ was cancelled before starting", buf, 0xCu);

    goto LABEL_3;
  }
}

@end