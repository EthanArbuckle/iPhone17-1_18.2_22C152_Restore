@interface CRKInstructorExtensionProxy
+ (id)sharedExtensionProxy;
- (BOOL)proxiesContainClassroomApp:(id)a3;
- (CRKInstructorExtensionProxy)init;
- (id)extensionAttributesForExtensionIdentifier:(id)a3 containingAppURL:(id)a4;
- (void)applicationInstallsDidStart:(id)a3;
- (void)beginExtensionRequestWithCompletionBlock:(id)a3;
- (void)configureInstructorExtensionAfterFetchError:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)establishEndpointWithCompletionBlock:(id)a3;
- (void)fetchListenerEndpointForExtensionBundleIdentifier:(id)a3 fromClassroomBundleWithURL:(id)a4 completionBlock:(id)a5;
- (void)fetchListenerEndpointWithCompletionBlock:(id)a3;
- (void)resetExtension;
@end

@implementation CRKInstructorExtensionProxy

+ (id)sharedExtensionProxy
{
  if (sharedExtensionProxy_onceToken != -1) {
    dispatch_once(&sharedExtensionProxy_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)sharedExtensionProxy_extension;

  return v2;
}

uint64_t __51__CRKInstructorExtensionProxy_sharedExtensionProxy__block_invoke()
{
  sharedExtensionProxy_extension = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(LSApplicationWorkspace *)self->mWorkspace removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CRKInstructorExtensionProxy;
  [(CRKInstructorExtensionProxy *)&v3 dealloc];
}

- (CRKInstructorExtensionProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKInstructorExtensionProxy;
  v2 = [(CRKInstructorExtensionProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
    mWorkspace = v2->mWorkspace;
    v2->mWorkspace = (LSApplicationWorkspace *)v3;

    [(LSApplicationWorkspace *)v2->mWorkspace addObserver:v2];
  }
  return v2;
}

- (void)resetExtension
{
  if (self->mContextIdentifier) {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->mInstructorExtension, "cancelExtensionRequestWithIdentifier:");
  }
  mInstructorExtension = self->mInstructorExtension;
  self->mInstructorExtension = 0;

  mContextIdentifier = self->mContextIdentifier;
  self->mContextIdentifier = 0;
}

- (void)fetchListenerEndpointWithCompletionBlock:(id)a3
{
}

- (void)fetchListenerEndpointForExtensionBundleIdentifier:(id)a3 fromClassroomBundleWithURL:(id)a4 completionBlock:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    v24 = NSStringFromSelector(a2);
    [v23 handleFailureInMethod:a2, self, @"CRKInstructorExtensionProxy.m", 75, @"%@ must be called from the main thread", v24 object file lineNumber description];

    if (!v11) {
      goto LABEL_16;
    }
  }
  if (self->mInstructorExtension)
  {
    [(CRKInstructorExtensionProxy *)self beginExtensionRequestWithCompletionBlock:v11];
  }
  else
  {
    if (v9)
    {
      v12 = (__CFString *)v9;
    }
    else
    {
      v13 = +[CRKClassroomInstallation preferredInstallation];
      uint64_t v14 = [v13 instructordBundleIdentifier];
      v15 = (void *)v14;
      v16 = @"com.apple.classroom.instructord";
      if (v14) {
        v16 = (__CFString *)v14;
      }
      v12 = v16;
    }
    v17 = _CRKLogGeneral_6();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v10 path];
      *(_DWORD *)buf = 138543618;
      v31 = v12;
      __int16 v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_224C00000, v17, OS_LOG_TYPE_DEFAULT, "Connecting to instructord with identifier %{public}@ in Classroom App with path %@", buf, 0x16u);
    }
    if (v10)
    {
      id v19 = [(CRKInstructorExtensionProxy *)self extensionAttributesForExtensionIdentifier:v12 containingAppURL:v10];
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x263F08800];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke;
      v25[3] = &unk_2646F4968;
      objc_copyWeak(&v28, (id *)buf);
      id v26 = v9;
      id v27 = v11;
      [v20 extensionsWithMatchingAttributes:v19 completion:v25];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v29 = 0;
      v21 = [MEMORY[0x263F08800] extensionWithIdentifier:v12 error:&v29];
      id v19 = v29;
      mInstructorExtension = self->mInstructorExtension;
      self->mInstructorExtension = v21;

      [(CRKInstructorExtensionProxy *)self configureInstructorExtensionAfterFetchError:v19 completionBlock:v11];
    }
  }
