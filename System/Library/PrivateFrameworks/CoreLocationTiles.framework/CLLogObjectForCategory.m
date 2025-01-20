@interface CLLogObjectForCategory
@end

@implementation CLLogObjectForCategory

os_log_t ___CLLogObjectForCategory_Utility_Default_block_invoke()
{
  os_log_t result = os_log_create("com.apple.locationd.Utility", "Utility");
  logObject_Utility_Default = (uint64_t)result;
  return result;
}

@end