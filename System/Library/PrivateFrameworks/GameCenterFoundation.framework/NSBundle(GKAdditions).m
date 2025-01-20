@interface NSBundle(GKAdditions)
+ (id)_gkPreferredSystemLanguage;
+ (id)_gkPreferredUserLanguage;
+ (uint64_t)_gkBundleIdentifierIsAnyOverlayUI:()GKAdditions;
+ (uint64_t)_gkBundleIdentifierIsRelatedToContactsUI:()GKAdditions;
+ (uint64_t)_gkMainBundleIsGameCenterSystemProcess;
- (BOOL)_gkIsEligibleForNearbyAdvertising;
- (id)_gkBundleShortVersion;
- (id)_gkBundleVersion;
- (id)_gkLocalizedName;
- (id)_gkLocalizedStringForKey:()GKAdditions defaultValue:arguments:;
- (id)_gkPathForSoundWithName:()GKAdditions;
- (id)_gkSystemLocalizedStringForKey:()GKAdditions value:table:;
- (uint64_t)_gkIsAnyOverlayUI;
- (uint64_t)_gkIsContacts;
- (uint64_t)_gkIsEligibleForOnboardingUI;
- (uint64_t)_gkIsGameCenter;
- (uint64_t)_gkIsGameCenterExtension;
- (uint64_t)_gkIsGameDaemon;
- (uint64_t)_gkIsKnownFirstParty;
- (uint64_t)_gkIsPreferences;
- (uint64_t)_gkIsPurpleBuddy;
- (uint64_t)_gkPathForChallengeSound;
- (uint64_t)_gkPathForImageWithName:()GKAdditions;
- (uint64_t)_gkPathForInviteSound;
- (uint64_t)_gkPathForMessageImage;
- (void)_gkIsEligibleForNearbyAdvertising;
@end

@implementation NSBundle(GKAdditions)

- (uint64_t)_gkIsKnownFirstParty
{
  if (_gkIsKnownFirstParty_onceToken != -1) {
    dispatch_once(&_gkIsKnownFirstParty_onceToken, &__block_literal_global_46);
  }
  if ([a1 _gkIsContacts] & 1) != 0 || (objc_msgSend(a1, "_gkIsAnyOverlayUI")) {
    return 1;
  }
  v3 = (void *)_gkIsKnownFirstParty_firstPartySetIdentifiers;
  v4 = [a1 bundleIdentifier];
  if ([v3 containsObject:v4])
  {
    uint64_t v2 = 1;
  }
  else
  {
    v5 = [a1 bundleIdentifier];
    v6 = [v5 _gkSHA256Hash];
    if ([v6 isEqualToString:@"t/IRG+OATWH+smiJ2A4GRp6fHjSftOF5bYwT7kv+1Mk="])
    {
      uint64_t v2 = 1;
    }
    else
    {
      v7 = [a1 bundleIdentifier];
      v8 = [v7 _gkSHA256Hash];
      uint64_t v2 = [v8 isEqualToString:@"BKN3YPrkowJshOfzYN9kxtu/zEFYrAWOeXV3rzu9h1k="];
    }
  }

  return v2;
}

- (uint64_t)_gkIsGameDaemon
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.gamed"];

  return v2;
}

- (uint64_t)_gkIsGameCenter
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.gamecenter"];

  return v2;
}

- (uint64_t)_gkIsGameCenterExtension
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = @"com.apple.GameCenterUI.GameCenterDashboardExtension";
  v8[1] = @"com.apple.GameCenterUI.GameCenterMatchmakerExtension";
  v8[2] = @"com.apple.GameCenterUI.GameCenterTurnBasedMatchmakerExtension";
  v8[3] = @"com.apple.GameCenterUI.GameCenterChallengeIssueExtension";
  v8[4] = @"com.apple.GameCenterUI.GameCenterFriendRequestExtension";
  v8[5] = @"com.apple.GameCenterUI.GameCenterAuthenticateExtension";
  v8[6] = @"com.apple.gamecenter.GameCenterUIService";
  v8[7] = @"com.apple.gamecenter.GameCenterUIService.GameCenterMessageExtension";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  v4 = [v2 setWithArray:v3];

  v5 = [a1 bundleIdentifier];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

