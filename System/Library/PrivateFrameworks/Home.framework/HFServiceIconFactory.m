@interface HFServiceIconFactory
+ (id)_defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5;
+ (id)_iconSetForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5;
+ (id)_multiSubtypeIconSetForServiceType:(id)a3 serviceSubtype:(id)a4;
+ (id)_replacementIdentifierForIconIdentifier:(id)a3;
+ (id)allIconDescriptorsForService:(id)a3;
+ (id)allIconDescriptorsForServiceType:(id)a3 serviceSubtype:(id)a4;
+ (id)defaultIconDescriptorForService:(id)a3;
+ (id)defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4;
+ (id)defaultSymbolIconIdentifierForServiceType:(id)a3;
+ (id)displayIconDescriptorFromIconDescriptor:(id)a3 symbolName:(id)a4;
+ (id)iconDescriptorForAccessory:(id)a3;
+ (id)iconDescriptorForAccessoryCategory:(id)a3;
+ (id)iconDescriptorForAccessoryCategoryOrServiceType:(id)a3;
+ (id)iconDescriptorWithIdentifier:(id)a3 forService:(id)a4;
+ (id)iconDescriptorWithIdentifier:(id)a3 forServiceType:(id)a4 serviceSubtype:(id)a5;
+ (id)iconModifiersForService:(id)a3;
+ (id)overrideIconDescriptorForMultiServiceAccessory:(id)a3 iconDescriptor:(id)a4;
@end

@implementation HFServiceIconFactory

uint64_t __48__HFServiceIconFactory_iconModifiersForService___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

+ (id)defaultIconDescriptorForService:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "hf_isTelevision"))
  {
    v5 = [v4 accessory];
    v6 = +[HFServiceIconFactory iconDescriptorForAccessory:v5];
  }
  else
  {
    v5 = objc_msgSend(v4, "hf_effectiveServiceType");
    v7 = [v4 serviceSubtype];
    v6 = [a1 defaultIconDescriptorForServiceType:v5 serviceSubtype:v7];
  }
  return v6;
}

+ (id)_defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5
{
  v5 = [a1 _iconSetForServiceType:a3 serviceSubtype:a4 fallbackToPlaceholderIcon:a5];
  v6 = [v5 defaultIcon];

  return v6;
}

+ (id)_iconSetForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (qword_26AB2ED38 != -1) {
    dispatch_once(&qword_26AB2ED38, &__block_literal_global_31);
  }
  v10 = [a1 _multiSubtypeIconSetForServiceType:v8 serviceSubtype:v9];
  if (!v10)
  {
    v10 = [(id)qword_26AB2ED30 objectForKeyedSubscript:v8];
    if (!v10 && v5)
    {
      v10 = +[HFServiceIconSet placeholderIconSet];
    }
  }

  return v10;
}

+ (id)_multiSubtypeIconSetForServiceType:(id)a3 serviceSubtype:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_MergedGlobals_219 != -1) {
    dispatch_once(&_MergedGlobals_219, &__block_literal_global_23);
  }
  id v7 = (id)qword_26AB2ED28;
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x263F0D5E8];
    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = (id)*MEMORY[0x263F0D5E8];
    }
    v12 = [v8 objectForKeyedSubscript:v11];
    if (v12) {
      goto LABEL_11;
    }
    v12 = [v9 objectForKeyedSubscript:v10];
    if (v12) {
      goto LABEL_11;
    }
    v13 = [MEMORY[0x263F0E708] localizedDescriptionForServiceType:v5];
    NSLog(&cfstr_ServiceTypeIsM.isa, v13);
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4
{
  return (id)[a1 _defaultIconDescriptorForServiceType:a3 serviceSubtype:a4 fallbackToPlaceholderIcon:1];
}

+ (id)iconModifiersForService:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 characteristics];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_147_0);

  uint64_t v7 = *MEMORY[0x263F0C1C0];
  if ([v6 containsObject:*MEMORY[0x263F0C1C0]])
  {
    id v8 = objc_msgSend(v3, "hf_characteristicOfType:", v7);
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 metadata];
      id v11 = [v9 value];
      v12 = objc_msgSend(v10, "hf_percentageForCharacteristicValue:", v11);
      [v4 setObject:v12 forKeyedSubscript:@"HFIconModifierHue"];
    }
    else
    {
      uint64_t v10 = [NSNumber numberWithDouble:1.0];
      [v4 setObject:v10 forKeyedSubscript:@"HFIconModifierHue"];
    }
  }
  uint64_t v13 = *MEMORY[0x263F0C398];
  if ([v6 containsObject:*MEMORY[0x263F0C398]])
  {
    v14 = objc_msgSend(v3, "hf_characteristicOfType:", v13);
    v15 = v14;
    if (v14)
    {
      v16 = [v14 metadata];
      v17 = [v15 value];
      v18 = objc_msgSend(v16, "hf_percentageForCharacteristicValue:", v17);
      [v4 setObject:v18 forKeyedSubscript:@"HFIconModifierSaturation"];
    }
    else
    {
      v16 = [NSNumber numberWithDouble:1.0];
      [v4 setObject:v16 forKeyedSubscript:@"HFIconModifierSaturation"];
    }
  }
  uint64_t v19 = *MEMORY[0x263F0BF68];
  if ([v6 containsObject:*MEMORY[0x263F0BF68]])
  {
    v20 = objc_msgSend(v3, "hf_characteristicOfType:", v19);
    v21 = [v20 metadata];
    v22 = [v20 value];
    v23 = objc_msgSend(v21, "hf_percentageForCharacteristicValue:", v22);
    [v4 setObject:v23 forKeyedSubscript:@"HFIconModifierBrightness"];
  }
  uint64_t v24 = *MEMORY[0x263F0BFF8];
  if ([v6 containsObject:*MEMORY[0x263F0BFF8]])
  {
    v25 = objc_msgSend(v3, "hf_characteristicOfType:", v24);
    v26 = [v25 metadata];
    v27 = [v25 value];
    v28 = objc_msgSend(v26, "hf_percentageForCharacteristicValue:", v27);
    [v4 setObject:v28 forKeyedSubscript:@"HFIconModifierColorTemperature"];
  }
  return v4;
}

