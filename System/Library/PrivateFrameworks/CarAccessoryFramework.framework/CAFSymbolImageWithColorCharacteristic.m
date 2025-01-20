@interface CAFSymbolImageWithColorCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFSymbolImageWithColor)symbolImageWithColorValue;
- (id)formattedValue;
- (void)setSymbolImageWithColorValue:(id)a3;
@end

@implementation CAFSymbolImageWithColorCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSymbolImageWithColorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFSymbolImageWithColor)symbolImageWithColorValue
{
  v3 = [CAFSymbolImageWithColor alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFSymbolImageWithColor *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setSymbolImageWithColorValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFSymbolImageWithColorCharacteristic *)self symbolImageWithColorValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"SymbolImageWithColor";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000037000008";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end