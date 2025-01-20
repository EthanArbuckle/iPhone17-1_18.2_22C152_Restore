@interface CDPLogSystemAnalytics
@end

@implementation CDPLogSystemAnalytics

uint64_t ___CDPLogSystemAnalytics_block_invoke()
{
  _CDPLogSystemAnalytics_log = (uint64_t)os_log_create("com.apple.cdp", "analytics");
  return MEMORY[0x270F9A758]();
}

@end