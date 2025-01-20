@interface AALog
@end

@implementation AALog

uint64_t ___AALog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AttentionAwareness", "AttentionAwareness");
  uint64_t v1 = _AALog_log;
  _AALog_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end