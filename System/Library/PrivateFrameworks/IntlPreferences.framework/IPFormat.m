@interface IPFormat
+ (id)localeFromDeviceLanguage;
+ (id)localeFromDeviceLocale;
@end

@implementation IPFormat

+ (id)localeFromDeviceLocale
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v4 = [v3 localeIdentifier];
  v5 = [v2 localeWithLocaleIdentifier:v4];

  return v5;
}

+ (id)localeFromDeviceLanguage
{
  v2 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v3 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v2];
  v4 = (void *)[v3 mutableCopy];

  v5 = (void *)MEMORY[0x1E4F1CA20];
  v6 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v7 = [v6 localeIdentifier];
  v8 = [v5 componentsFromLocaleIdentifier:v7];

  v9 = [v8 objectForKeyedSubscript:@"numbers"];
  [v4 setObject:v9 forKeyedSubscript:@"numbers"];

  v10 = [v8 objectForKeyedSubscript:@"calendar"];
  [v4 setObject:v10 forKeyedSubscript:@"calendar"];

  v11 = (void *)MEMORY[0x1E4F1CA20];
  v12 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v4];
  v13 = [v11 localeWithLocaleIdentifier:v12];

  return v13;
}

@end