@interface FBSOrientationObserver
- (FBSOrientationObserver)init;
- (id)_getAndSetFreshestUpdateGivenUpdate:(id)a3;
- (id)handler;
- (int64_t)activeInterfaceOrientation;
- (void)activeInterfaceOrientationWithCompletion:(id)a3;
- (void)client:(id)a3 handleOrientationUpdate:(id)a4;
- (void)dealloc;
- (void)handleOrientationResetForClient:(id)a3;
- (void)invalidate;
- (void)setHandler:(id)a3;
@end

@implementation FBSOrientationObserver

- (FBSOrientationObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSOrientationObserver;
  if ([(FBSOrientationObserver *)&v3 init]) {
    BSDispatchQueueCreateSerial();
  }
  return 0;
}

- (void)activeInterfaceOrientationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    client = self->_client;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke;
    v7[3] = &unk_1E58F5518;
    v7[4] = self;
    id v8 = v4;
    [(FBSOrientationObserverClient *)client activeInterfaceOrientationWithCompletion:v7];
  }
}

- (void)handleOrientationResetForClient:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FBSOrientationObserver_handleOrientationResetForClient___block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_async(queue, block);
}

void __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke(void *a1)
{
  objc_super v3 = a1 + 4;
  uint64_t v2 = a1[4];
  v6 = *(void **)(v2 + 40);
  id v4 = (id *)(v2 + 40);
  v5 = v6;
  if (v6)
  {
    unint64_t v7 = [v5 sequenceNumber];
    if (v7 <= [(id)a1[5] sequenceNumber])
    {
      v9 = (void *)a1[5];
      uint64_t v10 = *v3;
    }
    else
    {
      id v8 = FBLogInterfaceOrientationObserver();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke_cold_1(v3, a1 + 5, v8);
      }

      v9 = *(void **)(a1[4] + 40);
      uint64_t v10 = *(void *)(a1[6] + 8);
    }
    id v4 = (id *)(v10 + 40);
  }
  else
  {
    v9 = (void *)a1[5];
  }

  objc_storeStrong(v4, v9);
}

void __58__FBSOrientationObserver_handleOrientationResetForClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t __33__FBSOrientationObserver_handler__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getAndSetFreshestUpdateGivenUpdate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

void __57__FBSOrientationObserver_client_handleOrientationUpdate___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _getAndSetFreshestUpdateGivenUpdate:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) handler];
  uint64_t v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);
  }
}

- (id)_getAndSetFreshestUpdateGivenUpdate:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__61;
  v15 = __Block_byref_object_dispose__62;
  id v16 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke;
  block[3] = &unk_1E58F5568;
  block[4] = self;
  id v9 = v16;
  uint64_t v10 = &v11;
  id v5 = v16;
  dispatch_sync(queue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)handler
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__FBSOrientationObserver_handler__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  uint64_t v3 = (void *)MEMORY[0x19F3991F0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__37__FBSOrientationObserver_setHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  result = *(void **)(a1 + 40);
  if (result != *(void **)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v3 = [result copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = FBLogInterfaceOrientationObserver();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)v12 = 134217984;
        *(void *)&v12[4] = v9;
        uint64_t v10 = "<%p>: Registering interest for orientation updates.";
LABEL_7:
        _os_log_impl(&dword_19C680000, v7, OS_LOG_TYPE_DEFAULT, v10, v12, 0xCu);
      }
    }
    else if (v8)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)v12 = 134217984;
      *(void *)&v12[4] = v11;
      uint64_t v10 = "<%p>: Unregistering interest for orientation updates.";
      goto LABEL_7;
    }

    return [*(id *)(*(void *)(a1 + 32) + 8) registerOrientationInterest:*(void *)(*(void *)(a1 + 32) + 32) != 0 _watchdogReportType:*(_OWORD *)v12];
  }
  return result;
}

void __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke_2;
  block[3] = &unk_1E58F54F0;
  block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)client:(id)a3 handleOrientationUpdate:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = FBLogInterfaceOrientationObserver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v12 = self;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Received orientation update: %{public}@.", buf, 0x16u);
  }

  callback_queue = self->_callback_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FBSOrientationObserver_client_handleOrientationUpdate___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(callback_queue, v9);
}

- (void)setHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__FBSOrientationObserver_setHandler___block_invoke;
  v7[3] = &unk_1E58F5450;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"-[FBSOrientationObserver dealloc]"];
  int v3 = 138544130;
  id v4 = v2;
  __int16 v5 = 2114;
  id v6 = @"FBSOrientationObserver.m";
  __int16 v7 = 1024;
  int v8 = 95;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = FBLogInterfaceOrientationObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v7 = self;
    _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "%p: Invalidating client.", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FBSOrientationObserver_invalidate__block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_async(queue, block);
  [(FBSOrientationObserver *)self setHandler:0];
}

uint64_t __36__FBSOrientationObserver_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v4 invalidate];
}

- (int64_t)activeInterfaceOrientation
{
  return [(FBSOrientationObserverClient *)self->_client activeInterfaceOrientation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshestUpdate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

void __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a1 + 40);
  int v6 = 134218498;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "<%p> Received orientation update: %{public}@ with a sequence number less than the last update received %{public}@.", (uint8_t *)&v6, 0x20u);
}

@end