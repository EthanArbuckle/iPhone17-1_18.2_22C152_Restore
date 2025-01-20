@interface QLPreviewExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (QLRemoteItemViewController)remoteItemViewController;
- (id)protocolService;
- (id)protocolServiceWithErrorHandler:(id)a3;
- (void)generatePreviewForURL:(id)a3 completion:(id)a4;
- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3;
- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3;
- (void)getARQLInlineProxyWithCompletionHandler:(id)a3;
- (void)getPrinterProxyWithCompletionHandler:(id)a3;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewControllerDidUpdatePreferredContentSize:(id)a3;
- (void)previewControllerDidUpdateTitle:(id)a3;
- (void)previewControllerWantsFullScreen:(BOOL)a3;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setHostViewControllerProxy:(id)a3;
- (void)setRemoteItemViewController:(id)a3;
@end

@implementation QLPreviewExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[QLPreviewExtensionServiceContext_iOS _extensionAuxiliaryVendorProtocol];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[QLPreviewExtensionServiceContext_iOS _extensionAuxiliaryHostProtocol];
}

- (id)protocolServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(QLPreviewExtensionHostContext *)self _auxiliaryConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__QLPreviewExtensionHostContext_protocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_2642F5E90;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __65__QLPreviewExtensionHostContext_protocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    v7 = [v3 localizedDescription];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Error calling service: %@ #Remote", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (id)protocolService
{
  return [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:0];
}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
}

void __66__QLPreviewExtensionHostContext_previewControllerWantsFullScreen___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained previewControllerWantsFullScreen:*(unsigned __int8 *)(a1 + 40)];
}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __65__QLPreviewExtensionHostContext_previewControllerDidUpdateTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained previewControllerDidUpdateTitle:*(void *)(a1 + 40)];
}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __80__QLPreviewExtensionHostContext_previewControllerDidUpdatePreferredContentSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained previewControllerDidUpdatePreferredContentSize:*(void *)(a1 + 40)];
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v4 previewWillAppear:v3];
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v4 previewDidAppear:v3];
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v4 previewWillDisappear:v3];
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v4 previewDidDisappear:v3];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v7 setAppearance:v6 animated:v4];
}

- (void)setHostViewControllerProxy:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v5 setHostViewControllerProxy:v4];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  id v11 = a4;
  objc_opt_class();
  v12 = v10;
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_alloc(MEMORY[0x263F160E8]);
    v12 = (void *)[v13 initWithURL:v10 sandboxType:*MEMORY[0x263EF8000]];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v19[3] = &unk_2642F5E90;
  id v14 = v9;
  id v20 = v14;
  v15 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v17[3] = &unk_2642F70A0;
  id v18 = v14;
  id v16 = v14;
  [v15 loadPreviewControllerWithContents:v12 context:v11 completionHandler:v17];
}

void __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  QLRunInMainThread();
}

uint64_t __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v8;
  id v7 = v5;
  QLRunInMainThread();
}

uint64_t __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPrinterProxyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke;
  v10[3] = &unk_2642F5E90;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_2642F70C8;
  id v9 = v5;
  id v7 = v5;
  [v6 getPrinterProxyWithCompletionHandler:v8];
}

void __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  QLRunInMainThread();
}

uint64_t __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  QLRunInMainThread();
}

uint64_t __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewExtensionHostContext *)self protocolService];
  [v5 invalidateServiceWithCompletionHandler:v4];
}

- (void)generatePreviewForURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__QLPreviewExtensionHostContext_generatePreviewForURL_completion___block_invoke;
  v10[3] = &unk_2642F5E90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v10];
  [v9 generatePreviewForURL:v8 completion:v7];
}

uint64_t __66__QLPreviewExtensionHostContext_generatePreviewForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__QLPreviewExtensionHostContext_getARQLInlineProxyWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5E90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v7];
  [v6 getARQLInlineProxyWithCompletionHandler:v5];
}

uint64_t __73__QLPreviewExtensionHostContext_getARQLInlineProxyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__QLPreviewExtensionHostContext_getARQLInlineProxy2WithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5E90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v7];
  [v6 getARQLInlineProxy2WithCompletionHandler:v5];
}

uint64_t __74__QLPreviewExtensionHostContext_getARQLInlineProxy2WithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__QLPreviewExtensionHostContext_getARQLInlineProxy3WithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5E90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(QLPreviewExtensionHostContext *)self protocolServiceWithErrorHandler:v7];
  [v6 getARQLInlineProxy3WithCompletionHandler:v5];
}

uint64_t __74__QLPreviewExtensionHostContext_getARQLInlineProxy3WithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (QLRemoteItemViewController)remoteItemViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteItemViewController);

  return (QLRemoteItemViewController *)WeakRetained;
}

- (void)setRemoteItemViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end