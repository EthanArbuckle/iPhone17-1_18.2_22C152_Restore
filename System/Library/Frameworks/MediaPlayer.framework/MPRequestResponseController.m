@interface MPRequestResponseController
- (MPRequestResponseController)init;
- (MPRequestResponseControllerDelegate)delegate;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)queue;
- (id)_onQueue_stateDictionary;
- (id)request;
- (id)response;
- (void)_onQueue_reloadIfNeeded;
- (void)_onQueue_scheduleRetryAfterInterval:(double)a3;
- (void)_onQueue_updateRequestID;
- (void)_responseDidInvalidate:(id)a3;
- (void)beginAutomaticResponseLoading;
- (void)dealloc;
- (void)endAutomaticResponseLoading;
- (void)reloadIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setNeedsReload;
- (void)setNeedsReloadForSignificantRequestChange;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation MPRequestResponseController

uint64_t __43__MPRequestResponseController_setResponse___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v3 + 80);
      uint64_t v4 = *(void *)(v3 + 88);
      int v33 = 138543618;
      uint64_t v34 = v5;
      __int16 v35 = 2048;
      uint64_t v36 = v4;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Removing observer for %p", (uint8_t *)&v33, 0x16u);
    }

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:*(void *)(a1 + 32) name:MPResponseDidInvalidateNotification object:*(void *)(*(void *)(a1 + 32) + 88)];
  }
  v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
    int v33 = 138543618;
    uint64_t v34 = v9;
    __int16 v35 = 2048;
    uint64_t v36 = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Updating response to %p", (uint8_t *)&v33, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v17 = [(id)result isValid];
    v18 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 80);
        int v33 = 138543362;
        uint64_t v34 = v31;
        _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_INFO, "RRC %{public}@: Needs reload [response invalid before -setResponse:]", (uint8_t *)&v33, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
      v26 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 80);
      int v33 = 138543362;
      uint64_t v34 = v32;
      v28 = "RRC %{public}@: Reloading [response invalid before -setResponse:]";
      v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      goto LABEL_20;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(v20 + 80);
      uint64_t v21 = *(void *)(v20 + 88);
      int v33 = 138543618;
      uint64_t v34 = v22;
      __int16 v35 = 2048;
      uint64_t v36 = v21;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Adding observer for %p", (uint8_t *)&v33, 0x16u);
    }

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:*(void *)(a1 + 32) selector:sel__responseDidInvalidate_ name:MPResponseDidInvalidateNotification object:*(void *)(*(void *)(a1 + 32) + 88)];

    uint64_t result = [*(id *)(a1 + 40) isValid];
    if ((result & 1) == 0)
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 80);
        int v33 = 138543362;
        uint64_t v34 = v25;
        _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [response invalid before -setResponse: after adding observer]", (uint8_t *)&v33, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
      v26 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 80);
      int v33 = 138543362;
      uint64_t v34 = v27;
      v28 = "RRC %{public}@: Reloading [response invalid before -setResponse: after adding observer]";
      v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1952E8000, v29, v30, v28, (uint8_t *)&v33, 0xCu);
LABEL_21:

      return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
    }
  }
  return result;
}

void __60__MPRequestResponseController_beginAutomaticResponseLoading__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Starting automatic reloading", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 24) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 25))
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 80);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [automatic, beginLoading]", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __54__MPRequestResponseController__responseDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_INFO, "RRC %{public}@: Needs reload [response invalid]", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 80);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [automatic, response invalid]", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

- (void)_onQueue_reloadIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    uint64_t v5 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  id request = self->_request;
  if (request)
  {
    if (self->_cancelToken)
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = self->_request;
        *(_DWORD *)buf = 138543362;
        id v26 = v8;
        uint64_t v9 = "RRC %{public}@: Request loading skipped [already loading]";
LABEL_9:
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
      }
    }
    else
    {
      if (!self->_needsReload)
      {
        uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id v19 = self->_request;
        *(_DWORD *)buf = 138543362;
        id v26 = v19;
        uint64_t v9 = "RRC %{public}@: Request loading skipped [not needed]";
        goto LABEL_9;
      }
      self->_needsReload = 0;
      id v11 = request;
      uint64_t v12 = self->_requestID;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        dispatch_assert_queue_not_V2((dispatch_queue_t)self->_calloutQueue);
        calloutQueue = self->_calloutQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke;
        block[3] = &unk_1E57F9EA8;
        block[4] = self;
        dispatch_sync(calloutQueue, block);
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2;
      v20[3] = &unk_1E57F6400;
      v20[4] = self;
      id v21 = v11;
      uint64_t v22 = v12;
      SEL v23 = a2;
      v16 = v12;
      uint64_t v7 = v11;
      char v17 = [v7 performWithCompletion:v20];
      cancelToken = self->_cancelToken;
      self->_cancelToken = v17;
    }
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v10 = self->_request;
      *(_DWORD *)buf = 138543362;
      id v26 = v10;
      uint64_t v9 = "RRC %{public}@: Request loading skipped [no request]";
      goto LABEL_9;
    }
  }