+ (id)iconDescriptorForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hf_categoryOrPrimaryServiceType");
  id v6 = [a1 iconDescriptorForAccessoryCategoryOrServiceType:v5];

  uint64_t v7 = +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:v4 iconDescriptor:v6];

  return v7;
}

+ (id)overrideIconDescriptorForMultiServiceAccessory:(id)a3 iconDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "hf_isMultiServiceAccessory"))
  {
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      if (objc_msgSend(v5, "hf_isCeilingFanWithLight"))
      {
        uint64_t v10 = [v7 identifier];
        char v11 = [v10 isEqualToString:@"HFCAPackageIconIdentifierCeilingFanWithLight"];

        if ((v11 & 1) == 0)
        {
          v12 = [HFCAPackageIconDescriptor alloc];
          uint64_t v13 = [v9 state];
          v14 = [v9 iconModifiers];
          uint64_t v15 = [(HFCAPackageIconDescriptor *)v12 initWithPackageIdentifier:@"HFCAPackageIconIdentifierCeilingFanWithLight" state:v13 modifiers:v14];

          id v7 = (id)v15;
        }
      }
      if (objc_msgSend(v5, "hf_isPowerStrip"))
      {
        v16 = [v7 identifier];
        char v17 = [v16 isEqualToString:@"HFCAPackageIconIdentifierPowerStrip"];

        if ((v17 & 1) == 0)
        {
          v18 = [HFCAPackageIconDescriptor alloc];
          uint64_t v19 = [v9 state];
          v20 = [v9 iconModifiers];
          uint64_t v21 = [(HFCAPackageIconDescriptor *)v18 initWithPackageIdentifier:@"HFCAPackageIconIdentifierPowerStrip" state:v19 modifiers:v20];

          id v7 = (id)v21;
        }
      }
    }
    id v22 = v7;
  }
  else
  {
    id v22 = v6;
  }

  return v22;
}

+ (id)iconDescriptorForAccessoryCategoryOrServiceType:(id)a3
{
  id v4 = a3;
  if (qword_26AB2ED50 != -1) {
    dispatch_once(&qword_26AB2ED50, &__block_literal_global_127_0);
  }
  id v5 = (id)qword_26AB2ED58;
  if (qword_26AB2ED60 != -1) {
    dispatch_once(&qword_26AB2ED60, &__block_literal_global_133_0);
  }
  id v6 = (id)qword_26AB2ED68;
  if (qword_26AB2ED70 != -1) {
    dispatch_once(&qword_26AB2ED70, &__block_literal_global_139_0);
  }
  id v7 = (id)qword_26AB2ED78;
  id v8 = +[HFServiceIconFactory _defaultIconDescriptorForServiceType:v4 serviceSubtype:0 fallbackToPlaceholderIcon:0];
  if (v8)
  {
    id v9 = v8;
    goto LABEL_28;
  }
  uint64_t v10 = (void *)*MEMORY[0x263F0B0D0];
  if (v4) {
    uint64_t v10 = v4;
  }
  id v11 = v10;
  v12 = [v6 objectForKeyedSubscript:v11];
  if (v12)
  {
    uint64_t v13 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:v12];
    if (v13) {
      goto LABEL_27;
    }
  }
  if ([v11 isEqualToString:*MEMORY[0x263F0B118]])
  {
    v14 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierGenericSensor"];
    uint64_t v15 = +[HFServiceIconSet setWithDefaultIcon:v14];

    uint64_t v13 = [v15 defaultIcon];

    if (v13) {
      goto LABEL_27;
    }
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v11];
  if (v16)
  {
    char v17 = (void *)v16;
    uint64_t v13 = [a1 defaultIconDescriptorForServiceType:v16 serviceSubtype:0];

    if (v13) {
      goto LABEL_27;
    }
  }
  v18 = [v7 objectForKeyedSubscript:v11];
  if (!v18)
  {
LABEL_26:
    uint64_t v13 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
    goto LABEL_27;
  }
  uint64_t v19 = v18;
  if ([v18 isEqualToString:@"point.3.filled.connected.trianglepath.dotted"])
  {
    uint64_t v20 = [MEMORY[0x263F1C6C8] configurationPreferringMulticolor];
LABEL_24:
    uint64_t v21 = (void *)v20;
    uint64_t v13 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v19 configuration:v20];

    goto LABEL_25;
  }
  if (([v11 isEqualToString:*MEMORY[0x263F0B030]] & 1) != 0
    || ([v11 isEqualToString:*MEMORY[0x263F0B0A0]] & 1) != 0
    || [v11 isEqualToString:*MEMORY[0x263F0B130]])
  {
    uint64_t v20 = +[HFMediaHelper mediaContainerSymbolConfiguration];
    goto LABEL_24;
  }
  uint64_t v13 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v19];
LABEL_25:

  if (!v13) {
    goto LABEL_26;
  }
LABEL_27:
  id v9 = v13;

LABEL_28:
  return v9;
}

