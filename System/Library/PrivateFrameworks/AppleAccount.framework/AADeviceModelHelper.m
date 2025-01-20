@interface AADeviceModelHelper
+ (BOOL)isDeviceEqualTo:(id)a3;
+ (BOOL)isDeviceiPad;
+ (BOOL)isDeviceiPhone;
@end

@implementation AADeviceModelHelper

+ (BOOL)isDeviceiPhone
{
  return [a1 isDeviceEqualTo:@"iPhone"];
}

+ (BOOL)isDeviceiPad
{
  return [a1 isDeviceEqualTo:@"iPad"];
}

+ (BOOL)isDeviceEqualTo:(id)a3
{
  id v3 = a3;
  if (isDeviceEqualTo__onceToken != -1) {
    dispatch_once(&isDeviceEqualTo__onceToken, &__block_literal_global_25);
  }
  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[AADeviceModelHelper isDeviceEqualTo:](v4);
  }

  char v5 = [(id)isDeviceEqualTo__deviceModel isEqualToString:v3];
  return v5;
}

uint64_t __39__AADeviceModelHelper_isDeviceEqualTo___block_invoke()
{
  isDeviceEqualTo__deviceModel = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

+ (void)isDeviceEqualTo:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = isDeviceEqualTo__deviceModel;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Current device model: %@", (uint8_t *)&v1, 0xCu);
}

@end