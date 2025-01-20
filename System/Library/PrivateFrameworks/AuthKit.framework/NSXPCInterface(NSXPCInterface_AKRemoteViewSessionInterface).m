@interface NSXPCInterface(NSXPCInterface_AKRemoteViewSessionInterface)
+ (id)remoteViewSessionInterface;
@end

@implementation NSXPCInterface(NSXPCInterface_AKRemoteViewSessionInterface)

+ (id)remoteViewSessionInterface
{
  if (remoteViewSessionInterface_once != -1) {
    dispatch_once(&remoteViewSessionInterface_once, &__block_literal_global_23);
  }
  v0 = (void *)remoteViewSessionInterface_interface;

  return v0;
}

@end