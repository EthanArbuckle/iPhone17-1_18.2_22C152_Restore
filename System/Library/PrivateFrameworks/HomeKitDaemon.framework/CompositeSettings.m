@interface CompositeSettings
@end

@implementation CompositeSettings

void __CompositeSettings_Database_log_block_invoke()
{
  id v2 = [@"CompositeSettings_Database" stringByReplacingOccurrencesOfString:@"_" withString:@"."];
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)CompositeSettings_Database_log__hmf_once_v1;
  CompositeSettings_Database_log__hmf_once_v1 = v0;
}

@end