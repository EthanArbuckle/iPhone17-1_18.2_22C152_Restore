@interface CAFUIInputDevice
+ (void)load;
- (BOOL)registeredForUIInputDevicePurpose;
- (CAFUIInputDevicePurposeCharacteristic)uiInputDevicePurposeCharacteristic;
- (unsigned)uiInputDevicePurpose;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFUIInputDevice

+ (void)load
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___CAFUIInputDevice;
    objc_msgSendSuper2(&v4, sel_load);
  }
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
  v6.super_class = (Class)CAFUIInputDevice;
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
  v6.super_class = (Class)CAFUIInputDevice;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFUIInputDevicePurposeCharacteristic)uiInputDevicePurposeCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000047000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000047000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUIInputDevicePurposeCharacteristic *)v11;
}

- (unsigned)uiInputDevicePurpose
{
  v2 = [(CAFUIInputDevice *)self uiInputDevicePurposeCharacteristic];
  unsigned __int8 v3 = [v2 uIInputDevicePurposeValue];

  return v3;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if (![v7 isEqual:@"0x0000000047000002"]) {
    goto LABEL_4;
  }
  v8 = [v6 uniqueIdentifier];
  v9 = [(CAFUIInputDevice *)self uiInputDevicePurposeCharacteristic];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v7 = [(CAFService *)self observers];
    objc_msgSend(v7, "uIInputDeviceService:didUpdateUiInputDevicePurpose:", self, -[CAFUIInputDevice uiInputDevicePurpose](self, "uiInputDevicePurpose"));
LABEL_4:
  }
  v12.receiver = self;
  v12.super_class = (Class)CAFUIInputDevice;
  [(CAFService *)&v12 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUIInputDevicePurpose
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000047000002"];

  return v10;
}

@end