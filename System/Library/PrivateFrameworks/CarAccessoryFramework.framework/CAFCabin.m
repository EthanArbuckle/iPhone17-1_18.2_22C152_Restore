@interface CAFCabin
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)compressorOn;
- (BOOL)compressorOnDisabled;
- (BOOL)compressorOnInvalid;
- (BOOL)compressorOnRestricted;
- (BOOL)hasCompressorOn;
- (BOOL)hasHvacOn;
- (BOOL)hasMaxACOn;
- (BOOL)hvacOn;
- (BOOL)hvacOnInvalid;
- (BOOL)maxACOn;
- (BOOL)maxACOnDisabled;
- (BOOL)maxACOnInvalid;
- (BOOL)maxACOnRestricted;
- (BOOL)registeredForACCompressorOn;
- (BOOL)registeredForHVACOn;
- (BOOL)registeredForMaxACOn;
- (CAFBoolCharacteristic)compressorOnCharacteristic;
- (CAFBoolCharacteristic)hvacOnCharacteristic;
- (CAFBoolCharacteristic)maxACOnCharacteristic;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setCompressorOn:(BOOL)a3;
- (void)setHvacOn:(BOOL)a3;
- (void)setMaxACOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFCabin

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFCabin;
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
  v6.super_class = (Class)CAFCabin;
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
  v6.super_class = (Class)CAFCabin;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFBoolCharacteristic)maxACOnCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000022"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000022"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)maxACOn
{
  objc_super v2 = [(CAFCabin *)self maxACOnCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMaxACOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFCabin *)self maxACOnCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasMaxACOn
{
  objc_super v2 = [(CAFCabin *)self maxACOnCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)maxACOnDisabled
{
  objc_super v2 = [(CAFCabin *)self maxACOnCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)maxACOnInvalid
{
  objc_super v2 = [(CAFCabin *)self maxACOnCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)maxACOnRestricted
{
  objc_super v2 = [(CAFCabin *)self maxACOnCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

- (CAFBoolCharacteristic)hvacOnCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)hvacOn
{
  objc_super v2 = [(CAFCabin *)self hvacOnCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHvacOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFCabin *)self hvacOnCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasHvacOn
{
  objc_super v2 = [(CAFCabin *)self hvacOnCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hvacOnInvalid
{
  objc_super v2 = [(CAFCabin *)self hvacOnCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFBoolCharacteristic)compressorOnCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000031000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000031000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)compressorOn
{
  objc_super v2 = [(CAFCabin *)self compressorOnCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCompressorOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFCabin *)self compressorOnCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasCompressorOn
{
  objc_super v2 = [(CAFCabin *)self compressorOnCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)compressorOnDisabled
{
  objc_super v2 = [(CAFCabin *)self compressorOnCharacteristic];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)compressorOnInvalid
{
  objc_super v2 = [(CAFCabin *)self compressorOnCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (BOOL)compressorOnRestricted
{
  objc_super v2 = [(CAFCabin *)self compressorOnCharacteristic];
  char v3 = [v2 isRestricted];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000011000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB01A0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000031000022"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFCabin *)self maxACOnCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cabinService:didUpdateMaxACOn:", self, -[CAFCabin maxACOn](self, "maxACOn"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000031000002"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFCabin *)self hvacOnCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cabinService:didUpdateHvacOn:", self, -[CAFCabin hvacOn](self, "hvacOn"));
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000031000003"]) {
    goto LABEL_12;
  }
  v18 = [v6 uniqueIdentifier];
  v19 = [(CAFCabin *)self compressorOnCharacteristic];
  v20 = [v19 uniqueIdentifier];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "cabinService:didUpdateCompressorOn:", self, -[CAFCabin compressorOn](self, "compressorOn"));
    goto LABEL_12;
  }
LABEL_13:
  v22.receiver = self;
  v22.super_class = (Class)CAFCabin;
  [(CAFService *)&v22 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForMaxACOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000022"];

  return v10;
}

- (BOOL)registeredForHVACOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000002"];

  return v10;
}

- (BOOL)registeredForACCompressorOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000031000003"];

  return v10;
}

@end