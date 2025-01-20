@interface CAFFuelLevelStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFFuelLevelStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFuelLevelStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFFuelLevelStateCharacteristic *)self fuelLevelStateValue];
  return NSStringFromFuelLevelState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000041000017";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end