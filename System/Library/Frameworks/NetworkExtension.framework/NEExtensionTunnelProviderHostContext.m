@interface NEExtensionTunnelProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)didSetReasserting:(BOOL)a3;
- (void)establishIPCWithCompletionHandler:(id)a3;
- (void)handleIPCDetached;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionTunnelProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3104 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3104, &__block_literal_global_63_3105);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_3106;

  return v2;
}

uint64_t __71__NEExtensionTunnelProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_3106 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092A10];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3109 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3109, &__block_literal_global_3110);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3111;

  return v2;
}

uint64_t __73__NEExtensionTunnelProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_3111 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092950];

  return MEMORY[0x1F41817F8]();
}

- (void)handleIPCDetached
{
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 extensionDidDetachIPC:self];
}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 establishIPCWithCompletionHandler:v4];
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: setting tunnel configuration", (uint8_t *)&v10, 0xCu);
  }

  v9 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  [v9 extension:self didSetTunnelConfiguration:v7 completionHandler:v6];
}

- (void)didSetReasserting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v8, 0x12u);
  }

  if (v3) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 4;
  }
  id v7 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  [v7 extension:self didSetStatus:v6];
}

@end