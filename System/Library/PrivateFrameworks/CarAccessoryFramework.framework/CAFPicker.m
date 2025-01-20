@interface CAFPicker
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForDisplayPanelIdentifier;
- (BOOL)registeredForDisplayZoneIdentifier;
- (BOOL)registeredForEntryList;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForSelectedEntryIndex;
- (BOOL)registeredForUserSelectionEnabled;
- (BOOL)userSelectionEnabled;
- (CAFBoolCharacteristic)userSelectionEnabledCharacteristic;
- (CAFEntryList)entryList;
- (CAFEntryListCharacteristic)entryListCharacteristic;
- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic;
- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic;
- (CAFUInt8Range)selectedEntryIndexRange;
- (NSString)displayPanelIdentifier;
- (NSString)displayZoneIdentifier;
- (NSString)identifier;
- (unsigned)selectedEntryIndex;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setSelectedEntryIndex:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFPicker

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPicker;
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
  v6.super_class = (Class)CAFPicker;
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
  v6.super_class = (Class)CAFPicker;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFStringCharacteristic)identifierCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFPicker *)self identifierCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFEntryListCharacteristic)entryListCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003000005D"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003000005D"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFEntryListCharacteristic *)v11;
}

- (CAFEntryList)entryList
{
  objc_super v2 = [(CAFPicker *)self entryListCharacteristic];
  v3 = [v2 entryListValue];

  return (CAFEntryList *)v3;
}

- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000061"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000061"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)selectedEntryIndex
{
  objc_super v2 = [(CAFPicker *)self selectedEntryIndexCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setSelectedEntryIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFPicker *)self selectedEntryIndexCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)selectedEntryIndexRange
{
  objc_super v2 = [(CAFPicker *)self selectedEntryIndexCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (CAFBoolCharacteristic)userSelectionEnabledCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x000000003700000A"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x000000003700000A"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)userSelectionEnabled
{
  objc_super v2 = [(CAFPicker *)self userSelectionEnabledCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (CAFStringCharacteristic)displayPanelIdentifierCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFPicker *)self displayPanelIdentifierCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)displayZoneIdentifierCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFPicker *)self displayZoneIdentifierCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000017000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB4CB0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000019"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFPicker *)self identifierCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFPicker *)self identifier];
      [v12 pickerService:self didUpdateIdentifier:v13];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x000000003000005D"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFPicker *)self entryListCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFPicker *)self entryList];
      [v12 pickerService:self didUpdateEntryList:v13];
      goto LABEL_24;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000061"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFPicker *)self selectedEntryIndexCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "pickerService:didUpdateSelectedEntryIndex:", self, -[CAFPicker selectedEntryIndex](self, "selectedEntryIndex"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x000000003700000A"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFPicker *)self userSelectionEnabledCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "pickerService:didUpdateUserSelectionEnabled:", self, -[CAFPicker userSelectionEnabled](self, "userSelectionEnabled"));
      goto LABEL_25;
    }
  }
  else
  {
  }
  v29 = [v6 characteristicType];
  if ([v29 isEqual:@"0x0000000037000007"])
  {
    v30 = [v6 uniqueIdentifier];
    v31 = [(CAFPicker *)self displayPanelIdentifierCharacteristic];
    v32 = [v31 uniqueIdentifier];
    int v33 = [v30 isEqual:v32];

    if (v33)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFPicker *)self displayPanelIdentifier];
      [v12 pickerService:self didUpdateDisplayPanelIdentifier:v13];
      goto LABEL_24;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x000000003700000B"])
  {
LABEL_25:

    goto LABEL_26;
  }
  v34 = [v6 uniqueIdentifier];
  v35 = [(CAFPicker *)self displayZoneIdentifierCharacteristic];
  v36 = [v35 uniqueIdentifier];
  int v37 = [v34 isEqual:v36];

  if (v37)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFPicker *)self displayZoneIdentifier];
    [v12 pickerService:self didUpdateDisplayZoneIdentifier:v13];
    goto LABEL_24;
  }
LABEL_26:
  v38.receiver = self;
  v38.super_class = (Class)CAFPicker;
  [(CAFService *)&v38 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForIdentifier
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000019"];

  return v10;
}

- (BOOL)registeredForEntryList
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005D"];

  return v10;
}

- (BOOL)registeredForSelectedEntryIndex
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000061"];

  return v10;
}

- (BOOL)registeredForUserSelectionEnabled
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003700000A"];

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
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003700000B"];

  return v10;
}

@end