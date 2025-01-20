@interface AKUserDefaults
+ (id)objectForKey:(id)a3;
+ (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation AKUserDefaults

+ (void)setValue:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, kCFPreferencesAnyApplication);

  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 objectForKey:v3];

  return v5;
}

@end