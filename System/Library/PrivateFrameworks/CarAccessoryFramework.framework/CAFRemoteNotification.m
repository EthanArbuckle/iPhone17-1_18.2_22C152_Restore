@interface CAFRemoteNotification
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasSymbolNameAndColor;
- (BOOL)registeredForDisplayPanelIdentifier;
- (BOOL)registeredForDisplayZoneIdentifier;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForNotificationUserActions;
- (BOOL)registeredForSymbolNameAndColor;
- (BOOL)registeredForUserAction;
- (BOOL)registeredForUserVisibleDescription;
- (BOOL)registeredForUserVisibleLabel;
- (CAFNotificationUserActions)notificationUserActions;
- (CAFNotificationUserActionsCharacteristic)notificationUserActionsCharacteristic;
- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic;
- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFSymbolImageWithColor)symbolNameAndColor;
- (CAFSymbolImageWithColorCharacteristic)symbolNameAndColorCharacteristic;
- (CAFUInt8Characteristic)userActionCharacteristic;
- (CAFUInt8Range)userActionRange;
- (NSString)displayPanelIdentifier;
- (NSString)displayZoneIdentifier;
- (NSString)identifier;
- (NSString)userVisibleDescription;
- (NSString)userVisibleLabel;
- (id)name;
- (unsigned)userAction;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setUserAction:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFRemoteNotification

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFRemoteNotification;
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
  v6.super_class = (Class)CAFRemoteNotification;
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
  v6.super_class = (Class)CAFRemoteNotification;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFRemoteNotification *)self identifierCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFRemoteNotification *)self displayZoneIdentifierCharacteristic];
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
  objc_super v2 = [(CAFRemoteNotification *)self userVisibleLabelCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleDescription
{
  objc_super v2 = [(CAFRemoteNotification *)self userVisibleDescriptionCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)identifierCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000019"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000019"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)identifier
{
  objc_super v2 = [(CAFRemoteNotification *)self identifierCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFNotificationUserActionsCharacteristic)notificationUserActionsCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000037000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000037000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFNotificationUserActionsCharacteristic *)v11;
}

- (CAFNotificationUserActions)notificationUserActions
{
  objc_super v2 = [(CAFRemoteNotification *)self notificationUserActionsCharacteristic];
  v3 = [v2 notificationUserActionsValue];

  return (CAFNotificationUserActions *)v3;
}

- (CAFUInt8Characteristic)userActionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000037000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000037000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)userAction
{
  objc_super v2 = [(CAFRemoteNotification *)self userActionCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setUserAction:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFRemoteNotification *)self userActionCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)userActionRange
{
  objc_super v2 = [(CAFRemoteNotification *)self userActionCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (CAFSymbolImageWithColorCharacteristic)symbolNameAndColorCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000037000008"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000037000008"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSymbolImageWithColorCharacteristic *)v11;
}

- (CAFSymbolImageWithColor)symbolNameAndColor
{
  objc_super v2 = [(CAFRemoteNotification *)self symbolNameAndColorCharacteristic];
  uint64_t v3 = [v2 symbolImageWithColorValue];

  return (CAFSymbolImageWithColor *)v3;
}

- (BOOL)hasSymbolNameAndColor
{
  objc_super v2 = [(CAFRemoteNotification *)self symbolNameAndColorCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFRemoteNotification *)self displayPanelIdentifierCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFRemoteNotification *)self displayZoneIdentifierCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000017000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB33C8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000001"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFRemoteNotification *)self userVisibleLabelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self userVisibleLabel];
      [v12 remoteNotificationService:self didUpdateUserVisibleLabel:v13];
LABEL_33:

      goto LABEL_34;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000030000005"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFRemoteNotification *)self userVisibleDescriptionCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self userVisibleDescription];
      [v12 remoteNotificationService:self didUpdateUserVisibleDescription:v13];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000019"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFRemoteNotification *)self identifierCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v24 = [(CAFService *)self observers];
      v25 = [(CAFRemoteNotification *)self identifier];
      [v24 remoteNotificationService:self didUpdateIdentifier:v25];
LABEL_32:

      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self name];
      [v12 remoteNotificationService:self didUpdateName:v13];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v26 = [v6 characteristicType];
  if ([v26 isEqual:@"0x0000000037000002"])
  {
    v27 = [v6 uniqueIdentifier];
    v28 = [(CAFRemoteNotification *)self notificationUserActionsCharacteristic];
    v29 = [v28 uniqueIdentifier];
    int v30 = [v27 isEqual:v29];

    if (v30)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self notificationUserActions];
      [v12 remoteNotificationService:self didUpdateNotificationUserActions:v13];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v31 = [v6 characteristicType];
  if ([v31 isEqual:@"0x0000000037000003"])
  {
    v32 = [v6 uniqueIdentifier];
    v33 = [(CAFRemoteNotification *)self userActionCharacteristic];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "remoteNotificationService:didUpdateUserAction:", self, -[CAFRemoteNotification userAction](self, "userAction"));
      goto LABEL_34;
    }
  }
  else
  {
  }
  v36 = [v6 characteristicType];
  if ([v36 isEqual:@"0x0000000037000008"])
  {
    v37 = [v6 uniqueIdentifier];
    v38 = [(CAFRemoteNotification *)self symbolNameAndColorCharacteristic];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self symbolNameAndColor];
      [v12 remoteNotificationService:self didUpdateSymbolNameAndColor:v13];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v41 = [v6 characteristicType];
  if ([v41 isEqual:@"0x0000000037000007"])
  {
    v42 = [v6 uniqueIdentifier];
    v43 = [(CAFRemoteNotification *)self displayPanelIdentifierCharacteristic];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFRemoteNotification *)self displayPanelIdentifier];
      [v12 remoteNotificationService:self didUpdateDisplayPanelIdentifier:v13];
      goto LABEL_33;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000003700000B"])
  {
LABEL_34:

    goto LABEL_35;
  }
  v46 = [v6 uniqueIdentifier];
  v47 = [(CAFRemoteNotification *)self displayZoneIdentifierCharacteristic];
  v48 = [v47 uniqueIdentifier];
  int v49 = [v46 isEqual:v48];

  if (v49)
  {
    v24 = [(CAFService *)self observers];
    v25 = [(CAFRemoteNotification *)self displayZoneIdentifier];
    [v24 remoteNotificationService:self didUpdateDisplayZoneIdentifier:v25];
    goto LABEL_32;
  }
LABEL_35:
  v50.receiver = self;
  v50.super_class = (Class)CAFRemoteNotification;
  [(CAFService *)&v50 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUserVisibleLabel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

  return v10;
}

- (BOOL)registeredForUserVisibleDescription
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000005"];

  return v10;
}

- (BOOL)registeredForIdentifier
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000019"];

  return v10;
}

- (BOOL)registeredForNotificationUserActions
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000037000002"];

  return v10;
}

- (BOOL)registeredForUserAction
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000037000003"];

  return v10;
}

- (BOOL)registeredForSymbolNameAndColor
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000037000008"];

  return v10;
}

- (BOOL)registeredForDisplayPanelIdentifier
{
  BOOL v3 = [(CAFService *)self car];
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
  BOOL v3 = [(CAFService *)self car];
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