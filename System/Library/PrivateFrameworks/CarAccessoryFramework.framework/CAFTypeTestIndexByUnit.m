@interface CAFTypeTestIndexByUnit
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTestInt32;
- (BOOL)registeredForDistanceUnit;
- (BOOL)registeredForTestInt32;
- (CAFInt32Characteristic)testInt32Characteristic;
- (CAFInt32Range)testInt32Range;
- (CAFUnitTypeCharacteristic)distanceUnitRawValueCharacteristic;
- (NSUnitLength)distanceUnit;
- (id)name;
- (int)testInt32;
- (unsigned)distanceUnitRawValue;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setTestInt32:(int)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTypeTestIndexByUnit

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTestIndexByUnit;
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
  v6.super_class = (Class)CAFTypeTestIndexByUnit;
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
  v6.super_class = (Class)CAFTypeTestIndexByUnit;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTypeTestIndexByUnit *)self distanceUnitRawValueCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFUnitTypeCharacteristic)distanceUnitRawValueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)distanceUnitRawValue
{
  objc_super v2 = [(CAFTypeTestIndexByUnit *)self distanceUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (NSUnitLength)distanceUnit
{
  objc_opt_class();
  unsigned __int16 v3 = [(CAFTypeTestIndexByUnit *)self distanceUnitRawValueCharacteristic];
  id v4 = [v3 unitValue];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSUnitLength *)v5;
}

- (CAFInt32Characteristic)testInt32Characteristic
{
  unsigned __int16 v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFTypeTestIndexByUnit *)self testInt32Characteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestIndexByUnit *)self testInt32Characteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)testInt32Range
{
  objc_super v2 = [(CAFTypeTestIndexByUnit *)self testInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  objc_super v2 = [(CAFTypeTestIndexByUnit *)self testInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000005";
}

+ (id)observerProtocol
{
  return &unk_26FDB35A0;
}

+ (id)indexBy
{
  return @"0x0000000046000004";
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000046000004"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTypeTestIndexByUnit *)self distanceUnitRawValueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "typeTestIndexByUnitService:didUpdateDistanceUnitRawValue:", self, -[CAFTypeTestIndexByUnit distanceUnitRawValue](self, "distanceUnitRawValue"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x00000000FF000008"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFTypeTestIndexByUnit *)self testInt32Characteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "typeTestIndexByUnitService:didUpdateTestInt32:", self, -[CAFTypeTestIndexByUnit testInt32](self, "testInt32"));
    goto LABEL_8;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)CAFTypeTestIndexByUnit;
  [(CAFService *)&v17 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForDistanceUnit
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000004"];

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

@end