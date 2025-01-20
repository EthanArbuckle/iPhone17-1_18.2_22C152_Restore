@interface CFNAPIMisuseFaultLogHandle
@end

@implementation CFNAPIMisuseFaultLogHandle

os_log_t ____CFNAPIMisuseFaultLogHandle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CFNetwork", "API");
  __CFNAPIMisuseFaultLogHandle::logger = (uint64_t)result;
  return result;
}

@end