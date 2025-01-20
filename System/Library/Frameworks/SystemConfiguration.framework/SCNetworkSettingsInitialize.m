@interface SCNetworkSettingsInitialize
@end

@implementation SCNetworkSettingsInitialize

uint64_t ____SCNetworkSettingsInitialize_block_invoke()
{
  __kSCNSManagerTypeID = _CFRuntimeRegisterClass();
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCNSServiceTypeID = result;
  return result;
}

@end