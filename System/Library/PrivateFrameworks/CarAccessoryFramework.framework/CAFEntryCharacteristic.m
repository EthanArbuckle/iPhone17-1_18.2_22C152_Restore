@interface CAFEntryCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFEntry)entryValue;
- (id)formattedValue;
- (void)setEntryValue:(id)a3;
@end

@implementation CAFEntryCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEntryCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFEntry)entryValue
{
  v3 = [CAFEntry alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFEntry *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setEntryValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFEntryCharacteristic *)self entryValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"Entry";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end