@interface NSInflectionLog
@end

@implementation NSInflectionLog

os_log_t ___NSInflectionLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "Inflection");
  _NSInflectionLog_log = (uint64_t)result;
  return result;
}

@end