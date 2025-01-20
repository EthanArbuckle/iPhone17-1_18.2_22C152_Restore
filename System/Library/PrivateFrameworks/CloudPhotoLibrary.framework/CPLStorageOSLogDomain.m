@interface CPLStorageOSLogDomain
@end

@implementation CPLStorageOSLogDomain

uint64_t ____CPLStorageOSLogDomain_block_invoke()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLStorageOSLogDomain_result = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.transientrepository.shared");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_209()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLStorageOSLogDomain_result_206 = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.resourcestorage");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_504()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLStorageOSLogDomain_result_501 = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.transientrepository.extraction");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_914()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  __CPLStorageOSLogDomain_result_911 = (uint64_t)os_log_create("com.apple.photos.cpl", "engine.pushrepository");
  return MEMORY[0x1F41817F8]();
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_1995()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.resourcestorage.filestorage");
  uint64_t v1 = __CPLStorageOSLogDomain_result_1992;
  __CPLStorageOSLogDomain_result_1992 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_5827()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.idmapping");
  uint64_t v1 = __CPLStorageOSLogDomain_result_5824;
  __CPLStorageOSLogDomain_result_5824 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_7307()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.downloadQueue");
  uint64_t v1 = __CPLStorageOSLogDomain_result_7305;
  __CPLStorageOSLogDomain_result_7305 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_8038()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.scopes");
  uint64_t v1 = __CPLStorageOSLogDomain_result_8036;
  __CPLStorageOSLogDomain_result_8036 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_8449()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.cleanuptasks");
  uint64_t v1 = __CPLStorageOSLogDomain_result_8446;
  __CPLStorageOSLogDomain_result_8446 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_8610()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.changepipe");
  uint64_t v1 = __CPLStorageOSLogDomain_result_8608;
  __CPLStorageOSLogDomain_result_8608 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_8801()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.transientrepository");
  uint64_t v1 = __CPLStorageOSLogDomain_result_8799;
  __CPLStorageOSLogDomain_result_8799 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_10541()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.storage.view");
  uint64_t v1 = __CPLStorageOSLogDomain_result_10538;
  __CPLStorageOSLogDomain_result_10538 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_10618()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.remappedrecords");
  uint64_t v1 = __CPLStorageOSLogDomain_result_10615;
  __CPLStorageOSLogDomain_result_10615 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_13899()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.pendingrecordchecks");
  uint64_t v1 = __CPLStorageOSLogDomain_result_13894;
  __CPLStorageOSLogDomain_result_13894 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_17001()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.cloudcache");
  uint64_t v1 = __CPLStorageOSLogDomain_result_16998;
  __CPLStorageOSLogDomain_result_16998 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_19391()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.computestatequeue");
  uint64_t v1 = __CPLStorageOSLogDomain_result_19388;
  __CPLStorageOSLogDomain_result_19388 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_19672()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.statusCenter");
  uint64_t v1 = __CPLStorageOSLogDomain_result_19666;
  __CPLStorageOSLogDomain_result_19666 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_20682()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.storage");
  uint64_t v1 = __CPLStorageOSLogDomain_result_20679;
  __CPLStorageOSLogDomain_result_20679 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_21334()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.quarantinedrecords");
  uint64_t v1 = __CPLStorageOSLogDomain_result_21331;
  __CPLStorageOSLogDomain_result_21331 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____CPLStorageOSLogDomain_block_invoke_21584()
{
  if (_CPLOSLogSubsystem_onceToken != -1) {
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_40);
  }
  os_log_t v0 = os_log_create("com.apple.photos.cpl", "engine.outgoingResources");
  uint64_t v1 = __CPLStorageOSLogDomain_result_21581;
  __CPLStorageOSLogDomain_result_21581 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end