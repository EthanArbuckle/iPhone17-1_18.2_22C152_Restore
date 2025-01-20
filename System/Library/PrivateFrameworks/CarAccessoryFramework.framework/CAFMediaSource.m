@interface CAFMediaSource
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (id)typeComparator;
+ (void)load;
- (BOOL)currentFrequencyInvalid;
- (BOOL)currentMediaItemIdentifierInvalid;
- (BOOL)disabled;
- (BOOL)hasCurrentFrequency;
- (BOOL)hasCurrentMediaItemIdentifier;
- (BOOL)hasMediaItemImages;
- (BOOL)hasMediaItems;
- (BOOL)hasUserVisibleLabel;
- (BOOL)registeredForCurrentFrequency;
- (BOOL)registeredForCurrentMediaItemIdentifier;
- (BOOL)registeredForDisabled;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForMediaItemImages;
- (BOOL)registeredForMediaItems;
- (BOOL)registeredForMediaSourceSemanticType;
- (BOOL)registeredForUserVisibleLabel;
- (CAFBoolCharacteristic)disabledCharacteristic;
- (CAFMediaItemImages)mediaItemImages;
- (CAFMediaItemImagesCharacteristic)mediaItemImagesCharacteristic;
- (CAFMediaItems)mediaItems;
- (CAFMediaItemsCharacteristic)mediaItemsCharacteristic;
- (CAFMediaSourceSemanticTypeCharacteristic)mediaSourceSemanticTypeCharacteristic;
- (CAFStringCharacteristic)currentMediaItemIdentifierCharacteristic;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFUInt32Characteristic)currentFrequencyCharacteristic;
- (CAFUInt32Range)currentFrequencyRange;
- (NSString)currentMediaItemIdentifier;
- (NSString)identifier;
- (NSString)userVisibleLabel;
- (id)name;
- (int64_t)typeCompare:(id)a3;
- (unsigned)currentFrequency;
- (unsigned)mediaSourceSemanticType;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFMediaSource

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaSource;
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
  v6.super_class = (Class)CAFMediaSource;
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
  v6.super_class = (Class)CAFMediaSource;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFMediaSource *)self userVisibleLabelCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFUInt32Characteristic)currentFrequencyCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000007"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000007"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFUInt32Characteristic *)v11;
}

- (unsigned)currentFrequency
{
  objc_super v2 = [(CAFMediaSource *)self currentFrequencyCharacteristic];
  unsigned int v3 = [v2 uint32Value];

  return v3;
}

- (CAFUInt32Range)currentFrequencyRange
{
  objc_super v2 = [(CAFMediaSource *)self currentFrequencyCharacteristic];
  unsigned int v3 = [v2 range];

  return (CAFUInt32Range *)v3;
}

- (BOOL)hasCurrentFrequency
{
  objc_super v2 = [(CAFMediaSource *)self currentFrequencyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)currentFrequencyInvalid
{
  objc_super v2 = [(CAFMediaSource *)self currentFrequencyCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFStringCharacteristic)currentMediaItemIdentifierCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000026"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000026"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)currentMediaItemIdentifier
{
  objc_super v2 = [(CAFMediaSource *)self currentMediaItemIdentifierCharacteristic];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasCurrentMediaItemIdentifier
{
  objc_super v2 = [(CAFMediaSource *)self currentMediaItemIdentifierCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)currentMediaItemIdentifierInvalid
{
  objc_super v2 = [(CAFMediaSource *)self currentMediaItemIdentifierCharacteristic];
  char v3 = [v2 isInvalid];

  return v3;
}

- (CAFMediaItemsCharacteristic)mediaItemsCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000012"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000012"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMediaItemsCharacteristic *)v11;
}

- (CAFMediaItems)mediaItems
{
  objc_super v2 = [(CAFMediaSource *)self mediaItemsCharacteristic];
  char v3 = [v2 mediaItemsValue];

  return (CAFMediaItems *)v3;
}

- (BOOL)hasMediaItems
{
  objc_super v2 = [(CAFMediaSource *)self mediaItemsCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFMediaSource *)self userVisibleLabelCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleLabel
{
  objc_super v2 = [(CAFMediaSource *)self userVisibleLabelCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)identifierCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
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
  objc_super v2 = [(CAFMediaSource *)self identifierCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFMediaSourceSemanticTypeCharacteristic)mediaSourceSemanticTypeCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000025"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000025"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMediaSourceSemanticTypeCharacteristic *)v11;
}

- (unsigned)mediaSourceSemanticType
{
  objc_super v2 = [(CAFMediaSource *)self mediaSourceSemanticTypeCharacteristic];
  unsigned __int8 v3 = [v2 mediaSourceSemanticTypeValue];

  return v3;
}

- (CAFBoolCharacteristic)disabledCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000011"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000011"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)disabled
{
  objc_super v2 = [(CAFMediaSource *)self disabledCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (CAFMediaItemImagesCharacteristic)mediaItemImagesCharacteristic
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000031"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000031"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMediaItemImagesCharacteristic *)v11;
}

