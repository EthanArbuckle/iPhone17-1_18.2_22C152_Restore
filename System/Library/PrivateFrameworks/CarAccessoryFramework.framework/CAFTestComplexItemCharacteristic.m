@interface CAFTestComplexItemCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexItem)testComplexItemValue;
- (id)formattedValue;
- (void)setTestComplexItemValue:(id)a3;
@end

@implementation CAFTestComplexItemCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexItem)testComplexItemValue
{
  v3 = [CAFTestComplexItem alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFTestComplexItem *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setTestComplexItemValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexItemCharacteristic *)self testComplexItemValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexItem";
}

+ (id)secondaryCharacteristicFormats
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"0x00000000FF000010";
  v4[1] = @"0x00000000FF000021";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end