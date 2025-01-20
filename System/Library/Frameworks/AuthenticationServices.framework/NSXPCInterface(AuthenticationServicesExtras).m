@interface NSXPCInterface(AuthenticationServicesExtras)
+ (id)_as_accountModificationExtensionInterface;
+ (id)_as_accountModificationHostInterface;
+ (id)_as_credentialProviderExtensionInterface;
+ (id)_as_credentialProviderHostInterface;
@end

@implementation NSXPCInterface(AuthenticationServicesExtras)

+ (id)_as_credentialProviderHostInterface
{
  if (_as_credentialProviderHostInterface_onceToken != -1) {
    dispatch_once(&_as_credentialProviderHostInterface_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)_as_credentialProviderHostInterface_interface;

  return v0;
}

+ (id)_as_credentialProviderExtensionInterface
{
  if (_as_credentialProviderExtensionInterface_onceToken != -1) {
    dispatch_once(&_as_credentialProviderExtensionInterface_onceToken, &__block_literal_global_64);
  }
  v0 = (void *)_as_credentialProviderExtensionInterface_interface;

  return v0;
}

+ (id)_as_accountModificationHostInterface
{
  if (_as_accountModificationHostInterface_onceToken != -1) {
    dispatch_once(&_as_accountModificationHostInterface_onceToken, &__block_literal_global_102);
  }
  v0 = (void *)_as_accountModificationHostInterface_interface;

  return v0;
}

+ (id)_as_accountModificationExtensionInterface
{
  if (_as_accountModificationExtensionInterface_onceToken != -1) {
    dispatch_once(&_as_accountModificationExtensionInterface_onceToken, &__block_literal_global_112_0);
  }
  v0 = (void *)_as_accountModificationExtensionInterface_interface;

  return v0;
}

@end