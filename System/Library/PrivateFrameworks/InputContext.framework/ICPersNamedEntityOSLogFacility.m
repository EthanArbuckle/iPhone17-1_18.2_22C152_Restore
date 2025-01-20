@interface ICPersNamedEntityOSLogFacility
@end

@implementation ICPersNamedEntityOSLogFacility

uint64_t ___ICPersNamedEntityOSLogFacility_block_invoke()
{
  _ICPersNamedEntityOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.InputContext", "PersonalizationNamedEntity");
  return MEMORY[0x270F9A758]();
}

@end