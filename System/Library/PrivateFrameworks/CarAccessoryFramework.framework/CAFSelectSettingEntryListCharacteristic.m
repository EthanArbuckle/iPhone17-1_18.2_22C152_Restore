@interface CAFSelectSettingEntryListCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFSelectSettingEntryList)selectSettingEntryListValue;
- (id)formattedValue;
- (void)setSelectSettingEntryListValue:(id)a3;
@end

@implementation CAFSelectSettingEntryListCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSelectSettingEntryListCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFSelectSettingEntryList)selectSettingEntryListValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFSelectSettingEntryList selectSettingEntryListWithArray:v2];

  return (CAFSelectSettingEntryList *)v3;
}

- (void)setSelectSettingEntryListValue:(id)a3
{
  id v4 = [a3 selectSettingEntrys];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFSelectSettingEntryListCharacteristic *)self selectSettingEntryListValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"SelectSettingEntryList";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000036000024";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end