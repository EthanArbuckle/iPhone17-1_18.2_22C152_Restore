@interface CAFTirePressure
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForPressure;
- (BOOL)registeredForPressureState;
- (BOOL)registeredForSensorState;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFMeasurementCharacteristic)pressureCharacteristic;
- (CAFPressureStateCharacteristic)pressureStateCharacteristic;
- (CAFSensorStateCharacteristic)sensorStateCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (CAFUInt32Range)pressureRange;
- (NSMeasurement)pressure;
- (NSString)vehicleLayoutKey;
- (id)name;
- (unsigned)pressureState;
- (unsigned)sensorState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTirePressure

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTirePressure;
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
  v6.super_class = (Class)CAFTirePressure;
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
  v6.super_class = (Class)CAFTirePressure;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTirePressure *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFSensorStateCharacteristic)sensorStateCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000001A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000001A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSensorStateCharacteristic *)v11;
}

- (unsigned)sensorState
{
  objc_super v2 = [(CAFTirePressure *)self sensorStateCharacteristic];
  unsigned __int8 v3 = [v2 sensorStateValue];

  return v3;
}

- (CAFMeasurementCharacteristic)pressureCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000001B"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000001B"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)pressure
{
  objc_super v2 = [(CAFTirePressure *)self pressureCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)pressureRange
{
  objc_super v2 = [(CAFTirePressure *)self pressureCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (CAFPressureStateCharacteristic)pressureStateCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000001C"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000001C"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFPressureStateCharacteristic *)v11;
}

- (unsigned)pressureState
{
  objc_super v2 = [(CAFTirePressure *)self pressureStateCharacteristic];
  unsigned __int8 v3 = [v2 pressureStateValue];

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFTirePressure *)self vehicleLayoutKeyCharacteristic];
  unsigned __int8 v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001B000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB2D80;
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
  if ([v7 isEqual:@"0x000000003000001A"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTirePressure *)self sensorStateCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "tirePressureService:didUpdateSensorState:", self, -[CAFTirePressure sensorState](self, "sensorState"));
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x000000003000001B"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFTirePressure *)self pressureCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFTirePressure *)self pressure];
      [v12 tirePressureService:self didUpdatePressure:v18];
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x000000003000001C"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFTirePressure *)self pressureStateCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "tirePressureService:didUpdatePressureState:", self, -[CAFTirePressure pressureState](self, "pressureState"));
      goto LABEL_17;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"]) {
    goto LABEL_17;
  }
  v24 = [v6 uniqueIdentifier];
  v25 = [(CAFTirePressure *)self vehicleLayoutKeyCharacteristic];
  v26 = [v25 uniqueIdentifier];
  int v27 = [v24 isEqual:v26];

  if (v27)
  {
    v28 = [(CAFService *)self observers];
    v29 = [(CAFTirePressure *)self vehicleLayoutKey];
    [v28 tirePressureService:self didUpdateVehicleLayoutKey:v29];

    v12 = [(CAFService *)self observers];
    v18 = [(CAFTirePressure *)self name];
    [v12 tirePressureService:self didUpdateName:v18];
    goto LABEL_16;
  }
LABEL_18:
  v30.receiver = self;
  v30.super_class = (Class)CAFTirePressure;
  [(CAFService *)&v30 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForSensorState
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001A"];

  return v10;
}

- (BOOL)registeredForPressure
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001B"];

  return v10;
}

- (BOOL)registeredForPressureState
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001C"];

  return v10;
}

- (BOOL)registeredForVehicleLayoutKey
{
  unsigned __int8 v3 = [(CAFService *)self car];
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