@interface BiometricPreferences
+ (BOOL)setPreferenceValue:(id)a3 forKey:(id)a4;
+ (id)preferenceValueOfClass:(Class)a3 forKey:(id)a4;
@end

@implementation BiometricPreferences

+ (id)preferenceValueOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:v4];
    if (objc_opt_isKindOfClass())
    {
      if (v7) {
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  CFPropertyListRef v8 = CFPreferencesCopyValue(v4, @"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v8)
  {
    v7 = (void *)v8;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_22;
    }
    if (__osLog) {
      v9 = __osLog;
    }
    else {
      v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      v13 = "0";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = &unk_1B3B370EE;
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v20 = 1024;
      int v21 = 1031;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
  }
  v7 = (void *)CFPreferencesCopyValue(v4, @"com.apple.biometrickitd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      v13 = "0";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = &unk_1B3B370EE;
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v20 = 1024;
      int v21 = 1049;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
    v7 = 0;
  }
LABEL_22:

  return v7;
}

+ (BOOL)setPreferenceValue:(id)a3 forKey:(id)a4
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue((CFStringRef)a4, a3, @"com.apple.biometrickitd", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return CFPreferencesSynchronize(@"com.apple.biometrickitd", v4, v5) != 0;
}

@end