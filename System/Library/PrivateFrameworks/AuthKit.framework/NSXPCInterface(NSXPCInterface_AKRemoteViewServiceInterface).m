@interface NSXPCInterface(NSXPCInterface_AKRemoteViewServiceInterface)
+ (id)remoteViewServiceInterface;
@end

@implementation NSXPCInterface(NSXPCInterface_AKRemoteViewServiceInterface)

+ (id)remoteViewServiceInterface
{
  if (remoteViewServiceInterface_once != -1) {
    dispatch_once(&remoteViewServiceInterface_once, &__block_literal_global_3);
  }
  v0 = (void *)remoteViewServiceInterface_interface;

  return v0;
}

@end