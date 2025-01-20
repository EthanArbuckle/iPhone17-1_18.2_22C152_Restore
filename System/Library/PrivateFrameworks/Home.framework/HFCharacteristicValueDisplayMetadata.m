@interface HFCharacteristicValueDisplayMetadata
+ (id)_errorForSymptomHandler:(id)a3 isFixingCurrently:(BOOL)a4 withContextProvider:(id)a5;
+ (id)displayMetadataForAccessory:(id)a3 withContextProvider:(id)a4;
+ (id)displayMetadataForMediaProfile:(id)a3 withContextProvider:(id)a4;
+ (id)displayMetadataForService:(id)a3 characteristicReadResponse:(id)a4;
+ (int64_t)_unknownStatePriorityForServiceDescriptor:(id)a3 characteristicReadResponse:(id)a4;
+ (void)_displayAppleIDSplitErrorForMediaProfile:(id)a3 havingMetadata:(id)a4 withContextProvider:(id)a5;
+ (void)_overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:(id)a3 withAccessory:(id)a4;
+ (void)_populateSplitMediaAccountErrorForMedatadata:(id)a3 withContextProvider:(id)a4;
- (HFCharacteristicValueDisplayError)error;
- (HFServiceState)serviceState;
- (NAFuture)splitAccountFuture;
- (NSString)sortKey;
- (int64_t)primaryState;
- (int64_t)priority;
- (int64_t)transitioningPrimaryState;
- (void)dealloc;
- (void)parseActiveStateForServiceType:(id)a3 response:(id)a4;
- (void)parseAirPurifierResponse:(id)a3;
- (void)parseCurrentTargetPositionForServiceType:(id)a3 response:(id)a4;
- (void)parseGarageDoorOpenerResponse:(id)a3;
- (void)parseHumidifierDehumidifierResponse:(id)a3;
- (void)parseInformationalSensorWithServiceType:(id)a3 response:(id)a4;
- (void)parseLockMechanismResponse:(id)a3;
- (void)parsePowerStateForServiceType:(id)a3 response:(id)a4;
- (void)parseProgammableSwitchOfType:(id)a3 response:(id)a4;
- (void)parseSecuritySystemResponse:(id)a3;
- (void)parseThermostatResponse:(id)a3 serviceType:(id)a4;
- (void)parseWarningSensorWithServiceType:(id)a3 response:(id)a4;
- (void)setError:(id)a3;
- (void)setPrimaryState:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setServiceState:(id)a3;
- (void)setSortKey:(id)a3;
- (void)setSplitAccountFuture:(id)a3;
- (void)setTransitioningPrimaryState:(int64_t)a3;
@end

@implementation HFCharacteristicValueDisplayMetadata

+ (id)displayMetadataForService:(id)a3 characteristicReadResponse:(id)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v77 = v6;
  v8 = objc_msgSend(v6, "hf_serviceDescriptor");
  uint64_t v9 = [v8 serviceType];
  id v74 = a1;
  v71 = v8;
  v78 = v7;
  v75 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", [a1 _unknownStatePriorityForServiceDescriptor:v8 characteristicReadResponse:v7]);
  uint64_t v69 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorServiceTypes");
  uint64_t v68 = __HFSimplePowerStateServices_block_invoke();
  uint64_t v67 = __HFSimpleActiveStateServices_block_invoke();
  v72 = __HFCurrentTargetPositionServices_block_invoke();
  v70 = (void *)v9;
  v10 = objc_msgSend(MEMORY[0x263F0E708], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v9);
  v11 = [v10 allObjects];
  v12 = objc_msgSend(MEMORY[0x263F0E248], "hf_characteristicSortComparator");
  v13 = [v11 sortedArrayUsingComparator:v12];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v82;
    char v17 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v82 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        v20 = [v78 responseForCharacteristicType:v19];
        v21 = [v20 error];
        v22 = v21;
        if (v20) {
          int v23 = objc_msgSend(v21, "hf_isHFErrorWithCode:", 4);
        }
        else {
          int v23 = 0;
        }
        v24 = HFLogForCategory(0x39uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413826;
          id v86 = v74;
          __int16 v87 = 2112;
          v88 = v31;
          __int16 v89 = 2112;
          v90 = v77;
          __int16 v91 = 2112;
          uint64_t v92 = v19;
          __int16 v93 = 2112;
          v94 = v20;
          __int16 v95 = 2112;
          v96 = v22;
          __int16 v97 = 1024;
          int v98 = v23;
          _os_log_debug_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEBUG, "%@:%@ Service: %@ CharacteristicType: %@, aReadResponse: %@, readError: %@, readPolicyDisallowedRead: %{BOOL}d", buf, 0x44u);
        }
        v17 &= v20 != 0;
        if (v23)
        {
          v25 = [v77 accessory];
          char v26 = objc_msgSend(v25, "hf_isHomePod");

          v17 &= v26;
        }
        if (objc_msgSend(v22, "hf_isHFErrorWithCode:", 103))
        {

          v22 = 0;
        }
        else if (v22)
        {
          v27 = [v20 readTraits];
          v28 = [v78 contextProvider];
          v29 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v22 readTraits:v27 contextProvider:v28];
          [(HFCharacteristicValueDisplayMetadata *)v75 setError:v29];

          v30 = [(HFCharacteristicValueDisplayMetadata *)v75 error];

          if (v30)
          {

            goto LABEL_22;
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v17 = 1;
  }
LABEL_22:

  v32 = [(HFCharacteristicValueDisplayMetadata *)v75 error];

  if (!v32 && (v17 & 1) == 0)
  {
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke;
    v79[3] = &unk_26408D210;
    id v33 = v78;
    id v80 = v33;
    int v34 = objc_msgSend(obj, "na_any:", v79);
    v35 = [v33 allCharacteristics];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      if (!v34)
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 setPriority:-1];
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      v37 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v65 = [v77 accessory];
        *(_DWORD *)buf = 138412546;
        id v86 = v77;
        __int16 v87 = 2112;
        v88 = v65;
        _os_log_error_impl(&dword_20B986000, v37, OS_LOG_TYPE_ERROR, "Read response empty for service %@ in accessory %@", buf, 0x16u);
      }
    }
    v38 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    v39 = [MEMORY[0x263EFFA08] set];
    v40 = [v33 contextProvider];
    v41 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v38 readTraits:v39 contextProvider:v40];
    [(HFCharacteristicValueDisplayMetadata *)v75 setError:v41];

    goto LABEL_31;
  }
