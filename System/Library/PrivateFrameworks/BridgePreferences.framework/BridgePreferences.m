uint64_t BPSBridgeTintColor()
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

uint64_t BPSForegroundColor()
{
  return [MEMORY[0x263F1C550] _secondarySystemGroupedBackgroundColor];
}

uint64_t BPSBackgroundColor()
{
  return [MEMORY[0x263F1C550] _systemGroupedBackgroundColor];
}

uint64_t BPSSeparatorColor()
{
  return [MEMORY[0x263F1C550] _separatorColor];
}

uint64_t BPSDeviceHasCellularDataCapability(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v1 = (objc_class *)MEMORY[0x263F08C38];
  id v2 = a1;
  v3 = (void *)[[v1 alloc] initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  uint64_t v4 = [v2 supportsCapability:v3];

  v5 = bps_utility_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if (v4) {
      v6 = "YES";
    }
    int v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "CoreTelephony in Bridge: NRDevice hasTelephony=%s capability", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

id bps_utility_log()
{
  if (bps_utility_log_onceToken != -1) {
    dispatch_once(&bps_utility_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)bps_utility_log___logger;
  return v0;
}

id BPSLocalIconName(void *a1)
{
  id v1 = a1;
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:&unk_26CCBC520];
  v3 = +[BPSBridgeAppContext shared];
  uint64_t v4 = [v3 activeDevice];
  char v5 = BPSIsDeviceCompatibleWithVersions(@"3", @"5", v4);

  if (v5)
  {
    v6 = @"contacts-v4";
  }
  else
  {
    v7 = +[BPSBridgeAppContext shared];
    int v8 = [v7 activeDevice];
    int v9 = BPSIsDeviceCompatibleWithVersions(@"2", @"3", v8);

    if (!v9) {
      goto LABEL_6;
    }
    v6 = @"contacts-v3";
  }
  [v2 setObject:v6 forKey:@"com.apple.MobileAddressBook"];
LABEL_6:
  uint64_t v10 = [v2 objectForKey:v1];

  return v10;
}

uint64_t BPSIsDeviceCompatibleWithVersions(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (OverriddenProductVersion == -1) {
    NRWatchOSVersionForRemoteDevice();
  }
  int v8 = NRRawVersionFromString();
  int v9 = NRRawVersionFromString();
  if (v8 == -1) {
    int IsGreaterThanOrEqual = 1;
  }
  else {
    int IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
  }
  if (v9 == -1) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = NRVersionIsGreaterThanOrEqual() ^ 1;
  }
  if (IsGreaterThanOrEqual) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t BPSStockholmSupportedInGizmoRegion(void *a1)
{
  id v1 = a1;
  id v2 = NPSQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke;
  block[3] = &unk_264408CD0;
  id v3 = v1;
  id v12 = v3;
  dispatch_async(v2, block);

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v4 = (void *)getNPKCompanionAgentConnectionClass_softClass_0;
  uint64_t v17 = getNPKCompanionAgentConnectionClass_softClass_0;
  if (!getNPKCompanionAgentConnectionClass_softClass_0)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getNPKCompanionAgentConnectionClass_block_invoke_0;
    v13[3] = &unk_264408888;
    v13[4] = &v14;
    __getNPKCompanionAgentConnectionClass_block_invoke_0((uint64_t)v13);
    uint64_t v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v6 = objc_alloc_init(v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_3;
  v9[3] = &unk_264408FF8;
  id v10 = v3;
  id v7 = v3;
  [v6 shouldShowApplePaySettingsWithCompletion:v9];

  return 1;
}

void sub_21C514FCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __BPSStockholmSupportedInGizmoRegion_block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v4 = NPSQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_4;
  v5[3] = &unk_264408FD0;
  char v7 = a2;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);
}

id NPSQueue()
{
  if (NPSQueue_onceToken != -1) {
    dispatch_once(&NPSQueue_onceToken, &__block_literal_global_704);
  }
  v0 = (void *)NPSQueue___npsQueue;
  return v0;
}

Class __getNPKCompanionAgentConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NanoPassKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __NanoPassKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264408A00;
    uint64_t v6 = 0;
    NanoPassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!NanoPassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NPKCompanionAgentConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNPKCompanionAgentConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPKCompanionAgentConnectionClass_block_invoke_0(uint64_t a1)
{
  NanoPassKitLibrary();
  Class result = objc_getClass("NPKCompanionAgentConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPKCompanionAgentConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
    return (Class)BPSRemoveHiddenAppsFromSpecifiers(v3);
  }
  return result;
}

void BPSRemoveHiddenAppsFromSpecifiers(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = BPSRemovablePhoneAppMapping();
  uint64_t v3 = [v2 allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (BPSSystemAppIsRemoved(v8)
          && ([v8 isEqualToString:@"com.apple.MobileAddressBook"] & 1) == 0)
        {
          int v9 = [v2 objectForKeyedSubscript:v8];
          id v10 = [v1 specifierForID:v9];
          [v1 removeObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

uint64_t BPSSystemAppIsRemoved(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v9 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:&v9];
  id v3 = v9;
  if (v3)
  {
    uint64_t v4 = bps_utility_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v1;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }
  }
  uint64_t v5 = [v2 applicationState];
  if ([v5 isInstalled])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [v2 applicationState];
    uint64_t v6 = [v7 isPlaceholder] ^ 1;
  }
  return v6;
}

id BPSRemovablePhoneAppMapping()
{
  if (BPSRemovablePhoneAppMapping_onceToken != -1) {
    dispatch_once(&BPSRemovablePhoneAppMapping_onceToken, &__block_literal_global_668);
  }
  v0 = (void *)BPSRemovablePhoneAppMapping_mapping;
  return v0;
}

uint64_t __BPSSystemAppIsRemovable_block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.NanoBooks.BridgeSettings", @"com.apple.DeepBreathingSettings", @"com.apple.NanoCalendarBridgeSettings", @"com.apple.Noise.settings", @"com.apple.NanoMailBridgeSettings", @"com.apple.NanoMapsBridgeSettings", @"com.apple.NanoMusicBridgeSettings", @"com.apple.private.PodcastsBridgeSettings", @"com.apple.NanoBedtimeBridgeSettings", @"com.apple.StocksBridgeSettings", @"com.apple.tincan.settings", @"com.apple.weatherbridgesettings", @"com.apple.NanoPassbookBridgeSettings", @"com.apple.OxygenSaturationSettings", @"com.apple.NanoTipsBridgeSettings", @"com.apple.MindSettings", @"com.apple.NanoMenstrualCyclesCompanionSettings",
  BPSSystemAppIsRemovable_removableSystemAppBundles = 0);
  return MEMORY[0x270F9A758]();
}

id BPSIsIconForBundleIDRemote(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "setWithObjects:", @"com.apple.MobileAddressBook", @"com.apple.NanoAlarm", @"com.apple.reminders", @"com.apple.SessionTrackerApp", @"com.apple.BridgeHealthSettings", @"com.apple.private.PodcastsBridgeSettings", 0);
  uint64_t v4 = NSNumber;
  int v5 = [v3 containsObject:v2];

  uint64_t v6 = [v4 numberWithBool:v5 ^ 1u];

  return v6;
}

uint64_t BPSSystemAppIsRemovable(void *a1)
{
  uint64_t v1 = BPSSystemAppIsRemovable_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&BPSSystemAppIsRemovable_onceToken, &__block_literal_global_461);
  }
  uint64_t v3 = [(id)BPSSystemAppIsRemovable_removableSystemAppBundles containsObject:v2];

  return v3;
}

uint64_t BPSDeviceHasAllCapabilitiesForStrings(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v8;
  id v11 = v9;
  id v12 = a4;
  id v39 = v11;
  if (v7)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v54;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v13);
        }
        if (!BPSDeviceHasCapabilityForString(*(void **)(*((void *)&v53 + 1) + 8 * v17), v12)) {
          goto LABEL_41;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v11 = v39;
  }
  if (v10)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v10;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
LABEL_14:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v13);
        }
        if (BPSDeviceHasCapabilityForString(*(void **)(*((void *)&v49 + 1) + 8 * v21), v12)) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v19) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }
LABEL_41:

      uint64_t v33 = 0;
      id v11 = v39;
      goto LABEL_45;
    }
LABEL_20:

    id v11 = v39;
  }
  if (v11)
  {
    id v35 = v12;
    v36 = v10;
    id v37 = v7;
    [v11 allKeys];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v40 = *(void *)v46;
      LOBYTE(v24) = 1;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v27 = [v11 objectForKeyedSubscript:v26];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v57 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v42;
            v24 &= 1u;
            while (2)
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v42 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                [v26 cStringUsingEncoding:4];
                [v32 cStringUsingEncoding:4];
                if ((v24 & _os_feature_enabled_impl()) != 1)
                {
                  LOBYTE(v24) = 0;
                  goto LABEL_37;
                }
                int v24 = 1;
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v57 count:16];
              if (v29) {
                continue;
              }
              break;
            }
LABEL_37:
            id v11 = v39;
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v23);
    }
    else
    {
      LOBYTE(v24) = 1;
    }

    uint64_t v33 = v24 & 1;
    id v10 = v36;
    id v7 = v37;
    id v12 = v35;
  }
  else
  {
    uint64_t v33 = 1;
  }
LABEL_45:

  return v33;
}

id BPSWatchAppBundleIDForSettingsBundleSpecifier(void *a1)
{
  id v1 = a1;
  id v2 = [v1 propertyForKey:@"watchAppBundleId"];
  if (!v2)
  {
    uint64_t v3 = [v1 identifier];
    id v2 = _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v3);

    if (!v2)
    {
      id v2 = [v1 identifier];
    }
  }

  return v2;
}

void sub_21C5166B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id _CachePathForIcon(void *a1)
{
  id v1 = a1;
  id v2 = _BridgeIconCachePath();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___CachePathForIcon_block_invoke;
  block[3] = &unk_264408700;
  id v10 = v2;
  uint64_t v3 = _CachePathForIcon_onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&_CachePathForIcon_onceToken, block);
  }
  int v5 = NSString;
  uint64_t v6 = +[BPSIconCachePrivacyHelper saltedHashForString:v1];

  id v7 = [v5 stringWithFormat:@"%@%@", v4, v6];

  return v7;
}