LABEL_16:
}

void __39__MPRequestResponseController_response__block_invoke(uint64_t a1)
{
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (!(v5 | v6))
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPRequestResponseController.m" lineNumber:350 description:@"Must get a response or an error"];
  }
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = v9;
    id v10 = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Request finished loading", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(NSObject **)(v11 + 112);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_85;
  v18[3] = &unk_1E57F63D8;
  v18[4] = v11;
  id v19 = (id)v6;
  id v20 = *(id *)(a1 + 40);
  id v21 = (id)v5;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  id v22 = v13;
  uint64_t v23 = v14;
  id v15 = (id)v5;
  id v16 = (id)v6;
  dispatch_async(v12, v18);
}

void __38__MPRequestResponseController_request__block_invoke(uint64_t a1)
{
}

- (void)setDelegate:(id)a3
{
}

uint64_t __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_86(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 112));
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 didFinishLoadingRequestForController:v4];
  }
  return result;
}

uint64_t __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_39(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disarm];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Delegate %p clearing response with %p", (uint8_t *)&v6, 0x20u);
  }

  return [*(id *)(a1 + 56) setResponse:0];
}

- (void)setRequest:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"MPRequestResponseController.m" lineNumber:69 description:@"Request must be subclass of MPRequest."];
    }
  }
  id v6 = [(MPRequestResponseController *)self request];

  if (v6 != v5)
  {
    [(MPRequestResponseController *)self willChangeValueForKey:@"request"];
    queue = self->_queue;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __42__MPRequestResponseController_setRequest___block_invoke;
    uint64_t v12 = &unk_1E57F9F98;
    id v13 = self;
    id v14 = v5;
    dispatch_async(queue, &v9);
    [(MPRequestResponseController *)self didChangeValueForKey:@"request", v9, v10, v11, v12, v13];
  }
}

- (id)request
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40673;
  uint64_t v10 = __Block_byref_object_dispose__40674;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MPRequestResponseController_request__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_95(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disarm];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138544130;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    id v7 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Delegate %p replacing response with %p", (uint8_t *)&v8, 0x2Au);
  }
  [*(id *)(a1 + 64) setResponse:*(void *)(a1 + 56)];
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 64) + 112), *(dispatch_block_t *)(a1 + 72));
}

- (void)setResponse:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"MPRequestResponseController.m" lineNumber:103 description:@"Response must be subclass of MPResponse."];
    }
  }
  id v6 = [(MPRequestResponseController *)self response];

  if (v6 != v5)
  {
    [(MPRequestResponseController *)self willChangeValueForKey:@"response"];
    queue = self->_queue;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __43__MPRequestResponseController_setResponse___block_invoke;
    __int16 v12 = &unk_1E57F9F98;
    uint64_t v13 = self;
    id v14 = v5;
    dispatch_async(queue, &v9);
    [(MPRequestResponseController *)self didChangeValueForKey:@"response", v9, v10, v11, v12, v13];
  }
}

- (id)response
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40673;
  uint64_t v10 = __Block_byref_object_dispose__40674;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MPRequestResponseController_response__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 88) != 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
}

