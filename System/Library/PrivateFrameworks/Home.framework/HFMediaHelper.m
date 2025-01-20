@interface HFMediaHelper
+ (BOOL)canMediaProfileContainer:(id)a3 supportHomeTheaterWithAppleTV:(id)a4;
+ (BOOL)isAirPortExpress:(id)a3;
+ (BOOL)isAnyKindOfGroup:(id)a3;
+ (BOOL)isAppleTV:(id)a3;
+ (BOOL)isAudioAnalysisSupportedDevice:(id)a3;
+ (BOOL)isAudioReceiver:(id)a3;
+ (BOOL)isContainedWithinMediaSystem:(id)a3;
+ (BOOL)isDoorbellChimeEnabled:(id)a3;
+ (BOOL)isHomePod:(id)a3;
+ (BOOL)isHomePodMediaSystem:(id)a3;
+ (BOOL)isHomePodMini:(id)a3;
+ (BOOL)isHomePodMiniMediaSystem:(id)a3;
+ (BOOL)isHomePodOriginal:(id)a3;
+ (BOOL)isHomePodOriginalMediaSystem:(id)a3;
+ (BOOL)isSiriDisabled:(id)a3;
+ (BOOL)isSiriEndpoint:(id)a3;
+ (BOOL)supportsDoorbellChime:(id)a3;
+ (id)_findAccessorySettingSiriLanguageAdapterFor:(id)a3;
+ (id)allAccessoriesContainedIn:(id)a3;
+ (id)changeAllSiriLanguageOptionsFor:(id)a3 to:(id)a4;
+ (id)changeSiriLanguageOptionFor:(id)a3 to:(id)a4;
+ (id)mediaContainerSymbolConfiguration;
+ (id)mediaIconDescriptorForMediaContainer:(id)a3;
+ (id)mediaProfileContainerForItem:(id)a3 forTopLevel:(BOOL)a4;
+ (id)siriLanguageOptionFor:(id)a3;
@end

@implementation HFMediaHelper

+ (BOOL)isHomePodMediaSystem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6 != 0;
}

+ (BOOL)isHomePod:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isHomePod");

  return v4;
}

+ (BOOL)isHomePodOriginalMediaSystem:(id)a3
{
  id v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:v3])
  {
    char v4 = [v3 accessories];
    v5 = [v4 anyObject];
    BOOL v6 = [v5 homePodVariant] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isAnyKindOfGroup:(id)a3
{
  return +[HFMediaHelper isHomePodMediaSystem:a3];
}

+ (BOOL)isHomePodOriginal:(id)a3
{
  id v3 = a3;
  if (+[HFMediaHelper isHomePod:v3])
  {
    char v4 = objc_msgSend(v3, "hf_backingAccessory");
    BOOL v5 = [v4 homePodVariant] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isContainedWithinMediaSystem:(id)a3
{
  id v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:v3])
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v5 = objc_msgSend(v3, "hf_home");
    BOOL v6 = objc_msgSend(v3, "hf_backingAccessory");
    v7 = objc_msgSend(v5, "hf_mediaSystemForAccessory:", v6);
    BOOL v4 = v7 != 0;
  }
  return v4;
}