LABEL_32:
  v42 = [v77 accessory];
  uint64_t v43 = objc_msgSend(v42, "hf_siriEndpointProfile");
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(HFCharacteristicValueDisplayMetadata *)v75 error];

    v47 = (void *)v69;
    v46 = v70;
    v49 = (void *)v67;
    v48 = (void *)v68;
    if (v45) {
      goto LABEL_38;
    }
    v50 = [v77 accessory];
    v42 = objc_msgSend(v50, "hf_errorForCurrentSessionState");

    if (v42)
    {
      v51 = [MEMORY[0x263EFFA08] set];
      v52 = [v78 contextProvider];
      v53 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v42 readTraits:v51 contextProvider:v52];
      [(HFCharacteristicValueDisplayMetadata *)v75 setError:v53];
    }
  }
  else
  {
    v47 = (void *)v69;
    v46 = v70;
    v49 = (void *)v67;
    v48 = (void *)v68;
  }

LABEL_38:
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    v54 = [(HFCharacteristicValueDisplayMetadata *)v75 error];

    if (v54)
    {
      v55 = [v77 accessory];
      [v74 _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:v75 withAccessory:v55];
    }
  }
  v56 = [(HFCharacteristicValueDisplayMetadata *)v75 error];
  int v57 = [v56 isPersistentError];

  if (v57) {
    [(HFCharacteristicValueDisplayMetadata *)v75 setPriority:0];
  }
  v58 = +[HFServiceState stateClassForServiceDescriptor:v71];
  if (v58)
  {
    id v59 = (id)[[v58 alloc] initWithBatchReadResponse:v78];
    if (v59)
    {
      [(HFCharacteristicValueDisplayMetadata *)v75 setServiceState:v59];
      -[HFCharacteristicValueDisplayMetadata setPrimaryState:](v75, "setPrimaryState:", [v59 primaryState]);
      -[HFCharacteristicValueDisplayMetadata setPriority:](v75, "setPriority:", [v59 priority]);
      if ([v59 isTransitioning])
      {
        uint64_t v60 = [v59 primaryState];
        if (v60 == 2) {
          uint64_t v61 = 1;
        }
        else {
          uint64_t v61 = 2 * (v60 == 1);
        }
        [(HFCharacteristicValueDisplayMetadata *)v75 setTransitioningPrimaryState:v61];
      }
      v62 = (void *)MEMORY[0x263F0E708];
      v63 = [v71 serviceType];
      v64 = [v62 localizedDescriptionForServiceType:v63];
      [(HFCharacteristicValueDisplayMetadata *)v75 setSortKey:v64];
    }
LABEL_52:

    goto LABEL_76;
  }
  if (![v46 isEqualToString:*MEMORY[0x263F0D610]])
  {
    if (![v47 containsObject:v46])
    {
      if ([v48 containsObject:v46])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parsePowerStateForServiceType:v46 response:v78];
      }
      else if ([v49 containsObject:v46])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseActiveStateForServiceType:v46 response:v78];
      }
      else if ([v72 containsObject:v46])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseCurrentTargetPositionForServiceType:v46 response:v78];
      }
      else if ([v46 isEqualToString:*MEMORY[0x263F0D6F8]])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseGarageDoorOpenerResponse:v78];
      }
      else if ([v46 isEqualToString:*MEMORY[0x263F0D798]])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseLockMechanismResponse:v78];
      }
      else if ([v46 isEqualToString:*MEMORY[0x263F0D7D8]])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseSecuritySystemResponse:v78];
      }
      else if (([v46 isEqualToString:*MEMORY[0x263F0D870]] & 1) != 0 {
             || [v46 isEqualToString:*MEMORY[0x263F0D708]])
      }
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseThermostatResponse:v78 serviceType:v46];
      }
      else if ([v46 isEqualToString:*MEMORY[0x263F0D618]])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseAirPurifierResponse:v78];
      }
      else if ([v46 isEqualToString:*MEMORY[0x263F0D720]])
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseHumidifierDehumidifierResponse:v78];
      }
      else if (([v46 isEqualToString:*MEMORY[0x263F0D820]] & 1) != 0 {
             || [v46 isEqualToString:*MEMORY[0x263F0D818]])
      }
      {
        [(HFCharacteristicValueDisplayMetadata *)v75 parseProgammableSwitchOfType:v46 response:v78];
      }
      else
      {
        NSLog(&cfstr_UnknownOrUnimp.isa, v46);
      }
      goto LABEL_76;
    }
    if (qword_26AB2F080 != -1) {
      dispatch_once(&qword_26AB2F080, &__block_literal_global_120_0);
    }
    id v59 = (id)qword_26AB2F088;
    if ([v59 containsObject:v46]) {
      [(HFCharacteristicValueDisplayMetadata *)v75 parseWarningSensorWithServiceType:v46 response:v78];
    }
    else {
      [(HFCharacteristicValueDisplayMetadata *)v75 parseInformationalSensorWithServiceType:v46 response:v78];
    }
    goto LABEL_52;
  }
  [(HFCharacteristicValueDisplayMetadata *)v75 setPrimaryState:1];
  [(HFCharacteristicValueDisplayMetadata *)v75 setPriority:-1];
LABEL_76:

  return v75;
}

- (HFCharacteristicValueDisplayError)error
{
  return self->_error;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setError:(id)a3
{
}

+ (int64_t)_unknownStatePriorityForServiceDescriptor:(id)a3 characteristicReadResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_26AB2F090 != -1) {
    dispatch_once(&qword_26AB2F090, &__block_literal_global_130_0);
  }
  id v7 = (id)qword_26AB2F098;
  v8 = [v5 serviceType];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    int64_t v10 = 2;
  }
  else
  {
    v11 = (void *)MEMORY[0x263F0E708];
    v12 = [v5 serviceType];
    v13 = objc_msgSend(v11, "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v12);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_3;
    v16[3] = &unk_26408D210;
    id v17 = v6;
    int v14 = objc_msgSend(v13, "na_any:", v16);

    if (v14) {
      int64_t v10 = -1;
    }
    else {
      int64_t v10 = 1;
    }
  }
  return v10;
}

