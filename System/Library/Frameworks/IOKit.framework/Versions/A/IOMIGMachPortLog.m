@interface IOMIGMachPortLog
@end

@implementation IOMIGMachPortLog

os_log_t ____IOMIGMachPortLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.iokit.iomigmachport", "default");
  __IOMIGMachPortLog_log = (uint64_t)result;
  return result;
}

@end