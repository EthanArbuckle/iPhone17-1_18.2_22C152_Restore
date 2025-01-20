@interface _CNDExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)makeHostProtocol;
+ (id)makeVendorProtocol;
@end

@implementation _CNDExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55___CNDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryHostProtocol_cn_once_token_1 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_cn_once_token_1, block);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_cn_once_object_1;

  return v2;
}

+ (id)makeHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4FC190];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___CNDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryVendorProtocol_cn_once_token_2 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_cn_once_token_2, block);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_cn_once_object_2;

  return v2;
}

+ (id)makeVendorProtocol
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4FD960];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_renewExpirationDateForDonatedValue_acknowledgementHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

@end