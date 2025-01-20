void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = &off_223B70000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    v6 = &_os_log_internal;
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_223B61000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_223B61000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_223B61000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_223B70000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 136);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t acc_policies_shouldHideAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = +[ACCUserDefaults sharedDefaults];
  int v3 = [v2 BOOLForKey:@"ShowHiddenAccessories"];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    if (acc_policies_shouldHideAccessoryWithModelNumber_onceToken != -1) {
      dispatch_once(&acc_policies_shouldHideAccessoryWithModelNumber_onceToken, &__block_literal_global);
    }
    uint64_t v4 = [(id)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers containsObject:a1];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = "NO";
    if (v4) {
      v6 = "YES";
    }
    else {
      v6 = "NO";
    }
    if (v3) {
      int v5 = "YES";
    }
    int v8 = 136315394;
    v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = v5;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "shouldHideAccessory: %s, showHiddenAccessories: %s", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

void __acc_policies_shouldHideAccessoryWithModelNumber_block_invoke()
{
  v0 = (void *)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_26D74A278;
}

BOOL acc_policies_endpointRequiresUserAuthorization(uint64_t a1)
{
  return !a1 || !*(void *)a1 || *(_DWORD *)(*(void *)a1 + 8) != 2;
}

uint64_t acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken != -1) {
    dispatch_once(&acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken, &__block_literal_global_74);
  }
  uint64_t v2 = [(id)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers containsObject:a1];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = "NO";
    if (v2) {
      int v3 = "YES";
    }
    int v5 = 136315138;
    v6 = v3;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "shouldOverrideName: %s", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

void __acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_block_invoke()
{
  v0 = (void *)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_26D74A290;
}

BOOL acc_policies_isTransportSupervised(unsigned int a1, int a2)
{
  BOOL v2 = ((1 << a1) & 0x1C3) != 0 && a2 == 1;
  return a1 <= 8 && v2;
}

uint64_t acc_policies_shouldResetLightningBusWhenTransportIsNoLongerRestricted(unsigned int a1, int a2)
{
  if ((a2 - 3) < 0xFFFFFFFE) {
    return (a1 < 9) & (0x1C3u >> a1);
  }
  else {
    return 0;
  }
}

BOOL acc_policies_endpointRequiresChargingCurrentLimit(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, _WORD *a6)
{
  v87[6] = *MEMORY[0x263EF8340];
  v85[0] = @"nameMatch";
  v85[1] = @"modelContain";
  v86[0] = @"IntelliLink";
  v86[1] = @"1.0";
  v85[2] = @"overrideCurrentLimit";
  v86[2] = &unk_26D74A2A8;
  v6 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:3];
  v87[0] = v6;
  v83[0] = @"nameMatch";
  v83[1] = @"modelContain";
  v84[0] = @"MyLink";
  v84[1] = @"1.0";
  v83[2] = @"overrideCurrentLimit";
  v84[2] = &unk_26D74A2A8;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v87[1] = v7;
  v81[0] = @"nameMatch";
  v81[1] = @"manufacturerMatch";
  v82[0] = @"iPL24Z";
  v82[1] = @"SDI Technologies";
  v81[2] = @"overrideCurrentLimit";
  v82[2] = &unk_26D74A2A8;
  int v8 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];
  v87[2] = v8;
  v79[0] = @"modelMatch";
  v79[1] = @"manufacturerMatch";
  v80[0] = @"MIB2";
  v80[1] = @"HARMAN";
  v79[2] = @"overrideCurrentLimit";
  v80[2] = &unk_26D74A2C0;
  v9 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];
  v87[3] = v9;
  v77[0] = @"modelMatch";
  v77[1] = @"manufacturerMatch";
  v78[0] = @"Range Rover Velar";
  v78[1] = @"Land Rover";
  v77[2] = @"overrideCurrentLimit";
  v78[2] = &unk_26D74A2A8;
  __int16 v10 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
  v87[4] = v10;
  v75[0] = @"modelMatch";
  v75[1] = @"manufacturerMatch";
  v76[0] = @"Jaguar I-PACE";
  v76[1] = @"Jaguar";
  v75[2] = @"overrideCurrentLimit";
  v76[2] = &unk_26D74A2A8;
  unint64_t v11 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];
  v87[5] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:6];

  unsigned __int16 v13 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerOverride");
  int v14 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerBehavior");
  int v15 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerBehavior");
  if (v15 <= 0) {
    int v16 = a5;
  }
  else {
    int v16 = v15;
  }
  if ((v14 - 3) < 6)
  {
    int v17 = 10 * v14 - 5;
    unsigned int v18 = a4;
LABEL_7:
    int v19 = 1;
    goto LABEL_8;
  }
  int v17 = 45;
  unsigned int v18 = a4;
  if (v14 != 1) {
    goto LABEL_7;
  }
  int v19 = 0;
