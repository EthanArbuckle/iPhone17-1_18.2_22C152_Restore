@interface CAFUIInputDeviceButtonEventCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFUIInputDeviceButtonEventCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUIInputDeviceButtonEventCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFUIInputDeviceButtonEventCharacteristic *)self uIInputDeviceButtonEventValue];
  return NSStringFromUIInputDeviceButtonEvent(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000047000003";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end