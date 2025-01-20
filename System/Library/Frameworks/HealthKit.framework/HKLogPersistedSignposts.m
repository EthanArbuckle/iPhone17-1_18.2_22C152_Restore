@interface HKLogPersistedSignposts
@end

@implementation HKLogPersistedSignposts

os_log_t ___HKLogPersistedSignposts_block_invoke()
{
  os_log_t result = os_log_create("com.apple.HealthKit", "persisted_signposts");
  _HKLogPersistedSignposts_persistedSignpostsCategory = (uint64_t)result;
  return result;
}

@end