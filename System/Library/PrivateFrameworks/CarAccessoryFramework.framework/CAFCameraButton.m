@interface CAFCameraButton
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)disabled;
- (BOOL)hasButtonAction;
- (BOOL)hasChildrenIdentifiers;
- (BOOL)hasContentURLAction;
- (BOOL)hasDisabled;
- (BOOL)hasHidden;
- (BOOL)hasSelected;
- (BOOL)hasSelectedEntryIndex;
- (BOOL)hidden;
- (BOOL)registeredForButtonAction;
- (BOOL)registeredForChildrenIdentifiers;
- (BOOL)registeredForContentURLAction;
- (BOOL)registeredForDisabled;
- (BOOL)registeredForHidden;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForSelected;
- (BOOL)registeredForSelectedEntryIndex;
- (BOOL)registeredForSortOrder;
- (BOOL)registeredForSymbolName;
- (BOOL)selected;
- (CAFArrayCharacteristic)childrenIdentifiersCharacteristic;
- (CAFBoolCharacteristic)disabledCharacteristic;
- (CAFBoolCharacteristic)hiddenCharacteristic;
- (CAFBoolCharacteristic)selectedCharacteristic;
- (CAFButtonActionCharacteristic)buttonActionCharacteristic;
- (CAFStringCharacteristic)contentURLActionCharacteristic;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFStringCharacteristic)symbolNameCharacteristic;
- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic;
- (CAFUInt8Characteristic)sortOrderCharacteristic;
- (CAFUInt8Range)selectedEntryIndexRange;
- (NSArray)childrenIdentifiers;
- (NSString)contentURLAction;
- (NSString)identifier;
- (NSString)symbolName;
- (id)name;
- (unsigned)buttonAction;
- (unsigned)selectedEntryIndex;
- (unsigned)sortOrder;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setButtonAction:(unsigned __int8)a3;
- (void)setSelectedEntryIndex:(unsigned __int8)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFCameraButton

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFCameraButton;
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
  v6.super_class = (Class)CAFCameraButton;
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
  v6.super_class = (Class)CAFCameraButton;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (id)name
{
  v3 = [(CAFService *)self typeName];
  id v4 = [(CAFCameraButton *)self symbolNameCharacteristic];
  id v5 = [v4 formattedValue];

  if ([v5 length])
  {
    uint64_t v6 = [v3 stringByAppendingFormat:@"-%@", v5];

    v3 = (void *)v6;
  }
  v7 = [(CAFCameraButton *)self sortOrderCharacteristic];
  v8 = [v7 formattedValue];

  if ([v8 length])
  {
    uint64_t v9 = [v3 stringByAppendingFormat:@"-%@", v8];

    v3 = (void *)v9;
  }

  return v3;
}

- (CAFButtonActionCharacteristic)buttonActionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000010"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000010"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFButtonActionCharacteristic *)v11;
}

- (unsigned)buttonAction
{
  objc_super v2 = [(CAFCameraButton *)self buttonActionCharacteristic];
  unsigned __int8 v3 = [v2 buttonActionValue];

  return v3;
}

- (void)setButtonAction:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFCameraButton *)self buttonActionCharacteristic];
  [v4 setButtonActionValue:v3];
}

