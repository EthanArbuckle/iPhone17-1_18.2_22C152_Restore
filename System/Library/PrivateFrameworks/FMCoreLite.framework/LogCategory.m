@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Unspecified_block_invoke()
{
  LogCategory_Unspecified_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "_");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_APS_block_invoke()
{
  LogCategory_APS_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "APS");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_FMRunLoopMonitor_block_invoke()
{
  LogCategory_FMRunLoopMonitor_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "FMRunLoopMonitor");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_FMSynchronizer_block_invoke()
{
  LogCategory_FMSynchronizer_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "FMSynchronizer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_FMXPCActivity_block_invoke()
{
  LogCategory_FMXPCActivity_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "XPCActivity");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_FMXPCBridge_block_invoke()
{
  LogCategory_FMXPCBridge_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "FMXPCBridge");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Networking_block_invoke()
{
  LogCategory_Networking_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "networking");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_NetworkingVerbose_block_invoke()
{
  LogCategory_NetworkingVerbose_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "networking.verbose");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_ServerError_block_invoke()
{
  LogCategory_ServerError_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "servererror");
  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_SharedFileContainer_block_invoke()
{
  LogCategory_SharedFileContainer_log = (uint64_t)os_log_create("com.apple.icloud.FMCore", "SharedFileContainer");
  return MEMORY[0x1F41817F8]();
}

@end