- (void)parseLockMechanismResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0C0B0];
  id v5 = a3;
  id v6 = [v5 responseForCharacteristicType:v4];
  id v17 = [v6 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C510]];

  v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  if (v17) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = [v17 integerValue];
    unint64_t v11 = [v8 integerValue];
    if (v10 > 3) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_20BD13750[v10];
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v12];
    if (v11 == v10 || (v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] == 1) {
        uint64_t v14 = -1;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      if (v11 > 3) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = qword_20BD13750[v11];
      }
      [(HFCharacteristicValueDisplayMetadata *)self setTransitioningPrimaryState:v15];
      uint64_t v14 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v14];
  }
  uint64_t v16 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyLock", @"HFStatusSortKeyLock", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v16];
}

- (void)parseActiveStateForServiceType:(id)a3 response:(id)a4
{
  id v11 = a3;
  id v6 = [a4 responseForCharacteristicType:*MEMORY[0x263F0BEF8]];
  id v7 = [v6 valueWithExpectedClass:objc_opt_class()];

  if (v7)
  {
    if ([v7 BOOLValue]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v8];
    if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v9];
  }
  if ([v11 isEqualToString:*MEMORY[0x263F0D890]])
  {
    unint64_t v10 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyFan", @"HFStatusSortKeyFan", 1);
    [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v10];
  }
}

- (void)setServiceState:(id)a3
{
}

- (void)parseInformationalSensorWithServiceType:(id)a3 response:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 responseForCharacteristicType:*MEMORY[0x263F0C438]];
  uint64_t v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  unint64_t v10 = [v7 responseForCharacteristicType:*MEMORY[0x263F0C418]];
  id v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  uint64_t v12 = *MEMORY[0x263F0D858];
  int v13 = [v6 isEqualToString:*MEMORY[0x263F0D858]];
  uint64_t v14 = (void *)MEMORY[0x263F0D768];
  if (v13)
  {
    uint64_t v15 = (id *)MEMORY[0x263F0C110];
LABEL_7:
    id v16 = *v15;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0D768]])
  {
    uint64_t v15 = (id *)MEMORY[0x263F0C0A0];
    goto LABEL_7;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F0D730]])
  {
    uint64_t v15 = (id *)MEMORY[0x263F0C0E0];
    goto LABEL_7;
  }
  NSLog(&cfstr_ServiceTypeNot.isa, v6);
  id v16 = 0;
LABEL_8:
  id v17 = [v7 responseForCharacteristicType:v16];
  v18 = [v17 valueWithExpectedClass:objc_opt_class()];

  if (v18)
  {
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:1];
    uint64_t v19 = *MEMORY[0x263F0D730];
    v25[0] = v12;
    v25[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    -[HFCharacteristicValueDisplayMetadata setPriority:](self, "setPriority:", [v20 containsObject:v6] - 1);

    if ([v9 integerValue] || objc_msgSend(v11, "integerValue"))
    {
      [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
      uint64_t v21 = [(HFCharacteristicValueDisplayMetadata *)self priority];
      if (v21 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v21;
      }
      [(HFCharacteristicValueDisplayMetadata *)self setPriority:v22];
    }
    uint64_t v14 = (void *)MEMORY[0x263F0D768];
  }
  else
  {
    uint64_t v19 = *MEMORY[0x263F0D730];
  }
  if ([v6 isEqualToString:v19])
  {
    int v23 = @"HFStatusSortKeyHumiditySensor";
LABEL_23:
    v24 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v24];

    goto LABEL_24;
  }
  if ([v6 isEqualToString:*v14])
  {
    int v23 = @"HFStatusSortKeyLightSensor";
    goto LABEL_23;
  }
  if ([v6 isEqualToString:v12])
  {
    int v23 = @"HFStatusSortKeyTemperatureSensor";
    goto LABEL_23;
  }
LABEL_24:
}

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allCharacteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2;
  v9[3] = &unk_2640903A0;
  id v10 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_filter:", v9);

  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_104_0);
  return v7;
}

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allCharacteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_4;
  v9[3] = &unk_2640903A0;
  id v10 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_filter:", v9);

  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_132);
  return v7;
}

- (int64_t)transitioningPrimaryState
{
  return self->_transitioningPrimaryState;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (int64_t)priority
{
  return self->_priority;
}

uint64_t __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [a2 service];
  id v3 = [v2 accessory];

  if (v3 && ([v3 isReachable] & 1) == 0)
  {
    id v5 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(v3, "hf_prettyDescription");
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Displaying unreachable for accessory: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (HFServiceState)serviceState
{
  return self->_serviceState;
}

uint64_t __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  id v3 = [v2 accessory];
  uint64_t v4 = objc_msgSend(v3, "hf_isSuspended");

  return v4;
}

- (void)parseGarageDoorOpenerResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0C040];
  id v5 = a3;
  id v6 = [v5 responseForCharacteristicType:v4];
  id v20 = [v6 valueWithExpectedClass:objc_opt_class()];

  uint64_t v7 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C4A8]];
  int v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  uint64_t v9 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C2B8]];

  uint64_t v10 = [v9 valueWithExpectedClass:objc_opt_class()];

  if (v20) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = [v20 integerValue];
    unint64_t v13 = [v8 integerValue];
    if (v12 > 4) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = qword_20BD13728[v12];
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v14];
    if (v13 == v12)
    {
      if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] == 1) {
        uint64_t v15 = -1;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {
      if (v13 > 4) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = qword_20BD13728[v13];
      }
      [(HFCharacteristicValueDisplayMetadata *)self setTransitioningPrimaryState:v16];
      uint64_t v15 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v15];
  }
  if ([v10 BOOLValue])
  {
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
    uint64_t v17 = [(HFCharacteristicValueDisplayMetadata *)self priority];
    if (v17 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v17;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v18];
  }
  uint64_t v19 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyGarageDoor", @"HFStatusSortKeyGarageDoor", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v19];
}

