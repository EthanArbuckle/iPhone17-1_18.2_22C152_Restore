@interface CAFTypeTestMulti
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTestArrayBool;
- (BOOL)hasTestArrayData;
- (BOOL)hasTestArrayFloat;
- (BOOL)hasTestArrayInt16;
- (BOOL)hasTestArrayInt32;
- (BOOL)hasTestArrayInt64;
- (BOOL)hasTestArrayInt8;
- (BOOL)hasTestArrayRawData;
- (BOOL)hasTestArrayString;
- (BOOL)hasTestArrayUInt16;
- (BOOL)hasTestArrayUInt32;
- (BOOL)hasTestArrayUInt64;
- (BOOL)hasTestArrayUInt8;
- (BOOL)hasTestBool;
- (BOOL)hasTestComplexItem;
- (BOOL)hasTestComplexItemList;
- (BOOL)hasTestComplexItemValue;
- (BOOL)hasTestComplexItems;
- (BOOL)hasTestData;
- (BOOL)hasTestDimensionUnitRawValue;
- (BOOL)hasTestEnum;
- (BOOL)hasTestFloat;
- (BOOL)hasTestInt16;
- (BOOL)hasTestInt32;
- (BOOL)hasTestInt64;
- (BOOL)hasTestInt8;
- (BOOL)hasTestRawData;
- (BOOL)hasTestString;
- (BOOL)hasTestUInt16;
- (BOOL)hasTestUInt32;
- (BOOL)hasTestUInt64;
- (BOOL)hasTestUInt8;
- (BOOL)registeredForTestArrayBool;
- (BOOL)registeredForTestArrayData;
- (BOOL)registeredForTestArrayFloat;
- (BOOL)registeredForTestArrayInt16;
- (BOOL)registeredForTestArrayInt32;
- (BOOL)registeredForTestArrayInt64;
- (BOOL)registeredForTestArrayInt8;
- (BOOL)registeredForTestArrayRawData;
- (BOOL)registeredForTestArrayString;
- (BOOL)registeredForTestArrayUInt16;
- (BOOL)registeredForTestArrayUInt32;
- (BOOL)registeredForTestArrayUInt64;
- (BOOL)registeredForTestArrayUInt8;
- (BOOL)registeredForTestBool;
- (BOOL)registeredForTestComplexItem;
- (BOOL)registeredForTestComplexItemList;
- (BOOL)registeredForTestComplexItemValue;
- (BOOL)registeredForTestComplexItems;
- (BOOL)registeredForTestData;
- (BOOL)registeredForTestDimensionUnit;
- (BOOL)registeredForTestEnum;
- (BOOL)registeredForTestFloat;
- (BOOL)registeredForTestInt16;
- (BOOL)registeredForTestInt32;
- (BOOL)registeredForTestInt64;
- (BOOL)registeredForTestInt8;
- (BOOL)registeredForTestRawData;
- (BOOL)registeredForTestString;
- (BOOL)registeredForTestUInt16;
- (BOOL)registeredForTestUInt32;
- (BOOL)registeredForTestUInt64;
- (BOOL)registeredForTestUInt8;
- (BOOL)registeredForUserVisibleLabel;
- (BOOL)testBool;
- (CAFArrayCharacteristic)testArrayBoolCharacteristic;
- (CAFArrayCharacteristic)testArrayDataCharacteristic;
- (CAFArrayCharacteristic)testArrayFloatCharacteristic;
- (CAFArrayCharacteristic)testArrayInt16Characteristic;
- (CAFArrayCharacteristic)testArrayInt32Characteristic;
- (CAFArrayCharacteristic)testArrayInt64Characteristic;
- (CAFArrayCharacteristic)testArrayInt8Characteristic;
- (CAFArrayCharacteristic)testArrayRawDataCharacteristic;
- (CAFArrayCharacteristic)testArrayStringCharacteristic;
- (CAFArrayCharacteristic)testArrayUInt16Characteristic;
- (CAFArrayCharacteristic)testArrayUInt32Characteristic;
- (CAFArrayCharacteristic)testArrayUInt64Characteristic;
- (CAFArrayCharacteristic)testArrayUInt8Characteristic;
- (CAFBoolCharacteristic)testBoolCharacteristic;
- (CAFButtonActionCharacteristic)testEnumCharacteristic;
- (CAFDataCharacteristic)testDataCharacteristic;
- (CAFDataCharacteristic)testRawDataCharacteristic;
- (CAFFloatCharacteristic)testFloatCharacteristic;
- (CAFFloatRange)testFloatRange;
- (CAFInt16Characteristic)testInt16Characteristic;
- (CAFInt16Range)testInt16Range;
- (CAFInt32Characteristic)testInt32Characteristic;
- (CAFInt32Range)testInt32Range;
- (CAFInt64Characteristic)testInt64Characteristic;
- (CAFInt64Range)testInt64Range;
- (CAFInt8Characteristic)testInt8Characteristic;
- (CAFInt8Range)testInt8Range;
- (CAFStringCharacteristic)testStringCharacteristic;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFTestComplexItem)testComplexItem;
- (CAFTestComplexItem)testComplexItemValue;
- (CAFTestComplexItemCharacteristic)testComplexItemCharacteristic;
- (CAFTestComplexItemCharacteristic)testComplexItemValueCharacteristic;
- (CAFTestComplexItems)testComplexItemList;
- (CAFTestComplexItems)testComplexItems;
- (CAFTestComplexItemsCharacteristic)testComplexItemListCharacteristic;
- (CAFTestComplexItemsCharacteristic)testComplexItemsCharacteristic;
- (CAFUInt16Characteristic)testUInt16Characteristic;
- (CAFUInt16Range)testUInt16Range;
- (CAFUInt32Characteristic)testUInt32Characteristic;
- (CAFUInt32Range)testUInt32Range;
- (CAFUInt64Characteristic)testUInt64Characteristic;
- (CAFUInt64Range)testUInt64Range;
- (CAFUInt8Characteristic)testUInt8Characteristic;
- (CAFUInt8Range)testUInt8Range;
- (CAFUnitTypeCharacteristic)testDimensionUnitRawValueCharacteristic;
- (NSArray)testArrayBool;
- (NSArray)testArrayData;
- (NSArray)testArrayFloat;
- (NSArray)testArrayInt16;
- (NSArray)testArrayInt32;
- (NSArray)testArrayInt64;
- (NSArray)testArrayInt8;
- (NSArray)testArrayRawData;
- (NSArray)testArrayString;
- (NSArray)testArrayUInt16;
- (NSArray)testArrayUInt32;
- (NSArray)testArrayUInt64;
- (NSArray)testArrayUInt8;
- (NSData)testData;
- (NSData)testRawData;
- (NSString)testString;
- (NSString)userVisibleLabel;
- (NSUnitSpeed)testDimensionUnit;
- (char)testInt8;
- (float)testFloat;
- (id)name;
- (int)testInt32;
- (int64_t)testInt64;
- (signed)testInt16;
- (unint64_t)testUInt64;
- (unsigned)testDimensionUnitRawValue;
- (unsigned)testEnum;
- (unsigned)testUInt16;
- (unsigned)testUInt32;
- (unsigned)testUInt8;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setTestArrayBool:(id)a3;
- (void)setTestArrayData:(id)a3;
- (void)setTestArrayFloat:(id)a3;
- (void)setTestArrayInt16:(id)a3;
- (void)setTestArrayInt32:(id)a3;
- (void)setTestArrayInt64:(id)a3;
- (void)setTestArrayInt8:(id)a3;
- (void)setTestArrayString:(id)a3;
- (void)setTestArrayUInt16:(id)a3;
- (void)setTestArrayUInt32:(id)a3;
- (void)setTestArrayUInt64:(id)a3;
- (void)setTestArrayUInt8:(id)a3;
- (void)setTestBool:(BOOL)a3;
- (void)setTestComplexItem:(id)a3;
- (void)setTestComplexItemList:(id)a3;
- (void)setTestComplexItemValue:(id)a3;
- (void)setTestComplexItems:(id)a3;
- (void)setTestData:(id)a3;
- (void)setTestDimensionUnit:(id)a3;
- (void)setTestDimensionUnitRawValue:(unsigned __int16)a3;
- (void)setTestEnum:(unsigned __int8)a3;
- (void)setTestFloat:(float)a3;
- (void)setTestInt16:(signed __int16)a3;
- (void)setTestInt32:(int)a3;
- (void)setTestInt64:(int64_t)a3;
- (void)setTestInt8:(char)a3;
- (void)setTestString:(id)a3;
- (void)setTestUInt16:(unsigned __int16)a3;
- (void)setTestUInt32:(unsigned int)a3;
- (void)setTestUInt64:(unint64_t)a3;
- (void)setTestUInt8:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTypeTestMulti

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTestMulti;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFTypeTestMulti;
  [(CAFService *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFTypeTestMulti;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTypeTestMulti *)self userVisibleLabelCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleLabel
{
  objc_super v2 = [(CAFTypeTestMulti *)self userVisibleLabelCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)testBoolCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)testBool
{
  objc_super v2 = [(CAFTypeTestMulti *)self testBoolCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTestBool:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testBoolCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasTestBool
{
  objc_super v2 = [(CAFTypeTestMulti *)self testBoolCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)testUInt8Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)testUInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt8Characteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setTestUInt8:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testUInt8Characteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)testUInt8Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt8Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasTestUInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt16Characteristic)testUInt16Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt16Characteristic *)v11;
}

