@interface CAFEqualizerTypeCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFEqualizerTypeCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEqualizerTypeCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFEqualizerTypeCharacteristic *)self equalizerTypeValue];
  return NSStringFromEqualizerType(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000033000007";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end