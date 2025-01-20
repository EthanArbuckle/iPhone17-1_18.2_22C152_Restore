@interface FLViewExtensionLoader
- (BOOL)_setupSessionIfNeeded:(id *)a3;
- (id)remoteViewController;
- (void)_setupSessionWithExtension:(id)a3 completion:(id)a4;
@end

@implementation FLViewExtensionLoader

- (id)remoteViewController
{
  extensionViewController = self->_extensionViewController;
  if (!extensionViewController)
  {
    [(FLHeadlessExtensionLoader *)self _loadExtension:0];
    extensionViewController = self->_extensionViewController;
  }

  return extensionViewController;
}

- (BOOL)_setupSessionIfNeeded:(id *)a3
{
  v5 = [(FLHeadlessExtensionLoader *)self extension];
  v6 = [(FLHeadlessExtensionLoader *)self sessionID];

  if (!v6 && v5)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke;
    v15 = &unk_2645F2310;
    v17 = &v20;
    v18 = &v26;
    v19 = &v32;
    v8 = v7;
    v16 = v8;
    [(FLViewExtensionLoader *)self _setupSessionWithExtension:v5 completion:&v12];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_extensionViewController, (id)v27[5]);
    -[FLHeadlessExtensionLoader setSessionID:](self, "setSessionID:", v21[5], v12, v13, v14, v15);
    if (a3) {
      *a3 = (id) v33[5];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  v9 = [(FLHeadlessExtensionLoader *)self sessionID];
  BOOL v10 = v9 != 0;

  return v10;
}

void __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = _FLLogSystem();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke_cold_1((uint64_t)v9, v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_221DA3000, v11, OS_LOG_TYPE_DEFAULT, "Extension setup: %@ - %@", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
  id v17 = v7;

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v9;
  id v20 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupSessionWithExtension:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke;
  v7[3] = &unk_2645F2338;
  id v8 = v5;
  id v6 = v5;
  [a3 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] listenerEndpoint:0 connectionHandler:v7];
}

void __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    id v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke_cold_1((uint64_t)v5, v6);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (void).cxx_destruct
{
}

void __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221DA3000, a2, OS_LOG_TYPE_ERROR, "Failed to setup extension with error: %@", (uint8_t *)&v2, 0xCu);
}

void __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221DA3000, a2, OS_LOG_TYPE_ERROR, "Failed to instantiate extension controller with error: %@", (uint8_t *)&v2, 0xCu);
}

@end