- (void)_responseDidInvalidate:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MPRequestResponseController__responseDidInvalidate___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_92(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 40) = 0x3FD0000000000000;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16) == *(void *)(a1 + 48))
  {
    id v5 = *(NSObject **)(v2 + 112);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_93;
    block[3] = &unk_1E57F6388;
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v13 = v6;
    uint64_t v14 = v7;
    long long v9 = *(_OWORD *)(a1 + 72);
    id v8 = (id)v9;
    long long v15 = v9;
    dispatch_async(v5, block);
  }
  else
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [retry mismatched request revision]", buf, 0xCu);
    }

    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 112), *(dispatch_block_t *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

void __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543874;
      id v26 = v2;
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2048;
      os_log_type_t v30 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Deferring clearing of %p to delegate %p", buf, 0x20u);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F77968]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_34;
    v21[3] = &unk_1E57F62C0;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    v21[4] = v8;
    id v9 = v2;
    id v22 = v9;
    id v10 = v3;
    id v23 = v10;
    id v11 = (void *)[v7 initWithTimeout:v21 interruptionHandler:9.0];
    uint64_t v12 = *(void *)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_39;
    v16[3] = &unk_1E57F62E8;
    id v17 = v11;
    id v18 = v9;
    id v13 = v10;
    uint64_t v14 = *(void *)(a1 + 32);
    id v19 = v13;
    uint64_t v20 = v14;
    id v15 = v11;
    [v13 controller:v12 defersResponseReplacement:v16];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v2;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Clearing response", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setResponse:0];
  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_85(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_86;
  v36[3] = &unk_1E57F9F98;
  v36[4] = *(void *)(a1 + 32);
  id v3 = v2;
  id v37 = v3;
  char v4 = (void (**)(void))MEMORY[0x19971E0F0](v36);
  if (*(void *)(a1 + 40))
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = objc_opt_class();
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v39 = v6;
      __int16 v40 = 2048;
      uint64_t v41 = v7;
      __int16 v42 = 2114;
      id v43 = v8;
      id v9 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "RRC <%{public}@ %p>: Request failed with error: %{public}@", buf, 0x20u);
    }
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v39 = v12;
      __int16 v40 = 2048;
      uint64_t v41 = v13;
      __int16 v42 = 1024;
      LODWORD(v43) = v10;
      id v14 = v12;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Recovering from error. shouldRetry: %d", buf, 0x1Cu);
    }
    LOBYTE(v11) = v10 != 0;
    if (objc_opt_respondsToSelector())
    {
      LODWORD(v11) = [v3 controller:*(void *)(a1 + 32) shouldRetryFailedRequestWithError:*(void *)(a1 + 40)];
      id v15 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v39 = v16;
        __int16 v40 = 2048;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        id v43 = v3;
        __int16 v44 = 1024;
        int v45 = (int)v11;
        id v18 = v16;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Delegate %p returned shouldRetry: %d", buf, 0x26u);
      }
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(NSObject **)(v19 + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_91;
    block[3] = &unk_1E57F8F88;
    void block[4] = v19;
    id v21 = &v34;
    id v34 = *(id *)(a1 + 40);
    char v35 = (char)v11;
    dispatch_async(v20, block);
    v4[2](v4);
  }
  else
  {
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = *(NSObject **)(v22 + 104);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_92;
    v26[3] = &unk_1E57F63B0;
    v26[4] = v22;
    id v21 = &v27;
    id v27 = *(id *)(a1 + 56);
    id v28 = *(id *)(a1 + 64);
    id v29 = v3;
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 72);
    id v30 = v24;
    uint64_t v32 = v25;
    uint64_t v31 = v4;
    dispatch_async(v23, v26);
  }
}

- (MPRequestResponseControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPRequestResponseControllerDelegate *)WeakRetained;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_2_93(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  char v2 = objc_opt_respondsToSelector();
  id v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      id v5 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      id v34 = v5;
      __int16 v35 = 2048;
      uint64_t v36 = v7;
      __int16 v37 = 2048;
      uint64_t v38 = v6;
      __int16 v39 = 2048;
      uint64_t v40 = v8;
      id v9 = v5;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Deferring replacement of %p to delegate %p", buf, 0x2Au);
    }
    id v10 = objc_alloc(MEMORY[0x1E4F77968]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_94;
    v29[3] = &unk_1E57F62C0;
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 72);
    v29[4] = v11;
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 32);
    uint64_t v12 = (void *)[v10 initWithTimeout:v29 interruptionHandler:9.0];
    uint64_t v13 = *(void *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_95;
    v22[3] = &unk_1E57F6360;
    id v23 = v12;
    id v14 = *(void **)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void **)(a1 + 64);
    id v26 = v15;
    uint64_t v27 = v16;
    id v28 = v17;
    id v18 = v12;
    [v14 controller:v13 defersResponseReplacement:v22];
  }
  else
  {
    if (v4)
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v34 = v19;
      __int16 v35 = 2048;
      uint64_t v36 = v20;
      id v21 = v19;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEBUG, "RRC <%{public}@ %p>: Replacing response", buf, 0x16u);
    }
    [*(id *)(a1 + 56) setResponse:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __45__MPRequestResponseController_setNeedsReload__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
  char v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [request by client]", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 32))
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 80);
      int v11 = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "RRC %{public}@: Canceling request [request by client]", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) cancel];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v4 + 25))
  {
    *(unsigned char *)(v4 + 25) = 1;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
    {
      id v9 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 80);
        int v11 = 138543362;
        uint64_t v12 = v10;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Reloading [automatic, requested by client]", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
    }
  }
}

