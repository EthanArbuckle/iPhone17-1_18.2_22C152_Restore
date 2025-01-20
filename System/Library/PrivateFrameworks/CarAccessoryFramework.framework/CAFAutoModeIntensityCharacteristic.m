@interface CAFAutoModeIntensityCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFAutoModeIntensityCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFAutoModeIntensityCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFAutoModeIntensityCharacteristic *)self autoModeIntensityValue];
  return NSStringFromAutoModeIntensity(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000031000028";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end