@interface CPLTaskOSLogDomain
@end

@implementation CPLTaskOSLogDomain

uint64_t ____CPLTaskOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLTaskOSLogDomain_result = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.sync.transportupdate");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_619()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLTaskOSLogDomain_result_616 = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.sync.mingle");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_1349()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.uploadcomputestates");
  uint64_t v1 = __CPLTaskOSLogDomain_result_1347;
  __CPLTaskOSLogDomain_result_1347 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_2558()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pullscopes");
  uint64_t v1 = __CPLTaskOSLogDomain_result_2555;
  __CPLTaskOSLogDomain_result_2555 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_5199()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.cleanup");
  uint64_t v1 = __CPLTaskOSLogDomain_result_5196;
  __CPLTaskOSLogDomain_result_5196 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_6649()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.reshare");
  uint64_t v1 = __CPLTaskOSLogDomain_result_6646;
  __CPLTaskOSLogDomain_result_6646 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_10839()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pushtotransport");
  uint64_t v1 = __CPLTaskOSLogDomain_result_10836;
  __CPLTaskOSLogDomain_result_10836 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_13369()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.mingle");
  uint64_t v1 = __CPLTaskOSLogDomain_result_13366;
  __CPLTaskOSLogDomain_result_13366 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_13809()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.backgrounddownloads");
  uint64_t v1 = __CPLTaskOSLogDomain_result_13807;
  __CPLTaskOSLogDomain_result_13807 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_14854()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.task");
  uint64_t v1 = __CPLTaskOSLogDomain_result_14851;
  __CPLTaskOSLogDomain_result_14851 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_16348()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.updatescope");
  uint64_t v1 = __CPLTaskOSLogDomain_result_16346;
  __CPLTaskOSLogDomain_result_16346 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_20521()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.processtagedscopes");
  uint64_t v1 = __CPLTaskOSLogDomain_result_20519;
  __CPLTaskOSLogDomain_result_20519 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_22294()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pullfromtransport");
  uint64_t v1 = __CPLTaskOSLogDomain_result_22292;
  __CPLTaskOSLogDomain_result_22292 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLTaskOSLogDomain_block_invoke_23369()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pushtotransport.upload");
  uint64_t v1 = __CPLTaskOSLogDomain_result_23367;
  __CPLTaskOSLogDomain_result_23367 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end