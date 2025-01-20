@interface CAFHistoricalNotification
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasHistoricalNotificationUserActions;
- (BOOL)hasUserAction;
- (BOOL)hasUserDismissible;
- (BOOL)hasUserVisibleFullDescription;
- (BOOL)hidden;
- (BOOL)registeredForHidden;
- (BOOL)registeredForHistoricalNotificationUserActions;
- (BOOL)registeredForNotificationSeverity;
- (BOOL)registeredForSymbolName;
- (BOOL)registeredForTimestamp;
- (BOOL)registeredForUserAction;
- (BOOL)registeredForUserDismissible;
- (BOOL)registeredForUserVisibleDescription;
- (BOOL)registeredForUserVisibleFullDescription;
- (BOOL)registeredForUserVisibleLabel;
- (BOOL)userDismissible;
- (CAFBoolCharacteristic)hiddenCharacteristic;
- (CAFBoolCharacteristic)userDismissibleCharacteristic;
- (CAFHistoricalNotificationUserActions)historicalNotificationUserActions;
- (CAFHistoricalNotificationUserActionsCharacteristic)historicalNotificationUserActionsCharacteristic;
- (CAFMeasurementCharacteristic)timestampCharacteristic;
- (CAFNotificationSeverityCharacteristic)notificationSeverityCharacteristic;
- (CAFStringCharacteristic)symbolNameCharacteristic;
- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic;
- (CAFStringCharacteristic)userVisibleFullDescriptionCharacteristic;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFUInt64Range)timestampRange;
- (CAFUInt8Characteristic)userActionCharacteristic;
- (CAFUInt8Range)userActionRange;
- (NSMeasurement)timestamp;
- (NSString)symbolName;
- (NSString)userVisibleDescription;
- (NSString)userVisibleFullDescription;
- (NSString)userVisibleLabel;
- (id)name;
- (unsigned)notificationSeverity;
- (unsigned)userAction;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setNotificationSeverity:(unsigned __int8)a3;
- (void)setSymbolName:(id)a3;
- (void)setUserAction:(unsigned __int8)a3;
- (void)setUserDismissible:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFHistoricalNotification

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotification;
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
  v6.super_class = (Class)CAFHistoricalNotification;
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
  v6.super_class = (Class)CAFHistoricalNotification;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFHistoricalNotification *)self userVisibleLabelCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
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
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFHistoricalNotification *)self userVisibleLabelCharacteristic];
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
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFHistoricalNotification *)self userVisibleDescriptionCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleFullDescriptionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000049000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000049000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleFullDescription
{
  objc_super v2 = [(CAFHistoricalNotification *)self userVisibleFullDescriptionCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleFullDescription
{
  objc_super v2 = [(CAFHistoricalNotification *)self userVisibleFullDescriptionCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)timestampCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000049000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000049000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)timestamp
{
  objc_super v2 = [(CAFHistoricalNotification *)self timestampCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)timestampRange
{
  objc_super v2 = [(CAFHistoricalNotification *)self timestampCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt64Range];

  return (CAFUInt64Range *)v4;
}

- (CAFStringCharacteristic)symbolNameCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000005E"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000005E"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)symbolName
{
  objc_super v2 = [(CAFHistoricalNotification *)self symbolNameCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (void)setSymbolName:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFHistoricalNotification *)self symbolNameCharacteristic];
  [v5 setStringValue:v4];
}

- (CAFNotificationSeverityCharacteristic)notificationSeverityCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000049000002"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000049000002"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFNotificationSeverityCharacteristic *)v11;
}

- (unsigned)notificationSeverity
{
  objc_super v2 = [(CAFHistoricalNotification *)self notificationSeverityCharacteristic];
  unsigned __int8 v3 = [v2 notificationSeverityValue];

  return v3;
}

- (void)setNotificationSeverity:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFHistoricalNotification *)self notificationSeverityCharacteristic];
  [v4 setNotificationSeverityValue:v3];
}

