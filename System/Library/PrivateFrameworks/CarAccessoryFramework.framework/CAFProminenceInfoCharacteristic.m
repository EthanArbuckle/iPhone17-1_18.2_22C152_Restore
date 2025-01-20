@interface CAFProminenceInfoCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFProminenceInfo)prominenceInfoValue;
- (id)formattedValue;
- (void)setProminenceInfoValue:(id)a3;
@end

@implementation CAFProminenceInfoCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFProminenceInfoCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFProminenceInfo)prominenceInfoValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFProminenceInfo prominenceInfoWithArray:v2];

  return (CAFProminenceInfo *)v3;
}

- (void)setProminenceInfoValue:(id)a3
{
  id v4 = [a3 prominenceInformations];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFProminenceInfoCharacteristic *)self prominenceInfoValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"ProminenceInfo";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end