@interface CAFTestComplexNestedListItemCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexNestedListItem)testComplexNestedListItemValue;
- (id)formattedValue;
- (void)setTestComplexNestedListItemValue:(id)a3;
@end

@implementation CAFTestComplexNestedListItemCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedListItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedListItem)testComplexNestedListItemValue
{
  v3 = [CAFTestComplexNestedListItem alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFTestComplexNestedListItem *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setTestComplexNestedListItemValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexNestedListItemCharacteristic *)self testComplexNestedListItemValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexNestedListItem";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x00000000FF000027";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end