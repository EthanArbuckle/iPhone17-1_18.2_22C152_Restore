@interface CXExtensionCallSource
- (CXExtensionCallSource)init;
- (CXExtensionCallSource)initWithExtension:(id)a3;
- (CXExtensionCallSource)initWithExtensionIdentifier:(id)a3;
- (CXProviderExtensionHostContext)extensionContext;
- (NSCopying)requestIdentifier;
- (NSExtension)extension;
- (id)bundle;
- (int)processIdentifier;
- (void)beginWithCompletionHandler:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionContext:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation CXExtensionCallSource

- (CXExtensionCallSource)initWithExtension:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v26.receiver = self;
  v26.super_class = (Class)CXExtensionCallSource;
  v7 = [(CXCallSource *)&v26 initWithIdentifier:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_extension, a3);
    objc_initWeak(&location, v7);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke;
    v22[3] = &unk_1E5CADEF8;
    v23 = v7;
    objc_copyWeak(&v24, &location);
    v8 = (void *)MEMORY[0x1AD0C5BA0](v22);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_3;
    v19[3] = &unk_1E5CADF20;
    objc_copyWeak(&v21, &location);
    id v9 = v8;
    id v20 = v9;
    [(NSExtension *)v7->_extension setRequestCompletionBlock:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_2;
    v16[3] = &unk_1E5CADF48;
    objc_copyWeak(&v18, &location);
    id v10 = v9;
    id v17 = v10;
    [(NSExtension *)v7->_extension setRequestCancellationBlock:v16];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_4;
    v13[3] = &unk_1E5CADF70;
    objc_copyWeak(&v15, &location);
    id v11 = v10;
    id v14 = v11;
    [(NSExtension *)v7->_extension setRequestInterruptionBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }

  return v7;
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_2;
  block[3] = &unk_1E5CADED0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExtensionContext:0];
  [WeakRetained setConnected:0];
}

uint64_t __43__CXExtensionCallSource_initWithExtension___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Request completed for extension call source %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 138412546;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Request canceled for extension call source %@: %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__CXExtensionCallSource_initWithExtension___block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Request interrupted for extension call source %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CXExtensionCallSource)initWithExtensionIdentifier:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  int v5 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v4 error:&v10];
  id v6 = v10;
  if (v5)
  {
    uint64_t v7 = [(CXExtensionCallSource *)self initWithExtension:v5];
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CXExtensionCallSource *)(uint64_t)v4 initWithExtensionIdentifier:v8];
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (CXExtensionCallSource)init
{
  return 0;
}

- (id)bundle
{
  v2 = [(CXExtensionCallSource *)self extension];
  v3 = [v2 _extensionBundle];

  return v3;
}

- (int)processIdentifier
{
  v3 = [(CXExtensionCallSource *)self extensionContext];
  id v4 = [v3 _auxiliaryConnection];
  if (v4)
  {
    int v5 = [(CXExtensionCallSource *)self extensionContext];
    id v6 = [v5 _auxiliaryConnection];
    int v7 = [v6 processIdentifier];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CXExtensionCallSource;
    int v7 = [(CXCallSource *)&v9 processIdentifier];
  }

  return v7;
}

- (void)beginWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(CXCallSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to begin extension call source %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) isConnected])
  {
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Extension call source is already connected", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) extension];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E5CADF98;
    int v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v6 beginExtensionRequestWithInputItems:0 completion:v8];
  }
}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5CADE60;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRequestIdentifier:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) extension];
  uint64_t v3 = [v2 _extensionContextForUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setExtensionContext:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 extensionContext];
  [v5 setDelegate:v4];

  id v6 = [*(id *)(a1 + 32) extensionContext];
  int v7 = [v6 _auxiliaryConnection];
  id v8 = [v7 exportedInterface];
  objc_msgSend(v8, "cx_setAllowedClassesForProviderHostProtocol");

  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = CXDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2_cold_1((uint64_t *)(a1 + 48), v11);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Extension call source began successfully with request identifier %@", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 32) setConnected:1];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (CXProviderExtensionHostContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (void)initWithExtensionIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Could not create extension with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Extension call source failed to begin: %@", (uint8_t *)&v3, 0xCu);
}

@end