@interface CAFTypeTestWithStates
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
- (BOOL)testArrayBoolDisabled;
- (BOOL)testArrayBoolError;
- (BOOL)testArrayBoolInvalid;
- (BOOL)testArrayDataDisabled;
- (BOOL)testArrayDataError;
- (BOOL)testArrayDataInvalid;
- (BOOL)testArrayFloatDisabled;
- (BOOL)testArrayFloatError;
- (BOOL)testArrayFloatInvalid;
- (BOOL)testArrayInt16Disabled;
- (BOOL)testArrayInt16Error;
- (BOOL)testArrayInt16Invalid;
- (BOOL)testArrayInt32Disabled;
- (BOOL)testArrayInt32Error;
- (BOOL)testArrayInt32Invalid;
- (BOOL)testArrayInt64Disabled;
- (BOOL)testArrayInt64Error;
- (BOOL)testArrayInt64Invalid;
- (BOOL)testArrayInt8Disabled;
- (BOOL)testArrayInt8Error;
- (BOOL)testArrayInt8Invalid;
- (BOOL)testArrayRawDataDisabled;
- (BOOL)testArrayRawDataError;
- (BOOL)testArrayRawDataInvalid;
- (BOOL)testArrayStringDisabled;
- (BOOL)testArrayStringError;
- (BOOL)testArrayStringInvalid;
- (BOOL)testArrayUInt16Disabled;
- (BOOL)testArrayUInt16Error;
- (BOOL)testArrayUInt16Invalid;
- (BOOL)testArrayUInt32Disabled;
- (BOOL)testArrayUInt32Error;
- (BOOL)testArrayUInt32Invalid;
- (BOOL)testArrayUInt64Disabled;
- (BOOL)testArrayUInt64Error;
- (BOOL)testArrayUInt64Invalid;
- (BOOL)testArrayUInt8Disabled;
- (BOOL)testArrayUInt8Error;
- (BOOL)testArrayUInt8Invalid;
- (BOOL)testBool;
- (BOOL)testBoolDisabled;
- (BOOL)testBoolError;
- (BOOL)testBoolInvalid;
- (BOOL)testComplexItemDisabled;
- (BOOL)testComplexItemError;
- (BOOL)testComplexItemInvalid;
- (BOOL)testComplexItemListDisabled;
- (BOOL)testComplexItemListError;
- (BOOL)testComplexItemListInvalid;
- (BOOL)testComplexItemValueDisabled;
- (BOOL)testComplexItemValueError;
- (BOOL)testComplexItemValueInvalid;
- (BOOL)testComplexItemsDisabled;
- (BOOL)testComplexItemsError;
- (BOOL)testComplexItemsInvalid;
- (BOOL)testDataDisabled;
- (BOOL)testDataError;
- (BOOL)testDataInvalid;
- (BOOL)testDimensionUnitRawValueDisabled;
- (BOOL)testDimensionUnitRawValueError;
- (BOOL)testEnumDisabled;
- (BOOL)testEnumError;
- (BOOL)testFloatDisabled;
- (BOOL)testFloatError;
- (BOOL)testFloatInvalid;
- (BOOL)testInt16Disabled;
- (BOOL)testInt16Error;
- (BOOL)testInt16Invalid;
- (BOOL)testInt32Disabled;
- (BOOL)testInt32Error;
- (BOOL)testInt32Invalid;
- (BOOL)testInt64Disabled;
- (BOOL)testInt64Error;
- (BOOL)testInt64Invalid;
- (BOOL)testInt8Disabled;
- (BOOL)testInt8Error;
- (BOOL)testInt8Invalid;
- (BOOL)testRawDataDisabled;
- (BOOL)testRawDataError;
- (BOOL)testRawDataInvalid;
- (BOOL)testStringDisabled;
- (BOOL)testStringError;
- (BOOL)testStringInvalid;
- (BOOL)testUInt16Disabled;
- (BOOL)testUInt16Error;
- (BOOL)testUInt16Invalid;
- (BOOL)testUInt32Disabled;
- (BOOL)testUInt32Error;
- (BOOL)testUInt32Invalid;
- (BOOL)testUInt64Disabled;
- (BOOL)testUInt64Error;
- (BOOL)testUInt64Invalid;
- (BOOL)testUInt8Disabled;
- (BOOL)testUInt8Error;
- (BOOL)testUInt8Invalid;
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
- (NSUnitSpeed)testDimensionUnit;
- (char)testInt8;
- (float)testFloat;
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