void __74__HFServiceIconFactory__multiSubtypeIconSetForServiceType_serviceSubtype___block_invoke_2()
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F0D880];
  v11[0] = *MEMORY[0x263F0D5E8];
  v0 = _HFFaucetIconSet();
  v12[0] = v0;
  v11[1] = *MEMORY[0x263F0D5B8];
  v1 = _HFFaucetIconSet();
  v12[1] = v1;
  v11[2] = *MEMORY[0x263F0D5F0];
  v2 = _HFFaucetIconSet();
  v12[2] = v2;
  v11[3] = *MEMORY[0x263F0D5D8];
  v14[0] = @"HFCAPackageIconIdentifierValveCeilingJet";
  v14[1] = @"HFCAPackageIconIdentifierValveSideJets";
  v14[2] = @"HFCAPackageIconIdentifierValveHandheldShowerHead";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  id v4 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierValveShowerHead"];
  id v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_208);
  id v6 = +[HFServiceIconSet setWithDefaultIcon:v4 alternateIcons:v5];

  v12[3] = v6;
  v11[4] = *MEMORY[0x263F0D5C0];
  id v7 = _HFSprinklerIconSet();
  v12[4] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  v14[0] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  uint64_t v10 = (void *)qword_26AB2ED28;
  qword_26AB2ED28 = v9;
}

