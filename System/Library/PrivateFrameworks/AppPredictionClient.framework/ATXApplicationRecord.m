@interface ATXApplicationRecord
+ (BOOL)isAppClipForBundleId:(id)a3;
+ (BOOL)isAppClipGivenAppRecord:(id)a3;
+ (BOOL)isAppClipWebClipBundleId:(id)a3;
+ (BOOL)isArcadeAppForBundle:(id)a3;
+ (BOOL)isBackgroundAudioSupportedForBundle:(id)a3;
+ (BOOL)isBetaAppForBundle:(id)a3;
+ (BOOL)isDeviceManagementPolicyOkForBundleId:(id)a3;
+ (BOOL)isEnterpriseAppForBundle:(id)a3;
+ (BOOL)isHiddenFromSpringBoardWithBundleId:(id)a3;
+ (BOOL)isInstalledAndNotRestrictedForBundle:(id)a3;
+ (BOOL)isInstalledForBundle:(id)a3;
+ (BOOL)isInstalledOrIsPlaceholderForBundle:(id)a3;
+ (BOOL)isInstallingForBundle:(id)a3;
+ (BOOL)isInternalAppForBundleId:(id)a3;
+ (BOOL)isInternalOrSystemAppForBundleId:(id)a3;
+ (BOOL)isLaunchProhibitedForBundle:(id)a3;
+ (BOOL)isOffloadedForBundle:(id)a3;
+ (BOOL)isRestoreInstallTypeForBundle:(id)a3;
+ (BOOL)isSwiftPlaygroundsBundle:(id)a3;
+ (BOOL)isSystemAppForBundleId:(id)a3;
+ (BOOL)isUPPValidatedForBundle:(id)a3;
+ (BOOL)isWebClipInstalledWithBundleId:(id)a3;
+ (id)appInfoForBundle:(id)a3;
+ (id)bundleIdForAdamIdIfInstalled:(unint64_t)a3;
+ (id)companionBundleIdForBundleId:(id)a3;
+ (id)genreForBundle:(id)a3;
+ (id)localizedNameForBundle:(id)a3;
+ (id)localizedShortnameForBundle:(id)a3;
+ (id)parentAppBundleIdForClipBundleID:(id)a3;
+ (id)recordForAdamId:(unint64_t)a3;
+ (id)recordForBundleId:(id)a3;
+ (id)registrationDateForBundle:(id)a3;
+ (id)schemaWithoutFallbackForBundle:(id)a3;
+ (unint64_t)genreIdForBundle:(id)a3;
+ (void)getDeviceManagementPolicyForBundle:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXApplicationRecord

+ (BOOL)isAppClipForBundleId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v9 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];
  if (v9) {
    char v7 = 0;
  }
  else {
    char v7 = [a1 isAppClipGivenAppRecord:v6];
  }

  return v7;
}

+ (BOOL)isOffloadedForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 applicationState];
  if ([v7 isDowngraded]) {
    char v8 = [v7 isPlaceholder];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (id)recordForBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v9 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    char v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXApplicationRecord recordForBundleId:]();
    }
LABEL_4:

    goto LABEL_6;
  }
  if (!v5)
  {
    char v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXApplicationRecord recordForBundleId:]((uint64_t)v3, v7);
    }
    goto LABEL_4;
  }
LABEL_6:

  return v5;
}

