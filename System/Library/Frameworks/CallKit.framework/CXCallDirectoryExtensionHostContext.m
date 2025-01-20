@interface CXCallDirectoryExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CXCallDirectoryExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (CXCallDirectoryProviderHostProtocol)delegate;
- (OS_dispatch_queue)queue;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)activate;
- (void)addBlockingEntriesWithData:(id)a3 reply:(id)a4;
- (void)addIdentificationEntriesWithData:(id)a3 reply:(id)a4;
- (void)completeRequestWithReply:(id)a3;
- (void)dealloc;
- (void)isIncrementalLoadingAllowed:(id)a3;
- (void)removeAllBlockingEntriesWithReply:(id)a3;
- (void)removeAllIdentificationEntriesWithReply:(id)a3;
- (void)removeBlockingEntriesWithData:(id)a3 reply:(id)a4;
- (void)removeIdentificationEntriesWithData:(id)a3 reply:(id)a4;
- (void)requestFailedWithError:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CXCallDirectoryExtensionHostContext

- (CXCallDirectoryExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CXCallDirectoryExtensionHostContext;
  v5 = [(CXCallDirectoryExtensionHostContext *)&v10 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.callkit.calldirectoryextensionhostcontext", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;
  }
  return v5;
}

- (void)activate
{
  v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1A6EAF971, v5, 2u);
  }

  v4 = [(CXCallDirectoryExtensionHostContext *)self queue];
  dispatch_activate(v4);
}

- (void)dealloc
{
  [(CXCallDirectoryExtensionHostContext *)self activate];
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryExtensionHostContext;
  [(CXCallDirectoryExtensionHostContext *)&v3 dealloc];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtensionHostContext *)self _auxiliaryConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)requestFailedWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke;
  v10[3] = &unk_1E5CAE2B0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(CXCallDirectoryExtensionHostContext *)self remoteObjectProxyWithErrorHandler:v10];
  [v9 requestFailedWithError:v8 reply:v7];
}

void __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isIncrementalLoadingAllowed:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtensionHostContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CXCallDirectoryExtensionHostContext_isIncrementalLoadingAllowed___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__CXCallDirectoryExtensionHostContext_isIncrementalLoadingAllowed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 isIncrementalLoadingAllowed:*(void *)(a1 + 40)];
}

- (void)addBlockingEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryExtensionHostContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CXCallDirectoryExtensionHostContext_addBlockingEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__CXCallDirectoryExtensionHostContext_addBlockingEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 addBlockingEntriesWithData:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)removeBlockingEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryExtensionHostContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CXCallDirectoryExtensionHostContext_removeBlockingEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__CXCallDirectoryExtensionHostContext_removeBlockingEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 removeBlockingEntriesWithData:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)removeAllBlockingEntriesWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtensionHostContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CXCallDirectoryExtensionHostContext_removeAllBlockingEntriesWithReply___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__CXCallDirectoryExtensionHostContext_removeAllBlockingEntriesWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 removeAllBlockingEntriesWithReply:*(void *)(a1 + 40)];
}

- (void)addIdentificationEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryExtensionHostContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CXCallDirectoryExtensionHostContext_addIdentificationEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__CXCallDirectoryExtensionHostContext_addIdentificationEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 addIdentificationEntriesWithData:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)removeIdentificationEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryExtensionHostContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CXCallDirectoryExtensionHostContext_removeIdentificationEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __81__CXCallDirectoryExtensionHostContext_removeIdentificationEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 removeIdentificationEntriesWithData:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)removeAllIdentificationEntriesWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtensionHostContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CXCallDirectoryExtensionHostContext_removeAllIdentificationEntriesWithReply___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__CXCallDirectoryExtensionHostContext_removeAllIdentificationEntriesWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 removeAllIdentificationEntriesWithReply:*(void *)(a1 + 40)];
}

- (void)completeRequestWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtensionHostContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CXCallDirectoryExtensionHostContext_completeRequestWithReply___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__CXCallDirectoryExtensionHostContext_completeRequestWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 completeRequestWithReply:*(void *)(a1 + 40)];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_6);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;

  return v2;
}

uint64_t __72__CXCallDirectoryExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface_0 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryProviderVendorInterface");

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_6);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_interface_0;

  return v2;
}

uint64_t __70__CXCallDirectoryExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface_0 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryProviderHostInterface");

  return MEMORY[0x1F41817F8]();
}

- (CXCallDirectoryProviderHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallDirectoryProviderHostProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "error: %@", (uint8_t *)&v2, 0xCu);
}

@end