- (BOOL)hasButtonAction
{
  objc_super v2 = [(CAFCameraButton *)self buttonActionCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)contentURLActionCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000066"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000066"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)contentURLAction
{
  objc_super v2 = [(CAFCameraButton *)self contentURLActionCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasContentURLAction
{
  objc_super v2 = [(CAFCameraButton *)self contentURLActionCharacteristic];
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
  objc_super v2 = [(CAFCameraButton *)self sortOrderCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (CAFStringCharacteristic)symbolNameCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFCameraButton *)self symbolNameCharacteristic];
  unsigned __int8 v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)disabledCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFCameraButton *)self disabledCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasDisabled
{
  objc_super v2 = [(CAFCameraButton *)self disabledCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)selectedCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000064"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000064"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)selected
{
  objc_super v2 = [(CAFCameraButton *)self selectedCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasSelected
{
  objc_super v2 = [(CAFCameraButton *)self selectedCharacteristic];
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
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
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
  objc_super v2 = [(CAFCameraButton *)self hiddenCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasHidden
{
  objc_super v2 = [(CAFCameraButton *)self hiddenCharacteristic];
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
  objc_super v2 = [(CAFCameraButton *)self identifierCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFArrayCharacteristic)childrenIdentifiersCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  uint64_t v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000050000001"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000050000001"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)childrenIdentifiers
{
  objc_super v2 = [(CAFCameraButton *)self childrenIdentifiersCharacteristic];
  BOOL v3 = [v2 arrayValue];

  return (NSArray *)v3;
}

- (BOOL)hasChildrenIdentifiers
{
  objc_super v2 = [(CAFCameraButton *)self childrenIdentifiersCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)selectedEntryIndexCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
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
  objc_super v2 = [(CAFCameraButton *)self selectedEntryIndexCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (void)setSelectedEntryIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(CAFCameraButton *)self selectedEntryIndexCharacteristic];
  [v4 setUint8Value:v3];
}

- (CAFUInt8Range)selectedEntryIndexRange
{
  objc_super v2 = [(CAFCameraButton *)self selectedEntryIndexCharacteristic];
  uint64_t v3 = [v2 range];

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasSelectedEntryIndex
{
  objc_super v2 = [(CAFCameraButton *)self selectedEntryIndexCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x000000001F000002";
}

+ (id)observerProtocol
{
  return &unk_26FDB5E50;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000036000010"])
  {
    v8 = [v6 uniqueIdentifier];
    uint64_t v9 = [(CAFCameraButton *)self buttonActionCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cameraButtonService:didUpdateButtonAction:", self, -[CAFCameraButton buttonAction](self, "buttonAction"));
      goto LABEL_18;
    }
  }
  else
  {
  }
  v13 = [v6 characteristicType];
  if ([v13 isEqual:@"0x0000000036000066"])
  {
    v14 = [v6 uniqueIdentifier];
    v15 = [(CAFCameraButton *)self contentURLActionCharacteristic];
    v16 = [v15 uniqueIdentifier];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFCameraButton *)self contentURLAction];
      [v12 cameraButtonService:self didUpdateContentURLAction:v18];
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000003"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFCameraButton *)self sortOrderCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v24 = [(CAFService *)self observers];
      objc_msgSend(v24, "cameraButtonService:didUpdateSortOrder:", self, -[CAFCameraButton sortOrder](self, "sortOrder"));
LABEL_16:

      v12 = [(CAFService *)self observers];
      v18 = [(CAFCameraButton *)self name];
      [v12 cameraButtonService:self didUpdateName:v18];
      goto LABEL_17;
    }
  }
  else
  {
  }
  v25 = [v6 characteristicType];
  if ([v25 isEqual:@"0x000000003000005E"])
  {
    v26 = [v6 uniqueIdentifier];
    v27 = [(CAFCameraButton *)self symbolNameCharacteristic];
    v28 = [v27 uniqueIdentifier];
    int v29 = [v26 isEqual:v28];

    if (v29)
    {
      v24 = [(CAFService *)self observers];
      v30 = [(CAFCameraButton *)self symbolName];
      [v24 cameraButtonService:self didUpdateSymbolName:v30];

      goto LABEL_16;
    }
  }
  else
  {
  }
  v31 = [v6 characteristicType];
  if ([v31 isEqual:@"0x0000000032000011"])
  {
    v32 = [v6 uniqueIdentifier];
    v33 = [(CAFCameraButton *)self disabledCharacteristic];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cameraButtonService:didUpdateDisabled:", self, -[CAFCameraButton disabled](self, "disabled"));
      goto LABEL_18;
    }
  }
  else
  {
  }
  v36 = [v6 characteristicType];
  if ([v36 isEqual:@"0x0000000036000064"])
  {
    v37 = [v6 uniqueIdentifier];
    v38 = [(CAFCameraButton *)self selectedCharacteristic];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cameraButtonService:didUpdateSelected:", self, -[CAFCameraButton selected](self, "selected"));
      goto LABEL_18;
    }
  }
  else
  {
  }
  v41 = [v6 characteristicType];
  if ([v41 isEqual:@"0x0000000036000023"])
  {
    v42 = [v6 uniqueIdentifier];
    v43 = [(CAFCameraButton *)self hiddenCharacteristic];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "cameraButtonService:didUpdateHidden:", self, -[CAFCameraButton hidden](self, "hidden"));
      goto LABEL_18;
    }
  }
  else
  {
  }
  v46 = [v6 characteristicType];
  if ([v46 isEqual:@"0x0000000030000019"])
  {
    v47 = [v6 uniqueIdentifier];
    v48 = [(CAFCameraButton *)self identifierCharacteristic];
    v49 = [v48 uniqueIdentifier];
    int v50 = [v47 isEqual:v49];

    if (v50)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFCameraButton *)self identifier];
      [v12 cameraButtonService:self didUpdateIdentifier:v18];
      goto LABEL_17;
    }
  }
  else
  {
  }
  v51 = [v6 characteristicType];
  if ([v51 isEqual:@"0x0000000050000001"])
  {
    v52 = [v6 uniqueIdentifier];
    v53 = [(CAFCameraButton *)self childrenIdentifiersCharacteristic];
    v54 = [v53 uniqueIdentifier];
    int v55 = [v52 isEqual:v54];

    if (v55)
    {
      v12 = [(CAFService *)self observers];
      v18 = [(CAFCameraButton *)self childrenIdentifiers];
      [v12 cameraButtonService:self didUpdateChildrenIdentifiers:v18];
      goto LABEL_17;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if ([v12 isEqual:@"0x0000000030000061"])
  {
    v56 = [v6 uniqueIdentifier];
    v57 = [(CAFCameraButton *)self selectedEntryIndexCharacteristic];
    v58 = [v57 uniqueIdentifier];
    int v59 = [v56 isEqual:v58];

    if (!v59) {
      goto LABEL_19;
    }
    v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "cameraButtonService:didUpdateSelectedEntryIndex:", self, -[CAFCameraButton selectedEntryIndex](self, "selectedEntryIndex"));
  }
LABEL_18:

LABEL_19:
  v60.receiver = self;
  v60.super_class = (Class)CAFCameraButton;
  [(CAFService *)&v60 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (BOOL)registeredForButtonAction
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000010"];

  return v10;
}

- (BOOL)registeredForContentURLAction
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000066"];

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

- (BOOL)registeredForSymbolName
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x000000003000005E"];

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
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000011"];

  return v10;
}

- (BOOL)registeredForSelected
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000064"];

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
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000023"];

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

- (BOOL)registeredForChildrenIdentifiers
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  uint64_t v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000050000001"];

  return v10;
}

- (BOOL)registeredForSelectedEntryIndex
{
  BOOL v3 = [(CAFService *)self car];
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