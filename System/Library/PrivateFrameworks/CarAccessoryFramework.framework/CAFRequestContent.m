@interface CAFRequestContent
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)on;
- (BOOL)registeredForContentURL;
- (BOOL)registeredForDisplayPanelIdentifier;
- (BOOL)registeredForDisplayZoneIdentifier;
- (BOOL)registeredForOn;
- (BOOL)registeredForUserDismissible;
- (BOOL)userDismissible;
- (CAFBoolCharacteristic)onCharacteristic;
- (CAFBoolCharacteristic)userDismissibleCharacteristic;
- (CAFStringCharacteristic)contentURLCharacteristic;
- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic;
- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic;
- (NSString)contentURL;
- (NSString)displayPanelIdentifier;
- (NSString)displayZoneIdentifier;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFRequestContent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFRequestContent;
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
  v6.super_class = (Class)CAFRequestContent;
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
  v6.super_class = (Class)CAFRequestContent;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFRequestContent *)self displayPanelIdentifierCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFRequestContent *)self displayZoneIdentifierCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFBoolCharacteristic)onCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFRequestContent *)self onCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFRequestContent *)self onCharacteristic];
  [v4 setBoolValue:v3];
}

- (CAFStringCharacteristic)contentURLCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)contentURL
{
  objc_super v2 = [(CAFRequestContent *)self contentURLCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)userDismissibleCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFRequestContent *)self userDismissibleCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000037000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000037000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)displayPanelIdentifier
{
  objc_super v2 = [(CAFRequestContent *)self displayPanelIdentifierCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003700000B"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003700000B"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)displayZoneIdentifier
{
  objc_super v2 = [(CAFRequestContent *)self displayZoneIdentifierCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000017000004";
}

+ (id)observerProtocol
{
  return &unk_26FDB04F0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000002"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFRequestContent *)self onCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "requestContentService:didUpdateOn:", self, -[CAFRequestContent on](self, "on"));
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000030000007"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFRequestContent *)self contentURLCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFRequestContent *)self contentURL];
      [v12 requestContentService:self didUpdateContentURL:v18];
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000036000063"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFRequestContent *)self userDismissibleCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "requestContentService:didUpdateUserDismissible:", self, -[CAFRequestContent userDismissible](self, "userDismissible"));
      goto LABEL_22;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000037000007"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFRequestContent *)self displayPanelIdentifierCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v29 = [(CAFService *)self observers];
      v30 = [(CAFRequestContent *)self displayPanelIdentifier];
      [v29 requestContentService:self didUpdateDisplayPanelIdentifier:v30];
LABEL_20:

      v12 = [(CAFService *)self observers];
      v18 = [(CAFRequestContent *)self name];
      [v12 requestContentService:self didUpdateName:v18];
      goto LABEL_21;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000003700000B"]) {
    goto LABEL_22;
  }
  v31 = [v6 uniqueIdentifier];
  v32 = [(CAFRequestContent *)self displayZoneIdentifierCharacteristic];
  v33 = [v32 uniqueIdentifier];
  int v34 = [v31 isEqual:v33];

  if (v34)
  {
    v29 = [(CAFService *)self observers];
    v30 = [(CAFRequestContent *)self displayZoneIdentifier];
    [v29 requestContentService:self didUpdateDisplayZoneIdentifier:v30];
    goto LABEL_20;
  }
LABEL_23:
  v35.receiver = self;
  v35.super_class = (Class)CAFRequestContent;
  [(CAFService *)&v35 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForOn
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000002"];

  return v10;
}

- (BOOL)registeredForContentURL
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000007"];

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
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000063"];

  return v10;
}

- (BOOL)registeredForDisplayPanelIdentifier
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000037000007"];

  return v10;
}

- (BOOL)registeredForDisplayZoneIdentifier
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003700000B"];

  return v10;
}

@end