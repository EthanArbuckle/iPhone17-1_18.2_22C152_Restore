@interface SO
@end

@implementation SO

uint64_t __SO_LOG_SOSmartcard_block_invoke()
{
  SO_LOG_SOSmartcard_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOSmartcard");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosSettingsManager_block_invoke()
{
  SO_LOG_SOKerberosSettingsManager_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosSettingsManager");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOLDAPHelper_block_invoke()
{
  SO_LOG_SOLDAPHelper_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOLDAPHelper");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosServer_block_invoke()
{
  SO_LOG_SOKerberosServer_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosServer");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOADSiteDiscovery_block_invoke()
{
  SO_LOG_SOADSiteDiscovery_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOADSiteDiscovery");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosRealmSettings_block_invoke()
{
  SO_LOG_SOKerberosRealmSettings_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosRealmSettings");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKeychainHelper_block_invoke()
{
  SO_LOG_SOKeychainHelper_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKeychainHelper");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosContext_block_invoke()
{
  SO_LOG_SOKerberosContext_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosContext");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOAsynchronousLDAPOperation_block_invoke()
{
  SO_LOG_SOAsynchronousLDAPOperation_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOAsynchronousLDAPOperation");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosExtensionProcess_block_invoke()
{
  SO_LOG_SOKerberosExtensionProcess_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosExtensionProcess");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosHeimdalPluginSettings_block_invoke()
{
  SO_LOG_SOKerberosHeimdalPluginSettings_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosHeimdalPluginSettings");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosAuthentication_block_invoke()
{
  SO_LOG_SOKerberosAuthentication_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosAuthentication");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SONetworkIdentity_block_invoke()
{
  SO_LOG_SONetworkIdentity_log = (uint64_t)os_log_create("com.apple.AppSSO", "SONetworkIdentity");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosFileManager_block_invoke()
{
  SO_LOG_SOKerberosFileManager_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosFileManager");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SOKerberosHelper_block_invoke()
{
  SO_LOG_SOKerberosHelper_log = (uint64_t)os_log_create("com.apple.AppSSO", "SOKerberosHelper");
  return MEMORY[0x270F9A758]();
}

uint64_t __SO_LOG_SODNSSRVQuery_block_invoke()
{
  SO_LOG_SODNSSRVQuery_log = (uint64_t)os_log_create("com.apple.AppSSO", "SODNSSRVQuery");
  return MEMORY[0x270F9A758]();
}

@end