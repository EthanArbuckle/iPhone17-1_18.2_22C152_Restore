@interface ASUDefaultsManager
+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5;
+ (BOOL)_isRunningInAppleVirtualMachine;
+ (double)_doubleForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(double)a5;
+ (id)_copyNumberForKey:(__CFString *)a3 applicationId:(__CFString *)a4;
+ (id)copyDefaultsKeyForEncryptionKeyWithIdentifier:(id)a3;
+ (id)databaseEncryptionKeyWithIdentifier:(uint64_t)a1;
+ (id)transporterConfiguration;
+ (uint64_t)setTransporterConfiguration:(uint64_t)a1;
+ (void)_setBool:(BOOL)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5;
+ (void)_setDouble:(double)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5;
+ (void)_setNullableValue:(void *)a3 forKey:(__CFString *)a4;
+ (void)setDatabaseEncryptionKey:(void *)a3 withIdentifier:;
@end

@implementation ASUDefaultsManager

+ (id)databaseEncryptionKeyWithIdentifier:(uint64_t)a1
{
  id v2 = a2;
  v3 = (__CFString *)[self copyDefaultsKeyForEncryptionKeyWithIdentifier:v2];

  v4 = (void *)CFPreferencesCopyAppValue(v3, @"com.apple.appstoreutilities");
  if (v4) {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:0];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (void)setDatabaseEncryptionKey:(void *)a3 withIdentifier:
{
  id v4 = a3;
  id v5 = a2;
  key = (__CFString *)[self copyDefaultsKeyForEncryptionKeyWithIdentifier:v4];

  v6 = [v5 base64EncodedStringWithOptions:0];

  CFPreferencesSetAppValue(key, v6, @"com.apple.appstoreutilities");
  CFPreferencesAppSynchronize(@"com.apple.appstoreutilities");
}

+ (id)copyDefaultsKeyForEncryptionKeyWithIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263F27BF8];
  id v5 = a3;
  v6 = [v4 serialNumber];
  v7 = v6;
  if (!v6)
  {
    if (([a1 _isRunningInAppleVirtualMachine] & 1) == 0)
    {
      v8 = ASULogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_247E53000, v8, OS_LOG_TYPE_FAULT, "Database defaults key generation failed unexpectedly", buf, 2u);
      }
    }
    v7 = @"xyzzy";
  }
  v9 = v7;

  v10 = [v5 stringByAppendingString:v9];

  v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", objc_msgSend(v10, "hash"));
  return v11;
}

+ (id)transporterConfiguration
{
  self;
  v0 = (void *)CFPreferencesCopyAppValue(@"TransporterConfiguration", @"com.apple.appstoreutilities");

  return v0;
}

+ (uint64_t)setTransporterConfiguration:(uint64_t)a1
{
  id v2 = a2;
  self;
  CFPreferencesSetAppValue(@"TransporterConfiguration", v2, @"com.apple.appstoreutilities");

  return CFPreferencesAppSynchronize(@"com.apple.appstoreutilities");
}

+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v6 = CFPreferencesGetAppBooleanValue(a3, a4, &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat == 1) {
    return v6;
  }
  else {
    return a5;
  }
}

+ (void)_setBool:(BOOL)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5
{
  v7 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(a4, v7, a5);
}

+ (double)_doubleForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(double)a5
{
  BOOL v6 = (void *)[a1 _copyNumberForKey:a3 applicationId:a4];
  v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    a5 = v8;
  }

  return a5;
}

+ (void)_setDouble:(double)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5
{
  v7 = (const void *)[NSNumber numberWithDouble:a3];

  CFPreferencesSetAppValue(a4, v7, a5);
}

+ (id)_copyNumberForKey:(__CFString *)a3 applicationId:(__CFString *)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue(a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (void)_setNullableValue:(void *)a3 forKey:(__CFString *)a4
{
  CFPreferencesSetAppValue(a4, a3, @"com.apple.appstoreutilities");

  CFPreferencesAppSynchronize(@"com.apple.appstoreutilities");
}

+ (BOOL)_isRunningInAppleVirtualMachine
{
  if (qword_2692D0860 != -1) {
    dispatch_once(&qword_2692D0860, &__block_literal_global_1);
  }
  return _MergedGlobals != 0;
}

void __53__ASUDefaultsManager__isRunningInAppleVirtualMachine__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  size_t v2 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &_MergedGlobals, &v2, 0, 0))
  {
    v0 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      int v1 = *__error();
      *(_DWORD *)buf = 67109120;
      int v4 = v1;
      _os_log_fault_impl(&dword_247E53000, v0, OS_LOG_TYPE_FAULT, "sysctlbyname for kern.hv_vmm_present failed with error: %{darwin.errno}d", buf, 8u);
    }
  }
}

@end