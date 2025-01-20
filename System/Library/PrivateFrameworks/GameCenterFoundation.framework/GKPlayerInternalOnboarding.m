@interface GKPlayerInternalOnboarding
+ (BOOL)supportsSecureCoding;
+ (unint64_t)currentContentVersion;
- (BOOL)hasAcknowledgedLatestGDPR;
- (BOOL)shouldShowAnyOnboardingScreenForBundleIdentifier:(id)a3 IsUsingDefaultNickname:(BOOL)a4 isUsingDefaultPrivacyVisibility:(BOOL)a5 isUsingDefaultContactsIntegrationConsent:(BOOL)a6;
- (BOOL)shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:(BOOL)a3;
- (BOOL)shouldShowFriendSuggestionsScreen;
- (BOOL)shouldShowPersonalizationScreenIsUsingDefaultNickname:(BOOL)a3;
- (GKPlayerInternalOnboarding)initWithCoder:(id)a3;
- (GKPlayerInternalOnboarding)initWithLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3 lastPrivacyNoticeVersionDisplayed:(unint64_t)a4 lastPersonalizationVersionDisplayed:(id)a5 lastProfilePrivacyVersionDisplayed:(id)a6 lastFriendSuggestionsVersionDisplayed:(id)a7 lastContactsIntegrationConsentVersionDisplayed:(id)a8;
- (NSString)lastContactsIntegrationConsentVersionDisplayed;
- (NSString)lastFriendSuggestionsVersionDisplayed;
- (NSString)lastPersonalizationVersionDisplayed;
- (NSString)lastProfilePrivacyVersionDisplayed;
- (id)description;
- (unint64_t)lastPrivacyNoticeVersionDisplayed;
- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GKPlayerInternalOnboarding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);

  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
}

