@interface SCNetworkCategoryManagerInitialize
@end

@implementation SCNetworkCategoryManagerInitialize

uint64_t ____SCNetworkCategoryManagerInitialize_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCNetworkCategoryManagerTypeID = result;
  return result;
}

@end