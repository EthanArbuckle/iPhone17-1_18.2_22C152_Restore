@interface CAFSettingsSection
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasUserVisibleFooter;
- (BOOL)hasUserVisibleSectionName;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForSortOrder;
- (BOOL)registeredForUserVisibleFooter;
- (BOOL)registeredForUserVisibleSectionName;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFStringCharacteristic)userVisibleFooterCharacteristic;
- (CAFStringCharacteristic)userVisibleSectionNameCharacteristic;
- (CAFUInt8Characteristic)sortOrderCharacteristic;
- (NSString)identifier;
- (NSString)userVisibleFooter;
- (NSString)userVisibleSectionName;
- (id)name;
- (unsigned)sortOrder;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSettingsSection

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSettingsSection;
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
  v6.super_class = (Class)CAFSettingsSection;
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
  v6.super_class = (Class)CAFSettingsSection;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFSettingsSection *)self identifierCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFSettingsSection *)self userVisibleSectionNameCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
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
  objc_super v2 = [(CAFSettingsSection *)self identifierCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleSectionNameCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleSectionName
{
  objc_super v2 = [(CAFSettingsSection *)self userVisibleSectionNameCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleSectionName
{
  objc_super v2 = [(CAFSettingsSection *)self userVisibleSectionNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)userVisibleFooterCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000016"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000016"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleFooter
{
  objc_super v2 = [(CAFSettingsSection *)self userVisibleFooterCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleFooter
{
  objc_super v2 = [(CAFSettingsSection *)self userVisibleFooterCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)sortOrderCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)sortOrder
{
  objc_super v2 = [(CAFSettingsSection *)self sortOrderCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000020";
}

+ (id)observerProtocol
{
  return &unk_26FDB3F98;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000019"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFSettingsSection *)self identifierCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSettingsSection *)self identifier];
      [v12 settingsSectionService:self didUpdateIdentifier:v13];
LABEL_8:

      v19 = [(CAFService *)self observers];
      v20 = [(CAFSettingsSection *)self name];
      [v19 settingsSectionService:self didUpdateName:v20];
LABEL_13:

LABEL_18:
      goto LABEL_19;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000036000004"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFSettingsSection *)self userVisibleSectionNameCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFSettingsSection *)self userVisibleSectionName];
      [v12 settingsSectionService:self didUpdateUserVisibleSectionName:v13];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v21 = [v6 characteristicType];
  if ([v21 isEqual:@"0x0000000030000016"])
  {
    v22 = [v6 uniqueIdentifier];
    v23 = [(CAFSettingsSection *)self userVisibleFooterCharacteristic];
    v24 = [v23 uniqueIdentifier];
    int v25 = [v22 isEqual:v24];

    if (v25)
    {
      v19 = [(CAFService *)self observers];
      v20 = [(CAFSettingsSection *)self userVisibleFooter];
      [v19 settingsSectionService:self didUpdateUserVisibleFooter:v20];
      goto LABEL_13;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if (![v19 isEqual:@"0x0000000030000003"]) {
    goto LABEL_18;
  }
  v26 = [v6 uniqueIdentifier];
  v27 = [(CAFSettingsSection *)self sortOrderCharacteristic];
  v28 = [v27 uniqueIdentifier];
  int v29 = [v26 isEqual:v28];

  if (v29)
  {
    v19 = [(CAFService *)self observers];
    objc_msgSend(v19, "settingsSectionService:didUpdateSortOrder:", self, -[CAFSettingsSection sortOrder](self, "sortOrder"));
    goto LABEL_18;
  }
LABEL_19:
  v30.receiver = self;
  v30.super_class = (Class)CAFSettingsSection;
  [(CAFService *)&v30 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForIdentifier
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000019"];

  return v10;
}

- (BOOL)registeredForUserVisibleSectionName
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000004"];

  return v10;
}

- (BOOL)registeredForUserVisibleFooter
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000016"];

  return v10;
}

- (BOOL)registeredForSortOrder
{
  unsigned __int8 v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  return v10;
}

@end