- (GKPlayerInternalOnboarding)initWithLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3 lastPrivacyNoticeVersionDisplayed:(unint64_t)a4 lastPersonalizationVersionDisplayed:(id)a5 lastProfilePrivacyVersionDisplayed:(id)a6 lastFriendSuggestionsVersionDisplayed:(id)a7 lastContactsIntegrationConsentVersionDisplayed:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)GKPlayerInternalOnboarding;
  v18 = [(GKPlayerInternalOnboarding *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_lastWelcomeWhatsNewCopyVersionDisplayed = a3;
    v18->_lastPrivacyNoticeVersionDisplayed = a4;
    objc_storeStrong((id *)&v18->_lastPersonalizationVersionDisplayed, a5);
    objc_storeStrong((id *)&v19->_lastProfilePrivacyVersionDisplayed, a6);
    objc_storeStrong((id *)&v19->_lastFriendSuggestionsVersionDisplayed, a7);
    objc_storeStrong((id *)&v19->_lastContactsIntegrationConsentVersionDisplayed, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  [v5 encodeObject:v6 forKey:@"lastWelcomeWhatsNewCopyVersionDisplayed"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed"));
  [v5 encodeObject:v7 forKey:@"lastPrivacyNoticeVersionDisplayed"];

  v8 = [(GKPlayerInternalOnboarding *)self lastPersonalizationVersionDisplayed];
  [v5 encodeObject:v8 forKey:@"lastPersonalizationVersionDisplayed"];

  v9 = [(GKPlayerInternalOnboarding *)self lastProfilePrivacyVersionDisplayed];
  [v5 encodeObject:v9 forKey:@"lastProfilePrivacyVersionDisplayed"];

  v10 = [(GKPlayerInternalOnboarding *)self lastFriendSuggestionsVersionDisplayed];
  [v5 encodeObject:v10 forKey:@"lastFriendSuggestionsVersionDisplayed"];

  id v11 = [(GKPlayerInternalOnboarding *)self lastContactsIntegrationConsentVersionDisplayed];
  [v5 encodeObject:v11 forKey:@"lastContactsIntegrationConsentVersionDisplayed"];
}

- (GKPlayerInternalOnboarding)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKPlayerInternalOnboarding;
  id v5 = [(GKPlayerInternalOnboarding *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastWelcomeWhatsNewCopyVersionDisplayed"];
    v5->_lastWelcomeWhatsNewCopyVersionDisplayed = [v6 unsignedIntValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastPrivacyNoticeVersionDisplayed"];
    v5->_lastPrivacyNoticeVersionDisplayed = [v7 unsignedIntValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastPersonalizationVersionDisplayed"];
    lastPersonalizationVersionDisplayed = v5->_lastPersonalizationVersionDisplayed;
    v5->_lastPersonalizationVersionDisplayed = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastProfilePrivacyVersionDisplayed"];
    lastProfilePrivacyVersionDisplayed = v5->_lastProfilePrivacyVersionDisplayed;
    v5->_lastProfilePrivacyVersionDisplayed = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFriendSuggestionsVersionDisplayed"];
    lastFriendSuggestionsVersionDisplayed = v5->_lastFriendSuggestionsVersionDisplayed;
    v5->_lastFriendSuggestionsVersionDisplayed = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastContactsIntegrationConsentVersionDisplayed"];
    lastContactsIntegrationConsentVersionDisplayed = v5->_lastContactsIntegrationConsentVersionDisplayed;
    v5->_lastContactsIntegrationConsentVersionDisplayed = (NSString *)v14;
  }
  return v5;
}

- (BOOL)shouldShowPersonalizationScreenIsUsingDefaultNickname:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = +[GKPreferences shared];
  if ([v5 isAccountModificationRestricted])
  {

LABEL_5:
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    uint64_t v10 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? NO -- Avatar & Nickname and Profile Privacy Changes are restricted.", (uint8_t *)&v21, 2u);
    }
LABEL_15:
    LOBYTE(v3) = 0;
    return v3;
  }
  v6 = +[GKPreferences shared];
  if ([v6 isProfileModificationRestricted])
  {
    v7 = +[GKPreferences shared];
    int v8 = [v7 isProfilePrivacyModificationRestricted];

    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v11 = [(GKPlayerInternalOnboarding *)self lastPersonalizationVersionDisplayed];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    uint64_t v14 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      id v16 = [(GKPlayerInternalOnboarding *)self lastPersonalizationVersionDisplayed];
      int v21 = 138412290;
      objc_super v22 = v16;
      _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? NO -- lastPersonalizationVersionDisplayed=%@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_15;
  }
  if (!os_log_GKGeneral) {
    id v18 = GKOSLoggers();
  }
  v19 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v20 = @"NO";
    if (v3) {
      v20 = @"YES";
    }
    int v21 = 138412290;
    objc_super v22 = v20;
    _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "shouldShowPersonalizationScreen? %@", (uint8_t *)&v21, 0xCu);
  }
  return v3;
}

- (BOOL)hasAcknowledgedLatestGDPR
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() currentContentVersion];
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v6 = NSNumber;
    v7 = v5;
    int v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed"));
    id v9 = [NSNumber numberWithUnsignedInteger:v3];
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "hasAcknowledgedLatestGDPR Local State=%@ VS OBPrivacyFlow=%@", (uint8_t *)&v11, 0x16u);
  }
  return [(GKPlayerInternalOnboarding *)self lastPrivacyNoticeVersionDisplayed] >= v3;
}

- (BOOL)shouldShowFriendSuggestionsScreen
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[GKPreferences shared];
  int v4 = [v3 isFriendRequestsRestricted];

  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    v6 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "shouldShowFriendSuggestionsScreen? NO -- Adding Friends is restricted.", (uint8_t *)&v16, 2u);
    }
    return 0;
  }
  else
  {
    int v8 = [(GKPlayerInternalOnboarding *)self lastFriendSuggestionsVersionDisplayed];
    uint64_t v9 = [v8 length];
    BOOL v7 = v9 == 0;

    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    int v11 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      if (v9) {
        uint64_t v12 = @"NO";
      }
      else {
        uint64_t v12 = @"YES";
      }
      __int16 v13 = v11;
      uint64_t v14 = [(GKPlayerInternalOnboarding *)self lastFriendSuggestionsVersionDisplayed];
      int v16 = 138412546;
      objc_super v17 = v12;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "shouldShowFriendSuggestionsScreen? %@ -- lastFriendSuggestionsVersionDisplayed=%@", (uint8_t *)&v16, 0x16u);
    }
  }
  return v7;
}

