@interface _SLAuthHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation _SLAuthHostExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_6 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_6, &__block_literal_global_9);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_7;

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_10 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_10, &__block_literal_global_13);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_11;

  return v2;
}

@end