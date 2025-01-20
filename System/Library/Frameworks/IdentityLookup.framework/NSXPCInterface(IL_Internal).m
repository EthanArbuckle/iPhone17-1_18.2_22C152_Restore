@interface NSXPCInterface(IL_Internal)
+ (id)il_classificationUIExtensionHostInterface;
+ (id)il_classificationUIExtensionVendorInterface;
+ (id)il_messageFilterExtensionHostInterface;
+ (id)il_messageFilterExtensionVendorInterface;
@end

@implementation NSXPCInterface(IL_Internal)

+ (id)il_messageFilterExtensionHostInterface
{
  if (il_messageFilterExtensionHostInterface_onceToken != -1) {
    dispatch_once(&il_messageFilterExtensionHostInterface_onceToken, &__block_literal_global_57);
  }
  v0 = (void *)il_messageFilterExtensionHostInterface_interface;

  return v0;
}

+ (id)il_messageFilterExtensionVendorInterface
{
  if (il_messageFilterExtensionVendorInterface_onceToken != -1) {
    dispatch_once(&il_messageFilterExtensionVendorInterface_onceToken, &__block_literal_global_64);
  }
  v0 = (void *)il_messageFilterExtensionVendorInterface_interface;

  return v0;
}

+ (id)il_classificationUIExtensionHostInterface
{
  if (il_classificationUIExtensionHostInterface_onceToken != -1) {
    dispatch_once(&il_classificationUIExtensionHostInterface_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)il_classificationUIExtensionHostInterface_interface;

  return v0;
}

+ (id)il_classificationUIExtensionVendorInterface
{
  if (il_classificationUIExtensionVendorInterface_onceToken[0] != -1) {
    dispatch_once(il_classificationUIExtensionVendorInterface_onceToken, &__block_literal_global_79);
  }
  v0 = (void *)il_classificationUIExtensionVendorInterface_interface;

  return v0;
}

@end