- (BOOL)shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(GKPlayerInternalOnboarding *)self lastContactsIntegrationConsentVersionDisplayed];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    int v8 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      id v10 = [(GKPlayerInternalOnboarding *)self lastContactsIntegrationConsentVersionDisplayed];
      int v15 = 138412290;
      int v16 = v10;
      _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "shouldShowContactsIntegrationConsentScreen? NO -- lastContactsIntegrationConsentVersionDisplayed=%@", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v3) = 0;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    uint64_t v12 = os_log_GKOnboarding;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = @"NO";
      if (v3) {
        __int16 v13 = @"YES";
      }
      int v15 = 138412290;
      int v16 = v13;
      _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "shouldShowContactsIntegrationConsentScreen? %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v3;
}

- (BOOL)shouldShowAnyOnboardingScreenForBundleIdentifier:(id)a3 IsUsingDefaultNickname:(BOOL)a4 isUsingDefaultPrivacyVisibility:(BOOL)a5 isUsingDefaultContactsIntegrationConsent:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!+[GKReachability _gkIsOnline])
  {
    if (!os_log_GKGeneral) {
      id v21 = GKOSLoggers();
    }
    objc_super v22 = os_log_GKOnboarding;
    if (!os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    LOWORD(v33) = 0;
    uint64_t v23 = "shouldShowAnyOnboardingScreen? NO, the player is offline";
    goto LABEL_22;
  }
  int v10 = ![(GKPlayerInternalOnboarding *)self hasAcknowledgedLatestGDPR];
  BOOL v11 = [(GKPlayerInternalOnboarding *)self shouldShowPersonalizationScreenIsUsingDefaultNickname:v7];
  BOOL v12 = [(GKPlayerInternalOnboarding *)self shouldShowFriendSuggestionsScreen];
  BOOL v13 = [(GKPlayerInternalOnboarding *)self shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:v6];
  BOOL v14 = +[GKGame isNewsApp:v9];
  int v15 = v10;
  if (!v14) {
    int v15 = v10 | v11 | (v12 || v13);
  }
  if (!os_log_GKGeneral) {
    id v16 = GKOSLoggers();
  }
  uint64_t v17 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    int v33 = 67109888;
    *(_DWORD *)v34 = v10;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v11;
    LOWORD(v35) = 1024;
    *(_DWORD *)((char *)&v35 + 2) = v12;
    HIWORD(v35) = 1024;
    v36[0] = v13;
    _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "shouldShowAnyOnboardingScreen? needConsentGDPR=%d || needPersonalization=%d || needFriendSuggestions=%d || needContactsIntegrationConsent=%d", (uint8_t *)&v33, 0x1Au);
  }
  if (v15)
  {
    if (!os_log_GKGeneral) {
      id v18 = GKOSLoggers();
    }
    v19 = os_log_GKOnboarding;
    LOBYTE(v20) = 1;
    if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "shouldShowAnyOnboardingScreen? YES (At least one of the onboarding conditions have to be completed)", (uint8_t *)&v33, 2u);
    }
    goto LABEL_24;
  }
  if (v14)
  {
    if (!os_log_GKGeneral) {
      id v24 = GKOSLoggers();
    }
    objc_super v22 = os_log_GKOnboarding;
    if (!os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    LOWORD(v33) = 0;
    uint64_t v23 = "shouldShowAnyOnboardingScreen? NO (Skipping residual onboarding flow for News.)";
LABEL_22:
    _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v33, 2u);
LABEL_23:
    LOBYTE(v20) = 0;
    goto LABEL_24;
  }
  unint64_t v26 = [(GKPlayerInternalOnboarding *)self lastWelcomeWhatsNewCopyVersionDisplayed];
  BOOL v20 = v26 < 4;
  if (!os_log_GKGeneral) {
    id v27 = GKOSLoggers();
  }
  v28 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    if (v26 >= 4) {
      v29 = @"NO";
    }
    else {
      v29 = @"YES";
    }
    v30 = NSNumber;
    v31 = v28;
    v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed"));
    int v33 = 138412802;
    *(void *)v34 = v29;
    *(_WORD *)&v34[8] = 2112;
    v35 = v32;
    LOWORD(v36[0]) = 1024;
    *(_DWORD *)((char *)v36 + 2) = 4;
    _os_log_impl(&dword_1C2D22000, v31, OS_LOG_TYPE_INFO, "shouldShowAnyOnboardingScreen? %@ (Show if the user has not seen the most recent Welcome/WhatsNew copy on this device, Seen:%@ VS Current:%d)", (uint8_t *)&v33, 0x1Cu);
  }
LABEL_24:

  return v20;
}

