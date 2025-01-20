@interface CAFTargetSpeed
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasSpeedLimited;
- (BOOL)registeredForSpeedKMH;
- (BOOL)registeredForSpeedLimited;
- (BOOL)registeredForSpeedMPH;
- (BOOL)registeredForTargetSpeedState;
- (BOOL)speedLimited;
- (CAFBoolCharacteristic)speedLimitedCharacteristic;
- (CAFMeasurementCharacteristic)speedKMHCharacteristic;
- (CAFMeasurementCharacteristic)speedMPHCharacteristic;
- (CAFTargetSpeedStateCharacteristic)targetSpeedStateCharacteristic;
- (CAFUInt32Range)speedKMHRange;
- (CAFUInt32Range)speedMPHRange;
- (NSMeasurement)speedKMH;
- (NSMeasurement)speedMPH;
- (unsigned)targetSpeedState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTargetSpeed

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTargetSpeed;
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
  v6.super_class = (Class)CAFTargetSpeed;
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
  v6.super_class = (Class)CAFTargetSpeed;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFTargetSpeedStateCharacteristic)targetSpeedStateCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000045000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000045000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTargetSpeedStateCharacteristic *)v11;
}

- (unsigned)targetSpeedState
{
  objc_super v2 = [(CAFTargetSpeed *)self targetSpeedStateCharacteristic];
  unsigned __int8 v3 = [v2 targetSpeedStateValue];

  return v3;
}

- (CAFMeasurementCharacteristic)speedKMHCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000046"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000046"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedKMH
{
  objc_super v2 = [(CAFTargetSpeed *)self speedKMHCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedKMHRange
{
  objc_super v2 = [(CAFTargetSpeed *)self speedKMHCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (CAFMeasurementCharacteristic)speedMPHCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000047"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000047"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedMPH
{
  objc_super v2 = [(CAFTargetSpeed *)self speedMPHCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMPHRange
{
  objc_super v2 = [(CAFTargetSpeed *)self speedMPHCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (CAFBoolCharacteristic)speedLimitedCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000004500001C"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000004500001C"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)speedLimited
{
  objc_super v2 = [(CAFTargetSpeed *)self speedLimitedCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasSpeedLimited
{
  objc_super v2 = [(CAFTargetSpeed *)self speedLimitedCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001E000004";
}

+ (id)observerProtocol
{
  return &unk_26FDB25E0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000045000005"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTargetSpeed *)self targetSpeedStateCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "targetSpeedService:didUpdateTargetSpeedState:", self, -[CAFTargetSpeed targetSpeedState](self, "targetSpeedState"));
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000030000046"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFTargetSpeed *)self speedKMHCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFTargetSpeed *)self speedKMH];
      [v12 targetSpeedService:self didUpdateSpeedKMH:v18];
LABEL_12:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000047"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFTargetSpeed *)self speedMPHCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFTargetSpeed *)self speedMPH];
      [v12 targetSpeedService:self didUpdateSpeedMPH:v18];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000004500001C"]) {
    goto LABEL_17;
  }
  v24 = [v6 uniqueIdentifier];
  v25 = [(CAFTargetSpeed *)self speedLimitedCharacteristic];
  v26 = [v25 uniqueIdentifier];
  int v27 = [v24 isEqual:v26];

  if (v27)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "targetSpeedService:didUpdateSpeedLimited:", self, -[CAFTargetSpeed speedLimited](self, "speedLimited"));
    goto LABEL_17;
  }
LABEL_18:
  v28.receiver = self;
  v28.super_class = (Class)CAFTargetSpeed;
  [(CAFService *)&v28 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTargetSpeedState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000045000005"];

  return v10;
}

- (BOOL)registeredForSpeedKMH
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000046"];

  return v10;
}

- (BOOL)registeredForSpeedMPH
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000047"];

  return v10;
}

- (BOOL)registeredForSpeedLimited
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000004500001C"];

  return v10;
}

@end