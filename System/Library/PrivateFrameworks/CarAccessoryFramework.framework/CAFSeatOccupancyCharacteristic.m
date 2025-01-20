@interface CAFSeatOccupancyCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFSeatOccupancyCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatOccupancyCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFSeatOccupancyCharacteristic *)self seatOccupancyValue];
  return NSStringFromSeatOccupancy(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000060000006";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end