void __88__HFServiceIconFactory__iconSetForServiceType_serviceSubtype_fallbackToPlaceholderIcon___block_invoke()
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  v74[0] = *MEMORY[0x263F0D630];
  v0 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierAirQualitySensor"];
  v73 = +[HFServiceIconSet setWithDefaultIcon:v0];

  v75[0] = v73;
  v74[1] = *MEMORY[0x263F0D670];
  v1 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierCarbonDioxideSensor"];
  v72 = +[HFServiceIconSet setWithDefaultIcon:v1];

  v75[1] = v72;
  v74[2] = *MEMORY[0x263F0D688];
  v2 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierCarbonMonoxideSensor"];
  v71 = +[HFServiceIconSet setWithDefaultIcon:v2];

  v75[2] = v71;
  v74[3] = *MEMORY[0x263F0D698];
  id v3 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierContactSensor"];
  v70 = +[HFServiceIconSet setWithDefaultIcon:v3];

  v75[3] = v70;
  v74[4] = *MEMORY[0x263F0D6A8];
  v76 = @"HFCAPackageIconIdentifierSlidingDoor";
  v77 = @"HFCAPackageIconIdentifierGate";
  v78 = @"HFCAPackageIconIdentifierFrenchDoor";
  v79 = @"HFCAPackageIconIdentifierSlidingDoorRightHand";
  v80 = @"HFCAPackageIconIdentifierDoorLeftHand";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:5];
  id v5 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierDoor"];
  id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_208);
  v69 = +[HFServiceIconSet setWithDefaultIcon:v5 alternateIcons:v6];

  v75[4] = v69;
  v74[5] = *MEMORY[0x263F0D6C8];
  v68 = _HFFanServiceIconSet();
  v75[5] = v68;
  v74[6] = *MEMORY[0x263F0D890];
  v67 = _HFFanServiceIconSet();
  v75[6] = v67;
  v74[7] = *MEMORY[0x263F0D6F8];
  v76 = @"HFCAPackageIconIdentifierGarageDoorDoubleBay";
  v77 = @"HFCAPackageIconIdentifierGate";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:2];
  id v8 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierGarageDoor"];
  uint64_t v9 = objc_msgSend(v7, "na_map:", &__block_literal_global_208);
  v66 = +[HFServiceIconSet setWithDefaultIcon:v8 alternateIcons:v9];

  v75[7] = v66;
  v74[8] = *MEMORY[0x263F0D730];
  uint64_t v10 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierHumiditySensor"];
  v65 = +[HFServiceIconSet setWithDefaultIcon:v10];

  v75[8] = v65;
  v74[9] = *MEMORY[0x263F0D758];
  id v11 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierLeakSensor"];
  v64 = +[HFServiceIconSet setWithDefaultIcon:v11];

  v75[9] = v64;
  v74[10] = *MEMORY[0x263F0D780];
  v76 = @"HFCAPackageIconIdentifierDeskLamp";
  v77 = @"HFCAPackageIconIdentifierCeilingLight";
  v78 = @"HFCAPackageIconIdentifierFloorLamp";
  v79 = @"HFCAPackageIconIdentifierTableLight";
  v80 = @"HFCAPackageIconIdentifierRecessedLight";
  v81 = @"HFCAPackageIconIdentifierLightPanel";
  v82 = @"HFCAPackageIconIdentifierCylindricalLight";
  v83 = @"HFCAPackageIconIdentifierLightStrip";
  v84 = @"HFCAPackageIconIdentifierChandelier";
  v85 = @"HFCAPackageIconIdentifierLightBulb2";
  v86 = @"HFCAPackageIconIdentifierLightbulbLED";
  v87 = @"HFCAPackageIconIdentifierLightbulbLEDWide";
  v88 = @"HFCAPackageIconIdentifierRecessedLight3";
  v89 = @"HFCAPackageIconIdentifierLightRibbon";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:14];
  uint64_t v13 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierLightbulb"];
  v14 = objc_msgSend(v12, "na_map:", &__block_literal_global_208);
  v63 = +[HFServiceIconSet setWithDefaultIcon:v13 alternateIcons:v14];

  v75[10] = v63;
  v74[11] = *MEMORY[0x263F0D768];
  uint64_t v15 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierLightSensor"];
  v62 = +[HFServiceIconSet setWithDefaultIcon:v15];

  v75[11] = v62;
  v74[12] = *MEMORY[0x263F0D798];
  v76 = @"HFCAPackageIconIdentifierPINEntryDoorLock";
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  char v17 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierDoorLock"];
  v18 = objc_msgSend(v16, "na_map:", &__block_literal_global_208);
  v61 = +[HFServiceIconSet setWithDefaultIcon:v17 alternateIcons:v18];

  v75[12] = v61;
  v74[13] = *MEMORY[0x263F0D7A8];
  uint64_t v19 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierMotionSensor"];
  v60 = +[HFServiceIconSet setWithDefaultIcon:v19];

  v75[13] = v60;
  v74[14] = *MEMORY[0x263F0D7B8];
  uint64_t v20 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierOccupancySensor"];
  v59 = +[HFServiceIconSet setWithDefaultIcon:v20];

  v75[14] = v59;
  v74[15] = *MEMORY[0x263F0D7D0];
  v76 = @"HFCAPackageIconIdentifierOutletTypeA";
  v77 = @"HFCAPackageIconIdentifierOutletTypeC";
  v78 = @"HFCAPackageIconIdentifierOutletTypeG";
  v79 = @"HFCAPackageIconIdentifierOutletTypeI";
  v80 = @"HFCAPackageIconIdentifierOutletTypeK";
  v81 = @"HFCAPackageIconIdentifierOutletTypeN";
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:6];
  id v22 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierOutletTypeB"];
  v23 = objc_msgSend(v21, "na_map:", &__block_literal_global_208);
  v58 = +[HFServiceIconSet setWithDefaultIcon:v22 alternateIcons:v23];

  v75[15] = v58;
  v74[16] = *MEMORY[0x263F0D7D8];
  uint64_t v24 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierSecuritySystem"];
  v57 = +[HFServiceIconSet setWithDefaultIcon:v24];

  v75[16] = v57;
  v74[17] = *MEMORY[0x263F0D7F8];
  v25 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierSmokeSensor"];
  v56 = +[HFServiceIconSet setWithDefaultIcon:v25];

  v75[17] = v56;
  v74[18] = *MEMORY[0x263F0D828];
  v76 = @"HFCAPackageIconIdentifierSwitch2";
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  v27 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierSwitch"];
  v28 = objc_msgSend(v26, "na_map:", &__block_literal_global_208);
  v55 = +[HFServiceIconSet setWithDefaultIcon:v27 alternateIcons:v28];

  v75[18] = v55;
  v74[19] = *MEMORY[0x263F0D858];
  v29 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierTemperatureSensor"];
  v54 = +[HFServiceIconSet setWithDefaultIcon:v29];

  v75[19] = v54;
  v74[20] = *MEMORY[0x263F0D870];
  v53 = _HFThermostatIconSet();
  v75[20] = v53;
  v74[21] = *MEMORY[0x263F0D8A8];
  v76 = @"HFCAPackageIconIdentifierWindowHorizontal";
  v77 = @"HFCAPackageIconIdentifierWindowCeiling";
  v78 = @"HFCAPackageIconIdentifierWindowCasement";
  v79 = @"HFCAPackageIconIdentifierWindowAwning";
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:4];
  v31 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierWindowVertical"];
  v32 = objc_msgSend(v30, "na_map:", &__block_literal_global_208);
  v52 = +[HFServiceIconSet setWithDefaultIcon:v31 alternateIcons:v32];

  v75[21] = v52;
  v74[22] = *MEMORY[0x263F0D8B8];
  v76 = @"HFCAPackageIconIdentifierWindowCoveringBlindsVertical";
  v77 = @"HFCAPackageIconIdentifierWindowCoveringRollerShade";
  v78 = @"HFCAPackageIconIdentifierWindowCoveringRomanShade";
  v79 = @"HFCAPackageIconIdentifierWindowCoveringCurtains";
  v80 = @"HFCAPackageIconIdentifierWindowCoveringAwning";
  v81 = @"HFCAPackageIconIdentifierWindowCoveringGenericShade";
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:6];
  v34 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal"];
  v35 = objc_msgSend(v33, "na_map:", &__block_literal_global_208);
  v36 = +[HFServiceIconSet setWithDefaultIcon:v34 alternateIcons:v35];

  v75[22] = v36;
  v74[23] = *MEMORY[0x263F0D820];
  v37 = _HFProgrammableSwitchIconSet();
  v75[23] = v37;
  v74[24] = *MEMORY[0x263F0D818];
  v38 = _HFProgrammableSwitchIconSet();
  v75[24] = v38;
  v74[25] = *MEMORY[0x263F0D618];
  v39 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierAirPurifier"];
  v40 = +[HFServiceIconSet setWithDefaultIcon:v39];

  v75[25] = v40;
  v74[26] = *MEMORY[0x263F0D708];
  v41 = _HFThermostatIconSet();
  v75[26] = v41;
  v74[27] = *MEMORY[0x263F0D720];
  v76 = @"HFCAPackageIconIdentifierDehumidifier";
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  v43 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierHumidifier"];
  v44 = objc_msgSend(v42, "na_map:", &__block_literal_global_208);
  v45 = +[HFServiceIconSet setWithDefaultIcon:v43 alternateIcons:v44];

  v75[27] = v45;
  v74[28] = *MEMORY[0x263F0D740];
  v46 = _HFSprinklerIconSet();
  v75[28] = v46;
  v74[29] = *MEMORY[0x263F0D6D8];
  v47 = _HFFaucetIconSet();
  v75[29] = v47;
  v74[30] = *MEMORY[0x263F0D898];
  v48 = _HFNetworkRouterIconSet();
  v75[30] = v48;
  v74[31] = *MEMORY[0x263F0D8A0];
  v49 = _HFNetworkRouterIconSet();
  v75[31] = v49;
  uint64_t v50 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:32];
  v51 = (void *)qword_26AB2ED30;
  qword_26AB2ED30 = v50;
}