id _BridgeIconCachePath()
{
  if (_BridgeIconCachePath_onceToken != -1) {
    dispatch_once(&_BridgeIconCachePath_onceToken, &__block_literal_global_120);
  }
  v0 = (void *)_BridgeIconCachePath___bridgeIconCachePath;
  return v0;
}

id BPSCreateRoundedGizmoAppIconForSquareImage(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F1C920] mainScreen];
  uint64_t v3 = [v2 traitCollection];
  [v3 displayScale];
  double v5 = v4;

  id v6 = v1;
  [v6 CGImage];
  id v7 = (const void *)LICreateIconForImage();
  id v8 = [MEMORY[0x263F1C6B0] imageWithCGImage:v7 scale:0 orientation:v5];
  if (v7) {
    CFRelease(v7);
  }
  if ([v6 flipsForRightToLeftLayoutDirection])
  {
    uint64_t v9 = [v8 imageFlippedForRightToLeftLayoutDirection];

    id v8 = (void *)v9;
  }

  return v8;
}

__CFString *_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(void *a1)
{
  id v1 = a1;
  if (_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_onceToken != -1) {
    dispatch_once(&_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_onceToken, &__block_literal_global_515);
  }
  if ((([v1 isEqualToString:@"com.apple.NanoContactsBridgeSettingsPaired"] & 1) != 0
     || [v1 isEqualToString:@"com.apple.NanoContactsBridgeSettingsTinker"])
    && (BPSGetActiveDevice(),
        id v2 = objc_claimAutoreleasedReturnValue(),
        v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CBF3763A-5F42-4463-B714-39903987FE90"], char v4 = objc_msgSend(v2, "supportsCapability:", v3), v3, v2, (v4 & 1) != 0))
  {
    double v5 = @"com.apple.NanoContacts";
  }
  else
  {
    double v5 = [(id)_BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent_mapping objectForKey:v1];
  }

  return v5;
}

uint64_t BPSDeviceHasCapabilityForString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([(id)*MEMORY[0x263F1D020] launchedToTest]
    && ([v3 isEqualToString:@"ntk-customization"] & 1) != 0)
  {
    goto LABEL_15;
  }
  if (BPSDeviceHasCapabilityForString_onceToken == -1)
  {
    if (v3) {
      goto LABEL_5;
    }
LABEL_15:
    uint64_t v6 = 1;
    goto LABEL_16;
  }
  dispatch_once(&BPSDeviceHasCapabilityForString_onceToken, &__block_literal_global_149);
  if (!v3) {
    goto LABEL_15;
  }
LABEL_5:
  double v5 = [(id)BPSDeviceHasCapabilityForString__capabilityMapping objectForKey:v3];
  if (v5)
  {
    uint64_t v6 = [v4 supportsCapability:v5];
  }
  else
  {
    if ([v3 isEqualToString:@"internal"])
    {
      id v7 = (void *)MEMORY[0x263F575C0];
    }
    else
    {
      if (![v3 isEqualToString:@"tinker-paired"])
      {
        uint64_t v6 = 0;
        goto LABEL_13;
      }
      id v7 = (void *)MEMORY[0x263F575B0];
    }
    id v8 = [v4 valueForProperty:*v7];
    uint64_t v6 = [v8 BOOLValue];
  }
LABEL_13:

LABEL_16:
  return v6;
}

uint64_t BPSDeviceHasStandaloneAppsCapability(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08C38];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  uint64_t v4 = [v2 supportsCapability:v3];

  return v4;
}

void __BPSDeviceHasCapabilityForString_block_invoke()
{
  v75[72] = *MEMORY[0x263EF8340];
  v74[0] = @"activation-lock";
  v73 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02168E84-5DD8-4B19-9204-A79F04B33A32"];
  v75[0] = v73;
  v74[1] = @"third-party-complications";
  v72 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"39F111D2-C3D1-4CCC-AB05-E464DE58625D"];
  v75[1] = v72;
  v74[2] = @"more-people";
  v71 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"EE952AF6-9A20-42FC-B4CB-992D2C6AEFEA"];
  v75[2] = v71;
  v74[3] = @"mute-fitness-coaching";
  v70 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"307631AF-B309-4885-A4F2-122F156AF14B"];
  v75[3] = v70;
  v74[4] = @"custom-mail-replies";
  v69 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8A7396EE-44E9-401D-8546-9F60232B29E7"];
  v75[4] = v69;
  v74[5] = @"nightstand";
  v68 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B4B27F79-6817-4254-9232-37BFB09CE1B5"];
  v75[5] = v68;
  v74[6] = @"carrier-direct-calling";
  v67 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"07E81B2D-193A-4898-BBA4-B15E85A96BE5"];
  v75[6] = v67;
  v74[7] = @"AutoScreenOffSeconds";
  v66 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"62AA8EC5-64FC-43D1-B856-D28D6520FA30"];
  v75[7] = v66;
  v74[8] = @"new-glance-model";
  v65 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5B2CCB95-1760-430C-97B9-34BEBB5BD70B"];
  v75[8] = v65;
  v74[9] = @"custom-button-chord";
  v64 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D1E83259-F3FC-4F20-82C3-C528D45560C3"];
  v75[9] = v64;
  v74[10] = @"reorderable-message-replies";
  v63 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"01EF2814-5C39-4B0E-84B9-7B8E2CC06AA3"];
  v75[10] = v63;
  v74[11] = @"cellular-data";
  v62 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  v75[11] = v62;
  v74[12] = @"gps-navigation";
  uint64_t v61 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CB81F0AE-3F2F-4D57-8C90-F0D1A4ADD373"];
  v75[12] = v61;
  v74[13] = @"ntk-customization";
  v60 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"46526F47-0B4B-41FF-A959-AC358550958C"];
  v75[13] = v60;
  v74[14] = @"sticky-app-behavior";
  v59 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"ED96B2DC-49DD-470D-BFE6-1F112AF20308"];
  v75[14] = v59;
  v74[15] = @"background-app-updating";
  v58 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"90F4EAD7-DC19-4601-ADB1-D1CEE0C99EF8"];
  v75[15] = v58;
  v74[16] = @"find-my-watch";
  v57 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E9CD3885-6BAE-44AF-8A2E-D2AC35470D03"];
  v75[16] = v57;
  v74[17] = @"show-goal-metric-is-deprecated";
  long long v56 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"330AF1F2-FD8F-40E4-B79C-2B0C476E6EAF"];
  v75[17] = v56;
  v74[18] = @"pace-view-is-deprecated";
  long long v55 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"939B3E66-90BD-4C9E-9FE5-150D338FB4E8"];
  v75[18] = v55;
  v74[19] = @"advanced-workout-metrics";
  long long v54 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9EAFA034-BAB5-455F-A122-C2EB399E8FCE"];
  v75[19] = v54;
  v74[20] = @"breathe-app";
  long long v53 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D1C41A00-1654-467C-8793-6B4299699982"];
  v75[20] = v53;
  v74[21] = @"s-o-s";
  long long v52 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1171F09A-B15F-4C2C-A315-1A7A125CA54F"];
  v75[21] = v52;
  v74[22] = @"workout-auto-pause";
  long long v51 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"2523BB16-06C1-4DEC-BD23-CC0613AB0BDF"];
  v75[22] = v51;
  v74[23] = @"workout-all-day-nfc";
  long long v50 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"EFAF2AEE-778B-4CCF-A640-EBD8C662D59B"];
  v75[23] = v50;
  v74[24] = @"friends-pane-is-deprecated";
  long long v49 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"871E76A4-AD36-4AAF-B894-13CAF677C531"];
  v75[24] = v49;
  v74[25] = @"home-app";
  long long v48 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"15AFBF9D-37E7-4B41-8698-B0E518A0F6DC"];
  v75[25] = v48;
  v74[26] = @"siri-settings";
  long long v47 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F06861AE-125A-424B-AF25-C1DAA8F7AEBC"];
  v75[26] = v47;
  v74[27] = @"environmental-dosimetry";
  long long v46 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"];
  v75[27] = v46;
  v74[28] = @"low-power-sound-classification";
  long long v45 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"01299775-E611-4F05-8BFF-ABBD9995F4B8"];
  v75[28] = v45;
  v74[29] = @"headphone-dosimetry";
  long long v44 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BF083122-A7BA-478F-A94E-E3F337F1177E"];
  v75[29] = v44;
  v74[30] = @"raise-to-speak";
  long long v43 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"68E9D2AF-A820-45FC-8FB3-92A04428CBF8"];
  v75[30] = v43;
  v74[31] = @"podcasts-app";
  long long v42 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"033C7B1F-5B25-459A-8CC7-4824B9C219F7"];
  v75[31] = v42;
  v74[32] = @"audiobooks-app";
  long long v41 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9E6855A3-F1FD-444C-ACB5-000F4203EF76"];
  v75[32] = v41;
  v74[33] = @"ntc-offer";
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E7995851-D32D-4A4F-B12C-3DD8D0252581"];
  v75[33] = v40;
  v74[34] = @"heart-rate-two-app";
  id v39 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E17D2903-B868-4E6C-8E76-6D4939BEED44"];
  v75[34] = v39;
  v74[35] = @"fitness-smart-coaching";
  v38 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6ADE877A-70EB-43A1-A4D1-3E4BB50EFA54"];
  v75[35] = v38;
  v74[36] = @"workout-music-playlist";
  id v37 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"91499922-4C63-41CF-884A-686713CE2738"];
  v75[36] = v37;
  v74[37] = @"vertical-dock";
  v36 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DF99F619-B83A-4084-A29C-F15A82DE2B15"];
  v75[37] = v36;
  v74[38] = @"tin-can";
  id v35 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"282F1EE6-A144-4106-AFFB-2BDB5B59FD0D"];
  v75[38] = v35;
  v74[39] = @"news-app";
  v34 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"135CFEB8-D730-40DE-AA77-7668663F72C4"];
  v75[39] = v34;
  v74[40] = @"alarms-syncing";
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"506B78D5-F8AD-489A-8BF7-AD41268D0FF2"];
  v75[40] = v33;
  v74[41] = @"newton";
  v32 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"96B0DD78-1F0E-4F92-875F-DD6374FCCB10"];
  v75[41] = v32;
  v74[42] = @"jackrabbit";
  v31 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1E189BE1-6A71-44AA-B116-0066A83035E8"];
  v75[42] = v31;
  v74[43] = @"cinnamon-hw";
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
  v75[43] = v30;
  v74[44] = @"app-migration";
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1C82900F-82DC-41A4-A79F-5F107794C4A9"];
  v75[44] = v29;
  v74[45] = @"autoupdate";
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D5737C61-3EE6-43DA-B714-00F3746C50E1"];
  v75[45] = v28;
  v74[46] = @"ursa";
  v27 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AB764CE8-D4DF-4DB6-991C-3A298E380BD1"];
  v75[46] = v27;
  v74[47] = @"tritium";
  v26 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6AABB66B-8E1B-4CAB-8FC4-AC577BA0AFB0"];
  v75[47] = v26;
  v74[48] = @"scandium";
  v25 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
  v75[48] = v25;
  v74[49] = @"burrito";
  int v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
  v75[49] = v24;
  v74[50] = @"brook";
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0C599FD8-CC9F-48C9-BC37-C764A8B0527C"];
  v75[50] = v23;
  v74[51] = @"supports-all-watch-complications-always";
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BADF6E3E-9021-4B23-8ADA-045A705DADC6"];
  v75[51] = v22;
  v74[52] = @"sunflower";
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"3955CA84-B333-44E3-B8C3-A420085151EE"];
  v75[52] = v21;
  v74[53] = @"respiratory-rate";
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5C64C95B-8E7C-46AB-A110-1E51C93D7B7F"];
  v75[53] = v20;
  v74[54] = @"mind-app";
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"2A51E7B3-1B80-4981-9F09-F725BC3A8065"];
  v75[54] = v19;
  v74[55] = @"tips-app";
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"ED2B57B6-9EA3-4ED9-843D-FE92F74B2DE0"];
  v75[55] = v18;
  v74[56] = @"gateshead";
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A4F025DD-E3E3-4886-8189-676CE98A6926"];
  v75[56] = v17;
  v74[57] = @"sting";
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  v75[57] = v16;
  v74[58] = @"bolt";
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"75584707-D2C4-481E-B8E8-3D8EDD459B61"];
  v75[58] = v15;
  v74[59] = @"charon";
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
  v75[59] = v14;
  v74[60] = @"kali";
  id v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CBC78224-8F5E-4D43-8666-69ADBE2A6277"];
  v75[60] = v13;
  v74[61] = @"starbear-dock";
  id v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  v75[61] = v12;
  v74[62] = @"siri-announce-workout-voice-feedback";
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0FC0E189-59F0-4BB1-ACFC-570B13B35974"];
  v75[62] = v0;
  v74[63] = @"elton";
  id v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  v75[63] = v1;
  v74[64] = @"velocity";
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0D852855-E6CF-45FA-B786-B26BE87FF939"];
  v75[64] = v2;
  v74[65] = @"sounds-and-haptics-2024";
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"];
  v75[65] = v3;
  v74[66] = @"workout-resume-reminder";
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4E8C3265-3D65-4E94-8BCD-23DC8C4FC8CF"];
  v75[66] = v4;
  v74[67] = @"liveactivities";
  double v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6B0579F9-ED84-4E5E-B753-83D35793F919"];
  v75[67] = v5;
  v74[68] = @"workout-safety-check-in";
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"132C0E45-0099-4FC6-9FC2-D2C1F22BCC0E"];
  v75[68] = v6;
  v74[69] = @"harmonia";
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"210C1233-537B-4A1E-8EE0-253962851B43"];
  v75[69] = v7;
  v74[70] = @"cycles";
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02979F49-FAFA-49CC-8478-C2562BC81FB6"];
  v75[70] = v8;
  v74[71] = @"urchin";
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"90B8A394-4493-444D-AAA4-DDF6D6B68BC2"];
  v75[71] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:72];
  id v11 = (void *)BPSDeviceHasCapabilityForString__capabilityMapping;
  BPSDeviceHasCapabilityForString__capabilityMapping = v10;
}