- (unsigned)testUInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt16Characteristic];
  unsigned __int16 v3 = [v2 uint16Value];

  return v3;
}

- (void)setTestUInt16:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testUInt16Characteristic];
  [v4 setUint16Value:v3];
}

- (CAFUInt16Range)testUInt16Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt16Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt16Range *)v3;
}

- (BOOL)hasTestUInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt32Characteristic)testUInt32Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt32Characteristic *)v11;
}

- (unsigned)testUInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt32Characteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (void)setTestUInt32:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestMulti *)self testUInt32Characteristic];
  [v4 setUint32Value:v3];
}

- (CAFUInt32Range)testUInt32Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (BOOL)hasTestUInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt64Characteristic)testUInt64Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt64Characteristic *)v11;
}

- (unint64_t)testUInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt64Characteristic];
  unint64_t v3 = [v2 uint64Value];

  return v3;
}

- (void)setTestUInt64:(unint64_t)a3
{
  id v4 = [(CAFTypeTestMulti *)self testUInt64Characteristic];
  [v4 setUint64Value:a3];
}

- (CAFUInt64Range)testUInt64Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt64Characteristic];
  unint64_t v3 = [v2 range];

  return (CAFUInt64Range *)v3;
}

- (BOOL)hasTestUInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testUInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFInt8Characteristic)testInt8Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt8Characteristic *)v11;
}

