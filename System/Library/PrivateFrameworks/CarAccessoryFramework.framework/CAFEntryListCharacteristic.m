@interface CAFEntryListCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFEntryList)entryListValue;
- (id)formattedValue;
- (void)setEntryListValue:(id)a3;
@end

@implementation CAFEntryListCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEntryListCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFEntryList)entryListValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFEntryList entryListWithArray:v2];

  return (CAFEntryList *)v3;
}

- (void)setEntryListValue:(id)a3
{
  id v4 = [a3 entrys];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFEntryListCharacteristic *)self entryListValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"EntryList";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x000000003000005D";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end