void sub_21C518684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Block_object_dispose((const void *)(v49 - 144), 8);
  _Unwind_Resume(a1);
}

id BPSGetActiveDevice()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
  id v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  id v3 = [v2 firstObject];

  uint64_t v4 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
  if ([v4 BOOLValue]) {
    double v5 = 0;
  }
  else {
    double v5 = v3;
  }
  id v6 = v5;

  return v6;
}

uint64_t BPSProgressBarTrackTintColor()
{
  return [MEMORY[0x263F1C550] _separatorColor];
}

uint64_t BPSProgressBarTintColor()
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

uint64_t BPSAccessoryColor()
{
  return [MEMORY[0x263F1C550] _quaternaryLabelColor];
}

id BPSDevicePickerCellHighlightColor()
{
  v0 = [MEMORY[0x263F1C550] systemGray4Color];
  id v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

id BPSCellHightlightColor()
{
  v0 = [MEMORY[0x263F1C550] _tertiarySystemBackgroundColor];
  id v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

void BPSApplyStyleToToolbar(void *a1)
{
  id v1 = a1;
  [v1 setBarStyle:1];
  [v1 setTranslucent:1];
  id v2 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v1 setTintColor:v2];
}

id BPSDetailTextColor()
{
  v0 = [MEMORY[0x263F1C550] _secondaryLabelColor];
  id v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

void BPSApplyStyleToNavBarOptions(void *a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = objc_opt_new();
  [v4 configureWithDefaultBackground];
  [v3 setStandardAppearance:v4];
  double v5 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v3 setTintColor:v5];

  [v3 setPrefersLargeTitles:a2];
  uint64_t v14 = *MEMORY[0x263F1C240];
  uint64_t v6 = v14;
  id v7 = BPSTextColor();
  v15[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v3 setTitleTextAttributes:v8];

  v12[0] = v6;
  uint64_t v9 = BPSTextColor();
  v13[0] = v9;
  v12[1] = *MEMORY[0x263F1C238];
  uint64_t v10 = [MEMORY[0x263F1C658] boldSystemFontOfSize:32.0];
  v13[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v3 setLargeTitleTextAttributes:v11];
}

id BPSTextColor()
{
  v0 = [MEMORY[0x263F1C550] _labelColor];
  id v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

id BPSForceColorToDarkAppearance(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1CB00];
  id v2 = a1;
  id v3 = [v1 traitCollectionWithUserInterfaceStyle:2];
  uint64_t v4 = [v2 resolvedColorWithTraitCollection:v3];

  return v4;
}

uint64_t __BPSStockholmSupportedInGizmoRegion_block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __BPSStockholmSupportedInGizmoRegion_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

id BPSWatchAppBundleIDForSettingsBundle(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForInfoDictionaryKey:@"watchAppBundleId"];
  if (!v2)
  {
    id v3 = [v1 bundleIdentifier];
    id v2 = _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v3);

    if (!v2)
    {
      id v2 = [v1 bundleIdentifier];
    }
  }

  return v2;
}

void BPSApplyStyleToNavBar(void *a1)
{
}

uint64_t BPSSetupTintColor()
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

uint64_t BPSOffSwitchBorderColor()
{
  return [MEMORY[0x263F1C550] _tertiarySystemGroupedBackgroundColor];
}

uint64_t BPSEditablePlaceholderColor()
{
  return [MEMORY[0x263F1C550] _separatorColor];
}

void __BPSStockholmSupportedInGizmoRegion_block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  id v3 = getNPKDefaultsDomain();
  uint64_t v4 = (void *)[v2 initWithDomain:v3];

  [v4 setBool:*(unsigned __int8 *)(a1 + 40) forKey:@"passbookRegistrationSupportedInRegion"];
  id v5 = (id)[v4 synchronize];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_5;
  v6[3] = &unk_264408FD0;
  id v7 = *(id *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __BPSStockholmSupportedInGizmoRegion_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  id v3 = getNPKDefaultsDomain();
  uint64_t v4 = (void *)[v2 initWithDomain:v3];

  char v10 = 0;
  char v5 = [v4 BOOLForKey:@"passbookRegistrationSupportedInRegion" keyExistsAndHasValidFormat:&v10];
  if (v10) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_2;
  v7[3] = &unk_264408FD0;
  id v8 = *(id *)(a1 + 32);
  char v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

id getNPKDefaultsDomain()
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getNPKDefaultsDomainSymbolLoc_ptr;
  uint64_t v8 = getNPKDefaultsDomainSymbolLoc_ptr;
  if (!getNPKDefaultsDomainSymbolLoc_ptr)
  {
    id v1 = (void *)NanoPassKitLibrary();
    v6[3] = (uint64_t)dlsym(v1, "NPKDefaultsDomain");
    getNPKDefaultsDomainSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

uint64_t NanoPassKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoPassKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __NanoPassKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264409078;
    uint64_t v5 = 0;
    NanoPassKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = NanoPassKitLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!NanoPassKitLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void __BPSRemovablePhoneAppMapping_block_invoke()
{
  uint64_t v0 = (void *)BPSRemovablePhoneAppMapping_mapping;
  BPSRemovablePhoneAppMapping_mapping = (uint64_t)&unk_26CCBC548;
}

id bps_setup_log()
{
  if (bps_setup_log_onceToken != -1) {
    dispatch_once(&bps_setup_log_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)bps_setup_log___logger;
  return v0;
}

uint64_t __bps_utility_log_block_invoke()
{
  bps_utility_log___logger = (uint64_t)os_log_create("com.apple.BridgePreferences", "utility");
  return MEMORY[0x270F9A758]();
}

uint64_t __bps_setup_log_block_invoke()
{
  bps_setup_log___logger = (uint64_t)os_log_create("com.apple.BridgePreferences", "setup");
  return MEMORY[0x270F9A758]();
}

void __NPSQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Bridge.NPSQueue", v2);
  id v1 = (void *)NPSQueue___npsQueue;
  NPSQueue___npsQueue = (uint64_t)v0;
}

void sub_21C51A30C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getNSSManagerClass_block_invoke(uint64_t a1)
{
  NanoSystemSettingsLibrary();
  Class result = objc_getClass("NSSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNSSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNSSManagerClass_block_invoke_cold_1();
    return (Class)NanoSystemSettingsLibrary();
  }
  return result;
}

uint64_t NanoSystemSettingsLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __NanoSystemSettingsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644088A8;
    uint64_t v5 = 0;
    NanoSystemSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoSystemSettingsLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_21C51AB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

void sub_21C51B52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkNSSAccountDSIDKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkNSSAccountDSIDKeySymbolLoc_ptr;
  uint64_t v8 = getkNSSAccountDSIDKeySymbolLoc_ptr;
  if (!getkNSSAccountDSIDKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)NanoSystemSettingsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kNSSAccountDSIDKey");
    getkNSSAccountDSIDKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)__63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkNSSAccountAltDSIDKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkNSSAccountAltDSIDKeySymbolLoc_ptr;
  uint64_t v8 = getkNSSAccountAltDSIDKeySymbolLoc_ptr;
  if (!getkNSSAccountAltDSIDKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)NanoSystemSettingsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kNSSAccountAltDSIDKey");
    getkNSSAccountAltDSIDKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)__63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkNSSAccountUsernameKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkNSSAccountUsernameKeySymbolLoc_ptr;
  uint64_t v8 = getkNSSAccountUsernameKeySymbolLoc_ptr;
  if (!getkNSSAccountUsernameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)NanoSystemSettingsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kNSSAccountUsernameKey");
    getkNSSAccountUsernameKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)__63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

