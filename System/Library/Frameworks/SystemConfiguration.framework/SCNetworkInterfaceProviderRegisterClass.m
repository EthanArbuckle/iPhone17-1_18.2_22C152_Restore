@interface SCNetworkInterfaceProviderRegisterClass
@end

@implementation SCNetworkInterfaceProviderRegisterClass

uint64_t ____SCNetworkInterfaceProviderRegisterClass_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCNetworkInterfaceProviderTypeID = result;
  return result;
}

@end