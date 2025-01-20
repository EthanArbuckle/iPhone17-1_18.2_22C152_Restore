@interface CAFEqualizer
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)hasUserVisibleLabel;
- (BOOL)registeredForEqualizerType;
- (BOOL)registeredForEqualizerValue;
- (BOOL)registeredForSortOrder;
- (BOOL)registeredForUserVisibleLabel;
- (CAFEqualizerTypeCharacteristic)typeCharacteristic;
- (CAFInt8Characteristic)valueCharacteristic;
- (CAFInt8Range)valueRange;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFUInt8Characteristic)sortOrderCharacteristic;
- (NSString)userVisibleLabel;
- (char)value;
- (id)name;
- (unsigned)sortOrder;
- (unsigned)type;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setValue:(char)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFEqualizer

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFEqualizer;
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
  v6.super_class = (Class)CAFEqualizer;
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
  v6.super_class = (Class)CAFEqualizer;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFEqualizer *)self typeCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFEqualizer *)self sortOrderCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFEqualizerTypeCharacteristic)typeCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFEqualizerTypeCharacteristic *)v11;
}

- (unsigned)type
{
  objc_super v2 = [(CAFEqualizer *)self typeCharacteristic];
  unsigned __int8 v3 = [v2 equalizerTypeValue];

  return v3;
}

- (CAFUInt8Characteristic)sortOrderCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFEqualizer *)self sortOrderCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (CAFInt8Characteristic)valueCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000033000008"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000033000008"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFInt8Characteristic *)v11;
}

- (char)value
{
  objc_super v2 = [(CAFEqualizer *)self valueCharacteristic];
  char v3 = [v2 int8Value];

  return v3;
}

- (void)setValue:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFEqualizer *)self valueCharacteristic];
  [v4 setInt8Value:v3];
}

- (CAFInt8Range)valueRange
{
  objc_super v2 = [(CAFEqualizer *)self valueCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFInt8Range *)v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFEqualizer *)self userVisibleLabelCharacteristic];
  uint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleLabel
{
  objc_super v2 = [(CAFEqualizer *)self userVisibleLabelCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000013000003";
}

+ (id)observerProtocol
{
  return &unk_26FDB1EC8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000033000007"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFEqualizer *)self typeCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "equalizerService:didUpdateType:", self, -[CAFEqualizer type](self, "type"));
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000030000003"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFEqualizer *)self sortOrderCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v18 = [(CAFService *)self observers];
      objc_msgSend(v18, "equalizerService:didUpdateSortOrder:", self, -[CAFEqualizer sortOrder](self, "sortOrder"));

      v12 = [(CAFService *)self observers];
      v19 = [(CAFEqualizer *)self name];
      [v12 equalizerService:self didUpdateName:v19];
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
  }
  v20 = [v6 characteristicType];
  if ([v20 isEqual:@"0x0000000033000008"])
  {
    v21 = [v6 uniqueIdentifier];
    v22 = [(CAFEqualizer *)self valueCharacteristic];
    v23 = [v22 uniqueIdentifier];
    int v24 = [v21 isEqual:v23];

    if (v24)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "equalizerService:didUpdateValue:", self, -[CAFEqualizer value](self, "value"));
      goto LABEL_17;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000001"]) {
    goto LABEL_17;
  }
  v25 = [v6 uniqueIdentifier];
  v26 = [(CAFEqualizer *)self userVisibleLabelCharacteristic];
  v27 = [v26 uniqueIdentifier];
  int v28 = [v25 isEqual:v27];

  if (v28)
  {
    v12 = [(CAFService *)self observers];
    v19 = [(CAFEqualizer *)self userVisibleLabel];
    [v12 equalizerService:self didUpdateUserVisibleLabel:v19];
    goto LABEL_16;
  }
LABEL_18:
  v29.receiver = self;
  v29.super_class = (Class)CAFEqualizer;
  [(CAFService *)&v29 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForEqualizerType
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000007"];

  return v10;
}

- (BOOL)registeredForSortOrder
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  return v10;
}

- (BOOL)registeredForEqualizerValue
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000033000008"];

  return v10;
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

@end