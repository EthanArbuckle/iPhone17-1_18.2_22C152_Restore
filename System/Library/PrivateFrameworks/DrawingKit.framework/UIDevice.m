@interface UIDevice
@end

@implementation UIDevice

void __45__UIDevice_DKExtensions__dk_deviceSupportsGL__block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 _graphicsQuality];

  if (v1 == 10)
  {
    dk_deviceSupportsGL_useGL = 0;
  }
  else
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:3];
    dk_deviceSupportsGL_useGL = v2 != 0;
  }
}

@end