void __42__MPRequestResponseController_setRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
      int v11 = 138543362;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "RRC %{public}@: Canceling request [request changed]", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) cancel];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 80), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRequestID");
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Needs reload [request changed]", (uint8_t *)&v11, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    id v9 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Reloading [automatic, request changed]", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
  }
}

- (void)_onQueue_updateRequestID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  MSVNanoIDCreateTaggedPointer();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestID = self->_requestID;
  self->_requestID = v3;
}

- (void)beginAutomaticResponseLoading
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPRequestResponseController_beginAutomaticResponseLoading__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setNeedsReloadForSignificantRequestChange
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke;
  block[3] = &unk_1E57F9F20;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v9 + 24))
  {
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_2;
    v6[3] = &unk_1E57F8328;
    v6[4] = self;
    v6[5] = a2;
    dispatch_async(calloutQueue, v6);
  }
  [(MPRequestResponseController *)self setNeedsReload];
  _Block_object_dispose(&v8, 8);
}

- (void)setNeedsReload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPRequestResponseController_setNeedsReload__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (MPRequestResponseController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MPRequestResponseController;
  uint64_t v2 = [(MPRequestResponseController *)&v13 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlayer/MPRequestResponseController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayer/MPRequestResponseController.calloutQueue", v7);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    v2->_retryInterval = 0.25;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__MPRequestResponseController_init__block_invoke;
    v11[3] = &unk_1E57F6298;
    uint64_t v12 = v2;
    v12->_stateHandle = __35__MPRequestResponseController_init__block_invoke((uint64_t)v11);
  }
  return v2;
}

uint64_t __35__MPRequestResponseController_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v3, &location);
  uint64_t v1 = MSVLogAddStateHandler();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
  return v1;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained willBeginLoadingRequestForController:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong(&self->_pendingResponse, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_cancelToken, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_91(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
    int v14 = 138543618;
    id v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Needs reload [failed request]", (uint8_t *)&v14, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48))
  {
    dispatch_queue_t v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 80);
      uint64_t v12 = *(void *)(v10 + 40);
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      id v13 = v9;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_INFO, "RRC <%{public}@ %p>: Scheduling retry after %fs", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_scheduleRetryAfterInterval:", *(double *)(*(void *)(a1 + 32) + 40));
  }
}

void __54__MPRequestResponseController__onQueue_reloadIfNeeded__block_invoke_94(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    dispatch_queue_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a1[7] object:a1[4] file:@"MPRequestResponseController.m" lineNumber:394 description:@"MPRequestResponseController delegate did not call block passed to defersResponseReplacement."];
  }
  id v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    id v7 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "RRC <%{public}@ %p>: Delegate %p timeout replacing response.", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_onQueue_scheduleRetryAfterInterval:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_retryTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = self->_queue;
    uint64_t v6 = dispatch_get_global_queue(21, 0);
    id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v7;

    int v9 = self->_retryTimer;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    __int16 v11 = self->_retryTimer;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke;
    v13[3] = &unk_1E57F6338;
    uint64_t v14 = v5;
    uint64_t v12 = v5;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&a3;
    dispatch_source_set_event_handler(v11, v13);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
    objc_destroyWeak(v15);

    objc_destroyWeak(&location);
  }
}

void __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke_2;
  v3[3] = &unk_1E57F6310;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
  objc_destroyWeak(v4);
}

