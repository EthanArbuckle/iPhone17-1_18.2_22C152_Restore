@interface CAFTargetSpeedStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFTargetSpeedStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTargetSpeedStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFTargetSpeedStateCharacteristic *)self targetSpeedStateValue];
  return NSStringFromTargetSpeedState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000045000005";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end