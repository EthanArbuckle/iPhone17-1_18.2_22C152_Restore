@interface CAFModeItems
+ (void)load;
- (BOOL)currentIndexInvalid;
- (BOOL)registeredForCurrentIndex;
- (BOOL)registeredForIdentifiers;
- (CAFArrayCharacteristic)identifiersCharacteristic;
- (CAFUInt32Characteristic)currentIndexCharacteristic;
- (CAFUInt32Range)currentIndexRange;
- (NSArray)identifiers;
- (unsigned)currentIndex;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFModeItems

+ (void)load
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___CAFModeItems;
    objc_msgSendSuper2(&v4, sel_load);
  }
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
  v6.super_class = (Class)CAFModeItems;
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
  v6.super_class = (Class)CAFModeItems;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFArrayCharacteristic)identifiersCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000037"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000037"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)identifiers
{
  v2 = [(CAFModeItems *)self identifiersCharacteristic];
  uint64_t v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (CAFUInt32Characteristic)currentIndexCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000038"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000038"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt32Characteristic *)v11;
}

- (unsigned)currentIndex
{
  v2 = [(CAFModeItems *)self currentIndexCharacteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (CAFUInt32Range)currentIndexRange
{
  v2 = [(CAFModeItems *)self currentIndexCharacteristic];
  unsigned int v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (BOOL)currentIndexInvalid
{
  v2 = [(CAFModeItems *)self currentIndexCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000037"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFModeItems *)self identifiersCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFModeItems *)self identifiers];
      [v12 modeItemsService:self didUpdateIdentifiers:v13];

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000030000038"]) {
    goto LABEL_8;
  }
  v14 = [v6 uniqueIdentifier];
  v15 = [(CAFModeItems *)self currentIndexCharacteristic];
  v16 = [v15 uniqueIdentifier];
  int v17 = [v14 isEqual:v16];

  if (v17)
  {
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "modeItemsService:didUpdateCurrentIndex:", self, -[CAFModeItems currentIndex](self, "currentIndex"));
    goto LABEL_8;
  }
LABEL_9:
  v18.receiver = self;
  v18.super_class = (Class)CAFModeItems;
  [(CAFService *)&v18 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForIdentifiers
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000037"];

  return v10;
}

- (BOOL)registeredForCurrentIndex
{
  char v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000038"];

  return v10;
}

@end