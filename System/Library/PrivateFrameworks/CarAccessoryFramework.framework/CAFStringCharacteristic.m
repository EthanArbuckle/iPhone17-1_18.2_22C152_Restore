@interface CAFStringCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (NSString)stringValue;
- (id)formattedValue;
- (void)setStringValue:(id)a3;
@end

@implementation CAFStringCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFStringCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSString)stringValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return (NSString *)v6;
}

- (void)setStringValue:(id)a3
{
  id v4 = (id)[a3 copy];
  [(CAFCharacteristic *)self setValue:v4];
}

- (id)formattedValue
{
  id v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    id v4 = [(CAFStringCharacteristic *)self stringValue];
  }
  else
  {
    id v4 = @"(null)";
  }
  v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"string";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end