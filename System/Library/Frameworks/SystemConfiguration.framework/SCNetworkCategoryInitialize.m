@interface SCNetworkCategoryInitialize
@end

@implementation SCNetworkCategoryInitialize

uint64_t ____SCNetworkCategoryInitialize_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCNetworkCategoryTypeID = result;
  return result;
}

@end