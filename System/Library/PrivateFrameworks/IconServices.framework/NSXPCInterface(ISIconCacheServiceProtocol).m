@interface NSXPCInterface(ISIconCacheServiceProtocol)
+ (id)_IS_iconCacheServiceInterface;
@end

@implementation NSXPCInterface(ISIconCacheServiceProtocol)

+ (id)_IS_iconCacheServiceInterface
{
  if (_IS_iconCacheServiceInterface_onceToken != -1) {
    dispatch_once(&_IS_iconCacheServiceInterface_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)_IS_iconCacheServiceInterface_interface;
  return v0;
}

@end