- (uint64_t)_gkIsPreferences
{
  v1 = [a1 bundleIdentifier];
  if (([v1 isEqualToString:@"com.apple.Preferences"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.preferences.internetaccounts.remoteservice"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.Game-Center-Settings.extension"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.GameCenterUI.GameCenterHostingContainer"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.TVSettings"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.gamecenterctl"];
  }

  return v2;
}

- (uint64_t)_gkIsContacts
{
  v1 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v2 = [a1 bundleIdentifier];
  uint64_t v3 = [v1 _gkBundleIdentifierIsRelatedToContactsUI:v2];

  return v3;
}

+ (uint64_t)_gkMainBundleIsGameCenterSystemProcess
{
  if (_gkMainBundleIsGameCenterSystemProcess_onceToken != -1) {
    dispatch_once(&_gkMainBundleIsGameCenterSystemProcess_onceToken, &__block_literal_global_56);
  }
  return _gkMainBundleIsGameCenterSystemProcess_isGameCenterSystemProcess;
}

+ (uint64_t)_gkBundleIdentifierIsRelatedToContactsUI:()GKAdditions
{
  uint64_t v3 = _gkBundleIdentifierIsRelatedToContactsUI__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_gkBundleIdentifierIsRelatedToContactsUI__onceToken, &__block_literal_global_54);
  }
  uint64_t v5 = [(id)_gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers containsObject:v4];

  return v5;
}

+ (id)_gkPreferredSystemLanguage
{
  v0 = GKGameCenterUIFrameworkBundle();
  v1 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v2 = [v0 localizations];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v4 = [v1 preferredLocalizationsFromArray:v2 forPreferences:v3];

  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v5];

  return v6;
}

- (id)_gkPathForSoundWithName:()GKAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 pathForResource:v4 ofType:@"caf"];
  if (!v5)
  {
    uint64_t v5 = [a1 pathForResource:v4 ofType:@"aif"];
    if (!v5)
    {
      uint64_t v5 = [a1 pathForResource:v4 ofType:@"wav"];
    }
  }

  return v5;
}

- (uint64_t)_gkPathForImageWithName:()GKAdditions
{
  return [a1 pathForResource:a3 ofType:@"png"];
}

- (uint64_t)_gkPathForMessageImage
{
  return [a1 _gkPathForImageWithName:@"GKMessageImage"];
}

- (uint64_t)_gkPathForInviteSound
{
  return [a1 _gkPathForSoundWithName:@"GKInvite"];
}

- (uint64_t)_gkPathForChallengeSound
{
  return [a1 _gkPathForSoundWithName:@"GKChallenge"];
}

- (id)_gkBundleVersion
{
  v1 = [a1 infoDictionary];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x1E4F1D020]];

  return v2;
}

- (id)_gkBundleShortVersion
{
  v1 = [a1 infoDictionary];
  uint64_t v2 = [v1 objectForKey:@"CFBundleShortVersionString"];

  return v2;
}

- (id)_gkLocalizedName
{
  uint64_t v2 = [a1 infoDictionary];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1CC48]];
  if (!v3)
  {
    uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1D008]];
  }
  id v4 = GKGetLocalizedStringFromTableInBundle((uint64_t)v3, @"InfoPlist", a1);

  return v4;
}

+ (id)_gkPreferredUserLanguage
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v1 = [a1 _gkPreferredSystemLanguage];
  unint64_t v2 = 0x1E4F1C000uLL;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v1];
  id v4 = [v3 countryCode];

  if (!v4)
  {
    v18 = v1;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = (void *)[objc_alloc(*(Class *)(v2 + 2592)) initWithLocaleIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          uint64_t v11 = [v10 countryCode];
          if (v11)
          {
            v12 = (void *)v11;
            [v3 languageCode];
            v14 = unint64_t v13 = v2;
            v15 = [v10 languageCode];
            char v16 = [v14 isEqualToString:v15];

            unint64_t v2 = v13;
            if (v16)
            {
              id v5 = [v10 localeIdentifier];

              v1 = v18;
              goto LABEL_14;
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v1 = v18;
  }
  id v5 = v1;
LABEL_14:

  return v5;
}

- (id)_gkSystemLocalizedStringForKey:()GKAdditions value:table:
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  id v8 = a5;
  v9 = GKGameCenterUIFrameworkBundle();
  v63[0] = v9;
  v10 = GKGameCenterFoundationBundle();
  v63[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];

  if (!_gkSystemLocalizedStringForKey_value_table____localizationLookup)
  {
    id obj = v7;
    v12 = GKGameCenterUIFrameworkBundle();
    unint64_t v13 = [v12 localizations];

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          long long v21 = objc_msgSend(MEMORY[0x1E4F1CA20], "canonicalLanguageIdentifierFromString:", v20, obj, v47);
          if (v21) {
            [v14 setObject:v20 forKey:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v17);
    }

    long long v22 = (void *)_gkSystemLocalizedStringForKey_value_table____localizationLookup;
    _gkSystemLocalizedStringForKey_value_table____localizationLookup = (uint64_t)v14;

    id v7 = obj;
  }
  id v23 = v7;
  v24 = [MEMORY[0x1E4F28B50] _gkPreferredSystemLanguage];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v25 = v11;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v61 count:16];
  v27 = v23;
  id obja = v25;
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v53;
    v27 = v23;
    while (2)
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(obja);
        }
        v31 = *(void **)(*((void *)&v52 + 1) + 8 * v30);
        v32 = __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(v26, v31, v23, v47, v8, v24);

        if ([v32 isEqualToString:v23])
        {
          v33 = [(id)_gkSystemLocalizedStringForKey_value_table____localizationLookup objectForKey:v24];
          v34 = v33;
          if (v33)
          {
            uint64_t v35 = __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2((uint64_t)v33, v31, v23, v47, v8, v33);

            v32 = (void *)v35;
          }
        }
        if (objc_msgSend(v32, "isEqualToString:", v23, obja)
          && (uint64_t v36 = [v24 rangeOfString:@"-" options:4], v36 != 0x7FFFFFFFFFFFFFFFLL))
        {
          v37 = [v24 substringToIndex:v36];
          v27 = __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2((uint64_t)v37, v31, v23, v47, v8, v37);
        }
        else
        {
          v27 = v32;
        }
        uint64_t v26 = [v27 isEqualToString:v23];
        if (!v26)
        {
          id v25 = obja;
          goto LABEL_30;
        }
        ++v30;
      }
      while (v28 != v30);
      id v25 = obja;
      uint64_t v26 = [obja countByEnumeratingWithState:&v52 objects:v61 count:16];
      uint64_t v28 = v26;
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_30:

  if ([v27 isEqualToString:v23])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v38 = v25;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v49;