@implementation CAFTypeTestWithStates

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTestWithStates;
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
  v6.super_class = (Class)CAFTypeTestWithStates;
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
  v6.super_class = (Class)CAFTypeTestWithStates;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFBoolCharacteristic)testBoolCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTestBool:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasTestBool
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testBoolInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testBoolError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testBoolDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFUInt8Characteristic)testUInt8Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setTestUInt8:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)testUInt8Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasTestUInt8
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testUInt8Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testUInt8Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testUInt8Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFUInt16Characteristic)testUInt16Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  unsigned __int16 v3 = [v2 uint16Value];

  return v3;
}

- (void)setTestUInt16:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  [v4 setUint16Value:v3];
}

- (CAFUInt16Range)testUInt16Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt16Range *)v3;
}

- (BOOL)hasTestUInt16
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testUInt16Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testUInt16Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testUInt16Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFUInt32Characteristic)testUInt32Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (void)setTestUInt32:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  [v4 setUint32Value:v3];
}

- (CAFUInt32Range)testUInt32Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (BOOL)hasTestUInt32
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testUInt32Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testUInt32Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testUInt32Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFUInt64Characteristic)testUInt64Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  unint64_t v3 = [v2 uint64Value];

  return v3;
}

- (void)setTestUInt64:(unint64_t)a3
{
  id v4 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  [v4 setUint64Value:a3];
}

- (CAFUInt64Range)testUInt64Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  unint64_t v3 = [v2 range];

  return (CAFUInt64Range *)v3;
}

- (BOOL)hasTestUInt64
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testUInt64Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testUInt64Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testUInt64Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFInt8Characteristic)testInt8Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (void)setTestInt8:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  [v4 setInt8Value:v3];
}

- (CAFInt8Range)testInt8Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

- (BOOL)hasTestInt8
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testInt8Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testInt8Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testInt8Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFInt16Characteristic)testInt16Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  signed __int16 v3 = [v2 int16Value];

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  [v4 setInt16Value:v3];
}

- (CAFInt16Range)testInt16Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt16Range *)v3;
}

- (BOOL)hasTestInt16
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testInt16Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testInt16Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testInt16Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFInt32Characteristic)testInt32Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)testInt32Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testInt32Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testInt32Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testInt32Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFInt64Characteristic)testInt64Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  int64_t v3 = [v2 int64Value];

  return v3;
}

- (void)setTestInt64:(int64_t)a3
{
  id v4 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  [v4 setInt64Value:a3];
}

- (CAFInt64Range)testInt64Range
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  int64_t v3 = [v2 range];

  return (CAFInt64Range *)v3;
}

- (BOOL)hasTestInt64
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testInt64Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testInt64Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testInt64Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFFloatCharacteristic)testFloatCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setTestFloat:(float)a3
{
  id v5 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  *(float *)&double v4 = a3;
  [v5 setFloatValue:v4];
}

- (CAFFloatRange)testFloatRange
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  float v3 = [v2 range];

  return (CAFFloatRange *)v3;
}

- (BOOL)hasTestFloat
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testFloatInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testFloatError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testFloatDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFStringCharacteristic)testStringCharacteristic
{
  char v3 = [(CAFService *)self car];
  double v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (void)setTestString:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  [v5 setStringValue:v4];
}

- (BOOL)hasTestString
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testStringInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testStringError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testStringDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFDataCharacteristic)testDataCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  char v3 = [v2 dataValue];

  return (NSData *)v3;
}

- (void)setTestData:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  [v5 setDataValue:v4];
}

- (BOOL)hasTestData
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDataInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testDataError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDataDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFDataCharacteristic)testRawDataCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
  char v3 = [v2 dataValue];

  return (NSData *)v3;
}

- (BOOL)hasTestRawData
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testRawDataInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testRawDataError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testRawDataDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFButtonActionCharacteristic)testEnumCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
  unsigned __int8 v3 = [v2 buttonActionValue];

  return v3;
}

- (void)setTestEnum:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
  [v4 setButtonActionValue:v3];
}

- (BOOL)hasTestEnum
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testEnumError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testEnumDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFUnitTypeCharacteristic)testDimensionUnitRawValueCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (void)setTestDimensionUnitRawValue:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  [v4 setUnitTypeValue:v3];
}

- (NSUnitSpeed)testDimensionUnit
{
  objc_opt_class();
  uint64_t v3 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
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
  id v5 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  [v5 setUnitValue:v4];
}