uint64_t __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_8()
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0B030];
  v5[0] = *MEMORY[0x263F0B040];
  v5[1] = v0;
  v6[0] = @"point.3.filled.connected.trianglepath.dotted";
  v6[1] = @"appletv.fill";
  uint64_t v1 = *MEMORY[0x263F0B130];
  v5[2] = *MEMORY[0x263F0B0A0];
  v5[3] = v1;
  v6[2] = @"homepod.fill";
  v6[3] = @"hifispeaker.fill";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  uint64_t v3 = qword_26AB2ED78;
  qword_26AB2ED78 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_5()
{
  v8[10] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0B038];
  v7[0] = *MEMORY[0x263F0B0A8];
  v7[1] = v0;
  v8[0] = @"HFCAPackageIconIdentifierIPCamera";
  v8[1] = @"HFCAPackageIconIdentifierReceiver";
  uint64_t v1 = *MEMORY[0x263F0B170];
  v7[2] = *MEMORY[0x263F0B160];
  v7[3] = v1;
  v8[2] = @"HFCAPackageIconIdentifierRemoteControl";
  v8[3] = @"HFCAPackageIconIdentifierTelevision";
  uint64_t v2 = *MEMORY[0x263F0B198];
  v7[4] = *MEMORY[0x263F0B188];
  v7[5] = v2;
  v8[4] = @"HFCAPackageIconIdentifierTelevisionSetTopBox";
  v8[5] = @"HFCAPackageIconIdentifierTelevisionStreamingStick";
  v7[6] = *MEMORY[0x263F0B1B8];
  v7[7] = @"9D302CDA-1467-4E19-ABC9-9ED36BE34508";
  v8[6] = @"HFCAPackageIconIdentifierVideoDoorbell";
  v8[7] = @"HFCAPackageIconIdentifierCeilingFanWithLight";
  uint64_t v3 = *MEMORY[0x263F0B010];
  v7[8] = @"3047A1A5-8BFC-4112-9888-21314F438FF3";
  v7[9] = v3;
  v8[8] = @"HFCAPackageIconIdentifierPowerStrip";
  v8[9] = @"HFCAPackageIconIdentifierAirport";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:10];
  uint64_t v5 = qword_26AB2ED68;
  qword_26AB2ED68 = v4;
  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_2()
{
  v33[23] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D7D8];
  uint64_t v1 = *MEMORY[0x263F0B048];
  v32[0] = *MEMORY[0x263F0B100];
  v32[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D6A8];
  v33[0] = v0;
  v33[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0D798];
  uint64_t v4 = *MEMORY[0x263F0B070];
  v32[2] = *MEMORY[0x263F0B058];
  v32[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0D6C8];
  v33[2] = v3;
  v33[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0D6F8];
  uint64_t v7 = *MEMORY[0x263F0B0A8];
  v32[4] = *MEMORY[0x263F0B088];
  v32[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0D660];
  v33[4] = v6;
  v33[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0B0B8];
  v32[6] = *MEMORY[0x263F0B1B8];
  v32[7] = v9;
  uint64_t v10 = *MEMORY[0x263F0D780];
  v33[6] = v8;
  v33[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0D7D0];
  uint64_t v12 = *MEMORY[0x263F0B0F0];
  v32[8] = *MEMORY[0x263F0B0E0];
  v32[9] = v12;
  uint64_t v13 = *MEMORY[0x263F0D820];
  v33[8] = v11;
  v33[9] = v13;
  uint64_t v14 = *MEMORY[0x263F0D828];
  uint64_t v15 = *MEMORY[0x263F0B1A8];
  v32[10] = *MEMORY[0x263F0B158];
  v32[11] = v15;
  uint64_t v16 = *MEMORY[0x263F0D870];
  v33[10] = v14;
  v33[11] = v16;
  uint64_t v17 = *MEMORY[0x263F0D8A8];
  uint64_t v18 = *MEMORY[0x263F0B1E0];
  v32[12] = *MEMORY[0x263F0B1C8];
  v32[13] = v18;
  uint64_t v19 = *MEMORY[0x263F0D8B8];
  v33[12] = v17;
  v33[13] = v19;
  uint64_t v20 = *MEMORY[0x263F0D708];
  uint64_t v21 = *MEMORY[0x263F0B018];
  v32[14] = *MEMORY[0x263F0AFC8];
  v32[15] = v21;
  uint64_t v22 = *MEMORY[0x263F0D618];
  v33[14] = v20;
  v33[15] = v22;
  uint64_t v23 = *MEMORY[0x263F0B000];
  v32[16] = *MEMORY[0x263F0AFE8];
  v32[17] = v23;
  uint64_t v24 = *MEMORY[0x263F0D720];
  v33[16] = v20;
  v33[17] = v24;
  uint64_t v25 = *MEMORY[0x263F0B140];
  v32[18] = *MEMORY[0x263F0AFD8];
  v32[19] = v25;
  uint64_t v26 = *MEMORY[0x263F0D740];
  v33[18] = v24;
  v33[19] = v26;
  uint64_t v27 = *MEMORY[0x263F0D6D8];
  uint64_t v28 = *MEMORY[0x263F0B120];
  v32[20] = *MEMORY[0x263F0B078];
  v32[21] = v28;
  v33[20] = v27;
  v33[21] = v27;
  v32[22] = *MEMORY[0x263F0B1C0];
  v33[22] = *MEMORY[0x263F0D898];
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:23];
  uint64_t v30 = qword_26AB2ED58;
  qword_26AB2ED58 = v29;
  return MEMORY[0x270F9A758](v29, v30);
}

+ (id)defaultSymbolIconIdentifierForServiceType:(id)a3
{
  uint64_t v3 = qword_26AB2ED48;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2ED48, &__block_literal_global_33);
  }
  uint64_t v5 = [(id)qword_26AB2ED40 objectForKeyedSubscript:v4];

  return v5;
}