+ (BOOL)isHomePodMiniMediaSystem:(id)a3
{
  id v3 = a3;
  if (+[HFMediaHelper isHomePodMediaSystem:v3])
  {
    BOOL v4 = [v3 accessories];
    BOOL v5 = [v4 anyObject];
    BOOL v6 = [v5 homePodVariant] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isHomePodMini:(id)a3
{
  id v3 = a3;
  if (+[HFMediaHelper isHomePod:v3])
  {
    BOOL v4 = objc_msgSend(v3, "hf_backingAccessory");
    BOOL v5 = [v4 homePodVariant] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleTV:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAppleTV");

  return v4;
}

+ (BOOL)isAirPortExpress:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAirPortExpressSpeaker");

  return v4;
}

+ (BOOL)isAudioReceiver:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAudioReceiver");

  return v4;
}

+ (BOOL)isSiriDisabled:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "hf_settingsValueManager");
  BOOL v5 = [v3 settings];

  BOOL v6 = objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", @"root.siri.allowHeySiri");

  objc_opt_class();
  v7 = [v4 valueForSetting:v6];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    int v10 = [v9 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)isAudioAnalysisSupportedDevice:(id)a3
{
  id v3 = [a3 accessories];
  char v4 = [v3 anyObject];

  if (objc_msgSend(v4, "hf_isAudioAnalysisSupportedDevice")) {
    char v5 = objc_msgSend(v4, "hf_isHomePod");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isSiriEndpoint:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isSiriEndpoint");

  return v4;
}

+ (BOOL)canMediaProfileContainer:(id)a3 supportHomeTheaterWithAppleTV:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 accessories];
  int v10 = [v9 anyObject];

  v11 = HFLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    int v25 = 138413058;
    id v26 = a1;
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Extracted homepod accessory for media profile container. HomePod: %@ mediaProfileContainer: %@", (uint8_t *)&v25, 0x2Au);
  }
  if (!v8)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"HFMediaHelper.m" lineNumber:214 description:@"Home Theater Accessory candidate should not be nil."];
  }
  if ((objc_msgSend(v8, "hf_isAppleTV") & 1) == 0)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2 object:a1 file:@"HFMediaHelper.m" lineNumber:215 description:@"Home Theater Accessory candidate can only be an apple TV."];
  }
  if ([v10 homePodVariant] == 3
    && ([v8 audioDestinationController],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 supportsSameRoomB620Destinations],
        v13,
        (v14 & 1) == 0))
  {
    v18 = HFLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      int v25 = 138413058;
      id v26 = a1;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory does not support B620 as audio destination. HomePod: %@ Accessory: %@", (uint8_t *)&v25, 0x2Au);
    }
    BOOL v20 = 0;
  }
  else
  {
    v15 = HFLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      v17 = [v8 audioDestinationController];
      int v25 = 138413058;
      id v26 = a1;
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Checking Accessory %@ with audio destination controller %@ for empty destination.", (uint8_t *)&v25, 0x2Au);
    }
    v18 = [v8 audioDestinationController];
    v19 = [v18 destination];
    BOOL v20 = v19 == 0;
  }
  return v20;
}

+ (BOOL)supportsDoorbellChime:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = [v5 settings];
  id v7 = objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", @"root.doorbellChime.enabled");

  id v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(a2);
    int v19 = 138413058;
    id v20 = a1;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ media profile container: %@ has doorbell setting: %@", (uint8_t *)&v19, 0x2Au);
  }
  if (v7 || ![a1 isSiriEndpoint:v5])
  {
    BOOL v16 = 0;
  }
  else
  {
    int v10 = objc_msgSend(v5, "hf_backingAccessory");
    v11 = [v10 mediaProfile];
    v12 = objc_msgSend(v11, "hf_mediaAccessoryCommonSettingsManager");

    v13 = [v12 settingForKeyPath:HFDoorbellChimeEnabledKeyPath];
    char v14 = HFLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromSelector(a2);
      int v19 = 138413314;
      id v20 = a1;
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri endpoint media profile container: %@ has doorbell setting: %@, for common settings manager: %@", (uint8_t *)&v19, 0x34u);
    }
    BOOL v16 = v13 != 0;
  }
  if (v7) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v16;
  }

  return v17;
}

