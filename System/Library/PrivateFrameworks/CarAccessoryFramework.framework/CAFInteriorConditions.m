@interface CAFInteriorConditions
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)aqiInvalid;
- (BOOL)hasAqi;
- (BOOL)registeredForAQI;
- (CAFFloatRange)aqiRange;
- (CAFMeasurementCharacteristic)aqiCharacteristic;
- (NSMeasurement)aqi;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFInteriorConditions

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFInteriorConditions;
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
  v6.super_class = (Class)CAFInteriorConditions;
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
  v6.super_class = (Class)CAFInteriorConditions;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)aqiCharacteristic
{
  v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFInteriorConditions *)self aqiCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)aqiRange
{
  objc_super v2 = [(CAFInteriorConditions *)self aqiCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 floatRange];

  return (CAFFloatRange *)v4;
}

- (BOOL)hasAqi
{
  objc_super v2 = [(CAFInteriorConditions *)self aqiCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)aqiInvalid
{
  objc_super v2 = [(CAFInteriorConditions *)self aqiCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000013";
}

+ (id)observerProtocol
{
  return &unk_26FDB4B90;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (![v7 isEqual:@"0x0000000031000010"]) {
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  v9 = [(CAFInteriorConditions *)self aqiCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v7 = [(CAFService *)self observers];
    v12 = [(CAFInteriorConditions *)self aqi];
    [v7 interiorConditionsService:self didUpdateAqi:v12];

LABEL_4:
  }
  v13.receiver = self;
  v13.super_class = (Class)CAFInteriorConditions;
  [(CAFService *)&v13 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
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