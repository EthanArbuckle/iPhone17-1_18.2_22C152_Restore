@interface CAFSpeedDisplay
+ (void)load;
- (BOOL)registeredForSpeed;
- (BOOL)registeredForSpeedKMH;
- (BOOL)registeredForSpeedMPH;
- (BOOL)speedInvalid;
- (BOOL)speedKMHInvalid;
- (BOOL)speedMPHInvalid;
- (CAFMeasurementCharacteristic)speedCharacteristic;
- (CAFMeasurementCharacteristic)speedKMHCharacteristic;
- (CAFMeasurementCharacteristic)speedMPHCharacteristic;
- (CAFUInt32Range)speedKMHRange;
- (CAFUInt32Range)speedMPHRange;
- (CAFUInt32Range)speedRange;
- (NSMeasurement)speed;
- (NSMeasurement)speedKMH;
- (NSMeasurement)speedMPH;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSpeedDisplay

+ (void)load
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___CAFSpeedDisplay;
    objc_msgSendSuper2(&v4, sel_load);
  }
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
  v6.super_class = (Class)CAFSpeedDisplay;
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
  v6.super_class = (Class)CAFSpeedDisplay;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)speedCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000021"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000021"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speed
{
  v2 = [(CAFSpeedDisplay *)self speedCharacteristic];
  uint64_t v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedRange
{
  v2 = [(CAFSpeedDisplay *)self speedCharacteristic];
  uint64_t v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)speedInvalid
{
  v2 = [(CAFSpeedDisplay *)self speedCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)speedKMHCharacteristic
{
  char v3 = [(CAFService *)self car];
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
  v2 = [(CAFSpeedDisplay *)self speedKMHCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedKMHRange
{
  v2 = [(CAFSpeedDisplay *)self speedKMHCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)speedKMHInvalid
{
  v2 = [(CAFSpeedDisplay *)self speedKMHCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)speedMPHCharacteristic
{
  char v3 = [(CAFService *)self car];
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
  v2 = [(CAFSpeedDisplay *)self speedMPHCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMPHRange
{
  v2 = [(CAFSpeedDisplay *)self speedMPHCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)speedMPHInvalid
{
  v2 = [(CAFSpeedDisplay *)self speedMPHCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000021"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFSpeedDisplay *)self speedCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSpeedDisplay *)self speed];
      [v12 speedDisplayService:self didUpdateSpeed:v13];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000046"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFSpeedDisplay *)self speedKMHCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSpeedDisplay *)self speedKMH];
      [v12 speedDisplayService:self didUpdateSpeedKMH:v13];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000047"])
  {
LABEL_13:

    goto LABEL_14;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFSpeedDisplay *)self speedMPHCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFSpeedDisplay *)self speedMPH];
    [v12 speedDisplayService:self didUpdateSpeedMPH:v13];
    goto LABEL_12;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFSpeedDisplay;
  [(CAFService *)&v23 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForSpeed
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000021"];

  return v10;
}

- (BOOL)registeredForSpeedKMH
{
  char v3 = [(CAFService *)self car];
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
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000047"];

  return v10;
}

@end