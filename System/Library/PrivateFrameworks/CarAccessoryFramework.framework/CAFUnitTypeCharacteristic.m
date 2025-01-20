@interface CAFUnitTypeCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (NSUnit)unitValue;
- (id)formattedValue;
- (void)setUnitValue:(id)a3;
@end

@implementation CAFUnitTypeCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUnitTypeCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSUnit)unitValue
{
  int v2 = [(CAFUnitTypeCharacteristic *)self unitTypeValue];
  return (NSUnit *)NSUnitFromCAFUnitType(v2);
}

- (void)setUnitValue:(id)a3
{
  uint64_t v4 = CAFUnitTypeFromNSUnit(a3);
  [(CAFUnitTypeCharacteristic *)self setUnitTypeValue:v4];
}

- (id)formattedValue
{
  int v2 = [(CAFUInt16Characteristic *)self uint16Value];
  return NSStringFromUnitType(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"UnitType";
}

+ (id)secondaryCharacteristicFormats
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000046000004";
  v4[1] = @"0x0000000046000001";
  v4[2] = @"0x0000000046000005";
  v4[3] = @"0x00000000FF00000F";
  int v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  return v2;
}

@end