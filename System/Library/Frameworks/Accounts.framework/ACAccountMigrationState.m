@interface ACAccountMigrationState
+ (BOOL)isMigrationFinished;
+ (BOOL)migrationFinishedForKey:(__CFString *)a3;
+ (id)_currentSystemVersion;
+ (void)writeMigrationVersionPref;
+ (void)writeMigrationVersionPrefForKey:(__CFString *)a3;
@end

@implementation ACAccountMigrationState

+ (BOOL)isMigrationFinished
{
  return [a1 migrationFinishedForKey:@"LastMigrationSystemVersion"];
}

+ (BOOL)migrationFinishedForKey:(__CFString *)a3
{
  v4 = [a1 _currentSystemVersion];
  CFPreferencesAppSynchronize(@"com.apple.accountsd");
  CFStringRef v5 = (const __CFString *)CFPreferencesCopyAppValue(a3, @"com.apple.accountsd");
  if (v5)
  {
    CFStringRef v6 = v5;
    BOOL v7 = CFStringCompare(v4, v5, 1uLL) == kCFCompareEqualTo;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)_currentSystemVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD10]);
    CFStringRef v5 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v3);
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

+ (void)writeMigrationVersionPref
{
}

+ (void)writeMigrationVersionPrefForKey:(__CFString *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a1 _currentSystemVersion];
  CFStringRef v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    BOOL v7 = v4;
    __int16 v8 = 2112;
    v9 = a3;
    _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"Writing Accounts ACLastMigrationSystemVersion version pref %@ for key %@\"", (uint8_t *)&v6, 0x16u);
  }

  if (v4)
  {
    CFPreferencesSetAppValue(a3, v4, @"com.apple.accountsd");
    CFPreferencesAppSynchronize(@"com.apple.accountsd");
  }
}

@end