LABEL_16:
}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2;
  block[3] = &unk_2646F4940;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[4];
  id v13 = a1[5];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[2])
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    id v5 = *(void **)(a1 + 32);
    if (v4 == 1)
    {
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      id v7 = (void *)v3[2];
      v3[2] = v6;

      [v3 configureInstructorExtensionAfterFetchError:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 56)];
    }
    else
    {
      if (!v5 || *(void *)(a1 + 40))
      {
        id v8 = _CRKLogGeneral_6();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2_cold_1(a1, v8);
        }
      }
      id v9 = _CRKLogGeneral_6();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "Failing back to fetching instructord by bundleID", v10, 2u);
      }

      [v3 fetchListenerEndpointForExtensionBundleIdentifier:*(void *)(a1 + 48) fromClassroomBundleWithURL:0 completionBlock:*(void *)(a1 + 56)];
    }
  }
}

- (void)configureInstructorExtensionAfterFetchError:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    id v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKInstructorExtensionProxy.m", 129, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  if (self->mInstructorExtension)
  {
    objc_initWeak(&location, self);
    mInstructorExtension = self->mInstructorExtension;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke;
    v19[3] = &unk_2646F4990;
    objc_copyWeak(&v20, &location);
    [(NSExtension *)mInstructorExtension setRequestCompletionBlock:v19];
    id v10 = self->mInstructorExtension;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_2;
    v17[3] = &unk_2646F49B8;
    objc_copyWeak(&v18, &location);
    [(NSExtension *)v10 setRequestCancellationBlock:v17];
    id v11 = self->mInstructorExtension;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_3;
    v15[3] = &unk_2646F49E0;
    objc_copyWeak(&v16, &location);
    [(NSExtension *)v11 setRequestInterruptionBlock:v15];
    [(CRKInstructorExtensionProxy *)self beginExtensionRequestWithCompletionBlock:v8];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v8[2](v8, 0, v7);
  }
  else
  {
    id v12 = CRKErrorWithCodeAndUserInfo(101, 0);
    v8[2](v8, 0, v12);
  }
}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:sel_resetExtension withObject:0 waitUntilDone:0];
}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:sel_resetExtension withObject:0 waitUntilDone:0];
}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:sel_resetExtension withObject:0 waitUntilDone:0];
}

- (void)beginExtensionRequestWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!self->mInstructorExtension)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CRKInstructorExtensionProxy.m" lineNumber:152 description:@"Must retrieve the instructor extension before attempting to establish the endpoint"];
  }
  if (self->mContextIdentifier)
  {
    [(CRKInstructorExtensionProxy *)self establishEndpointWithCompletionBlock:v5];
  }
  else
  {
    mInstructorExtension = self->mInstructorExtension;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke;
    v8[3] = &unk_2646F4A08;
    v8[4] = self;
    id v9 = v5;
    [(NSExtension *)mInstructorExtension beginExtensionRequestWithInputItems:0 completion:v8];
  }
}

void __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke_2;
  block[3] = &unk_2646F3CB8;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 establishEndpointWithCompletionBlock:v3];
}

- (void)establishEndpointWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NSExtension *)self->mInstructorExtension _extensionContextForUUID:self->mContextIdentifier];
  uint64_t v6 = [v5 _auxiliaryConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke;
  v12[3] = &unk_2646F34B0;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_3;
  v10[3] = &unk_2646F4A30;
  id v11 = v7;
  id v9 = v7;
  [v8 listenerEndpointWithCompletion:v10];
}

void __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_4;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)extensionAttributesForExtensionIdentifier:(id)a3 containingAppURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F07FE0]];

  id v8 = [v5 path];

  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F07FB0]];
  id v9 = (void *)[v7 copy];

  return v9;
}

- (BOOL)proxiesContainClassroomApp:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "bundleIdentifier", (void)v10);
        char v8 = CRKIsClassroomBundleIdentifier(v7);

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)applicationInstallsDidStart:(id)a3
{
  if ([(CRKInstructorExtensionProxy *)self proxiesContainClassroomApp:a3])
  {
    [(CRKInstructorExtensionProxy *)self resetExtension];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContextIdentifier, 0);
  objc_storeStrong((id *)&self->mInstructorExtension, 0);

  objc_storeStrong((id *)&self->mWorkspace, 0);
}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch instructord by attributes: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end