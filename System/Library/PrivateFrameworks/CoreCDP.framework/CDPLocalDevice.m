@interface CDPLocalDevice
+ (BOOL)hasLocalSecret;
+ (id)sharedInstance;
- (BOOL)_currentProcessCreatesDaemonTypeProxy;
- (BOOL)_isHomePod;
- (BOOL)currentProcessHasEntitlement:(id)a3;
- (BOOL)hasLocalSecret;
- (BOOL)supportsSecureBackupRecovery;
- (CDPLocalDevice)init;
- (NSNumber)localSecretGeneration;
- (id)deviceClass;
- (id)deviceName;
- (id)hardwareModel;
- (id)marketingModel;
- (id)modelVersion;
- (id)osVersion;
- (id)serialNumber;
- (void)localSecretGeneration;
- (void)serialNumber;
@end

@implementation CDPLocalDevice

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_64);
  }
  v2 = (void *)sharedInstance_localDevice;
  return v2;
}

uint64_t __32__CDPLocalDevice_sharedInstance__block_invoke()
{
  sharedInstance_localDevice = objc_alloc_init(CDPLocalDevice);
  return MEMORY[0x270F9A758]();
}

- (CDPLocalDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)CDPLocalDevice;
  v2 = [(CDPLocalDevice *)&v8 init];
  v3 = v2;
  if (v2)
  {
    if ([(CDPLocalDevice *)v2 _currentProcessCreatesDaemonTypeProxy]) {
      CDPDLocalDeviceSecretProxyImplClass = getCDPDLocalDeviceSecretProxyImplClass();
    }
    else {
      CDPDLocalDeviceSecretProxyImplClass = (objc_class *)CDPLocalDeviceSecretProxyImpl;
    }
    v5 = (CDPLocalDeviceSecretProxy *)objc_alloc_init(CDPDLocalDeviceSecretProxyImplClass);
    localSecretProxy = v3->_localSecretProxy;
    v3->_localSecretProxy = v5;
  }
  return v3;
}

- (BOOL)hasLocalSecret
{
  return [(CDPLocalDeviceSecretProxy *)self->_localSecretProxy hasLocalSecret];
}

+ (BOOL)hasLocalSecret
{
  v2 = +[CDPLocalDevice sharedInstance];
  char v3 = [v2 hasLocalSecret];

  return v3;
}

- (NSNumber)localSecretGeneration
{
  v2 = (void *)MKBGetDeviceConfigurations();
  if (v2)
  {
    char v3 = @"PasscodeGeneration";
    v4 = [v2 objectForKeyedSubscript:v3];
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v6 = _CDPLogSystem();
      v7 = v6;
      if (isKindOfClass)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[CDPLocalDevice localSecretGeneration]();
        }

        id v8 = v4;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(CDPLocalDevice *)(uint64_t)v4 localSecretGeneration];
      }
    }
    else
    {
      v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CDPLocalDevice localSecretGeneration]();
      }
    }

    id v8 = 0;
LABEL_15:

    goto LABEL_16;
  }
  _CDPLogSystem();
  char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
    -[CDPLocalDevice localSecretGeneration]((os_log_t)v3);
  }
  id v8 = 0;
LABEL_16:

  return (NSNumber *)v8;
}

- (BOOL)supportsSecureBackupRecovery
{
  return ![(CDPLocalDevice *)self _isHomePod];
}

- (id)marketingModel
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)hardwareModel
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)modelVersion
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)osVersion
{
  v2 = (void *)MGCopyAnswer();
  if (+[CDPUtilities isInternalBuild])
  {
    uint64_t v3 = MGCopyAnswer();

    v2 = (void *)v3;
  }
  return v2;
}

- (id)deviceClass
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CDPLocalDevice serialNumber]();
  }

  return v2;
}

- (id)deviceName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (BOOL)_currentProcessCreatesDaemonTypeProxy
{
  return [(CDPLocalDevice *)self currentProcessHasEntitlement:@"com.apple.managedconfiguration.profiled-access"];
}

- (BOOL)currentProcessHasEntitlement:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  if (currentProcessHasEntitlement__onceToken != -1) {
    dispatch_once(&currentProcessHasEntitlement__onceToken, &__block_literal_global_98);
  }
  if (currentProcessHasEntitlement__taskRef)
  {
    CFErrorRef error = 0;
    v4 = (void *)SecTaskCopyValueForEntitlement((SecTaskRef)currentProcessHasEntitlement__taskRef, v3, &error);
    if (error)
    {
      v5 = _CDPLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CDPLocalDevice currentProcessHasEntitlement:]();
      }

      CFRelease(error);
    }
    if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFBooleanGetTypeID())) {
      char v7 = [v4 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPLocalDevice currentProcessHasEntitlement:](v8);
    }

    char v7 = 0;
  }

  return v7;
}

SecTaskRef __47__CDPLocalDevice_currentProcessHasEntitlement___block_invoke()
{
  SecTaskRef result = SecTaskCreateFromSelf(0);
  currentProcessHasEntitlement__taskRef = (uint64_t)result;
  return result;
}

- (BOOL)_isHomePod
{
  return MGGetSInt32Answer() == 7;
}

- (void).cxx_destruct
{
}

- (void)localSecretGeneration
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v6 = v5;
  _os_log_error_impl(&dword_2182AE000, a3, OS_LOG_TYPE_ERROR, "Unexpectedly got type %{public}@ for %{public}@", v7, 0x16u);
}

- (void)serialNumber
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Reporting current serial number: %@", v1, 0xCu);
}

- (void)currentProcessHasEntitlement:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "Unable to check self process entitlements without SecTaskRef.", v1, 2u);
}

- (void)currentProcessHasEntitlement:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2182AE000, v1, OS_LOG_TYPE_ERROR, "Error when checking self process for entitlement %@. error:%@", v2, 0x16u);
}

@end