@interface CAFSteeringWheelHeatingCooling
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)autoMode;
- (BOOL)hasAutoMode;
- (BOOL)heatingCoolingLevelDisabled;
- (BOOL)heatingCoolingLevelInvalid;
- (BOOL)heatingCoolingLevelRestricted;
- (BOOL)registeredForAutoMode;
- (BOOL)registeredForHeatingCoolingLevel;
- (CAFBoolCharacteristic)autoModeCharacteristic;
- (CAFInt32Characteristic)heatingCoolingLevelCharacteristic;
- (CAFInt32Range)heatingCoolingLevelRange;
- (int)heatingCoolingLevel;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setHeatingCoolingLevel:(int)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSteeringWheelHeatingCooling

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSteeringWheelHeatingCooling;
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
  v6.super_class = (Class)CAFSteeringWheelHeatingCooling;
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
  v6.super_class = (Class)CAFSteeringWheelHeatingCooling;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFInt32Characteristic)heatingCoolingLevelCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000021"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000021"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt32Characteristic *)v11;
}

- (int)heatingCoolingLevel
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  int v3 = [v2 int32Value];

  return v3;
}

- (void)setHeatingCoolingLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  [v4 setInt32Value:v3];
}

- (CAFInt32Range)heatingCoolingLevelRange
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt32Range *)v3;
}

- (BOOL)heatingCoolingLevelDisabled
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)heatingCoolingLevelInvalid
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)heatingCoolingLevelRestricted
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFBoolCharacteristic)autoModeCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000005F"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)autoMode
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self autoModeCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasAutoMode
{
  objc_super v2 = [(CAFSteeringWheelHeatingCooling *)self autoModeCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB5A18;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000031000021"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFSteeringWheelHeatingCooling *)self heatingCoolingLevelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "steeringWheelHeatingCoolingService:didUpdateHeatingCoolingLevel:", self, -[CAFSteeringWheelHeatingCooling heatingCoolingLevel](self, "heatingCoolingLevel"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000003000005F"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFSteeringWheelHeatingCooling *)self autoModeCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "steeringWheelHeatingCoolingService:didUpdateAutoMode:", self, -[CAFSteeringWheelHeatingCooling autoMode](self, "autoMode"));
    goto LABEL_8;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)CAFSteeringWheelHeatingCooling;
  [(CAFService *)&v17 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForHeatingCoolingLevel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000021"];

  return v10;
}

- (BOOL)registeredForAutoMode
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005F"];

  return v10;
}

@end