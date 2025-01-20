@interface CAFCameraGeneral
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)on;
- (BOOL)registeredForOn;
- (BOOL)registeredForUserDismissible;
- (BOOL)userDismissible;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFBoolCharacteristic)userDismissibleCharacteristic;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFCameraGeneral

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFCameraGeneral;
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
  v6.super_class = (Class)CAFCameraGeneral;
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
  v6.super_class = (Class)CAFCameraGeneral;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFBoolCharacteristic)onCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)on
{
  objc_super v2 = [(CAFCameraGeneral *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFCameraGeneral *)self onCharacteristic];
  [v4 setBoolValue:v3];
}

- (CAFBoolCharacteristic)userDismissibleCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000063"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000063"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)userDismissible
{
  objc_super v2 = [(CAFCameraGeneral *)self userDismissibleCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001F000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB5F18;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000002"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFCameraGeneral *)self onCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cameraGeneralService:didUpdateOn:", self, -[CAFCameraGeneral on](self, "on"));
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000063"]) {
    goto LABEL_8;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [(CAFCameraGeneral *)self userDismissibleCharacteristic];
  v15 = [v14 uniqueIdentifier];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "cameraGeneralService:didUpdateUserDismissible:", self, -[CAFCameraGeneral userDismissible](self, "userDismissible"));
    goto LABEL_8;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)CAFCameraGeneral;
  [(CAFService *)&v17 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  return v10;
}

- (BOOL)registeredForUserDismissible
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000063"];

  return v10;
}

@end