- (BOOL)hasTestDimensionUnitRawValue
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testDimensionUnitRawValueError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testDimensionUnitRawValueDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  char v3 = [v2 testComplexItemValue];

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  [v5 setTestComplexItemValue:v4];
}

- (BOOL)hasTestComplexItem
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testComplexItemInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testComplexItemError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testComplexItemDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayBoolCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayBool:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayBool
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayBoolInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayBoolError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayBoolDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt8Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt8:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt8
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayUInt8Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayUInt8Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayUInt8Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt16Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt16:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt16
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayUInt16Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayUInt16Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayUInt16Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt32Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt32:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt32
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayUInt32Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayUInt32Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayUInt32Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt64Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayUInt64:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayUInt64
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayUInt64Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayUInt64Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayUInt64Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt8Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt8:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt8
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayInt8Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayInt8Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayInt8Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt16Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt16:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt16
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayInt16Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayInt16Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayInt16Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt32Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt32:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt32
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayInt32Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayInt32Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayInt32Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt64Characteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayInt64:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayInt64
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayInt64Invalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayInt64Error
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayInt64Disabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayFloatCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayFloat:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayFloat
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayFloatInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayFloatError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayFloatDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayStringCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayString:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayString
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayStringInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayStringError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayStringDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayDataCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setTestArrayData:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  [v5 setArrayValue:v4];
}

- (BOOL)hasTestArrayData
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayDataInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayDataError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayDataDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFArrayCharacteristic)testArrayRawDataCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
  char v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (BOOL)hasTestArrayRawData
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testArrayRawDataInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testArrayRawDataError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testArrayRawDataDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemsCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  char v3 = [v2 testComplexItemsValue];

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  [v5 setTestComplexItemsValue:v4];
}

- (BOOL)hasTestComplexItems
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testComplexItemsInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testComplexItemsError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testComplexItemsDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemValueCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  char v3 = [v2 testComplexItemValue];

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItemValue:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  [v5 setTestComplexItemValue:v4];
}

- (BOOL)hasTestComplexItemValue
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testComplexItemValueInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testComplexItemValueError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testComplexItemValueDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemListCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  char v3 = [v2 testComplexItemsValue];

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItemList:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  [v5 setTestComplexItemsValue:v4];
}

- (BOOL)hasTestComplexItemList
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)testComplexItemListInvalid
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)testComplexItemListError
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  char v3 = [v2 hasErrorState];

  return v3;
}

- (BOOL)testComplexItemListDisabled
{
  objc_super v2 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000007";
}

+ (id)observerProtocol
{
  return &unk_26FDB3258;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x00000000FF000001"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTypeTestWithStates *)self testBoolCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestBool:", self, -[CAFTypeTestWithStates testBool](self, "testBool"));
