@interface DOCRemoteViewController
+ (BOOL)disableWorkaroundFor132033602;
+ (id)instantiateRemoteDocumentBrowserViewControllerWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6;
+ (id)instantiateRemoteViewControllerWithConfiguration:(id)a3 transparent:(BOOL)a4 errorHandler:(id)a5 hostProxy:(id)a6 completionHandler:(id)a7;
+ (id)serviceExtension;
- (BOOL)isBrowserViewController;
- (DOCAppearance)lastAppearance;
- (DOCConfiguration)configuration;
- (DOCRemoteContext)hostContext;
- (DOCRemoteViewControllerDelegate)delegate;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostContext:(id)a3;
- (void)setIsBrowserViewController:(BOOL)a3;
- (void)setLastAppearance:(id)a3;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 requiresAck:(BOOL)a5 completionBlock:(id)a6;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DOCRemoteViewController

+ (id)instantiateRemoteViewControllerWithConfiguration:(id)a3 transparent:(BOOL)a4 errorHandler:(id)a5 hostProxy:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [[DOCWeakProxy alloc] initWithTarget:v14];
  v17 = [a1 serviceExtension];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke;
  v35[3] = &unk_2641B1AC0;
  id v18 = v13;
  id v38 = v18;
  id v40 = a1;
  id v19 = v12;
  id v36 = v19;
  id v20 = v15;
  id v39 = v20;
  v21 = v16;
  v37 = v21;
  v22 = +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:v17 completion:v35];

  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v23 = objc_msgSend(v22, "view", 0);
    v24 = [v23 subviews];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) setBackgroundColor:0];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v26);
    }
  }
  v29 = (void *)[v19 copy];
  [v22 setConfiguration:v29];

  return v22;
}

void __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v16[1] = MEMORY[0x263EF8330];
    v16[2] = 3221225472;
    v16[3] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_2;
    v16[4] = &unk_2641B10D0;
    BOOL v10 = &v18;
    id v18 = *(id *)(a1 + 48);
    id v17 = v9;
    DOCRunInMainThread();
    v11 = v17;
  }
  else
  {
    id v12 = [*(id *)(a1 + 64) serviceExtension];
    id v13 = [v12 _extensionContextForUUID:v7];
    [v8 setHostContext:v13];

    [v8 setConfiguration:*(void *)(a1 + 32)];
    id v14 = [v8 hostContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_3;
    v15[3] = &unk_2641B12C8;
    BOOL v10 = (id *)v16;
    v16[0] = *(id *)(a1 + 48);
    v11 = [v14 serviceProxyWithErrorHandler:v15];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  DOCRunInMainThread();
}

uint64_t __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)instantiateRemoteDocumentBrowserViewControllerWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  id v14 = v10;
  id v34 = v14;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke;
  v30[3] = &unk_2641B1B10;
  id v15 = v13;
  id v31 = v15;
  long long v32 = v33;
  v16 = (void *)MEMORY[0x21668E400](v30);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_3;
  v26[3] = &unk_2641B1B60;
  id v17 = v11;
  id v27 = v17;
  id v18 = v12;
  id v28 = v18;
  id v19 = v16;
  id v29 = v19;
  id v20 = (void *)MEMORY[0x21668E400](v26);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_5;
  v24[3] = &unk_2641B12C8;
  id v21 = v19;
  id v25 = v21;
  v22 = [a1 instantiateRemoteViewControllerWithConfiguration:v17 transparent:1 errorHandler:v24 hostProxy:v14 completionHandler:v20];

  _Block_object_dispose(v33, 8);
  return v22;
}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = *(id *)(a1 + 32);
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  DOCRunInMainThread();
}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_4;
  v12[3] = &unk_2641B1B38;
  id v10 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  [a4 configureAsDocumentBrowserWithHostProxy:a3 configuration:v8 initialUIPBrowserState:v9 completionBlock:v12];
}

uint64_t __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, 0);
}

uint64_t __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(DOCRemoteViewController *)self hostContext];
  [v6 updateEditingTo:v5 animated:v4];
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 requiresAck:(BOOL)a5 completionBlock:(id)a6
{
  id v7 = a3;
  id v10 = a6;
  id v8 = v10;
  id v9 = v7;
  DOCRunInMainThread();
}

void __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) lastAppearance];
  if ([v2 isEqual:v3])
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);

    if (!v4)
    {
      if (*(void *)(a1 + 48))
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke_2;
        block[3] = &unk_2641B1080;
        id v7 = *(id *)(a1 + 48);
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      return;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 40) setLastAppearance:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 40) hostContext];
  [v5 updateAppearance:*(void *)(a1 + 32) shouldFlushCA:*(unsigned __int8 *)(a1 + 57) completionBlock:*(void *)(a1 + 48)];
}

uint64_t __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serviceExtension
{
  if (serviceExtension_onceToken != -1) {
    dispatch_once(&serviceExtension_onceToken, &__block_literal_global_56);
  }
  uint64_t v2 = (void *)serviceExtension_browserExtension;
  return v2;
}

void __43__DOCRemoteViewController_serviceExtension__block_invoke()
{
  uint64_t v0 = *MEMORY[0x263F3AB68];
  id v5 = 0;
  v1 = [MEMORY[0x263F08800] extensionWithIdentifier:v0 error:&v5];
  id v2 = v5;
  if (v2)
  {
    id v3 = (NSObject **)MEMORY[0x263F3AC28];
    int v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      int v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__DOCRemoteViewController_serviceExtension__block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)&serviceExtension_browserExtension, v1);
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F3AC28];
  id v6 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[DOCRemoteViewController viewServiceDidTerminateWithError:]();
  }
  id v7 = [(DOCRemoteViewController *)self delegate];

  if (v7)
  {
    id v8 = [(DOCRemoteViewController *)self delegate];
    if ([(id)objc_opt_class() disableWorkaroundFor132033602])
    {
      id v9 = &v14;
      id v14 = v8;
      id v10 = &v15;
      id v15 = v4;
      id v11 = v8;
      DOCRunInMainThread();
    }
    else
    {
      dispatch_time_t v12 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
      block[3] = &unk_2641B0FE0;
      id v9 = &v17;
      id v17 = v8;
      id v10 = &v18;
      id v18 = v4;
      id v13 = v8;
      dispatch_after(v12, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) remoteViewControllerDidTerminateViewServiceWithError:*(void *)(a1 + 40)];
}

uint64_t __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) remoteViewControllerDidTerminateViewServiceWithError:*(void *)(a1 + 40)];
}

+ (BOOL)disableWorkaroundFor132033602
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DisableWorkaroundFor132033602"];

  return v3;
}

- (DOCRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DOCRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DOCRemoteContext)hostContext
{
  return (DOCRemoteContext *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setHostContext:(id)a3
{
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isBrowserViewController
{
  return self->_isBrowserViewController;
}

- (void)setIsBrowserViewController:(BOOL)a3
{
  self->_isBrowserViewController = a3;
}

- (DOCAppearance)lastAppearance
{
  return (DOCAppearance *)objc_getProperty(self, a2, 1520, 1);
}

- (void)setLastAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppearance, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __43__DOCRemoteViewController_serviceExtension__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21361D000, v0, OS_LOG_TYPE_ERROR, "Failed to get the DocumentManager extension with error %@", v1, 0xCu);
}

- (void)viewServiceDidTerminateWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21361D000, v0, OS_LOG_TYPE_ERROR, "The view service did terminate with error: %{public}@", v1, 0xCu);
}

@end