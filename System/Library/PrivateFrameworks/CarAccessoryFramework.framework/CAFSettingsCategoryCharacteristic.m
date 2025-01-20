@interface CAFSettingsCategoryCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFSettingsCategoryCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSettingsCategoryCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFSettingsCategoryCharacteristic *)self settingsCategoryValue];
  return NSStringFromSettingsCategory(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000036000006";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end