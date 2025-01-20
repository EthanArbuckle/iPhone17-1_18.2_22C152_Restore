@interface CAFChargingRate
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)chargingSpeedInvalid;
- (BOOL)hasChargingSpeed;
- (BOOL)powerInvalid;
- (BOOL)registeredForChargingSpeed;
- (BOOL)registeredForPower;
- (CAFInt32Range)chargingSpeedRange;
- (CAFInt32Range)powerRange;
- (CAFMeasurementCharacteristic)chargingSpeedCharacteristic;
- (CAFMeasurementCharacteristic)powerCharacteristic;
- (NSMeasurement)chargingSpeed;
- (NSMeasurement)power;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFChargingRate

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFChargingRate;
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
  v6.super_class = (Class)CAFChargingRate;
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
  v6.super_class = (Class)CAFChargingRate;
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
  objc_super v2 = [(CAFChargingRate *)self powerCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)powerRange
{
  objc_super v2 = [(CAFChargingRate *)self powerCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)powerInvalid
{
  objc_super v2 = [(CAFChargingRate *)self powerCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)chargingSpeedCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000004000000A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000004000000A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)chargingSpeed
{
  objc_super v2 = [(CAFChargingRate *)self chargingSpeedCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)chargingSpeedRange
{
  objc_super v2 = [(CAFChargingRate *)self chargingSpeedCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)hasChargingSpeed
{
  objc_super v2 = [(CAFChargingRate *)self chargingSpeedCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)chargingSpeedInvalid
{
  objc_super v2 = [(CAFChargingRate *)self chargingSpeedCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000019000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB0FE0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000028"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFChargingRate *)self powerCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFChargingRate *)self power];
      [v12 chargingRateService:self didUpdatePower:v13];
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000004000000A"])
  {
LABEL_9:

    goto LABEL_10;
  }
  v14 = [v6 uniqueIdentifier];
  v15 = [(CAFChargingRate *)self chargingSpeedCharacteristic];
  v16 = [v15 uniqueIdentifier];
  int v17 = [v14 isEqual:v16];

  if (v17)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFChargingRate *)self chargingSpeed];
    [v12 chargingRateService:self didUpdateChargingSpeed:v13];
    goto LABEL_8;
  }
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)CAFChargingRate;
  [(CAFService *)&v18 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForPower
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000028"];

  return v10;
}

- (BOOL)registeredForChargingSpeed
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000004000000A"];

  return v10;
}

@end