void __67__MPRequestResponseController__onQueue_scheduleRetryAfterInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 25))
    {
      *((double *)WeakRetained + 5) = fmin(*(double *)(a1 + 40) * 1.20000005, 15.0);
      uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = v3[10];
        int v10 = 138543362;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [retry, failed request]", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(v3, "_onQueue_reloadIfNeeded");
    }
    else
    {
      uint64_t v6 = *((void *)WeakRetained + 6);
      if (v6)
      {
        dispatch_source_cancel(v6);
        id v7 = (void *)v3[6];
        v3[6] = 0;
      }
      dispatch_queue_t v8 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = v3[10];
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "RRC %{public}@: Scheduled reload skipped.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (id)_onQueue_stateDictionary
{
  v22[8] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (__CFString *)self->_request;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self, @"_obj"];
  v22[0] = v6;
  v21[1] = @"automaticLoad";
  id v7 = [NSNumber numberWithBool:self->_shouldAutomaticallyLoad];
  v22[1] = v7;
  v21[2] = @"observers";
  dispatch_queue_t v8 = [NSNumber numberWithInteger:self->_numberOfObservers];
  v22[2] = v8;
  v21[3] = @"needsReload";
  uint64_t v9 = [NSNumber numberWithBool:self->_needsReload];
  int v10 = (void *)v9;
  requestID = (__CFString *)self->_requestID;
  uint64_t v12 = @"<NULL>";
  if (!requestID) {
    requestID = @"<NULL>";
  }
  v22[3] = v9;
  void v22[4] = requestID;
  v21[4] = @"requestID";
  void v21[5] = @"request";
  if (v3) {
    __int16 v13 = v3;
  }
  else {
    __int16 v13 = @"<NULL>";
  }
  response = (__CFString *)self->_response;
  if (!response) {
    response = @"<NULL>";
  }
  v22[5] = v13;
  v22[6] = response;
  v21[6] = @"response";
  v21[7] = @"delegate";
  if (WeakRetained)
  {
    uint64_t v12 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), WeakRetained];
  }
  v22[7] = v12;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];
  __int16 v16 = [v5 dictionaryWithDictionary:v15];

  if (WeakRetained) {
  id v17 = self->_pendingResponse;
  }
  if (v17) {
    [v16 setObject:v17 forKeyedSubscript:@"pendingResponse"];
  }
  __int16 v18 = self->_lastError;
  if (v18) {
    [v16 setObject:v18 forKeyedSubscript:@"lastError"];
  }
  if (self->_retryInterval != 0.25)
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v16 setObject:v19 forKeyedSubscript:@"retryInterval"];
  }

  return v16;
}

- (void)reloadIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPRequestResponseController_reloadIfNeeded__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__MPRequestResponseController_reloadIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_INFO, "RRC %{public}@: Reloading [requested by client]", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reloadIfNeeded");
}

void __72__MPRequestResponseController_setNeedsReloadForSignificantRequestChange__block_invoke_34(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[7] object:a1[4] file:@"MPRequestResponseController.m" lineNumber:212 description:@"MPRequestResponseController delegate did not call block passed to defersResponseReplacement."];
  }
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "RRC %{public}@: Delegate %p timeout replacing response.", (uint8_t *)&v7, 0x16u);
  }
}

- (void)endAutomaticResponseLoading
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MPRequestResponseController_endAutomaticResponseLoading__block_invoke;
  v6[3] = &unk_1E57F9F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MPRequestResponseController.m" lineNumber:173 description:@"Mismatched begin/endAutomaticResponseLoading."];
  }
  _Block_object_dispose(&v7, 8);
}

void __58__MPRequestResponseController_endAutomaticResponseLoading__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 8) < 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && (uint64_t)--*(void *)(*(void *)(a1 + 32) + 8) <= 0)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Ending automatic reloading", (uint8_t *)&v4, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  MEMORY[0x19971B730](self->_stateHandle, a2);
  if (self->_shouldAutomaticallyLoad)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id request = self->_request;
      *(_DWORD *)buf = 138543362;
      id v7 = request;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "RRC %{public}@: Ending automatic reloading [dealloc]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MPRequestResponseController;
  [(MPRequestResponseController *)&v5 dealloc];
}

uint64_t __35__MPRequestResponseController_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  objc_super v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = objc_msgSend(WeakRetained, "_onQueue_stateDictionary");
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end