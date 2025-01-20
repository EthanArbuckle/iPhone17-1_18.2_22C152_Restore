@interface AAFDeviceInfo
+ (BOOL)_hasLocalSecret;
+ (BOOL)deviceIsAudioAccessory;
+ (BOOL)deviceIsiPad;
+ (BOOL)isDeviceUnlockedSinceBoot;
+ (BOOL)isVirtualMachine;
+ (id)localSecretType;
@end

@implementation AAFDeviceInfo

+ (BOOL)deviceIsAudioAccessory
{
  if (deviceIsAudioAccessory_onceToken != -1) {
    dispatch_once(&deviceIsAudioAccessory_onceToken, &__block_literal_global_4);
  }
  return deviceIsAudioAccessory_result;
}

uint64_t __39__AAFDeviceInfo_deviceIsAudioAccessory__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceIsAudioAccessory_uint64_t result = result == 7;
  return result;
}

+ (BOOL)deviceIsiPad
{
  if (deviceIsiPad_onceToken != -1) {
    dispatch_once(&deviceIsiPad_onceToken, &__block_literal_global_15);
  }
  return deviceIsiPad_result;
}

uint64_t __29__AAFDeviceInfo_deviceIsiPad__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceIsiPad_uint64_t result = result == 3;
  return result;
}

+ (BOOL)isDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

+ (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1) {
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_17);
  }
  return isVirtualMachine_result;
}

uint64_t __33__AAFDeviceInfo_isVirtualMachine__block_invoke()
{
  int v2 = 0;
  size_t v1 = 4;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!result) {
    isVirtualMachine_uint64_t result = v2 != 0;
  }
  return result;
}

+ (id)localSecretType
{
  if (![a1 _hasLocalSecret]) {
    return @"None";
  }
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v2 unlockScreenType]) {
    v3 = @"Password";
  }
  else {
    v3 = @"Passcode";
  }

  return v3;
}

+ (BOOL)_hasLocalSecret
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

@end