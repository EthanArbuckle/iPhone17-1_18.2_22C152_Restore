@interface CAFSeatBeltIndicatorCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFSeatBeltIndicatorCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatBeltIndicatorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFSeatBeltIndicatorCharacteristic *)self seatBeltIndicatorValue];
  return NSStringFromSeatBeltIndicator(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000060000007";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end