@interface LSDDeviceIdentifierService
@end

@implementation LSDDeviceIdentifierService

void __43___LSDDeviceIdentifierService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB55028];
  v3 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  +[_LSDDeviceIdentifierService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  if (+[_LSDDeviceIdentifierService XPCInterface]::result
    || ([MEMORY[0x1E4F28B00] currentHandler],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDDeviceIdentifierService.mm" lineNumber:287 description:@"Failed to create XPC interface object."], v7, (v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result) != 0))
  {
    [v4 setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_generateIdentifiersWithVendorName_bundleIdentifier_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_generateIdentifiersWithVendorName_bundleIdentifier_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_ argumentIndex:1 ofReply:0];
    v5 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
    uint64_t v6 = objc_opt_class();
    [v5 setClass:v6 forSelector:sel_urlContainsDeviceIdentifierForAdvertising_completionHandler_ argumentIndex:0 ofReply:0];
  }
}

@end