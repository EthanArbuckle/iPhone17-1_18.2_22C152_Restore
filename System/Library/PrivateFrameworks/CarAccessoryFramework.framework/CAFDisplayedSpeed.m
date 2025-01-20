@interface CAFDisplayedSpeed
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasShowSecondarySpeed;
- (BOOL)registeredForShowSecondarySpeed;
- (BOOL)registeredForSpeedMaxKMH;
- (BOOL)registeredForSpeedMaxMPH;
- (BOOL)showSecondarySpeed;
- (CAFBoolCharacteristic)showSecondarySpeedCharacteristic;
- (CAFMeasurementCharacteristic)speedMaxKMHCharacteristic;
- (CAFMeasurementCharacteristic)speedMaxMPHCharacteristic;
- (CAFUInt32Range)speedMaxKMHRange;
- (CAFUInt32Range)speedMaxMPHRange;
- (NSMeasurement)speedMaxKMH;
- (NSMeasurement)speedMaxMPH;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDisplayedSpeed

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDisplayedSpeed;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDAC9E0]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDisplayedSpeed;
  [(CAFSpeedDisplay *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDAC9E0]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDisplayedSpeed;
  [(CAFSpeedDisplay *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)speedMaxKMHCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000048"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000048"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedMaxKMH
{
  objc_super v2 = [(CAFDisplayedSpeed *)self speedMaxKMHCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMaxKMHRange
{
  objc_super v2 = [(CAFDisplayedSpeed *)self speedMaxKMHCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (CAFMeasurementCharacteristic)speedMaxMPHCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000049"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000049"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedMaxMPH
{
  objc_super v2 = [(CAFDisplayedSpeed *)self speedMaxMPHCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMaxMPHRange
{
  objc_super v2 = [(CAFDisplayedSpeed *)self speedMaxMPHCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (CAFBoolCharacteristic)showSecondarySpeedCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)showSecondarySpeed
{
  objc_super v2 = [(CAFDisplayedSpeed *)self showSecondarySpeedCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasShowSecondarySpeed
{
  objc_super v2 = [(CAFDisplayedSpeed *)self showSecondarySpeedCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000009";
}

+ (id)observerProtocol
{
  return &unk_26FDB45F8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000048"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFDisplayedSpeed *)self speedMaxKMHCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFDisplayedSpeed *)self speedMaxKMH];
      [v12 displayedSpeedService:self didUpdateSpeedMaxKMH:v13];
LABEL_8:

LABEL_13:
      goto LABEL_14;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000049"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFDisplayedSpeed *)self speedMaxMPHCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFDisplayedSpeed *)self speedMaxMPH];
      [v12 displayedSpeedService:self didUpdateSpeedMaxMPH:v13];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000046000002"]) {
    goto LABEL_13;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFDisplayedSpeed *)self showSecondarySpeedCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "displayedSpeedService:didUpdateShowSecondarySpeed:", self, -[CAFDisplayedSpeed showSecondarySpeed](self, "showSecondarySpeed"));
    goto LABEL_13;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFDisplayedSpeed;
  [(CAFSpeedDisplay *)&v23 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForSpeedMaxKMH
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000048"];

  return v10;
}

- (BOOL)registeredForSpeedMaxMPH
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000049"];

  return v10;
}

- (BOOL)registeredForShowSecondarySpeed
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000002"];

  return v10;
}

@end