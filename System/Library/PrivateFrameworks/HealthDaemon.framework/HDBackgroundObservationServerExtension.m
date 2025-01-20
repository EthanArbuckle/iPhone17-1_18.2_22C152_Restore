@interface HDBackgroundObservationServerExtension
- (BOOL)unitTest_notifiedExtensionDueToTimeout;
- (HDBackgroundObservationServerExtension)init;
- (NSString)appIdentifier;
- (NSString)extensionIdentifier;
- (id)_initWithExtension:(id)a3;
- (id)description;
- (id)unitTest_extensionContext;
- (id)unitTest_extensionHostContext;
- (id)unitTest_queue;
- (id)unitTest_sessionUUID;
- (void)connectWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)notifyExtensionOfUpcomingTimeout;
- (void)notifyExtensionOfUpdateForSampleType:(id)a3 completionHandler:(id)a4;
- (void)setUnitTest_notifiedExtensionDueToTimeout:(BOOL)a3;
@end

@implementation HDBackgroundObservationServerExtension

- (HDBackgroundObservationServerExtension)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithExtension:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDBackgroundObservationServerExtension;
  v6 = [(HDBackgroundObservationServerExtension *)&v26 init];
  if (v6)
  {
    v7 = NSString;
    v8 = [v5 identifier];
    v9 = [v7 stringWithFormat:@"extension.%@", v8];
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = HKCreateSerialDispatchQueue();
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_extension, a3);
    uint64_t v14 = [v5 identifier];
    extensionIdentifier = v6->_extensionIdentifier;
    v6->_extensionIdentifier = (NSString *)v14;

    v16 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v6->_extensionIdentifier];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 containingBundle];
      uint64_t v19 = [v18 bundleIdentifier];
      appIdentifier = v6->_appIdentifier;
      v6->_appIdentifier = (NSString *)v19;
    }
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_DEBUG))
    {
      v23 = v21;
      v24 = [v5 identifier];
      v25 = [v5 extensionPointIdentifier];
      *(_DWORD *)buf = 138543618;
      v28 = v24;
      __int16 v29 = 2114;
      v30 = v25;
      _os_log_debug_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEBUG, "Initialized app extension server with extension ID: %{public}@ for extension point ID: %{public}@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E62F70B0;
  aBlock[4] = self;
  id v11 = v4;
  id v5 = _Block_copy(aBlock);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E62F4928;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    _HKInitializeLogging();
    v3 = (os_log_t *)MEMORY[0x1E4F29F00];
    id v4 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "Connecting to app extension: %{public}@", buf, 0xCu);
    }
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    id v28 = 0;
    id v7 = [v6 beginExtensionRequestWithOptions:0 inputItems:0 error:&v28];
    id v8 = v28;
    if (v7)
    {
      id v9 = (void *)[v7 copy];
      id v10 = [*(id *)(*(void *)(a1 + 32) + 8) _extensionContextForUUID:v9];
      uint64_t v11 = [v10 _auxiliaryConnection];
      char v12 = (void *)v11;
      if (v10) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"[%@] app extension failed to get extension context for sessionUUID: %@", *(void *)(*(void *)(a1 + 32) + 64), v9);

        _HKInitializeLogging();
        v15 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 64);
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = v25;
          __int16 v31 = 2114;
          uint64_t v32 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: %{public}@ with error: %{public}@", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v8 = (id)v14;
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v9);
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v10);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_297;
        v27[3] = &unk_1E62F3170;
        v27[4] = *(void *)(a1 + 32);
        uint64_t v22 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v27];
        uint64_t v23 = *(void *)(a1 + 32);
        v24 = *(void **)(v23 + 48);
        *(void *)(v23 + 48) = v22;

        (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48) != 0, v8);
      }

      goto LABEL_22;
    }
    _HKInitializeLogging();
    os_log_t v16 = *v3;
    BOOL v17 = os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v17)
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 64);
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v18;
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)v8;
        uint64_t v19 = "Failed to activate app extension: %{public}@ with error: %{public}@";
        v20 = v16;
        uint32_t v21 = 22;
LABEL_24:
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    else if (v17)
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v26;
      uint64_t v19 = "Failed to activate app extension: %{public}@";
      v20 = v16;
      uint32_t v21 = 12;
      goto LABEL_24;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:

    return;
  }
  v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v2();
}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)disconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDBackgroundObservationServerExtension_disconnect__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __52__HDBackgroundObservationServerExtension_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32))
  {
    [*(id *)(v1 + 48) performCleanup];
    [*(id *)(*(void *)(a1 + 32) + 8) cancelExtensionRequestWithIdentifier:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    __int16 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "Disconnected from app extension: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)notifyExtensionOfUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke;
  aBlock[3] = &unk_1E62F70B0;
  aBlock[4] = self;
  id v16 = v7;
  __int16 v8 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_3;
  block[3] = &unk_1E62F69F0;
  id v13 = v6;
  id v14 = v8;
  void block[4] = self;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(queue, block);
}

void __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) && (uint64_t v3 = *(void **)(v2 + 48)) != 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_302;
    v8[3] = &unk_1E62F2F20;
    uint64_t v4 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v3 didReceiveUpdateForSampleType:v4 completionHandler:v8];
    id v5 = v9;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"app extension has no active connection");
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "No active app extension was found for %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_302(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyExtensionOfUpcomingTimeout
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HDBackgroundObservationServerExtension_notifyExtensionOfUpcomingTimeout__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __74__HDBackgroundObservationServerExtension_notifyExtensionOfUpcomingTimeout__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) && (uint64_t v3 = *(void **)(v2 + 48)) != 0)
  {
    [v3 backgroundObservationExtensionTimeWillExpire];
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v4 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "No active app extension was found for %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"%@: <%p> Extension ID: %@, App Bundle ID: %@", v5, self, self->_extensionIdentifier, self->_appIdentifier];

  return v6;
}

- (id)unitTest_sessionUUID
{
  return self->_sessionUUID;
}

- (id)unitTest_extensionContext
{
  return self->_extensionContext;
}

- (id)unitTest_extensionHostContext
{
  return self->_extensionHostContext;
}

- (id)unitTest_queue
{
  return self->_queue;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (BOOL)unitTest_notifiedExtensionDueToTimeout
{
  return self->_unitTest_notifiedExtensionDueToTimeout;
}

- (void)setUnitTest_notifiedExtensionDueToTimeout:(BOOL)a3
{
  self->_unitTest_notifiedExtensionDueToTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end