- (CAFHistoricalNotificationUserActionsCharacteristic)historicalNotificationUserActionsCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000049000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000049000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFHistoricalNotificationUserActionsCharacteristic *)v11;
}

- (CAFHistoricalNotificationUserActions)historicalNotificationUserActions
{
  objc_super v2 = [(CAFHistoricalNotification *)self historicalNotificationUserActionsCharacteristic];
  uint64_t v3 = [v2 historicalNotificationUserActionsValue];

  return (CAFHistoricalNotificationUserActions *)v3;
}

- (BOOL)hasHistoricalNotificationUserActions
{
  objc_super v2 = [(CAFHistoricalNotification *)self historicalNotificationUserActionsCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)userDismissibleCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
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
  objc_super v2 = [(CAFHistoricalNotification *)self userDismissibleCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUserDismissible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFHistoricalNotification *)self userDismissibleCharacteristic];
  [v4 setBoolValue:v3];
}

- (BOOL)hasUserDismissible
{
  objc_super v2 = [(CAFHistoricalNotification *)self userDismissibleCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)hiddenCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000023"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000023"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)hidden
{
  objc_super v2 = [(CAFHistoricalNotification *)self hiddenCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAFHistoricalNotification *)self hiddenCharacteristic];
  [v4 setBoolValue:v3];
}

