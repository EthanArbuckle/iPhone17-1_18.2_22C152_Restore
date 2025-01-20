@interface CAFTrip
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)averageSpeedInvalid;
- (BOOL)distanceInvalid;
- (BOOL)durationInvalid;
- (BOOL)energyEfficiencyInvalid;
- (BOOL)energyInvalid;
- (BOOL)fuelEfficiencyInvalid;
- (BOOL)hasAverageSpeed;
- (BOOL)hasDistance;
- (BOOL)hasDuration;
- (BOOL)hasEnergy;
- (BOOL)hasEnergyEfficiency;
- (BOOL)hasFuelEfficiency;
- (BOOL)hasReset;
- (BOOL)hasShowOdometer;
- (BOOL)hasUserVisibleLabel;
- (BOOL)registeredForAverageSpeed;
- (BOOL)registeredForDistance;
- (BOOL)registeredForDuration;
- (BOOL)registeredForEnergy;
- (BOOL)registeredForEnergyEfficiency;
- (BOOL)registeredForFuelEfficiency;
- (BOOL)registeredForReset;
- (BOOL)registeredForShowOdometer;
- (BOOL)registeredForSortOrder;
- (BOOL)registeredForUserVisibleLabel;
- (BOOL)showOdometer;
- (CAFBoolCharacteristic)showOdometerCharacteristic;
- (CAFInt32Range)energyEfficiencyRange;
- (CAFInt32Range)energyRange;
- (CAFMeasurementCharacteristic)averageSpeedCharacteristic;
- (CAFMeasurementCharacteristic)distanceCharacteristic;
- (CAFMeasurementCharacteristic)durationCharacteristic;
- (CAFMeasurementCharacteristic)energyCharacteristic;
- (CAFMeasurementCharacteristic)energyEfficiencyCharacteristic;
- (CAFMeasurementCharacteristic)fuelEfficiencyCharacteristic;
- (CAFResetControl)resetControl;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFUInt32Range)averageSpeedRange;
- (CAFUInt32Range)fuelEfficiencyRange;
- (CAFUInt64Range)distanceRange;
- (CAFUInt64Range)durationRange;
- (CAFUInt8Characteristic)sortOrderCharacteristic;
- (NSMeasurement)averageSpeed;
- (NSMeasurement)distance;
- (NSMeasurement)duration;
- (NSMeasurement)energy;
- (NSMeasurement)energyEfficiency;
- (NSMeasurement)fuelEfficiency;
- (NSString)userVisibleLabel;
- (id)name;
- (unsigned)sortOrder;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)resetWithCompletion:(id)a3;
- (void)setShowOdometer:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTrip

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTrip;
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
  v6.super_class = (Class)CAFTrip;
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
  v6.super_class = (Class)CAFTrip;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFTrip *)self sortOrderCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFTrip *)self userVisibleLabelCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleLabel
{
  objc_super v2 = [(CAFTrip *)self userVisibleLabelCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleLabel
{
  objc_super v2 = [(CAFTrip *)self userVisibleLabelCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)sortOrderCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)sortOrder
{
  objc_super v2 = [(CAFTrip *)self sortOrderCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (CAFMeasurementCharacteristic)averageSpeedCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000045"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000045"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)averageSpeed
{
  objc_super v2 = [(CAFTrip *)self averageSpeedCharacteristic];
  unsigned __int8 v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)averageSpeedRange
{
  objc_super v2 = [(CAFTrip *)self averageSpeedCharacteristic];
  unsigned __int8 v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)hasAverageSpeed
{
  objc_super v2 = [(CAFTrip *)self averageSpeedCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)averageSpeedInvalid
{
  objc_super v2 = [(CAFTrip *)self averageSpeedCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)distanceCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000022"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000022"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)distance
{
  objc_super v2 = [(CAFTrip *)self distanceCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)distanceRange
{
  objc_super v2 = [(CAFTrip *)self distanceCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 uInt64Range];

  return (CAFUInt64Range *)v4;
}

- (BOOL)hasDistance
{
  objc_super v2 = [(CAFTrip *)self distanceCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)distanceInvalid
{
  objc_super v2 = [(CAFTrip *)self distanceCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)durationCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000023"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000023"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)duration
{
  objc_super v2 = [(CAFTrip *)self durationCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)durationRange
{
  objc_super v2 = [(CAFTrip *)self durationCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 uInt64Range];

  return (CAFUInt64Range *)v4;
}

- (BOOL)hasDuration
{
  objc_super v2 = [(CAFTrip *)self durationCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)durationInvalid
{
  objc_super v2 = [(CAFTrip *)self durationCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)energyCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000025"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000025"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)energy
{
  objc_super v2 = [(CAFTrip *)self energyCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)energyRange
{
  objc_super v2 = [(CAFTrip *)self energyCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)hasEnergy
{
  objc_super v2 = [(CAFTrip *)self energyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)energyInvalid
{
  objc_super v2 = [(CAFTrip *)self energyCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)energyEfficiencyCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000035000012"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000035000012"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)energyEfficiency
{
  objc_super v2 = [(CAFTrip *)self energyEfficiencyCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFInt32Range)energyEfficiencyRange
{
  objc_super v2 = [(CAFTrip *)self energyEfficiencyCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 int32Range];

  return (CAFInt32Range *)v4;
}

- (BOOL)hasEnergyEfficiency
{
  objc_super v2 = [(CAFTrip *)self energyEfficiencyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)energyEfficiencyInvalid
{
  objc_super v2 = [(CAFTrip *)self energyEfficiencyCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMeasurementCharacteristic)fuelEfficiencyCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFTrip *)self fuelEfficiencyCharacteristic];
  char v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)fuelEfficiencyRange
{
  objc_super v2 = [(CAFTrip *)self fuelEfficiencyCharacteristic];
  char v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)hasFuelEfficiency
{
  objc_super v2 = [(CAFTrip *)self fuelEfficiencyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)fuelEfficiencyInvalid
{
  objc_super v2 = [(CAFTrip *)self fuelEfficiencyCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFBoolCharacteristic)showOdometerCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000035000016"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000035000016"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)showOdometer
{
  objc_super v2 = [(CAFTrip *)self showOdometerCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowOdometer:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFTrip *)self showOdometerCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasShowOdometer
{
  objc_super v2 = [(CAFTrip *)self showOdometerCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFResetControl)resetControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x0000000030000062"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFResetControl *)v4;
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFTrip *)self resetControl];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 resetWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__CAFTrip_resetWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __31__CAFTrip_resetWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasReset
{
  id v2 = [(CAFTrip *)self resetControl];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000015000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB12B8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000001"])
  {
    v8 = [v6 uniqueIdentifier];
    id v9 = [(CAFTrip *)self userVisibleLabelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFTrip *)self userVisibleLabel];
      [v12 tripService:self didUpdateUserVisibleLabel:v13];

LABEL_8:
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self name];
      [v19 tripService:self didUpdateName:v20];
LABEL_33:

      goto LABEL_34;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000003"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFTrip *)self sortOrderCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "tripService:didUpdateSortOrder:", self, -[CAFTrip sortOrder](self, "sortOrder"));
      goto LABEL_8;
    }
  }
  else
  {
  }
  v21 = [v6 characteristicType];
  if ([v21 isEqual:@"0x0000000030000045"])
  {
    v22 = [v6 uniqueIdentifier];
    v23 = [(CAFTrip *)self averageSpeedCharacteristic];
    v24 = [v23 uniqueIdentifier];
    int v25 = [v22 isEqual:v24];

    if (v25)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self averageSpeed];
      [v19 tripService:self didUpdateAverageSpeed:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v26 = [v6 characteristicType];
  if ([v26 isEqual:@"0x0000000030000022"])
  {
    v27 = [v6 uniqueIdentifier];
    v28 = [(CAFTrip *)self distanceCharacteristic];
    v29 = [v28 uniqueIdentifier];
    int v30 = [v27 isEqual:v29];

    if (v30)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self distance];
      [v19 tripService:self didUpdateDistance:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v31 = [v6 characteristicType];
  if ([v31 isEqual:@"0x0000000030000023"])
  {
    v32 = [v6 uniqueIdentifier];
    v33 = [(CAFTrip *)self durationCharacteristic];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self duration];
      [v19 tripService:self didUpdateDuration:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v36 = [v6 characteristicType];
  if ([v36 isEqual:@"0x0000000030000025"])
  {
    v37 = [v6 uniqueIdentifier];
    v38 = [(CAFTrip *)self energyCharacteristic];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self energy];
      [v19 tripService:self didUpdateEnergy:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v41 = [v6 characteristicType];
  if ([v41 isEqual:@"0x0000000035000012"])
  {
    v42 = [v6 uniqueIdentifier];
    v43 = [(CAFTrip *)self energyEfficiencyCharacteristic];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self energyEfficiency];
      [v19 tripService:self didUpdateEnergyEfficiency:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v46 = [v6 characteristicType];
  if ([v46 isEqual:@"0x0000000035000013"])
  {
    v47 = [v6 uniqueIdentifier];
    v48 = [(CAFTrip *)self fuelEfficiencyCharacteristic];
    v49 = [v48 uniqueIdentifier];
    int v50 = [v47 isEqual:v49];

    if (v50)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFTrip *)self fuelEfficiency];
      [v19 tripService:self didUpdateFuelEfficiency:v20];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000035000016"])
  {
    v51 = [v6 uniqueIdentifier];
    v52 = [(CAFTrip *)self showOdometerCharacteristic];
    v53 = [v52 uniqueIdentifier];
    int v54 = [v51 isEqual:v53];

    if (!v54) {
      goto LABEL_35;
    }
    v19 = [(CAFService *)self observers];
    objc_msgSend(v19, "tripService:didUpdateShowOdometer:", self, -[CAFTrip showOdometer](self, "showOdometer"));
  }
LABEL_34:

LABEL_35:
  v55.receiver = self;
  v55.super_class = (Class)CAFTrip;
  [(CAFService *)&v55 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUserVisibleLabel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  return v10;
}

- (BOOL)registeredForSortOrder
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  return v10;
}

- (BOOL)registeredForAverageSpeed
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000045"];

  return v10;
}

- (BOOL)registeredForDistance
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000022"];

  return v10;
}

- (BOOL)registeredForDuration
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000023"];

  return v10;
}

- (BOOL)registeredForEnergy
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000025"];

  return v10;
}

- (BOOL)registeredForEnergyEfficiency
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000035000012"];

  return v10;
}

- (BOOL)registeredForFuelEfficiency
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000035000013"];

  return v10;
}

- (BOOL)registeredForShowOdometer
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000035000016"];

  return v10;
}

- (BOOL)registeredForReset
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  id v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x0000000030000062"];

  return v10;
}

@end