@interface _ASDevice
+ (BOOL)isBiometricAuthenticationAvailable;
+ (BOOL)isCABLEClient;
+ (BOOL)isCompanionAuthenticationAvailable;
+ (BOOL)isPad;
+ (BOOL)shouldRequireLocalAuthenticationForPasswords;
+ (BOOL)shouldRequireLocalAuthenticationForPlatformCredentials;
+ (int)deviceClass;
+ (int64_t)_localAuthenticationBiometricsAvailability;
+ (int64_t)biometryType;
+ (void)biometryType;
+ (void)isBiometricAuthenticationAvailable;
+ (void)isCompanionAuthenticationAvailable;
+ (void)shouldRequireLocalAuthenticationForPasswords;
@end

@implementation _ASDevice

+ (BOOL)isPad
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __18___ASDevice_isPad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPad_onceToken != -1) {
    dispatch_once(&isPad_onceToken, block);
  }
  return isPad_isPad;
}

+ (BOOL)isBiometricAuthenticationAvailable
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  id v9 = 0;
  char v3 = [v2 canEvaluatePolicy:1 error:&v9];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[_ASDevice isBiometricAuthenticationAvailable](v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219326000, v6, OS_LOG_TYPE_INFO, "No biometrics available", v8, 2u);
    }
  }

  return v3;
}

+ (BOOL)isCompanionAuthenticationAvailable
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  id v9 = 0;
  char v3 = [v2 canEvaluatePolicy:3 error:&v9];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[_ASDevice isCompanionAuthenticationAvailable](v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219326000, v6, OS_LOG_TYPE_INFO, "No companion auth available", v8, 2u);
    }
  }

  return v3;
}

+ (BOOL)shouldRequireLocalAuthenticationForPasswords
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  id v9 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v9];
  id v4 = v9;
  v5 = v4;
  if (v3)
  {
LABEL_6:
    BOOL v6 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "safari_matchesErrorDomain:andCode:", *MEMORY[0x263F10440], -5) & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_ASDevice shouldRequireLocalAuthenticationForPasswords](v7);
    }
    goto LABEL_6;
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

+ (int64_t)_localAuthenticationBiometricsAvailability
{
  return 3;
}

+ (BOOL)shouldRequireLocalAuthenticationForPlatformCredentials
{
  return 1;
}

+ (int64_t)biometryType
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  id v8 = 0;
  char v3 = [v2 canEvaluatePolicy:1 error:&v8];
  id v4 = v8;
  if (v3)
  {
    int64_t v5 = [v2 biometryType];
  }
  else
  {
    BOOL v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_ASDevice biometryType](v6);
    }
    int64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)isCABLEClient
{
  unsigned int v2 = [a1 deviceClass];
  return (v2 < 0xA) & (0x20Au >> v2);
}

+ (int)deviceClass
{
  if (deviceClass_onceToken != -1) {
    dispatch_once(&deviceClass_onceToken, &__block_literal_global);
  }
  return deviceClass_deviceClass;
}

+ (void)isBiometricAuthenticationAvailable
{
  id v2 = a1;
  char v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Local Auth returned error when checking biometric auth availability: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)isCompanionAuthenticationAvailable
{
  id v2 = a1;
  char v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Local Auth returned error when checking companion auth availability: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)shouldRequireLocalAuthenticationForPasswords
{
  id v2 = a1;
  char v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Local Auth returned error when checking password auth availability: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)biometryType
{
  id v2 = a1;
  char v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Cannot evaluate biometrics: %{public}@", v6, v7, v8, v9, v10);
}

@end