- (CAFMediaItemImages)mediaItemImages
{
  objc_super v2 = [(CAFMediaSource *)self mediaItemImagesCharacteristic];
  char v3 = [v2 mediaItemImagesValue];

  return (CAFMediaItemImages *)v3;
}

- (BOOL)hasMediaItemImages
{
  objc_super v2 = [(CAFMediaSource *)self mediaItemImagesCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000014000006";
}

+ (id)observerProtocol
{
  return &unk_26FDB2980;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000032000007"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFMediaSource *)self currentFrequencyCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "mediaSourceService:didUpdateCurrentFrequency:", self, -[CAFMediaSource currentFrequency](self, "currentFrequency"));
LABEL_33:

      goto LABEL_34;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000032000026"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFMediaSource *)self currentMediaItemIdentifierCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFMediaSource *)self currentMediaItemIdentifier];
      [v12 mediaSourceService:self didUpdateCurrentMediaItemIdentifier:v18];
LABEL_32:

      goto LABEL_33;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000032000012"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFMediaSource *)self mediaItemsCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFMediaSource *)self mediaItems];
      [v12 mediaSourceService:self didUpdateMediaItems:v18];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000030000001"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFMediaSource *)self userVisibleLabelCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v29 = [(CAFService *)self observers];
      v30 = [(CAFMediaSource *)self userVisibleLabel];
      [v29 mediaSourceService:self didUpdateUserVisibleLabel:v30];

      v12 = [(CAFService *)self observers];
      v18 = [(CAFMediaSource *)self name];
      [v12 mediaSourceService:self didUpdateName:v18];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v31 = [v6 characteristicType];
  if ([v31 isEqual:@"0x0000000030000019"])
  {
    v32 = [v6 uniqueIdentifier];
    v33 = [(CAFMediaSource *)self identifierCharacteristic];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFMediaSource *)self identifier];
      [v12 mediaSourceService:self didUpdateIdentifier:v18];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v36 = [v6 characteristicType];
  if ([v36 isEqual:@"0x0000000032000025"])
  {
    v37 = [v6 uniqueIdentifier];
    v38 = [(CAFMediaSource *)self mediaSourceSemanticTypeCharacteristic];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "mediaSourceService:didUpdateMediaSourceSemanticType:", self, -[CAFMediaSource mediaSourceSemanticType](self, "mediaSourceSemanticType"));
      goto LABEL_33;
    }
  }
  else
  {
  }
  v41 = [v6 characteristicType];
  if ([v41 isEqual:@"0x0000000032000011"])
  {
    v42 = [v6 uniqueIdentifier];
    v43 = [(CAFMediaSource *)self disabledCharacteristic];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "mediaSourceService:didUpdateDisabled:", self, -[CAFMediaSource disabled](self, "disabled"));
      goto LABEL_33;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000032000031"]) {
    goto LABEL_33;
  }
  v46 = [v6 uniqueIdentifier];
  v47 = [(CAFMediaSource *)self mediaItemImagesCharacteristic];
  v48 = [v47 uniqueIdentifier];
  int v49 = [v46 isEqual:v48];

  if (v49)
  {
    v12 = [(CAFService *)self observers];
    v18 = [(CAFMediaSource *)self mediaItemImages];
    [v12 mediaSourceService:self didUpdateMediaItemImages:v18];
    goto LABEL_32;
  }
LABEL_34:
  v50.receiver = self;
  v50.super_class = (Class)CAFMediaSource;
  [(CAFService *)&v50 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForCurrentFrequency
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000007"];

  return v10;
}

- (BOOL)registeredForCurrentMediaItemIdentifier
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000026"];

  return v10;
}

- (BOOL)registeredForMediaItems
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000012"];

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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000001"];

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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000019"];

  return v10;
}

- (BOOL)registeredForMediaSourceSemanticType
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000025"];

  return v10;
}

- (BOOL)registeredForDisabled
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000011"];

  return v10;
}

- (BOOL)registeredForMediaItemImages
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000031"];

  return v10;
}

- (int64_t)typeCompare:(id)a3
{
  BOOL v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedChar:", -[CAFMediaSource mediaSourceSemanticType](self, "mediaSourceSemanticType"));
  uint64_t v7 = [&unk_26FD909D8 indexOfObject:v6];

  v8 = NSNumber;
  uint64_t v9 = [v5 mediaSourceSemanticType];

  char v10 = [v8 numberWithUnsignedChar:v9];
  uint64_t v11 = [&unk_26FD909D8 indexOfObject:v10];

  int64_t v12 = -1;
  if (v7 >= v11) {
    int64_t v12 = 1;
  }
  if (v7 == v11) {
    return 0;
  }
  else {
    return v12;
  }
}

+ (id)typeComparator
{
  return &__block_literal_global_17;
}

uint64_t __41__CAFMediaSource_Compare__typeComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typeCompare:");
}

@end