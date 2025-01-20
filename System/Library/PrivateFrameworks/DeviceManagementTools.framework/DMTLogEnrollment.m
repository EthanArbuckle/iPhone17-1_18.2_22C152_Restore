@interface DMTLogEnrollment
@end

@implementation DMTLogEnrollment

uint64_t ___DMTLogEnrollment_block_invoke()
{
  _DMTLogEnrollment_logObj = (uint64_t)os_log_create("com.apple.devicemanagementtools", "Enrollment");
  return MEMORY[0x270F9A758]();
}

@end