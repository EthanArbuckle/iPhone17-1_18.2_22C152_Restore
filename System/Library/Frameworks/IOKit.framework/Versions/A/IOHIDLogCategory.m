@interface IOHIDLogCategory
@end

@implementation IOHIDLogCategory

os_log_t ___IOHIDLogCategory_block_invoke()
{
  _IOHIDLogCategory_log[0] = (uint64_t)os_log_create("com.apple.iohid", "default");
  qword_1EB2191B0 = (uint64_t)os_log_create("com.apple.iohid", "trace");
  qword_1EB2191B8 = (uint64_t)os_log_create("com.apple.iohid", "property");
  qword_1EB2191C0 = (uint64_t)os_log_create("com.apple.iohid", "activity");
  qword_1EB2191C8 = (uint64_t)os_log_create("com.apple.iohid", "fastpath");
  qword_1EB2191D0 = (uint64_t)os_log_create("com.apple.iohid", "userdevice");
  qword_1EB2191D8 = (uint64_t)os_log_create("com.apple.iohid", "service");
  qword_1EB2191E0 = (uint64_t)os_log_create("com.apple.iohid", "serviceplugin");
  qword_1EB2191E8 = (uint64_t)os_log_create("com.apple.iohid", "service.carplay");
  qword_1EB2191F0 = (uint64_t)os_log_create("com.apple.iohid", "connection");
  qword_1EB2191F8 = (uint64_t)os_log_create("com.apple.iohid", "cursor");
  qword_1EB219200 = (uint64_t)os_log_create("com.apple.iohid", "hidsignpost");
  qword_1EB219208 = (uint64_t)os_log_create("com.apple.iohid", "ups");
  qword_1EB219210 = (uint64_t)os_log_create("com.apple.iohid", "client");
  os_log_t result = os_log_create("com.apple.iohid", "oversized");
  qword_1EB219218 = (uint64_t)result;
  return result;
}

@end