+ (BOOL)isAppClipGivenAppRecord:(id)a3
{
  id v3 = [a3 appClipMetadata];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)companionBundleIdForBundleId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  char v7 = v6;
  if (v6)
  {
    char v8 = [v6 counterpartIdentifiers];
    id v9 = (id)[v8 count];

    if (v9)
    {
      v10 = [v7 counterpartIdentifiers];
      v11 = [v10 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v11;
      }
      else
      {
        v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[ATXApplicationRecord companionBundleIdForBundleId:]();
        }

        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)isInstalledAndNotRestrictedForBundle:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  if ([a1 isAppClipWebClipBundleId:v4])
  {
    char v6 = [a1 isWebClipInstalledWithBundleId:v4];
  }
  else if ([v4 isEqualToString:@"com.apple.Health"] {
         && [MEMORY[0x1E4F93B08] isiPad]
  }
         && ([MEMORY[0x1E4F28F80] processInfo], (char v7 = objc_claimAutoreleasedReturnValue()) != 0)
         && (char v8 = v7, [v7 operatingSystemVersion], v8, v16 == 16))
  {
    char v6 = 0;
  }
  else
  {
    id v9 = [a1 recordForBundleId:v4];
    v10 = [v9 applicationState];
    int v11 = [v10 isInstalled];
    int v12 = [v10 isRestricted];
    char v6 = v11 & (v12 ^ 1);
    if ((v6 & 1) == 0)
    {
      int v13 = v12;
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v18 = v4;
        __int16 v19 = 1024;
        int v20 = v11;
        __int16 v21 = 1024;
        int v22 = v13;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXApplicationRecord for app: %@ installed: %{BOOL}d restricted: %{BOOL}d", buf, 0x18u);
      }
    }
  }

  return v6;
}

+ (BOOL)isHiddenFromSpringBoardWithBundleId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = v6;
  if (v6)
  {
    char v8 = [v6 appTags];
    char v9 = [v8 containsObject:@"hidden"];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isWebClipInstalledWithBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1AD0D3C30]();
  v5 = [v3 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F59090] withString:&stru_1EFD9B408];
  char v6 = [MEMORY[0x1E4F59138] sharedStore];
  char v7 = [v6 synchronouslyGetAppClipWithIdentifier:v5];

  if (v7 && [v7 isApplicationInstalled])
  {
    char v8 = [v7 title];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isInstalledOrIsPlaceholderForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 applicationState];
  if ([v7 isInstalled]) {
    char v8 = 1;
  }
  else {
    char v8 = [v7 isPlaceholder];
  }

  return v8;
}

+ (BOOL)isInstallingForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 applicationState];
  if ([v7 isDowngraded]) {
    char v8 = 0;
  }
  else {
    char v8 = [v7 isPlaceholder];
  }

  return v8;
}

+ (BOOL)isInstalledForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 applicationState];
  char v8 = [v7 isInstalled];

  return v8;
}

+ (id)localizedShortnameForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 localizedShortName];

  return v7;
}

+ (id)localizedNameForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 localizedName];

  return v7;
}

+ (BOOL)isLaunchProhibitedForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 isLaunchProhibited];

  return v7;
}

+ (BOOL)isArcadeAppForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 isArcadeApp];

  return v7;
}

+ (BOOL)isBackgroundAudioSupportedForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 UIBackgroundModes];
  char v8 = [v7 containsObject:@"audio"];

  return v8;
}

+ (BOOL)isEnterpriseAppForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 isProfileValidated];

  return v7;
}

+ (BOOL)isUPPValidatedForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 isUPPValidated];

  return v7;
}

+ (BOOL)isBetaAppForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 isBeta];

  return v7;
}

+ (id)genreForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 iTunesMetadata];
  char v8 = [v7 genre];

  return v8;
}

+ (unint64_t)genreIdForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 iTunesMetadata];
  unint64_t v8 = [v7 genreIdentifier];

  return v8;
}

+ (id)registrationDateForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  char v7 = [v6 registrationDate];

  return v7;
}

+ (BOOL)isRestoreInstallTypeForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  char v6 = [a1 recordForBundleId:v4];
  BOOL v7 = [v6 installType] == 2;

  return v7;
}

+ (void)getDeviceManagementPolicyForBundle:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1AD0D3C30]();
  unint64_t v8 = [a1 recordForBundleId:v9];
  [v8 getDeviceManagementPolicyWithCompletionHandler:v6];
}

