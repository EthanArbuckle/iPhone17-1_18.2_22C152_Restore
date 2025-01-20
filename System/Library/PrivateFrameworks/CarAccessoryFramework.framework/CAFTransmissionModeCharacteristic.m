@interface CAFTransmissionModeCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFTransmissionModeCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTransmissionModeCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFTransmissionModeCharacteristic *)self transmissionModeValue];
  return NSStringFromTransmissionMode(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000041000011";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end