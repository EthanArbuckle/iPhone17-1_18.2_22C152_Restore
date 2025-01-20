@interface CAFDictionaryCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (NSDictionary)dictionaryValue;
- (id)formattedValue;
- (void)setDictionaryValue:(id)a3;
@end

@implementation CAFDictionaryCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDictionaryCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSDictionary)dictionaryValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (void)setDictionaryValue:(id)a3
{
  id v4 = (id)[a3 copy];
  [(CAFCharacteristic *)self setValue:v4];
}

- (id)formattedValue
{
  id v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    id v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
    v5 = [v4 description];
  }
  else
  {
    v5 = @"(null)";
  }

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"dictionary";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end