uint64_t __NanoSystemSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoSystemSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFAProfilePictureStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!FamilyCircleUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __FamilyCircleUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644088E0;
    uint64_t v6 = 0;
    FamilyCircleUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!FamilyCircleUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FAProfilePictureStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getFAProfilePictureStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFAProfilePictureStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FamilyCircleUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FamilyCircleUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkNSSAccountsKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAccountsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAccountsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkNSSAKDeviceKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAKDeviceKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAKDeviceKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkNSSAccountTypeKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAccountTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAccountTypeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkNSSAccountDSIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAccountDSIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAccountDSIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkNSSAccountAltDSIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAccountAltDSIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAccountAltDSIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkNSSAccountUsernameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoSystemSettingsLibrary();
  uint64_t result = dlsym(v2, "kNSSAccountUsernameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkNSSAccountUsernameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21C51C6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C51D1A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKPassLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKPassLibraryClass_block_invoke_cold_1();
    return (Class)PassKitCoreLibrary();
  }
  return result;
}

uint64_t PassKitCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PassKitCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644089E8;
    uint64_t v5 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PassKitCoreLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PassKitCoreLibrary();
  uint64_t result = dlsym(v2, "PKCompanionWatchPassLibraryMachServiceName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PassKitCoreLibrary();
  uint64_t result = dlsym(v2, "PKCompanionAgentServiceListenerResumedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t __NanoPassKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPassKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21C5243B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

Class __getAMSAcknowledgePrivacyTaskClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264408AF0;
    uint64_t v6 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AMSAcknowledgePrivacyTask");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAMSAcknowledgePrivacyTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void BPSMuteForTodaySectionIdentifiersChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _loadMutedSectionIdentifiers];
  [v2 _updateObservers];
}

void sub_21C528888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BPSToday()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v1 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v2 = [v1 components:28 fromDate:v0];

  return v2;
}

__CFString *BPSDeviceAssetDirectoryPath()
{
  return @"DeviceAssets/";
}

uint64_t BPSDeviceAssetString(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@%@", @"DeviceAssets/", a1];
}

__CFString *_WatchImageNameForStyle(uint64_t a1, char a2)
{
  if ((unint64_t)(a1 - 1) > 7)
  {
    id v2 = &stru_26CCB36C8;
    if (a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v2 = off_264408D10[a1 - 1];
  if ((a2 & 1) == 0)
  {
LABEL_5:
    BPSDeviceRemoteAssetString(v2);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  return v2;
}

double _ScreenInsets(uint64_t a1, uint64_t a2)
{
  double v4 = *MEMORY[0x263F00148];
  long long v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  switch(a1)
  {
    case 1:
      if (a2 == 1) {
        return 39.5;
      }
      else {
        return 36.0;
      }
    case 2:
      unint64_t v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          char v9 = (double *)&unk_21C53CB80;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        char v9 = (double *)&unk_21C53CA30;
        return v9[v8];
      }
      return v4;
    case 3:
      unint64_t v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          char v9 = (double *)&unk_21C53CE20;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        char v9 = (double *)&unk_21C53CCD0;
        return v9[v8];
      }
      return v4;
    case 4:
      unint64_t v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          char v9 = (double *)&unk_21C53D360;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        char v9 = (double *)&unk_21C53D210;
        return v9[v8];
      }
      return v4;
    case 5:
      if (v7 <= 2.0) {
        return 24.0;
      }
      else {
        return 28.0;
      }
    case 6:
      unint64_t v8 = a2 - 1;
      if (unint64_t)(a2 - 1) < 0x15 && ((0x1C30C3u >> v8))
      {
        char v9 = (double *)&unk_21C53D4B0;
        return v9[v8];
      }
      return v4;
    case 7:
      unint64_t v8 = a2 - 1;
      if (v7 <= 2.0)
      {
        if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
        {
          char v9 = (double *)&unk_21C53D0C0;
          return v9[v8];
        }
      }
      else if (v8 < 0x15 && ((0x1C30C3u >> v8) & 1) != 0)
      {
        char v9 = (double *)&unk_21C53CF70;
        return v9[v8];
      }
      return v4;
    default:
      return v4;
  }
}

__CFString *BPSWatchViewStyleDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"BPSWatchViewStyleUnknown";
  }
  else {
    return off_264408D50[a1 - 1];
  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getNanoResourceGrabberClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __NanoResourceGrabberLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264408E38;
    uint64_t v6 = 0;
    NanoResourceGrabberLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NanoResourceGrabber");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getNanoResourceGrabberClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNanoResourceGrabberClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoResourceGrabberLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoResourceGrabberLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21C531FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_21C53257C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

void sub_21C5328CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C5329C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t BPSSetupBackgroundColor()
{
  return [MEMORY[0x263F1C550] _systemBackgroundColor];
}

uint64_t BPSAccessoryHighlightColor()
{
  return [MEMORY[0x263F1C550] whiteColor];
}

id BPSDevicePickerCellBackgroundColor()
{
  id v0 = [MEMORY[0x263F1C550] tertiarySystemBackgroundColor];
  uint64_t v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

uint64_t BPSFontWithSize(double a1)
{
  return [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:a1 design:*MEMORY[0x263F1D330]];
}

uint64_t BPSRegularFontWithSize(double a1)
{
  return [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:a1 design:*MEMORY[0x263F1D338]];
}

uint64_t BPSBoldFontWithSize(double a1)
{
  return [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:a1 design:*MEMORY[0x263F1D318]];
}

id BPSTitleFont()
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = &unk_26CCBC4B0;
  v10[0] = &unk_26CCBC4F8;
  id v0 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  __asm { FMOV            V1.2D, #26.0 }
  v8[0] = xmmword_21C53D910;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:design:", *MEMORY[0x263F1D238], BPSScreenValueGetRelevantZoomValue((double *)v8, v0), *MEMORY[0x263F1D338]);

  return v6;
}

double BPSScreenValueGetRelevantZoomValue(double *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  double v6 = v5;
  [v4 nativeScale];
  double v8 = v7;
  [v4 scale];
  if (v8 < v9 || v6 == 693.0)
  {
    v25 = v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v3 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = [v3 objectForKey:v15];
          [v16 floatValue];
          float v18 = v17;

          int v19 = [v15 intValue] - 1;
          uint64_t v20 = a1;
          switch(v19)
          {
            case 0:
              goto LABEL_15;
            case 1:
              uint64_t v20 = a1 + 1;
              goto LABEL_15;
            case 2:
              uint64_t v20 = a1 + 2;
              goto LABEL_15;
            case 3:
            case 8:
              uint64_t v20 = a1 + 3;
              goto LABEL_15;
            case 4:
              uint64_t v20 = a1 + 4;
              goto LABEL_15;
            case 6:
              uint64_t v20 = a1 + 6;
              goto LABEL_15;
            case 7:
              uint64_t v20 = a1 + 7;
LABEL_15:
              *uint64_t v20 = v18;
              break;
            default:
              continue;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    double v4 = v25;
  }
  long long v21 = *((_OWORD *)a1 + 1);
  v26[0] = *(_OWORD *)a1;
  v26[1] = v21;
  long long v22 = *((_OWORD *)a1 + 3);
  v26[2] = *((_OWORD *)a1 + 2);
  v26[3] = v22;
  double RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)v26);

  return RelevantValue;
}

uint64_t BPSProgressBarStalledTintColor()
{
  return [MEMORY[0x263F1C550] systemGrayColor];
}

id BPSNavBarBackgroundPointImage()
{
  if (BPSNavBarBackgroundPointImage_onceToken != -1) {
    dispatch_once(&BPSNavBarBackgroundPointImage_onceToken, &__block_literal_global_6);
  }
  id v0 = (void *)BPSNavBarBackgroundPointImage___backgroundPointImage;
  return v0;
}

void __BPSNavBarBackgroundPointImage_block_invoke()
{
  id v2 = [MEMORY[0x263F1C550] _secondarySystemGroupedBackgroundColor];
  uint64_t v0 = _BPSPointImageWithColor(v2, 0);
  uint64_t v1 = (void *)BPSNavBarBackgroundPointImage___backgroundPointImage;
  BPSNavBarBackgroundPointImage___backgroundPointImage = v0;
}

id _BPSPointImageWithColor(void *a1, int a2)
{
  id v3 = (void *)MEMORY[0x263F1C920];
  id v4 = a1;
  double v5 = [v3 mainScreen];
  double v6 = [v5 traitCollection];
  [v6 displayScale];
  double v8 = v7;

  double v9 = 1.0;
  if (a2) {
    double v10 = 1.0 / v8;
  }
  else {
    double v10 = 1.0;
  }
  double v11 = v10;
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v9, 0, 0.0);
  [v4 set];

  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = 1.0;
  v15.size.height = v10;
  UIRectFill(v15);
  uint64_t v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v12;
}

id BPSNavBarShadowPointImage()
{
  if (BPSNavBarShadowPointImage_onceToken != -1) {
    dispatch_once(&BPSNavBarShadowPointImage_onceToken, &__block_literal_global_40);
  }
  uint64_t v0 = (void *)BPSNavBarShadowPointImage___shadowPointImage;
  return v0;
}