LABEL_33:
      uint64_t v42 = 0;
      v43 = v27;
      while (1)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v38);
        }
        v27 = __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(v39, *(void **)(*((void *)&v48 + 1) + 8 * v42), v23, v47, v8, @"en");

        uint64_t v39 = [v27 isEqualToString:v23];
        if (!v39) {
          break;
        }
        ++v42;
        v43 = v27;
        if (v40 == v42)
        {
          uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v60 count:16];
          uint64_t v40 = v39;
          if (v39) {
            goto LABEL_33;
          }
          break;
        }
      }
    }

    id v25 = obja;
  }

  return v27;
}

- (id)_gkLocalizedStringForKey:()GKAdditions defaultValue:arguments:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v10 = 0;
  }
  uint64_t v11 = [a1 _gkSystemLocalizedStringForKey:v8 value:v8 table:0];
  v12 = v11;
  if (v11 && [v11 length])
  {
    GKFormatNetworkStringWithArguments(v12, v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v14 = v13;
    goto LABEL_18;
  }
  if (v9 && [v9 length])
  {
    id v13 = v9;
    goto LABEL_16;
  }
  if (v8 && [v8 length])
  {
    id v13 = v8;
    goto LABEL_16;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (uint64_t)_gkIsPurpleBuddy
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.purplebuddy"];

  return v2;
}

- (uint64_t)_gkIsEligibleForOnboardingUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NSBundle_GKAdditions___gkIsEligibleForOnboardingUI__block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = a1;
  if (_gkIsEligibleForOnboardingUI_onceToken != -1) {
    dispatch_once(&_gkIsEligibleForOnboardingUI_onceToken, block);
  }
  return _gkIsEligibleForOnboardingUI_isEligible;
}

- (BOOL)_gkIsEligibleForNearbyAdvertising
{
  if ([a1 _gkIsKnownFirstParty])
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    uint64_t v3 = (void *)os_log_GKMatch;
    BOOL result = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      [(NSBundle(GKAdditions) *)v3 _gkIsEligibleForNearbyAdvertising];
      return 0;
    }
  }
  else if ([a1 _gkIsPreferences])
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    uint64_t v6 = (void *)os_log_GKMatch;
    BOOL result = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      [(NSBundle(GKAdditions) *)v6 _gkIsEligibleForNearbyAdvertising];
      return 0;
    }
  }
  else if ([a1 _gkIsGameCenter])
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = (void *)os_log_GKMatch;
    BOOL result = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      [(NSBundle(GKAdditions) *)v8 _gkIsEligibleForNearbyAdvertising];
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return result;
}

+ (uint64_t)_gkBundleIdentifierIsAnyOverlayUI:()GKAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.GameOverlayUI"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:@"com.apple.GameOverlayUIInternal"];
  }

  return v4;
}

- (uint64_t)_gkIsAnyOverlayUI
{
  v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = [a1 bundleIdentifier];
  uint64_t v3 = [v1 _gkBundleIdentifierIsAnyOverlayUI:v2];

  return v3;
}

- (void)_gkIsEligibleForNearbyAdvertising
{
  id v3 = a1;
  uint64_t v4 = [a2 bundleIdentifier];
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v5, v6, "[%@]Game Center is not eligible for nearby.", v7, v8, v9, v10, 2u);
}

@end