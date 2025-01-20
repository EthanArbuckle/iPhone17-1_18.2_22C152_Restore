@interface AADeviceModel
@end

@implementation AADeviceModel

uint64_t ___AADeviceModel_block_invoke()
{
  _AADeviceModel_deviceModel = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

@end