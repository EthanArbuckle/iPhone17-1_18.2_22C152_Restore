@interface UIArbiterLog
@end

@implementation UIArbiterLog

uint64_t ___UIArbiterLog_block_invoke()
{
  _MergedGlobals_1 = (uint64_t)os_log_create("com.apple.UIKit", "KeyboardArbiter");
  return MEMORY[0x270F9A758]();
}

@end