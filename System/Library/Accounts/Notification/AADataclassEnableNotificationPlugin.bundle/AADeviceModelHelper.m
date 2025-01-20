@interface AADeviceModelHelper
+ (BOOL)isDeviceEqualTo:(id)a3;
+ (BOOL)isDeviceiPad;
+ (BOOL)isDeviceiPhone;
@end

@implementation AADeviceModelHelper

+ (BOOL)isDeviceiPhone
{
  return MEMORY[0x270F9A6D0](a1, sel_isDeviceEqualTo_, @"iPhone");
}

+ (BOOL)isDeviceiPad
{
  return MEMORY[0x270F9A6D0](a1, sel_isDeviceEqualTo_, @"iPad");
}

+ (BOOL)isDeviceEqualTo:(id)a3
{
  id v3 = a3;
  if (qword_268C87D50 != -1) {
    dispatch_once(&qword_268C87D50, &unk_26F49FC50);
  }
  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_24053A690(v4);
  }

  char isEqualToString = objc_msgSend_isEqualToString_((void *)qword_268C87D48, v5, (uint64_t)v3);
  return isEqualToString;
}

@end