@interface AAFLogSystemAnalytics
@end

@implementation AAFLogSystemAnalytics

uint64_t ___AAFLogSystemAnalytics_block_invoke()
{
  _AAFLogSystemAnalytics_log = (uint64_t)os_log_create("com.apple.aaafoundation", "analytics");
  return MEMORY[0x1F41817F8]();
}

@end