@interface ICPersContactOSLogFacility
@end

@implementation ICPersContactOSLogFacility

uint64_t ___ICPersContactOSLogFacility_block_invoke()
{
  _ICPersContactOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.InputContext", "PersonalizationContact");
  return MEMORY[0x270F9A758]();
}

@end