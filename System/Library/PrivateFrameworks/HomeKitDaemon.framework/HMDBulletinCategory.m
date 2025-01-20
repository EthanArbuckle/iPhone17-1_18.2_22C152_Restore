@interface HMDBulletinCategory
+ (BOOL)isSecureServiceType:(id)a3;
+ (BOOL)isSensorDetectedCharacteristic:(id)a3;
+ (NSDictionary)targetCurrentCharacteristicTypeMap;
+ (id)_enumerationValueLocalizationKeys;
+ (id)_localizedStateForValue:(id)a3 characteristicType:(id)a4;
+ (id)_presentationTypeForType:(id)a3;
+ (id)_secureStateMap;
+ (id)_sensorMap;
+ (id)bulletinReasonForChangedCharacteristic:(id)a3;
+ (id)composedNameForCharacteristic:(id)a3;
+ (id)localizedActionForCharacteristic:(id)a3;
+ (id)localizedStateForCharacteristic:(id)a3 doorbellBulletinUtilities:(id)a4;
+ (id)localizedStringForItems:(id)a3;
+ (id)presentationValueForValue:(id)a3 type:(id)a4;
+ (id)trimLeadingAndTailingDotInName:(id)a3;
+ (id)trimLeadingAndTailingSpacesInName:(id)a3;
@end

@implementation HMDBulletinCategory

+ (id)presentationValueForValue:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _presentationTypeForType:v7];
  if (([v7 isEqualToString:*MEMORY[0x263F35538]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x263F35508]])
  {
    v9 = [a1 _secureStateMap];
    v10 = [v9 objectForKeyedSubscript:v8];
    v11 = v10;
    uint64_t v12 = 1;
    goto LABEL_4;
  }
  if (([v7 isEqualToString:*MEMORY[0x263F35490]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x263F355B8]])
  {
    uint64_t v14 = [v6 integerValue];
    v15 = &unk_26E471BC0;
    if (!v14) {
      v15 = &unk_26E471BA8;
    }
    id v16 = v15;
  }
  else
  {
    if (([v7 isEqualToString:*MEMORY[0x263F354A0]] & 1) == 0
      && ([v7 isEqualToString:*MEMORY[0x263F354E0]] & 1) == 0
      && ([v7 isEqualToString:*MEMORY[0x263F354F8]] & 1) == 0
      && ![v7 isEqualToString:*MEMORY[0x263F35488]])
    {
      v18 = +[HMDBulletinCategory _secureStateMap];
      v9 = [v18 objectForKeyedSubscript:v8];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        goto LABEL_5;
      }
      v11 = [v9 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 isEqualToNumber:v6] ^ 1;
      v10 = v9;
LABEL_4:
      v13 = [v10 objectAtIndexedSubscript:v12];

LABEL_5:
      goto LABEL_17;
    }
    id v16 = v6;
  }
  v13 = v16;
LABEL_17:

  return v13;
}

+ (id)_presentationTypeForType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F35538]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F35508]] & 1) != 0
    || (int v4 = [v3 isEqualToString:*MEMORY[0x263F35490]], v5 = v3, v4))
  {
    v5 = (void *)*MEMORY[0x263F35468];
  }
  id v6 = v5;

  return v6;
}

+ (id)_localizedStateForValue:(id)a3 characteristicType:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263F35490]])
  {
    id v7 = HMDLocalizedStringForKey(@"BULLETIN_CATEGORY_STATE_UNKNOWN");
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@type : %@ value = %@", (uint8_t *)&v19, 0x20u);
    }
    v11 = +[HMDBulletinCategory _enumerationValueLocalizationKeys];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unint64_t v13 = [v5 integerValue], v13 < objc_msgSend(v12, "count")))
    {
      uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
    }
    else
    {
      uint64_t v14 = 0;
    }
    v15 = HMDLocalizedStringForKey(v14);
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      HMDLocalizedStringForKey(@"BULLETIN_CATEGORY_STATE_UNKNOWN");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v17;
  }
  return v7;
}

+ (NSDictionary)targetCurrentCharacteristicTypeMap
{
  if (targetCurrentCharacteristicTypeMap_onceToken != -1) {
    dispatch_once(&targetCurrentCharacteristicTypeMap_onceToken, &__block_literal_global_144_134201);
  }
  v2 = (void *)targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap;
  return (NSDictionary *)v2;
}

