@interface CPSUtilities
+ (BOOL)_associatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4 serviceType:(id)a5;
+ (BOOL)appClipAssociatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4;
+ (BOOL)deviceHasCapabilities:(id)a3;
+ (BOOL)deviceHasHomeButton;
+ (BOOL)deviceIsLocked;
+ (BOOL)deviceIsPad;
+ (BOOL)isBundleIdentifierBeingInstalled:(id)a3;
+ (BOOL)isNetworkConstrained;
+ (BOOL)shouldPlayHaptics;
+ (BOOL)validDomainAssociationWithAnyServiceTypeForURL:(id)a3 applicationIdentifier:(id)a4;
+ (id)localizedDeviceName;
+ (id)lowercasedDeviceFamilyName;
+ (id)openURL:(id)a3;
+ (id)openURL:(id)a3 withOptions:(id)a4;
+ (id)oppositeDeviceFamilyName;
+ (id)osVersion;
+ (id)poweredByCaptionForAppName:(id)a3;
+ (id)productVariants;
+ (id)versionIdentifierForAppWithBundleIdentifier:(id)a3 isPlaceholder:(BOOL *)a4;
+ (int)_deviceClass;
+ (void)openAppWithBundleIdentifier:(id)a3;
+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 promptForUnlock:(BOOL)a5 originIsControlCenter:(BOOL)a6 completionHandler:(id)a7;
+ (void)uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation CPSUtilities

+ (id)openURL:(id)a3
{
  return (id)[a1 openURL:a3 withOptions:0];
}

+ (id)openURL:(id)a3 withOptions:(id)a4
{
  v5 = (void *)MEMORY[0x263F01880];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 defaultWorkspace];
  id v11 = 0;
  [v8 openURL:v7 withOptions:v6 error:&v11];

  id v9 = v11;

  return v9;
}

+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
}

+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 promptForUnlock:(BOOL)a5 originIsControlCenter:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = objc_alloc(MEMORY[0x263F018D0]);
  v15 = (void *)[v14 initWithActivityType:*MEMORY[0x263F08658]];
  [v15 setWebpageURL:v11];
  v16 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v12];
  v17 = [MEMORY[0x263EFF9A0] dictionary];
  v18 = [NSNumber numberWithBool:v9];
  [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F3F5E8]];

  if (v8)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    v19 = (void *)getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr;
    uint64_t v28 = getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr;
    if (!getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke;
      v24[3] = &unk_26424E580;
      v24[4] = &v25;
      __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke((uint64_t)v24);
      v19 = (void *)v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v19) {
      +[CPSUtilities openURL:inAppWithBundleIdentifier:promptForUnlock:originIsControlCenter:completionHandler:]();
    }
    [v17 setObject:*v19 forKeyedSubscript:*MEMORY[0x263F3F5C0]];
  }
  v20 = [MEMORY[0x263F01880] defaultWorkspace];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __106__CPSUtilities_openURL_inAppWithBundleIdentifier_promptForUnlock_originIsControlCenter_completionHandler___block_invoke;
  v22[3] = &unk_26424E4E0;
  id v23 = v13;
  id v21 = v13;
  [v20 openUserActivity:v15 withApplicationProxy:v16 options:v17 completionHandler:v22];
}

uint64_t __106__CPSUtilities_openURL_inAppWithBundleIdentifier_promptForUnlock_originIsControlCenter_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)openAppWithBundleIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  id v5 = [v3 defaultWorkspace];
  [v5 openApplicationWithBundleID:v4];
}

+ (id)versionIdentifierForAppWithBundleIdentifier:(id)a3 isPlaceholder:(BOOL *)a4
{
  id v5 = (objc_class *)MEMORY[0x263F01878];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];

  if (a4) {
    *a4 = [v7 isPlaceholder];
  }
  if (v7)
  {
    BOOL v8 = NSNumber;
    BOOL v9 = [v7 iTunesMetadata];
    v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "versionIdentifier"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UninstallClip", "start uninstall clip", buf, 2u);
  }
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
  BOOL v9 = [v8 appClipMetadata];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F4BE78];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke;
    v13[3] = &unk_26424E530;
    id v14 = v5;
    id v15 = v6;
    [v10 uninstallAppWithBundleID:v14 requestUserConfirmation:0 completion:v13];

    id v11 = v14;
