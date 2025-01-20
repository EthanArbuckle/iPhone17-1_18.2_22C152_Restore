@interface CXExtensionProvider
- (BOOL)requiresProxyingAVAudioSessionState;
- (CXProviderExtensionVendorContext)extensionContext;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)invalidate;
- (void)providerExtensionVendorContext:(id)a3 handledActionTimeout:(id)a4;
- (void)providerExtensionVendorContext:(id)a3 handledAudioSessionActivationStateChangedTo:(BOOL)a4;
- (void)providerExtensionVendorContext:(id)a3 receivedCommittedTransaction:(id)a4;
- (void)setExtensionContext:(id)a3;
@end

@implementation CXExtensionProvider

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (void)invalidate
{
  v3 = [(CXProvider *)self abstractProvider];
  v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CXExtensionProvider_invalidate__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __33__CXExtensionProvider_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "self: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) extensionContext];
  [v4 completeRequestReturningItems:0 completionHandler:0];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  int v5 = [(CXProvider *)self abstractProvider];
  uint64_t v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke;
  v8[3] = &unk_1E5CADC68;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Beginning request with extension context %@ for extension provider %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setExtensionContext:*(void *)(a1 + 32)];
  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v5 extensionContext];
  [v6 setDelegate:v5];

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke_1;
  v9[3] = &unk_1E5CADED0;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = [*(id *)(a1 + 40) extensionContext];
  [v7 _setRequestCleanUpBlock:v9];

  [*(id *)(a1 + 40) registerCurrentConfiguration];
  v8 = [*(id *)(a1 + 40) abstractProvider];
  [v8 sendDidBeginForProvider:*(void *)(a1 + 40)];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained abstractProvider];
  [v1 handleConnectionInterruptionForProvider:WeakRetained];
}

- (void)providerExtensionVendorContext:(id)a3 receivedCommittedTransaction:(id)a4
{
}

- (void)providerExtensionVendorContext:(id)a3 handledActionTimeout:(id)a4
{
}

- (void)providerExtensionVendorContext:(id)a3 handledAudioSessionActivationStateChangedTo:(BOOL)a4
{
  id v5 = [NSNumber numberWithBool:a4];
  [(CXProvider *)self handleAudioSessionActivationStateChangedTo:v5];
}

- (CXProviderExtensionVendorContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end