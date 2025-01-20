@interface CAFSeatBelt
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasBuckleState;
- (BOOL)hasSeatOccupancy;
- (BOOL)registeredForBuckleState;
- (BOOL)registeredForSeatBeltIndicator;
- (BOOL)registeredForSeatOccupancy;
- (BOOL)registeredForVehicleLayoutKey;
- (CAFLockStateCharacteristic)buckleStateCharacteristic;
- (CAFSeatBeltIndicatorCharacteristic)seatBeltIndicatorCharacteristic;
- (CAFSeatOccupancyCharacteristic)seatOccupancyCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (NSString)vehicleLayoutKey;
- (id)name;
- (unsigned)buckleState;
- (unsigned)seatBeltIndicator;
- (unsigned)seatOccupancy;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSeatBelt

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatBelt;
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
  v6.super_class = (Class)CAFSeatBelt;
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
  v6.super_class = (Class)CAFSeatBelt;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFSeatBelt *)self vehicleLayoutKeyCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000065"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayoutKey
{
  objc_super v2 = [(CAFSeatBelt *)self vehicleLayoutKeyCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFSeatOccupancyCharacteristic)seatOccupancyCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000060000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000060000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSeatOccupancyCharacteristic *)v11;
}

- (unsigned)seatOccupancy
{
  objc_super v2 = [(CAFSeatBelt *)self seatOccupancyCharacteristic];
  unsigned __int8 v3 = [v2 seatOccupancyValue];

  return v3;
}

- (BOOL)hasSeatOccupancy
{
  objc_super v2 = [(CAFSeatBelt *)self seatOccupancyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFLockStateCharacteristic)buckleStateCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000060000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000060000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFLockStateCharacteristic *)v11;
}

- (unsigned)buckleState
{
  objc_super v2 = [(CAFSeatBelt *)self buckleStateCharacteristic];
  unsigned __int8 v3 = [v2 lockStateValue];

  return v3;
}

- (BOOL)hasBuckleState
{
  objc_super v2 = [(CAFSeatBelt *)self buckleStateCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFSeatBeltIndicatorCharacteristic)seatBeltIndicatorCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000060000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000060000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSeatBeltIndicatorCharacteristic *)v11;
}

- (unsigned)seatBeltIndicator
{
  objc_super v2 = [(CAFSeatBelt *)self seatBeltIndicatorCharacteristic];
  unsigned __int8 v3 = [v2 seatBeltIndicatorValue];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000022000004";
}

+ (id)observerProtocol
{
  return &unk_26FDB4100;
}

+ (id)indexBy
{
  return @"0x0000000036000065";
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000065"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFSeatBelt *)self vehicleLayoutKeyCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSeatBelt *)self vehicleLayoutKey];
      [v12 seatBeltService:self didUpdateVehicleLayoutKey:v13];

      v14 = [(CAFService *)self observers];
      v15 = [(CAFSeatBelt *)self name];
      [v14 seatBeltService:self didUpdateName:v15];

LABEL_16:
      goto LABEL_17;
    }
  }
  else
  {
  }
  v16 = [v6 characteristicType];
  if ([v16 isEqual:@"0x0000000060000006"])
  {
    v17 = [v6 uniqueIdentifier];
    v18 = [(CAFSeatBelt *)self seatOccupancyCharacteristic];
    v19 = [v18 uniqueIdentifier];
    int v20 = [v17 isEqual:v19];

    if (v20)
    {
      v14 = [(CAFService *)self observers];
      objc_msgSend(v14, "seatBeltService:didUpdateSeatOccupancy:", self, -[CAFSeatBelt seatOccupancy](self, "seatOccupancy"));
      goto LABEL_16;
    }
  }
  else
  {
  }
  v21 = [v6 characteristicType];
  if ([v21 isEqual:@"0x0000000060000002"])
  {
    v22 = [v6 uniqueIdentifier];
    v23 = [(CAFSeatBelt *)self buckleStateCharacteristic];
    v24 = [v23 uniqueIdentifier];
    int v25 = [v22 isEqual:v24];

    if (v25)
    {
      v14 = [(CAFService *)self observers];
      objc_msgSend(v14, "seatBeltService:didUpdateBuckleState:", self, -[CAFSeatBelt buckleState](self, "buckleState"));
      goto LABEL_16;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if (![v14 isEqual:@"0x0000000060000007"]) {
    goto LABEL_16;
  }
  v26 = [v6 uniqueIdentifier];
  v27 = [(CAFSeatBelt *)self seatBeltIndicatorCharacteristic];
  v28 = [v27 uniqueIdentifier];
  int v29 = [v26 isEqual:v28];

  if (v29)
  {
    v14 = [(CAFService *)self observers];
    objc_msgSend(v14, "seatBeltService:didUpdateSeatBeltIndicator:", self, -[CAFSeatBelt seatBeltIndicator](self, "seatBeltIndicator"));
    goto LABEL_16;
  }
LABEL_17:
  v30.receiver = self;
  v30.super_class = (Class)CAFSeatBelt;
  [(CAFService *)&v30 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForVehicleLayoutKey
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  return v10;
}

- (BOOL)registeredForSeatOccupancy
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000060000006"];

  return v10;
}

- (BOOL)registeredForBuckleState
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000060000002"];

  return v10;
}

- (BOOL)registeredForSeatBeltIndicator
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000060000007"];

  return v10;
}

@end