@interface LACMobileGestalt
+ (BOOL)deviceHasFaceID;
+ (BOOL)deviceHasOpticID;
+ (BOOL)deviceHasTouchID;
+ (BOOL)deviceSupportsExclaves;
+ (BOOL)hasBridge;
+ (BOOL)isAppleSilicon;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (BOOL)isIdiomPad;
+ (BOOL)isIdiomPhone;
+ (BOOL)isSharedIPad;
+ (BOOL)isVirtualMachine;
+ (id)marketingDeviceFamilyName;
+ (id)marketingDeviceName;
+ (id)serialNumber;
+ (int)_deviceClass;
+ (unint64_t)currentDeviceScreenSize;
+ (unint64_t)faceIDCameraOrientation;
+ (void)faceIDCameraOrientation;
@end

@implementation LACMobileGestalt

+ (unint64_t)currentDeviceScreenSize
{
  unsigned int v2 = MGGetSInt32Answer() - 3;
  if (v2 > 0x16) {
    return 14;
  }
  else {
    return qword_254FD07E0[v2];
  }
}

+ (BOOL)isIdiomPad
{
  return [a1 _deviceClass] == 3;
}

+ (BOOL)isIdiomPhone
{
  return [a1 _deviceClass] == 1;
}

+ (int)_deviceClass
{
  if (_deviceClass_onceToken != -1) {
    dispatch_once(&_deviceClass_onceToken, &__block_literal_global_13);
  }
  return _deviceClass_deviceClass;
}

uint64_t __32__LACMobileGestalt__deviceClass__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _deviceClass_deviceClass = result;
  return result;
}

+ (BOOL)deviceHasFaceID
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (deviceHasFaceID_onceToken != -1) {
    dispatch_once(&deviceHasFaceID_onceToken, &__block_literal_global_6);
  }
  unsigned int v2 = LACLogGestalt();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasFaceID_hasPearl;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_INFO, "deviceHasPearl returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasFaceID_hasPearl;
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasFaceID_hasPearl = MGGetBoolAnswer();
  }
  else
  {
    v0 = LACLogGestalt();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1();
    }
  }
}

+ (BOOL)deviceHasOpticID
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (deviceHasOpticID_onceToken != -1) {
    dispatch_once(&deviceHasOpticID_onceToken, &__block_literal_global_11_0);
  }
  unsigned int v2 = LACLogGestalt();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "+[LACMobileGestalt deviceHasOpticID]";
    __int16 v6 = 1024;
    int v7 = deviceHasOpticID_hasOyster;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_INFO, "%s returned %d", (uint8_t *)&v4, 0x12u);
  }

  return deviceHasOpticID_hasOyster;
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasOpticID_hasOyster = MGGetBoolAnswer();
  }
  else
  {
    v0 = LACLogGestalt();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1();
    }
  }
}

+ (BOOL)deviceHasTouchID
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (deviceHasTouchID_onceToken != -1) {
    dispatch_once(&deviceHasTouchID_onceToken, &__block_literal_global_16_0);
  }
  unsigned int v2 = LACLogGestalt();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasTouchID_hasTouchID;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_INFO, "deviceHasTouchID returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasTouchID_hasTouchID;
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasTouchID_hasTouchID = MGGetBoolAnswer();
  }
  else
  {
    v0 = LACLogGestalt();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1();
    }
  }
}

+ (BOOL)deviceSupportsExclaves
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (deviceSupportsExclaves_onceToken != -1) {
    dispatch_once(&deviceSupportsExclaves_onceToken, &__block_literal_global_21);
  }
  unsigned int v2 = LACLogGestalt();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceSupportsExclaves_hasExclaves;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_INFO, "deviceSupportsExclaves returned %d", (uint8_t *)v4, 8u);
  }

  return deviceSupportsExclaves_hasExclaves;
}

void __42__LACMobileGestalt_deviceSupportsExclaves__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceSupportsExclaves_hasExclaves = MGGetBoolAnswer();
  }
  else
  {
    v0 = LACLogGestalt();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __42__LACMobileGestalt_deviceSupportsExclaves__block_invoke_cold_1();
    }
  }
}

+ (BOOL)isAppleSilicon
{
  return 0;
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

+ (BOOL)isSharedIPad
{
  if (isSharedIPad_onceToken != -1) {
    dispatch_once(&isSharedIPad_onceToken, &__block_literal_global_26);
  }
  return isSharedIPad__isSharedIPad == 1;
}

void __32__LACMobileGestalt_isSharedIPad__block_invoke()
{
  v0 = (void *)MKBUserTypeDeviceMode();
  v1 = v0;
  if (v0)
  {
    unsigned int v2 = [v0 objectForKeyedSubscript:*MEMORY[0x263F55A30]];
    isSharedIPad__isSharedIPad = [v2 isEqualToString:*MEMORY[0x263F55A38]];
  }
  else
  {
    unsigned int v2 = 0;
    v3 = LACLogGestalt();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __32__LACMobileGestalt_isSharedIPad__block_invoke_cold_1(0, v3);
    }
  }
}

+ (BOOL)isVirtualMachine
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasBridge
{
  return 0;
}

+ (id)marketingDeviceName
{
  unsigned int v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)marketingDeviceFamilyName
{
  unsigned int v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)serialNumber
{
  unsigned int v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (unint64_t)faceIDCameraOrientation
{
  if (!MGGetBoolAnswer() || !MGIsQuestionValid()) {
    return 0;
  }
  int v2 = MGGetSInt32Answer();
  v3 = LACLogGestalt();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[LACMobileGestalt faceIDCameraOrientation];
  }

  if (v2) {
    return 2;
  }
  else {
    return 1;
  }
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_254F14000, v0, v1, "Can't query Face ID.", v2, v3, v4, v5, v6);
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_254F14000, v0, v1, "Can't query OpticID.", v2, v3, v4, v5, v6);
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_254F14000, v0, v1, "Can't query Touch ID.", v2, v3, v4, v5, v6);
}

void __42__LACMobileGestalt_deviceSupportsExclaves__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_254F14000, v0, v1, "Can't query exclave capability.", v2, v3, v4, v5, v6);
}

void __32__LACMobileGestalt_isSharedIPad__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "MKBUserTypeDeviceMode returned NULL: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)faceIDCameraOrientation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "camera rotation: %d", (uint8_t *)v2, 8u);
}

@end