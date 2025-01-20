@interface BKUIBundleSettings
+ (BOOL)BOOLForUserDefaultsKey:(id)a3;
+ (BOOL)isFpEnrollHapticFeedbackDisabled;
+ (BOOL)isUserStudy;
+ (float)floatForUserDefaultsKey:(id)a3;
+ (id)objectForKey:(id)a3;
+ (int64_t)integerForUserDefaultsKey:(id)a3;
+ (void)isFpEnrollHapticFeedbackDisabled;
+ (void)isUserStudy;
+ (void)setBool:(BOOL)a3 forUserDefaultsKey:(id)a4;
+ (void)setInteger:(int64_t)a3 forUserDefaultsKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)synchronize;
@end

@implementation BKUIBundleSettings

+ (void)synchronize
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Synchronize bundle settings", v0, 2u);
}

+ (BOOL)isFpEnrollHapticFeedbackDisabled
{
  CFBooleanRef v2 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"enableEnrollVibe", @"com.apple.biometrickitd");
  if (v2)
  {
    CFBooleanRef v3 = v2;
    BOOL v4 = CFBooleanGetValue(v2) == 0;
    CFRelease(v3);
  }
  else
  {
    BOOL v4 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled]();
  }
  return v4;
}

+ (BOOL)isUserStudy
{
  CFBooleanRef v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"userStudy"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIBundleSettings isUserStudy]();
  }
  return v3;
}

+ (void)setBool:(BOOL)a3 forUserDefaultsKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIBundleSettings setBool:forUserDefaultsKey:]();
  }
  v7 = [NSNumber numberWithBool:v4];
  [a1 setObject:v7 forKey:v6];

  [a1 synchronize];
}

+ (void)setInteger:(int64_t)a3 forUserDefaultsKey:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIBundleSettings setInteger:forUserDefaultsKey:]((uint64_t)v6, a3, v7, v8, v9, v10, v11, v12);
  }
  v13 = [NSNumber numberWithInteger:a3];
  [a1 setObject:v13 forKey:v6];

  [a1 synchronize];
}

+ (BOOL)BOOLForUserDefaultsKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings BOOLForUserDefaultsKey:]();
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    char v6 = 0;
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  char v6 = [v5 BOOLValue];
LABEL_6:

  return v6;
}

+ (int64_t)integerForUserDefaultsKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings integerForUserDefaultsKey:]();
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    int64_t v6 = 0;
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  int64_t v6 = [v5 integerValue];
LABEL_6:

  return v6;
}

+ (float)floatForUserDefaultsKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[BKUIBundleSettings floatForUserDefaultsKey:]();
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    float v7 = 0.0;
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  [v5 floatValue];
  float v7 = v6;
LABEL_6:

  return v7;
}

+ (id)objectForKey:(id)a3
{
  char v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.biometrickitui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  return v3;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
}

+ (void)isFpEnrollHapticFeedbackDisabled
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Is haptic feedback disabled: %i", v0, 8u);
}

+ (void)isUserStudy
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Is user study: %i", v0, 8u);
}

+ (void)setBool:forUserDefaultsKey:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v2 = 2112;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Setting BOOL: \"%i\", for key: \"%@\"", v1, 0x12u);
}

+ (void)setInteger:(uint64_t)a3 forUserDefaultsKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)BOOLForUserDefaultsKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4B6C000, MEMORY[0x1E4F14500], v0, "BiometricKitUI: Bool for key: \"%@\", is: \"%@\"", v1, v2, v3, v4, v5);
}

+ (void)integerForUserDefaultsKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4B6C000, MEMORY[0x1E4F14500], v0, "BiometricKitUI: Integer for key: \"%@\", is: \"%@\"", v1, v2, v3, v4, v5);
}

+ (void)floatForUserDefaultsKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4B6C000, MEMORY[0x1E4F14500], v0, "BiometricKitUI: Float for key: \"%@\", is: \"%@\"", v1, v2, v3, v4, v5);
}

@end