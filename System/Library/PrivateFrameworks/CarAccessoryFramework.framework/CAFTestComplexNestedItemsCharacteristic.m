@interface CAFTestComplexNestedItemsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexNestedItems)testComplexNestedItemsValue;
- (id)formattedValue;
- (void)setTestComplexNestedItemsValue:(id)a3;
@end

@implementation CAFTestComplexNestedItemsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedItems)testComplexNestedItemsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFTestComplexNestedItems testComplexNestedItemsWithArray:v2];

  return (CAFTestComplexNestedItems *)v3;
}

- (void)setTestComplexNestedItemsValue:(id)a3
{
  id v4 = [a3 testComplexNestedItems];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexNestedItemsCharacteristic *)self testComplexNestedItemsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexNestedItems";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x00000000FF000026";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end