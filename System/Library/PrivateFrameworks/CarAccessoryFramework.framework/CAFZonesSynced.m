@interface CAFZonesSynced
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasVehicleLayoutKey;
- (BOOL)on;
- (BOOL)onDisabled;
- (BOOL)onInvalid;
- (BOOL)onRestricted;
- (BOOL)registeredForOn;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (NSString)vehicleLayoutKey;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFZonesSynced

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFZonesSynced;
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
  v6.super_class = (Class)CAFZonesSynced;
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
  v6.super_class = (Class)CAFZonesSynced;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFZonesSynced *)self vehicleLayoutKeyCharacteristic];
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
  objc_super v2 = [(CAFZonesSynced *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFZonesSynced *)self onCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)onDisabled
{
  objc_super v2 = [(CAFZonesSynced *)self onCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)onInvalid
{
  objc_super v2 = [(CAFZonesSynced *)self onCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)onRestricted
{
  objc_super v2 = [(CAFZonesSynced *)self onCharacteristic];
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
  objc_super v2 = [(CAFZonesSynced *)self vehicleLayoutKeyCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasVehicleLayoutKey
{
  objc_super v2 = [(CAFZonesSynced *)self vehicleLayoutKeyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000012";
}

+ (id)observerProtocol
{
  return &unk_26FDB4D88;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000002"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFZonesSynced *)self onCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "zonesSyncedService:didUpdateOn:", self, -[CAFZonesSynced on](self, "on"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFZonesSynced *)self vehicleLayoutKeyCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v17 = [(CAFService *)self observers];
    v18 = [(CAFZonesSynced *)self vehicleLayoutKey];
    [v17 zonesSyncedService:self didUpdateVehicleLayoutKey:v18];

    v12 = [(CAFService *)self observers];
    v19 = [(CAFZonesSynced *)self name];
    [v12 zonesSyncedService:self didUpdateName:v19];

    goto LABEL_8;
  }
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)CAFZonesSynced;
  [(CAFService *)&v20 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
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