void __66__HFServiceIconFactory_defaultSymbolIconIdentifierForServiceType___block_invoke()
{
  v19[32] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D630];
  v18[0] = *MEMORY[0x263F0D618];
  v18[1] = v0;
  v19[0] = @"air.purifier.fill";
  v19[1] = @"aqi.medium";
  uint64_t v1 = *MEMORY[0x263F0D688];
  v18[2] = *MEMORY[0x263F0D670];
  v18[3] = v1;
  v19[2] = @"carbon.dioxide.cloud.fill";
  v19[3] = @"carbon.monoxide.cloud.fill";
  uint64_t v2 = *MEMORY[0x263F0D6A8];
  v18[4] = *MEMORY[0x263F0D698];
  v18[5] = v2;
  v19[4] = @"contact.sensor.fill";
  v19[5] = @"door.right.hand.open";
  uint64_t v3 = *MEMORY[0x263F0D6D8];
  v18[6] = *MEMORY[0x263F0D6C8];
  v18[7] = v3;
  v19[6] = @"fan.desk";
  v19[7] = @"faucet.fill";
  uint64_t v4 = *MEMORY[0x263F0D708];
  v18[8] = *MEMORY[0x263F0D6F8];
  v18[9] = v4;
  v19[8] = @"door.garage.open";
  v19[9] = @"heater.vertical.fill";
  uint64_t v5 = *MEMORY[0x263F0D730];
  v18[10] = *MEMORY[0x263F0D720];
  v18[11] = v5;
  v19[10] = @"humidifier.fill";
  v19[11] = @"humidity.fill";
  uint64_t v6 = *MEMORY[0x263F0D758];
  v18[12] = *MEMORY[0x263F0D740];
  v18[13] = v6;
  v19[12] = @"sprinkler.water";
  v19[13] = @"pipe.and.drop.fill";
  uint64_t v7 = *MEMORY[0x263F0D780];
  v18[14] = *MEMORY[0x263F0D768];
  v18[15] = v7;
  v19[14] = @"sun.max.fill";
  v19[15] = @"lightbulb.fill";
  uint64_t v8 = *MEMORY[0x263F0D7A8];
  v18[16] = *MEMORY[0x263F0D798];
  v18[17] = v8;
  v19[16] = @"lock.open.fill";
  v19[17] = @"figure.walk.motion";
  uint64_t v9 = *MEMORY[0x263F0D7D0];
  v18[18] = *MEMORY[0x263F0D7B8];
  v18[19] = v9;
  v19[18] = @"figure.walk";
  v19[19] = @"poweroutlet.type.b.square.fill";
  uint64_t v10 = *MEMORY[0x263F0D7F8];
  v18[20] = *MEMORY[0x263F0D7D8];
  v18[21] = v10;
  v19[20] = @"light.beacon.min.fill";
  v19[21] = @"smoke.fill";
  uint64_t v11 = *MEMORY[0x263F0D820];
  v18[22] = *MEMORY[0x263F0D818];
  v18[23] = v11;
  v19[22] = @"switch.programmable.square.fill";
  v19[23] = @"switch.programmable.square.fill";
  uint64_t v12 = *MEMORY[0x263F0D858];
  v18[24] = *MEMORY[0x263F0D828];
  v18[25] = v12;
  v19[24] = @"lightswitch.on.square.fill";
  v19[25] = @"thermometer.medium";
  uint64_t v13 = *MEMORY[0x263F0D890];
  v18[26] = *MEMORY[0x263F0D870];
  v18[27] = v13;
  v19[26] = @"dial.medium.fill";
  v19[27] = @"fan.desk";
  uint64_t v14 = *MEMORY[0x263F0D8A0];
  v18[28] = *MEMORY[0x263F0D898];
  v18[29] = v14;
  v19[28] = @"wifi.router.fill";
  v19[29] = @"wifi.router.fill";
  uint64_t v15 = *MEMORY[0x263F0D8B8];
  v18[30] = *MEMORY[0x263F0D8A8];
  v18[31] = v15;
  v19[30] = @"window.vertical.open";
  v19[31] = @"blinds.horizontal.open";
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:32];
  uint64_t v17 = (void *)qword_26AB2ED40;
  qword_26AB2ED40 = v16;
}

+ (id)iconDescriptorWithIdentifier:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "hf_effectiveServiceType");
  uint64_t v9 = [v6 serviceSubtype];

  uint64_t v10 = [a1 iconDescriptorWithIdentifier:v7 forServiceType:v8 serviceSubtype:v9];

  return v10;
}

+ (id)iconDescriptorWithIdentifier:(id)a3 forServiceType:(id)a4 serviceSubtype:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 _replacementIdentifierForIconIdentifier:v8];
  if (v11)
  {
    uint64_t v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Replacing deprecated icon identifier %@ with %@", buf, 0x16u);
    }

    id v13 = v11;
    id v8 = v13;
  }
  uint64_t v14 = [a1 allIconDescriptorsForServiceType:v9 serviceSubtype:v10];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__HFServiceIconFactory_iconDescriptorWithIdentifier_forServiceType_serviceSubtype___block_invoke;
  v19[3] = &unk_26408EBD8;
  id v15 = v8;
  id v20 = v15;
  uint64_t v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v19);

  if (!v16)
  {
    uint64_t v16 = [a1 defaultIconDescriptorForServiceType:v9 serviceSubtype:v10];
    if (!v16)
    {
      uint64_t v17 = +[HFServiceIconSet placeholderIconSet];
      uint64_t v16 = [v17 defaultIcon];
    }
  }

  return v16;
}

