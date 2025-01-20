@interface CAFUIInputDevicePurposeCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFUIInputDevicePurposeCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUIInputDevicePurposeCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFUIInputDevicePurposeCharacteristic *)self uIInputDevicePurposeValue];
  return NSStringFromUIInputDevicePurpose(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000047000002";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end