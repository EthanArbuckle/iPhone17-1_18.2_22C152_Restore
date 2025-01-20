@interface CAFBatteryLevel
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)batteryLevelInvalid;
- (BOOL)hasBatteryLevelMarkerCriticalLow;
- (BOOL)hasBatteryLevelMarkerLow;
- (BOOL)registeredForBatteryLevel;
- (BOOL)registeredForBatteryLevelMarkerCriticalLow;
- (BOOL)registeredForBatteryLevelMarkerLow;
- (BOOL)registeredForBatteryLevelState;
- (BOOL)registeredForBatteryTargetChargeLevel;
- (CAFBatteryLevelStateCharacteristic)batteryLevelStateCharacteristic;
- (CAFMeasurementCharacteristic)batteryLevelCharacteristic;
- (CAFMeasurementCharacteristic)batteryLevelMarkerCriticalLowCharacteristic;
- (CAFMeasurementCharacteristic)batteryLevelMarkerLowCharacteristic;
- (CAFMeasurementCharacteristic)batteryTargetChargeLevelCharacteristic;
- (CAFUInt8Range)batteryLevelMarkerCriticalLowRange;
- (CAFUInt8Range)batteryLevelMarkerLowRange;
- (CAFUInt8Range)batteryLevelRange;
- (CAFUInt8Range)batteryTargetChargeLevelRange;
- (NSMeasurement)batteryLevel;
- (NSMeasurement)batteryLevelMarkerCriticalLow;
- (NSMeasurement)batteryLevelMarkerLow;
- (NSMeasurement)batteryTargetChargeLevel;
- (unsigned)batteryLevelState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setBatteryTargetChargeLevel:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFBatteryLevel

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFBatteryLevel;
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
  v6.super_class = (Class)CAFBatteryLevel;
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
  v6.super_class = (Class)CAFBatteryLevel;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)batteryLevelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000031"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000031"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)batteryLevel
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt8Range)batteryLevelRange
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

- (BOOL)batteryLevelInvalid
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFBatteryLevelStateCharacteristic)batteryLevelStateCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000035"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000035"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBatteryLevelStateCharacteristic *)v11;
}

- (unsigned)batteryLevelState
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelStateCharacteristic];
  unsigned __int8 v3 = [v2 batteryLevelStateValue];

  return v3;
}

- (CAFMeasurementCharacteristic)batteryLevelMarkerLowCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000004C"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000004C"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)batteryLevelMarkerLow
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerLowCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt8Range)batteryLevelMarkerLowRange
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerLowCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

- (BOOL)hasBatteryLevelMarkerLow
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerLowCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)batteryLevelMarkerCriticalLowCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000004D"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000004D"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)batteryLevelMarkerCriticalLow
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerCriticalLowCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt8Range)batteryLevelMarkerCriticalLowRange
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerCriticalLowCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

- (BOOL)hasBatteryLevelMarkerCriticalLow
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryLevelMarkerCriticalLowCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)batteryTargetChargeLevelCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000040000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000040000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)batteryTargetChargeLevel
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryTargetChargeLevelCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (void)setBatteryTargetChargeLevel:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFBatteryLevel *)self batteryTargetChargeLevelCharacteristic];
  [v5 setMeasurementValue:v4];
}

- (CAFUInt8Range)batteryTargetChargeLevelRange
{
  objc_super v2 = [(CAFBatteryLevel *)self batteryTargetChargeLevelCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000006";
}

+ (id)observerProtocol
{
  return &unk_26FDB4E90;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000031"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFBatteryLevel *)self batteryLevelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryLevel *)self batteryLevel];
      [v12 batteryLevelService:self didUpdateBatteryLevel:v13];
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000035"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFBatteryLevel *)self batteryLevelStateCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "batteryLevelService:didUpdateBatteryLevelState:", self, -[CAFBatteryLevel batteryLevelState](self, "batteryLevelState"));
      goto LABEL_21;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x000000003000004C"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFBatteryLevel *)self batteryLevelMarkerLowCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryLevel *)self batteryLevelMarkerLow];
      [v12 batteryLevelService:self didUpdateBatteryLevelMarkerLow:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x000000003000004D"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFBatteryLevel *)self batteryLevelMarkerCriticalLowCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFBatteryLevel *)self batteryLevelMarkerCriticalLow];
      [v12 batteryLevelService:self didUpdateBatteryLevelMarkerCriticalLow:v13];
      goto LABEL_20;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000040000001"])
  {
LABEL_21:

    goto LABEL_22;
  }
  v29 = [v6 uniqueIdentifier];
  v30 = [(CAFBatteryLevel *)self batteryTargetChargeLevelCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFBatteryLevel *)self batteryTargetChargeLevel];
    [v12 batteryLevelService:self didUpdateBatteryTargetChargeLevel:v13];
    goto LABEL_20;
  }
LABEL_22:
  v33.receiver = self;
  v33.super_class = (Class)CAFBatteryLevel;
  [(CAFService *)&v33 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForBatteryLevel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000031"];

  return v10;
}

- (BOOL)registeredForBatteryLevelState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000035"];

  return v10;
}

- (BOOL)registeredForBatteryLevelMarkerLow
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000004C"];

  return v10;
}

- (BOOL)registeredForBatteryLevelMarkerCriticalLow
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000004D"];

  return v10;
}

- (BOOL)registeredForBatteryTargetChargeLevel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000040000001"];

  return v10;
}

@end