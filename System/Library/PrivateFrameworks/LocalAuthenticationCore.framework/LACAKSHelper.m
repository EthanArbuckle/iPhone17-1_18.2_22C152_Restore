@interface LACAKSHelper
+ (BOOL)isOnenessAssertionActive;
+ (void)isOnenessAssertionActive;
@end

@implementation LACAKSHelper

+ (BOOL)isOnenessAssertionActive
{
  int extended_device_state = aks_get_extended_device_state(0);
  if (!extended_device_state) {
    return 0;
  }
  int v3 = extended_device_state;
  v4 = LACLogABM();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[LACAKSHelper isOnenessAssertionActive];
  }

  return 0;
}

+ (void)isOnenessAssertionActive
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "AKS get device state returned non-zero result: %d", (uint8_t *)v2, 8u);
}

@end