LABEL_8:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    int v62 = a2;
    __int16 v63 = 1024;
    int v64 = a3;
    __int16 v65 = 1024;
    unsigned int v66 = v19;
    __int16 v67 = 1024;
    unsigned int v68 = v13;
    __int16 v69 = 1024;
    unsigned int v70 = v18;
    __int16 v71 = 1024;
    int v72 = v14;
    __int16 v73 = 1024;
    int v74 = v17;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d checkChargingCurrentLimit=%d chargingCurrentLimit=%d inLimit=%d behavior=%d batteryThreshold=%d", buf, 0x2Cu);
  }
  if (!v19) {
    goto LABEL_66;
  }
  v55 = 0;
  unsigned int v20 = v13;
  BOOL v21 = v13 < v18 && v13 != 0;
  if (a1 && !v21)
  {
    v22 = *(CFTypeRef **)(a1 + 64);
    if (v22)
    {
      if (*v22) {
        v55 = (void *)CFRetain(*v22);
      }
      else {
        v55 = 0;
      }
      v23 = *(const void **)(*(void *)(a1 + 64) + 16);
      if (v23) {
        v54 = (void *)CFRetain(v23);
      }
      else {
        v54 = 0;
      }
      v24 = *(const void **)(*(void *)(a1 + 64) + 8);
      if (v24) {
        v53 = (void *)CFRetain(v24);
      }
      else {
        v53 = 0;
      }
      if (v55 && v54)
      {
        int v45 = v17;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = v12;
        uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          LODWORD(v44) = v13;
          HIDWORD(v44) = v16;
          uint64_t v27 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v57 != v27) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              v30 = objc_msgSend(v29, "objectForKey:", @"nameMatch", v44);
              v31 = [v29 objectForKey:@"nameContain"];
              BOOL v32 = _matchOrContainString(v55, v30, v31);

              v33 = [v29 objectForKey:@"modelMatch"];
              v34 = [v29 objectForKey:@"modelContain"];
              BOOL v35 = _matchOrContainString(v54, v33, v34);

              v36 = [v29 objectForKey:@"manufacturerMatch"];
              v37 = [v29 objectForKey:@"manufacturerContain"];
              BOOL v38 = _matchOrContainString(v53, v36, v37);

              if (v32 && v35 && v38)
              {
                v39 = [v29 objectForKey:@"overrideCurrentLimit"];
                unsigned int v20 = (unsigned __int16)[v39 intValue];

                unsigned int v18 = a4;
                int v16 = HIDWORD(v44);
                goto LABEL_40;
              }
            }
            uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
            if (v26) {
              continue;
            }
            break;
          }
          unsigned int v18 = a4;
          unsigned int v20 = v44;
          int v16 = HIDWORD(v44);
        }
LABEL_40:

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110400;
          int v62 = a2;
          __int16 v63 = 1024;
          int v64 = a3;
          __int16 v65 = 1024;
          unsigned int v66 = v20;
          __int16 v67 = 1024;
          unsigned int v68 = v18;
          __int16 v69 = 1024;
          unsigned int v70 = v16;
          __int16 v71 = 1024;
          int v72 = v45;
          _os_log_debug_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d chargingCurrentLimit=%d inLimit=%d battery=%d threshold=%d", buf, 0x26u);
        }
        if (a3 != 3 && v16 >= v45 && (a2 & 1) == 0 && (v18 > 0x5DC || v20 >= 0x5DD) && v20 - 1501 < 0xFFFFFA24) {
          unsigned int v20 = 1500;
        }
        if (v20) {
          BOOL v40 = v20 >= v18;
        }
        else {
          BOOL v40 = 1;
        }
        BOOL v21 = !v40;
        goto LABEL_55;
      }
