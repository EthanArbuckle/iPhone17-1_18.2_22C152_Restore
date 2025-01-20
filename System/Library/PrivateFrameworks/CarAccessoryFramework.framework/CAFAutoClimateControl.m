@interface CAFAutoClimateControl
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasIntensity;
- (BOOL)hasLevel;
- (BOOL)hasVehicleLayoutKey;
- (BOOL)intensityDisabled;
- (BOOL)intensityRestricted;
- (BOOL)levelDisabled;
- (BOOL)levelInvalid;
- (BOOL)levelRestricted;
- (BOOL)registeredForAutoModeIntensity;
- (BOOL)registeredForAutoModeLevel;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFAutoModeIntensityCharacteristic)intensityCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (CAFUInt8Characteristic)levelCharacteristic;
- (CAFUInt8Range)levelRange;
- (NSString)vehicleLayoutKey;
- (id)name;
- (unsigned)intensity;
- (unsigned)level;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setIntensity:(unsigned __int8)a3;
- (void)setLevel:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFAutoClimateControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFAutoClimateControl;
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
  v6.super_class = (Class)CAFAutoClimateControl;
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
  v6.super_class = (Class)CAFAutoClimateControl;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFAutoClimateControl *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFUInt8Characteristic)levelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000024"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000024"];
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
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setLevel:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFAutoClimateControl *)self levelCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)levelRange
{
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasLevel
{
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)levelInvalid
{
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)levelDisabled
{
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)levelRestricted
{
  objc_super v2 = [(CAFAutoClimateControl *)self levelCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFAutoModeIntensityCharacteristic)intensityCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000028"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000028"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFAutoModeIntensityCharacteristic *)v11;
}

- (unsigned)intensity
{
  objc_super v2 = [(CAFAutoClimateControl *)self intensityCharacteristic];
  unsigned __int8 v3 = [v2 autoModeIntensityValue];

  return v3;
}

- (void)setIntensity:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFAutoClimateControl *)self intensityCharacteristic];
  [v4 setAutoModeIntensityValue:v3];
}

- (BOOL)hasIntensity
{
  objc_super v2 = [(CAFAutoClimateControl *)self intensityCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)intensityDisabled
{
  objc_super v2 = [(CAFAutoClimateControl *)self intensityCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)intensityRestricted
{
  objc_super v2 = [(CAFAutoClimateControl *)self intensityCharacteristic];
  char v3 = [v2 isRestricted];

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
  objc_super v2 = [(CAFAutoClimateControl *)self vehicleLayoutKeyCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasVehicleLayoutKey
{
  objc_super v2 = [(CAFAutoClimateControl *)self vehicleLayoutKeyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000008";
}

+ (id)observerProtocol
{
  return &unk_26FDB34C0;
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
  if ([v7 isEqual:@"0x0000000031000024"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFAutoClimateControl *)self levelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "autoClimateControlService:didUpdateLevel:", self, -[CAFAutoClimateControl level](self, "level"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000031000028"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFAutoClimateControl *)self intensityCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "autoClimateControlService:didUpdateIntensity:", self, -[CAFAutoClimateControl intensity](self, "intensity"));
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
  v19 = [(CAFAutoClimateControl *)self vehicleLayoutKeyCharacteristic];
  v20 = [v19 uniqueIdentifier];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v22 = [(CAFService *)self observers];
    v23 = [(CAFAutoClimateControl *)self vehicleLayoutKey];
    [v22 autoClimateControlService:self didUpdateVehicleLayoutKey:v23];

    v12 = [(CAFService *)self observers];
    v24 = [(CAFAutoClimateControl *)self name];
    [v12 autoClimateControlService:self didUpdateName:v24];

    goto LABEL_12;
  }
LABEL_13:
  v25.receiver = self;
  v25.super_class = (Class)CAFAutoClimateControl;
  [(CAFService *)&v25 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForAutoModeLevel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000024"];

  return v10;
}

- (BOOL)registeredForAutoModeIntensity
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000028"];

  return v10;
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

@end