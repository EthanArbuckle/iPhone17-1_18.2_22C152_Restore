@interface AADeviceListLogSystem
@end

@implementation AADeviceListLogSystem

uint64_t ___AADeviceListLogSystem_block_invoke()
{
  _AADeviceListLogSystem_log = (uint64_t)os_log_create("com.apple.appleaccount", "deviceList");

  return MEMORY[0x1F41817F8]();
}

@end