void __57__HMDBulletinCategory_targetCurrentCharacteristicTypeMap__block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F35468];
  uint64_t v1 = *MEMORY[0x263F355B0];
  v7[0] = *MEMORY[0x263F35590];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F35488];
  v8[0] = v0;
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263F355C8];
  v7[2] = *MEMORY[0x263F355B8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x263F354A0];
  v8[2] = *MEMORY[0x263F35490];
  v8[3] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v6 = (void *)targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap;
  targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap = v5;
}

+ (id)bulletinReasonForChangedCharacteristic:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 service];
  uint64_t v5 = [v4 bulletinBoardNotification];
  id v6 = [v5 notificationServiceGroup];

  id v7 = [v6 cameraProfiles];
  v8 = [v7 firstObject];

  if (v8)
  {
    v9 = [v3 type];
    int v10 = [v9 isEqualToString:*MEMORY[0x263F354F8]];

    if (v10)
    {
      v11 = (id *)MEMORY[0x263F0BB08];
LABEL_7:
      id v15 = *v11;
      goto LABEL_10;
    }
    uint64_t v12 = [v3 type];
    if ([v12 isEqualToString:*MEMORY[0x263F354E0]])
    {
      unint64_t v13 = [v4 type];
      int v14 = [v13 isEqualToString:*MEMORY[0x263F356D0]];

      if (v14)
      {
        v11 = (id *)MEMORY[0x263F0BAF8];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v15 = 0;
LABEL_10:

  return v15;
}

+ (BOOL)isSecureServiceType:(id)a3
{
  uint64_t v3 = isSecureServiceType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isSecureServiceType__onceToken, &__block_literal_global_141_134204);
  }
  char v5 = [(id)isSecureServiceType__secureServices containsObject:v4];

  return v5;
}

void __43__HMDBulletinCategory_isSecureServiceType___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F356C8], *MEMORY[0x263F356E8], *MEMORY[0x263F35710], *MEMORY[0x263F35728], *MEMORY[0x263F357B0], 0);
  uint64_t v1 = (void *)isSecureServiceType__secureServices;
  isSecureServiceType__secureServices = v0;
}

+ (BOOL)isSensorDetectedCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = +[HMDBulletinCategory _sensorMap];
  char v5 = [v4 allKeys];
  id v6 = [v3 type];

  LOBYTE(v3) = [v5 containsObject:v6];
  return (char)v3;
}

+ (id)composedNameForCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  char v5 = [v4 name];
  id v6 = [v3 accessory];

  id v7 = [v6 room];
  v8 = [v7 name];
  v9 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  int v10 = +[HMDServiceNameComponents componentsWithRawServiceName:v5 rawRoomName:v8 localizedFormat:v9];

  v11 = [v10 composedName];

  return v11;
}

+ (id)trimLeadingAndTailingDotInName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  char v5 = [v3 characterSetWithCharactersInString:@"."];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

+ (id)trimLeadingAndTailingSpacesInName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  char v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

