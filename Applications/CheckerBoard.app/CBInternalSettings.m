@interface CBInternalSettings
+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4;
+ (void)setPreferencesValue:(id)a3 key:(__CFString *)a4 domain:(__CFString *)a5;
@end

@implementation CBInternalSettings

+ (void)setPreferencesValue:(id)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
  CFPreferencesSetValue(a4, a3, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4
{
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(a3, a4);

  return v6;
}

@end