@interface CAFSymbolNameAndColorCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFSymbolNameAndColor)symbolNameAndColorValue;
- (id)formattedValue;
- (void)setSymbolNameAndColorValue:(id)a3;
@end

@implementation CAFSymbolNameAndColorCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSymbolNameAndColorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFSymbolNameAndColor)symbolNameAndColorValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFSymbolNameAndColor symbolNameAndColorWithArray:v2];

  return (CAFSymbolNameAndColor *)v3;
}

- (void)setSymbolNameAndColorValue:(id)a3
{
  id v4 = [a3 symbolImageWithColors];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFSymbolNameAndColorCharacteristic *)self symbolNameAndColorValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"SymbolNameAndColor";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end