- (CAFUInt8Characteristic)userActionCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFHistoricalNotification *)self userActionCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setUserAction:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFHistoricalNotification *)self userActionCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)userActionRange
{
  objc_super v2 = [(CAFHistoricalNotification *)self userActionCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasUserAction
{
  objc_super v2 = [(CAFHistoricalNotification *)self userActionCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000021000001";
}

+ (id)observerProtocol
{
  return &unk_26FDAFE00;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000001"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFHistoricalNotification *)self userVisibleLabelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFHistoricalNotification *)self userVisibleLabel];
      [v12 historicalNotificationService:self didUpdateUserVisibleLabel:v13];

      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self name];
      [v14 historicalNotificationService:self didUpdateName:v15];
LABEL_28:

      goto LABEL_29;
    }
  }
  else
  {
  }
  v16 = [v6 characteristicType];
  if ([v16 isEqual:@"0x0000000030000005"])
  {
    v17 = [v6 uniqueIdentifier];
    v18 = [(CAFHistoricalNotification *)self userVisibleDescriptionCharacteristic];
    v19 = [v18 uniqueIdentifier];
    int v20 = [v17 isEqual:v19];

    if (v20)
    {
      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self userVisibleDescription];
      [v14 historicalNotificationService:self didUpdateUserVisibleDescription:v15];
      goto LABEL_28;
    }
  }
  else
  {
  }
  v21 = [v6 characteristicType];
  if ([v21 isEqual:@"0x0000000049000004"])
  {
    v22 = [v6 uniqueIdentifier];
    v23 = [(CAFHistoricalNotification *)self userVisibleFullDescriptionCharacteristic];
    v24 = [v23 uniqueIdentifier];
    int v25 = [v22 isEqual:v24];

    if (v25)
    {
      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self userVisibleFullDescription];
      [v14 historicalNotificationService:self didUpdateUserVisibleFullDescription:v15];
      goto LABEL_28;
    }
  }
  else
  {
  }
  v26 = [v6 characteristicType];
  if ([v26 isEqual:@"0x0000000049000003"])
  {
    v27 = [v6 uniqueIdentifier];
    v28 = [(CAFHistoricalNotification *)self timestampCharacteristic];
    v29 = [v28 uniqueIdentifier];
    int v30 = [v27 isEqual:v29];

    if (v30)
    {
      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self timestamp];
      [v14 historicalNotificationService:self didUpdateTimestamp:v15];
      goto LABEL_28;
    }
  }
  else
  {
  }
  v31 = [v6 characteristicType];
  if ([v31 isEqual:@"0x000000003000005E"])
  {
    v32 = [v6 uniqueIdentifier];
    v33 = [(CAFHistoricalNotification *)self symbolNameCharacteristic];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self symbolName];
      [v14 historicalNotificationService:self didUpdateSymbolName:v15];
      goto LABEL_28;
    }
  }
  else
  {
  }
  v36 = [v6 characteristicType];
  if ([v36 isEqual:@"0x0000000049000002"])
  {
    v37 = [v6 uniqueIdentifier];
    v38 = [(CAFHistoricalNotification *)self notificationSeverityCharacteristic];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      v14 = [(CAFService *)self observers];
      objc_msgSend(v14, "historicalNotificationService:didUpdateNotificationSeverity:", self, -[CAFHistoricalNotification notificationSeverity](self, "notificationSeverity"));
      goto LABEL_29;
    }
  }
  else
  {
  }
  v41 = [v6 characteristicType];
  if ([v41 isEqual:@"0x0000000049000005"])
  {
    v42 = [v6 uniqueIdentifier];
    v43 = [(CAFHistoricalNotification *)self historicalNotificationUserActionsCharacteristic];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      v14 = [(CAFService *)self observers];
      v15 = [(CAFHistoricalNotification *)self historicalNotificationUserActions];
      [v14 historicalNotificationService:self didUpdateHistoricalNotificationUserActions:v15];
      goto LABEL_28;
    }
  }
  else
  {
  }
  v46 = [v6 characteristicType];
  if ([v46 isEqual:@"0x0000000036000063"])
  {
    v47 = [v6 uniqueIdentifier];
    v48 = [(CAFHistoricalNotification *)self userDismissibleCharacteristic];
    v49 = [v48 uniqueIdentifier];
    int v50 = [v47 isEqual:v49];

    if (v50)
    {
      v14 = [(CAFService *)self observers];
      objc_msgSend(v14, "historicalNotificationService:didUpdateUserDismissible:", self, -[CAFHistoricalNotification userDismissible](self, "userDismissible"));
      goto LABEL_29;
    }
  }
  else
  {
  }
  v51 = [v6 characteristicType];
  if ([v51 isEqual:@"0x0000000036000023"])
  {
    v52 = [v6 uniqueIdentifier];
    v53 = [(CAFHistoricalNotification *)self hiddenCharacteristic];
    v54 = [v53 uniqueIdentifier];
    int v55 = [v52 isEqual:v54];

    if (v55)
    {
      v14 = [(CAFService *)self observers];
      objc_msgSend(v14, "historicalNotificationService:didUpdateHidden:", self, -[CAFHistoricalNotification hidden](self, "hidden"));
      goto LABEL_29;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000037000003"])
  {
    v56 = [v6 uniqueIdentifier];
    v57 = [(CAFHistoricalNotification *)self userActionCharacteristic];
    v58 = [v57 uniqueIdentifier];
    int v59 = [v56 isEqual:v58];

    if (!v59) {
      goto LABEL_30;
    }
    v14 = [(CAFService *)self observers];
    objc_msgSend(v14, "historicalNotificationService:didUpdateUserAction:", self, -[CAFHistoricalNotification userAction](self, "userAction"));
  }
LABEL_29:

LABEL_30:
  v60.receiver = self;
  v60.super_class = (Class)CAFHistoricalNotification;
  [(CAFService *)&v60 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForUserVisibleLabel
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000005"];

  return v10;
}

- (BOOL)registeredForUserVisibleFullDescription
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000049000004"];

  return v10;
}

- (BOOL)registeredForTimestamp
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000049000003"];

  return v10;
}

- (BOOL)registeredForSymbolName
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005E"];

  return v10;
}

- (BOOL)registeredForNotificationSeverity
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000049000002"];

  return v10;
}

- (BOOL)registeredForHistoricalNotificationUserActions
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000049000005"];

  return v10;
}

- (BOOL)registeredForUserDismissible
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000063"];

  return v10;
}

- (BOOL)registeredForHidden
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000023"];

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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000037000003"];

  return v10;
}

@end