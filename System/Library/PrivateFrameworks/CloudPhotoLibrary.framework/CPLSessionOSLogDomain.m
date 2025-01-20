@interface CPLSessionOSLogDomain
@end

@implementation CPLSessionOSLogDomain

uint64_t ____CPLSessionOSLogDomain_block_invoke()
{
  v0 = _CPLOSLogSubsystem();
  __CPLSessionOSLogDomain_result = (uint64_t)os_log_create(v0, "client.session.proxy");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLSessionOSLogDomain_block_invoke_0()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "client.session.pull");
  uint64_t v1 = __CPLSessionOSLogDomain_result_0;
  __CPLSessionOSLogDomain_result_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLSessionOSLogDomain_block_invoke_15580()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "client.session.push.compute");
  uint64_t v1 = __CPLSessionOSLogDomain_result_15578;
  __CPLSessionOSLogDomain_result_15578 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLSessionOSLogDomain_block_invoke_17417()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "client.session.push");
  uint64_t v1 = __CPLSessionOSLogDomain_result_17414;
  __CPLSessionOSLogDomain_result_17414 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLSessionOSLogDomain_block_invoke_21945()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "client.session");
  uint64_t v1 = __CPLSessionOSLogDomain_result_21942;
  __CPLSessionOSLogDomain_result_21942 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end