@interface CAFBatteryLevelStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFBatteryLevelStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFBatteryLevelStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFBatteryLevelStateCharacteristic *)self batteryLevelStateValue];
  return NSStringFromBatteryLevelState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000030000035";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end