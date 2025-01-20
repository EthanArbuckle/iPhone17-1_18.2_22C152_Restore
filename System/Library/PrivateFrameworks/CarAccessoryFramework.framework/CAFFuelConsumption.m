@interface CAFFuelConsumption
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)fuelEfficiencyInvalid;
- (BOOL)registeredForFuelEfficiency;
- (CAFMeasurementCharacteristic)fuelEfficiencyCharacteristic;
- (CAFUInt32Range)fuelEfficiencyRange;
- (NSMeasurement)fuelEfficiency;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFFuelConsumption

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFuelConsumption;
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
  v6.super_class = (Class)CAFFuelConsumption;
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
  v6.super_class = (Class)CAFFuelConsumption;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)fuelEfficiencyCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000035000013"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000035000013"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)fuelEfficiency
{
  objc_super v2 = [(CAFFuelConsumption *)self fuelEfficiencyCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)fuelEfficiencyRange
{
  objc_super v2 = [(CAFFuelConsumption *)self fuelEfficiencyCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)fuelEfficiencyInvalid
{
  objc_super v2 = [(CAFFuelConsumption *)self fuelEfficiencyCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000014";
}

+ (id)observerProtocol
{
  return &unk_26FDB5CB8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (![v7 isEqual:@"0x0000000035000013"]) {
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  v9 = [(CAFFuelConsumption *)self fuelEfficiencyCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v7 = [(CAFService *)self observers];
    v12 = [(CAFFuelConsumption *)self fuelEfficiency];
    [v7 fuelConsumptionService:self didUpdateFuelEfficiency:v12];

LABEL_4:
  }
  v13.receiver = self;
  v13.super_class = (Class)CAFFuelConsumption;
  [(CAFService *)&v13 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForFuelEfficiency
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000035000013"];

  return v10;
}

@end