@interface CAFFillLevelLabelCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFFillLevelLabelCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFillLevelLabelCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  int v2 = [(CAFFillLevelLabelCharacteristic *)self fillLevelLabelValue];
  return NSStringFromFillLevelLabel(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000046000007";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end