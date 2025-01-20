@interface CAFDataCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (NSData)dataValue;
- (id)formattedValue;
- (void)setDataValue:(id)a3;
@end

@implementation CAFDataCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDataCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSData)dataValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (void)setDataValue:(id)a3
{
  id v4 = (id)[a3 copy];
  [(CAFCharacteristic *)self setValue:v4];
}

- (id)formattedValue
{
  id v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    id v4 = NSString;
    v5 = [(CAFDataCharacteristic *)self dataValue];
    uint64_t v6 = [v5 length];
    v7 = [(CAFDataCharacteristic *)self dataValue];
    v8 = [v7 description];
    [v4 stringWithFormat:@"bytes=%lu %@", v6, v8];
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = @"(null)";
  }

  return v9;
}

+ (id)primaryCharacteristicFormat
{
  return @"data";
}

+ (id)secondaryCharacteristicFormats
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000032000020";
  v4[1] = @"0x00000000FF00000C";
  v4[2] = @"0x00000000FF00000D";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

@end