LABEL_129:

      goto LABEL_130;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x00000000FF000002"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFTypeTestWithStates *)self testUInt8Characteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestUInt8:", self, -[CAFTypeTestWithStates testUInt8](self, "testUInt8"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v18 = [v6 characteristicType];
  if ([v18 isEqual:@"0x00000000FF000003"])
  {
    v19 = [v6 uniqueIdentifier];
    v20 = [(CAFTypeTestWithStates *)self testUInt16Characteristic];
    v21 = [v20 uniqueIdentifier];
    int v22 = [v19 isEqual:v21];

    if (v22)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestUInt16:", self, -[CAFTypeTestWithStates testUInt16](self, "testUInt16"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v23 = [v6 characteristicType];
  if ([v23 isEqual:@"0x00000000FF000004"])
  {
    v24 = [v6 uniqueIdentifier];
    v25 = [(CAFTypeTestWithStates *)self testUInt32Characteristic];
    v26 = [v25 uniqueIdentifier];
    int v27 = [v24 isEqual:v26];

    if (v27)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestUInt32:", self, -[CAFTypeTestWithStates testUInt32](self, "testUInt32"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v28 = [v6 characteristicType];
  if ([v28 isEqual:@"0x00000000FF000005"])
  {
    v29 = [v6 uniqueIdentifier];
    v30 = [(CAFTypeTestWithStates *)self testUInt64Characteristic];
    v31 = [v30 uniqueIdentifier];
    int v32 = [v29 isEqual:v31];

    if (v32)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestUInt64:", self, -[CAFTypeTestWithStates testUInt64](self, "testUInt64"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v33 = [v6 characteristicType];
  if ([v33 isEqual:@"0x00000000FF000006"])
  {
    v34 = [v6 uniqueIdentifier];
    v35 = [(CAFTypeTestWithStates *)self testInt8Characteristic];
    v36 = [v35 uniqueIdentifier];
    int v37 = [v34 isEqual:v36];

    if (v37)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestInt8:", self, -[CAFTypeTestWithStates testInt8](self, "testInt8"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v38 = [v6 characteristicType];
  if ([v38 isEqual:@"0x00000000FF000007"])
  {
    v39 = [v6 uniqueIdentifier];
    v40 = [(CAFTypeTestWithStates *)self testInt16Characteristic];
    v41 = [v40 uniqueIdentifier];
    int v42 = [v39 isEqual:v41];

    if (v42)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestInt16:", self, -[CAFTypeTestWithStates testInt16](self, "testInt16"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v43 = [v6 characteristicType];
  if ([v43 isEqual:@"0x00000000FF000008"])
  {
    v44 = [v6 uniqueIdentifier];
    v45 = [(CAFTypeTestWithStates *)self testInt32Characteristic];
    v46 = [v45 uniqueIdentifier];
    int v47 = [v44 isEqual:v46];

    if (v47)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestInt32:", self, -[CAFTypeTestWithStates testInt32](self, "testInt32"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v48 = [v6 characteristicType];
  if ([v48 isEqual:@"0x00000000FF000009"])
  {
    v49 = [v6 uniqueIdentifier];
    v50 = [(CAFTypeTestWithStates *)self testInt64Characteristic];
    v51 = [v50 uniqueIdentifier];
    int v52 = [v49 isEqual:v51];

    if (v52)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestInt64:", self, -[CAFTypeTestWithStates testInt64](self, "testInt64"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v53 = [v6 characteristicType];
  if ([v53 isEqual:@"0x00000000FF00000A"])
  {
    v54 = [v6 uniqueIdentifier];
    v55 = [(CAFTypeTestWithStates *)self testFloatCharacteristic];
    v56 = [v55 uniqueIdentifier];
    int v57 = [v54 isEqual:v56];

    if (v57)
    {
      v12 = [(CAFService *)self observers];
      [(CAFTypeTestWithStates *)self testFloat];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestFloat:", self);
      goto LABEL_129;
    }
  }
  else
  {
  }
  v58 = [v6 characteristicType];
  if ([v58 isEqual:@"0x00000000FF00000B"])
  {
    v59 = [v6 uniqueIdentifier];
    v60 = [(CAFTypeTestWithStates *)self testStringCharacteristic];
    v61 = [v60 uniqueIdentifier];
    int v62 = [v59 isEqual:v61];

    if (v62)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testString];
      [v12 typeTestWithStatesService:self didUpdateTestString:v63];
LABEL_128:

      goto LABEL_129;
    }
  }
  else
  {
  }
  v64 = [v6 characteristicType];
  if ([v64 isEqual:@"0x00000000FF00000C"])
  {
    v65 = [v6 uniqueIdentifier];
    v66 = [(CAFTypeTestWithStates *)self testDataCharacteristic];
    v67 = [v66 uniqueIdentifier];
    int v68 = [v65 isEqual:v67];

    if (v68)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testData];
      [v12 typeTestWithStatesService:self didUpdateTestData:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v69 = [v6 characteristicType];
  if ([v69 isEqual:@"0x00000000FF00000D"])
  {
    v70 = [v6 uniqueIdentifier];
    v71 = [(CAFTypeTestWithStates *)self testRawDataCharacteristic];
    v72 = [v71 uniqueIdentifier];
    int v73 = [v70 isEqual:v72];

    if (v73)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testRawData];
      [v12 typeTestWithStatesService:self didUpdateTestRawData:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v74 = [v6 characteristicType];
  if ([v74 isEqual:@"0x00000000FF00000E"])
  {
    v75 = [v6 uniqueIdentifier];
    v76 = [(CAFTypeTestWithStates *)self testEnumCharacteristic];
    v77 = [v76 uniqueIdentifier];
    int v78 = [v75 isEqual:v77];

    if (v78)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestEnum:", self, -[CAFTypeTestWithStates testEnum](self, "testEnum"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v79 = [v6 characteristicType];
  if ([v79 isEqual:@"0x00000000FF00000F"])
  {
    v80 = [v6 uniqueIdentifier];
    v81 = [(CAFTypeTestWithStates *)self testDimensionUnitRawValueCharacteristic];
    v82 = [v81 uniqueIdentifier];
    int v83 = [v80 isEqual:v82];

    if (v83)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestWithStatesService:didUpdateTestDimensionUnitRawValue:", self, -[CAFTypeTestWithStates testDimensionUnitRawValue](self, "testDimensionUnitRawValue"));
      goto LABEL_129;
    }
  }
  else
  {
  }
  v84 = [v6 characteristicType];
  if ([v84 isEqual:@"0x00000000FF000010"])
  {
    v85 = [v6 uniqueIdentifier];
    v86 = [(CAFTypeTestWithStates *)self testComplexItemCharacteristic];
    v87 = [v86 uniqueIdentifier];
    int v88 = [v85 isEqual:v87];

    if (v88)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testComplexItem];
      [v12 typeTestWithStatesService:self didUpdateTestComplexItem:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v89 = [v6 characteristicType];
  if ([v89 isEqual:@"0x00000000FF000011"])
  {
    v90 = [v6 uniqueIdentifier];
    v91 = [(CAFTypeTestWithStates *)self testArrayBoolCharacteristic];
    v92 = [v91 uniqueIdentifier];
    int v93 = [v90 isEqual:v92];

    if (v93)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayBool];
      [v12 typeTestWithStatesService:self didUpdateTestArrayBool:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v94 = [v6 characteristicType];
  if ([v94 isEqual:@"0x00000000FF000012"])
  {
    v95 = [v6 uniqueIdentifier];
    v96 = [(CAFTypeTestWithStates *)self testArrayUInt8Characteristic];
    v97 = [v96 uniqueIdentifier];
    int v98 = [v95 isEqual:v97];

    if (v98)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayUInt8];
      [v12 typeTestWithStatesService:self didUpdateTestArrayUInt8:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v99 = [v6 characteristicType];
  if ([v99 isEqual:@"0x00000000FF000013"])
  {
    v100 = [v6 uniqueIdentifier];
    v101 = [(CAFTypeTestWithStates *)self testArrayUInt16Characteristic];
    v102 = [v101 uniqueIdentifier];
    int v103 = [v100 isEqual:v102];

    if (v103)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayUInt16];
      [v12 typeTestWithStatesService:self didUpdateTestArrayUInt16:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v104 = [v6 characteristicType];
  if ([v104 isEqual:@"0x00000000FF000014"])
  {
    v105 = [v6 uniqueIdentifier];
    v106 = [(CAFTypeTestWithStates *)self testArrayUInt32Characteristic];
    v107 = [v106 uniqueIdentifier];
    int v108 = [v105 isEqual:v107];

    if (v108)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayUInt32];
      [v12 typeTestWithStatesService:self didUpdateTestArrayUInt32:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v109 = [v6 characteristicType];
  if ([v109 isEqual:@"0x00000000FF000015"])
  {
    v110 = [v6 uniqueIdentifier];
    v111 = [(CAFTypeTestWithStates *)self testArrayUInt64Characteristic];
    v112 = [v111 uniqueIdentifier];
    int v113 = [v110 isEqual:v112];

    if (v113)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayUInt64];
      [v12 typeTestWithStatesService:self didUpdateTestArrayUInt64:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v114 = [v6 characteristicType];
  if ([v114 isEqual:@"0x00000000FF000016"])
  {
    v115 = [v6 uniqueIdentifier];
    v116 = [(CAFTypeTestWithStates *)self testArrayInt8Characteristic];
    v117 = [v116 uniqueIdentifier];
    int v118 = [v115 isEqual:v117];

    if (v118)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayInt8];
      [v12 typeTestWithStatesService:self didUpdateTestArrayInt8:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v119 = [v6 characteristicType];
  if ([v119 isEqual:@"0x00000000FF000017"])
  {
    v120 = [v6 uniqueIdentifier];
    v121 = [(CAFTypeTestWithStates *)self testArrayInt16Characteristic];
    v122 = [v121 uniqueIdentifier];
    int v123 = [v120 isEqual:v122];

    if (v123)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayInt16];
      [v12 typeTestWithStatesService:self didUpdateTestArrayInt16:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v124 = [v6 characteristicType];
  if ([v124 isEqual:@"0x00000000FF000018"])
  {
    v125 = [v6 uniqueIdentifier];
    v126 = [(CAFTypeTestWithStates *)self testArrayInt32Characteristic];
    v127 = [v126 uniqueIdentifier];
    int v128 = [v125 isEqual:v127];

    if (v128)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayInt32];
      [v12 typeTestWithStatesService:self didUpdateTestArrayInt32:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v129 = [v6 characteristicType];
  if ([v129 isEqual:@"0x00000000FF000019"])
  {
    v130 = [v6 uniqueIdentifier];
    v131 = [(CAFTypeTestWithStates *)self testArrayInt64Characteristic];
    v132 = [v131 uniqueIdentifier];
    int v133 = [v130 isEqual:v132];

    if (v133)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayInt64];
      [v12 typeTestWithStatesService:self didUpdateTestArrayInt64:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v134 = [v6 characteristicType];
  if ([v134 isEqual:@"0x00000000FF00001A"])
  {
    v135 = [v6 uniqueIdentifier];
    v136 = [(CAFTypeTestWithStates *)self testArrayFloatCharacteristic];
    v137 = [v136 uniqueIdentifier];
    int v138 = [v135 isEqual:v137];

    if (v138)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayFloat];
      [v12 typeTestWithStatesService:self didUpdateTestArrayFloat:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v139 = [v6 characteristicType];
  if ([v139 isEqual:@"0x00000000FF00001B"])
  {
    v140 = [v6 uniqueIdentifier];
    v141 = [(CAFTypeTestWithStates *)self testArrayStringCharacteristic];
    v142 = [v141 uniqueIdentifier];
    int v143 = [v140 isEqual:v142];

    if (v143)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayString];
      [v12 typeTestWithStatesService:self didUpdateTestArrayString:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v144 = [v6 characteristicType];
  if ([v144 isEqual:@"0x00000000FF00001C"])
  {
    v145 = [v6 uniqueIdentifier];
    v146 = [(CAFTypeTestWithStates *)self testArrayDataCharacteristic];
    v147 = [v146 uniqueIdentifier];
    int v148 = [v145 isEqual:v147];

    if (v148)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayData];
      [v12 typeTestWithStatesService:self didUpdateTestArrayData:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v149 = [v6 characteristicType];
  if ([v149 isEqual:@"0x00000000FF00001D"])
  {
    v150 = [v6 uniqueIdentifier];
    v151 = [(CAFTypeTestWithStates *)self testArrayRawDataCharacteristic];
    v152 = [v151 uniqueIdentifier];
    int v153 = [v150 isEqual:v152];

    if (v153)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testArrayRawData];
      [v12 typeTestWithStatesService:self didUpdateTestArrayRawData:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v154 = [v6 characteristicType];
  if ([v154 isEqual:@"0x00000000FF000020"])
  {
    v155 = [v6 uniqueIdentifier];
    v156 = [(CAFTypeTestWithStates *)self testComplexItemsCharacteristic];
    v157 = [v156 uniqueIdentifier];
    int v158 = [v155 isEqual:v157];

    if (v158)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testComplexItems];
      [v12 typeTestWithStatesService:self didUpdateTestComplexItems:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v159 = [v6 characteristicType];
  if ([v159 isEqual:@"0x00000000FF000021"])
  {
    v160 = [v6 uniqueIdentifier];
    v161 = [(CAFTypeTestWithStates *)self testComplexItemValueCharacteristic];
    v162 = [v161 uniqueIdentifier];
    int v163 = [v160 isEqual:v162];

    if (v163)
    {
      v12 = [(CAFService *)self observers];
      v63 = [(CAFTypeTestWithStates *)self testComplexItemValue];
      [v12 typeTestWithStatesService:self didUpdateTestComplexItemValue:v63];
      goto LABEL_128;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x00000000FF000022"]) {
    goto LABEL_129;
  }
  v164 = [v6 uniqueIdentifier];
  v165 = [(CAFTypeTestWithStates *)self testComplexItemListCharacteristic];
  v166 = [v165 uniqueIdentifier];
  int v167 = [v164 isEqual:v166];

  if (v167)
  {
    v12 = [(CAFService *)self observers];
    v63 = [(CAFTypeTestWithStates *)self testComplexItemList];
    [v12 typeTestWithStatesService:self didUpdateTestComplexItemList:v63];
    goto LABEL_128;
  }
LABEL_130:
  v168.receiver = self;
  v168.super_class = (Class)CAFTypeTestWithStates;
  [(CAFService *)&v168 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTestBool
{
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
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