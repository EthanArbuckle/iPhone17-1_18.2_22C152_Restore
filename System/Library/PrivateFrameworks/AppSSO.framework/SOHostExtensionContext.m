@interface SOHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (SOExtension)contextExtension;
- (id)remoteContextWithError:(id *)a3;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)canOpenURL:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5;
- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4;
- (void)setContextExtension:(id)a3;
@end

@implementation SOHostExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  return v2;
}

uint64_t __57__SOHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface_0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9C9488];
  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_55_0);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  return v2;
}

uint64_t __59__SOHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface_0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B73F0];
  return MEMORY[0x270F9A758]();
}

- (id)remoteContextWithError:(id *)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v4 = [(SOHostExtensionContext *)self _auxiliaryConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SOHostExtensionContext_remoteContextWithError___block_invoke;
  v7[3] = &unk_26432A390;
  v7[4] = &v8;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];

  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SOHostExtensionContext_remoteContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v15 = "-[SOHostExtensionContext openURL:completionHandler:]";
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2117;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SOHostExtensionContext_openURL_completionHandler___block_invoke;
  v11[3] = &unk_26432AD70;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SOHostExtensionContext *)self canOpenURL:v10 completionHandler:v11];
}

void __52__SOHostExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v23 = *MEMORY[0x263F3F5C0];
    v24[0] = @"com.apple.AppSSO.launch-origin";
    id v3 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v5 = *(void *)(a1 + 32);
    id v14 = 0;
    uint64_t v6 = [v4 openSensitiveURL:v5 withOptions:v3 error:&v14];
    id v7 = v14;

    uint64_t v8 = SO_LOG_SOHostExtensionContext();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"NO";
      uint64_t v16 = 1752392040;
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 141558787;
      if (v6) {
        id v9 = @"YES";
      }
      __int16 v17 = 2117;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      __int16 v20 = v9;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "opened URL %{sensitive, mask.hash}@: success = %{public}@, error = %{public}@", buf, 0x2Au);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v6);
    }
  }
  else
  {
    id v12 = SO_LOG_SOHostExtensionContext();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __52__SOHostExtensionContext_openURL_completionHandler___block_invoke_cold_1(a1, v12);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

- (void)canOpenURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    uint64_t v16 = (uint64_t)"-[SOHostExtensionContext canOpenURL:completionHandler:]";
    __int16 v17 = 2160;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2117;
    __int16 v20 = v6;
    __int16 v21 = 2112;
    id v22 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  id v9 = [MEMORY[0x263F01880] defaultWorkspace];
  id v14 = 0;
  uint64_t v10 = [v9 isApplicationAvailableToOpenURL:v6 error:&v14];
  uint64_t v11 = (SOHostExtensionContext *)v14;

  id v12 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    *(_DWORD *)buf = 141558787;
    uint64_t v16 = 1752392040;
    __int16 v17 = 2117;
    if (v10) {
      uint64_t v13 = @"YES";
    }
    uint64_t v18 = (uint64_t)v6;
    __int16 v19 = 2114;
    __int16 v20 = v13;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_impl(&dword_2185C9000, v12, OS_LOG_TYPE_DEFAULT, "can open URL %{sensitive, mask.hash}@: result = %{public}@, error = %{public}@", buf, 0x2Au);
  }

  if (v7) {
    v7[2](v7, v10);
  }
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "-[SOHostExtensionContext presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = [(SOHostExtensionContext *)self contextExtension];
  [v12 presentAuthorizationViewControllerWithHints:v10 requestIdentifier:v8 completion:v9];
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = SO_LOG_SOHostExtensionContext();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "-[SOHostExtensionContext authorization:didCompleteWithCredential:error:]";
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = [(SOHostExtensionContext *)self contextExtension];
  [v12 authorization:v8 didCompleteWithCredential:v10 error:v9];
}

- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SOHostExtensionContext *)self contextExtension];
  [v8 requestReauthenticationWithRequestIdentifier:v7 completion:v6];
}

- (SOExtension)contextExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextExtension);
  return (SOExtension *)WeakRetained;
}

- (void)setContextExtension:(id)a3
{
}

- (void).cxx_destruct
{
}

void __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2185C9000, a2, OS_LOG_TYPE_ERROR, "Error getting remote context %{public}@", (uint8_t *)&v2, 0xCu);
}

void __52__SOHostExtensionContext_openURL_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 141558275;
  uint64_t v4 = 1752392040;
  __int16 v5 = 2117;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_2185C9000, a2, OS_LOG_TYPE_ERROR, "can not open URL %{sensitive, mask.hash}@", (uint8_t *)&v3, 0x16u);
}

@end