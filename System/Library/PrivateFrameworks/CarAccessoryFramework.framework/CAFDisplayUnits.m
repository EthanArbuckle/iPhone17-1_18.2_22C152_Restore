@interface CAFDisplayUnits
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForDistanceUnit;
- (BOOL)registeredForSpeedUnit;
- (BOOL)registeredForTemperatureUnit;
- (CAFUnitTypeCharacteristic)distanceUnitRawValueCharacteristic;
- (CAFUnitTypeCharacteristic)speedUnitRawValueCharacteristic;
- (CAFUnitTypeCharacteristic)temperatureUnitRawValueCharacteristic;
- (NSUnitLength)distanceUnit;
- (NSUnitSpeed)speedUnit;
- (NSUnitTemperature)temperatureUnit;
- (unsigned)distanceUnitRawValue;
- (unsigned)speedUnitRawValue;
- (unsigned)temperatureUnitRawValue;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDisplayUnits

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDisplayUnits;
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
  v6.super_class = (Class)CAFDisplayUnits;
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
  v6.super_class = (Class)CAFDisplayUnits;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFUnitTypeCharacteristic)speedUnitRawValueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)speedUnitRawValue
{
  objc_super v2 = [(CAFDisplayUnits *)self speedUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (NSUnitSpeed)speedUnit
{
  objc_opt_class();
  unsigned __int16 v3 = [(CAFDisplayUnits *)self speedUnitRawValueCharacteristic];
  id v4 = [v3 unitValue];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSUnitSpeed *)v5;
}

- (CAFUnitTypeCharacteristic)distanceUnitRawValueCharacteristic
{
  unsigned __int16 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)distanceUnitRawValue
{
  objc_super v2 = [(CAFDisplayUnits *)self distanceUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (NSUnitLength)distanceUnit
{
  objc_opt_class();
  unsigned __int16 v3 = [(CAFDisplayUnits *)self distanceUnitRawValueCharacteristic];
  id v4 = [v3 unitValue];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSUnitLength *)v5;
}

- (CAFUnitTypeCharacteristic)temperatureUnitRawValueCharacteristic
{
  unsigned __int16 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000046000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000046000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)temperatureUnitRawValue
{
  objc_super v2 = [(CAFDisplayUnits *)self temperatureUnitRawValueCharacteristic];
  unsigned __int16 v3 = [v2 unitTypeValue];

  return v3;
}

- (NSUnitTemperature)temperatureUnit
{
  objc_opt_class();
  unsigned __int16 v3 = [(CAFDisplayUnits *)self temperatureUnitRawValueCharacteristic];
  id v4 = [v3 unitValue];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSUnitTemperature *)v5;
}

+ (id)serviceIdentifier
{
  return @"0x000000001F000008";
}

+ (id)observerProtocol
{
  return &unk_26FDB41D8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000046000001"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFDisplayUnits *)self speedUnitRawValueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "displayUnitsService:didUpdateSpeedUnitRawValue:", self, -[CAFDisplayUnits speedUnitRawValue](self, "speedUnitRawValue"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000046000004"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFDisplayUnits *)self distanceUnitRawValueCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "displayUnitsService:didUpdateDistanceUnitRawValue:", self, -[CAFDisplayUnits distanceUnitRawValue](self, "distanceUnitRawValue"));
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000046000005"]) {
    goto LABEL_12;
  }
  v18 = [v6 uniqueIdentifier];
  v19 = [(CAFDisplayUnits *)self temperatureUnitRawValueCharacteristic];
  v20 = [v19 uniqueIdentifier];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "displayUnitsService:didUpdateTemperatureUnitRawValue:", self, -[CAFDisplayUnits temperatureUnitRawValue](self, "temperatureUnitRawValue"));
    goto LABEL_12;
  }
LABEL_13:
  v22.receiver = self;
  v22.super_class = (Class)CAFDisplayUnits;
  [(CAFService *)&v22 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForSpeedUnit
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000001"];

  return v10;
}

- (BOOL)registeredForDistanceUnit
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000004"];

  return v10;
}

- (BOOL)registeredForTemperatureUnit
{
  unsigned __int16 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000046000005"];

  return v10;
}

@end