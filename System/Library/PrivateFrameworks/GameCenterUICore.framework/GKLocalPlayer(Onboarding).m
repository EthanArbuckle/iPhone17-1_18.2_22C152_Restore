@interface GKLocalPlayer(Onboarding)
- (uint64_t)hasAcknowledgedLatestGDPR;
- (uint64_t)shouldShowAnyOnboardingScreen;
- (uint64_t)shouldShowAnyOnboardingScreenForBundleIdentifier:()Onboarding;
- (uint64_t)shouldShowContactsIntegrationConsentScreen;
- (uint64_t)shouldShowFriendSuggestionsScreen;
- (uint64_t)shouldShowPersonalizationScreen;
- (void)hasAcknowledgedLatestGDPR;
@end

@implementation GKLocalPlayer(Onboarding)

- (uint64_t)hasAcknowledgedLatestGDPR
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [a1 internal];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v4 = (void *)MEMORY[0x263F40328];
  if (isKindOfClass)
  {
    if (!*MEMORY[0x263F40328]) {
      id v5 = (id)GKOSLoggers();
    }
    v6 = *MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      -[GKLocalPlayer(Onboarding) hasAcknowledgedLatestGDPR](v6);
    }
  }
  if (!*v4) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = (void *)*MEMORY[0x263F40330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40330], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [a1 internal];
    v11 = [v10 playerID];
    int v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_22600C000, v9, OS_LOG_TYPE_INFO, "Getting GDPR state for player: %@", (uint8_t *)&v16, 0xCu);
  }
  v12 = [a1 internal];
  v13 = [v12 onboarding];
  uint64_t v14 = [v13 hasAcknowledgedLatestGDPR];

  return v14;
}

- (uint64_t)shouldShowPersonalizationScreen
{
  v2 = [a1 internal];
  v3 = [v2 onboarding];
  v4 = [a1 internal];
  uint64_t v5 = objc_msgSend(v3, "shouldShowPersonalizationScreenIsUsingDefaultNickname:", objc_msgSend(v4, "isDefaultNickname"));

  return v5;
}

- (uint64_t)shouldShowFriendSuggestionsScreen
{
  v1 = [a1 internal];
  v2 = [v1 onboarding];
  uint64_t v3 = [v2 shouldShowFriendSuggestionsScreen];

  return v3;
}

- (uint64_t)shouldShowContactsIntegrationConsentScreen
{
  v2 = [a1 internal];
  uint64_t v3 = [v2 onboarding];
  v4 = [a1 internal];
  uint64_t v5 = objc_msgSend(v3, "shouldShowContactsIntegrationConsentScreenIsUsingDefaultContactsIntegrationConsent:", objc_msgSend(v4, "isDefaultContactsIntegrationConsent"));

  return v5;
}

- (uint64_t)shouldShowAnyOnboardingScreen
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = [a1 shouldShowAnyOnboardingScreenForBundleIdentifier:v3];

  return v4;
}

- (uint64_t)shouldShowAnyOnboardingScreenForBundleIdentifier:()Onboarding
{
  id v4 = a3;
  uint64_t v5 = [a1 internal];
  v6 = [v5 onboarding];
  id v7 = [a1 internal];
  uint64_t v8 = [v7 isDefaultNickname];
  v9 = [a1 internal];
  uint64_t v10 = [v9 isDefaultPrivacyVisibility];
  v11 = [a1 internal];
  uint64_t v12 = objc_msgSend(v6, "shouldShowAnyOnboardingScreenForBundleIdentifier:IsUsingDefaultNickname:isUsingDefaultPrivacyVisibility:isUsingDefaultContactsIntegrationConsent:", v4, v8, v10, objc_msgSend(v11, "isDefaultContactsIntegrationConsent"));

  return v12;
}

- (void)hasAcknowledgedLatestGDPR
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22600C000, log, OS_LOG_TYPE_ERROR, "Attempting to get GDPR state for non-local player", v1, 2u);
}

@end