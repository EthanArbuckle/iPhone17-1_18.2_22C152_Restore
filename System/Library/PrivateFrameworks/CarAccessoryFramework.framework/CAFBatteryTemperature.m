@interface CAFBatteryTemperature
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasTemperatureMarkerCold;
- (BOOL)hasTemperatureMarkerHot;
- (BOOL)registeredForTemperature;
- (BOOL)registeredForTemperatureMarkerCold;
- (BOOL)registeredForTemperatureMarkerHot;
- (BOOL)registeredForTemperatureMax;
- (BOOL)registeredForTemperatureMin;
- (BOOL)registeredForTemperatureState;
- (BOOL)temperatureInvalid;
- (CAFFloatRange)temperatureMarkerColdRange;
- (CAFFloatRange)temperatureMarkerHotRange;
- (CAFFloatRange)temperatureMaxRange;
- (CAFFloatRange)temperatureMinRange;
- (CAFFloatRange)temperatureRange;
- (CAFMeasurementCharacteristic)temperatureCharacteristic;
- (CAFMeasurementCharacteristic)temperatureMarkerColdCharacteristic;
- (CAFMeasurementCharacteristic)temperatureMarkerHotCharacteristic;
- (CAFMeasurementCharacteristic)temperatureMaxCharacteristic;
- (CAFMeasurementCharacteristic)temperatureMinCharacteristic;
- (CAFTemperatureStateCharacteristic)temperatureStateCharacteristic;
- (NSMeasurement)temperature;
- (NSMeasurement)temperatureMarkerCold;
- (NSMeasurement)temperatureMarkerHot;
- (NSMeasurement)temperatureMax;
- (NSMeasurement)temperatureMin;
- (unsigned)temperatureState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFBatteryTemperature

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFBatteryTemperature;
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
  v6.super_class = (Class)CAFBatteryTemperature;
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
  v6.super_class = (Class)CAFBatteryTemperature;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)temperatureCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000001D"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000001D"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperature
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureRange
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)temperatureInvalid
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFTemperatureStateCharacteristic)temperatureStateCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000001E"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000001E"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTemperatureStateCharacteristic *)v11;
}

- (unsigned)temperatureState
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureStateCharacteristic];
  unsigned __int8 v3 = [v2 temperatureStateValue];

  return v3;
}

- (CAFMeasurementCharacteristic)temperatureMinCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000054"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000054"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMin
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMinCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMinRange
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMinCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (CAFMeasurementCharacteristic)temperatureMaxCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000055"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000055"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMax
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMaxCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMaxRange
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMaxCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (CAFMeasurementCharacteristic)temperatureMarkerColdCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000056"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000056"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMarkerCold
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerColdCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMarkerColdRange
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerColdCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)hasTemperatureMarkerCold
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerColdCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)temperatureMarkerHotCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000057"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000057"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMarkerHot
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerHotCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMarkerHotRange
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerHotCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)hasTemperatureMarkerHot
{
  objc_super v2 = [(CAFBatteryTemperature *)self temperatureMarkerHotCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000011";
}

+ (id)observerProtocol
{
  return &unk_26FDB3850;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x000000003000001D"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFBatteryTemperature *)self temperatureCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryTemperature *)self temperature];
      [v12 batteryTemperatureService:self didUpdateTemperature:v13];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x000000003000001E"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFBatteryTemperature *)self temperatureStateCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureState:", self, -[CAFBatteryTemperature temperatureState](self, "temperatureState"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000054"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFBatteryTemperature *)self temperatureMinCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryTemperature *)self temperatureMin];
      [v12 batteryTemperatureService:self didUpdateTemperatureMin:v13];
      goto LABEL_24;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000030000055"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFBatteryTemperature *)self temperatureMaxCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryTemperature *)self temperatureMax];
      [v12 batteryTemperatureService:self didUpdateTemperatureMax:v13];
      goto LABEL_24;
    }
  }
  else
  {
  }
  v29 = [v6 characteristicType];
  if ([v29 isEqual:@"0x0000000030000056"])
  {
    v30 = [v6 uniqueIdentifier];
    v31 = [(CAFBatteryTemperature *)self temperatureMarkerColdCharacteristic];
    v32 = [v31 uniqueIdentifier];
    int v33 = [v30 isEqual:v32];

    if (v33)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryTemperature *)self temperatureMarkerCold];
      [v12 batteryTemperatureService:self didUpdateTemperatureMarkerCold:v13];
      goto LABEL_24;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000057"])
  {
LABEL_25:

    goto LABEL_26;
  }
  v34 = [v6 uniqueIdentifier];
  v35 = [(CAFBatteryTemperature *)self temperatureMarkerHotCharacteristic];
  v36 = [v35 uniqueIdentifier];
  int v37 = [v34 isEqual:v36];

  if (v37)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFBatteryTemperature *)self temperatureMarkerHot];
    [v12 batteryTemperatureService:self didUpdateTemperatureMarkerHot:v13];
    goto LABEL_24;
  }
LABEL_26:
  v38.receiver = self;
  v38.super_class = (Class)CAFBatteryTemperature;
  [(CAFService *)&v38 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTemperature
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001D"];

  return v10;
}

- (BOOL)registeredForTemperatureState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001E"];

  return v10;
}

- (BOOL)registeredForTemperatureMin
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000054"];

  return v10;
}

- (BOOL)registeredForTemperatureMax
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000055"];

  return v10;
}

- (BOOL)registeredForTemperatureMarkerCold
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000056"];

  return v10;
}

- (BOOL)registeredForTemperatureMarkerHot
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000057"];

  return v10;
}

@end