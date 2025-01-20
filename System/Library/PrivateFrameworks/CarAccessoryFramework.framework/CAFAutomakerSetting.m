@interface CAFAutomakerSetting
+ (void)load;
- (BOOL)disabled;
- (BOOL)hasDisabled;
- (BOOL)hasHidden;
- (BOOL)hasLimitableUIElement;
- (BOOL)hasProminenceInfo;
- (BOOL)hasSectionIdentifier;
- (BOOL)hasShowAudioBrandLogo;
- (BOOL)hasSortOrder;
- (BOOL)hasSymbolName;
- (BOOL)hasVehicleLayoutKey;
- (BOOL)hidden;
- (BOOL)limitableUIElement;
- (BOOL)registeredForDisabled;
- (BOOL)registeredForHidden;
- (BOOL)registeredForIdentifier;
- (BOOL)registeredForLimitableUIElement;
- (BOOL)registeredForProminenceInfo;
- (BOOL)registeredForSectionIdentifier;
- (BOOL)registeredForSettingsCategory;
- (BOOL)registeredForShowAudioBrandLogo;
- (BOOL)registeredForSortOrder;
- (BOOL)registeredForSymbolName;
- (BOOL)registeredForUserVisibleLabel;
- (BOOL)registeredForVehicleLayoutKey;
- (BOOL)showAudioBrandLogo;
- (CAFBoolCharacteristic)disabledCharacteristic;
- (CAFBoolCharacteristic)hiddenCharacteristic;
- (CAFBoolCharacteristic)limitableUIElementCharacteristic;
- (CAFBoolCharacteristic)showAudioBrandLogoCharacteristic;
- (CAFProminenceInformation)prominenceInfo;
- (CAFProminenceInformationCharacteristic)prominenceInfoCharacteristic;
- (CAFSettingsCategoryCharacteristic)categoryCharacteristic;
- (CAFStringCharacteristic)identifierCharacteristic;
- (CAFStringCharacteristic)sectionIdentifierCharacteristic;
- (CAFStringCharacteristic)symbolNameCharacteristic;
- (CAFStringCharacteristic)userVisibleLabelCharacteristic;
- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic;
- (CAFUInt8Characteristic)sortOrderCharacteristic;
- (NSString)identifier;
- (NSString)sectionIdentifier;
- (NSString)symbolName;
- (NSString)userVisibleLabel;
- (NSString)vehicleLayoutKey;
- (unsigned)category;
- (unsigned)sortOrder;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFAutomakerSetting

+ (void)load
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___CAFAutomakerSetting;
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
  v6.super_class = (Class)CAFAutomakerSetting;
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
  v6.super_class = (Class)CAFAutomakerSetting;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  v2 = [(CAFAutomakerSetting *)self userVisibleLabelCharacteristic];
  uint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)sectionIdentifierCharacteristic
{
  uint64_t v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000028"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000028"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)sectionIdentifier
{
  v2 = [(CAFAutomakerSetting *)self sectionIdentifierCharacteristic];
  uint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasSectionIdentifier
{
  v2 = [(CAFAutomakerSetting *)self sectionIdentifierCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)sortOrderCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
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
  v2 = [(CAFAutomakerSetting *)self sortOrderCharacteristic];
  unsigned __int8 v3 = [v2 uint8Value];

  return v3;
}

- (BOOL)hasSortOrder
{
  v2 = [(CAFAutomakerSetting *)self sortOrderCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFSettingsCategoryCharacteristic)categoryCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000006"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000006"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFSettingsCategoryCharacteristic *)v11;
}

- (unsigned)category
{
  v2 = [(CAFAutomakerSetting *)self categoryCharacteristic];
  unsigned __int8 v3 = [v2 settingsCategoryValue];

  return v3;
}

