@interface DDRemoteActionHostContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)protocolService;
- (void)enableUserInteraction:(BOOL)a3;
- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation DDRemoteActionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[DDRemoteActionViewServiceContext _extensionAuxiliaryVendorProtocol];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[DDRemoteActionViewServiceContext _extensionAuxiliaryHostProtocol];
}

- (id)protocolService
{
  v2 = [(DDRemoteActionHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global];

  return v3;
}

void __44__DDRemoteActionHostContext_protocolService__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __44__DDRemoteActionHostContext_protocolService__block_invoke_cold_1(a2);
  }
}

+ (id)_allowedItemPayloadClasses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DDRemoteActionHostContext *)self protocolService];
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke;
    v9[3] = &unk_1E5A854C0;
    id v10 = v7;
    [v8 prepareViewControllerWithContext:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, double, double))v7 + 2))(v7, 0, 0.0, 0.0);
  }
}

void __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke(uint64_t a1, char a2, double a3, double a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A85498;
  id v8 = *(id *)(a1 + 32);
  double v9 = a3;
  double v10 = a4;
  char v11 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)enableUserInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DDRemoteActionHostContext *)self protocolService];
  [v4 enableUserInteraction:v3];
}

void __44__DDRemoteActionHostContext_protocolService__block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 localizedDescription];
  int v2 = 138412290;
  BOOL v3 = v1;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error calling service - %@", (uint8_t *)&v2, 0xCu);
}

@end