LABEL_8:

    goto LABEL_9;
  }
  id v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    +[CPSUtilities uninstallAppWithBundleIdentifier:completion:]((uint64_t)v5, v12);
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v6)
  {
LABEL_7:
    id v11 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
    goto LABEL_8;
  }
LABEL_9:
}

void __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke_cold_1(a1, v5, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 138477827;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "CPSUtilities: successfully uninstalled app %{private}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  BOOL v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UninstallClip", "end uninstall clip", (uint8_t *)&v9, 2u);
  }
}

+ (id)poweredByCaptionForAppName:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = _CPSLocalizedString(@"Powered by %@", &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

+ (int)_deviceClass
{
  if (_deviceClass_onceToken != -1) {
    dispatch_once(&_deviceClass_onceToken, &__block_literal_global_7);
  }
  return _deviceClass_deviceClass;
}

uint64_t __28__CPSUtilities__deviceClass__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _deviceClass_deviceClass = result;
  return result;
}

+ (id)localizedDeviceName
{
  if (localizedDeviceName_onceToken != -1) {
    dispatch_once(&localizedDeviceName_onceToken, &__block_literal_global_16_0);
  }
  v2 = (void *)localizedDeviceName_localizedDeviceName;

  return v2;
}

uint64_t __35__CPSUtilities_localizedDeviceName__block_invoke()
{
  localizedDeviceName_localizedDeviceName = MGGetStringAnswer();

  return MEMORY[0x270F9A758]();
}

+ (id)lowercasedDeviceFamilyName
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CPSUtilities_lowercasedDeviceFamilyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lowercasedDeviceFamilyName_onceToken != -1) {
    dispatch_once(&lowercasedDeviceFamilyName_onceToken, block);
  }
  v2 = (void *)lowercasedDeviceFamilyName_lowercasedDeviceFamilyName;

  return v2;
}

void __42__CPSUtilities_lowercasedDeviceFamilyName__block_invoke()
{
  int v0 = [(id)objc_opt_class() _deviceClass];
  if (v0 == 1)
  {
    v1 = @"iphone";
  }
  else
  {
    if (v0 != 3) {
      return;
    }
    v1 = @"ipad";
  }
  v2 = (void *)lowercasedDeviceFamilyName_lowercasedDeviceFamilyName;
  lowercasedDeviceFamilyName_lowercasedDeviceFamilyName = (uint64_t)v1;
}

+ (id)oppositeDeviceFamilyName
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CPSUtilities_oppositeDeviceFamilyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (oppositeDeviceFamilyName_onceToken != -1) {
    dispatch_once(&oppositeDeviceFamilyName_onceToken, block);
  }
  v2 = (void *)oppositeDeviceFamilyName_oppositeDeviceFamilyName;

  return v2;
}

void __40__CPSUtilities_oppositeDeviceFamilyName__block_invoke()
{
  int v0 = [(id)objc_opt_class() _deviceClass];
  if (v0 == 1)
  {
    v1 = @"iPad";
  }
  else
  {
    if (v0 != 3) {
      return;
    }
    v1 = @"iPhone";
  }
  v2 = (void *)oppositeDeviceFamilyName_oppositeDeviceFamilyName;
  oppositeDeviceFamilyName_oppositeDeviceFamilyName = (uint64_t)v1;
}

+ (BOOL)deviceIsPad
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__CPSUtilities_deviceIsPad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceIsPad_onceToken != -1) {
    dispatch_once(&deviceIsPad_onceToken, block);
  }
  return deviceIsPad_isPad;
}

uint64_t __27__CPSUtilities_deviceIsPad__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deviceClass];
  deviceIsPad_isPad = result == 3;
  return result;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1) {
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_33);
  }
  return deviceHasHomeButton_hasHomeButton;
}

uint64_t __35__CPSUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceHasHomeButton_hasHomeButton = result != 2;
  return result;
}

+ (BOOL)deviceIsLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

