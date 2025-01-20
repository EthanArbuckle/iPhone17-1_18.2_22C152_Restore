@interface SO
@end

@implementation SO

uint64_t __SO_LOG_SOUtils_block_invoke()
{
  SO_LOG_SOUtils_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOUtils");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOServiceConnection_block_invoke()
{
  SO_LOG_SOServiceConnection_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOServiceConnection");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOConfigurationVersion_block_invoke()
{
  SO_LOG_SOConfigurationVersion_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOConfigurationVersion");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOConfigurationClient_block_invoke()
{
  SO_LOG_SOConfigurationClient_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOConfigurationClient");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOClient_block_invoke()
{
  SO_LOG_SOClient_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOClient");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOClientImpl_block_invoke()
{
  SO_LOG_SOClientImpl_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOClientImpl");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOErrorHelper_block_invoke()
{
  SO_LOG_SOErrorHelper_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOErrorHelper");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOFullProfile_block_invoke()
{
  SO_LOG_SOFullProfile_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOFullProfile");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOAuthorizationCore_block_invoke()
{
  SO_LOG_SOAuthorizationCore_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOAuthorizationCore");
  return MEMORY[0x1F41817F8]();
}

uint64_t __SO_LOG_SOConfiguration_block_invoke()
{
  SO_LOG_SOConfiguration_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOConfiguration");
  return MEMORY[0x1F41817F8]();
}

@end