+ (id)localizedStateForCharacteristic:(id)a3 doorbellBulletinUtilities:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 accessory];
  v9 = [v6 service];
  int v10 = [v6 type];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F354E0]];

  if (v11)
  {
    uint64_t v12 = [v9 type];
    int v13 = [v12 isEqualToString:*MEMORY[0x263F356D0]];

    if (!v13)
    {
      v31 = [v9 name];
      v30 = +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:v31];

      goto LABEL_31;
    }
    uint64_t v14 = [v7 localizedMessageForCharacteristic:v6];
    goto LABEL_13;
  }
  if (+[HMDBulletinCategory isSensorDetectedCharacteristic:v6])
  {
    id v79 = v7;
    id v15 = [v8 room];
    id v16 = [v15 name];

    id v17 = [v6 type];
    int v18 = [v17 isEqualToString:*MEMORY[0x263F354F8]];

    if (v18)
    {
      int v19 = [v9 name];
      v20 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
      __int16 v21 = +[HMDServiceNameComponents componentsWithRawServiceName:v19 rawRoomName:v16 localizedFormat:v20];

      uint64_t v22 = [v21 composedName];

      id v16 = (void *)v22;
    }
    __int16 v23 = NSString;
    id v24 = +[HMDBulletinCategory _sensorMap];
    uint64_t v25 = [v6 type];
    v26 = [v24 valueForKey:v25];
    v27 = HMDLocalizedStringForKey(v26);
    id v82 = 0;
    v75 = v16;
    v28 = +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:v16];
    v29 = [v23 localizedStringWithValidatedFormat:v27, @"%@", &v82, v28 validFormatSpecifiers error];
    id v77 = v82;

    if (v29)
    {
      v30 = v29;
    }
    else
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = HMFGetLogIdentifier();
        v50 = +[HMDBulletinCategory _sensorMap];
        v51 = [v6 type];
        v52 = [v50 valueForKey:v51];
        *(_DWORD *)buf = 138544130;
        v84 = v49;
        __int16 v85 = 2112;
        v86 = v52;
        __int16 v87 = 2112;
        v88 = @"%@";
        __int16 v89 = 2112;
        id v90 = v77;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      v53 = +[HMDBulletinCategory _sensorMap];
      v54 = [v6 type];
      v30 = [v53 valueForKey:v54];
    }
    id v7 = v79;

    goto LABEL_31;
  }
  v32 = [v6 type];
  if ([v32 isEqualToString:*MEMORY[0x263F35430]])
  {
    v33 = [v9 type];
    int v34 = [v33 isEqualToString:@"00000260-0000-1000-8000-0026BB765291"];

    if (v34)
    {
      uint64_t v14 = HMDLocalizedStringForKey(@"BULLETIN_KEYPAD_DISABLED_MESSAGE");
LABEL_13:
      v30 = (__CFString *)v14;
      goto LABEL_31;
    }
  }
  else
  {
  }
  v35 = [v6 type];
  uint64_t v36 = [a1 _presentationTypeForType:v35];

  v37 = [v6 value];
  v38 = [v6 type];
  uint64_t v39 = [a1 presentationValueForValue:v37 type:v38];

  v73 = (void *)v39;
  v76 = (void *)v36;
  uint64_t v40 = [a1 _localizedStateForValue:v39 characteristicType:v36];
  v41 = [v9 name];
  v42 = [v8 room];
  v43 = [v42 name];
  v44 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  v78 = +[HMDServiceNameComponents componentsWithRawServiceName:v41 rawRoomName:v43 localizedFormat:v44];

  v45 = [v9 type];
  uint64_t v46 = *MEMORY[0x263F357B8];
  id v80 = v7;
  v74 = v8;
  if (![v45 isEqualToString:*MEMORY[0x263F357B8]])
  {
    v55 = [v9 type];
    if ([v55 isEqualToString:*MEMORY[0x263F35748]])
    {
      v56 = [v9 associatedServiceType];
      int v57 = [v56 isEqualToString:v46];

      if (v57) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    v58 = @"BULLETIN_ACTION_DEFAULT";
    goto LABEL_26;
  }

LABEL_23:
  v58 = @"BULLETIN_ACTION_WINDOW_COVERING";
LABEL_26:
  v59 = v78;
  v60 = NSString;
  v61 = HMDLocalizedStringForKey(v58);
  id v81 = 0;
  v62 = [v78 composedName];
  [v60 localizedStringWithValidatedFormat:v61, @"%@ %@", &v81, v62, v40 validFormatSpecifiers error];
  v63 = (void *)v40;
  v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v65 = v81;

  v66 = v64;
  id v7 = v80;
  if (!v64)
  {
    v67 = v58;
    v72 = v63;
    v68 = (void *)MEMORY[0x230FBD990]();
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v84 = v70;
      __int16 v85 = 2112;
      v86 = v67;
      __int16 v87 = 2112;
      v88 = @"%@ %@";
      __int16 v89 = 2112;
      id v90 = v65;
      _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    v66 = v67;
    v63 = v72;
    v59 = v78;
  }
  v30 = v66;

  v8 = v74;
LABEL_31:

  return v30;
}

+ (id)localizedActionForCharacteristic:(id)a3
{
  id v4 = a3;
  char v5 = [v4 type];
  id v6 = [a1 _presentationTypeForType:v5];

  id v7 = [v4 value];
  v8 = [v4 type];

  v9 = [a1 presentationValueForValue:v7 type:v8];

  int v10 = [a1 _localizedStateForValue:v9 characteristicType:v6];
  int v11 = [v10 stringByCapitalizingFirstWord];

  return v11;
}

+ (id)localizedStringForItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5 == 2)
  {
    int v11 = NSString;
    uint64_t v12 = [v4 objectAtIndexedSubscript:0];
    int v13 = HMDLocalizedStringForKey(@"AND");
    uint64_t v14 = [v4 objectAtIndexedSubscript:1];
    int v10 = [v11 stringWithFormat:@"%@%@%@", v12, v13, v14];
  }
  else if (v5 == 1)
  {
    int v10 = [v4 objectAtIndexedSubscript:0];
  }
  else if (v5)
  {
    id v15 = [MEMORY[0x263F089D8] string];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __47__HMDBulletinCategory_localizedStringForItems___block_invoke;
    v18[3] = &unk_264A20CF8;
    id v19 = v4;
    id v20 = v15;
    id v16 = v15;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
    int v10 = (__CFString *)[v16 copy];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not determine localized string from empty items", buf, 0xCu);
    }
    int v10 = &stru_26E2EB898;
  }

  return v10;
}

