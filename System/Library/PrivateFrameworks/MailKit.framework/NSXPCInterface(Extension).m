@interface NSXPCInterface(Extension)
+ (id)MEExtensionRemoteHostInterface;
+ (id)MERemoteExtensiontInterface;
@end

@implementation NSXPCInterface(Extension)

+ (id)MERemoteExtensiontInterface
{
  if (MERemoteExtensiontInterface_onceToken != -1) {
    dispatch_once(&MERemoteExtensiontInterface_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)MERemoteExtensiontInterface_remoteInterface;
  return v0;
}

+ (id)MEExtensionRemoteHostInterface
{
  if (MEExtensionRemoteHostInterface_onceToken != -1) {
    dispatch_once(&MEExtensionRemoteHostInterface_onceToken, &__block_literal_global_105);
  }
  v0 = (void *)MEExtensionRemoteHostInterface_interface;
  return v0;
}

@end