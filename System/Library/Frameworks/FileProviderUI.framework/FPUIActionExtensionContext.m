@interface FPUIActionExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (NSError)setupError;
- (NSFileProviderDomainIdentifier)domainIdentifier;
- (NSURL)initialURL;
- (id)_remoteContext;
- (void)cancelRequestWithError:(NSError *)error;
- (void)completeRequest;
- (void)completeRequestWithUserInfo:(id)a3;
- (void)didEncounterError:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)setDomainIdentifier:(id)a3;
- (void)setInitialURL:(id)a3;
- (void)setSetupError:(id)a3;
@end

@implementation FPUIActionExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[FPUIActionRemoteContext _extensionAuxiliaryVendorProtocol];
}

- (void)completeRequest
{
}

- (void)completeRequestWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(FPUIActionExtensionContext *)self _remoteContext];
  [v5 _completeRequestWithUserInfo:v4 error:0];
}

- (void)cancelRequestWithError:(NSError *)error
{
  id v4 = error;
  [(FPUIActionExtensionContext *)self setSetupError:v4];
  id v5 = [(FPUIActionExtensionContext *)self _remoteContext];
  v6 = [(NSError *)v4 fp_strippedError];
  [v5 _completeRequestWithUserInfo:0 error:v6];

  v7.receiver = self;
  v7.super_class = (Class)FPUIActionExtensionContext;
  [(FPUIActionExtensionContext *)&v7 cancelRequestWithError:v4];
}

- (void)didEncounterError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FPUIActionExtensionContext *)self setSetupError:v7];
  id v9 = [(FPUIActionExtensionContext *)self _remoteContext];
  v8 = objc_msgSend(v7, "fp_strippedError");

  [v9 _didEncounterError:v8 completionHandler:v6];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[FPUIActionRemoteContext _extensionAuxiliaryHostProtocol];
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FPUIActionExtensionContext *)self _remoteContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_264C6CFC8;
  id v11 = v6;
  id v9 = v6;
  [v8 _openExtensionURL:v7 completionHandler:v10];
}

void __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke_2;
  v3[3] = &unk_264C6CD88;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (id)_remoteContext
{
  v2 = [(FPUIActionExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];

  return v3;
}

void __44__FPUIActionExtensionContext__remoteContext__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fpuiLogHandle;
  if (!fpuiLogHandle)
  {
    FPUIInitLogging();
    v3 = fpuiLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__FPUIActionExtensionContext__remoteContext__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (NSFileProviderDomainIdentifier)domainIdentifier
{
  return (NSFileProviderDomainIdentifier)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSURL)initialURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialURL:(id)a3
{
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

void __44__FPUIActionExtensionContext__remoteContext__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BE4000, a2, OS_LOG_TYPE_ERROR, "Remote context proxy failed with error (%@)", (uint8_t *)&v2, 0xCu);
}

@end