- (char)testInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt8Characteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (void)setTestInt8:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testInt8Characteristic];
  [v4 setInt8Value:v3];
}

- (CAFInt8Range)testInt8Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt8Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

- (BOOL)hasTestInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFInt16Characteristic)testInt16Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt16Characteristic *)v11;
}

- (signed)testInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt16Characteristic];
  signed __int16 v3 = [v2 int16Value];

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testInt16Characteristic];
  [v4 setInt16Value:v3];
}

- (CAFInt16Range)testInt16Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt16Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt16Range *)v3;
}

- (BOOL)hasTestInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFInt32Characteristic)testInt32Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000008"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000008"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt32Characteristic *)v11;
}

- (int)testInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt32Characteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestMulti *)self testInt32Characteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)testInt32Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFInt64Characteristic)testInt64Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000009"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000009"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt64Characteristic *)v11;
}

- (int64_t)testInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt64Characteristic];
  int64_t v3 = [v2 int64Value];

  return v3;
}

- (void)setTestInt64:(int64_t)a3
{
  id v4 = [(CAFTypeTestMulti *)self testInt64Characteristic];
  [v4 setInt64Value:a3];
}

- (CAFInt64Range)testInt64Range
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt64Characteristic];
  int64_t v3 = [v2 range];

  return (CAFInt64Range *)v3;
}

- (BOOL)hasTestInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFFloatCharacteristic)testFloatCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFFloatCharacteristic *)v11;
}

- (float)testFloat
{
  objc_super v2 = [(CAFTypeTestMulti *)self testFloatCharacteristic];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setTestFloat:(float)a3
{
  id v5 = [(CAFTypeTestMulti *)self testFloatCharacteristic];
  *(float *)&double v4 = a3;
  [v5 setFloatValue:v4];
}

- (CAFFloatRange)testFloatRange
{
  objc_super v2 = [(CAFTypeTestMulti *)self testFloatCharacteristic];
  float v3 = [v2 range];

  return (CAFFloatRange *)v3;
}

- (BOOL)hasTestFloat
{
  objc_super v2 = [(CAFTypeTestMulti *)self testFloatCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)testStringCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  double v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000B"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000B"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)testString
{
  objc_super v2 = [(CAFTypeTestMulti *)self testStringCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (void)setTestString:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testStringCharacteristic];
  [v5 setStringValue:v4];
}

- (BOOL)hasTestString
{
  objc_super v2 = [(CAFTypeTestMulti *)self testStringCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)testDataCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000C"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000C"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFDataCharacteristic *)v11;
}

- (NSData)testData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testDataCharacteristic];
  BOOL v3 = [v2 dataValue];

  return (NSData *)v3;
}

- (void)setTestData:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testDataCharacteristic];
  [v5 setDataValue:v4];
}

- (BOOL)hasTestData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)testRawDataCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000D"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000D"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFDataCharacteristic *)v11;
}