+ (id)appInfoForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)schemaWithoutFallbackForBundle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F30688] schemaWithBundleRecord:v6 fallbackToSystemSchema:0];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)recordForAdamId:(unint64_t)a3
{
  id v4 = (void *)MEMORY[0x1AD0D3C30](a1, a2);
  id v9 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithStoreItemIdentifier:a3 error:&v9];
  id v6 = v9;
  if (v6)
  {
    BOOL v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXApplicationRecord recordForAdamId:v7];
    }
  }

  return v5;
}

+ (id)bundleIdForAdamIdIfInstalled:(unint64_t)a3
{
  v5 = (void *)MEMORY[0x1AD0D3C30](a1, a2);
  id v6 = [a1 recordForAdamId:a3];
  BOOL v7 = [v6 applicationState];
  if ([v7 isInstalled] && (objc_msgSend(v7, "isRestricted") & 1) == 0)
  {
    unint64_t v8 = [v6 bundleIdentifier];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)isAppClipWebClipBundleId:(id)a3
{
  return [a3 hasPrefix:*MEMORY[0x1E4F59090]];
}

+ (id)parentAppBundleIdForClipBundleID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v19 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v19];
  id v7 = v19;
  if (v7)
  {
    unint64_t v8 = __atxlog_handle_hero();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_INFO, "Could not get LSApplicationRecord inside parentAppBundleIdForClipBundleID. Error: %@", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_5;
  }
  if (v6)
  {
    unint64_t v8 = [v6 entitlements];
    int v12 = [a1 isAppClipGivenAppRecord:v6];
    uint64_t v13 = objc_opt_class();
    v14 = [v8 objectForKey:@"com.apple.developer.parent-application-identifiers" ofClass:v13 valuesOfClass:objc_opt_class()];
    id v9 = v14;
    if (v12)
    {
      if ([v14 count])
      {
        v15 = [v9 firstObject];
        uint64_t v16 = [v15 rangeOfString:@"."];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = [v9 firstObject];
          v10 = [v17 substringFromIndex:v16 + 1];

          id v18 = __atxlog_handle_hero();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v4;
            __int16 v22 = 2112;
            uint64_t v23 = v9;
            _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "CLIP app %@ parentAppIDs: %@", buf, 0x16u);
          }

          goto LABEL_6;
        }
      }
    }
LABEL_5:
    v10 = 0;
LABEL_6:

    goto LABEL_7;
  }
  id v9 = 0;
  v10 = 0;
LABEL_7:

  return v10;
}

+ (BOOL)isSwiftPlaygroundsBundle:(id)a3
{
  id v3 = [a1 recordForBundleId:a3];
  char v4 = [v3 isSwiftPlaygroundsApp];

  return v4;
}

+ (BOOL)isSystemAppForBundleId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 compatibilityObject];
    id v9 = [v8 applicationType];
    char v10 = [v9 isEqualToString:@"System"];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)isInternalAppForBundleId:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 compatibilityObject];
    id v9 = [v8 applicationType];
    char v10 = [v9 isEqualToString:@"Internal"];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)isInternalOrSystemAppForBundleId:(id)a3
{
  id v4 = a3;
  if ([a1 isInternalAppForBundleId:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isSystemAppForBundleId:v4];
  }

  return v5;
}

+ (BOOL)isDeviceManagementPolicyOkForBundleId:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = [a1 recordForBundleId:v4];
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 compatibilityObject];
    BOOL v9 = [v8 deviceManagementPolicy] == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (void)recordForBundleId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Fetched nil record for bundle %@", (uint8_t *)&v2, 0xCu);
}

+ (void)recordForBundleId:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Couldn't fetch record for bundle %@, error: %@", v1, 0x16u);
}

+ (void)companionBundleIdForBundleId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A790D000, v0, OS_LOG_TYPE_FAULT, "first counterpart identifier (%@) was not a string for bundle id: %@", v1, 0x16u);
}

+ (void)recordForAdamId:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = [NSNumber numberWithUnsignedInteger:a1];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "Couldn't fetch record for adam id %@, error: %@", (uint8_t *)&v6, 0x16u);
}

@end