@interface CAFExteriorConditions
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)aqiInvalid;
- (BOOL)hasAqi;
- (BOOL)registeredForAQI;
- (BOOL)registeredForTemperature;
- (BOOL)temperatureInvalid;
- (CAFFloatRange)aqiRange;
- (CAFFloatRange)temperatureRange;
- (CAFMeasurementCharacteristic)aqiCharacteristic;
- (CAFMeasurementCharacteristic)temperatureCharacteristic;
- (NSMeasurement)aqi;
- (NSMeasurement)temperature;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFExteriorConditions

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFExteriorConditions;
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
  v6.super_class = (Class)CAFExteriorConditions;
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
  v6.super_class = (Class)CAFExteriorConditions;
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
  objc_super v2 = [(CAFExteriorConditions *)self temperatureCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureRange
{
  objc_super v2 = [(CAFExteriorConditions *)self temperatureCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)temperatureInvalid
{
  objc_super v2 = [(CAFExteriorConditions *)self temperatureCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)aqiCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000010"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000010"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)aqi
{
  objc_super v2 = [(CAFExteriorConditions *)self aqiCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)aqiRange
{
  objc_super v2 = [(CAFExteriorConditions *)self aqiCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)hasAqi
{
  objc_super v2 = [(CAFExteriorConditions *)self aqiCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)aqiInvalid
{
  objc_super v2 = [(CAFExteriorConditions *)self aqiCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000009";
}

+ (id)observerProtocol
{
  return &unk_26FDB4398;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x000000003000001D"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFExteriorConditions *)self temperatureCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFExteriorConditions *)self temperature];
      [v12 exteriorConditionsService:self didUpdateTemperature:v13];
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000031000010"])
  {
LABEL_9:

    goto LABEL_10;
  }
  v14 = [v6 uniqueIdentifier];
  v15 = [(CAFExteriorConditions *)self aqiCharacteristic];
  v16 = [v15 uniqueIdentifier];
  int v17 = [v14 isEqual:v16];

  if (v17)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFExteriorConditions *)self aqi];
    [v12 exteriorConditionsService:self didUpdateAqi:v13];
    goto LABEL_8;
  }
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)CAFExteriorConditions;
  [(CAFService *)&v18 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTemperature
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000001D"];

  return v10;
}

- (BOOL)registeredForAQI
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000010"];

  return v10;
}

@end