@interface SettingsUtilities
+ (BOOL)BOOLForKey:(id)a3;
+ (id)objectForKey:(id)a3;
+ (id)settingsBundle;
+ (id)settingsDefaults;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SettingsUtilities

+ (id)settingsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

+ (id)settingsDefaults
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Journal"];

  return v2;
}

+ (BOOL)BOOLForKey:(id)a3
{
  v3 = [a1 objectForKey:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NSNumber numberWithBool:v4];
  [a1 setObject:v7 forKey:v6];
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Journal"];
  v5 = [v4 objectForKey:v3];

  return v5;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Journal"];
  [v7 setObject:v6 forKey:v5];
}

@end