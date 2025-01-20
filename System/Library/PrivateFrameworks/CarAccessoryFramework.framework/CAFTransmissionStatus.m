@interface CAFTransmissionStatus
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)gearPositionInvalid;
- (BOOL)registeredForGearPosition;
- (BOOL)registeredForTransmissionMode;
- (CAFTransmissionModeCharacteristic)transmissionModeCharacteristic;
- (CAFUInt8Characteristic)gearPositionCharacteristic;
- (CAFUInt8Range)gearPositionRange;
- (unsigned)gearPosition;
- (unsigned)transmissionMode;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTransmissionStatus

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTransmissionStatus;
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
  v6.super_class = (Class)CAFTransmissionStatus;
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
  v6.super_class = (Class)CAFTransmissionStatus;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFTransmissionModeCharacteristic)transmissionModeCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000011"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000011"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFTransmissionModeCharacteristic *)v11;
}

- (unsigned)transmissionMode
{
  objc_super v2 = [(CAFTransmissionStatus *)self transmissionModeCharacteristic];
  unsigned __int8 v3 = [v2 transmissionModeValue];

  return v3;
}

- (CAFUInt8Characteristic)gearPositionCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000012"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000012"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)gearPosition
{
  objc_super v2 = [(CAFTransmissionStatus *)self gearPositionCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (CAFUInt8Range)gearPositionRange
{
  objc_super v2 = [(CAFTransmissionStatus *)self gearPositionCharacteristic];
  unsigned __int8 v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)gearPositionInvalid
{
  objc_super v2 = [(CAFTransmissionStatus *)self gearPositionCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB15E0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000041000011"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFTransmissionStatus *)self transmissionModeCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "transmissionStatusService:didUpdateTransmissionMode:", self, -[CAFTransmissionStatus transmissionMode](self, "transmissionMode"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000041000012"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFTransmissionStatus *)self gearPositionCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "transmissionStatusService:didUpdateGearPosition:", self, -[CAFTransmissionStatus gearPosition](self, "gearPosition"));
    goto LABEL_8;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)CAFTransmissionStatus;
  [(CAFService *)&v17 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForTransmissionMode
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000011"];

  return v10;
}

- (BOOL)registeredForGearPosition
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000012"];

  return v10;
}

@end