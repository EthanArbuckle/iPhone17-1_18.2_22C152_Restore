@interface ASDRequest
+ (BOOL)supportsSecureCoding;
+ (id)_sharedBroker;
+ (void)cancelAllRequestsWithErrorHandler:(id)a3;
- (ASDRequest)init;
- (ASDRequest)initWithCoder:(id)a3;
- (ASDRequestObserver)observer;
- (ASDRequestProxy)proxy;
- (NSUUID)requestID;
- (id)description;
- (void)_callErrorHandler:(uint64_t)a1 withError:(void *)a2 orDefaultCode:(void *)a3;
- (void)_callErrorHandler:(void *)a3 withError:;
- (void)_cancelWithErrorHandler:(id)a3;
- (void)_notifyObserverOfCompletionWithError:(void *)a1;
- (void)_startWithErrorHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)receiveResponse:(id)a3;
- (void)setObserver:(id)a3;
- (void)setProxy:(id)a3;
@end

@implementation ASDRequest

- (void)encodeWithCoder:(id)a3
{
}

uint64_t __27__ASDRequest__sharedBroker__block_invoke()
{
  qword_1EB4D65D8 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__ASDRequest__callErrorHandler_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_observer);
}

void __45__ASDRequest__submitRequestWithErrorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = ASDLogHandleForCategory(13);
  v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v5;
      id v11 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Request could not be submitted: %{public}@", (uint8_t *)&v14, 0x16u);
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_opt_class();
    v10 = *(void **)(a1 + 32);
    int v14 = 138543874;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = 0;
    id v11 = v9;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@]: Request submitted successfully: %{public}@ error: %{public}@", (uint8_t *)&v14, 0x20u);
LABEL_8:
  }
  [*(id *)(a1 + 32) setProxy:v6];

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v12, v13);
}

- (void)setProxy:(id)a3
{
}

void __37__ASDRequest__startWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) proxy];
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__ASDRequest__startWithErrorHandler___block_invoke_2;
    v12[3] = &unk_1E58B3040;
    id v5 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__ASDRequest__startWithErrorHandler___block_invoke_20;
    v10[3] = &unk_1E58B3040;
    v7 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    [v6 startWithErrorHandler:v10];
  }
  else
  {
    v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v3;
      id v9 = v15;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Cannot start request because submission failed with error: %{public}@", buf, 0x16u);
    }
    -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3);
    -[ASDRequest _notifyObserverOfCompletionWithError:](*(void **)(a1 + 32), v3);
  }
}

- (ASDRequestProxy)proxy
{
  return (ASDRequestProxy *)objc_getProperty(self, a2, 24, 1);
}

+ (id)_sharedBroker
{
  if (_MergedGlobals_49 != -1) {
    dispatch_once(&_MergedGlobals_49, &__block_literal_global_22);
  }
  v2 = (void *)qword_1EB4D65D8;
  return v2;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequest;
  v4 = [(ASDRequest *)&v9 description];
  id v5 = [(ASDRequest *)self requestID];
  id v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@: %@", v4, v6];

  return v7;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)_startWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __37__ASDRequest__startWithErrorHandler___block_invoke;
  id v11 = &unk_1E58B3040;
  uint64_t v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = &v8;
  if (self)
  {
    v7 = +[ASDRequest _sharedBroker];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__ASDRequest__submitRequestWithErrorHandler___block_invoke;
    v14[3] = &unk_1E58B49A0;
    v14[4] = self;
    id v15 = v6;
    [v7 submitRequest:self withReplyHandler:v14];
  }
}

- (ASDRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDRequest;
  v2 = [(ASDRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    requestID = v2->_requestID;
    v2->_requestID = (NSUUID *)v3;
  }
  return v2;
}

- (ASDRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequest;
  id v5 = [(ASDRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v6;
  }
  return v5;
}

void __37__ASDRequest__startWithErrorHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2114;
      id v10 = v3;
      id v6 = v8;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to start with error: %{public}@", (uint8_t *)&v7, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = 0;
    id v6 = v8;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_INFO, "[%{public}@]: Started successfully with error: %{public}@", (uint8_t *)&v7, 0x16u);
    goto LABEL_6;
  }

  -[ASDRequest _callErrorHandler:withError:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3);
}

- (void)_callErrorHandler:(void *)a3 withError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && v5)
  {
    int v7 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__ASDRequest__callErrorHandler_withError___block_invoke;
    v8[3] = &unk_1E58B2E18;
    id v10 = v5;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

+ (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedBroker];
  [v5 cancelAllRequestsWithErrorHandler:v4];
}

- (void)receiveResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543874;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Request %{public}@ received unhandled response: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_callErrorHandler:(uint64_t)a1 withError:(void *)a2 orDefaultCode:(void *)a3
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      id v6 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 508, @"Could not connect to helper daemon", 0, 0);
    }
    -[ASDRequest _callErrorHandler:withError:](a1, v7, v6);
  }
}

- (void)_cancelWithErrorHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ASDRequest *)self proxy];
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__ASDRequest__cancelWithErrorHandler___block_invoke;
    v13[3] = &unk_1E58B3040;
    v13[4] = self;
    id v6 = v4;
    id v14 = v6;
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__ASDRequest__cancelWithErrorHandler___block_invoke_16;
    v11[3] = &unk_1E58B3040;
    v11[4] = self;
    id v12 = v6;
    [v7 cancelWithErrorHandler:v11];
  }
  else if (v4)
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Cannot cancel request that has not yet been started", buf, 0xCu);
    }
    __int16 v9 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 532, @"Request has not been started", 0, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

void __38__ASDRequest__cancelWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain remote proxy with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3);
}

void __38__ASDRequest__cancelWithErrorHandler___block_invoke_16(uint64_t a1, void *a2)
{
}

- (void)_notifyObserverOfCompletionWithError:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 observer];
    if (v4)
    {
      id v5 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__ASDRequest__notifyObserverOfCompletionWithError___block_invoke;
      block[3] = &unk_1E58B2FA8;
      id v7 = v4;
      __int16 v8 = a1;
      id v9 = v3;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __51__ASDRequest__notifyObserverOfCompletionWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) request:*(void *)(a1 + 40) didCompleteWithError:*(void *)(a1 + 48)];
}

void __37__ASDRequest__startWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain remote proxy with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3);
  -[ASDRequest _notifyObserverOfCompletionWithError:](*(void **)(a1 + 32), v3);
}

- (ASDRequestObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (ASDRequestObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

@end