+ (BOOL)isDoorbellChimeEnabled:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hf_settingsValueManager");
  BOOL v6 = [v4 settings];
  id v7 = objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", @"root.doorbellChime.enabled");

  objc_opt_class();
  id v8 = [v5 valueForSetting:v7];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (!v7 && [a1 isSiriEndpoint:v4])
  {
    v11 = objc_msgSend(v4, "hf_backingAccessory");
    v12 = [v11 mediaProfile];
    v13 = objc_msgSend(v12, "hf_mediaAccessoryCommonSettingsManager");

    uint64_t v14 = [v13 settingValueForKeyPath:HFDoorbellChimeEnabledKeyPath];

    id v10 = (id)v14;
  }
  if (v10) {
    char v15 = [v10 BOOLValue];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

+ (id)mediaIconDescriptorForMediaContainer:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() mediaContainerSymbolConfiguration];
  id v5 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"hifispeaker.fill" configuration:v4];
  if (+[HFMediaHelper isHomePodMiniMediaSystem:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"homepodmini.2.fill";
LABEL_13:
    id v8 = [(HFImageIconDescriptor *)v6 initWithSystemImageNamed:v7 configuration:v4];
LABEL_14:
    id v9 = (HFImageIconDescriptor *)v8;

    id v5 = v9;
    goto LABEL_15;
  }
  if (+[HFMediaHelper isHomePodMini:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"homepodmini.fill";
    goto LABEL_13;
  }
  if (+[HFMediaHelper isHomePodMediaSystem:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"homepod.2.fill";
    goto LABEL_13;
  }
  if (+[HFMediaHelper isHomePod:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"homepod.fill";
    goto LABEL_13;
  }
  if (+[HFMediaHelper isAppleTV:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"appletv.fill";
    goto LABEL_13;
  }
  if (+[HFMediaHelper isAirPortExpress:v3])
  {
    BOOL v6 = [HFImageIconDescriptor alloc];
    id v7 = @"airport.extreme";
    goto LABEL_13;
  }
  if (+[HFMediaHelper isAudioReceiver:v3])
  {
    id v8 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierReceiver"];
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

+ (id)mediaContainerSymbolConfiguration
{
  v2 = (void *)MEMORY[0x263F1C6C8];
  id v3 = [MEMORY[0x263F1C550] systemGrayColor];
  id v4 = [v2 configurationWithHierarchicalColor:v3];

  id v5 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D300] scale:3];
  BOOL v6 = [v5 configurationByApplyingConfiguration:v4];

  return v6;
}

+ (id)_findAccessorySettingSiriLanguageAdapterFor:(id)a3
{
  id v3 = objc_msgSend(a3, "hf_settingsAdapterManager");
  id v4 = [v3 adapterForIdentifier:@"SiriLanguageAdapter"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)siriLanguageOptionFor:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = +[HFHomeKitDispatcher sharedDispatcher];
    id v9 = [v8 homeManager];
    int v10 = [v9 hasOptedToHH2];

    if (v10
      || ([v7 accessory],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = objc_msgSend(v11, "hf_isSiriEndpoint"),
          v11,
          v12))
    {
      v13 = objc_msgSend(v7, "hf_siriLanguageOptionsManager");
    }
    else
    {
      v13 = +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:v5];
    }
    id v16 = v13;
    id v20 = [v13 selectedLanguageOption];
  }
  else
  {
    objc_opt_class();
    id v14 = v5;
    if (objc_opt_isKindOfClass()) {
      char v15 = v14;
    }
    else {
      char v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      BOOL v17 = +[HFHomeKitDispatcher sharedDispatcher];
      v18 = [v17 homeManager];
      int v19 = [v18 hasOptedToHH2];

      if (v19) {
        objc_msgSend(v16, "hf_siriLanguageOptionsManager");
      }
      else {
      v35 = +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:v14];
      }
      id v20 = [v35 selectedLanguageOption];
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = [v14 mediaProfiles];
      uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        aSelector = a2;
        id v23 = 0;
        uint64_t v24 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(obj);
            }
            id v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            __int16 v27 = +[HFHomeKitDispatcher sharedDispatcher];
            v28 = [v27 homeManager];
            int v29 = [v28 hasOptedToHH2];

            if (v29
              || ([v26 accessory],
                  id v30 = objc_claimAutoreleasedReturnValue(),
                  int v31 = objc_msgSend(v30, "hf_isSiriEndpoint"),
                  v30,
                  v31))
            {
              id v32 = objc_msgSend(v26, "hf_siriLanguageOptionsManager");
            }
            else
            {
              id v32 = +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:v26];
            }
            uint64_t v33 = v32;
            v34 = [v32 selectedLanguageOption];

            if (!v34)
            {
              v36 = HFLogForCategory(0);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412546;
                v46 = v37;
                __int16 v47 = 2112;
                v48 = v26;
                _os_log_impl(&dword_20B986000, v36, OS_LOG_TYPE_DEFAULT, "%@ Media Profile %@ does not have a selected language option", buf, 0x16u);
              }
LABEL_38:

              id v20 = 0;
              id v16 = 0;
              goto LABEL_41;
            }
            if (v23)
            {
              if (![v23 isEqual:v34]) {
                goto LABEL_38;
              }
            }
            else
            {
              id v23 = v34;
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
          id v16 = 0;
          if (v22) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v23 = 0;
      }

      id v23 = v23;
      id v20 = v23;
LABEL_41:
    }
  }

  return v20;
}

