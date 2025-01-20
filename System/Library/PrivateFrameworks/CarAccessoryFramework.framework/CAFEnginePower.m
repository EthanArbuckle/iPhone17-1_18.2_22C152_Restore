@interface CAFEnginePower
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasPowerMarkerAvailableMax;
- (BOOL)hasPowerMarkerAvailableMin;
- (BOOL)powerInvalid;
- (BOOL)registeredForPower;
- (BOOL)registeredForPowerMarkerAvailableMax;
- (BOOL)registeredForPowerMarkerAvailableMin;
- (BOOL)registeredForPowerMax;
- (BOOL)registeredForPowerMin;
- (CAFInt32Range)powerMarkerAvailableMaxRange;
- (CAFInt32Range)powerMarkerAvailableMinRange;
- (CAFInt32Range)powerMaxRange;
- (CAFInt32Range)powerMinRange;
- (CAFInt32Range)powerRange;
- (CAFMeasurementCharacteristic)powerCharacteristic;
- (CAFMeasurementCharacteristic)powerMarkerAvailableMaxCharacteristic;
- (CAFMeasurementCharacteristic)powerMarkerAvailableMinCharacteristic;
- (CAFMeasurementCharacteristic)powerMaxCharacteristic;
- (CAFMeasurementCharacteristic)powerMinCharacteristic;
- (NSMeasurement)power;
- (NSMeasurement)powerMarkerAvailableMax;
- (NSMeasurement)powerMarkerAvailableMin;
- (NSMeasurement)powerMax;
- (NSMeasurement)powerMin;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFEnginePower

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEnginePower;
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
  v6.super_class = (Class)CAFEnginePower;
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
  v6.super_class = (Class)CAFEnginePower;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)powerCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000028"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000028"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)power
{
  objc_super v2 = [(CAFEnginePower *)self powerCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerRange
{
  objc_super v2 = [(CAFEnginePower *)self powerCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)powerInvalid
{
  objc_super v2 = [(CAFEnginePower *)self powerCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)powerMinCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000050"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000050"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)powerMin
{
  objc_super v2 = [(CAFEnginePower *)self powerMinCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerMinRange
{
  objc_super v2 = [(CAFEnginePower *)self powerMinCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (CAFMeasurementCharacteristic)powerMaxCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000051"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000051"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)powerMax
{
  objc_super v2 = [(CAFEnginePower *)self powerMaxCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerMaxRange
{
  objc_super v2 = [(CAFEnginePower *)self powerMaxCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (CAFMeasurementCharacteristic)powerMarkerAvailableMinCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000052"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000052"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)powerMarkerAvailableMin
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMinCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerMarkerAvailableMinRange
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMinCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)hasPowerMarkerAvailableMin
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMinCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)powerMarkerAvailableMaxCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000053"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000053"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)powerMarkerAvailableMax
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMaxCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerMarkerAvailableMaxRange
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMaxCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)hasPowerMarkerAvailableMax
{
  objc_super v2 = [(CAFEnginePower *)self powerMarkerAvailableMaxCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A00000D";
}

+ (id)observerProtocol
{
  return &unk_26FDB3A80;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000028"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFEnginePower *)self powerCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEnginePower *)self power];
      [v12 enginePowerService:self didUpdatePower:v13];
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000050"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFEnginePower *)self powerMinCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEnginePower *)self powerMin];
      [v12 enginePowerService:self didUpdatePowerMin:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000051"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFEnginePower *)self powerMaxCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEnginePower *)self powerMax];
      [v12 enginePowerService:self didUpdatePowerMax:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000030000052"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFEnginePower *)self powerMarkerAvailableMinCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEnginePower *)self powerMarkerAvailableMin];
      [v12 enginePowerService:self didUpdatePowerMarkerAvailableMin:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000053"])
  {
LABEL_21:

    goto LABEL_22;
  }
  v29 = [v6 uniqueIdentifier];
  v30 = [(CAFEnginePower *)self powerMarkerAvailableMaxCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFEnginePower *)self powerMarkerAvailableMax];
    [v12 enginePowerService:self didUpdatePowerMarkerAvailableMax:v13];
    goto LABEL_20;
  }
LABEL_22:
  v33.receiver = self;
  v33.super_class = (Class)CAFEnginePower;
  [(CAFService *)&v33 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForPower
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000028"];

  return v10;
}

- (BOOL)registeredForPowerMin
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000050"];

  return v10;
}

- (BOOL)registeredForPowerMax
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000051"];

  return v10;
}

- (BOOL)registeredForPowerMarkerAvailableMin
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000052"];

  return v10;
}

- (BOOL)registeredForPowerMarkerAvailableMax
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000053"];

  return v10;
}

@end