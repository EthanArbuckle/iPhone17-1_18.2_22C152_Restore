@interface CAFButtonActionCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFButtonActionCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFButtonActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFButtonActionCharacteristic *)self buttonActionValue];
  return NSStringFromButtonAction(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"ButtonAction";
}

+ (id)secondaryCharacteristicFormats
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000036000010";
  v4[1] = @"0x00000000FF00000E";
  int v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end