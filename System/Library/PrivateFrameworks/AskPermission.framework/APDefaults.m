@interface APDefaults
+ (BOOL)APSDevelopmentEnvironment;
+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5;
+ (BOOL)isApprover;
+ (BOOL)isRequester;
+ (BOOL)retryNotificationRegistration;
+ (id)_valueForKey:(id)a3;
+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4;
+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4;
+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5;
+ (void)_setBool:(BOOL)a3 forKey:(id)a4;
+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5;
+ (void)_setInteger:(int64_t)a3 forKey:(id)a4;
+ (void)_setValue:(id)a3 forKey:(id)a4;
+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5;
+ (void)setAPSDevelopmentEnvironment:(BOOL)a3;
+ (void)setIsApprover:(BOOL)a3;
+ (void)setIsRequester:(BOOL)a3;
+ (void)setRetryNotificationRegistration:(BOOL)a3;
@end

@implementation APDefaults

+ (BOOL)APSDevelopmentEnvironment
{
  return [a1 _BOOLForKey:@"APSDevelopmentEnvironment" defaultValue:0];
}

+ (BOOL)isApprover
{
  return [a1 _BOOLForKey:@"isApprover" defaultValue:0];
}

+ (BOOL)isRequester
{
  return [a1 _BOOLForKey:@"isRequester" defaultValue:0];
}

+ (BOOL)retryNotificationRegistration
{
  return [a1 _BOOLForKey:@"retryRegistration" defaultValue:0];
}

+ (void)setAPSDevelopmentEnvironment:(BOOL)a3
{
}

+ (void)setIsApprover:(BOOL)a3
{
}

+ (void)setIsRequester:(BOOL)a3
{
}

+ (void)setRetryNotificationRegistration:(BOOL)a3
{
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  return [a1 _BOOLForKey:a3 defaultValue:a4 domain:@"com.apple.AskPermission"];
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  else {
    return a4;
  }
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return [a1 _integerForKey:a3 defaultValue:a4 domain:@"com.apple.AskPermission"];
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5
{
  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    return AppIntegerValue;
  }
  else {
    return a4;
  }
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4
{
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  v6 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    v6 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue((CFStringRef)a4, *v6, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [a1 _setValue:v8 forKey:v7];
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
}

+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (id)_valueForKey:(id)a3
{
  return (id)[a1 _valueForKey:a3 domain:@"com.apple.AskPermission"];
}

+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4
{
  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

@end