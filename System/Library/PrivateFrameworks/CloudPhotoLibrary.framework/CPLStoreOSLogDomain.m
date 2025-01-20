@interface CPLStoreOSLogDomain
@end

@implementation CPLStoreOSLogDomain

uint64_t ____CPLStoreOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLStoreOSLogDomain_result = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.store");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLStoreOSLogDomain_block_invoke_2933()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.store");
  uint64_t v1 = __CPLStoreOSLogDomain_result_2931;
  __CPLStoreOSLogDomain_result_2931 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end