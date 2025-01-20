@interface NEExtensionPacketTunnelProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3;
- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7;
- (void)setAppUUIDMap:(id)a3;
- (void)setupVirtualInterface:(id)a3;
- (void)validateWithCompletionHandler:(id)a3;
@end

@implementation NEExtensionPacketTunnelProviderHostContext

- (int)requiredEntitlement
{
  return 1;
}

- (void)validateWithCompletionHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NEExtensionPacketTunnelProviderHostContext;
  [(NEExtensionProviderHostContext *)&v3 validateWithCompletionHandler:a3];
}

- (void)setAppUUIDMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setAppUUIDMap:v4];
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id Property = objc_getProperty(self, v17, 64, 1);
    }
    else {
      id Property = 0;
    }
    id v23 = Property;
    *(_DWORD *)buf = 138412802;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 1024;
    int v29 = [v23 pid];
    _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@: requestSocket %@ (pid %d)", buf, 0x1Cu);
  }
  v19 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  if (self) {
    id v20 = objc_getProperty(self, v18, 64, 1);
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;
  objc_msgSend(v19, "extension:didRequestSocket:interface:local:remote:effectivePID:completionHandler:", self, v10, v12, v15, v14, objc_msgSend(v21, "pid"), v13);
}

- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: fetchVirtualInterfaceTypeWithCompletionHandler", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  [v6 fetchVirtualInterfaceTypeWithCompletionHandler:v4];
}

- (void)setupVirtualInterface:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setupVirtualInterface:v4];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2546 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2546, &__block_literal_global_71);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_2547;

  return v2;
}

uint64_t __77__NEExtensionPacketTunnelProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_2547 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093AF0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2549 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2549, &__block_literal_global_2550);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2551;

  return v2;
}

uint64_t __79__NEExtensionPacketTunnelProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_2551 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093A58];

  return MEMORY[0x1F41817F8]();
}

@end