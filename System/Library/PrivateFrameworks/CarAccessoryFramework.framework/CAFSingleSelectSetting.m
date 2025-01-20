@interface CAFSingleSelectSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForSelectSettingEntryList;
- (BOOL)registeredForSelectedEntryIndex;
- (CAFSelectSettingEntryList)selectSettingEntryList;
- (CAFSelectSettingEntryListCharacteristic)selectSettingEntryListCharacteristic;
- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic;
- (CAFUInt8Range)selectedEntryIndexRange;
- (id)name;
- (unsigned)selectedEntryIndex;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setSelectedEntryIndex:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSingleSelectSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSingleSelectSetting;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA93F8]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFSingleSelectSetting;
  [(CAFAutomakerSetting *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA93F8]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFSingleSelectSetting;
  [(CAFAutomakerSetting *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFAutomakerSetting *)self categoryCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFAutomakerSetting *)self userVisibleLabelCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFSelectSettingEntryListCharacteristic)selectSettingEntryListCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000024"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000024"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSelectSettingEntryListCharacteristic *)v11;
}

- (CAFSelectSettingEntryList)selectSettingEntryList
{
  objc_super v2 = [(CAFSingleSelectSetting *)self selectSettingEntryListCharacteristic];
  v3 = [v2 selectSettingEntryListValue];

  return (CAFSelectSettingEntryList *)v3;
}

- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFSingleSelectSetting *)self selectedEntryIndexCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setSelectedEntryIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFSingleSelectSetting *)self selectedEntryIndexCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)selectedEntryIndexRange
{
  objc_super v2 = [(CAFSingleSelectSetting *)self selectedEntryIndexCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000004";
}

+ (id)observerProtocol
{
  return &unk_26FDB0F20;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000024"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFSingleSelectSetting *)self selectSettingEntryListCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSingleSelectSetting *)self selectSettingEntryList];
      [v12 singleSelectSettingService:self didUpdateSelectSettingEntryList:v13];

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000061"]) {
    goto LABEL_8;
  }
  v14 = [v6 uniqueIdentifier];
  v15 = [(CAFSingleSelectSetting *)self selectedEntryIndexCharacteristic];
  v16 = [v15 uniqueIdentifier];
  int v17 = [v14 isEqual:v16];

  if (v17)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "singleSelectSettingService:didUpdateSelectedEntryIndex:", self, -[CAFSingleSelectSetting selectedEntryIndex](self, "selectedEntryIndex"));
    goto LABEL_8;
  }
LABEL_9:
  v18.receiver = self;
  v18.super_class = (Class)CAFSingleSelectSetting;
  [(CAFAutomakerSetting *)&v18 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForSelectSettingEntryList
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000024"];

  return v10;
}

- (BOOL)registeredForSelectedEntryIndex
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000061"];

  return v10;
}

@end