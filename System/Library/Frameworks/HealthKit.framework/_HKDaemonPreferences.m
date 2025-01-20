@interface _HKDaemonPreferences
+ (BOOL)_BOOLValueForKey:(id)a3;
+ (BOOL)_setPreferenceValue:(void *)a3 forKey:(id)a4;
+ (BOOL)isGenerateDemoDataSet;
+ (BOOL)isStoreDemoModeSet;
+ (BOOL)setValue:(id)a3 forKey:(id)a4;
+ (BOOL)shouldGenerateDemoData;
+ (BOOL)usingDemoDataDatabase;
+ (id)_safePreferenceForKey:(id)a3 expectedReturnClass:(Class)a4;
+ (id)valueForKey:(id)a3;
+ (void)synchronizePreferencesWithWatch:(id)a3;
@end

@implementation _HKDaemonPreferences

+ (id)valueForKey:(id)a3
{
  if (a3)
  {
    v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.healthd");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)usingDemoDataDatabase
{
  return [a1 _BOOLValueForKey:@"HealthUseDemoDataDatabaseKey"];
}

+ (BOOL)isGenerateDemoDataSet
{
  int v3 = [a1 _BOOLValueForKey:@"HealthDemoDataGenerateKey"];
  if (v3)
  {
    LOBYTE(v3) = [a1 usingDemoDataDatabase];
  }
  return v3;
}

+ (BOOL)isStoreDemoModeSet
{
  return +[_HKBehavior isRunningStoreDemoMode];
}

+ (BOOL)shouldGenerateDemoData
{
  if ([a1 isGenerateDemoDataSet]) {
    return 1;
  }

  return [a1 isStoreDemoModeSet];
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4
{
  if (a4) {
    return objc_msgSend(a1, "_setPreferenceValue:forKey:", a3);
  }
  else {
    return 0;
  }
}

+ (void)synchronizePreferencesWithWatch:(id)a3
{
}

+ (BOOL)_BOOLValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 _safePreferenceForKey:v4 expectedReturnClass:objc_opt_class()];

  if (v5) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)_safePreferenceForKey:(id)a3 expectedReturnClass:(Class)a4
{
  id v4 = [a1 valueForKey:a3];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)_setPreferenceValue:(void *)a3 forKey:(id)a4
{
  return CFPreferencesAppSynchronize(@"com.apple.healthd") != 0;
}

@end