+ (BOOL)shouldPlayHaptics
{
  if (shouldPlayHaptics_onceToken != -1) {
    dispatch_once(&shouldPlayHaptics_onceToken, &__block_literal_global_38);
  }
  if (!shouldPlayHaptics_supportsHaptics) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"effects-haptic", @"com.apple.preferences.sounds", &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
}

uint64_t __33__CPSUtilities_shouldPlayHaptics__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  shouldPlayHaptics_supportsHaptics = result;
  return result;
}

+ (BOOL)isBundleIdentifierBeingInstalled:(id)a3
{
  id v3 = [MEMORY[0x263F4BE78] existingCoordinatorForAppWithBundleID:a3 error:0];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isNetworkConstrained
{
  v2 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  id v3 = [v2 path];
  char v4 = [v3 isConstrained];

  return v4;
}

+ (BOOL)deviceHasCapabilities:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    char v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_51);

    id v5 = (void *)MGCopyMultipleAnswers();
    uint64_t v6 = objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_55);
    uint64_t v7 = [v6 count];
    BOOL v8 = v7 == [v4 count];
    if (!v8)
    {
      int v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "CPSUtilities: app clip requires capabilities that is not supported by this device [ %@].", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    BOOL v8 = 1;
    char v4 = v3;
  }

  return v8;
}

uint64_t __38__CPSUtilities_deviceHasCapabilities___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF9D0];
  id v3 = a2;
  char v4 = [v2 null];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

id __38__CPSUtilities_deviceHasCapabilities___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 BOOLValue]) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (BOOL)appClipAssociatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4
{
  return [a1 _associatedDomainIsApprovedForURL:a3 applicationIdentifier:a4 serviceType:*MEMORY[0x263F6BD88]];
}

+ (BOOL)validDomainAssociationWithAnyServiceTypeForURL:(id)a3 applicationIdentifier:(id)a4
{
  return [a1 _associatedDomainIsApprovedForURL:a3 applicationIdentifier:a4 serviceType:0];
}

+ (BOOL)_associatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4 serviceType:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (a3)
  {
    int v9 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:1];
    uint64_t v10 = [v9 host];
    if (v10)
    {
      int v11 = (void *)[objc_alloc(MEMORY[0x263F6BD78]) initWithServiceType:v8 applicationIdentifier:v7 domain:0];
      [MEMORY[0x263F6BD70] serviceDetailsWithServiceSpecifier:v11 error:0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        v20 = v11;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v16 isApproved])
            {
              v17 = [v16 serviceSpecifier];
              char v18 = [v17 domainEncompassesDomain:v10];

              if (v18)
              {
                LOBYTE(v13) = 1;
                goto LABEL_16;
              }
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            continue;
          }
          break;
        }
LABEL_16:
        int v11 = v20;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

+ (id)productVariants
{
  if (productVariants_onceToken != -1) {
    dispatch_once(&productVariants_onceToken, &__block_literal_global_60);
  }
  v2 = (void *)productVariants_productVariants;

  return v2;
}

uint64_t __31__CPSUtilities_productVariants__block_invoke()
{
  productVariants_productVariants = MGCopyAnswer();

  return MEMORY[0x270F9A758]();
}

+ (id)osVersion
{
  if (osVersion_onceToken != -1) {
    dispatch_once(&osVersion_onceToken, &__block_literal_global_65);
  }
  v2 = (void *)osVersion_productVersion;

  return v2;
}

uint64_t __25__CPSUtilities_osVersion__block_invoke()
{
  osVersion_productVersion = MGCopyAnswer();

  return MEMORY[0x270F9A758]();
}

+ (void)openURL:inAppWithBundleIdentifier:promptForUnlock:originIsControlCenter:completionHandler:.cold.1()
{
  int v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getCCUIAppLaunchOriginControlCenter(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSUtilities.m", 26, @"%s", dlerror());

  __break(1u);
}

+ (void)uninstallAppWithBundleIdentifier:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "CPSUtilities: Not an app clip (%{private}@). Skipping deletion.", (uint8_t *)&v2, 0xCu);
}

void __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v7 = 138478083;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_21559C000, v5, OS_LOG_TYPE_ERROR, "CPSUtilities: Error in uninstalling app %{private}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end