@interface CAFMultipleSelectImageSetting
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)registeredForImageList;
- (BOOL)registeredForIndicesUserVisibleValue;
- (BOOL)registeredForListUserVisibleValue;
- (CAFArrayCharacteristic)imagesCharacteristic;
- (CAFArrayCharacteristic)indicesUserVisibleValueCharacteristic;
- (CAFArrayCharacteristic)listUserVisibleValueCharacteristic;
- (NSArray)images;
- (NSArray)indicesUserVisibleValue;
- (NSArray)listUserVisibleValue;
- (id)name;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setIndicesUserVisibleValue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFMultipleSelectImageSetting

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMultipleSelectImageSetting;
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
  v6.super_class = (Class)CAFMultipleSelectImageSetting;
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
  v6.super_class = (Class)CAFMultipleSelectImageSetting;
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

- (CAFArrayCharacteristic)indicesUserVisibleValueCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000009"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000009"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)indicesUserVisibleValue
{
  objc_super v2 = [(CAFMultipleSelectImageSetting *)self indicesUserVisibleValueCharacteristic];
  v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (void)setIndicesUserVisibleValue:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFMultipleSelectImageSetting *)self indicesUserVisibleValueCharacteristic];
  [v5 setArrayValue:v4];
}

- (CAFArrayCharacteristic)listUserVisibleValueCharacteristic
{
  v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFMultipleSelectImageSetting *)self listUserVisibleValueCharacteristic];
  v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (CAFArrayCharacteristic)imagesCharacteristic
{
  v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFMultipleSelectImageSetting *)self imagesCharacteristic];
  v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000016000017";
}

+ (id)observerProtocol
{
  return &unk_26FDB1FC8;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000009"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFMultipleSelectImageSetting *)self indicesUserVisibleValueCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFMultipleSelectImageSetting *)self indicesUserVisibleValue];
      [v12 multipleSelectImageSettingService:self didUpdateIndicesUserVisibleValue:v13];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000036000007"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFMultipleSelectImageSetting *)self listUserVisibleValueCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFMultipleSelectImageSetting *)self listUserVisibleValue];
      [v12 multipleSelectImageSettingService:self didUpdateListUserVisibleValue:v13];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000018"])
  {
LABEL_13:

    goto LABEL_14;
  }
  v19 = [v6 uniqueIdentifier];
  v20 = [(CAFMultipleSelectImageSetting *)self imagesCharacteristic];
  v21 = [v20 uniqueIdentifier];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFMultipleSelectImageSetting *)self images];
    [v12 multipleSelectImageSettingService:self didUpdateImages:v13];
    goto LABEL_12;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFMultipleSelectImageSetting;
  [(CAFAutomakerSetting *)&v23 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForIndicesUserVisibleValue
{
  v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000009"];

  return v10;
}

- (BOOL)registeredForListUserVisibleValue
{
  v3 = [(CAFService *)self car];
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
  v3 = [(CAFService *)self car];
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