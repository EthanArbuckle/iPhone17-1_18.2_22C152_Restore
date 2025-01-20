@interface CAFDefrost
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasBlownAir;
- (BOOL)hasFilament;
- (BOOL)levelInvalid;
- (BOOL)registeredForDefrostTypes;
- (BOOL)registeredForLevel;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFDefrostTypesCharacteristic)typesCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (CAFUInt8Characteristic)levelCharacteristic;
- (CAFUInt8Range)levelRange;
- (NSString)vehicleLayoutKey;
- (id)name;
- (unint64_t)types;
- (unsigned)level;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setLevel:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDefrost

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDefrost;
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
  v6.super_class = (Class)CAFDefrost;
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
  v6.super_class = (Class)CAFDefrost;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFDefrost *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFDefrostTypesCharacteristic)typesCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000014"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000014"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFDefrostTypesCharacteristic *)v11;
}

- (unint64_t)types
{
  objc_super v2 = [(CAFDefrost *)self typesCharacteristic];
  unint64_t v3 = [v2 defrostTypesValue];

  return v3;
}

- (BOOL)hasBlownAir
{
  objc_super v2 = [(CAFDefrost *)self typesCharacteristic];
  char v3 = [v2 hasBlownAir];

  return v3;
}

- (BOOL)hasFilament
{
  objc_super v2 = [(CAFDefrost *)self typesCharacteristic];
  char v3 = [v2 hasFilament];

  return v3;
}

- (CAFUInt8Characteristic)levelCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)level
{
  objc_super v2 = [(CAFDefrost *)self levelCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setLevel:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFDefrost *)self levelCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)levelRange
{
  objc_super v2 = [(CAFDefrost *)self levelCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)levelInvalid
{
  objc_super v2 = [(CAFDefrost *)self levelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  char v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFDefrost *)self vehicleLayoutKeyCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000005";
}

+ (id)observerProtocol
{
  return &unk_26FDAF8F0;
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
  if ([v7 isEqual:@"0x0000000031000014"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFDefrost *)self typesCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "defrostService:didUpdateTypes:", self, -[CAFDefrost types](self, "types"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000030000004"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFDefrost *)self levelCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "defrostService:didUpdateLevel:", self, -[CAFDefrost level](self, "level"));
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"]) {
    goto LABEL_12;
  }
  v18 = [v6 uniqueIdentifier];
  v19 = [(CAFDefrost *)self vehicleLayoutKeyCharacteristic];
  v20 = [v19 uniqueIdentifier];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v22 = [(CAFService *)self observers];
    v23 = [(CAFDefrost *)self vehicleLayoutKey];
    [v22 defrostService:self didUpdateVehicleLayoutKey:v23];

    v12 = [(CAFService *)self observers];
    v24 = [(CAFDefrost *)self name];
    [v12 defrostService:self didUpdateName:v24];

    goto LABEL_12;
  }
LABEL_13:
  v25.receiver = self;
  v25.super_class = (Class)CAFDefrost;
  [(CAFService *)&v25 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForDefrostTypes
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000014"];

  return v10;
}

- (BOOL)registeredForLevel
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000004"];

  return v10;
}

- (BOOL)registeredForVehicleLayoutKey
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  return v10;
}

@end