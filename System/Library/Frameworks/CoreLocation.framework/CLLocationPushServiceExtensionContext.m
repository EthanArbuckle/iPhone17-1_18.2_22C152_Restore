@interface CLLocationPushServiceExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation CLLocationPushServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE02C3C8];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE032E20];
}

@end