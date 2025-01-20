@interface CAFPairedDeviceStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFPairedDeviceStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDeviceStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFPairedDeviceStateCharacteristic *)self pairedDeviceStateValue];
  return NSStringFromPairedDeviceState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000036000015";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end