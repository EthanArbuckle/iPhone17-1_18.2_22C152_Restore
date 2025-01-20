@interface CAFEngineRPM
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasRotationalSpeedMarkerRedline;
- (BOOL)hasRotationalSpeedState;
- (BOOL)registeredForRotationalSpeed;
- (BOOL)registeredForRotationalSpeedMarkerRedline;
- (BOOL)registeredForRotationalSpeedMax;
- (BOOL)registeredForRotationalSpeedState;
- (BOOL)rotationalSpeedInvalid;
- (CAFMeasurementCharacteristic)rotationalSpeedCharacteristic;
- (CAFMeasurementCharacteristic)rotationalSpeedMarkerRedlineCharacteristic;
- (CAFMeasurementCharacteristic)rotationalSpeedMaxCharacteristic;
- (CAFRotationalSpeedStateCharacteristic)rotationalSpeedStateCharacteristic;
- (CAFUInt32Range)rotationalSpeedMarkerRedlineRange;
- (CAFUInt32Range)rotationalSpeedMaxRange;
- (CAFUInt32Range)rotationalSpeedRange;
- (NSMeasurement)rotationalSpeed;
- (NSMeasurement)rotationalSpeedMarkerRedline;
- (NSMeasurement)rotationalSpeedMax;
- (unsigned)rotationalSpeedState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFEngineRPM

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEngineRPM;
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
  v6.super_class = (Class)CAFEngineRPM;
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
  v6.super_class = (Class)CAFEngineRPM;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFMeasurementCharacteristic)rotationalSpeedCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000024"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000024"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)rotationalSpeed
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedCharacteristic];
  v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)rotationalSpeedRange
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedCharacteristic];
  v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)rotationalSpeedInvalid
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFRotationalSpeedStateCharacteristic)rotationalSpeedStateCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000060"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000060"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFRotationalSpeedStateCharacteristic *)v11;
}

- (unsigned)rotationalSpeedState
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedStateCharacteristic];
  unsigned __int8 v3 = [v2 rotationalSpeedStateValue];

  return v3;
}

- (BOOL)hasRotationalSpeedState
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedStateCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)rotationalSpeedMarkerRedlineCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000004F"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000004F"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)rotationalSpeedMarkerRedline
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedMarkerRedlineCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)rotationalSpeedMarkerRedlineRange
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedMarkerRedlineCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

- (BOOL)hasRotationalSpeedMarkerRedline
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedMarkerRedlineCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)rotationalSpeedMaxCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000004E"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000004E"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)rotationalSpeedMax
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedMaxCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)rotationalSpeedMaxRange
{
  objc_super v2 = [(CAFEngineRPM *)self rotationalSpeedMaxCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt32Range];

  return (CAFUInt32Range *)v4;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A00000F";
}

+ (id)observerProtocol
{
  return &unk_26FDB4958;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000024"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFEngineRPM *)self rotationalSpeedCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEngineRPM *)self rotationalSpeed];
      [v12 engineRPMService:self didUpdateRotationalSpeed:v13];
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000060"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFEngineRPM *)self rotationalSpeedStateCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "engineRPMService:didUpdateRotationalSpeedState:", self, -[CAFEngineRPM rotationalSpeedState](self, "rotationalSpeedState"));
      goto LABEL_17;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x000000003000004F"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFEngineRPM *)self rotationalSpeedMarkerRedlineCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFEngineRPM *)self rotationalSpeedMarkerRedline];
      [v12 engineRPMService:self didUpdateRotationalSpeedMarkerRedline:v13];
      goto LABEL_16;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000003000004E"])
  {
LABEL_17:

    goto LABEL_18;
  }
  v24 = [v6 uniqueIdentifier];
  v25 = [(CAFEngineRPM *)self rotationalSpeedMaxCharacteristic];
  v26 = [v25 uniqueIdentifier];
  int v27 = [v24 isEqual:v26];

  if (v27)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFEngineRPM *)self rotationalSpeedMax];
    [v12 engineRPMService:self didUpdateRotationalSpeedMax:v13];
    goto LABEL_16;
  }
LABEL_18:
  v28.receiver = self;
  v28.super_class = (Class)CAFEngineRPM;
  [(CAFService *)&v28 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForRotationalSpeed
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000024"];

  return v10;
}

- (BOOL)registeredForRotationalSpeedState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000060"];

  return v10;
}

- (BOOL)registeredForRotationalSpeedMarkerRedline
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000004F"];

  return v10;
}

- (BOOL)registeredForRotationalSpeedMax
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000004E"];

  return v10;
}

@end