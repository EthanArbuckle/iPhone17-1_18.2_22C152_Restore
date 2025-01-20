@interface CPLConfigurationOSLogDomain
@end

@implementation CPLConfigurationOSLogDomain

uint64_t ____CPLConfigurationOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "configuration");
  uint64_t v1 = __CPLConfigurationOSLogDomain_result;
  __CPLConfigurationOSLogDomain_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLConfigurationOSLogDomain_block_invoke_18667()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "configuration.fetch");
  uint64_t v1 = __CPLConfigurationOSLogDomain_result_18664;
  __CPLConfigurationOSLogDomain_result_18664 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end