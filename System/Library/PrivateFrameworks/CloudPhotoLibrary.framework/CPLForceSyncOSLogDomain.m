@interface CPLForceSyncOSLogDomain
@end

@implementation CPLForceSyncOSLogDomain

uint64_t ____CPLForceSyncOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.syncmanager.forcesync.task");
  uint64_t v1 = __CPLForceSyncOSLogDomain_result;
  __CPLForceSyncOSLogDomain_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLForceSyncOSLogDomain_block_invoke_20056()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.syncmanager.forcesync");
  uint64_t v1 = __CPLForceSyncOSLogDomain_result_20054;
  __CPLForceSyncOSLogDomain_result_20054 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end