void __47__HMDBulletinCategory_localizedStringForItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) count] - 1 == a3)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = HMDLocalizedStringForKey(@"AND");
    [v5 appendFormat:@"%@%@", v6, v10];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) count] - 2;
    v8 = *(void **)(a1 + 40);
    if (v7 == a3)
    {
      [v8 appendString:v10];
    }
    else
    {
      v9 = HMDLocalizedStringForKey(@"COMMA");
      [v8 appendFormat:@"%@%@", v10, v9];
    }
  }
}

+ (id)_sensorMap
{
  if (_sensorMap_onceToken != -1) {
    dispatch_once(&_sensorMap_onceToken, &__block_literal_global_82_134250);
  }
  uint64_t v2 = (void *)_sensorMap_sensorMap;
  return v2;
}

void __33__HMDBulletinCategory__sensorMap__block_invoke()
{
  v6[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F35450];
  v5[0] = *MEMORY[0x263F354F8];
  v5[1] = v0;
  v6[0] = @"BULLETIN_ACTION_SENSOR_MOTION";
  v6[1] = @"BULLETIN_ACTION_SENSOR_CO";
  uint64_t v1 = *MEMORY[0x263F35568];
  v5[2] = *MEMORY[0x263F35448];
  v5[3] = v1;
  v6[2] = @"BULLETIN_ACTION_SENSOR_CO2";
  v6[3] = @"BULLETIN_ACTION_SENSOR_SMOKE";
  uint64_t v2 = *MEMORY[0x263F35510];
  v5[4] = *MEMORY[0x263F354E8];
  v5[5] = v2;
  v6[4] = @"BULLETIN_ACTION_SENSOR_LEAK";
  v6[5] = @"BULLETIN_ACTION_SENSOR_OCCUPANCY";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)_sensorMap_sensorMap;
  _sensorMap_sensorMap = v3;
}

+ (id)_secureStateMap
{
  if (_secureStateMap_onceToken != -1) {
    dispatch_once(&_secureStateMap_onceToken, &__block_literal_global_63_134270);
  }
  uint64_t v2 = (void *)_secureStateMap_secureStateMap;
  return v2;
}

void __38__HMDBulletinCategory__secureStateMap__block_invoke()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F35490];
  v4[0] = *MEMORY[0x263F35468];
  v4[1] = v0;
  v5[0] = &unk_26E4741E8;
  v5[1] = &unk_26E474200;
  uint64_t v1 = *MEMORY[0x263F35458];
  v4[2] = *MEMORY[0x263F354A0];
  v4[3] = v1;
  v5[2] = &unk_26E474218;
  v5[3] = &unk_26E474230;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v3 = (void *)_secureStateMap_secureStateMap;
  _secureStateMap_secureStateMap = v2;
}

+ (id)_enumerationValueLocalizationKeys
{
  if (_enumerationValueLocalizationKeys_onceToken != -1) {
    dispatch_once(&_enumerationValueLocalizationKeys_onceToken, &__block_literal_global_134272);
  }
  uint64_t v2 = (void *)_enumerationValueLocalizationKeys_localizationKeys;
  return v2;
}

void __56__HMDBulletinCategory__enumerationValueLocalizationKeys__block_invoke()
{
  v6[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F35488];
  v5[0] = *MEMORY[0x263F35468];
  v5[1] = v0;
  v6[0] = &unk_26E474158;
  v6[1] = &unk_26E474170;
  uint64_t v1 = *MEMORY[0x263F354E0];
  v5[2] = *MEMORY[0x263F354A0];
  v5[3] = v1;
  v6[2] = &unk_26E474188;
  v6[3] = &unk_26E4741A0;
  uint64_t v2 = *MEMORY[0x263F35458];
  v5[4] = *MEMORY[0x263F354F8];
  void v5[5] = v2;
  v6[4] = &unk_26E4741B8;
  v6[5] = &unk_26E4741D0;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)_enumerationValueLocalizationKeys_localizationKeys;
  _enumerationValueLocalizationKeys_localizationKeys = v3;
}

@end