- (void)parseThermostatResponse:(id)a3 serviceType:(id)a4
{
  id v23 = a3;
  uint64_t v6 = *MEMORY[0x263F0C110];
  id v7 = a4;
  int v8 = [v23 responseForCharacteristicType:v6];
  uint64_t v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  uint64_t v10 = [v23 responseForCharacteristicType:*MEMORY[0x263F0C550]];
  BOOL v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  unint64_t v12 = +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:v23];
  unint64_t v13 = +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:v23];
  char v14 = [v7 isEqualToString:*MEMORY[0x263F0D870]];

  uint64_t v15 = [v23 allServices];
  uint64_t v16 = objc_msgSend(v15, "na_firstObjectPassingTest:", &__block_literal_global_193);

  if (v16)
  {
    uint64_t v17 = [v23 responseForCharacteristicType:*MEMORY[0x263F0BEF8] inService:v16];
    uint64_t v18 = [v17 valueWithExpectedClass:objc_opt_class()];

    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if (!v9) {
      goto LABEL_17;
    }
  }
  if (!v11)
  {
    if (v12) {
      char v19 = v14;
    }
    else {
      char v19 = 1;
    }
    if (v19) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (v12)
  {
LABEL_12:
    if (!v13) {
      goto LABEL_17;
    }
    uint64_t v20 = [v13 integerValue];
    if ((unint64_t)(v20 - 1) < 3) {
      goto LABEL_14;
    }
    if (v20) {
      goto LABEL_16;
    }
    if ([v12 integerValue] || v18 && (objc_msgSend(v18, "isEqual:", MEMORY[0x263EFFA80]) & 1) == 0) {
LABEL_14:
    }
      uint64_t v21 = 2;
    else {
      uint64_t v21 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v21];
LABEL_16:
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:0];
  }
LABEL_17:
  uint64_t v22 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyThermostat", @"HFStatusSortKeyThermostat", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v22];
}

- (void)parsePowerStateForServiceType:(id)a3 response:(id)a4
{
  id v12 = a3;
  uint64_t v6 = [a4 responseForCharacteristicType:*MEMORY[0x263F0C328]];
  id v7 = [v6 valueWithExpectedClass:objc_opt_class()];

  if (v7)
  {
    if ([v7 BOOLValue]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v8];
    if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v9];
  }
  if ([v12 isEqualToString:*MEMORY[0x263F0D6C8]])
  {
    uint64_t v10 = @"HFStatusSortKeyFan";
  }
  else if ([v12 isEqualToString:*MEMORY[0x263F0D780]])
  {
    uint64_t v10 = @"HFStatusSortKeyLightbulb";
  }
  else if ([v12 isEqualToString:*MEMORY[0x263F0D7D0]])
  {
    uint64_t v10 = @"HFStatusSortKeyOutlet";
  }
  else
  {
    if (![v12 isEqualToString:*MEMORY[0x263F0D828]]) {
      goto LABEL_18;
    }
    uint64_t v10 = @"HFStatusSortKeySwitch";
  }
  BOOL v11 = _HFLocalizedStringWithDefaultValue(v10, v10, 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v11];

LABEL_18:
}

- (void)setSortKey:(id)a3
{
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)dealloc
{
  id v3 = [(HFCharacteristicValueDisplayMetadata *)self splitAccountFuture];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HFCharacteristicValueDisplayMetadata;
  [(HFCharacteristicValueDisplayMetadata *)&v4 dealloc];
}

- (NAFuture)splitAccountFuture
{
  return self->_splitAccountFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitAccountFuture, 0);
  objc_storeStrong((id *)&self->_serviceState, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
}

uint64_t __76__HFCharacteristicValueDisplayMetadata_parseThermostatResponse_serviceType___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

- (void)parseWarningSensorWithServiceType:(id)a3 response:(id)a4
{
  id v20 = a3;
  uint64_t v6 = *MEMORY[0x263F0C438];
  id v7 = a4;
  uint64_t v8 = [v7 responseForCharacteristicType:v6];
  uint64_t v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  uint64_t v10 = [v7 responseForCharacteristicType:*MEMORY[0x263F0C418]];
  BOOL v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  id v12 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorCharacteristicTypeForServiceType:", v20);
  unint64_t v13 = [v7 responseForCharacteristicType:v12];

  char v14 = [v13 value];

  if (!v14) {
    goto LABEL_16;
  }
  [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:1];
  [(HFCharacteristicValueDisplayMetadata *)self setPriority:-1];
  if (([v12 isEqualToString:*MEMORY[0x263F0BF80]] & 1) == 0
    && ([v12 isEqualToString:*MEMORY[0x263F0BFB0]] & 1) == 0
    && ([v12 isEqualToString:*MEMORY[0x263F0C3F0]] & 1) == 0
    && ![v12 isEqualToString:*MEMORY[0x263F0C238]])
  {
    if (([v12 isEqualToString:*MEMORY[0x263F0C288]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x263F0C2C0]] & 1) != 0
      || [v12 isEqualToString:*MEMORY[0x263F0C008]])
    {
      if (([v14 BOOLValue] & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      if (![v12 isEqualToString:*MEMORY[0x263F0BF40]]) {
        goto LABEL_10;
      }
      if (([v14 integerValue] & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        uint64_t v15 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v15 = 1;
LABEL_8:
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
LABEL_9:
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v15];
    goto LABEL_10;
  }
  if ([v14 BOOLValue])
  {
    uint64_t v15 = 2;
    goto LABEL_8;
  }
LABEL_10:
  if ([v9 integerValue] || objc_msgSend(v11, "integerValue"))
  {
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
    uint64_t v16 = [(HFCharacteristicValueDisplayMetadata *)self priority];
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v17];
  }
LABEL_16:
  if ([v20 isEqualToString:*MEMORY[0x263F0D630]])
  {
    uint64_t v18 = @"HFStatusSortKeyAirQualitySensor";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D670]])
  {
    uint64_t v18 = @"HFStatusSortKeyCO2Alarm";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D688]])
  {
    uint64_t v18 = @"HFStatusSortKeyCOAlarm";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D698]])
  {
    uint64_t v18 = @"HFStatusSortKeyContactSensor";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D758]])
  {
    uint64_t v18 = @"HFStatusSortKeyLeakAlarm";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D7A8]])
  {
    uint64_t v18 = @"HFStatusSortKeyMotionAlarm";
  }
  else if ([v20 isEqualToString:*MEMORY[0x263F0D7B8]])
  {
    uint64_t v18 = @"HFStatusSortKeyOccupancyAlarm";
  }
  else
  {
    if (![v20 isEqualToString:*MEMORY[0x263F0D7F8]]) {
      goto LABEL_38;
    }
    uint64_t v18 = @"HFStatusSortKeySmokeAlarm";
  }
  char v19 = _HFLocalizedStringWithDefaultValue(v18, v18, 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v19];