LABEL_67:
      BOOL v21 = 0;
      BOOL v41 = a6 != 0;
      goto LABEL_58;
    }
LABEL_66:
    v54 = 0;
    v55 = 0;
    v53 = 0;
    goto LABEL_67;
  }
  v53 = 0;
  v54 = 0;
LABEL_55:
  BOOL v41 = a6 != 0;
  if (a6 && v21)
  {
    *a6 = v20;
    BOOL v41 = 1;
    BOOL v21 = 1;
  }
LABEL_58:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    if (v41) {
      int v42 = (unsigned __int16)*a6;
    }
    else {
      int v42 = -1;
    }
    *(_DWORD *)buf = 67110656;
    int v62 = a2;
    __int16 v63 = 1024;
    int v64 = a3;
    __int16 v65 = 1024;
    unsigned int v66 = a5;
    __int16 v67 = 1024;
    unsigned int v68 = v16;
    __int16 v69 = 1024;
    unsigned int v70 = v18;
    __int16 v71 = 1024;
    int v72 = v42;
    __int16 v73 = 1024;
    int v74 = v21;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d, deviceType=%d, batt=%d(%d), %d->%d, return %d", buf, 0x2Cu);
  }

  return v21;
}

BOOL _matchOrContainString(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = a2;
  unint64_t v7 = a3;
  int v8 = (void *)v7;
  BOOL v9 = (v6 | v7) == 0;
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = [v5 isEqualToString:v6];
LABEL_6:
      BOOL v9 = v10;
      goto LABEL_7;
    }
    if (v7)
    {
      uint64_t v10 = [v5 containsString:v7];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v9;
}

BOOL acc_policies_shouldFailAuthOnOOBPairingFailure(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 24) == 9;
  }
  return result;
}

uint64_t acc_policies_allowACCAuthProtocolOnAllTransport()
{
  v0 = +[ACCUserDefaults sharedDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"AllowACCAuthProtocolOnAllTransport"];

  return v1;
}

uint64_t acc_policies_allowACCAuthProtocolOnTransport(int a1)
{
  BOOL v2 = +[ACCUserDefaults sharedDefaults];
  char v3 = [v2 BOOLForKey:@"EnableACCAuthProtocolOnNFC"];

  uint64_t v4 = +[ACCUserDefaults sharedDefaults];
  int v5 = [v4 BOOLForKey:@"DisableACCAuthProtocolOnInductive"];

  unint64_t v6 = +[ACCUserDefaults sharedDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"AllowACCAuthProtocolOnAllTransport"];

  if (a1 == 13 && (v3 & 1) != 0) {
    return 1;
  }
  int v9 = v5 ^ 1;
  if (a1 != 12) {
    int v9 = 0;
  }
  return v9 | v7;
}

uint64_t acc_policies_productTypeNeedsPreArmDeviceIdentity(const __CFString *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFStringGetTypeID())
    {
      BOOL v3 = CFEqual(a1, @"iPhone13,1")
        || CFEqual(a1, @"iPhone13,2")
        || CFEqual(a1, @"iPhone13,3")
        || CFEqual(a1, @"iPhone13,4");
      acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm = v3;
    }
  }
  return acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm;
}

