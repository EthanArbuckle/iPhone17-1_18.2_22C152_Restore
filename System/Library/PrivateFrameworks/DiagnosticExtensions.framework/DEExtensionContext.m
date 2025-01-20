@interface DEExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)hasEntitlement;
- (void)annotatedAttachmentsForParameters:(id)a3 withHandler:(id)a4;
- (void)attachmentListWithHandler:(id)a3;
- (void)attachmentsForParameters:(id)a3 withHandler:(id)a4;
- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3;
- (void)setupWithParameters:(id)a3 withHandler:(id)a4;
- (void)teardownWithParameters:(id)a3 withHandler:(id)a4;
@end

@implementation DEExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  return v2;
}

uint64_t __55__DEExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE562B8];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_116);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  return v2;
}

uint64_t __53__DEExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE544C8];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasEntitlement
{
  v2 = [(DEExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.DiagnosticExtensions.extensionHost"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)attachmentListWithHandler:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v4 = [(DEExtensionContext *)self _principalObject];
    v5 = [v4 attachmentList];
    v6[2](v6, v5);
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)attachmentsForParameters:(id)a3 withHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v8 = [(DEExtensionContext *)self _auxiliaryConnection];
    uint64_t v9 = [v8 processIdentifier];

    objc_initWeak(&location, self);
    v10 = [(DEExtensionContext *)self _principalObject];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke;
    v20[3] = &unk_1E5D305B0;
    objc_copyWeak(&v21, &location);
    v11 = [v10 attachmentsForParameters:v6 withProgressHandler:v20];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "_generateSandboxExtensionTokenForPID:", v9, (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v13);
    }

    v7[2](v7, v12);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[2](v7, 0);
  }
}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_123];

  [v6 collectionDidUpdateWithProgress:v3];
}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2_cold_1(v2, v3);
  }
}

- (void)annotatedAttachmentsForParameters:(id)a3 withHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v8 = [(DEExtensionContext *)self _auxiliaryConnection];
    uint64_t v9 = [v8 processIdentifier];

    v10 = [(DEExtensionContext *)self _principalObject];
    v11 = [v10 annotatedAttachmentsForParameters:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = objc_msgSend(v11, "items", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v16++) _generateSandboxExtensionTokenForPID:v9];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }

    v7[2](v7, v11);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)setupWithParameters:(id)a3 withHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v7 = [(DEExtensionContext *)self _principalObject];
    [v7 setupWithParameters:v8];

    v6[2](v6);
  }
}

- (void)teardownWithParameters:(id)a3 withHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v7 = [(DEExtensionContext *)self _principalObject];
    [v7 teardownWithParameters:v8];

    v6[2](v6);
  }
}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  id v5 = a3;
  if ([(DEExtensionContext *)self hasEntitlement])
  {
    v4 = [(DEExtensionContext *)self _principalObject];
    [v4 isExtensionEnhancedLoggingStateOnWithHandler:v5];
  }
}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_ERROR, "error calling collectionDidUpdateWithProgress - %{public}@", (uint8_t *)&v4, 0xCu);
}

@end