- (NSData)testRawData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testRawDataCharacteristic];
  BOOL v3 = [v2 dataValue];

  return (NSData *)v3;
}

- (BOOL)hasTestRawData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testRawDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFButtonActionCharacteristic)testEnumCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000E"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000E"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFButtonActionCharacteristic *)v11;
}

- (unsigned)testEnum
{
  objc_super v2 = [(CAFTypeTestMulti *)self testEnumCharacteristic];
  unsigned __int8 v3 = [v2 buttonActionValue];

  return v3;
}

- (void)setTestEnum:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testEnumCharacteristic];
  [v4 setButtonActionValue:v3];
}

- (BOOL)hasTestEnum
{
  objc_super v2 = [(CAFTypeTestMulti *)self testEnumCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUnitTypeCharacteristic)testDimensionUnitRawValueCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00000F"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00000F"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)testDimensionUnitRawValue
{
  objc_super v2 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (void)setTestDimensionUnitRawValue:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
  [v4 setUnitTypeValue:v3];
}

- (NSUnitSpeed)testDimensionUnit
{
  objc_opt_class();
  uint64_t v3 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
  id v4 = [v3 unitValue];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSUnitSpeed *)v5;
}

- (void)setTestDimensionUnit:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
  [v5 setUnitValue:v4];
}

- (BOOL)hasTestDimensionUnitRawValue
{
  objc_super v2 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000010"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000010"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTestComplexItemCharacteristic *)v11;
}

- (CAFTestComplexItem)testComplexItem
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemCharacteristic];
  BOOL v3 = [v2 testComplexItemValue];

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testComplexItemCharacteristic];
  [v5 setTestComplexItemValue:v4];
}

- (BOOL)hasTestComplexItem
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayBoolCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000011"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000011"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayBool
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayBoolCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayBool:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayBoolCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayBool
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayBoolCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt8Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000012"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000012"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt8Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt8:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayUInt8Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt16Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000013"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000013"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt16Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt16:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayUInt16Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt32Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000014"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000014"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt32Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt32:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayUInt32Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt64Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000015"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000015"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt64Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt64:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayUInt64Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayUInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt8Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000016"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000016"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt8Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt8:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayInt8Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt8
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt16Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000017"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000017"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt16Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt16:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayInt16Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt16
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt32Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000018"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000018"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt32Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt32:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayInt32Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt32
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt64Characteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000019"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000019"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt64Characteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt64:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayInt64Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt64
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayFloatCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00001A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00001A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayFloat
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayFloatCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayFloat:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayFloatCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayFloat
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayFloatCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayStringCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00001B"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00001B"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayString
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayStringCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayString:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayStringCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayString
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayStringCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayDataCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00001C"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00001C"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayDataCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayData:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testArrayDataCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayRawDataCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF00001D"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF00001D"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayRawData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayRawDataCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (BOOL)hasTestArrayRawData
{
  objc_super v2 = [(CAFTypeTestMulti *)self testArrayRawDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemsCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000020"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000020"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTestComplexItemsCharacteristic *)v11;
}

- (CAFTestComplexItems)testComplexItems
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemsCharacteristic];
  BOOL v3 = [v2 testComplexItemsValue];

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testComplexItemsCharacteristic];
  [v5 setTestComplexItemsValue:v4];
}

- (BOOL)hasTestComplexItems
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemsCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemValueCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000021"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000021"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTestComplexItemCharacteristic *)v11;
}

- (CAFTestComplexItem)testComplexItemValue
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemValueCharacteristic];
  BOOL v3 = [v2 testComplexItemValue];

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItemValue:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testComplexItemValueCharacteristic];
  [v5 setTestComplexItemValue:v4];
}

- (BOOL)hasTestComplexItemValue
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemValueCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemListCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000022"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000022"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTestComplexItemsCharacteristic *)v11;
}

- (CAFTestComplexItems)testComplexItemList
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemListCharacteristic];
  BOOL v3 = [v2 testComplexItemsValue];

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItemList:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestMulti *)self testComplexItemListCharacteristic];
  [v5 setTestComplexItemsValue:v4];
}

