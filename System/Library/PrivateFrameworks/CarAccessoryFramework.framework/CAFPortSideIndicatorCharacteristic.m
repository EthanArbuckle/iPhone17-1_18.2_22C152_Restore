@interface CAFPortSideIndicatorCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFPortSideIndicatorCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPortSideIndicatorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFPortSideIndicatorCharacteristic *)self portSideIndicatorValue];
  return (id)NSStringFromPortSideIndicator(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000041000013";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end