LABEL_38:
}

+ (id)displayMetadataForAccessory:(id)a3 withContextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  [(HFCharacteristicValueDisplayMetadata *)v8 setPrimaryState:1];
  [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:-1];
  if (([v6 isReachable] & 1) == 0)
  {
    [(HFCharacteristicValueDisplayMetadata *)v8 setPrimaryState:0];
    [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:1];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    uint64_t v10 = [MEMORY[0x263EFFA08] set];
    BOOL v11 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v9 readTraits:v10 contextProvider:v7];
    [(HFCharacteristicValueDisplayMetadata *)v8 setError:v11];
  }
  uint64_t v12 = objc_msgSend(v6, "hf_siriEndpointProfile");
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    char v14 = [(HFCharacteristicValueDisplayMetadata *)v8 error];

    if (!v14)
    {
      uint64_t v15 = objc_msgSend(v6, "hf_errorForCurrentSessionState");
      if (v15)
      {
        uint64_t v16 = [MEMORY[0x263EFFA08] set];
        uint64_t v17 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v15 readTraits:v16 contextProvider:v7];
        [(HFCharacteristicValueDisplayMetadata *)v8 setError:v17];
      }
    }
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    uint64_t v18 = [(HFCharacteristicValueDisplayMetadata *)v8 error];

    if (v18) {
      [a1 _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:v8 withAccessory:v6];
    }
  }
  char v19 = [(HFCharacteristicValueDisplayMetadata *)v8 error];

  if (!v19)
  {
    id v20 = +[HFSymptomFixManager sharedManager];
    uint64_t v21 = [v20 anySymptomIsBeingFixedForFixableObject:v6];

    uint64_t v22 = [v6 symptomsHandler];
    id v23 = [a1 _errorForSymptomHandler:v22 isFixingCurrently:v21 withContextProvider:v7];
    [(HFCharacteristicValueDisplayMetadata *)v8 setError:v23];
  }
  v24 = [(HFCharacteristicValueDisplayMetadata *)v8 error];
  int v25 = [v24 isPersistentError];

  if (v25) {
    [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:0];
  }

  return v8;
}

+ (id)_errorForSymptomHandler:(id)a3 isFixingCurrently:(BOOL)a4 withContextProvider:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = objc_msgSend(a3, "hf_symptomsSortedByPriority");
  if ([v8 count])
  {
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = +[HFCharacteristicValueDisplayError errorWithUnderlyingSymptom:v9 isFixingCurrently:v5 contextProvider:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __109__HFCharacteristicValueDisplayMetadata__unknownStatePriorityForServiceDescriptor_characteristicReadResponse___block_invoke_2()
{
  v7[7] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D6A8];
  v7[0] = *MEMORY[0x263F0D688];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D798];
  v7[2] = *MEMORY[0x263F0D6F8];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D7F8];
  v7[4] = *MEMORY[0x263F0D7D8];
  v7[5] = v3;
  v7[6] = *MEMORY[0x263F0D8A8];
  objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:7];
  uint64_t v5 = [v0 setWithArray:v4];
  id v6 = (void *)qword_26AB2F098;
  qword_26AB2F098 = v5;
}

void __93__HFCharacteristicValueDisplayMetadata_displayMetadataForService_characteristicReadResponse___block_invoke_2_118()
{
  v8[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D670];
  v8[0] = *MEMORY[0x263F0D630];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D698];
  v8[2] = *MEMORY[0x263F0D688];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D7A8];
  v8[4] = *MEMORY[0x263F0D758];
  v8[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0D7F8];
  v8[6] = *MEMORY[0x263F0D7B8];
  v8[7] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];
  uint64_t v6 = [v0 setWithArray:v5];
  id v7 = (void *)qword_26AB2F088;
  qword_26AB2F088 = v6;
}

+ (void)_overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata:(id)a3 withAccessory:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (![v6 supportsCHIP] || !objc_msgSend(v6, "requiresThreadRouter")) {
    goto LABEL_6;
  }
  id v7 = [v5 error];
  if ([v7 category] == 1)
  {

    goto LABEL_8;
  }
  uint64_t v8 = [v5 error];
  uint64_t v9 = [v8 category];

  if (v9)
  {
LABEL_6:
    uint64_t v10 = HFLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v6 supportsCHIP];
      BOOL v12 = +[HFUtilities supportsThreadService];
      unint64_t v13 = [v6 home];
      int v14 = objc_msgSend(v13, "hf_hasResident");
      uint64_t v15 = [v5 error];
      int v25 = 136316162;
      char v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      __int16 v27 = 1024;
      int v28 = v11;
      __int16 v29 = 1024;
      BOOL v30 = v12;
      __int16 v31 = 1024;
      int v32 = v14;
      __int16 v33 = 2048;
      uint64_t v34 = [v15 category];
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%s not overriding error category due to no thread network: [accessory supportsCHIP = %d], [HFUtilities supportsThreadService] = %d, hasResident = %d, displayMetadata.error.category = %lu", (uint8_t *)&v25, 0x28u);
    }
    goto LABEL_21;
  }