void __BPSNavBarShadowPointImage_block_invoke()
{
  id v2 = [MEMORY[0x263F1C550] _separatorColor];
  uint64_t v0 = _BPSPointImageWithColor(v2, 1);
  uint64_t v1 = (void *)BPSNavBarShadowPointImage___shadowPointImage;
  BPSNavBarShadowPointImage___shadowPointImage = v0;
}

id BPSSetupTintDisabledColor()
{
  uint64_t v0 = [MEMORY[0x263F1C550] systemOrangeColor];
  uint64_t v1 = [v0 colorWithAlphaComponent:0.4];

  return v1;
}

void BPSPresentGizmoUnreachableAlertWithDismissalHandler(void *a1)
{
}

void BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler(void *a1, void *a2)
{
  id v9 = a1;
  id v3 = a2;
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  double v5 = [v4 localizedStringForKey:@"ALERT_GIZMO_UNREACHABLE_MESSAGE" value:&stru_26CCB36C8 table:@"Localizable"];

  double v6 = [MEMORY[0x263F1C5C0] currentDevice];
  int v7 = objc_msgSend(v6, "sf_isInternalInstall");

  if (v7)
  {
    uint64_t v8 = [v5 stringByAppendingFormat:@"\n\n[Internal Only: %@]", v9];

    double v5 = (void *)v8;
  }
  _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(v5, v3);
}

void BPSPresentGizmoUnreachableOrLockedServiceAlertWithDismissalHandler(void *a1, void *a2)
{
  id v9 = a1;
  id v3 = a2;
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  double v5 = [v4 localizedStringForKey:@"ALERT_GIZMO_UNREACHABLE_LOCKED_MESSAGE" value:&stru_26CCB36C8 table:@"Localizable"];

  double v6 = [MEMORY[0x263F1C5C0] currentDevice];
  int v7 = objc_msgSend(v6, "sf_isInternalInstall");

  if (v7)
  {
    uint64_t v8 = [v5 stringByAppendingFormat:@"\n\n[Internal Only: %@]", v9];

    double v5 = (void *)v8;
  }
  _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(v5, v3);
}

void _BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler(void *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  double v5 = (void *)MEMORY[0x263F1C3F8];
  double v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  int v7 = [v6 localizedStringForKey:@"ALERT_GIZMO_UNREACHABLE_TITLE" value:&stru_26CCB36C8 table:@"Localizable"];
  uint64_t v8 = [v5 alertControllerWithTitle:v7 message:v3 preferredStyle:1];

  id v9 = [v8 view];
  [v9 _accessibilitySetInterfaceStyleIntent:1];

  double v10 = (void *)MEMORY[0x263F1C3F0];
  double v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v12 = [v11 localizedStringForKey:@"ALERT_GIZMO_UNREACHABLE_BUTTON" value:&stru_26CCB36C8 table:@"Localizable"];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke;
  v39[3] = &unk_264408978;
  id v13 = v4;
  id v40 = v13;
  uint64_t v14 = [v10 actionWithTitle:v12 style:0 handler:v39];
  [v8 addAction:v14];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  CGRect v15 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v16 = [v15 connectedScenes];

  float v17 = (void *)[v16 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v21 = [v20 windows];
          long long v22 = [v21 firstObject];

          float v17 = [v22 rootViewController];

          goto LABEL_11;
        }
      }
      float v17 = (void *)[v16 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v23 = [v17 presentedViewController];

  if (v23)
  {
    int v24 = 0;
    do
    {
      id v23 = v17;

      float v17 = [v23 presentedViewController];

      v25 = [v17 presentedViewController];

      int v24 = v23;
    }
    while (v25);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v17 presentingViewController];
    [v26 dismissViewControllerAnimated:1 completion:0];

    id v27 = v23;
    float v17 = v27;
  }
  if (v17)
  {
    long long v28 = [v17 transitionCoordinator];
    if (v28)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = ___BPSPresentGizmoUnreachableAlertMessageWithDismissalHandler_block_invoke_742;
      v32[3] = &unk_264409058;
      id v33 = v17;
      id v34 = v8;
      [v28 animateAlongsideTransition:0 completion:v32];
      long long v29 = bps_utility_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_21C513000, v29, OS_LOG_TYPE_DEFAULT, "We are in mid transition. Waiting until transition is complete to present BPS alert", v31, 2u);
      }
    }
    else
    {
      long long v30 = bps_utility_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_21C513000, v30, OS_LOG_TYPE_DEFAULT, "BPS presented 'transport became unreachable' alert", v31, 2u);
      }

      [v17 presentViewController:v8 animated:1 completion:0];
    }
  }
}

id BPSLocalizedNameForMaterial(unint64_t a1)
{
  uint64_t v1 = _BPSUnlocalizedNameForMaterial(a1);
  id v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26CCB36C8 table:@"Localizable"];

  return v3;
}

__CFString *_BPSUnlocalizedNameForMaterial(unint64_t a1)
{
  if (a1 < 0x27 && ((0x4023FFFFBFuLL >> a1) & 1) != 0) {
    return off_2644090C0[a1];
  }
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  int v3 = objc_msgSend(v2, "sf_isInternalInstall");

  if (!v3) {
    return &stru_26CCB36C8;
  }
  id v4 = bps_utility_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    _BPSUnlocalizedNameForMaterial_cold_1(a1, v4);
  }

  return @"UNKNOWN_NAME";
}

__CFString *BPSLocalizedShortEdition(unint64_t a1, uint64_t a2, void *a3)
{
  double v5 = [a3 componentsSeparatedByString:@","];
  if ((unint64_t)[v5 count] < 2)
  {
    int v10 = 0;
  }
  else
  {
    double v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 rangeOfString:@"Watch"];
    if (v8)
    {
      id v9 = [v6 substringFromIndex:v7 + v8];
    }
    else
    {
      id v9 = 0;
    }
    int v10 = [v9 isEqualToString:@"1"];
  }
  double v11 = &stru_26CCB36C8;
  if (a1 <= 0x16)
  {
    if (((1 << a1) & 0x10CF00) != 0)
    {
      uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
      id v13 = v12;
      uint64_t v14 = @"EDITION_EDITION_SHORT";
      goto LABEL_13;
    }
    if (((1 << a1) & 0x68001E) != 0 && v10)
    {
      uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
      id v13 = v12;
      uint64_t v14 = @"SPORT_EDITION_SHORT";
LABEL_13:
      double v11 = [v12 localizedStringForKey:v14 value:&stru_26CCB36C8 table:@"Localizable"];
    }
  }
  if (a2 == 2)
  {
    CGRect v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
    uint64_t v16 = v15;
    float v17 = @"VICTORY_EDITION_SHORT";
  }
  else
  {
    if (a2 != 1) {
      goto LABEL_19;
    }
    CGRect v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
    uint64_t v16 = v15;
    float v17 = @"ZEUS_EDITION_SHORT";
  }
  uint64_t v18 = [v15 localizedStringForKey:v17 value:&stru_26CCB36C8 table:@"Localizable"];

  double v11 = (__CFString *)v18;
LABEL_19:
  return v11;
}

