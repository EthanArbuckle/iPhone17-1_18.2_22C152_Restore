@interface ILClassificationUIExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (ILClassificationUIExtensionHostContextDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)classificationResponseForRequest:(id)a3 completion:(id)a4;
- (void)prepareForClassificationRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setReadyForClassificationResponse:(BOOL)a3;
@end

@implementation ILClassificationUIExtensionHostContext

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(ILClassificationUIExtensionHostContext *)self setDelegate:a3];
  [(ILClassificationUIExtensionHostContext *)self setDelegateQueue:v6];
}

- (void)prepareForClassificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ILClassificationUIExtensionHostContext *)self remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  [v5 prepareForClassificationRequest:v4];
}

void __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)classificationResponseForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke;
  v14[3] = &unk_264CD99C0;
  v14[4] = self;
  id v15 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = (void *)MEMORY[0x237E1C9F0](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_3;
  v12[3] = &unk_264CD99E8;
  id v13 = v9;
  id v10 = v9;
  v11 = [(ILClassificationUIExtensionHostContext *)self remoteObjectProxyWithErrorHandler:v12];
  [v11 classificationResponseForRequest:v8 completion:v10];
}

void __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_2;
  block[3] = &unk_264CD9998;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setReadyForClassificationResponse:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = ILDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_2375F8000, v5, OS_LOG_TYPE_DEFAULT, "setReadyForClassificationResponse: %d", buf, 8u);
  }

  uint64_t v6 = [(ILClassificationUIExtensionHostContext *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(ILClassificationUIExtensionHostContext *)self delegateQueue];

    if (v8)
    {
      id v9 = [(ILClassificationUIExtensionHostContext *)self delegateQueue];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__ILClassificationUIExtensionHostContext_setReadyForClassificationResponse___block_invoke;
      v10[3] = &unk_264CD9A10;
      v10[4] = self;
      BOOL v11 = v3;
      dispatch_async(v9, v10);
    }
  }
}

void __76__ILClassificationUIExtensionHostContext_setReadyForClassificationResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 context:*(void *)(a1 + 32) didBecomeReadyForClassificationResponse:*(unsigned __int8 *)(a1 + 40)];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ILClassificationUIExtensionHostContext *)self _auxiliaryConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_classificationUIExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_classificationUIExtensionHostInterface");
}

- (ILClassificationUIExtensionHostContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ILClassificationUIExtensionHostContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "error: %@", (uint8_t *)&v2, 0xCu);
}

@end