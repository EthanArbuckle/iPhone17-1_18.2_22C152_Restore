@interface CAFTypeTestIndexByPosition
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTestInt32;
- (BOOL)registeredForTestInt32;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFInt32Characteristic)testInt32Characteristic;
- (CAFInt32Range)testInt32Range;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (NSString)vehicleLayoutKey;
- (id)name;
- (int)testInt32;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setTestInt32:(int)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTypeTestIndexByPosition

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTestIndexByPosition;
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
  v6.super_class = (Class)CAFTypeTestIndexByPosition;
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
  v6.super_class = (Class)CAFTypeTestIndexByPosition;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTypeTestIndexByPosition *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000065"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayoutKey
{
  objc_super v2 = [(CAFTypeTestIndexByPosition *)self vehicleLayoutKeyCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
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
  objc_super v2 = [(CAFTypeTestIndexByPosition *)self testInt32Characteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFTypeTestIndexByPosition *)self testInt32Characteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)testInt32Range
{
  objc_super v2 = [(CAFTypeTestIndexByPosition *)self testInt32Characteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  objc_super v2 = [(CAFTypeTestIndexByPosition *)self testInt32Characteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x00000000FE000004";
}

+ (id)observerProtocol
{
  return &unk_26FDB1810;
}

+ (id)indexBy
{
  return @"0x0000000036000065";
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000065"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTypeTestIndexByPosition *)self vehicleLayoutKeyCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFTypeTestIndexByPosition *)self vehicleLayoutKey];
      [v12 typeTestIndexByPositionService:self didUpdateVehicleLayoutKey:v13];

      v14 = [(CAFService *)self observers];
      v15 = [(CAFTypeTestIndexByPosition *)self name];
      [v14 typeTestIndexByPositionService:self didUpdateName:v15];

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if (![v14 isEqual:@"0x00000000FF000008"]) {
    goto LABEL_8;
  }
  v16 = [v6 uniqueIdentifier];
  v17 = [(CAFTypeTestIndexByPosition *)self testInt32Characteristic];
  v18 = [v17 uniqueIdentifier];
  int v19 = [v16 isEqual:v18];

  if (v19)
  {
    v14 = [(CAFService *)self observers];
    objc_msgSend(v14, "typeTestIndexByPositionService:didUpdateTestInt32:", self, -[CAFTypeTestIndexByPosition testInt32](self, "testInt32"));
    goto LABEL_8;
  }
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)CAFTypeTestIndexByPosition;
  [(CAFService *)&v20 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForVehicleLayoutKey
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

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