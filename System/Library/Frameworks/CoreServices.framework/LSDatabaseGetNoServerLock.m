@interface LSDatabaseGetNoServerLock
@end

@implementation LSDatabaseGetNoServerLock

uint64_t ___LSDatabaseGetNoServerLock_block_invoke()
{
  uint64_t result = [(id)__LSDefaultsGetSharedInstance() hasServer];
  if ((result & 1) == 0)
  {
    uint64_t result = [(id)__LSDefaultsGetSharedInstance() isServer];
    if ((result & 1) == 0) {
      operator new();
    }
  }
  return result;
}

@end