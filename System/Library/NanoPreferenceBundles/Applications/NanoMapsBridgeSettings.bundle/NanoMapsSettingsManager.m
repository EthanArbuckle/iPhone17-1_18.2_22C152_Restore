@interface NanoMapsSettingsManager
+ (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4;
+ (id)stringForKey:(id)a3;
+ (void)_synchronizeKey:(id)a3;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setString:(id)a3 forKey:(id)a4;
+ (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4;
@end

@implementation NanoMapsSettingsManager

+ (void)_synchronizeKey:(id)a3
{
  id v3 = a3;
  v4 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  id v5 = [v4 synchronize];

  id v7 = (id)objc_opt_new();
  v6 = +[NSSet setWithObject:v3];

  [v7 synchronizeNanoDomain:@"com.apple.NanoMaps" keys:v6];
}

+ (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v5 = a3;
  v6 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  id v7 = [v6 synchronize];
  char v10 = 0;
  unsigned __int8 v8 = [v6 BOOLForKey:v5 keyExistsAndHasValidFormat:&v10];

  if (v10) {
    a4 = v8;
  }

  return a4;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  [v7 setBool:v4 forKey:v6];
  [a1 _synchronizeKey:v6];
}

+ (BOOL)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  id v7 = [v6 synchronize];
  unsigned __int8 v8 = [v6 objectForKey:v5];

  if (v8) {
    a4 = (unint64_t)[v8 unsignedIntegerValue];
  }

  return a4 != 0;
}

+ (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKey:v6];

  [a1 _synchronizeKey:v6];
}

+ (id)stringForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  id v5 = [v4 synchronize];
  id v6 = [v4 stringForKey:v3];

  return v6;
}

+ (void)setString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NPSDomainAccessor nanoMapsDomainAccessor];
  [v8 setObject:v7 forKey:v6];

  [a1 _synchronizeKey:v6];
}

@end