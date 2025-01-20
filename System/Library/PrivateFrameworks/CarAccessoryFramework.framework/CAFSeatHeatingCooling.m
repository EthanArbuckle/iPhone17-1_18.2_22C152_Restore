@interface CAFSeatHeatingCooling
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)autoMode;
- (BOOL)hasAutoMode;
- (BOOL)hasOn;
- (BOOL)heatingCoolingLevelDisabled;
- (BOOL)heatingCoolingLevelInvalid;
- (BOOL)heatingCoolingLevelRestricted;
- (BOOL)on;
- (BOOL)onDisabled;
- (BOOL)onInvalid;
- (BOOL)onRestricted;
- (BOOL)registeredForAutoMode;
- (BOOL)registeredForHeatingCoolingLevel;
- (BOOL)registeredForOn;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFBoolCharacteristic)autoModeCharacteristic;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFInt32Characteristic)heatingCoolingLevelCharacteristic;
- (CAFInt32Range)heatingCoolingLevelRange;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (NSString)vehicleLayoutKey;
- (id)name;
- (int)heatingCoolingLevel;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setHeatingCoolingLevel:(int)a3;
- (void)setOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSeatHeatingCooling

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatHeatingCooling;
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
  v6.super_class = (Class)CAFSeatHeatingCooling;
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
  v6.super_class = (Class)CAFSeatHeatingCooling;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFSeatHeatingCooling *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFBoolCharacteristic)onCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)on
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasOn
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)onDisabled
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)onInvalid
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)onRestricted
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self onCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFInt32Characteristic)heatingCoolingLevelCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000021"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000021"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt32Characteristic *)v11;
}

- (int)heatingCoolingLevel
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setHeatingCoolingLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)heatingCoolingLevelRange
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)heatingCoolingLevelDisabled
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)heatingCoolingLevelInvalid
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)heatingCoolingLevelRestricted
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFBoolCharacteristic)autoModeCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000005F"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)autoMode
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self autoModeCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasAutoMode
{
  objc_super v2 = [(CAFSeatHeatingCooling *)self autoModeCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFSeatHeatingCooling *)self vehicleLayoutKeyCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000022000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB2A90;
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
  if ([v7 isEqual:@"0x0000000030000002"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFSeatHeatingCooling *)self onCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "heatingCoolingService:didUpdateOn:", self, -[CAFSeatHeatingCooling on](self, "on"));
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000031000021"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFSeatHeatingCooling *)self heatingCoolingLevelCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "heatingCoolingService:didUpdateHeatingCoolingLevel:", self, -[CAFSeatHeatingCooling heatingCoolingLevel](self, "heatingCoolingLevel"));
      goto LABEL_16;
    }
  }
  else
  {
  }
  v18 = [v6 characteristicType];
  if ([v18 isEqual:@"0x000000003000005F"])
  {
    v19 = [v6 uniqueIdentifier];
    v20 = [(CAFSeatHeatingCooling *)self autoModeCharacteristic];
    v21 = [v20 uniqueIdentifier];
    int v22 = [v19 isEqual:v21];

    if (v22)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "heatingCoolingService:didUpdateAutoMode:", self, -[CAFSeatHeatingCooling autoMode](self, "autoMode"));
      goto LABEL_16;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"]) {
    goto LABEL_16;
  }
  v23 = [v6 uniqueIdentifier];
  v24 = [(CAFSeatHeatingCooling *)self vehicleLayoutKeyCharacteristic];
  v25 = [v24 uniqueIdentifier];
  int v26 = [v23 isEqual:v25];

  if (v26)
  {
    v27 = [(CAFService *)self observers];
    v28 = [(CAFSeatHeatingCooling *)self vehicleLayoutKey];
    [v27 heatingCoolingService:self didUpdateVehicleLayoutKey:v28];

    v12 = [(CAFService *)self observers];
    v29 = [(CAFSeatHeatingCooling *)self name];
    [v12 heatingCoolingService:self didUpdateName:v29];

    goto LABEL_16;
  }
LABEL_17:
  v30.receiver = self;
  v30.super_class = (Class)CAFSeatHeatingCooling;
  [(CAFService *)&v30 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForOn
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  return v10;
}

- (BOOL)registeredForHeatingCoolingLevel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000021"];

  return v10;
}

- (BOOL)registeredForAutoMode
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

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