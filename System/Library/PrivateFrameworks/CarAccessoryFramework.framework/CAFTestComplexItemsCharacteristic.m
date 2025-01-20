@interface CAFTestComplexItemsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFTestComplexItems)testComplexItemsValue;
- (id)formattedValue;
- (void)setTestComplexItemsValue:(id)a3;
@end

@implementation CAFTestComplexItemsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexItems)testComplexItemsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFTestComplexItems testComplexItemsWithArray:v2];

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItemsValue:(id)a3
{
  id v4 = [a3 testComplexItems];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFTestComplexItemsCharacteristic *)self testComplexItemsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"TestComplexItems";
}

+ (id)secondaryCharacteristicFormats
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"0x00000000FF000022";
  v4[1] = @"0x00000000FF000020";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end