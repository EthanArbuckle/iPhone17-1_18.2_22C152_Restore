@interface CAFMediaCategoryCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFMediaCategoryCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaCategoryCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFMediaCategoryCharacteristic *)self mediaCategoryValue];
  return NSStringFromMediaCategory(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000032000030";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end