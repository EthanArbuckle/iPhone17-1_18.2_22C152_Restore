@interface NEFilterDataExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)fetchProviderConnectionWithCompletionHandler:(id)a3;
- (void)getSourceAppInfo:(id)a3 completionHandler:(id)a4;
- (void)handleRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)providerControlSocketFileHandle:(id)a3;
- (void)report:(id)a3;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendSocketContentFilterRequest;
@end

@implementation NEFilterDataExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4226 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4226, &__block_literal_global_75_4227);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_4228;

  return v2;
}

uint64_t __75__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_4228 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0946E0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4231 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4231, &__block_literal_global_4232);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4233;

  return v2;
}

uint64_t __77__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_4233 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0945B8];

  return MEMORY[0x1F41817F8]();
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 applySettings:v7 completionHandler:v6];
}

- (void)getSourceAppInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NEAppInfoCache sharedAppInfoCache]();
  if (v6)
  {
    int v8 = *((_DWORD *)v6 + 2);
    id v9 = *((id *)v6 + 2);
    v10 = (void *)*((void *)v6 + 3);
  }
  else
  {
    id v9 = 0;
    int v8 = 0;
    v10 = 0;
  }
  id v11 = v10;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke;
  v13[3] = &unk_1E598FB90;
  id v14 = v5;
  id v12 = v5;
  -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v7, v8, v9, v11, v13);
}

uint64_t __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)report:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 report:v4];
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fetchCurrentRulesForFlow:v7 completionHandler:v6];
}

- (void)sendSocketContentFilterRequest
{
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendSocketContentFilterRequest];
}

- (void)sendBrowserContentFilterServerRequest
{
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendBrowserContentFilterServerRequest];
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideURLAppendStringMap:v4];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideRemediationMap:v4];
}

- (void)handleRulesChanged
{
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 handleRulesChanged];
}

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 fetchProviderConnectionWithCompletionHandler:v4];
}

- (void)providerControlSocketFileHandle:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 providerControlSocketFileHandle:v4];
}

@end