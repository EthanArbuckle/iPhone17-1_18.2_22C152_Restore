@interface CAFSingleSelectImageSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForCurrentUserVisibleValue;
- (BOOL)registeredForImageList;
- (BOOL)registeredForListUserVisibleValue;
- (CAFArrayCharacteristic)imagesCharacteristic;
- (CAFArrayCharacteristic)listUserVisibleValueCharacteristic;
- (CAFUInt8Characteristic)currentUserVisibleValueCharacteristic;
- (CAFUInt8Range)currentUserVisibleValueRange;
- (NSArray)images;
- (NSArray)listUserVisibleValue;
- (id)name;
- (unsigned)currentUserVisibleValue;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setCurrentUserVisibleValue:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFSingleSelectImageSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSingleSelectImageSetting;
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
  v6.super_class = (Class)CAFSingleSelectImageSetting;
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
  v6.super_class = (Class)CAFSingleSelectImageSetting;
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

- (CAFUInt8Characteristic)currentUserVisibleValueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000008"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000008"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)currentUserVisibleValue
{
  objc_super v2 = [(CAFSingleSelectImageSetting *)self currentUserVisibleValueCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setCurrentUserVisibleValue:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFSingleSelectImageSetting *)self currentUserVisibleValueCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)currentUserVisibleValueRange
{
  objc_super v2 = [(CAFSingleSelectImageSetting *)self currentUserVisibleValueCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (CAFArrayCharacteristic)listUserVisibleValueCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)listUserVisibleValue
{
  objc_super v2 = [(CAFSingleSelectImageSetting *)self listUserVisibleValueCharacteristic];
  uint64_t v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (CAFArrayCharacteristic)imagesCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000018"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000018"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)images
{
  objc_super v2 = [(CAFSingleSelectImageSetting *)self imagesCharacteristic];
  uint64_t v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000016";
}

+ (id)observerProtocol
{
  return &unk_26FDB47B8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000008"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFSingleSelectImageSetting *)self currentUserVisibleValueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "singleSelectImageSettingService:didUpdateCurrentUserVisibleValue:", self, -[CAFSingleSelectImageSetting currentUserVisibleValue](self, "currentUserVisibleValue"));
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000036000007"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFSingleSelectImageSetting *)self listUserVisibleValueCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFSingleSelectImageSetting *)self listUserVisibleValue];
      [v12 singleSelectImageSettingService:self didUpdateListUserVisibleValue:v18];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000018"]) {
    goto LABEL_13;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFSingleSelectImageSetting *)self imagesCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    v18 = [(CAFSingleSelectImageSetting *)self images];
    [v12 singleSelectImageSettingService:self didUpdateImages:v18];
    goto LABEL_12;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFSingleSelectImageSetting;
  [(CAFAutomakerSetting *)&v23 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForCurrentUserVisibleValue
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000008"];

  return v10;
}

- (BOOL)registeredForListUserVisibleValue
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000007"];

  return v10;
}

- (BOOL)registeredForImageList
{
  uint64_t v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000018"];

  return v10;
}

@end