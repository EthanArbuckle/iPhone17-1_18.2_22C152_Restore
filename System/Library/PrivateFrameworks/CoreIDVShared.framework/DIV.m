@interface DIV
@end

@implementation DIV

uint64_t __DIV_LOG_KEXT_block_invoke()
{
  DIV_LOG_KEXT_log = (uint64_t)os_log_create("com.apple.CoreIDV.telemetry", "kextCall");
  return MEMORY[0x1F41817F8]();
}

@end