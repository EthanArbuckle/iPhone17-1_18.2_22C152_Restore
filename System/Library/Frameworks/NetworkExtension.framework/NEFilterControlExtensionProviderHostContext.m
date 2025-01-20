@interface NEFilterControlExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)handleNewFlow:(id)a3 completionHandler:(id)a4;
- (void)handleReport:(id)a3;
- (void)notifyRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
@end

@implementation NEFilterControlExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3722 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3722, &__block_literal_global_69_3723);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_3724;

  return v2;
}

uint64_t __78__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_3724 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0942C8];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3727 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3727, &__block_literal_global_3728);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3729;

  return v2;
}

uint64_t __80__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_3729 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094218];

  return MEMORY[0x1F41817F8]();
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideURLAppendStringMap:v4];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideRemediationMap:v4];
}

- (void)notifyRulesChanged
{
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 notifyRulesChanged];
}

- (void)handleReport:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleReport:v4];
}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleNewFlow:v7 completionHandler:v6];
}

@end