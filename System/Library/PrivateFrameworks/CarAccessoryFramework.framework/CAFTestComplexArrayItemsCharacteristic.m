@interface CAFTestComplexArrayItemsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexArrayItems)testComplexArrayItemsValue;
- (id)formattedValue;
- (void)setTestComplexArrayItemsValue:(id)a3;
@end

@implementation CAFTestComplexArrayItemsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexArrayItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexArrayItems)testComplexArrayItemsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFTestComplexArrayItems testComplexArrayItemsWithArray:v2];

  return (CAFTestComplexArrayItems *)v3;
}

- (void)setTestComplexArrayItemsValue:(id)a3
{
  id v4 = [a3 testComplexArrayItems];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexArrayItemsCharacteristic *)self testComplexArrayItemsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexArrayItems";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end