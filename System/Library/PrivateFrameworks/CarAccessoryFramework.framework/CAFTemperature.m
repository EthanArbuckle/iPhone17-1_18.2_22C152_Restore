@interface CAFTemperature
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)currentTemperatureInvalid;
- (BOOL)hasCurrentTemperature;
- (BOOL)registeredForCurrentTemperature;
- (BOOL)registeredForTargetTemperature;
- (BOOL)registeredForVehicleLayoutKey;
- (BOOL)targetTemperatureDisabled;
- (BOOL)targetTemperatureInvalid;
- (BOOL)targetTemperatureRestricted;
- (CAFFloatRange)currentTemperatureRange;
- (CAFFloatRange)targetTemperatureRange;
- (CAFMeasurementCharacteristic)currentTemperatureCharacteristic;
- (CAFMeasurementCharacteristic)targetTemperatureCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (NSMeasurement)currentTemperature;
- (NSMeasurement)targetTemperature;
- (NSString)vehicleLayoutKey;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setTargetTemperature:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTemperature

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTemperature;
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
  v6.super_class = (Class)CAFTemperature;
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
  v6.super_class = (Class)CAFTemperature;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTemperature *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFMeasurementCharacteristic)currentTemperatureCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000019"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000019"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)currentTemperature
{
  objc_super v2 = [(CAFTemperature *)self currentTemperatureCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)currentTemperatureRange
{
  objc_super v2 = [(CAFTemperature *)self currentTemperatureCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)hasCurrentTemperature
{
  objc_super v2 = [(CAFTemperature *)self currentTemperatureCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)currentTemperatureInvalid
{
  objc_super v2 = [(CAFTemperature *)self currentTemperatureCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)targetTemperatureCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000017"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000017"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)targetTemperature
{
  objc_super v2 = [(CAFTemperature *)self targetTemperatureCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (void)setTargetTemperature:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTemperature *)self targetTemperatureCharacteristic];
  [v5 setMeasurementValue:v4];
}

- (CAFFloatRange)targetTemperatureRange
{
  objc_super v2 = [(CAFTemperature *)self targetTemperatureCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)targetTemperatureDisabled
{
  objc_super v2 = [(CAFTemperature *)self targetTemperatureCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)targetTemperatureInvalid
{
  objc_super v2 = [(CAFTemperature *)self targetTemperatureCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)targetTemperatureRestricted
{
  objc_super v2 = [(CAFTemperature *)self targetTemperatureCharacteristic];
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
  objc_super v2 = [(CAFTemperature *)self vehicleLayoutKeyCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB1408;
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
  if ([v7 isEqual:@"0x0000000031000019"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTemperature *)self currentTemperatureCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFTemperature *)self currentTemperature];
      [v12 temperatureService:self didUpdateCurrentTemperature:v13];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000031000017"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFTemperature *)self targetTemperatureCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFTemperature *)self targetTemperature];
      [v12 temperatureService:self didUpdateTargetTemperature:v13];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000065"])
  {
LABEL_13:

    goto LABEL_14;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFTemperature *)self vehicleLayoutKeyCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v23 = [(CAFService *)self observers];
    v24 = [(CAFTemperature *)self vehicleLayoutKey];
    [v23 temperatureService:self didUpdateVehicleLayoutKey:v24];

    v12 = [(CAFService *)self observers];
    v13 = [(CAFTemperature *)self name];
    [v12 temperatureService:self didUpdateName:v13];
    goto LABEL_12;
  }
LABEL_14:
  v25.receiver = self;
  v25.super_class = (Class)CAFTemperature;
  [(CAFService *)&v25 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForCurrentTemperature
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000019"];

  return v10;
}

- (BOOL)registeredForTargetTemperature
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000017"];

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