uint64_t acc_policies_deviceNeedsPreArmDeviceIdentity()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    uint64_t v18 = 0;
    int v16 = 0;
  }
  else
  {
    v0 = +[ACCUserDefaults sharedDefaults];
    uint64_t v1 = [v0 stringForKey:@"DeviceIdentityPreArmDateOverride"];

    if (v1)
    {
      id v2 = v1;
      BOOL v3 = [MEMORY[0x263EFF8F0] currentCalendar];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate", (uint8_t *)&v21, 2u);
      }
      uint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      int v5 = [v2 stringByTrimmingCharactersInSet:v4];

      unint64_t v6 = [MEMORY[0x263F08708] punctuationCharacterSet];
      unsigned int v7 = [v5 componentsSeparatedByCharactersInSet:v6];

      unint64_t v8 = [v7 count];
      BOOL v9 = v8 > 2;
      if (v8 < 3)
      {
        id v14 = 0;
      }
      else
      {
        id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
        unint64_t v11 = [v7 objectAtIndexedSubscript:2];
        objc_msgSend(v10, "setDay:", objc_msgSend(v11, "integerValue"));

        uint64_t v12 = [v7 objectAtIndexedSubscript:1];
        objc_msgSend(v10, "setMonth:", objc_msgSend(v12, "integerValue"));

        unsigned __int16 v13 = [v7 objectAtIndexedSubscript:0];
        objc_msgSend(v10, "setYear:", objc_msgSend(v13, "integerValue"));

        id v14 = [v3 dateFromComponents:v10];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          id v22 = v14;
          _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      id v14 = 0;
      BOOL v9 = 0;
    }
    id v15 = v14;
    int v16 = v15;
    if (v9 && v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: override", (uint8_t *)&v21, 2u);
      }
      objc_storeStrong((id *)&acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, v14);
      int v17 = +[ACCUserDefaults sharedDefaults];
      [v17 setObject:acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate forKey:@"PreArmDeviceIdentityDate"];
    }
    uint64_t v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate) {
      goto LABEL_19;
    }
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken != -1) {
      dispatch_once(&acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken, &__block_literal_global_156);
    }
    uint64_t v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
LABEL_19:
      int v19 = [MEMORY[0x263EFF910] date];
      uint64_t v18 = [(id)v18 compare:v19] == -1;
    }
  }

  return v18;
}

void __acc_policies_deviceNeedsPreArmDeviceIdentity_block_invoke()
{
  v0 = +[ACCUserDefaults sharedDefaults];
  acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed = [v0 BOOLForKey:@"DidPreArmDeviceIdentity"];

  if (!acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    uint64_t v1 = +[ACCUserDefaults sharedDefaults];
    uint64_t v2 = [v1 objectForKey:@"PreArmDeviceIdentityDate"];
    BOOL v3 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v2;

    if (!acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
      id v13 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v4 setDay:1];
      [v4 setMonth:3];
      [v4 setYear:2021];
      int v5 = [v13 dateFromComponents:v4];
      id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v6 setDay:1];
      [v6 setMonth:9];
      [v6 setYear:2021];
      unsigned int v7 = [v13 dateFromComponents:v6];
      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v7];
      [v8 duration];
      uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeInterval:v5 sinceDate:(double)(int)(arc4random() % (int)v9)];
      unint64_t v11 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
      acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v10;

      uint64_t v12 = +[ACCUserDefaults sharedDefaults];
      [v12 setObject:acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate forKey:@"PreArmDeviceIdentityDate"];
    }
  }
}

void acc_policies_deviceDidPreArmDeviceIdentity()
{
  id v0 = +[ACCUserDefaults sharedDefaults];
  [v0 setBool:1 forKey:@"DidPreArmDeviceIdentity"];
}

BOOL acc_policies_allowAudioProductCertsOnTransport(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

uint64_t acc_policies_supportInductivePowerTX(int a1, unsigned int a2)
{
  if (a1 == 2) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = a2;
  }
  if (a1 == 3) {
    unsigned int v2 = a2;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v2;
  }
}

CFDataRef acc_policies_nfcTagUseKeys(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    result = (const __CFData *)CFDataGetLength(result);
    if (result) {
      return (const __CFData *)(*CFDataGetBytePtr(v1) - 87 < 2);
    }
  }
  return result;
}

id _getApplicationStateMonitor()
{
  if (_getApplicationStateMonitor_onceToken != -1) {
    dispatch_once(&_getApplicationStateMonitor_onceToken, &__block_literal_global_139);
  }
  id v0 = (void *)gAppStateMonitor;
  return v0;
}