+ (unint64_t)currentContentVersion
{
  if (currentContentVersion_onceToken != -1) {
    dispatch_once(&currentContentVersion_onceToken, &__block_literal_global_23);
  }
  return currentContentVersion_result;
}

void __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke()
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v0 = (void *)getOBBundleClass_softClass;
  uint64_t v17 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __getOBBundleClass_block_invoke;
    BOOL v12 = &unk_1E646F430;
    BOOL v13 = &v14;
    __getOBBundleClass_block_invoke((uint64_t)&v9);
    v0 = (void *)v15[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v14, 8);
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v2 = (void *)getOBPrivacyGameCenterIdentifierSymbolLoc_ptr;
  uint64_t v17 = getOBPrivacyGameCenterIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyGameCenterIdentifierSymbolLoc_ptr)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __getOBPrivacyGameCenterIdentifierSymbolLoc_block_invoke;
    BOOL v12 = &unk_1E646F430;
    BOOL v13 = &v14;
    BOOL v3 = (void *)OnBoardingKitLibrary();
    int v4 = dlsym(v3, "OBPrivacyGameCenterIdentifier");
    *(void *)(v13[1] + 24) = v4;
    getOBPrivacyGameCenterIdentifierSymbolLoc_ptr = *(void *)(v13[1] + 24);
    v2 = (void *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2) {
    __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke_cold_1();
  }
  id v5 = [v1 bundleWithIdentifier:*v2];
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2050000000;
  BOOL v6 = (void *)getOBPrivacyFlowClass_softClass;
  uint64_t v17 = getOBPrivacyFlowClass_softClass;
  if (!getOBPrivacyFlowClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __getOBPrivacyFlowClass_block_invoke;
    BOOL v12 = &unk_1E646F430;
    BOOL v13 = &v14;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v9);
    BOOL v6 = (void *)v15[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v14, 8);
  int v8 = [v7 flowWithBundle:v5];
  currentContentVersion_result = [v8 contentVersion];
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)GKPlayerInternalOnboarding;
  BOOL v3 = [(GKPlayerInternalOnboarding *)&v12 description];
  int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastWelcomeWhatsNewCopyVersionDisplayed](self, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GKPlayerInternalOnboarding lastPrivacyNoticeVersionDisplayed](self, "lastPrivacyNoticeVersionDisplayed"));
  BOOL v6 = [(GKPlayerInternalOnboarding *)self lastPersonalizationVersionDisplayed];
  id v7 = [(GKPlayerInternalOnboarding *)self lastProfilePrivacyVersionDisplayed];
  int v8 = [(GKPlayerInternalOnboarding *)self lastFriendSuggestionsVersionDisplayed];
  uint64_t v9 = [(GKPlayerInternalOnboarding *)self lastContactsIntegrationConsentVersionDisplayed];
  uint64_t v10 = [v3 stringByAppendingFormat:@"{\n\t\tlastWelcomeWhatsNewCopyVersionDisplayed: %@\n\t\tlastPrivacyNoticeVersionDisplayed: %@\n\t\tlastPersonalizationVersionDisplayed: %@\n\t\tlastProfilePrivacyVersionDisplayed: %@\n\t\tlastFriendSuggestionsVersionDisplayed: %@\n\t\tlastContactsIntegrationConsentVersionDisplayed: %@\n}", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed
{
  return self->_lastWelcomeWhatsNewCopyVersionDisplayed;
}

- (unint64_t)lastPrivacyNoticeVersionDisplayed
{
  return self->_lastPrivacyNoticeVersionDisplayed;
}

- (NSString)lastPersonalizationVersionDisplayed
{
  return self->_lastPersonalizationVersionDisplayed;
}

- (NSString)lastProfilePrivacyVersionDisplayed
{
  return self->_lastProfilePrivacyVersionDisplayed;
}

- (NSString)lastFriendSuggestionsVersionDisplayed
{
  return self->_lastFriendSuggestionsVersionDisplayed;
}

- (NSString)lastContactsIntegrationConsentVersionDisplayed
{
  return self->_lastContactsIntegrationConsentVersionDisplayed;
}

void __51__GKPlayerInternalOnboarding_currentContentVersion__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getOBPrivacyGameCenterIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKSoftLinkedClassesFoundation.h", 29, @"%s", dlerror());

  __break(1u);
}

@end