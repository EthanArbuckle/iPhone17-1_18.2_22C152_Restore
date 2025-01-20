@interface CPLSchedulerOSLogDomain
@end

@implementation CPLSchedulerOSLogDomain

uint64_t ____CPLSchedulerOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLSchedulerOSLogDomain_result = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.scheduler.session");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLSchedulerOSLogDomain_block_invoke_7039()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.scheduler");
  uint64_t v1 = __CPLSchedulerOSLogDomain_result_7037;
  __CPLSchedulerOSLogDomain_result_7037 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end