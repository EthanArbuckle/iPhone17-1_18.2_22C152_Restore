@interface CDDevice
@end

@implementation CDDevice

uint64_t __24___CDDevice_localDevice__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    uint64_t v2 = [v1 integerValue];
    if ((unint64_t)(v2 - 1) > 6) {
      uint64_t v3 = -1;
    }
    else {
      uint64_t v3 = qword_18ECD42E8[v2 - 1];
    }
    _block_invoke_deviceClass = v3;
    CFRelease(v1);
  }
  v4 = [_CDDevice alloc];
  localDevice_localDevice = [(_CDDevice *)v4 initWithName:&stru_1EDDD9B38 deviceID:@"LOCAL" deviceClass:_block_invoke_deviceClass model:0 companion:0];
  return MEMORY[0x1F41817F8]();
}

@end