LABEL_8:
  if (!+[HFUtilities supportsThreadService])
  {
    id v23 = HFLogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      char v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableCurrentDeviceNoThreadNetwork", (uint8_t *)&v25, 0xCu);
    }

    uint64_t v21 = [v5 error];
    uint64_t v10 = v21;
    uint64_t v22 = 4;
    goto LABEL_20;
  }
  uint64_t v16 = [v6 home];
  char v17 = objc_msgSend(v16, "hf_hasResident");

  if ((v17 & 1) == 0)
  {
    v24 = HFLogForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      char v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableNoThreadNetworkNoResident", (uint8_t *)&v25, 0xCu);
    }

    uint64_t v21 = [v5 error];
    uint64_t v10 = v21;
    uint64_t v22 = 2;
    goto LABEL_20;
  }
  uint64_t v18 = [v6 home];
  char v19 = objc_msgSend(v18, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter");

  if ((v19 & 1) == 0)
  {
    id v20 = HFLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      char v26 = "+[HFCharacteristicValueDisplayMetadata _overrideDisplayErrorCategoryWithThreadNetworkErrorForDisplayMetadata"
            ":withAccessory:]";
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "%s overriding error category to HFCharacteristicValueDisplayErrorCategoryUnreachableNoThreadNetworkResidentWithoutThread", (uint8_t *)&v25, 0xCu);
    }

    uint64_t v21 = [v5 error];
    uint64_t v10 = v21;
    uint64_t v22 = 3;
LABEL_20:
    [v21 setCategory:v22];
LABEL_21:
  }
}

+ (id)displayMetadataForMediaProfile:(id)a3 withContextProvider:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(HFCharacteristicValueDisplayMetadata);
  [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:-1];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke;
  v63[3] = &unk_264094500;
  id v9 = v6;
  id v64 = v9;
  [(HFCharacteristicValueDisplayMetadata *)v8 setPrimaryState:__91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke((uint64_t)v63)];
  uint64_t v10 = objc_msgSend(v9, "hf_mediaValueSource");
  int v11 = objc_msgSend(v9, "hf_mediaRouteIdentifier");
  id v59 = v10;
  BOOL v12 = [v10 cachedPlaybackStateWriteErrorForRouteID:v11];

  uint64_t v60 = v12;
  if (!objc_msgSend(v9, "hf_isReachable") || v12)
  {
    [(HFCharacteristicValueDisplayMetadata *)v8 setPrimaryState:0];
    [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:1];
    if (v12)
    {
      id v17 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v16 = v17;
LABEL_10:
    uint64_t v18 = [MEMORY[0x263EFFA08] set];
    char v19 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v16 readTraits:v18 contextProvider:v7];
    [(HFCharacteristicValueDisplayMetadata *)v8 setError:v19];

    goto LABEL_11;
  }
  unint64_t v13 = objc_msgSend(v9, "hf_backingAccessory");
  int v14 = objc_msgSend(v13, "hf_siriEndpointProfile");

  if (!v14) {
    goto LABEL_12;
  }
  uint64_t v15 = objc_msgSend(v9, "hf_backingAccessory");
  uint64_t v16 = objc_msgSend(v15, "hf_errorForCurrentSessionState");

  if (v16) {
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  id v20 = [(HFCharacteristicValueDisplayMetadata *)v8 error];
  if (v20)
  {

    goto LABEL_14;
  }
  id v23 = [v9 symptomsHandler];

  if (!v23)
  {
LABEL_14:
    uint64_t v21 = [v9 symptoms];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke_2;
    v61[3] = &unk_264094528;
    id v62 = v9;
    int v22 = objc_msgSend(v21, "na_any:", v61);

    if (!v22) {
      goto LABEL_18;
    }
  }
  v24 = +[HFSymptomFixManager sharedManager];
  uint64_t v25 = [v24 anySymptomIsBeingFixedForFixableObject:v9];

  char v26 = [v9 symptomsHandler];
  __int16 v27 = [a1 _errorForSymptomHandler:v26 isFixingCurrently:v25 withContextProvider:v7];
  [(HFCharacteristicValueDisplayMetadata *)v8 setError:v27];

LABEL_18:
  if (objc_msgSend(v9, "hf_homePodIsCapableOfShowingSplitAccountError"))
  {
    int v28 = [(HFCharacteristicValueDisplayMetadata *)v8 error];
    __int16 v29 = [v28 underlyingSymptom];

    if (!v29) {
      [a1 _displayAppleIDSplitErrorForMediaProfile:v9 havingMetadata:v8 withContextProvider:v7];
    }
  }
  BOOL v30 = [(HFCharacteristicValueDisplayMetadata *)v8 error];
  int v31 = [v30 isPersistentError];

  if (v31) {
    [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:0];
  }
  int v32 = +[HFMediaAccessoryUtility sharedInstance];
  __int16 v33 = [v9 uniqueIdentifier];
  uint64_t v34 = [v33 UUIDString];
  int v35 = [v32 isHomePodRestartingCurrently:v34];

  uint64_t v36 = +[HFMediaAccessoryUtility sharedInstance];
  v37 = objc_msgSend(v9, "hf_backingAccessory");
  v38 = [v37 uniqueIdentifier];
  v39 = [v38 UUIDString];
  int v40 = [v36 isHomePodRestartingCurrently:v39];

  if ((v35 & 1) != 0 || v40)
  {
    v41 = HFLogForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(v9, "hf_backingAccessory");
      uint64_t v43 = [v42 uniqueIdentifier];
      v44 = [v9 uniqueIdentifier];
      v45 = objc_msgSend(v9, "hf_backingAccessory");
      int v46 = objc_msgSend(v45, "hf_isHomePod");
      *(_DWORD *)buf = 136316418;
      v66 = "+[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:]";
      __int16 v67 = 2112;
      uint64_t v68 = v43;
      __int16 v69 = 2112;
      v70 = v44;
      __int16 v71 = 1024;
      int v72 = v46;
      __int16 v73 = 1024;
      int v74 = v35;
      __int16 v75 = 1024;
      int v76 = v40;
      _os_log_impl(&dword_20B986000, v41, OS_LOG_TYPE_DEFAULT, "%s mediaProfile.hf_backingAccessory.uniqueIdentifier: %@ mediaProfile.uniqueIdentifier: %@ HomePod: %{BOOL}d IsGroupedAccessoryRestarting: %{BOOL}d IsSoloAccessoryRestarting: %{BOOL}d", buf, 0x32u);
    }
  }
  v47 = [v9 uniqueIdentifier];
  if (v47) {
    int v48 = v35;
  }
  else {
    int v48 = 0;
  }

  if (v48 == 1)
  {
    v49 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 58);
    v50 = (void *)MEMORY[0x263EFFA08];
  }
  else
  {
    v49 = [(HFCharacteristicValueDisplayMetadata *)v8 error];
    if (v49) {
      int v51 = 0;
    }
    else {
      int v51 = v40;
    }
    if (v51 != 1) {
      goto LABEL_42;
    }
    v52 = objc_msgSend(v9, "hf_backingAccessory");
    int v53 = objc_msgSend(v52, "hf_isHomePod");

    v54 = v60;
    if (!v53) {
      goto LABEL_43;
    }
    v55 = HFLogForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:withContextProvider:]";
      _os_log_impl(&dword_20B986000, v55, OS_LOG_TYPE_DEFAULT, "%s HomePodDeviceRestarting setting displayMetadata", buf, 0xCu);
    }

    v49 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 58);
    v50 = (void *)MEMORY[0x263EFFA08];
  }
  v56 = [v50 set];
  int v57 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v49 readTraits:v56 contextProvider:v7];
  [(HFCharacteristicValueDisplayMetadata *)v8 setError:v57];

  [(HFCharacteristicValueDisplayMetadata *)v8 setPriority:0];