BOOL __hasEntitlementForAuditToken(void *a1, _OWORD *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  long long v4 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v4;
  int v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    id v6 = v5;
    CFErrorRef error = 0;
    CFBooleanRef v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, v3, &error);
    if (v7)
    {
      CFBooleanRef v8 = v7;
      CFTypeID v9 = CFGetTypeID(v7);
      BOOL v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        id v13 = &_os_log_internal;
        id v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 138412546;
        *(void *)&token.val[1] = v3;
        LOWORD(token.val[3]) = 1024;
        *(unsigned int *)((char *)&token.val[3] + 2) = v10;
        _os_log_impl(&dword_223B61000, v13, OS_LOG_TYPE_INFO, "[#ServerClient] has %@ entitlement:%d", (uint8_t *)&token, 0x12u);
      }

      CFRelease(v8);
      CFErrorRef v15 = error;
      if (!error) {
        goto LABEL_40;
      }
      if (v10)
      {
        BOOL v10 = 1;
LABEL_39:
        CFRelease(v15);
        goto LABEL_40;
      }
    }
    else if (!error)
    {
      BOOL v10 = 0;
LABEL_40:
      CFRelease(v6);
      goto LABEL_41;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v16 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138412546;
      *(void *)&token.val[1] = v3;
      LOWORD(token.val[3]) = 2112;
      *(void *)((char *)&token.val[3] + 2) = error;
      _os_log_impl(&dword_223B61000, v16, OS_LOG_TYPE_DEFAULT, "[#ServerClient] Unable to get entitlement '%@', error: %@", (uint8_t *)&token, 0x16u);
    }

    BOOL v10 = 0;
    CFErrorRef v15 = error;
    goto LABEL_39;
  }
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    int v17 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  else
  {
    int v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl(&dword_223B61000, v17, OS_LOG_TYPE_DEFAULT, "[#ServerClient] Unable to create security task from audit token.", (uint8_t *)&token, 2u);
  }

  BOOL v10 = 0;
LABEL_41:

  return v10;
}

void sub_223B65110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___getApplicationStateMonitor_block_invoke()
{
  if (!gAppStateMonitor)
  {
    gAppStateMonitor = [objc_alloc(MEMORY[0x263F297F0]) initWithBundleIDs:0 states:0];
    MEMORY[0x270F9A758]();
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  unsigned int v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  id v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  id v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    double v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  id v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

id logObjectForModule()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    BOOL v1 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v1) {
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    id v10 = (id)&_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  return v10;
}

void sub_223B673C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_223B698A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x223CBCCB0]() != MEMORY[0x263EF8708])
  {
    if (MEMORY[0x223CBCCB0](v3) == MEMORY[0x263EF8720])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        uint64_t v4 = &_os_log_internal;
        id v7 = &_os_log_internal;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = string;
        _os_log_impl(&dword_223B61000, v4, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request event error: %s\n", buf, 0xCu);
      }

      [*(id *)(a1 + 40) processDetachXPCConnection:*(void *)(a1 + 32)];
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    goto LABEL_175;
  }
  uint64_t v5 = xpc_dictionary_get_string(v3, "requestType");
  if (!v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      uint64_t v6 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] RequestType not specified in xpc message!", buf, 2u);
    }

    uint64_t v5 = "<nil>";
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v10 = &_os_log_internal;
    id v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    ___xpc_iap2d_handle_incoming_request_block_invoke_cold_19();
  }

  if (!strcmp(v5, "OwnsConnectionID"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v3, "connectionID");
      if (gLogObjects && gNumLogObjects >= 1)
      {
        CFErrorRef v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        CFErrorRef v15 = &_os_log_internal;
        id v26 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = uint64;
        _os_log_impl(&dword_223B61000, v15, OS_LOG_TYPE_INFO, "[#Server] OwnsConnectionID: connectionID = %u\n", buf, 8u);
      }

      uint64_t v27 = +[ACCiAP2ShimServer sharedInstance];
      uint64_t v25 = [v27 findAccessoryForConnectionID:uint64];

      xpc_dictionary_set_BOOL(reply, "result", v25 != 0);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v25 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        uint64_t v25 = &_os_log_internal;
        id v31 = &_os_log_internal;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_1();
      }
    }
LABEL_173:

