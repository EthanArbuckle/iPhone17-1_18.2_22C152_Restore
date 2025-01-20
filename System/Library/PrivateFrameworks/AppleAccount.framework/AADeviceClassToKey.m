@interface AADeviceClassToKey
@end

@implementation AADeviceClassToKey

void ___AADeviceClassToKey_block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"iPhone";
  v2[1] = @"iPad";
  v3[0] = @"IPHONE";
  v3[1] = @"IPAD";
  v2[2] = @"iPod";
  v2[3] = @"AppleTV";
  v3[2] = @"IPOD";
  v3[3] = @"APPLETV";
  v2[4] = @"Watch";
  v3[4] = @"WATCH";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)_AADeviceClassToKey_deviceMapping;
  _AADeviceClassToKey_deviceMapping = v0;
}

@end