LABEL_42:

  v54 = v60;
LABEL_43:

  return v8;
}

uint64_t __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mediaSession];
  if ([v1 playbackState] == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t __91__HFCharacteristicValueDisplayMetadata_displayMetadataForMediaProfile_withContextProvider___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 type];
  if (v3 > 0x14) {
    return 0;
  }
  unint64_t v4 = v3;
  if (((1 << v3) & 0x180806) == 0) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) accessories];
  id v6 = [v5 anyObject];
  uint64_t v7 = objc_msgSend(v6, "hf_shouldDisplayManualFixOptionForSymptom:", v4);

  return v7;
}

+ (void)_displayAppleIDSplitErrorForMediaProfile:(id)a3 havingMetadata:(id)a4 withContextProvider:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = objc_msgSend(v9, "hf_settingsValueManager");
  unint64_t v13 = [v12 valueForSettingAtKeyPath:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];
  int v14 = [v13 BOOLValue];

  uint64_t v15 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v26 = a1;
    __int16 v27 = 2112;
    int v28 = v16;
    __int16 v29 = 1024;
    int v30 = v14;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Was the Split Account warning dismissed? [%d]", buf, 0x1Cu);
  }
  objc_initWeak((id *)buf, a1);
  id v17 = objc_msgSend(v9, "hf_homePodSupportsMultiUserLanguage");
  if (v17) {
    char v18 = v14;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke;
    v20[3] = &unk_264094578;
    objc_copyWeak(v24, (id *)buf);
    id v21 = v10;
    id v22 = v9;
    id v23 = v11;
    v24[1] = (id)a2;
    id v19 = (id)[v17 addCompletionBlock:v20];

    objc_destroyWeak(v24);
  }

  objc_destroyWeak((id *)buf);
}

void __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    uint64_t v8 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", location, 0x20u);
    }
  }
  else
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    if ((objc_msgSend(*(id *)(a1 + 40), "hf_supportsPreferredMediaUser") & 1) == 0)
    {
      id v9 = objc_msgSend(*(id *)(a1 + 40), "hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount");
      [*(id *)(a1 + 32) setSplitAccountFuture:v9];
    }
    id v10 = [*(id *)(a1 + 32) splitAccountFuture];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke_2;
    v15[3] = &unk_264094550;
    objc_copyWeak(v17, (id *)location);
    v15[4] = WeakRetained;
    id v11 = *(id *)(a1 + 48);
    BOOL v12 = *(void **)(a1 + 64);
    id v16 = v11;
    v17[1] = v12;
    id v13 = (id)[v10 addCompletionBlock:v15];

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)location);
  }
}

void __116__HFCharacteristicValueDisplayMetadata__displayAppleIDSplitErrorForMediaProfile_havingMetadata_withContextProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v4)
  {
    id v6 = HFLogForCategory(5uLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      goto LABEL_9;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ No Error returned. Accounts don't appear to be split", (uint8_t *)&v10, 0x16u);
LABEL_6:

    goto LABEL_8;
  }
  if ([v4 code] != 56)
  {
    id v6 = HFLogForCategory(5uLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) _populateSplitMediaAccountErrorForMedatadata:WeakRetained withContextProvider:*(void *)(a1 + 40)];
LABEL_9:
}

+ (void)_populateSplitMediaAccountErrorForMedatadata:(id)a3 withContextProvider:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "hf_errorWithCode:", 56);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [MEMORY[0x263EFFA08] set];
  uint64_t v9 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v10 readTraits:v8 contextProvider:v6];

  [v7 setError:v9];
}

- (void)parseSecuritySystemResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0C0E8];
  id v5 = a3;
  id v6 = [v5 responseForCharacteristicType:v4];
  id v22 = [v6 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C548]];
  uint64_t v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  uint64_t v9 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C438]];
  id v10 = [v9 valueWithExpectedClass:objc_opt_class()];

  uint64_t v11 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C418]];

  __int16 v12 = [v11 valueWithExpectedClass:objc_opt_class()];

  if (v22) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_27;
  }
  unint64_t v14 = [v22 integerValue];
  unint64_t v15 = [v8 integerValue];
  if (v14 >= 3)
  {
    if (v14 == 3)
    {
      uint64_t v17 = 1;
    }
    else
    {
      if (v14 == 4) {
        goto LABEL_8;
      }
      uint64_t v17 = 0;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v17];
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v16 = 2;
  [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
  if (v14 != 4)
  {
LABEL_13:
    if (v15 != v14)
    {
      if (v15 > 4) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = qword_20BD13770[v15];
      }
      [(HFCharacteristicValueDisplayMetadata *)self setTransitioningPrimaryState:v18];
      unint64_t v14 = v15;
    }
    if (v14 == 4) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = v14 == 3;
    }
  }
  [(HFCharacteristicValueDisplayMetadata *)self setPriority:v16];
  if ([v10 integerValue] || objc_msgSend(v12, "integerValue"))
  {
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
    uint64_t v19 = [(HFCharacteristicValueDisplayMetadata *)self priority];
    if (v19 <= 2) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = v19;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v20];
  }
