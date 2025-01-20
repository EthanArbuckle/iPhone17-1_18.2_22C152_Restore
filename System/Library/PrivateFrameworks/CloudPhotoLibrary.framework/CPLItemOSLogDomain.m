@interface CPLItemOSLogDomain
@end

@implementation CPLItemOSLogDomain

uint64_t ____CPLItemOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.filestorage.item");
  uint64_t v1 = __CPLItemOSLogDomain_result;
  __CPLItemOSLogDomain_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end