LABEL_174:
    goto LABEL_175;
  }
  if (!strcmp(v5, "IAPCheckIn"))
  {
    xpc_object_t v16 = xpc_dictionary_create_reply(v3);
    xpc_object_t reply = v16;
    if (gLogObjects) {
      BOOL v17 = gNumLogObjects <= 0;
    }
    else {
      BOOL v17 = 1;
    }
    int v18 = !v17;
    if (v16)
    {
      if (v18)
      {
        int v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        int v19 = &_os_log_internal;
        id v30 = &_os_log_internal;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223B61000, v19, OS_LOG_TYPE_INFO, "[#Server] IAPCheckIn\n", buf, 2u);
      }

      xpc_dictionary_set_BOOL(reply, "result", 1);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else
    {
      if (v18)
      {
        v29 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v29 = &_os_log_internal;
        id v40 = &_os_log_internal;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_4();
      }
    }
    goto LABEL_174;
  }
  if (strcmp(v5, "IAPAppRegisterClient"))
  {
    if (strcmp(v5, "IAPAppConnectedAccessories"))
    {
      if (([*(id *)(a1 + 40) processXPCMessage:v3 connection:*(void *)(a1 + 32)] & 1) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v12 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
          }
          id v12 = &_os_log_internal;
          id v41 = &_os_log_internal;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          ___xpc_iap2d_handle_incoming_request_block_invoke_cold_17();
        }

        xpc_object_t v42 = xpc_dictionary_create_reply(v3);
        if (v42)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v42);
        }
        else
        {
          v46 = logObjectForModule();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            ___xpc_iap2d_handle_incoming_request_block_invoke_cold_16();
          }
        }
      }
      goto LABEL_175;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v28 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v28 = &_os_log_internal;
        id v43 = &_os_log_internal;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223B61000, v28, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories", buf, 2u);
      }

      id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v45 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        int v45 = &_os_log_internal;
        id v47 = &_os_log_internal;
      }
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        uint64_t v48 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl(&dword_223B61000, v45, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories call [sharediAP2Server(%@) iterateAccessoriesSync:]", buf, 0xCu);
      }

      v49 = *(void **)(a1 + 40);
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = ___xpc_iap2d_handle_incoming_request_block_invoke_183;
      v73[3] = &unk_2646D0B30;
      uint64_t v25 = v44;
      int v74 = v25;
      [v49 iterateAccessoriesSync:v73];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v50 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v50 = &_os_log_internal;
        id v51 = &_os_log_internal;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_223B61000, v50, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories connectedAccessories=%@", buf, 0xCu);
      }

      if (v25 && [v25 count])
      {
        id v72 = 0;
        v52 = [MEMORY[0x263F08AC0] dataWithPropertyList:v25 format:100 options:0 error:&v72];
        id v53 = v72;
        if (v52)
        {
          id v54 = v52;
          v55 = (const void *)[v54 bytes];
          size_t v56 = [v54 length];
        }
        else
        {
          unsigned int v68 = logObjectForModule();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v69 = [v53 description];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v69;
            _os_log_impl(&dword_223B61000, v68, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - unable to convert accessories array to plist: %@", buf, 0xCu);
          }
          v55 = 0;
          size_t v56 = 0;
        }

        if (v55) {
          xpc_dictionary_set_data(reply, "plistData", v55, v56);
        }
        uint64_t v25 = 0;
      }
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else
    {
      uint64_t v25 = logObjectForModule();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_12();
      }
    }
    goto LABEL_173;
  }
  xpc_object_t v20 = xpc_dictionary_create_reply(v3);
  if (v20)
  {
    int v21 = v20;
    uint64_t v22 = MEMORY[0x223CBC870]();
    uint64_t v23 = xpc_dictionary_get_string(v3, "eaClientBundleID");
    if (v23 && *v23)
    {
      v24 = [NSString stringWithUTF8String:v23];
    }
    else
    {
      v24 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      BOOL v32 = &_os_log_internal;
      id v34 = &_os_log_internal;
    }
    unsigned int v70 = (void *)v22;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_223B61000, v32, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@", buf, 0xCu);
    }

    uint64_t v35 = xpc_dictionary_get_uint64(v3, "eaClientCapabilities");
    uint64_t v71 = xpc_dictionary_get_uint64(v3, "eaClientID");
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "eaClientSupportedProtocols", &length);
    BOOL v37 = xpc_dictionary_get_BOOL(v3, "eaClientHasCheckedForConnectedAccessories");
    BOOL v38 = 0;
    if (data && length)
    {
      v39 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
      if (v39)
      {
        uint64_t v75 = 0;
        BOOL v38 = [MEMORY[0x263F08AC0] propertyListWithData:v39 options:0 format:0 error:&v75];
      }
      else
      {
        BOOL v38 = 0;
      }
    }
    BOOL v58 = !v37;
    *(void *)&long long v59 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v59 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v59;
    long long v79 = v59;
    xpc_dictionary_get_audit_token();
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v60 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v60 = &_os_log_internal;
      id v61 = &_os_log_internal;
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v77 = 138412802;
      *(void *)&v77[4] = v24;
      *(_WORD *)&v77[12] = 1024;
      *(_DWORD *)&v77[14] = v35;
      *(_WORD *)&v77[18] = 1024;
      *(_DWORD *)&v77[20] = v58;
      _os_log_impl(&dword_223B61000, v60, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@ call addClientWithCapabilites:%xh notifyClientOfAlreadyConnectedAccessories:%d", v77, 0x18u);
    }

    uint64_t v63 = *(void *)(a1 + 32);
    int v62 = *(void **)(a1 + 40);
    *(_OWORD *)v77 = *(_OWORD *)buf;
    *(_OWORD *)&v77[16] = v79;
    unsigned int v64 = [v62 addClientWithCapabilities:v35 auditToken:v77 currentClientID:v71 xpcConnection:v63 eaProtocols:v38 notifyOfAlreadyConnectedAccessories:v58 andBundleId:v24];
    xpc_dictionary_set_uint64(v21, "eaClientID", v64);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v65 = *(id *)gLogObjects;
      unsigned int v66 = v70;
    }
    else
    {
      unsigned int v66 = v70;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      __int16 v65 = &_os_log_internal;
      id v67 = &_os_log_internal;
    }
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v77 = 138412546;
      *(void *)&v77[4] = v24;
      *(_WORD *)&v77[12] = 1024;
      *(_DWORD *)&v77[14] = v64;
      _os_log_impl(&dword_223B61000, v65, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@ send back reply, clientID=%u", v77, 0x12u);
    }

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v21);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v33 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v33 = &_os_log_internal;
      id v57 = &_os_log_internal;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      ___xpc_iap2d_handle_incoming_request_block_invoke_cold_7();
    }
  }