uint64_t __83__HFServiceIconFactory_iconDescriptorWithIdentifier_forServiceType_serviceSubtype___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)allIconDescriptorsForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hf_effectiveServiceType");
  id v6 = [v4 serviceSubtype];

  id v7 = [a1 allIconDescriptorsForServiceType:v5 serviceSubtype:v6];

  return v7;
}

+ (id)allIconDescriptorsForServiceType:(id)a3 serviceSubtype:(id)a4
{
  id v4 = [a1 _iconSetForServiceType:a3 serviceSubtype:a4 fallbackToPlaceholderIcon:1];
  uint64_t v5 = [v4 allIcons];

  return v5;
}

+ (id)iconDescriptorForAccessoryCategory:(id)a3
{
  id v4 = [a3 categoryType];
  uint64_t v5 = [a1 iconDescriptorForAccessoryCategoryOrServiceType:v4];

  return v5;
}

+ (id)_replacementIdentifierForIconIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_26AB2ED80 != -1) {
    dispatch_once(&qword_26AB2ED80, &__block_literal_global_152);
  }
  id v4 = (id)qword_26AB2ED88;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

uint64_t __64__HFServiceIconFactory__replacementIdentifierForIconIdentifier___block_invoke_2()
{
  v4[62] = *MEMORY[0x263EF8340];
  v3[0] = @"HFImageIconIdentifierServiceLightbulb";
  v3[1] = @"HFImageIconIdentifierServiceCeilingLight";
  v4[0] = @"HFCAPackageIconIdentifierLightbulb";
  v4[1] = @"HFCAPackageIconIdentifierCeilingLight";
  v3[2] = @"HFImageIconIdentifierServiceDeskLamp";
  v3[3] = @"HFImageIconIdentifierServiceFloorLamp";
  v4[2] = @"HFCAPackageIconIdentifierDeskLamp";
  v4[3] = @"HFCAPackageIconIdentifierFloorLamp";
  v3[4] = @"HFImageIconIdentifierServiceFan";
  v3[5] = @"HFImageIconIdentifierServiceCeilingFan";
  v4[4] = @"HFCAPackageIconIdentifierDeskFan";
  v4[5] = @"HFCAPackageIconIdentifierCeilingFan";
  v3[6] = @"HFImageIconIdentifierServiceGarageDoor";
  v3[7] = @"HFImageIconIdentifierServiceLock";
  v4[6] = @"HFCAPackageIconIdentifierGarageDoor";
  v4[7] = @"HFCAPackageIconIdentifierDoorLock";
  v3[8] = @"HFImageIconIdentifierServiceSwitch";
  v3[9] = @"HFImageIconIdentifierServiceDoor";
  v4[8] = @"HFCAPackageIconIdentifierSwitch";
  v4[9] = @"HFCAPackageIconIdentifierDoor";
  v3[10] = @"HFImageIconIdentifierIPCamera";
  v3[11] = @"HFImageIconIdentifierVideoDoorbell";
  v4[10] = @"HFCAPackageIconIdentifierIPCamera";
  v4[11] = @"HFCAPackageIconIdentifierVideoDoorbell";
  v3[12] = @"HFImageIconIdentifierProgrammableSwitch";
  v3[13] = @"HFImageIconIdentifierServiceAirPurifier";
  v4[12] = @"HFCAPackageIconIdentifierProgrammableSwitch";
  v4[13] = @"HFCAPackageIconIdentifierAirPurifier";
  v3[14] = @"HFImageIconIdentifierServiceHumidifierDehumidifier";
  v3[15] = @"HFImageIconIdentifierServiceTelevisionOn";
  v4[14] = @"HFCAPackageIconIdentifierHumidifier";
  v4[15] = @"HFCAPackageIconIdentifierTelevision";
  v3[16] = @"HFImageIconIdentifierServiceTelevisionOff";
  v3[17] = @"HFImageIconIdentifierRemoteControl";
  v4[16] = @"HFCAPackageIconIdentifierTelevision";
  v4[17] = @"HFCAPackageIconIdentifierRemoteControl";
  v3[18] = @"HFImageIconIdentifierAppleTV";
  v3[19] = @"HFImageIconIdentifierServiceLightSensor";
  v4[18] = @"appletv.fill";
  v4[19] = @"HFCAPackageIconIdentifierLightSensor";
  v3[20] = @"HFImageIconIdentifierServiceTemperatureSensor";
  v3[21] = @"HFImageIconIdentifierServiceHumiditySensor";
  v4[20] = @"HFCAPackageIconIdentifierTemperatureSensor";
  v4[21] = @"HFCAPackageIconIdentifierHumiditySensor";
  v3[22] = @"HFImageIconIdentifierServiceAirQualitySensorOn";
  v3[23] = @"HFImageIconIdentifierServiceAirQualitySensorOff";
  v4[22] = @"HFCAPackageIconIdentifierAirQualitySensor";
  v4[23] = @"HFCAPackageIconIdentifierAirQualitySensor";
  v3[24] = @"HFImageIconIdentifierServiceContactSensorOpen";
  v3[25] = @"HFImageIconIdentifierServiceContactSensorClosed";
  v4[24] = @"HFCAPackageIconIdentifierContactSensor";
  v4[25] = @"HFCAPackageIconIdentifierContactSensor";
  v3[26] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOn";
  v3[27] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOff";
  v4[26] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
  v4[27] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
  v3[28] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOn";
  v3[29] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOff";
  v4[28] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
  v4[29] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
  v3[30] = @"HFImageIconIdentifierServiceLeakSensorOn";
  v3[31] = @"HFImageIconIdentifierServiceLeakSensorOff";
  v4[30] = @"HFCAPackageIconIdentifierLeakSensor";
  v4[31] = @"HFCAPackageIconIdentifierLeakSensor";
  v3[32] = @"HFImageIconIdentifierServiceMotionSensorOn";
  v3[33] = @"HFImageIconIdentifierServiceMotionSensorOff";
  v4[32] = @"HFCAPackageIconIdentifierMotionSensor";
  v4[33] = @"HFCAPackageIconIdentifierMotionSensor";
  v3[34] = @"HFImageIconIdentifierServiceOccupancySensorOn";
  v3[35] = @"HFImageIconIdentifierServiceOccupancySensorOff";
  v4[34] = @"HFCAPackageIconIdentifierOccupancySensor";
  v4[35] = @"HFCAPackageIconIdentifierOccupancySensor";
  v3[36] = @"HFImageIconIdentifierServiceSmokeSensorOn";
  v3[37] = @"HFImageIconIdentifierServiceSmokeSensorOff";
  v4[36] = @"HFCAPackageIconIdentifierSmokeSensor";
  v4[37] = @"HFCAPackageIconIdentifierSmokeSensor";
  v3[38] = @"HFImageIconIdentifierServiceWindowOpen";
  v3[39] = @"HFImageIconIdentifierServiceWindowClosed";
  v4[38] = @"HFCAPackageIconIdentifierWindowVertical";
  v4[39] = @"HFCAPackageIconIdentifierWindowVertical";
  v3[40] = @"HFImageIconIdentifierSecuritySystemOff";
  v3[41] = @"HFImageIconIdentifierSecuritySystemOn";
  v4[40] = @"HFCAPackageIconIdentifierSecuritySystem";
  v4[41] = @"HFCAPackageIconIdentifierSecuritySystem";
  v3[42] = @"HFImageIconIdentifierBlindsClosed";
  v3[43] = @"HFImageIconIdentifierBlindsOpen";
  v4[42] = @"HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal";
  v4[43] = @"HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal";
  v3[44] = @"HFImageIconIdentifierServiceFaucetOff";
  v3[45] = @"HFImageIconIdentifierServiceFaucetOn";
  v4[44] = @"HFCAPackageIconIdentifierFaucet";
  v4[45] = @"HFCAPackageIconIdentifierFaucet";
  v3[46] = @"HFImageIconIdentifierServiceSprinklerOff";
  v3[47] = @"HFImageIconIdentifierServiceSprinklerOn";
  v4[46] = @"HFCAPackageIconIdentifierSprinkler";
  v4[47] = @"HFCAPackageIconIdentifierSprinkler";
  v3[48] = @"HFImageIconIdentifierValveGenericOn";
  v3[49] = @"HFImageIconIdentifierValveGenericOff";
  v4[48] = @"HFCAPackageIconIdentifierFaucet";
  v4[49] = @"HFCAPackageIconIdentifierFaucet";
  v3[50] = @"HFImageIconIdentifierValveShowerHeadOn";
  v3[51] = @"HFImageIconIdentifierValveShowerHeadOff";
  v4[50] = @"HFCAPackageIconIdentifierValveCeilingJet";
  v4[51] = @"HFCAPackageIconIdentifierValveCeilingJet";
  v3[52] = @"HFImageIconIdentifierServiceOutlet";
  v3[53] = @"HFCAPackageIconIdentifierOutlet";
  v4[52] = @"HFCAPackageIconIdentifierOutletTypeB";
  v4[53] = @"HFCAPackageIconIdentifierOutletTypeB";
  v3[54] = @"HFCAPackageIconIdentifierOutletAustraliaNewZealand";
  v3[55] = @"HFCAPackageIconIdentifierOutletEurope";
  v3[56] = @"HFCAPackageIconIdentifierOutletUnitedKingdom";
  v3[57] = @"HFCAPackageIconIdentifierOutletJapan";
  v4[56] = @"HFCAPackageIconIdentifierOutletTypeG";
  v4[57] = @"HFCAPackageIconIdentifierOutletTypeA";
  v4[54] = @"HFCAPackageIconIdentifierOutletTypeI";
  v4[55] = @"HFCAPackageIconIdentifierOutletTypeC";
  v3[58] = @"HFCAPackageIconIdentifierOutletKorea";
  v3[59] = @"HFCAPackageIconIdentifierOutletHongKong";
  v4[58] = @"HFCAPackageIconIdentifierOutletTypeC";
  v4[59] = @"HFCAPackageIconIdentifierOutletTypeG";
  v3[60] = @"HFCAPackageIconIdentifierOutletChina";
  v3[61] = @"HFCAPackageIconIdentifierOutletBrazil";
  v4[60] = @"HFCAPackageIconIdentifierOutletTypeI";
  v4[61] = @"HFCAPackageIconIdentifierOutletTypeN";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:62];
  uint64_t v1 = qword_26AB2ED88;
  qword_26AB2ED88 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)displayIconDescriptorFromIconDescriptor:(id)a3 symbolName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = (HFImageIconDescriptor *)v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [HFCAPackageIconDescriptor alloc];
    uint64_t v11 = [(HFImageIconDescriptor *)v9 packageIdentifier];
    uint64_t v12 = [(HFCAPackageIconDescriptor *)v10 initWithPackageIdentifier:v11 state:HFCAPackageStateDisplay];
  }
  else
  {
    if (![v6 length]) {
      goto LABEL_15;
    }
    uint64_t v11 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D300]];
    objc_opt_class();
    id v13 = v7;
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v7 = v14;

    id v15 = [(HFImageIconDescriptor *)v7 imageSymbolConfiguration];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = [v15 configurationByApplyingConfiguration:v11];
    }
    else
    {
      id v17 = v11;
    }
    uint64_t v12 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v6 configuration:v17];
  }
  id v7 = v12;
LABEL_15:

  return v7;
}

@end