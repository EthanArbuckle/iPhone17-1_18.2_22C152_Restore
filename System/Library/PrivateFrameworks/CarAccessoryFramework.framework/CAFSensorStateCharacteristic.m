@interface CAFSensorStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFSensorStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSensorStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFSensorStateCharacteristic *)self sensorStateValue];
  return NSStringFromSensorState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x000000003000001A";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end