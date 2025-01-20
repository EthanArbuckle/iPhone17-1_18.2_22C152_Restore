@interface GKOnboardingController
+ (GKOnboardingController)shared;
+ (id)describePlayerComparisonsBetween:(id)a3 and:(id)a4;
- (GKOnboardingFlowDelegate)delegate;
- (NSString)gameBundleId;
- (id)landingViewControllerWithGameBundleId:(id)a3;
- (unint64_t)origin;
- (void)presentContactsIntegrationConsentScreen:(id)a3;
- (void)presentFriendSuggestionsScreen:(id)a3;
- (void)presentPersonalizationScreen:(id)a3;
- (void)presentViewController:(id)a3 presentingViewController:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGameBundleId:(id)a3;
- (void)setOrigin:(unint64_t)a3;
@end

@implementation GKOnboardingController

+ (GKOnboardingController)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)shared_sShared;

  return (GKOnboardingController *)v2;
}

uint64_t __32__GKOnboardingController_shared__block_invoke()
{
  v0 = objc_alloc_init(GKOnboardingController);
  uint64_t v1 = shared_sShared;
  shared_sShared = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)landingViewControllerWithGameBundleId:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F63760];
  id v5 = a3;
  v6 = [v4 authenticatedLocalPlayers];
  v7 = [v6 firstObject];

  v8 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v9 = (id)GKOSLoggers();
  }
  v10 = (os_log_t *)MEMORY[0x1E4F63878];
  v11 = (void *)*MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x1E4F63760];
    v13 = v11;
    v14 = [v12 local];
    v15 = +[GKOnboardingController describePlayerComparisonsBetween:v7 and:v14];
    int v25 = 138412290;
    v26 = v15;
    _os_log_impl(&dword_1AF250000, v13, OS_LOG_TYPE_INFO, "landingViewController before update -- authFirst.internal VS local.internal\n%@", (uint8_t *)&v25, 0xCu);
  }
  v16 = [MEMORY[0x1E4F63760] local];
  [v16 updateFromLocalPlayer:v7];

  if (!*v8) {
    id v17 = (id)GKOSLoggers();
  }
  os_log_t v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)MEMORY[0x1E4F63760];
    v20 = v18;
    v21 = [v19 local];
    v22 = +[GKOnboardingController describePlayerComparisonsBetween:v7 and:v21];
    int v25 = 138412290;
    v26 = v22;
    _os_log_impl(&dword_1AF250000, v20, OS_LOG_TYPE_INFO, "landingViewController after update -- authFirst.internal VS local.internal\n%@", (uint8_t *)&v25, 0xCu);
  }
  [(GKOnboardingController *)self setGameBundleId:v5];

  v23 = objc_alloc_init(GKWelcomeOnboardingViewController);

  return v23;
}

+ (id)describePlayerComparisonsBetween:(id)a3 and:(id)a4
{
  v45 = NSString;
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v56 = [v7 internal];
  v55 = [v56 onboarding];
  v61 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v55, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  v8 = NSNumber;
  v54 = [v6 internal];
  v53 = [v54 onboarding];
  v60 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v53, "lastWelcomeWhatsNewCopyVersionDisplayed"));
  id v9 = NSNumber;
  v52 = [v7 internal];
  v51 = [v52 onboarding];
  v59 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v51, "lastPrivacyNoticeVersionDisplayed"));
  v10 = NSNumber;
  v50 = [v6 internal];
  v49 = [v50 onboarding];
  v58 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v49, "lastPrivacyNoticeVersionDisplayed"));
  v48 = [v7 internal];
  unsigned int v36 = [v48 isDefaultNickname];
  v47 = [v6 internal];
  unsigned int v33 = [v47 isDefaultNickname];
  v44 = [v7 internal];
  v43 = [v44 onboarding];
  v57 = [v43 lastPersonalizationVersionDisplayed];
  v42 = [v6 internal];
  v41 = [v42 onboarding];
  v30 = [v41 lastPersonalizationVersionDisplayed];
  v40 = [v7 internal];
  unsigned int v29 = [v40 isDefaultPrivacyVisibility];
  v39 = [v6 internal];
  unsigned int v26 = [v39 isDefaultPrivacyVisibility];
  v38 = [v7 internal];
  v37 = [v38 onboarding];
  v23 = [v37 lastProfilePrivacyVersionDisplayed];
  v35 = [v6 internal];
  v34 = [v35 onboarding];
  v24 = [v34 lastProfilePrivacyVersionDisplayed];
  v32 = [v7 internal];
  unsigned int v22 = [v32 isDefaultContactsIntegrationConsent];
  v31 = [v6 internal];
  unsigned int v21 = [v31 isDefaultContactsIntegrationConsent];
  v28 = [v7 internal];
  uint64_t v27 = [v28 onboarding];
  v20 = [v27 lastContactsIntegrationConsentVersionDisplayed];
  int v25 = [v6 internal];
  v11 = [v25 onboarding];
  v12 = [v11 lastContactsIntegrationConsentVersionDisplayed];
  v13 = [v7 internal];

  v14 = [v13 onboarding];
  v15 = [v14 lastFriendSuggestionsVersionDisplayed];
  v16 = [v6 internal];

  id v17 = [v16 onboarding];
  os_log_t v18 = [v17 lastFriendSuggestionsVersionDisplayed];
  objc_msgSend(v45, "stringWithFormat:", @" WhatsNew copy version %@ VS %@\n privacy notice version %@ VS %@\n nickname: default %d VS %d | version %@ VS %@\n profile privacy: default %d VS %d | version %@ VS %@\n contacts integration: default %d VS %d | version %@ VS %@ friend suggestions: version %@ VS %@", v61, v60, v59, v58, v36, v33, v57, v30, v29, v26, v23, v24, v22, v21, v20, v12,
    v15,
  v46 = v18);

  return v46;
}

- (void)presentFriendSuggestionsScreen:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "presentFriendSuggestionsScreen", v10, 2u);
  }
  id v7 = [GKOnboardingFriendsSuggestionsViewController alloc];
  v8 = [(GKOnboardingController *)self gameBundleId];
  id v9 = [(GKOnboardingFriendsSuggestionsViewController *)v7 initWithGameBundleId:v8];
  [(GKOnboardingController *)self presentViewController:v9 presentingViewController:v4];
}

- (void)presentContactsIntegrationConsentScreen:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "presentContactsIntegrationConsentScreen", v8, 2u);
  }
  id v7 = objc_alloc_init(GKContactsIntegrationConsentViewController);
  [(GKOnboardingController *)self presentViewController:v7 presentingViewController:v4];
}

- (void)presentPersonalizationScreen:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "presentPersonalizationScreen", v8, 2u);
  }
  id v7 = objc_alloc_init(GKOnboardingProfileCreationViewController);
  [(GKOnboardingController *)self presentViewController:v7 presentingViewController:v4];
}

- (void)presentViewController:(id)a3 presentingViewController:(id)a4
{
}

- (NSString)gameBundleId
{
  return self->_gameBundleId;
}

- (void)setGameBundleId:(id)a3
{
}

- (GKOnboardingFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKOnboardingFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_gameBundleId, 0);
}

@end