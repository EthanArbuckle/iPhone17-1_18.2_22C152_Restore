@interface LACLocalizationUtils
+ (BOOL)_shouldUseDeviceVariantForKey:(id)a3;
+ (BOOL)isLocalizationKey:(id)a3;
+ (id)decodeLocalizationKeyFromString:(id)a3 shouldUseDeviceVariant:(BOOL *)a4;
+ (id)encodeLocalizationKey:(id)a3;
+ (id)encodeLocalizationKey:(id)a3 shouldUseDeviceVariant:(BOOL)a4;
@end

@implementation LACLocalizationUtils

+ (BOOL)isLocalizationKey:(id)a3
{
  return [a3 hasPrefix:@"__LAC_LOCALIZATION_KEY__"];
}

+ (id)encodeLocalizationKey:(id)a3
{
  return (id)[a1 encodeLocalizationKey:a3 shouldUseDeviceVariant:0];
}

+ (id)encodeLocalizationKey:(id)a3 shouldUseDeviceVariant:(BOOL)a4
{
  v4 = &stru_2704025D8;
  if (a4) {
    v4 = @"__LAC_LOCALIZATION_DEVICE_VARIANT__";
  }
  return (id)[NSString stringWithFormat:@"%@%@%@", @"__LAC_LOCALIZATION_KEY__", v4, a3];
}

+ (id)decodeLocalizationKeyFromString:(id)a3 shouldUseDeviceVariant:(BOOL *)a4
{
  id v6 = a3;
  if ([a1 isLocalizationKey:v6])
  {
    if (a4) {
      *a4 = 0;
    }
    v7 = [v6 substringFromIndex:objc_msgSend(@"__LAC_LOCALIZATION_KEY__", "length")];
    if ([a1 _shouldUseDeviceVariantForKey:v7])
    {
      if (a4) {
        *a4 = 1;
      }
      id v8 = [v7 substringFromIndex:objc_msgSend(@"__LAC_LOCALIZATION_DEVICE_VARIANT__", "length")];
    }
    else
    {
      id v8 = v7;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_shouldUseDeviceVariantForKey:(id)a3
{
  return [a3 hasPrefix:@"__LAC_LOCALIZATION_DEVICE_VARIANT__"];
}

@end