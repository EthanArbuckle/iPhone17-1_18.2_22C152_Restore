@interface NEFilterPacketExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
- (void)createPacketChannelWithCompletionHandler:(id)a3;
@end

@implementation NEFilterPacketExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_23122 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_23122, &__block_literal_global_23123);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_23124;

  return v2;
}

uint64_t __77__NEFilterPacketExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0A05F8];
  uint64_t v1 = _extensionAuxiliaryHostProtocol_protocol_23124;
  _extensionAuxiliaryHostProtocol_protocol_23124 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)createPacketChannelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 createPacketChannelForExtension:self completionHandler:v4];
}

@end