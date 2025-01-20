@interface CAFChargingStatus
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasCableState;
- (BOOL)hasPortSideIndicator;
- (BOOL)registeredForCableState;
- (BOOL)registeredForChargingState;
- (BOOL)registeredForPortSideIndicator;
- (CAFCableStateCharacteristic)cableStateCharacteristic;
- (CAFChargingStateCharacteristic)chargingStateCharacteristic;
- (CAFPortSideIndicatorCharacteristic)portSideIndicatorCharacteristic;
- (unsigned)cableState;
- (unsigned)chargingState;
- (unsigned)portSideIndicator;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFChargingStatus

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFChargingStatus;
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
  v6.super_class = (Class)CAFChargingStatus;
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
  v6.super_class = (Class)CAFChargingStatus;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFChargingStateCharacteristic)chargingStateCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000040000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000040000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFChargingStateCharacteristic *)v11;
}

- (unsigned)chargingState
{
  objc_super v2 = [(CAFChargingStatus *)self chargingStateCharacteristic];
  unsigned __int8 v3 = [v2 chargingStateValue];

  return v3;
}

- (CAFCableStateCharacteristic)cableStateCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000040000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000040000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFCableStateCharacteristic *)v11;
}

- (unsigned)cableState
{
  objc_super v2 = [(CAFChargingStatus *)self cableStateCharacteristic];
  unsigned __int8 v3 = [v2 cableStateValue];

  return v3;
}

- (BOOL)hasCableState
{
  objc_super v2 = [(CAFChargingStatus *)self cableStateCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFPortSideIndicatorCharacteristic)portSideIndicatorCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000041000013"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000041000013"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFPortSideIndicatorCharacteristic *)v11;
}

- (unsigned)portSideIndicator
{
  objc_super v2 = [(CAFChargingStatus *)self portSideIndicatorCharacteristic];
  unsigned __int8 v3 = [v2 portSideIndicatorValue];

  return v3;
}

- (BOOL)hasPortSideIndicator
{
  objc_super v2 = [(CAFChargingStatus *)self portSideIndicatorCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000019000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB1B00;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000040000005"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFChargingStatus *)self chargingStateCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "chargingStatusService:didUpdateChargingState:", self, -[CAFChargingStatus chargingState](self, "chargingState"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000040000007"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFChargingStatus *)self cableStateCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "chargingStatusService:didUpdateCableState:", self, -[CAFChargingStatus cableState](self, "cableState"));
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000041000013"]) {
    goto LABEL_12;
  }
  v18 = [v6 uniqueIdentifier];
  v19 = [(CAFChargingStatus *)self portSideIndicatorCharacteristic];
  v20 = [v19 uniqueIdentifier];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "chargingStatusService:didUpdatePortSideIndicator:", self, -[CAFChargingStatus portSideIndicator](self, "portSideIndicator"));
    goto LABEL_12;
  }
LABEL_13:
  v22.receiver = self;
  v22.super_class = (Class)CAFChargingStatus;
  [(CAFService *)&v22 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForChargingState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000040000005"];

  return v10;
}

- (BOOL)registeredForCableState
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000040000007"];

  return v10;
}

- (BOOL)registeredForPortSideIndicator
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000041000013"];

  return v10;
}

@end