+ (id)changeAllSiriLanguageOptionsFor:(id)a3 to:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(v6, "hmf_isEmpty");
  if (!v7 || v8)
  {
    int v10 = HFLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      BOOL v17 = [v7 recognitionLanguage];
      *(_DWORD *)buf = 138412802;
      __int16 v25 = v16;
      __int16 v26 = 2112;
      __int16 v27 = v17;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@ No speaker languages changed to %@ for %@", buf, 0x20u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v9 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          char v15 = +[HFMediaHelper changeSiriLanguageOptionFor:to:](HFMediaHelper, "changeSiriLanguageOptionFor:to:", *(void *)(*((void *)&v19 + 1) + 8 * i), v7, (void)v19);
          objc_msgSend(v9, "na_safeAddObject:", v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }

  return v9;
}

+ (id)changeSiriLanguageOptionFor:(id)a3 to:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v8 recognitionLanguage];
    *(_DWORD *)buf = 138413058;
    id v47 = a1;
    __int16 v48 = 2112;
    *(void *)v49 = v10;
    *(_WORD *)&v49[8] = 2112;
    *(void *)&v49[10] = v11;
    __int16 v50 = 2112;
    id v51 = v7;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);
  }
  if (!v8)
  {
    BOOL v17 = HFLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v47 = a1;
      __int16 v48 = 2112;
      *(void *)v49 = v39;
      _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "%@:%@: Can't change to an nil Siri language", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x263F58190];
    long long v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 33;
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "hf_isReachable") & 1) == 0)
  {
    long long v21 = HFLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(a2);
      int v41 = objc_msgSend(v7, "hf_isReachable");
      long long v42 = objc_msgSend(v7, "hf_displayName");
      *(_DWORD *)buf = 138412802;
      id v47 = v40;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v41;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v42;
      _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "%@ Controller is reachable? %{BOOL}d. Language change failed for [%@]", buf, 0x1Cu);
    }
    v18 = (void *)MEMORY[0x263F58190];
    long long v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 35;
LABEL_13:
    long long v22 = objc_msgSend(v19, "hf_errorWithCode:", v20);
    id v23 = [v18 futureWithError:v22];
LABEL_29:
    v35 = v23;
    goto LABEL_30;
  }
  uint64_t v12 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v13 = [v12 homeManager];
  int v14 = [v13 hasOptedToHH2];

  if (v14)
  {
    id v15 = +[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:v7];
    id v16 = [v15 updateSelectedLanguageOption:v8];
  }
  else
  {
    objc_opt_class();
    id v24 = v7;
    if (objc_opt_isKindOfClass()) {
      __int16 v25 = v24;
    }
    else {
      __int16 v25 = 0;
    }
    id v15 = v25;

    __int16 v26 = [v15 accessory];
    char v27 = objc_msgSend(v26, "hf_isSiriEndpoint");

    if ((v27 & 1) != 0
      || (+[HFMediaHelper _findAccessorySettingSiriLanguageAdapterFor:](HFMediaHelper, "_findAccessorySettingSiriLanguageAdapterFor:", v24), v28 = objc_claimAutoreleasedReturnValue(), [v28 updateSelectedLanguageOption:v8], id v16 = objc_claimAutoreleasedReturnValue(), v28, !v16))
    {
      objc_opt_class();
      id v29 = v24;
      if (objc_opt_isKindOfClass()) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = 0;
      }
      id v31 = v30;

      if (v15) {
        id v32 = v15;
      }
      else {
        id v32 = v31;
      }
      uint64_t v33 = objc_msgSend(v32, "hf_siriLanguageOptionsManager");
      id v16 = [v33 updateSelectedLanguageOption:v8];
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __48__HFMediaHelper_changeSiriLanguageOptionFor_to___block_invoke;
    v43[3] = &unk_2640908A0;
    SEL v45 = a2;
    id v44 = v24;
    id v34 = (id)[v16 addFailureBlock:v43];
  }
  if (v16)
  {
    id v23 = v16;
    long long v22 = v23;
    goto LABEL_29;
  }
  v37 = (void *)MEMORY[0x263F58190];
  v38 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
  v35 = [v37 futureWithError:v38];

  long long v22 = 0;
