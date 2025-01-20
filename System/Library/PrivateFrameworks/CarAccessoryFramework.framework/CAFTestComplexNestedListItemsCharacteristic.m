@interface CAFTestComplexNestedListItemsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexNestedListItems)testComplexNestedListItemsValue;
- (id)formattedValue;
- (void)setTestComplexNestedListItemsValue:(id)a3;
@end

@implementation CAFTestComplexNestedListItemsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedListItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedListItems)testComplexNestedListItemsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFTestComplexNestedListItems testComplexNestedListItemsWithArray:v2];

  return (CAFTestComplexNestedListItems *)v3;
}

- (void)setTestComplexNestedListItemsValue:(id)a3
{
  id v4 = [a3 testComplexNestedListItems];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexNestedListItemsCharacteristic *)self testComplexNestedListItemsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexNestedListItems";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end