@interface CAFProtocolPerfTest
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForTestInt16;
- (BOOL)registeredForTestInt32;
- (BOOL)registeredForTestString;
- (BOOL)registeredForTestString2;
- (BOOL)registeredForTestUInt16;
- (BOOL)registeredForTestUInt32;
- (CAFInt16Characteristic)testInt16Characteristic;
- (CAFInt16Range)testInt16Range;
- (CAFInt32Characteristic)testInt32Characteristic;
- (CAFInt32Range)testInt32Range;
- (CAFStringCharacteristic)testString2Characteristic;
- (CAFStringCharacteristic)testStringCharacteristic;
- (CAFUInt16Characteristic)testUInt16Characteristic;
- (CAFUInt16Range)testUInt16Range;
- (CAFUInt32Characteristic)testUInt32Characteristic;
- (CAFUInt32Range)testUInt32Range;
- (NSString)testString;
- (NSString)testString2;
- (id)name;
- (int)testInt32;
- (signed)testInt16;
- (unsigned)testUInt16;
- (unsigned)testUInt32;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setTestInt16:(signed __int16)a3;
- (void)setTestString2:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFProtocolPerfTest

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFProtocolPerfTest;
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
  v6.super_class = (Class)CAFProtocolPerfTest;
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
  v6.super_class = (Class)CAFProtocolPerfTest;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFProtocolPerfTest *)self testStringCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFInt32Characteristic)testInt32Characteristic
{
  v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFProtocolPerfTest *)self testInt32Characteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (CAFInt32Range)testInt32Range
{
  objc_super v2 = [(CAFProtocolPerfTest *)self testInt32Characteristic];
  int v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (CAFInt16Characteristic)testInt16Characteristic
{
  int v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFProtocolPerfTest *)self testInt16Characteristic];
  signed __int16 v3 = [v2 int16Value];

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFProtocolPerfTest *)self testInt16Characteristic];
  [v4 setInt16Value:v3];
}

- (CAFInt16Range)testInt16Range
{
  objc_super v2 = [(CAFProtocolPerfTest *)self testInt16Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt16Range *)v3;
}

- (CAFUInt32Characteristic)testUInt32Characteristic
{
  uint64_t v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFProtocolPerfTest *)self testUInt32Characteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (CAFUInt32Range)testUInt32Range
{
  objc_super v2 = [(CAFProtocolPerfTest *)self testUInt32Characteristic];
  unsigned int v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (CAFUInt16Characteristic)testUInt16Characteristic
{
  unsigned int v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFProtocolPerfTest *)self testUInt16Characteristic];
  unsigned __int16 v3 = [v2 uint16Value];

  return v3;
}

- (CAFUInt16Range)testUInt16Range
{
  objc_super v2 = [(CAFProtocolPerfTest *)self testUInt16Characteristic];
  unsigned __int16 v3 = [v2 range];

  return (CAFUInt16Range *)v3;
}

- (CAFStringCharacteristic)testStringCharacteristic
{
  unsigned __int16 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
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
  objc_super v2 = [(CAFProtocolPerfTest *)self testStringCharacteristic];
  unsigned __int16 v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)testString2Characteristic
{
  unsigned __int16 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x00000000FF000023"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x00000000FF000023"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)testString2
{
  objc_super v2 = [(CAFProtocolPerfTest *)self testString2Characteristic];
  unsigned __int16 v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (void)setTestString2:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFProtocolPerfTest *)self testString2Characteristic];
  [v5 setStringValue:v4];
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000006";
}

+ (id)observerProtocol
{
  return &unk_26FDB1DC0;
}

+ (id)indexBy
{
  return @"0x00000000FF00000B";
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x00000000FF000008"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFProtocolPerfTest *)self testInt32Characteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestInt32:", self, -[CAFProtocolPerfTest testInt32](self, "testInt32"));
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x00000000FF000007"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFProtocolPerfTest *)self testInt16Characteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestInt16:", self, -[CAFProtocolPerfTest testInt16](self, "testInt16"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v18 = [v6 characteristicType];
  if ([v18 isEqual:@"0x00000000FF000004"])
  {
    v19 = [v6 uniqueIdentifier];
    v20 = [(CAFProtocolPerfTest *)self testUInt32Characteristic];
    v21 = [v20 uniqueIdentifier];
    int v22 = [v19 isEqual:v21];

    if (v22)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestUInt32:", self, -[CAFProtocolPerfTest testUInt32](self, "testUInt32"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v23 = [v6 characteristicType];
  if ([v23 isEqual:@"0x00000000FF000003"])
  {
    v24 = [v6 uniqueIdentifier];
    v25 = [(CAFProtocolPerfTest *)self testUInt16Characteristic];
    v26 = [v25 uniqueIdentifier];
    int v27 = [v24 isEqual:v26];

    if (v27)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestUInt16:", self, -[CAFProtocolPerfTest testUInt16](self, "testUInt16"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v28 = [v6 characteristicType];
  if ([v28 isEqual:@"0x00000000FF00000B"])
  {
    v29 = [v6 uniqueIdentifier];
    v30 = [(CAFProtocolPerfTest *)self testStringCharacteristic];
    v31 = [v30 uniqueIdentifier];
    int v32 = [v29 isEqual:v31];

    if (v32)
    {
      v33 = [(CAFService *)self observers];
      v34 = [(CAFProtocolPerfTest *)self testString];
      [v33 protocolPerfTestService:self didUpdateTestString:v34];

      v12 = [(CAFService *)self observers];
      v35 = [(CAFProtocolPerfTest *)self name];
      [v12 protocolPerfTestService:self didUpdateName:v35];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x00000000FF000023"]) {
    goto LABEL_25;
  }
  v36 = [v6 uniqueIdentifier];
  v37 = [(CAFProtocolPerfTest *)self testString2Characteristic];
  v38 = [v37 uniqueIdentifier];
  int v39 = [v36 isEqual:v38];

  if (v39)
  {
    v12 = [(CAFService *)self observers];
    v35 = [(CAFProtocolPerfTest *)self testString2];
    [v12 protocolPerfTestService:self didUpdateTestString2:v35];
    goto LABEL_24;
  }
LABEL_26:
  v40.receiver = self;
  v40.super_class = (Class)CAFProtocolPerfTest;
  [(CAFService *)&v40 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTestInt32
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000008"];

  return v10;
}

- (BOOL)registeredForTestInt16
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000007"];

  return v10;
}

- (BOOL)registeredForTestUInt32
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000004"];

  return v10;
}

- (BOOL)registeredForTestUInt16
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000003"];

  return v10;
}

- (BOOL)registeredForTestString
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF00000B"];

  return v10;
}

- (BOOL)registeredForTestString2
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x00000000FF000023"];

  return v10;
}

@end