LABEL_30:

  return v35;
}

void __48__HFMediaHelper_changeSiriLanguageOptionFor_to___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)allAccessoriesContainedIn:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HFMediaHelper_allAccessoriesContainedIn___block_invoke;
  v8[3] = &unk_2640902B8;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend(v3, "na_each:", v8);

  id v6 = (void *)[v5 copy];
  return v6;
}

void __43__HFMediaHelper_allAccessoriesContainedIn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (+[HFMediaHelper isHomePodMediaSystem:v3])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(v3, "accessories", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 32) addObject:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v4 = [v3 accessories];
    int v10 = [v4 anyObject];
    [v9 addObject:v10];
  }
}

+ (id)mediaProfileContainerForItem:(id)a3 forTopLevel:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  unint64_t v11 = v10;

  objc_opt_class();
  id v12 = v9;
  if (objc_opt_isKindOfClass()) {
    long long v13 = v12;
  }
  else {
    long long v13 = 0;
  }
  unint64_t v14 = v13;

  id v15 = 0;
  if (v11 | v14)
  {
    if (v14
      && ([(id)v14 service],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [v16 accessory],
          BOOL v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = objc_msgSend(v17, "hf_isHomePod"),
          v17,
          v16,
          !v18))
    {
      id v15 = 0;
    }
    else
    {
      long long v19 = a2;
      id v35 = a1;
      if (v11)
      {
        [(id)v11 mediaProfileContainer];
      }
      else
      {
        id v34 = [(id)v14 service];
        id v4 = [v34 accessory];
        [v4 mediaProfile];
      uint64_t v20 = };
      id v21 = v20;
      long long v22 = &unk_26C155B48;
      if ([v21 conformsToProtocol:v22]) {
        id v23 = v21;
      }
      else {
        id v23 = 0;
      }
      id v15 = v23;

      if (!v11)
      {

        uint64_t v20 = v34;
      }

      if (v5)
      {
        objc_opt_class();
        id v15 = v15;
        id v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;
        id v25 = v24;

        if (!v25)
        {
          __int16 v26 = objc_msgSend(v15, "hf_home");
          char v27 = objc_msgSend(v15, "hf_backingAccessory");
          __int16 v28 = objc_msgSend(v26, "hf_mediaSystemForAccessory:", v27);

          if (v28) {
            id v29 = v28;
          }
          else {
            id v29 = v15;
          }
          id v30 = v29;

          id v15 = v30;
        }
      }
      id v31 = HFLogForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = NSStringFromSelector(v19);
        *(_DWORD *)buf = 138413314;
        id v37 = v35;
        __int16 v38 = 2112;
        v39 = v32;
        __int16 v40 = 2112;
        unint64_t v41 = v11;
        __int16 v42 = 2112;
        unint64_t v43 = v14;
        __int16 v44 = 2112;
        id v45 = v15;
        _os_log_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ Found top level of media profile container for this accessory. accessoryItem: %@ serviceItem: %@ mediaProfileContainer: %@", buf, 0x34u);
      }
    }
  }

  return v15;
}

@end