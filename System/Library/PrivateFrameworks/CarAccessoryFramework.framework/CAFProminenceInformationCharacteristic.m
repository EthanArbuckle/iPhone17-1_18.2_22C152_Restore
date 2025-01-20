@interface CAFProminenceInformationCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFProminenceInformation)prominenceInformationValue;
- (id)formattedValue;
- (void)setProminenceInformationValue:(id)a3;
@end

@implementation CAFProminenceInformationCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFProminenceInformationCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFProminenceInformation)prominenceInformationValue
{
  v3 = [CAFProminenceInformation alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFProminenceInformation *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setProminenceInformationValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFProminenceInformationCharacteristic *)self prominenceInformationValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"ProminenceInformation";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000036000020";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end