@interface CAFRotationalSpeedStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFRotationalSpeedStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFRotationalSpeedStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFRotationalSpeedStateCharacteristic *)self rotationalSpeedStateValue];
  return NSStringFromRotationalSpeedState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000030000060";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end