- (BOOL)hasTestComplexItemList
{
  objc_super v2 = [(CAFTypeTestMulti *)self testComplexItemListCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB5618;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (([v7 isEqual:@"0x0000000030000001"] & 1) == 0)
  {

LABEL_6:
    v16 = [v6 characteristicType];
    if ([v16 isEqual:@"0x00000000FF000001"])
    {
      v17 = [v6 uniqueIdentifier];
      v18 = [(CAFTypeTestMulti *)self testBoolCharacteristic];
      v19 = [v18 uniqueIdentifier];
      int v20 = [v17 isEqual:v19];

      if (v20)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestBool:", self, -[CAFTypeTestMulti testBool](self, "testBool"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v21 = [v6 characteristicType];
    if ([v21 isEqual:@"0x00000000FF000002"])
    {
      v22 = [v6 uniqueIdentifier];
      v23 = [(CAFTypeTestMulti *)self testUInt8Characteristic];
      v24 = [v23 uniqueIdentifier];
      int v25 = [v22 isEqual:v24];

      if (v25)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt8:", self, -[CAFTypeTestMulti testUInt8](self, "testUInt8"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v26 = [v6 characteristicType];
    if ([v26 isEqual:@"0x00000000FF000003"])
    {
      v27 = [v6 uniqueIdentifier];
      v28 = [(CAFTypeTestMulti *)self testUInt16Characteristic];
      v29 = [v28 uniqueIdentifier];
      int v30 = [v27 isEqual:v29];

      if (v30)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt16:", self, -[CAFTypeTestMulti testUInt16](self, "testUInt16"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v31 = [v6 characteristicType];
    if ([v31 isEqual:@"0x00000000FF000004"])
    {
      v32 = [v6 uniqueIdentifier];
      v33 = [(CAFTypeTestMulti *)self testUInt32Characteristic];
      v34 = [v33 uniqueIdentifier];
      int v35 = [v32 isEqual:v34];

      if (v35)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt32:", self, -[CAFTypeTestMulti testUInt32](self, "testUInt32"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v36 = [v6 characteristicType];
    if ([v36 isEqual:@"0x00000000FF000005"])
    {
      v37 = [v6 uniqueIdentifier];
      v38 = [(CAFTypeTestMulti *)self testUInt64Characteristic];
      v39 = [v38 uniqueIdentifier];
      int v40 = [v37 isEqual:v39];

      if (v40)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt64:", self, -[CAFTypeTestMulti testUInt64](self, "testUInt64"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v41 = [v6 characteristicType];
    if ([v41 isEqual:@"0x00000000FF000006"])
    {
      v42 = [v6 uniqueIdentifier];
      v43 = [(CAFTypeTestMulti *)self testInt8Characteristic];
      v44 = [v43 uniqueIdentifier];
      int v45 = [v42 isEqual:v44];

      if (v45)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt8:", self, -[CAFTypeTestMulti testInt8](self, "testInt8"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v46 = [v6 characteristicType];
    if ([v46 isEqual:@"0x00000000FF000007"])
    {
      v47 = [v6 uniqueIdentifier];
      v48 = [(CAFTypeTestMulti *)self testInt16Characteristic];
      v49 = [v48 uniqueIdentifier];
      int v50 = [v47 isEqual:v49];

      if (v50)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt16:", self, -[CAFTypeTestMulti testInt16](self, "testInt16"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v51 = [v6 characteristicType];
    if ([v51 isEqual:@"0x00000000FF000008"])
    {
      v52 = [v6 uniqueIdentifier];
      v53 = [(CAFTypeTestMulti *)self testInt32Characteristic];
      v54 = [v53 uniqueIdentifier];
      int v55 = [v52 isEqual:v54];

      if (v55)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt32:", self, -[CAFTypeTestMulti testInt32](self, "testInt32"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v56 = [v6 characteristicType];
    if ([v56 isEqual:@"0x00000000FF000009"])
    {
      v57 = [v6 uniqueIdentifier];
      v58 = [(CAFTypeTestMulti *)self testInt64Characteristic];
      v59 = [v58 uniqueIdentifier];
      int v60 = [v57 isEqual:v59];

      if (v60)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt64:", self, -[CAFTypeTestMulti testInt64](self, "testInt64"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v61 = [v6 characteristicType];
    if ([v61 isEqual:@"0x00000000FF00000A"])
    {
      v62 = [v6 uniqueIdentifier];
      v63 = [(CAFTypeTestMulti *)self testFloatCharacteristic];
      v64 = [v63 uniqueIdentifier];
      int v65 = [v62 isEqual:v64];

      if (v65)
      {
        v14 = [(CAFService *)self observers];
        [(CAFTypeTestMulti *)self testFloat];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestFloat:", self);
        goto LABEL_65;
      }
    }
    else
    {
    }
    v66 = [v6 characteristicType];
    if ([v66 isEqual:@"0x00000000FF00000B"])
    {
      v67 = [v6 uniqueIdentifier];
      v68 = [(CAFTypeTestMulti *)self testStringCharacteristic];
      v69 = [v68 uniqueIdentifier];
      int v70 = [v67 isEqual:v69];

      if (v70)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testString];
        [v14 typeTestMultiService:self didUpdateTestString:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v71 = [v6 characteristicType];
    if ([v71 isEqual:@"0x00000000FF00000C"])
    {
      v72 = [v6 uniqueIdentifier];
      v73 = [(CAFTypeTestMulti *)self testDataCharacteristic];
      v74 = [v73 uniqueIdentifier];
      int v75 = [v72 isEqual:v74];

      if (v75)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testData];
        [v14 typeTestMultiService:self didUpdateTestData:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v76 = [v6 characteristicType];
    if ([v76 isEqual:@"0x00000000FF00000D"])
    {
      v77 = [v6 uniqueIdentifier];
      v78 = [(CAFTypeTestMulti *)self testRawDataCharacteristic];
      v79 = [v78 uniqueIdentifier];
      int v80 = [v77 isEqual:v79];

      if (v80)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testRawData];
        [v14 typeTestMultiService:self didUpdateTestRawData:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v81 = [v6 characteristicType];
    if ([v81 isEqual:@"0x00000000FF00000E"])
    {
      v82 = [v6 uniqueIdentifier];
      v83 = [(CAFTypeTestMulti *)self testEnumCharacteristic];
      v84 = [v83 uniqueIdentifier];
      int v85 = [v82 isEqual:v84];

      if (v85)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestEnum:", self, -[CAFTypeTestMulti testEnum](self, "testEnum"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v86 = [v6 characteristicType];
    if ([v86 isEqual:@"0x00000000FF00000F"])
    {
      v87 = [v6 uniqueIdentifier];
      v88 = [(CAFTypeTestMulti *)self testDimensionUnitRawValueCharacteristic];
      v89 = [v88 uniqueIdentifier];
      int v90 = [v87 isEqual:v89];

      if (v90)
      {
        v14 = [(CAFService *)self observers];
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestDimensionUnitRawValue:", self, -[CAFTypeTestMulti testDimensionUnitRawValue](self, "testDimensionUnitRawValue"));
        goto LABEL_65;
      }
    }
    else
    {
    }
    v91 = [v6 characteristicType];
    if ([v91 isEqual:@"0x00000000FF000010"])
    {
      v92 = [v6 uniqueIdentifier];
      v93 = [(CAFTypeTestMulti *)self testComplexItemCharacteristic];
      v94 = [v93 uniqueIdentifier];
      int v95 = [v92 isEqual:v94];

      if (v95)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testComplexItem];
        [v14 typeTestMultiService:self didUpdateTestComplexItem:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v96 = [v6 characteristicType];
    if ([v96 isEqual:@"0x00000000FF000011"])
    {
      v97 = [v6 uniqueIdentifier];
      v98 = [(CAFTypeTestMulti *)self testArrayBoolCharacteristic];
      v99 = [v98 uniqueIdentifier];
      int v100 = [v97 isEqual:v99];

      if (v100)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayBool];
        [v14 typeTestMultiService:self didUpdateTestArrayBool:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v101 = [v6 characteristicType];
    if ([v101 isEqual:@"0x00000000FF000012"])
    {
      v102 = [v6 uniqueIdentifier];
      v103 = [(CAFTypeTestMulti *)self testArrayUInt8Characteristic];
      v104 = [v103 uniqueIdentifier];
      int v105 = [v102 isEqual:v104];

      if (v105)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayUInt8];
        [v14 typeTestMultiService:self didUpdateTestArrayUInt8:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v106 = [v6 characteristicType];
    if ([v106 isEqual:@"0x00000000FF000013"])
    {
      v107 = [v6 uniqueIdentifier];
      v108 = [(CAFTypeTestMulti *)self testArrayUInt16Characteristic];
      v109 = [v108 uniqueIdentifier];
      int v110 = [v107 isEqual:v109];

      if (v110)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayUInt16];
        [v14 typeTestMultiService:self didUpdateTestArrayUInt16:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v111 = [v6 characteristicType];
    if ([v111 isEqual:@"0x00000000FF000014"])
    {
      v112 = [v6 uniqueIdentifier];
      v113 = [(CAFTypeTestMulti *)self testArrayUInt32Characteristic];
      v114 = [v113 uniqueIdentifier];
      int v115 = [v112 isEqual:v114];

      if (v115)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayUInt32];
        [v14 typeTestMultiService:self didUpdateTestArrayUInt32:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v116 = [v6 characteristicType];
    if ([v116 isEqual:@"0x00000000FF000015"])
    {
      v117 = [v6 uniqueIdentifier];
      v118 = [(CAFTypeTestMulti *)self testArrayUInt64Characteristic];
      v119 = [v118 uniqueIdentifier];
      int v120 = [v117 isEqual:v119];

      if (v120)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayUInt64];
        [v14 typeTestMultiService:self didUpdateTestArrayUInt64:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v121 = [v6 characteristicType];
    if ([v121 isEqual:@"0x00000000FF000016"])
    {
      v122 = [v6 uniqueIdentifier];
      v123 = [(CAFTypeTestMulti *)self testArrayInt8Characteristic];
      v124 = [v123 uniqueIdentifier];
      int v125 = [v122 isEqual:v124];

      if (v125)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayInt8];
        [v14 typeTestMultiService:self didUpdateTestArrayInt8:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v126 = [v6 characteristicType];
    if ([v126 isEqual:@"0x00000000FF000017"])
    {
      v127 = [v6 uniqueIdentifier];
      v128 = [(CAFTypeTestMulti *)self testArrayInt16Characteristic];
      v129 = [v128 uniqueIdentifier];
      int v130 = [v127 isEqual:v129];

      if (v130)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayInt16];
        [v14 typeTestMultiService:self didUpdateTestArrayInt16:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v131 = [v6 characteristicType];
    if ([v131 isEqual:@"0x00000000FF000018"])
    {
      v132 = [v6 uniqueIdentifier];
      v133 = [(CAFTypeTestMulti *)self testArrayInt32Characteristic];
      v134 = [v133 uniqueIdentifier];
      int v135 = [v132 isEqual:v134];

      if (v135)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayInt32];
        [v14 typeTestMultiService:self didUpdateTestArrayInt32:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v136 = [v6 characteristicType];
    if ([v136 isEqual:@"0x00000000FF000019"])
    {
      v137 = [v6 uniqueIdentifier];
      v138 = [(CAFTypeTestMulti *)self testArrayInt64Characteristic];
      v139 = [v138 uniqueIdentifier];
      int v140 = [v137 isEqual:v139];

      if (v140)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayInt64];
        [v14 typeTestMultiService:self didUpdateTestArrayInt64:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v141 = [v6 characteristicType];
    if ([v141 isEqual:@"0x00000000FF00001A"])
    {
      v142 = [v6 uniqueIdentifier];
      v143 = [(CAFTypeTestMulti *)self testArrayFloatCharacteristic];
      v144 = [v143 uniqueIdentifier];
      int v145 = [v142 isEqual:v144];

      if (v145)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayFloat];
        [v14 typeTestMultiService:self didUpdateTestArrayFloat:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v146 = [v6 characteristicType];
    if ([v146 isEqual:@"0x00000000FF00001B"])
    {
      v147 = [v6 uniqueIdentifier];
      v148 = [(CAFTypeTestMulti *)self testArrayStringCharacteristic];
      v149 = [v148 uniqueIdentifier];
      int v150 = [v147 isEqual:v149];

      if (v150)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayString];
        [v14 typeTestMultiService:self didUpdateTestArrayString:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v151 = [v6 characteristicType];
    if ([v151 isEqual:@"0x00000000FF00001C"])
    {
      v152 = [v6 uniqueIdentifier];
      v153 = [(CAFTypeTestMulti *)self testArrayDataCharacteristic];
      v154 = [v153 uniqueIdentifier];
      int v155 = [v152 isEqual:v154];

      if (v155)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayData];
        [v14 typeTestMultiService:self didUpdateTestArrayData:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v156 = [v6 characteristicType];
    if ([v156 isEqual:@"0x00000000FF00001D"])
    {
      v157 = [v6 uniqueIdentifier];
      v158 = [(CAFTypeTestMulti *)self testArrayRawDataCharacteristic];
      v159 = [v158 uniqueIdentifier];
      int v160 = [v157 isEqual:v159];

      if (v160)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testArrayRawData];
        [v14 typeTestMultiService:self didUpdateTestArrayRawData:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v161 = [v6 characteristicType];
    if ([v161 isEqual:@"0x00000000FF000020"])
    {
      v162 = [v6 uniqueIdentifier];
      v163 = [(CAFTypeTestMulti *)self testComplexItemsCharacteristic];
      v164 = [v163 uniqueIdentifier];
      int v165 = [v162 isEqual:v164];

      if (v165)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testComplexItems];
        [v14 typeTestMultiService:self didUpdateTestComplexItems:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v166 = [v6 characteristicType];
    if ([v166 isEqual:@"0x00000000FF000021"])
    {
      v167 = [v6 uniqueIdentifier];
      v168 = [(CAFTypeTestMulti *)self testComplexItemValueCharacteristic];
      v169 = [v168 uniqueIdentifier];
      int v170 = [v167 isEqual:v169];

      if (v170)
      {
        v14 = [(CAFService *)self observers];
        v15 = [(CAFTypeTestMulti *)self testComplexItemValue];
        [v14 typeTestMultiService:self didUpdateTestComplexItemValue:v15];
        goto LABEL_4;
      }
    }
    else
    {
    }
    v14 = [v6 characteristicType];
    if (![v14 isEqual:@"0x00000000FF000022"]) {
      goto LABEL_65;
    }
    v171 = [v6 uniqueIdentifier];
    v172 = [(CAFTypeTestMulti *)self testComplexItemListCharacteristic];
    v173 = [v172 uniqueIdentifier];
    int v174 = [v171 isEqual:v173];

    if (!v174) {
      goto LABEL_66;
    }
    v14 = [(CAFService *)self observers];
    v15 = [(CAFTypeTestMulti *)self testComplexItemList];
    [v14 typeTestMultiService:self didUpdateTestComplexItemList:v15];
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  v9 = [(CAFTypeTestMulti *)self userVisibleLabelCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (!v11) {
    goto LABEL_6;
  }
  v12 = [(CAFService *)self observers];
  v13 = [(CAFTypeTestMulti *)self userVisibleLabel];
  [v12 typeTestMultiService:self didUpdateUserVisibleLabel:v13];

  v14 = [(CAFService *)self observers];
  v15 = [(CAFTypeTestMulti *)self name];
  [v14 typeTestMultiService:self didUpdateName:v15];
LABEL_4:

LABEL_65:
LABEL_66:
  v175.receiver = self;
  v175.super_class = (Class)CAFTypeTestMulti;
  [(CAFService *)&v175 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUserVisibleLabel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  return v10;
}

- (BOOL)registeredForTestBool
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000001"];

  return v10;
}

- (BOOL)registeredForTestUInt8
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000002"];

  return v10;
}

- (BOOL)registeredForTestUInt16
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000003"];

  return v10;
}

- (BOOL)registeredForTestUInt32
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000004"];

  return v10;
}

- (BOOL)registeredForTestUInt64
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000005"];

  return v10;
}

- (BOOL)registeredForTestInt8
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000006"];

  return v10;
}

- (BOOL)registeredForTestInt16
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000007"];

  return v10;
}

- (BOOL)registeredForTestInt32
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000008"];

  return v10;
}

- (BOOL)registeredForTestInt64
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000009"];

  return v10;
}

- (BOOL)registeredForTestFloat
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000A"];

  return v10;
}

- (BOOL)registeredForTestString
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000B"];

  return v10;
}

- (BOOL)registeredForTestData
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000C"];

  return v10;
}

- (BOOL)registeredForTestRawData
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000D"];

  return v10;
}

- (BOOL)registeredForTestEnum
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000E"];

  return v10;
}

- (BOOL)registeredForTestDimensionUnit
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000F"];

  return v10;
}

- (BOOL)registeredForTestComplexItem
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000010"];

  return v10;
}

- (BOOL)registeredForTestArrayBool
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000011"];

  return v10;
}

- (BOOL)registeredForTestArrayUInt8
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000012"];

  return v10;
}

- (BOOL)registeredForTestArrayUInt16
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000013"];

  return v10;
}

- (BOOL)registeredForTestArrayUInt32
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000014"];

  return v10;
}

- (BOOL)registeredForTestArrayUInt64
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000015"];

  return v10;
}

- (BOOL)registeredForTestArrayInt8
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000016"];

  return v10;
}

- (BOOL)registeredForTestArrayInt16
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000017"];

  return v10;
}

- (BOOL)registeredForTestArrayInt32
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000018"];

  return v10;
}

- (BOOL)registeredForTestArrayInt64
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000019"];

  return v10;
}

- (BOOL)registeredForTestArrayFloat
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00001A"];

  return v10;
}

- (BOOL)registeredForTestArrayString
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00001B"];

  return v10;
}

- (BOOL)registeredForTestArrayData
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00001C"];

  return v10;
}

- (BOOL)registeredForTestArrayRawData
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00001D"];

  return v10;
}

- (BOOL)registeredForTestComplexItems
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000020"];

  return v10;
}

- (BOOL)registeredForTestComplexItemValue
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000021"];

  return v10;
}

- (BOOL)registeredForTestComplexItemList
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000022"];

  return v10;
}

@end