@interface _HKBackgroundObservationExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation _HKBackgroundObservationExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_132);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_43_0);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

@end