- (CAFStringCharacteristic)identifierCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
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
  v2 = [(CAFAutomakerSetting *)self identifierCharacteristic];
  unsigned __int8 v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)disabledCharacteristic
{
  unsigned __int8 v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  v2 = [(CAFAutomakerSetting *)self disabledCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasDisabled
{
  v2 = [(CAFAutomakerSetting *)self disabledCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)limitableUIElementCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000021"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000021"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)limitableUIElement
{
  v2 = [(CAFAutomakerSetting *)self limitableUIElementCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasLimitableUIElement
{
  v2 = [(CAFAutomakerSetting *)self limitableUIElementCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)hiddenCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  v2 = [(CAFAutomakerSetting *)self hiddenCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasHidden
{
  v2 = [(CAFAutomakerSetting *)self hiddenCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)showAudioBrandLogoCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000011"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000011"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)showAudioBrandLogo
{
  v2 = [(CAFAutomakerSetting *)self showAudioBrandLogoCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasShowAudioBrandLogo
{
  v2 = [(CAFAutomakerSetting *)self showAudioBrandLogoCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000065"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayoutKey
{
  v2 = [(CAFAutomakerSetting *)self vehicleLayoutKeyCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasVehicleLayoutKey
{
  v2 = [(CAFAutomakerSetting *)self vehicleLayoutKeyCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)symbolNameCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
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
  v2 = [(CAFAutomakerSetting *)self symbolNameCharacteristic];
  BOOL v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasSymbolName
{
  v2 = [(CAFAutomakerSetting *)self symbolNameCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFProminenceInformationCharacteristic)prominenceInfoCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000036000020"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000036000020"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFProminenceInformationCharacteristic *)v11;
}

- (CAFProminenceInformation)prominenceInfo
{
  v2 = [(CAFAutomakerSetting *)self prominenceInfoCharacteristic];
  BOOL v3 = [v2 prominenceInformationValue];

  return (CAFProminenceInformation *)v3;
}

- (BOOL)hasProminenceInfo
{
  v2 = [(CAFAutomakerSetting *)self prominenceInfoCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000030000001"])
  {
    v8 = [v6 uniqueIdentifier];
    v9 = [(CAFAutomakerSetting *)self userVisibleLabelCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFAutomakerSetting *)self userVisibleLabel];
      [v12 automakerSettingService:self didUpdateUserVisibleLabel:v13];
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
  }
  v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000036000028"])
  {
    v15 = [v6 uniqueIdentifier];
    v16 = [(CAFAutomakerSetting *)self sectionIdentifierCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFAutomakerSetting *)self sectionIdentifier];
      [v12 automakerSettingService:self didUpdateSectionIdentifier:v13];
      goto LABEL_48;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000030000003"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFAutomakerSetting *)self sortOrderCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateSortOrder:", self, -[CAFAutomakerSetting sortOrder](self, "sortOrder"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000036000006"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFAutomakerSetting *)self categoryCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateCategory:", self, -[CAFAutomakerSetting category](self, "category"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v29 = [v6 characteristicType];
  if ([v29 isEqual:@"0x0000000030000019"])
  {
    v30 = [v6 uniqueIdentifier];
    v31 = [(CAFAutomakerSetting *)self identifierCharacteristic];
    v32 = [v31 uniqueIdentifier];
    int v33 = [v30 isEqual:v32];

    if (v33)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFAutomakerSetting *)self identifier];
      [v12 automakerSettingService:self didUpdateIdentifier:v13];
      goto LABEL_48;
    }
  }
  else
  {
  }
  v34 = [v6 characteristicType];
  if ([v34 isEqual:@"0x0000000032000011"])
  {
    v35 = [v6 uniqueIdentifier];
    v36 = [(CAFAutomakerSetting *)self disabledCharacteristic];
    v37 = [v36 uniqueIdentifier];
    int v38 = [v35 isEqual:v37];

    if (v38)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateDisabled:", self, -[CAFAutomakerSetting disabled](self, "disabled"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v39 = [v6 characteristicType];
  if ([v39 isEqual:@"0x0000000036000021"])
  {
    v40 = [v6 uniqueIdentifier];
    v41 = [(CAFAutomakerSetting *)self limitableUIElementCharacteristic];
    v42 = [v41 uniqueIdentifier];
    int v43 = [v40 isEqual:v42];

    if (v43)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateLimitableUIElement:", self, -[CAFAutomakerSetting limitableUIElement](self, "limitableUIElement"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v44 = [v6 characteristicType];
  if ([v44 isEqual:@"0x0000000036000023"])
  {
    v45 = [v6 uniqueIdentifier];
    v46 = [(CAFAutomakerSetting *)self hiddenCharacteristic];
    v47 = [v46 uniqueIdentifier];
    int v48 = [v45 isEqual:v47];

    if (v48)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateHidden:", self, -[CAFAutomakerSetting hidden](self, "hidden"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v49 = [v6 characteristicType];
  if ([v49 isEqual:@"0x0000000036000011"])
  {
    v50 = [v6 uniqueIdentifier];
    v51 = [(CAFAutomakerSetting *)self showAudioBrandLogoCharacteristic];
    v52 = [v51 uniqueIdentifier];
    int v53 = [v50 isEqual:v52];

    if (v53)
    {
      v12 = [(CAFService *)self observers];
      objc_msgSend(v12, "automakerSettingService:didUpdateShowAudioBrandLogo:", self, -[CAFAutomakerSetting showAudioBrandLogo](self, "showAudioBrandLogo"));
      goto LABEL_49;
    }
  }
  else
  {
  }
  v54 = [v6 characteristicType];
  if ([v54 isEqual:@"0x0000000036000065"])
  {
    v55 = [v6 uniqueIdentifier];
    v56 = [(CAFAutomakerSetting *)self vehicleLayoutKeyCharacteristic];
    v57 = [v56 uniqueIdentifier];
    int v58 = [v55 isEqual:v57];

    if (v58)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFAutomakerSetting *)self vehicleLayoutKey];
      [v12 automakerSettingService:self didUpdateVehicleLayoutKey:v13];
      goto LABEL_48;
    }
  }
  else
  {
  }
  v59 = [v6 characteristicType];
  if ([v59 isEqual:@"0x000000003000005E"])
  {
    v60 = [v6 uniqueIdentifier];
    v61 = [(CAFAutomakerSetting *)self symbolNameCharacteristic];
    v62 = [v61 uniqueIdentifier];
    int v63 = [v60 isEqual:v62];

    if (v63)
    {
      v12 = [(CAFService *)self observers];
      v13 = [(CAFAutomakerSetting *)self symbolName];
      [v12 automakerSettingService:self didUpdateSymbolName:v13];
      goto LABEL_48;
    }
  }
  else
  {
  }
  v12 = [v6 characteristicType];
  if (![v12 isEqual:@"0x0000000036000020"])
  {
LABEL_49:

    goto LABEL_50;
  }
  v64 = [v6 uniqueIdentifier];
  v65 = [(CAFAutomakerSetting *)self prominenceInfoCharacteristic];
  v66 = [v65 uniqueIdentifier];
  int v67 = [v64 isEqual:v66];

  if (v67)
  {
    v12 = [(CAFService *)self observers];
    v13 = [(CAFAutomakerSetting *)self prominenceInfo];
    [v12 automakerSettingService:self didUpdateProminenceInfo:v13];
    goto LABEL_48;
  }
LABEL_50:
  v68.receiver = self;
  v68.super_class = (Class)CAFAutomakerSetting;
  [(CAFService *)&v68 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
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

- (BOOL)registeredForSectionIdentifier
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000028"];

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
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000003"];

  return v10;
}

- (BOOL)registeredForSettingsCategory
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000006"];

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

- (BOOL)registeredForLimitableUIElement
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000021"];

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

- (BOOL)registeredForShowAudioBrandLogo
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000011"];

  return v10;
}

- (BOOL)registeredForVehicleLayoutKey
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000065"];

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

- (BOOL)registeredForProminenceInfo
{
  BOOL v3 = [(CAFService *)self car];
  BOOL v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000036000020"];

  return v10;
}

@end