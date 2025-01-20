@interface RPExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)didConnectToVendor:(id)a3;
@end

@implementation RPExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D11F580];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D13F410];
}

- (void)didConnectToVendor:(id)a3
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connected to extension.", v3, 2u);
  }
}

@end