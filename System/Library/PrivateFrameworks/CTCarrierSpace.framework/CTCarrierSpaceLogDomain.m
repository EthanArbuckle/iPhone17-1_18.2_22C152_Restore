@interface CTCarrierSpaceLogDomain
@end

@implementation CTCarrierSpaceLogDomain

os_log_t ___CTCarrierSpaceLogDomain_block_invoke()
{
  os_log_t result = os_log_create("com.apple.carrierspace", "client");
  _CTCarrierSpaceLogDomain_oslog = (uint64_t)result;
  return result;
}

@end