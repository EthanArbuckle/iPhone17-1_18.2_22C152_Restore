@interface DeviceBuildNumber
@end

@implementation DeviceBuildNumber

uint64_t ___DeviceBuildNumber_block_invoke()
{
  _DeviceBuildNumber_buildNumber = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

@end