@interface CAFFuelLevel
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)fuelLevelInvalid;
- (BOOL)hasFuelLevelMarkerLow;
- (BOOL)registeredForFillLevelLabel;
- (BOOL)registeredForFuelLevel;
- (BOOL)registeredForFuelLevelMarkerLow;
- (BOOL)registeredForFuelLevelState;
- (BOOL)registeredForPortSideIndicator;
- (CAFFillLevelLabelCharacteristic)fillLevelLabelCharacteristic;
- (CAFFuelLevelStateCharacteristic)fuelLevelStateCharacteristic;
- (CAFMeasurementCharacteristic)fuelLevelCharacteristic;
- (CAFMeasurementCharacteristic)fuelLevelMarkerLowCharacteristic;
- (CAFPortSideIndicatorCharacteristic)portSideIndicatorCharacteristic;
- (CAFUInt8Range)fuelLevelMarkerLowRange;
- (CAFUInt8Range)fuelLevelRange;
- (NSMeasurement)fuelLevel;
- (NSMeasurement)fuelLevelMarkerLow;
- (unsigned)fillLevelLabel;
- (unsigned)fuelLevelState;
- (unsigned)portSideIndicator;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFFuelLevel

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFuelLevel;
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
  v6.super_class = (Class)CAFFuelLevel;
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
  v6.super_class = (Class)CAFFuelLevel;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)fuelLevelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)fuelLevel
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt8Range)fuelLevelRange
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

- (BOOL)fuelLevelInvalid
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFFuelLevelStateCharacteristic)fuelLevelStateCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000017"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000017"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFFuelLevelStateCharacteristic *)v11;
}

- (unsigned)fuelLevelState
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelStateCharacteristic];
  unsigned __int8 v3 = [v2 fuelLevelStateValue];

  return v3;
}

- (CAFMeasurementCharacteristic)fuelLevelMarkerLowCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000004100001A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000004100001A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)fuelLevelMarkerLow
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelMarkerLowCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt8Range)fuelLevelMarkerLowRange
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelMarkerLowCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt8Range];

  return (CAFUInt8Range *)v4;
}

- (BOOL)hasFuelLevelMarkerLow
{
  objc_super v2 = [(CAFFuelLevel *)self fuelLevelMarkerLowCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFFillLevelLabelCharacteristic)fillLevelLabelCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFFillLevelLabelCharacteristic *)v11;
}

- (unsigned)fillLevelLabel
{
  objc_super v2 = [(CAFFuelLevel *)self fillLevelLabelCharacteristic];
  unsigned __int8 v3 = [v2 fillLevelLabelValue];

  return v3;
}

- (CAFPortSideIndicatorCharacteristic)portSideIndicatorCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000013"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000013"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFPortSideIndicatorCharacteristic *)v11;
}

- (unsigned)portSideIndicator
{
  objc_super v2 = [(CAFFuelLevel *)self portSideIndicatorCharacteristic];
  unsigned __int8 v3 = [v2 portSideIndicatorValue];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000005";
}

+ (id)observerProtocol
{
  return &unk_26FDB0DE0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000041000002"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFFuelLevel *)self fuelLevelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFFuelLevel *)self fuelLevel];
      [v12 fuelLevelService:self didUpdateFuelLevel:v13];
LABEL_12:

      goto LABEL_21;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000041000017"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFFuelLevel *)self fuelLevelStateCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "fuelLevelService:didUpdateFuelLevelState:", self, -[CAFFuelLevel fuelLevelState](self, "fuelLevelState"));
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x000000004100001A"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFFuelLevel *)self fuelLevelMarkerLowCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFFuelLevel *)self fuelLevelMarkerLow];
      [v12 fuelLevelService:self didUpdateFuelLevelMarkerLow:v13];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000046000007"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFFuelLevel *)self fillLevelLabelCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "fuelLevelService:didUpdateFillLevelLabel:", self, -[CAFFuelLevel fillLevelLabel](self, "fillLevelLabel"));
      goto LABEL_21;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000041000013"]) {
    goto LABEL_21;
  }
  v29 = [v6 uniqueIdentifier];
  v30 = [(CAFFuelLevel *)self portSideIndicatorCharacteristic];
  v31 = [v30 uniqueIdentifier];
  int v32 = [v29 isEqual:v31];

  if (v32)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "fuelLevelService:didUpdatePortSideIndicator:", self, -[CAFFuelLevel portSideIndicator](self, "portSideIndicator"));
    goto LABEL_21;
  }
LABEL_22:
  v33.receiver = self;
  v33.super_class = (Class)CAFFuelLevel;
  [(CAFService *)&v33 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForFuelLevel
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000002"];

  return v10;
}

- (BOOL)registeredForFuelLevelState
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000017"];

  return v10;
}

- (BOOL)registeredForFuelLevelMarkerLow
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000004100001A"];

  return v10;
}

- (BOOL)registeredForFillLevelLabel
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000007"];

  return v10;
}

- (BOOL)registeredForPortSideIndicator
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000013"];

  return v10;
}

@end