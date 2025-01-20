@interface LACSysUtility
+ (BOOL)isTXMDevice;
+ (unint64_t)txmSecurityBootMode;
+ (void)isTXMDevice;
@end

@implementation LACSysUtility

+ (BOOL)isTXMDevice
{
  int v8 = 0;
  size_t v7 = 4;
  unsigned int v6 = 0;
  size_t v5 = 4;
  if (sysctlbyname("security.codesigning.monitor", &v8, &v7, 0, 0))
  {
    v2 = LACLogDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      +[LACSysUtility isTXMDevice]();
    }
LABEL_7:

    goto LABEL_8;
  }
  if (sysctlbyname("security.codesigning.config", &v6, &v5, 0, 0))
  {
    v2 = LACLogDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      +[LACSysUtility isTXMDevice]();
    }
    goto LABEL_7;
  }
  if (v8 == 2) {
    return v6 >> 31;
  }
LABEL_8:
  LOBYTE(v3) = 0;
  return v3;
}

+ (unint64_t)txmSecurityBootMode
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  size_t v7 = 4;
  int v2 = sysctlbyname("security.codesigning.security_boot_mode_complete", &v8, &v7, 0, 0);
  BOOL v3 = LACLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = v8;
    int v5 = *__error();
    *(_DWORD *)buf = 67109632;
    unsigned int v10 = v4;
    __int16 v11 = 1024;
    int v12 = v2;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "TXM boot mode returned value: %d error: %d global error: %d", buf, 0x14u);
  }

  if (v2) {
    return 0;
  }
  else {
    return v8;
  }
}

+ (void)isTXMDevice
{
  __error();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_254F14000, v0, v1, "Sysctl security.codesigning.monitor failed with error code: %d global error: %d", v2, v3, v4, v5, v6);
}

@end