@interface AULoggingFacility
@end

@implementation AULoggingFacility

uint64_t ___AULoggingFacility_block_invoke()
{
  _AULoggingFacility_oslog = (uint64_t)os_log_create("com.apple.Settings.AppSystemSettingsUI", "Default");
  return MEMORY[0x270F9A758]();
}

@end