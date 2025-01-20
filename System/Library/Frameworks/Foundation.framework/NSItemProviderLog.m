@interface NSItemProviderLog
@end

@implementation NSItemProviderLog

os_log_t ___NSItemProviderLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Foundation", "ItemProvider");
  _MergedGlobals_148 = (uint64_t)result;
  return result;
}

@end