id BPSDeviceRemoteAssetString(void *a1)
{
  id v1 = a1;
  id v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v2 count])
  {
    int v3 = NSString;
    id v4 = [v2 firstObject];
    double v5 = [v3 stringWithFormat:@"%@/%@/%@", v4, *MEMORY[0x263F5B988], v1];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

uint64_t BPSVariantSizeForNRDeviceSize(int a1)
{
  if ((a1 - 1) > 8) {
    return 0;
  }
  else {
    return qword_21C53D988[(__int16)(a1 - 1)];
  }
}

uint64_t BPSVariantSizeForArtworkDeviceSubType()
{
  unsigned int v0 = NRDeviceSizeForArtworkDeviceSubType() - 1;
  if (v0 > 8) {
    return 0;
  }
  else {
    return qword_21C53D988[(__int16)v0];
  }
}

uint64_t BPSVariantSizeForProductType()
{
  unsigned int v0 = NRDeviceSizeForProductType() - 1;
  if (v0 > 8) {
    return 0;
  }
  else {
    return qword_21C53D988[(__int16)v0];
  }
}

id BPSLocalizedVariantSizeForProductType(void *a1)
{
  v25[9] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F086E0];
  id v18 = a1;
  int v24 = [v1 bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v23 = [v24 localizedStringForKey:@"COMPACT_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[0] = v23;
  long long v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  long long v21 = [v22 localizedStringForKey:@"REGULAR_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[1] = v21;
  uint64_t v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  int v19 = [v20 localizedStringForKey:@"394H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[2] = v19;
  float v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v16 = [v17 localizedStringForKey:@"448H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[3] = v16;
  CGRect v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v14 = [v15 localizedStringForKey:@"430H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[4] = v14;
  id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v2 = [v13 localizedStringForKey:@"484H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[5] = v2;
  int v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v4 = [v3 localizedStringForKey:@"502H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[6] = v4;
  double v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  double v6 = [v5 localizedStringForKey:@"446H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable-N218"];
  v25[7] = v6;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v8 = [v7 localizedStringForKey:@"496H_VARIANT" value:&stru_26CCB36C8 table:@"Localizable-N218"];
  v25[8] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:9];
  int v10 = +[BPSScreenStringObj screenStringsWithArray:v9];
  BPSGetRelevantScreenStringForProduct((uint64_t)v18, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

id BPSGetRelevantScreenStringForProduct(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = 0;
  switch(BPSVariantSizeForProductType())
  {
    case 1:
      uint64_t v4 = [v2 regular];
      goto LABEL_11;
    case 2:
      uint64_t v4 = [v2 compact];
      goto LABEL_11;
    case 7:
      uint64_t v4 = [v2 size448h];
      goto LABEL_11;
    case 8:
      uint64_t v4 = [v2 size394h];
      goto LABEL_11;
    case 13:
      uint64_t v4 = [v2 size484h];
      goto LABEL_11;
    case 14:
      uint64_t v4 = [v2 size430h];
      goto LABEL_11;
    case 19:
      uint64_t v4 = [v2 size502h];
      goto LABEL_11;
    case 20:
      uint64_t v4 = [v2 size446h];
      goto LABEL_11;
    case 21:
      uint64_t v4 = [v2 size496h];
LABEL_11:
      int v3 = (void *)v4;
      break;
    default:
      break;
  }

  return v3;
}

id BPSShortLocalizedVariantSizeForProductType(void *a1)
{
  v25[9] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F086E0];
  id v18 = a1;
  int v24 = [v1 bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v23 = [v24 localizedStringForKey:@"COMPACT_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[0] = v23;
  long long v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  long long v21 = [v22 localizedStringForKey:@"REGULAR_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[1] = v21;
  uint64_t v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  int v19 = [v20 localizedStringForKey:@"394H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[2] = v19;
  float v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v16 = [v17 localizedStringForKey:@"448H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[3] = v16;
  CGRect v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v14 = [v15 localizedStringForKey:@"430H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[4] = v14;
  id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  id v2 = [v13 localizedStringForKey:@"484H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[5] = v2;
  int v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v4 = [v3 localizedStringForKey:@"502H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable"];
  v25[6] = v4;
  double v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  double v6 = [v5 localizedStringForKey:@"446H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable-N218"];
  v25[7] = v6;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v8 = [v7 localizedStringForKey:@"496H_VARIANT_SHORT" value:&stru_26CCB36C8 table:@"Localizable-N218"];
  v25[8] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:9];
  int v10 = +[BPSScreenStringObj screenStringsWithArray:v9];
  BPSGetRelevantScreenStringForProduct((uint64_t)v18, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

id BPSRemoveVersionIncompatibleSpecifiersFromArray(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v12 = [MEMORY[0x263EFF980] array];
  id v2 = BPSGetActiveSetupCompletedDevice();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 propertyForKey:@"minimumWatchVersion"];
        int v10 = [v8 propertyForKey:@"deprecatedInWatchVersion"];
        if (BPSIsDeviceCompatibleWithVersions(v9, v10, v2)) {
          [v12 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v12;
}

id BPSGetActiveSetupCompletedDevice()
{
  unsigned int v0 = BPSGetActiveDevice();
  id v1 = [v0 valueForProperty:*MEMORY[0x263F575D0]];
  if ([v1 BOOLValue]) {
    id v2 = v0;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

BOOL _BPSIsPairingCompatible(unint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F57740];
  id v4 = a2;
  uint64_t v5 = [v3 systemVersions];
  unint64_t v6 = [v5 minPairingCompatibilityVersionForChipID:v4];

  uint64_t v7 = [MEMORY[0x263F57740] systemVersions];
  unint64_t v8 = [v7 maxPairingCompatibilityVersion];

  return v6 <= a1 && v8 >= a1;
}

uint64_t _BPSOverrideDeviceCompatibleVersions()
{
  uint64_t result = NRRawVersionFromString();
  OverriddenProductVersion = result;
  return result;
}

id BPSRemoveCapabilityIncompatibleSpecifiersFromArray(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v12 = [MEMORY[0x263EFF980] array];
  id v2 = BPSGetActiveSetupCompletedDevice();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 propertyForKey:@"requiredWatchCapabilities"];
        int v10 = [v8 propertyForKey:@"forbiddenWatchCapabilities"];
        if (BPSDeviceHasAllCapabilitiesForStrings(v9, v10, 0, v2)) {
          [v12 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v12;
}

uint64_t BPSMGMaterialForPBMaterial(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0xA && ((0x3DFu >> v2)) {
    return dword_21C53D9D0[v2];
  }
  id v3 = bps_utility_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "%@ not covered in MGEnclosure Enum", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t BPSPBMaterialForMGMaterial(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = a1 - 1;
  if (a1 - 1) < 0xA && ((0x3DFu >> v2)) {
    return qword_21C53D9F8[v2];
  }
  id v3 = bps_utility_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInt:a1];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "%@ not covered in MGEnclosure Enum", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t BPSOverrideScreenType(uint64_t result)
{
  __ScreenTypeOverride = result;
  return result;
}

uint64_t BPSCurrentScreenType()
{
  uint64_t v0 = 4;
  uint64_t v1 = MGGetProductType();
  if (v1 <= 2080700390)
  {
    if (v1 <= 1169082143)
    {
      if (v1 > 502329936)
      {
        if (v1 > 910181309)
        {
          if (v1 == 910181310) {
            return 5;
          }
          if (v1 != 1060988941) {
            return 1;
          }
          return 6;
        }
        if (v1 == 502329937) {
          return 3;
        }
        uint64_t v5 = 689804742;
        goto LABEL_45;
      }
      if (v1 > 337183580)
      {
        if (v1 != 337183581)
        {
          uint64_t v4 = 445396642;
          goto LABEL_51;
        }
        return 2;
      }
      if (v1 == 42878382) {
        return 3;
      }
      uint64_t v3 = 253148925;
LABEL_59:
      if (v1 == v3) {
        return 3;
      }
      return 1;
    }
    if (v1 <= 1434404432)
    {
      if (v1 <= 1371389548)
      {
        if (v1 == 1169082144) {
          return 7;
        }
        uint64_t v2 = 1234705395;
        goto LABEL_30;
      }
      if (v1 == 1371389549) {
        return v0;
      }
      uint64_t v6 = 1429914406;
    }
    else
    {
      if (v1 > 1737882205)
      {
        if (v1 == 1737882206) {
          return 3;
        }
        if (v1 == 2021146989) {
          return 7;
        }
        uint64_t v2 = 2032616841;
LABEL_30:
        if (v1 != v2) {
          return 1;
        }
        return 5;
      }
      if (v1 == 1434404433) {
        return 6;
      }
      uint64_t v6 = 1721691077;
    }
    if (v1 != v6) {
      return 1;
    }
    return v0;
  }
  if (v1 <= 2781508712)
  {
    if (v1 > 2309863437)
    {
      if (v1 > 2468178734)
      {
        if (v1 != 2468178735)
        {
          if (v1 != 2688879999)
          {
            uint64_t v2 = 2722529672;
            goto LABEL_30;
          }
          return 8;
        }
        return 3;
      }
      if (v1 != 2309863438)
      {
        uint64_t v4 = 2311900306;
        goto LABEL_51;
      }
      return 8;
    }
    if (v1 <= 2162679682)
    {
      if (v1 != 2080700391)
      {
        uint64_t v4 = 2081274472;
        goto LABEL_51;
      }
      return 5;
    }
    if (v1 != 2162679683)
    {
      uint64_t v4 = 2270970153;
LABEL_51:
      if (v1 == v4) {
        return 2;
      }
      return 1;
    }
    return 2;
  }
  if (v1 <= 3242623366)
  {
    if (v1 <= 3001488777)
    {
      if (v1 == 2781508713) {
        return 2;
      }
      uint64_t v5 = 2940697645;
      goto LABEL_45;
    }
    if (v1 != 3001488778)
    {
      uint64_t v3 = 3196805751;
      goto LABEL_59;
    }
    return 7;
  }
  if (v1 <= 3743999267)
  {
    if (v1 == 3242623367) {
      return 3;
    }
    uint64_t v5 = 3585085679;
LABEL_45:
    if (v1 != v5) {
      return 1;
    }
    return 7;
  }
  if (v1 != 3743999268)
  {
    if (v1 != 3885279870)
    {
      if (v1 != 4201643249) {
        return 1;
      }
      return 8;
    }
    return 6;
  }
  return v0;
}

double BPSScreenValueGetRelevantValue(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  switch(__ScreenTypeOverride)
  {
    case 0:
      uint64_t v2 = BPSScreenValueGetRelevantValue__deviceHeight;
      if (!BPSScreenValueGetRelevantValue__deviceHeight)
      {
        uint64_t v3 = [MEMORY[0x263F1C920] mainScreen];
        [v3 _referenceBounds];
        BPSScreenValueGetRelevantValue__deviceHeight = (unint64_t)v4;

        uint64_t v2 = BPSScreenValueGetRelevantValue__deviceHeight;
      }
      if (v2 > 779)
      {
        if (v2 <= 843)
        {
          if (v2 == 780) {
            goto LABEL_25;
          }
          if (v2 == 812) {
            goto LABEL_17;
          }
        }
        else
        {
          switch(v2)
          {
            case 844:
              goto LABEL_10;
            case 896:
              goto LABEL_11;
            case 926:
              goto LABEL_9;
          }
        }
        goto LABEL_30;
      }
      if (v2 > 692)
      {
        if (v2 == 693) {
          goto LABEL_17;
        }
        if (v2 == 736) {
          goto LABEL_28;
        }
        goto LABEL_30;
      }
      if (v2 != 568)
      {
        if (v2 == 667) {
          goto LABEL_21;
        }
LABEL_30:
        uint64_t v5 = bps_utility_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 134217984;
          uint64_t v9 = BPSScreenValueGetRelevantValue__deviceHeight;
          uint64_t v6 = "BPSScreenValueGetRelevantValue: %lu height not found, defaulting to 812h value";
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      return *(double *)a1;
    case 1:
      return *(double *)a1;
    case 2:
LABEL_21:
      a1 += 8;
      return *(double *)a1;
    case 3:
LABEL_28:
      a1 += 16;
      return *(double *)a1;
    case 4:
    case 9:
      goto LABEL_17;
    case 5:
LABEL_11:
      a1 += 32;
      return *(double *)a1;
    case 6:
LABEL_25:
      a1 += 40;
      return *(double *)a1;
    case 7:
LABEL_10:
      a1 += 48;
      return *(double *)a1;
    case 8:
LABEL_9:
      a1 += 56;
      return *(double *)a1;
    default:
      uint64_t v5 = bps_utility_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        uint64_t v9 = __ScreenTypeOverride;
        uint64_t v6 = "BPSScreenValueGetRelevantValue: %lu height override not found, defaulting to 812h value";
LABEL_15:
        _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
      }
LABEL_16:

LABEL_17:
      a1 += 24;
      return *(double *)a1;
  }
}

id BPSPillDeselectedColor()
{
  uint64_t v0 = [MEMORY[0x263F1C550] _secondarySystemBackgroundColor];
  uint64_t v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

id BPSPillSelectedColor()
{
  uint64_t v0 = [MEMORY[0x263F1C550] _tertiarySystemBackgroundColor];
  uint64_t v1 = BPSForceColorToDarkAppearance(v0);

  return v1;
}

id BPSPillButtonBackground(void *a1)
{
  id v1 = a1;
  if (BPSPillButtonBackground_onceToken != -1) {
    dispatch_once(&BPSPillButtonBackground_onceToken, &__block_literal_global_371);
  }
  uint64_t v2 = [(id)BPSPillButtonBackground_pillMapping objectForKey:v1];
  if (!v2)
  {
    v7.width = 18.0;
    v7.height = 18.0;
    UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 18.0, 18.0, 8.0);
    [v1 set];
    [v3 fill];
    double v4 = UIGraphicsGetImageFromCurrentImageContext();
    uint64_t v2 = [v4 stretchableImageWithLeftCapWidth:9 topCapHeight:9];

    UIGraphicsEndImageContext();
    [(id)BPSPillButtonBackground_pillMapping setObject:v2 forKey:v1];
  }
  return v2;
}

uint64_t __BPSPillButtonBackground_block_invoke()
{
  BPSPillButtonBackground_pillMapping = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

double BPSPillButtonImageDesiredSize(void *a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F1C358];
  id v2 = a1;
  uint64_t v3 = [v1 defaultParagraphStyle];
  double v4 = (void *)[v3 mutableCopy];

  [v4 setLineBreakMode:4];
  [v4 setAlignment:1];
  v13[0] = *MEMORY[0x263F1C238];
  uint64_t v5 = [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:17.0 design:*MEMORY[0x263F1D330]];
  uint64_t v6 = *MEMORY[0x263F1C268];
  v14[0] = v5;
  v14[1] = v4;
  uint64_t v7 = *MEMORY[0x263F1C240];
  v13[1] = v6;
  void v13[2] = v7;
  int v8 = BPSTextColor();
  v14[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  [v2 sizeWithAttributes:v9];
  double v11 = v10;

  return v11 + 40.0;
}

id BPSPillButtonImageWithColors(void *a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  v45[3] = *MEMORY[0x263EF8340];
  id v10 = a1;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x263F1C358];
  id v13 = a5;
  long long v14 = [v12 defaultParagraphStyle];
  long long v15 = (void *)[v14 mutableCopy];

  [v15 setLineBreakMode:4];
  [v15 setAlignment:1];
  __asm { FMOV            V1.2D, #16.0 }
  v43[0] = xmmword_21C53C8A0;
  v43[1] = _Q1;
  v43[2] = _Q1;
  v43[3] = _Q1;
  double RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)v43);
  v44[0] = *MEMORY[0x263F1C238];
  long long v22 = [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:RelevantValue design:*MEMORY[0x263F1D330]];
  uint64_t v23 = *MEMORY[0x263F1C268];
  v45[0] = v22;
  v45[1] = v15;
  uint64_t v24 = *MEMORY[0x263F1C240];
  v44[1] = v23;
  v44[2] = v24;
  v45[2] = v11;
  v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];

  if (v10) {
    v26 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v10 attributes:v25];
  }
  else {
    v26 = 0;
  }
  id v27 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v27 setAttributedText:v26];
  [v27 setNumberOfLines:0];
  [v27 setLineBreakMode:0];
  LODWORD(v2_Block_object_dispose(&a9, 8) = 0.5;
  [v27 _setHyphenationFactor:v28];
  [v10 sizeWithAttributes:v25];
  double v30 = v29;
  double v32 = v31;
  id v33 = BPSPillButtonBackground(v13);

  id v34 = [v33 stretchableImageWithLeftCapWidth:8 topCapHeight:8];

  double v35 = v30 + 40.0;
  if (v30 + 40.0 < a2) {
    double v35 = a2;
  }
  float v36 = v35;
  CGFloat v37 = floorf(v36);
  CGFloat v38 = fmax(a3, 50.0);
  v47.width = v37;
  v47.height = v38;
  UIGraphicsBeginImageContextWithOptions(v47, 0, 0.0);
  objc_msgSend(v34, "drawInRect:", 0.0, 0.0, v37, v38);
  float v39 = (v37 - v30) * 0.5;
  float v40 = (v38 - v32) * 0.5;
  objc_msgSend(v10, "drawInRect:withAttributes:", v25, floorf(v39), floorf(v40), v30, v32);
  long long v41 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v41;
}

id BPSPillButtonImageWithColor(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = a1;
  id v10 = BPSTextColor();
  id v11 = BPSPillButtonImageWithColors(v9, a2, a3, 0, v8, v10);

  return v11;
}

id BPSMigrationDevices()
{
  uint64_t v0 = [MEMORY[0x263F57710] sharedMigrator];
  id v1 = [v0 migratableDevicesRequiringConsent];

  return v1;
}

id BPSArchivedDevices()
{
  uint64_t v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global_381];

  return v1;
}

BOOL __BPSArchivedDevices_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForProperty:*MEMORY[0x263F575B8]];
  BOOL v3 = [v2 integerValue] != 0;

  return v3;
}

id BPSPairingPendingMigrationDevices()
{
  uint64_t v0 = [MEMORY[0x263F57710] sharedMigrator];
  id v1 = [v0 migratableDevices];

  return v1;
}

BOOL BPSHasMigrationDevices()
{
  uint64_t v0 = BPSMigrationDevices();
  BOOL v1 = [v0 count] != 0;

  return v1;
}

void BPSMigrateDevices(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = bps_utility_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v6;
          _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Consent: %@", buf, 0xCu);
        }

        id v8 = [MEMORY[0x263F57710] sharedMigrator];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __BPSMigrateDevices_block_invoke;
        v9[3] = &unk_264408EE0;
        void v9[4] = v6;
        [v8 setMigrationConsented:1 forDevice:v6 withBlock:v9];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v3);
  }
}

void __BPSMigrateDevices_block_invoke(uint64_t a1, uint64_t a2)
{
}

BOOL BPSTestMultipleMigrationChoice()
{
  return CFPreferencesGetAppBooleanValue(@"testMultipleWatchMigration", @"com.apple.Bridge", 0) != 0;
}

id BPSPillButtonImage(void *a1, double a2, double a3, uint64_t a4, char a5)
{
  id v8 = a1;
  if (a5) {
    BPSPillSelectedColor();
  }
  else {
  id v9 = BPSPillDeselectedColor();
  }
  long long v10 = BPSPillButtonImageWithColor(v8, a2, a3, 0, v9);

  return v10;
}

id BPSGetActivePairedDevice()
{
  uint64_t v0 = BPSGetActiveDevice();
  id v1 = [v0 valueForProperty:*MEMORY[0x263F575C8]];
  if ([v1 BOOLValue]) {
    uint64_t v2 = v0;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

uint64_t BPSTintedImage(void *a1, const char *a2)
{
  return [a1 imageWithTintColor:a2 renderingMode:1];
}

id BPSTintedSymbol(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = a2;
  uint64_t v5 = [v3 systemImageNamed:a1];
  uint64_t v6 = [v5 imageWithTintColor:v4 renderingMode:1];

  return v6;
}

id BPSScaledTintedSymbol(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v6 = (void *)MEMORY[0x263F1C6C8];
  id v7 = a3;
  id v8 = a1;
  id v9 = [v6 configurationWithScale:a2];
  long long v10 = [v5 systemImageNamed:v8 withConfiguration:v9];

  long long v11 = [v10 imageWithTintColor:v7 renderingMode:1];

  return v11;
}

void _BPSRemoveSystemDeletedAppFromSpecifiers(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [MEMORY[0x263F089C8] indexSet];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = ___BPSRemoveSystemDeletedAppFromSpecifiers_block_invoke;
  long long v11 = &unk_264408F78;
  id v12 = v5;
  id v13 = v3;
  id v6 = v5;
  id v7 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];
  objc_msgSend(v4, "removeObjectsAtIndexes:", v6, v8, v9, v10, v11);
}

BOOL BPSBundleIDIsForAppleApp(void *a1)
{
  [a1 rangeOfString:@"com.apple." options:9];
  return v1 != 0;
}

void BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers(void *a1)
{
}

id __BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers_block_invoke(uint64_t a1, void *a2)
{
  return BPSWatchAppBundleIDForSettingsBundleSpecifier(a2);
}

void BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers(void *a1)
{
}

uint64_t __BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers_block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id BPSMappedNanoBundleIDForNanoSettingsBundleID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _BPSMappedNanoBundleIDForNanoSettingsBundleIDIfPresent(v1);
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = v1;
  }
  id v4 = v2;

  return v4;
}

uint64_t BPSIsNewsAllowed()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v9 = 0;
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.news" allowPlaceholder:0 error:&v9];
  id v1 = v9;
  if (v1)
  {
    uint64_t v2 = bps_utility_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v11 = @"com.apple.news";
      __int16 v12 = 2112;
      id v13 = v1;
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }
  }
  id v3 = +[BPSBridgeAppContext shared];
  id v4 = [v3 activeDevice];
  if (BPSDeviceHasCapabilityForString(@"news-app", v4))
  {
    uint64_t v5 = [v0 applicationState];
    if ([v5 isRestricted])
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v7 = [v0 applicationState];
      uint64_t v6 = [v7 isValid];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t BPSIsWalkieTalkieAppInstalled()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (BPSIsWalkieTalkieAppInstalled_onceToken != -1) {
    dispatch_once(&BPSIsWalkieTalkieAppInstalled_onceToken, &__block_literal_global_698);
  }
  id v0 = (id)[(id)BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain synchronize];
  unsigned __int8 v6 = 0;
  unsigned int v1 = [(id)BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain BOOLForKey:@"AppIsInstalled" keyExistsAndHasValidFormat:&v6];
  unsigned int v2 = v1;
  if (v6) {
    uint64_t v3 = v1;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = bps_utility_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "BOOL BPSIsWalkieTalkieAppInstalled()";
    __int16 v9 = 1024;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v2;
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "%s returning %d{BOOL} (keyExists=%d{BOOL} isWalkieTalkieInstalled=%d{BOOL})", buf, 0x1Eu);
  }

  return v3;
}

uint64_t __BPSIsWalkieTalkieAppInstalled_block_invoke()
{
  BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.tincan"];
  return MEMORY[0x270F9A758]();
}

id BPSMappedNanoSettingsBundleIDForNanoBundleID(void *a1)
{
  v9[27] = *MEMORY[0x263EF8340];
  v8[0] = @"com.apple.NanoMaps";
  v8[1] = @"com.apple.AppStore";
  v9[0] = @"com.apple.NanoMapsBridgeSettings";
  v9[1] = @"com.apple.BridgeAppStoreDaemonSettings";
  v8[2] = @"com.apple.NanoMusic";
  v8[3] = @"com.apple.NanoMail";
  v9[2] = @"com.apple.NanoMusicBridgeSettings";
  v9[3] = @"com.apple.NanoMailBridgeSettings";
  _OWORD v8[4] = @"com.apple.NanoPassbook";
  v8[5] = @"com.apple.NanoPhotos";
  void v9[4] = @"com.apple.NanoPassbookBridgeSettings";
  void v9[5] = @"com.apple.NanoPhotosBridgeSettings";
  v8[6] = @"com.apple.MobileAddressBook";
  v8[7] = @"com.apple.NanoSleep.watchkitapp";
  v9[6] = @"com.apple.NanoContactsBridgeSettingsTinker";
  v9[7] = @"com.apple.NanoBedtimeBridgeSettings";
  v8[8] = @"com.apple.MobileSMS";
  v8[9] = @"com.apple.NanoAlarm";
  v9[8] = @"com.apple.MessagesBridgeSettings";
  v9[9] = @"com.apple.NanoClockBridgeSettings";
  v8[10] = @"com.apple.NanoPhone";
  v8[11] = @"com.apple.NanoCalendar";
  v9[10] = @"com.apple.PhoneBridgeSettings";
  v9[11] = @"com.apple.NanoCalendarBridgeSettings";
  v8[12] = @"com.apple.weather.watchapp";
  v8[13] = @"com.apple.stocks.watchapp";
  v9[12] = @"com.apple.weatherbridgesettings";
  v9[13] = @"com.apple.StocksBridgeSettings";
  v8[14] = @"com.apple.ActivityMonitorApp";
  v8[15] = @"com.apple.SessionTrackerApp";
  v9[14] = @"com.apple.HealthAppsSettings";
  v9[15] = @"com.apple.SessionTrackerAppSettings";
  v8[16] = @"com.apple.DeepBreathing";
  v8[17] = @"com.apple.HeartRate";
  v9[16] = @"com.apple.DeepBreathingSettings";
  v9[17] = @"com.apple.HeartRateSettings";
  v8[18] = @"com.apple.tincan";
  v8[19] = @"com.apple.Noise";
  v9[18] = @"com.apple.tincan.settings";
  v9[19] = @"com.apple.Noise.settings";
  v8[20] = @"com.apple.NanoBooks";
  v8[21] = @"com.apple.podcasts";
  v9[20] = @"com.apple.NanoBooks.BridgeSettings";
  v9[21] = @"com.apple.private.PodcastsBridgeSettings";
  v8[22] = @"com.apple.NanoOxygenSaturation.watchkitapp";
  v8[23] = @"com.apple.Mind";
  v9[22] = @"com.apple.OxygenSaturationSettings";
  v9[23] = @"com.apple.MindSettings";
  v8[24] = @"com.apple.NanoTips";
  v8[25] = @"com.apple.NanoMenstrualCycles";
  v9[24] = @"com.apple.NanoTipsBridgeSettings";
  v9[25] = @"com.apple.NanoMenstrualCyclesCompanionSettings";
  v8[26] = @"com.apple.Depth";
  v9[26] = @"com.apple.DepthCompanionSettings";
  unsigned int v1 = NSDictionary;
  id v2 = a1;
  uint64_t v3 = [v1 dictionaryWithObjects:v9 forKeys:v8 count:27];
  id v4 = [v3 objectForKey:v2];
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = v2;
  }
  id v6 = v4;

  return v6;
}

uint64_t BPSShouldOfferSiriForDeviceLanguage()
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v0 = +[BPSBridgeAppContext shared];
  unsigned int v1 = [v0 activeDevice];

  id v2 = [v1 valueForProperty:*MEMORY[0x263F57660]];
  uint64_t v3 = [v1 valueForProperty:*MEMORY[0x263F57668]];
  id v4 = [getAFPreferencesClass() sharedPreferences];
  int v5 = [v4 assistantIsEnabled];

  if (v5)
  {
    id v6 = [getAFPreferencesClass() sharedPreferences];
    id v7 = [v6 languageCode];

    if (v7)
    {
      id v17 = 0;
      uint64_t v8 = [getAFConnectionClass() siriIsSupportedForLanguageCode:v7 productName:v2 productVersion:v3 error:&v17];
      id v9 = v17;
    }
    else
    {
      id v9 = 0;
      uint64_t v8 = 0;
    }
    __int16 v13 = bps_utility_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v23 = v3;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v8;
      HIWORD(v24) = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v9;
      unsigned int v14 = "siriLanguageCode: %@, watchProductName %@, watchProductVersion %@; shouldOfferSiri: %d, phoneError: %@; watchError: %@";
LABEL_18:
      _os_log_impl(&dword_21C513000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x3Au);
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x2020000000;
    __int16 v11 = (uint64_t (*)(uint64_t))get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr;
    long long v21 = get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr;
    if (!get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke;
      uint64_t v23 = &unk_264408888;
      uint64_t v24 = &v18;
      __get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke((uint64_t)buf);
      __int16 v11 = (uint64_t (*)(uint64_t))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v11)
    {
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
      __break(1u);
    }
    id v7 = (void *)v11(v10);
    if (v7)
    {
      int v12 = [getAFPreferencesClass() sharedPreferences];
      if ([v12 isCurrentLocaleNativelySupported])
      {
        id v16 = 0;
        uint64_t v8 = [getAFConnectionClass() siriIsSupportedForLanguageCode:v7 productName:v2 productVersion:v3 error:&v16];
        id v9 = v16;
      }
      else
      {
        id v9 = 0;
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = 0;
    }
    __int16 v13 = bps_utility_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v23 = v3;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v8;
      HIWORD(v24) = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v9;
      unsigned int v14 = "phoneLanguageCode: %@, watchProductName %@, watchProductVersion %@; shouldOfferSiri: %d, phoneError: %@; watchError: %@";
      goto LABEL_18;
    }
  }

  return v8;
}

void sub_21C5389EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_264408888;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21C538AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFConnectionClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAFConnectionClass_softClass;
  uint64_t v7 = getAFConnectionClass_softClass;
  if (!getAFConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFConnectionClass_block_invoke;
    v3[3] = &unk_264408888;
    v3[4] = &v4;
    __getAFConnectionClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21C538BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BPSDefaultTitleTextAttributes()
{
  if (BPSDefaultTitleTextAttributes_onceToken != -1) {
    dispatch_once(&BPSDefaultTitleTextAttributes_onceToken, &__block_literal_global_724);
  }
  id v0 = (void *)BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes;
  return v0;
}

void __BPSDefaultTitleTextAttributes_block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v0 setLineBreakMode:4];
  [v0 setAlignment:1];
  [v0 setLineSpacing:0.0];
  id v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  uint64_t v2 = *MEMORY[0x263F1C268];
  v5[0] = *MEMORY[0x263F1C238];
  v5[1] = v2;
  v6[0] = v1;
  v6[1] = v0;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v4 = (void *)BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes;
  BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes = v3;
}

id BPSDefaultDetailTextAttributes()
{
  if (BPSDefaultDetailTextAttributes_onceToken != -1) {
    dispatch_once(&BPSDefaultDetailTextAttributes_onceToken, &__block_literal_global_727);
  }
  id v0 = (void *)BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes;
  return v0;
}

void __BPSDefaultDetailTextAttributes_block_invoke()
{
  void v5[2] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v0 setLineBreakMode:4];
  [v0 setAlignment:1];
  v4[0] = *MEMORY[0x263F1C238];
  id v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v4[1] = *MEMORY[0x263F1C268];
  v5[0] = v1;
  v5[1] = v0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  uint64_t v3 = (void *)BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes;
  BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes = v2;
}

void BPSOpenSensitiveURLAsync(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  [v2 setSensitive:1];
  uint64_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __BPSOpenSensitiveURLAsync_block_invoke;
  void v5[3] = &unk_264409030;
  id v6 = v1;
  id v4 = v1;
  [v3 openURL:v4 configuration:v2 completionHandler:v5];
}

void __BPSOpenSensitiveURLAsync_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = bps_utility_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "result of open URL: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void *__getNPKDefaultsDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoPassKitLibrary();
  uint64_t result = dlsym(v2, "NPKDefaultsDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNPKDefaultsDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPassKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoPassKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFPreferencesClass_block_invoke_cold_1();
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AssistantServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AssistantServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264409090;
    uint64_t v3 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAFConnectionClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAFConnectionClass_block_invoke_cold_1();
  }
  getAFConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getNSSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFAProfilePictureStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getFAProfilePictureStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  return __getNPKCompanionAgentConnectionClass_block_invoke_cold_1();
}

uint64_t __getNPKCompanionAgentConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSAcknowledgePrivacyTaskClass_block_invoke_cold_1()
{
  return __getNanoResourceGrabberClass_block_invoke_cold_1();
}

uint64_t __getNanoResourceGrabberClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BPSWatchSetupProxCardViewController initWithUserInfo:withDismissCompletionHandler:](v0);
}

void _BPSUnlocalizedNameForMaterial_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_fault_impl(&dword_21C513000, a2, OS_LOG_TYPE_FAULT, "BPS BPSUnlocalizedNameForMaterial Unknown Material (%{public}@)", (uint8_t *)&v4, 0xCu);
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFConnectionClass_block_invoke_cold_1(v0);
}

void __getAFConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = (CATransform3D *)abort_report_np();
  CATransform3DScale(v1, v0, v2, v3, v4);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x270F4ADE0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t NRDeviceSizeForArtworkDeviceSubType()
{
  return MEMORY[0x270F4D890]();
}

uint64_t NRDeviceSizeForProductType()
{
  return MEMORY[0x270F4D898]();
}

uint64_t NRRawVersionFromString()
{
  return MEMORY[0x270F4D8A8]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x270F4D8B0]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x270F4D8C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t PBAdvertisingInfoFromPayload()
{
  return MEMORY[0x270F51640]();
}

uint64_t PBIsInternalInstall()
{
  return MEMORY[0x270F51648]();
}

uint64_t PSIsInternalInstall()
{
  return MEMORY[0x270F55228]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x270F552E8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pbb_accountsignin_log()
{
  return MEMORY[0x270F51650]();
}

uint64_t pbb_bridge_log()
{
  return MEMORY[0x270F51658]();
}

uint64_t pbb_mobileasset_log()
{
  return MEMORY[0x270F51668]();
}

uint64_t pbb_proxcard_log()
{
  return MEMORY[0x270F51670]();
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}