LABEL_27:
  __int16 v21 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeySecurityAlarm", @"HFStatusSortKeySecurityAlarm", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v21];
}

- (void)parseAirPurifierResponse:(id)a3
{
  uint64_t v4 = [a3 responseForCharacteristicType:*MEMORY[0x263F0BEF8]];
  id v8 = [v4 valueWithExpectedClass:objc_opt_class()];

  if (v8)
  {
    if ([v8 BOOLValue]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v5];
    if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] == 2) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = -1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v6];
  }
  id v7 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyAirPurifier", @"HFStatusSortKeyAirPurifier", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v7];
}

- (void)parseHumidifierDehumidifierResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0C0E0];
  id v5 = a3;
  uint64_t v6 = [v5 responseForCharacteristicType:v4];
  id v18 = [v6 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C088]];
  id v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  uint64_t v9 = [v5 responseForCharacteristicType:*MEMORY[0x263F0C4F8]];
  id v10 = [v9 valueWithExpectedClass:objc_opt_class()];

  uint64_t v11 = [v5 responseForCharacteristicType:*MEMORY[0x263F0BEF8]];

  __int16 v12 = [v11 valueWithExpectedClass:objc_opt_class()];

  if (v18) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v10 != 0 && v12 != 0)
  {
    if ([v12 BOOLValue])
    {
      if ((unint64_t)[v10 integerValue] > 2)
      {
LABEL_16:
        [(HFCharacteristicValueDisplayMetadata *)self setPriority:0];
        goto LABEL_17;
      }
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 1;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v16];
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v17 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyHumidifierDehumidifier", @"HFStatusSortKeyHumidifierDehumidifier", 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v17];
}

- (void)parseCurrentTargetPositionForServiceType:(id)a3 response:(id)a4
{
  id v28 = a3;
  uint64_t v7 = *MEMORY[0x263F0D8B8];
  id v8 = a4;
  char v9 = [v28 isEqualToString:v7];
  id v10 = (void *)MEMORY[0x263F0D6A8];
  uint64_t v11 = (void *)MEMORY[0x263F0D8A8];
  if ((v9 & 1) == 0
    && ([v28 isEqualToString:*MEMORY[0x263F0D8A8]] & 1) == 0
    && ([v28 isEqualToString:*v10] & 1) == 0)
  {
    __int16 v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HFCharacteristicValueDisplayMetadata.m", 1277, @"Invalid parameter not satisfying: %@", @"[serviceType isEqualToString:HMServiceTypeWindowCovering] || [serviceType isEqualToString:HMServiceTypeWindow] || [serviceType isEqualToString:HMServiceTypeDoor]" object file lineNumber description];
  }
  __int16 v12 = [v8 responseForCharacteristicType:*MEMORY[0x263F0C0D0]];
  BOOL v13 = [v12 valueWithExpectedClass:objc_opt_class()];

  unint64_t v14 = [v8 responseForCharacteristicType:*MEMORY[0x263F0C520]];
  unint64_t v15 = [v14 valueWithExpectedClass:objc_opt_class()];

  uint64_t v16 = [v8 responseForCharacteristicType:*MEMORY[0x263F0C2B8]];

  uint64_t v17 = [v16 valueWithExpectedClass:objc_opt_class()];

  if (v13) {
    BOOL v18 = v15 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    if ([v13 integerValue] < 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:v19];
    uint64_t v20 = [v28 isEqualToString:v7] ^ 1;
    if (([v17 BOOLValue] & 1) != 0
      || (uint64_t v21 = [v15 integerValue], v21 == objc_msgSend(v13, "integerValue")))
    {
      if ([(HFCharacteristicValueDisplayMetadata *)self primaryState] != 2) {
        uint64_t v20 = -1;
      }
    }
    else
    {
      if ([v15 integerValue] < 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 2;
      }
      [(HFCharacteristicValueDisplayMetadata *)self setTransitioningPrimaryState:v22];
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v20];
  }
  if ([v17 BOOLValue])
  {
    [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:2];
    uint64_t v23 = [(HFCharacteristicValueDisplayMetadata *)self priority];
    if (v23 <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23;
    }
    [(HFCharacteristicValueDisplayMetadata *)self setPriority:v24];
  }
  if ([v28 isEqualToString:*v10])
  {
    uint64_t v25 = @"HFStatusSortKeyDoor";
  }
  else if ([v28 isEqualToString:*v11])
  {
    uint64_t v25 = @"HFStatusSortKeyWindow";
  }
  else
  {
    if (![v28 isEqualToString:v7]) {
      goto LABEL_34;
    }
    uint64_t v25 = @"HFStatusSortKeyBlinds";
  }
  id v26 = _HFLocalizedStringWithDefaultValue(v25, v25, 1);
  [(HFCharacteristicValueDisplayMetadata *)self setSortKey:v26];

LABEL_34:
}

- (void)parseProgammableSwitchOfType:(id)a3 response:(id)a4
{
  id v7 = a3;
  if (([v7 isEqualToString:*MEMORY[0x263F0D818]] & 1) == 0
    && ([v7 isEqualToString:*MEMORY[0x263F0D820]] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HFCharacteristicValueDisplayMetadata.m", 1318, @"Invalid parameter not satisfying: %@", @"[serviceType isEqualToString:HMServiceTypeStatefulProgrammableSwitch] || [serviceType isEqualToString:HMServiceTypeStatelessProgrammableSwitch]" object file lineNumber description];
  }
  [(HFCharacteristicValueDisplayMetadata *)self setPrimaryState:1];
  [(HFCharacteristicValueDisplayMetadata *)self setPriority:-1];
}

- (void)setTransitioningPrimaryState:(int64_t)a3
{
  self->_transitioningPrimaryState = a3;
}

- (void)setSplitAccountFuture:(id)a3
{
}

@end