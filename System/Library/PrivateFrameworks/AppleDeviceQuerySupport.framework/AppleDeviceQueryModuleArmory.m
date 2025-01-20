@interface AppleDeviceQueryModuleArmory
- (AppleDeviceQueryModuleArmory)initWithError:(id *)a3;
@end

@implementation AppleDeviceQueryModuleArmory

- (AppleDeviceQueryModuleArmory)initWithError:(id *)a3
{
  v6 = self;
  if (a3)
  {
    *a3 = 0;
    v6 = [(AppleDeviceQueryModuleArmory *)self init];
    v11 = v6;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m", "-[AppleDeviceQueryModuleArmory initWithError:]", 29, @"Failed to initialize a module instance!", v8, v9, v10, v13);
      *a3 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:18 underlyingError:0];
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m", "-[AppleDeviceQueryModuleArmory initWithError:]", 21, @"error p-pointer is nil!", v3, v4, v5, v13);
    v11 = 0;
  }

  return v11;
}

@end