@interface Siri
@end

@implementation Siri

void __Siri_log_block_invoke()
{
  id v2 = [@"Siri" stringByReplacingOccurrencesOfString:@"_" withString:@"."];
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)Siri_log__hmf_once_v1;
  Siri_log__hmf_once_v1 = v0;
}

@end