LABEL_175:
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_183(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 dontPublish])
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v10 = &_os_log_internal;
      id v7 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 1024;
      LODWORD(v15) = [v5 dontPublish];
      _os_log_impl(&dword_223B61000, v10, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories iterateAccessoriesSync, accessory=%@, dontPublish=%d, skip adding!", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    id v10 = [v5 accessoryInfoDict];
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v11 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      CFErrorRef v15 = v10;
      _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories iterateAccessoriesSync, accessory=%@, accessoryInfo=%@", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) addObject:v10];
  }

  *a3 = 1;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = &off_223B70000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    BOOL v6 = &_os_log_internal;
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        BOOL v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_223B61000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          BOOL v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v13 = v8;
          __int16 v14 = 2080;
          CFErrorRef v15 = v9;
          _os_log_debug_impl(&dword_223B61000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = v8;
        __int16 v14 = 2080;
        CFErrorRef v15 = v9;
        _os_log_error_impl(&dword_223B61000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    uint64_t v2 = &off_223B70000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 136);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_223B61000, v0, v1, "[#Server] ERROR: Client sent kXPCOwnsConnectionIDStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_223B61000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPCheckInStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_223B61000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPAppRegisterClientStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_12()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_223B61000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPAppConnectedAccessoriesStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_16()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_223B61000, v0, v1, "[#Server] Client sent '%s' xpc message without a reply context", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_223B61000, v0, v1, "[#Server] Client sent unknown '%s' xpc message ", v2, v3, v4, v5, v6);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_223B61000, v0, v1, "[#Server] _xpc_iap2d_handle_incoming_request: received messagetype %s", v2, v3, v4, v5, v6);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_223B61000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x270F771A8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}