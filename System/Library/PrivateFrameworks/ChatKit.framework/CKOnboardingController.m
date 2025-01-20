@interface CKOnboardingController
- (AVPlayer)memojiVideoPlayer;
- (AVPlayerLooper)memojiVideoPlayerLooper;
- (AVTAvatarRecord)avatarRecord;
- (AVTAvatarStore)avatarStore;
- (BOOL)_alwaysShowAppleIntelligenceOnboarding;
- (BOOL)_isRunningTest;
- (BOOL)_meCardSharingEnabled;
- (BOOL)_shouldOnboardCollaborationApps;
- (BOOL)_shouldPresentNewInMessages;
- (BOOL)_shouldShowAppleIntelligenceOnboarding;
- (BOOL)_shouldShowNicknameOnboardingFlow;
- (BOOL)_shouldShowNicknameOnboardingFlowIgnoringVersion:(BOOL)a3;
- (BOOL)_shouldShowSyndicationOnboardingFlowOnLaunch;
- (BOOL)accountCanCreateNickname;
- (BOOL)alwaysShowNicknameOnboarding;
- (BOOL)alwaysShowSyndicationOnboarding;
- (BOOL)isUserInitiatedEditNameAndPhoto;
- (BOOL)presentNicknameSharingSetupFlow;
- (BOOL)presentNicknameSharingSetupFlowWithMemoji:(BOOL)a3 forUserInitiatedEdit:(BOOL)a4;
- (BOOL)presentOnboardingIfNeeded;
- (BOOL)presentingFromPrefs;
- (BOOL)shouldPresentOnboarding;
- (CKCNSharedProfileOnboardingController)sharedProfileOnboardingController;
- (CKCNSharingProfileOnboardingFlowManager)nicknameFlowManager;
- (CKOnboardingControllerDelegate)delegate;
- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration;
- (IMCNMeCardSharingResult)pendingMeCardSharingResult;
- (IMCloudKitSyncState)syncState;
- (OBButtonTray)buttonTray;
- (OBWelcomeController)_appleIntelligenceOnboardingController;
- (OBWelcomeController)syndicationIntroController;
- (OBWelcomeFullCenterContentController)_memojiCreationController;
- (UINavigationController)navigationController;
- (id)_appleIntelligenceIconImage;
- (id)_introController;
- (id)_meCardSharingState;
- (id)_nameAndPhotoSharingIntroController;
- (id)_nicknameController;
- (id)_userDefaults;
- (id)contactForNicknameOnboarding;
- (int)micLayout;
- (int64_t)_lastShownAppleIntelligenceOnboardingVersion;
- (int64_t)_whatsNewLatestShippingVersion;
- (int64_t)_whatsNewVersion;
- (int64_t)currentCollaborationOnboardingVersion;
- (unint64_t)_meCardSharingAudience;
- (unint64_t)_meCardSharingNameFormat;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)nicknameOnboardingLastShownVersion;
- (unint64_t)syndicationOnboardingLastShownVersion;
- (void)_fetchMemojiWithCompletionBlock:(id)a3;
- (void)_presentMemojiCreationIfNeeded:(id)a3 skipAction:(id)a4;
- (void)_pushOnboardingViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateLastShownAppleIntelligenceOnboardingVersion;
- (void)_writeDefaultCollaborationOnboardingVersion;
- (void)_writeDefaultNicknameOnboardingVersion;
- (void)_writeDefaultSyndicationOnboardingVersion;
- (void)_writeDefaultWhatsNewDidShow;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)completedOnboarding;
- (void)completedOnboardingWithCompletion:(id)a3;
- (void)enableSyndication;
- (void)flowManager:(id)a3 didFinishWithResult:(id)a4;
- (void)initializeBundleIDsInAppPreferences:(BOOL)a3;
- (void)meCardSharingOnboardingAudienceViewControllerDidFinish:(id)a3 withSharingAudience:(unint64_t)a4;
- (void)meCardSharingOnboardingEditController:(id)a3 didFinishWithOnboardingResult:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)onboardCollaborationApps;
- (void)prepareForOnboarding;
- (void)prepareForSuspend;
- (void)presentMemojiSetup;
- (void)presentNicknameOnboardingOrEditFlow;
- (void)presentOnboarding:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pushMemojiCreationStep;
- (void)pushMemojiCreationStepIfNeeded;
- (void)pushNameAndPhotoSharingConfigDataStep;
- (void)pushNameAndPhotoSharingConfigSharingPreferenceStep;
- (void)pushNameAndPhotoSharingIntroStep;
- (void)pushNameAndPhotoSharingIntroStepIfNeeded;
- (void)pushSyndicationIntroStep;
- (void)setAppleIntelligenceOnboardingController:(id)a3;
- (void)setAvatarItemProviderConfiguration:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setAvatarStore:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserInitiatedEditNameAndPhoto:(BOOL)a3;
- (void)setMemojiCreationController:(id)a3;
- (void)setMemojiVideoPlayer:(id)a3;
- (void)setMemojiVideoPlayerLooper:(id)a3;
- (void)setMicLayout:(int)a3;
- (void)setNavigationController:(id)a3;
- (void)setNicknameFlowManager:(id)a3;
- (void)setPendingMeCardSharingResult:(id)a3;
- (void)setPresentingFromPrefs:(BOOL)a3;
- (void)setSharedProfileOnboardingController:(id)a3;
- (void)setSyncState:(id)a3;
- (void)setSyndicationIntroController:(id)a3;
- (void)setUpSyndicationLater;
- (void)sharingPickerDidFinish:(id)a3;
- (void)showAppleIntelligenceOnboardingStepIfNeeded;
- (void)startNicknameOnboardingIfNeeded;
@end

@implementation CKOnboardingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_syndicationIntroController, 0);
  objc_storeStrong((id *)&self->_sharedProfileOnboardingController, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_nicknameFlowManager, 0);
  objc_storeStrong((id *)&self->_pendingMeCardSharingResult, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_memojiVideoPlayerLooper, 0);
  objc_storeStrong((id *)&self->_memojiVideoPlayer, 0);
  objc_storeStrong((id *)&self->_memojiCreationController, 0);
  objc_storeStrong((id *)&self->_appleIntelligenceOnboardingController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_syncState, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_alwaysShowAppleIntelligenceOnboarding
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  char v3 = [v2 BOOLForKey:@"AlwaysShowAppleIntelligenceOnboarding"];

  return v3;
}

- (BOOL)_shouldShowAppleIntelligenceOnboarding
{
  if ([(CKOnboardingController *)self _isRunningTest])
  {
    LOBYTE(v3) = 0;
  }
  else if ([(CKOnboardingController *)self _alwaysShowAppleIntelligenceOnboarding])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [MEMORY[0x1E4F6E790] messageSummarizationEnabled];
    if (v3) {
      LOBYTE(v3) = [(CKOnboardingController *)self _lastShownAppleIntelligenceOnboardingVersion] < 1;
    }
  }
  return v3;
}

- (BOOL)shouldPresentOnboarding
{
  if ([(CKOnboardingController *)self _shouldPresentNewInMessages]
    || [(CKOnboardingController *)self _shouldShowNicknameOnboardingFlowOnLaunch]|| [(CKOnboardingController *)self _shouldShowSyndicationOnboardingFlowOnLaunch]|| [(CKOnboardingController *)self _shouldOnboardCollaborationApps])
  {
    return 1;
  }

  return [(CKOnboardingController *)self _shouldShowAppleIntelligenceOnboarding];
}

- (BOOL)alwaysShowNicknameOnboarding
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  char v3 = [v2 BOOLForKey:@"AlwaysShowNicknameOnboarding"];

  return v3;
}

- (id)_userDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

- (BOOL)_shouldPresentNewInMessages
{
  if ([(CKOnboardingController *)self _isRunningTest]) {
    return 0;
  }
  char v3 = [(CKOnboardingController *)self _userDefaults];
  char v4 = [v3 BOOLForKey:@"DisableWhatsNewScreen"];

  if (v4) {
    return 0;
  }
  v6 = [(CKOnboardingController *)self _userDefaults];
  char v7 = [v6 BOOLForKey:@"AlwaysShowWhatsNewScreen"];

  v8 = [(CKOnboardingController *)self _userDefaults];
  uint64_t v9 = [v8 integerForKey:@"whatsNewInMessagesVersion"];

  if (v9 < [(CKOnboardingController *)self _whatsNewLatestShippingVersion]
    || v9 > [(CKOnboardingController *)self _whatsNewVersion])
  {
    uint64_t v9 = [(CKOnboardingController *)self _whatsNewLatestShippingVersion];
  }
  return (v7 & 1) != 0 || v9 < [(CKOnboardingController *)self _whatsNewVersion];
}

- (BOOL)_shouldOnboardCollaborationApps
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CKOnboardingController *)self _isRunningTest] || !CKIsRunningInMessages())
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v3 = [(CKOnboardingController *)self currentCollaborationOnboardingVersion];
    char v4 = [MEMORY[0x1E4F6EA28] sharedManager];
    int v5 = [v4 defaultCollaborationAppsEnabled];

    if (v3 < 1) {
      int v6 = 1;
    }
    else {
      int v6 = v5 ^ 1;
    }
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = @"NO";
        if (v6) {
          v8 = @"YES";
        }
        int v10 = 138412546;
        v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = v3;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "shouldOnboard: %@ collaborationOnboardingVersion = %lu", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  return v6;
}

- (BOOL)_shouldShowSyndicationOnboardingFlowOnLaunch
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F6E730] supportsSharedWithYou] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Don't show the syndication onboarding flow as this device does not support it.", (uint8_t *)&v19, 2u);
      }
      goto LABEL_19;
    }
LABEL_20:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ([(CKOnboardingController *)self _isRunningTest] || !CKIsRunningInMessages())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Not showing onboarding because process is not Messages", (uint8_t *)&v19, 2u);
      }
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  uint64_t v3 = [(CKOnboardingController *)self delegate];
  char v4 = [v3 presentingViewControllerForOnboardingController:self];

  if ((unint64_t)([v4 interfaceOrientation] - 1) < 2
    || ([MEMORY[0x1E4F42948] currentDevice],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6))
  {
    if ([(CKOnboardingController *)self alwaysShowSyndicationOnboarding])
    {
      if (IMOSLoggingEnabled())
      {
        char v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Showing syndication onboarding because debugging with alwaysShowSyndicationOnboarding enabled", (uint8_t *)&v19, 2u);
        }
      }
      LOBYTE(v8) = 1;
    }
    else
    {
      unint64_t v11 = [(CKOnboardingController *)self syndicationOnboardingLastShownVersion];
      __int16 v12 = [MEMORY[0x1E4F6EA28] sharedManager];
      int v13 = [v12 sharedWithYouKeyExists];

      if (v11 < 3) {
        int v8 = 1;
      }
      else {
        int v8 = v13 ^ 1;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = @"NO";
          if (v8) {
            v16 = @"YES";
          }
          else {
            v16 = @"NO";
          }
          if (v13) {
            v17 = @"YES";
          }
          else {
            v17 = @"NO";
          }
          int v19 = 138412802;
          v20 = v16;
          __int16 v21 = 2112;
          v22 = v17;
          if (v11 < 3) {
            v15 = @"YES";
          }
          __int16 v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Syndication onboarding should present: %@ because sharedWithYouKeyExists: %@, onboardingVersionIsOutdated: %@", (uint8_t *)&v19, 0x20u);
        }
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Not showing syndication onboarding because device is in landscape orientation, and there are unresolved crashes when rotating CKSyndicationContentViewController to portrait", (uint8_t *)&v19, 2u);
      }
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_isRunningTest
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  char v3 = [v2 isRunningTest];

  return v3;
}

- (CKOnboardingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKOnboardingControllerDelegate *)WeakRetained;
}

- (int64_t)currentCollaborationOnboardingVersion
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  int64_t v3 = [v2 integerForKey:@"CollaborationOnboardingVersion"];

  return v3;
}

- (unint64_t)syndicationOnboardingLastShownVersion
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  unint64_t v3 = [v2 integerForKey:@"SyndicationOnboardingVersion"];

  return v3;
}

- (BOOL)alwaysShowSyndicationOnboarding
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  char v3 = [v2 BOOLForKey:@"AlwaysShowSyndicationOnboarding"];

  return v3;
}

- (BOOL)presentOnboardingIfNeeded
{
  if ([(CKOnboardingController *)self _shouldPresentNewInMessages])
  {
    if (IMOSLoggingEnabled())
    {
      char v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Presenting onboarding flow", buf, 2u);
      }
    }
    [(CKOnboardingController *)self prepareForOnboarding];
    char v4 = [(CKOnboardingController *)self _introController];
    [(CKOnboardingController *)self presentOnboarding:v4];

    [(CKOnboardingController *)self _writeDefaultWhatsNewDidShow];
LABEL_25:
    LOBYTE(v8) = 1;
    return v8;
  }
  if ([(CKOnboardingController *)self _shouldShowNicknameOnboardingFlowOnLaunch])
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Presenting nickname onboarding flow", v14, 2u);
      }
    }
    [(CKOnboardingController *)self prepareForOnboarding];
    [(CKOnboardingController *)self startNicknameOnboardingIfNeeded];
    goto LABEL_25;
  }
  if ([(CKOnboardingController *)self _shouldShowSyndicationOnboardingFlowOnLaunch])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Presenting Syndication onboarding flow", v13, 2u);
      }
    }
    [(CKOnboardingController *)self prepareForOnboarding];
    [(CKOnboardingController *)self pushSyndicationIntroStep];
    goto LABEL_25;
  }
  if ([(CKOnboardingController *)self _shouldShowAppleIntelligenceOnboarding])
  {
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v12 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Presenting apple intelligence onboarding", v12, 2u);
      }
    }
    [(CKOnboardingController *)self prepareForOnboarding];
    [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
    goto LABEL_25;
  }
  BOOL v8 = [(CKOnboardingController *)self _shouldOnboardCollaborationApps];
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v11 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Onboarding collaboration apps", v11, 2u);
      }
    }
    [(CKOnboardingController *)self onboardCollaborationApps];
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unint64_t)nicknameOnboardingLastShownVersion
{
  v2 = [(CKOnboardingController *)self _userDefaults];
  unint64_t v3 = [v2 integerForKey:@"NicknameOnboardingVersion"];

  return v3;
}

- (BOOL)_shouldShowNicknameOnboardingFlow
{
  return [(CKOnboardingController *)self _shouldShowNicknameOnboardingFlowIgnoringVersion:0];
}

- (BOOL)_shouldShowNicknameOnboardingFlowIgnoringVersion:(BOOL)a3
{
  if ([(CKOnboardingController *)self _isRunningTest]) {
    return 0;
  }
  if ([(CKOnboardingController *)self alwaysShowNicknameOnboarding]
    || [(CKOnboardingController *)self isUserInitiatedEditNameAndPhoto])
  {
    return 1;
  }
  if (!a3 && [(CKOnboardingController *)self nicknameOnboardingLastShownVersion]) {
    return 0;
  }

  return [(CKOnboardingController *)self accountCanCreateNickname];
}

- (BOOL)accountCanCreateNickname
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isAllowMultiplePhoneNumbersSNaPEnabled];

  int v4 = IMSharedHelperNickNameEnabled();
  if (v3)
  {
    if (v4)
    {
      int v5 = [MEMORY[0x1E4F6BD50] sharedInstance];
      LOBYTE(v6) = [v5 iCloudSignedInToUseNicknames];
LABEL_9:

      return v6;
    }
  }
  else if (v4)
  {
    int v5 = [MEMORY[0x1E4F6BD50] sharedInstance];
    if ([v5 iCloudSignedInToUseNicknames]) {
      int v6 = [MEMORY[0x1E4F6BD50] multiplePhoneNumbersTiedToAppleID] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)presentNicknameSharingSetupFlow
{
  return [(CKOnboardingController *)self presentNicknameSharingSetupFlowWithMemoji:1 forUserInitiatedEdit:1];
}

- (BOOL)presentNicknameSharingSetupFlowWithMemoji:(BOOL)a3 forUserInitiatedEdit:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(CKOnboardingController *)self _shouldShowNicknameOnboardingFlowIgnoringVersion:1];
  if (v7)
  {
    [(CKOnboardingController *)self setIsUserInitiatedEditNameAndPhoto:v4];
    [(CKOnboardingController *)self prepareForOnboarding];
    location[0] = 0;
    objc_initWeak(location, self);
    if (v5)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke;
      v15[3] = &unk_1E56215C8;
      objc_copyWeak(&v16, location);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_2;
      v13[3] = &unk_1E56215C8;
      objc_copyWeak(&v14, location);
      [(CKOnboardingController *)self _presentMemojiCreationIfNeeded:v15 skipAction:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
    }
    else
    {
      uint64_t v9 = [(CKOnboardingController *)self avatarRecord];

      if (v9)
      {
        int v10 = [(CKOnboardingController *)self _nameAndPhotoSharingIntroController];
        [(CKOnboardingController *)self presentOnboarding:v10];
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_3;
        v12[3] = &unk_1E5627F60;
        v12[4] = self;
        [(CKOnboardingController *)self _fetchMemojiWithCompletionBlock:v12];
      }
    }
    objc_destroyWeak(location);
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Not showing onboarding flow for nicknames as feature is disabled or accounts mismatch", (uint8_t *)location, 2u);
    }
  }
  return v7;
}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 _memojiCreationController];
  [v2 presentOnboarding:v1];
}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_2(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 _nameAndPhotoSharingIntroController];
  [v2 presentOnboarding:v1];
}

void __89__CKOnboardingController_presentNicknameSharingSetupFlowWithMemoji_forUserInitiatedEdit___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAvatarRecord:");
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _nameAndPhotoSharingIntroController];
  [v2 presentOnboarding:v3];
}

- (void)presentNicknameOnboardingOrEditFlow
{
  id v3 = [(CKOnboardingController *)self sharedProfileOnboardingController];

  if (!v3)
  {
    if (_ContactsUIForwardDeclareInit_onceToken != -1) {
      dispatch_once(&_ContactsUIForwardDeclareInit_onceToken, &__block_literal_global_481_0);
    }
    id v4 = objc_alloc((Class)_CKCNSharedProfileOnboardingController);
    BOOL v5 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    int v6 = [v5 getContactStore];
    BOOL v7 = (void *)[v4 initWithContactStore:v6];
    [(CKOnboardingController *)self setSharedProfileOnboardingController:v7];
  }
  BOOL v8 = [(CKOnboardingController *)self delegate];
  id v10 = [v8 presentingViewControllerForOnboardingController:self];

  uint64_t v9 = [(CKOnboardingController *)self sharedProfileOnboardingController];
  [v9 startOnboardingOrEditForMode:0 fromViewController:v10];
}

- (void)prepareForSuspend
{
  id v3 = [(CKOnboardingController *)self navigationController];
  id v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)prepareForOnboarding
{
  if (_OnBoardingKitInit_onceToken != -1) {
    dispatch_once(&_OnBoardingKitInit_onceToken, &__block_literal_global_498_1);
  }
  if (_AvatarUIInit_onceToken != -1) {
    dispatch_once(&_AvatarUIInit_onceToken, &__block_literal_global_518_1);
  }
  if (_ContactsUIForwardDeclareInit_onceToken != -1)
  {
    dispatch_once(&_ContactsUIForwardDeclareInit_onceToken, &__block_literal_global_481_0);
  }
}

- (void)presentOnboarding:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKOnboardingController *)self delegate];
  int v6 = [v5 presentingViewControllerForOnboardingController:self];

  if (!v6)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_27;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v11 = "Onboarding: no presenting view controller!";
      __int16 v12 = buf;
      goto LABEL_19;
    }
LABEL_26:

    goto LABEL_27;
  }
  if (_CKOBWelcomeController) {
    BOOL v7 = _CKOBBoldTrayButton == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || _CKOBLinkTrayButton == 0 || _CKOBWelcomeFullCenterContentController == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_27;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v30 = 0;
      unint64_t v11 = "Onboarding: OnBoardingKit classes not linked!";
      __int16 v12 = (uint8_t *)&v30;
LABEL_19:
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (v4)
  {
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
    [(CKOnboardingController *)self setNavigationController:v13];

    id v14 = [(CKOnboardingController *)self navigationController];
    [v14 setModalPresentationStyle:2];

    v15 = [(CKOnboardingController *)self navigationController];
    id v16 = [v15 interactivePopGestureRecognizer];
    [v16 setEnabled:0];

    v17 = [(CKOnboardingController *)self navigationController];
    [v17 setModalInPresentation:0];

    v18 = [(CKOnboardingController *)self navigationController];
    int v19 = [v18 navigationBar];
    v20 = objc_opt_new();
    [v19 setBackgroundImage:v20 forBarMetrics:0];

    __int16 v21 = [(CKOnboardingController *)self navigationController];
    v22 = [v21 navigationBar];
    [v22 _setHidesShadow:1];

    __int16 v23 = [(CKOnboardingController *)self navigationController];
    [v23 setDelegate:self];

    v24 = [(CKOnboardingController *)self navigationController];
    uint64_t v25 = [v24 presentationController];
    [v25 setDelegate:self];

    v26 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    if (!v27)
    {
      v28 = [MEMORY[0x1E4F42948] currentDevice];
      [v28 setOrientation:1 animated:1];
    }
    if ([(CKOnboardingController *)self _shouldShowSyndicationOnboardingFlowOnLaunch])
    {
      v29 = [(CKOnboardingController *)self navigationController];
      [v29 setNavigationBarHidden:1];
    }
    id v10 = [(CKOnboardingController *)self navigationController];
    [v6 presentViewController:v10 animated:1 completion:0];
    goto LABEL_26;
  }
LABEL_27:
}

- (id)_introController
{
  id v3 = CKFrameworkBundle();
  v28 = [v3 localizedStringForKey:@"WHATS_NEW_IN_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v4 = (void *)[objc_alloc((Class)_CKOBWelcomeController) initWithTitle:v28 detailText:0 icon:0];
  BOOL v5 = [(id)_CKOBBoldTrayButton boldButton];
  int v6 = CKFrameworkBundle();
  BOOL v7 = [v6 localizedStringForKey:@"CONTINUE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v5 setTitle:v7 forState:0];

  [v5 addTarget:self action:sel_pushMemojiCreationStepIfNeeded forControlEvents:64];
  BOOL v8 = [v4 buttonTray];
  [v8 addButton:v5];

  uint64_t v9 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_NameAndPhoto"];
  id v10 = [v9 imageWithRenderingMode:2];

  unint64_t v11 = CKFrameworkBundle();
  __int16 v12 = [v11 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  int v13 = CKFrameworkBundle();
  id v14 = [v13 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v4 addBulletedListItemWithTitle:v12 description:v14 image:v10];

  v15 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_Memoji"];

  id v16 = [v15 imageWithRenderingMode:2];

  v17 = CKFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"WHATS_NEW_ANIMOJI_STICKER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  int v19 = CKFrameworkBundle();
  v20 = [v19 localizedStringForKey:@"WHATS_NEW_ANIMOJI_STICKER_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v4 addBulletedListItemWithTitle:v18 description:v20 image:v16];

  __int16 v21 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_Search"];

  v22 = [v21 imageWithRenderingMode:2];

  __int16 v23 = CKFrameworkBundle();
  v24 = [v23 localizedStringForKey:@"WHATS_NEW_LINK_AND_ATTACHMENT_SEARCH_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v25 = CKFrameworkBundle();
  v26 = [v25 localizedStringForKey:@"WHATS_NEW_LINK_AND_ATTACHMENT_SEARCH_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v4 addBulletedListItemWithTitle:v24 description:v26 image:v22];

  return v4;
}

- (void)startNicknameOnboardingIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  id v3 = (void (**)(void))_Block_copy(aBlock);
  if ([(CKOnboardingController *)self alwaysShowNicknameOnboarding])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Always show nickname onboarding flag set, showing onboarding regardless of current nickname", buf, 2u);
      }
    }
    v3[2](v3);
  }
  else
  {
    BOOL v5 = [(CKOnboardingController *)self _nicknameController];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke_90;
    v6[3] = &unk_1E5627F88;
    BOOL v7 = v3;
    [v5 fetchPersonalNicknameWithCompletion:v6];
  }
}

uint64_t __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushMemojiCreationStepIfNeeded];
}

void __57__CKOnboardingController_startNicknameOnboardingIfNeeded__block_invoke_90(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "User has nickname, bailing from nickname onboarding", v7, 2u);
      }
    }
  }
  else
  {
    if (v4)
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Daemon didn't have nickname, showing onboarding", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)_lastShownAppleIntelligenceOnboardingVersion
{
  id v2 = [(CKOnboardingController *)self _userDefaults];
  int64_t v3 = [v2 integerForKey:@"LastShownAppleIntelligenceOnboardingVersion"];

  return v3;
}

- (void)_updateLastShownAppleIntelligenceOnboardingVersion
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = [(CKOnboardingController *)self _userDefaults];
  if (IMOSLoggingEnabled())
  {
    int64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 134217984;
      uint64_t v5 = 1;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Updating last shown Apple Intelligence onboarding version to %ld", (uint8_t *)&v4, 0xCu);
    }
  }
  [v2 setInteger:1 forKey:@"LastShownAppleIntelligenceOnboardingVersion"];
}

- (void)showAppleIntelligenceOnboardingStepIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(CKOnboardingController *)self _shouldShowAppleIntelligenceOnboarding])
  {
    [(CKOnboardingController *)self _updateLastShownAppleIntelligenceOnboardingVersion];
    int64_t v3 = [(CKOnboardingController *)self _appleIntelligenceOnboardingController];
    int v4 = [(CKOnboardingController *)self navigationController];
    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v8 = 138412290;
          uint64_t v9 = v4;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Push apple intelligence onboarding, navigationController: %@", (uint8_t *)&v8, 0xCu);
        }
      }
      [(CKOnboardingController *)self _pushOnboardingViewController:v3 animated:1];
    }
    else
    {
      if (v5)
      {
        BOOL v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Present apple intelligence onboarding", (uint8_t *)&v8, 2u);
        }
      }
      [(CKOnboardingController *)self presentOnboarding:v3];
    }
  }
  else
  {
    [(CKOnboardingController *)self completedOnboarding];
  }
}

- (id)_appleIntelligenceIconImage
{
  int64_t v3 = +[CKUIBehavior sharedBehaviors];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained presentingViewControllerForOnboardingController:self];

  [v3 onBoardingKitWelcomeControllerHeaderViewIconSize];
  double v7 = v6;
  int v8 = [v5 traitCollection];
  [v8 displayScale];
  double v10 = v9;

  unint64_t v11 = objc_opt_new();
  [v11 setShape:0];
  objc_msgSend(v11, "setSize:", v7, v7);
  [v11 setScale:v10];
  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:@"com.apple.application-icon.apple-intelligence"];
  int v13 = [v12 imageForDescriptor:v11];
  if ([v13 placeholder])
  {
    uint64_t v14 = [v12 prepareImageForDescriptor:v11];

    int v13 = (void *)v14;
  }
  uint64_t v15 = [v13 CGImage];
  id v16 = [MEMORY[0x1E4F42A80] imageWithCGImage:v15];

  return v16;
}

- (OBWelcomeController)_appleIntelligenceOnboardingController
{
  appleIntelligenceOnboardingController = self->_appleIntelligenceOnboardingController;
  if (!appleIntelligenceOnboardingController)
  {
    uint64_t v27 = [(CKOnboardingController *)self _appleIntelligenceIconImage];
    int v4 = CKFrameworkBundle();
    v26 = [v4 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v5 = (OBWelcomeController *)[objc_alloc((Class)_CKOBWelcomeController) initWithTitle:v26 detailText:0 icon:v27 contentLayout:2];
    double v6 = CKFrameworkBundle();
    v24 = [v6 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_MESSAGE_SUMMARIES_BULLET_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    double v7 = CKFrameworkBundle();
    __int16 v23 = [v7 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_MESSAGE_SUMMARIES_BULLET_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v8 = CKFrameworkBundle();
    uint64_t v25 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
    v22 = [MEMORY[0x1E4F42A80] imageNamed:@"text.line.2.summary" inBundle:v8 withConfiguration:v25];
    __int16 v21 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    [(OBWelcomeController *)v5 addBulletedListItemWithTitle:v24 description:v23 image:v22 tintColor:v21];
    double v9 = CKFrameworkBundle();
    double v10 = [v9 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_MESSAGE_SMART_REPLIES_BULLET_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    unint64_t v11 = CKFrameworkBundle();
    __int16 v12 = [v11 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_MESSAGE_SMART_REPLIES_BULLET_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v13 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
    uint64_t v14 = [MEMORY[0x1E4F42A80] imageNamed:@"arrowshape.turn.up.left" inBundle:v8 withConfiguration:v13];
    [(OBWelcomeController *)v5 addBulletedListItemWithTitle:v10 description:v12 image:v14];
    uint64_t v15 = [(id)_CKOBBoldTrayButton boldButton];
    id v16 = CKFrameworkBundle();
    v17 = [v16 localizedStringForKey:@"APPLE_INTELLIGENCE_ONBOARDING_CONTINUE_BUTTON_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v15 setTitle:v17 forState:0];

    [v15 addTarget:self action:sel_completedOnboarding forControlEvents:64];
    v18 = [(OBWelcomeController *)v5 buttonTray];
    [v18 addButton:v15];

    int v19 = self->_appleIntelligenceOnboardingController;
    self->_appleIntelligenceOnboardingController = v5;

    appleIntelligenceOnboardingController = self->_appleIntelligenceOnboardingController;
  }

  return appleIntelligenceOnboardingController;
}

- (void)pushMemojiCreationStepIfNeeded
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke;
  v5[3] = &unk_1E56215C8;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke_2;
  v3[3] = &unk_1E56215C8;
  objc_copyWeak(&v4, &location);
  [(CKOnboardingController *)self _presentMemojiCreationIfNeeded:v5 skipAction:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pushMemojiCreationStep];
}

void __56__CKOnboardingController_pushMemojiCreationStepIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pushNameAndPhotoSharingIntroStepIfNeeded];
}

- (void)_fetchMemojiWithCompletionBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CKIsRunningInMacCatalyst()) {
    goto LABEL_5;
  }
  if (_fetchMemojiWithCompletionBlock___pred_AVTUIAreAvatarsSupportedAvatarUI != -1) {
    dispatch_once(&_fetchMemojiWithCompletionBlock___pred_AVTUIAreAvatarsSupportedAvatarUI, &__block_literal_global_111);
  }
  if (_fetchMemojiWithCompletionBlock___AVTUIAreAvatarsSupported())
  {
LABEL_5:
    id v5 = objc_alloc_init((Class)_CKAVTAvatarStore);
    [(CKOnboardingController *)self setAvatarStore:v5];

    id v6 = [(id)_CKAVTAvatarFetchRequest requestForCustomAvatarsWithLimit:1];
    double v7 = [(CKOnboardingController *)self avatarStore];

    if (v7 && v6)
    {
      int v8 = [(CKOnboardingController *)self avatarStore];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_132;
      v12[3] = &unk_1E5627FB0;
      id v13 = v4;
      [v8 fetchAvatarsForFetchRequest:v6 completionHandler:v12];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        double v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          double v10 = [(CKOnboardingController *)self avatarStore];
          *(_DWORD *)buf = 138412546;
          uint64_t v15 = v10;
          __int16 v16 = 2112;
          v17 = v6;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Onboarding: nil avatar store %@ or fetch request %@. Going to memoji creation flow.", buf, 0x16u);
        }
      }
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Running on device which does not support avatars. Skipping memoji creation.", buf, 2u);
      }
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void *__58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("AVTUIAreAvatarsSupported", @"AvatarUI");
  _fetchMemojiWithCompletionBlock___AVTUIAreAvatarsSupported = result;
  return result;
}

void __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E5622330;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __58__CKOnboardingController__fetchMemojiWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) firstObject];
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 1, v6);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 1, 0);
  }
}

- (void)_presentMemojiCreationIfNeeded:(id)a3 skipAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CKOnboardingController__presentMemojiCreationIfNeeded_skipAction___block_invoke;
  v10[3] = &unk_1E5627FD8;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CKOnboardingController *)self _fetchMemojiWithCompletionBlock:v10];
}

uint64_t __68__CKOnboardingController__presentMemojiCreationIfNeeded_skipAction___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvatarRecord:");
    uint64_t v4 = a1 + 40;
  }
  else
  {
    uint64_t v4 = a1 + 48;
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)v4 + 16);

  return v5();
}

- (OBWelcomeFullCenterContentController)_memojiCreationController
{
  v45[2] = *MEMORY[0x1E4F143B8];
  p_memojiCreationController = &self->_memojiCreationController;
  memojiCreationController = self->_memojiCreationController;
  if (memojiCreationController)
  {
    uint64_t v4 = memojiCreationController;
  }
  else
  {
    id v6 = CKFrameworkBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"WHATS_NEW_MEMOJI_CREATION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    id v8 = CKFrameworkBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"WHATS_NEW_MEMOJI_CREATION_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v42 = (void *)v9;
    v43 = (void *)v7;
    uint64_t v4 = (OBWelcomeFullCenterContentController *)[objc_alloc((Class)_CKOBWelcomeFullCenterContentController) initWithTitle:v7 detailText:v9 symbolName:0 contentLayout:3];
    uint64_t v10 = _CKAVTAvatarEditorSplashVideo();
    id v11 = [MEMORY[0x1E4F16670] playerWithPlayerItem:v10];
    [v11 setAllowsExternalPlayback:0];
    [(CKOnboardingController *)self setMemojiVideoPlayer:v11];
    v41 = (void *)v10;
    id v12 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:v11 templateItem:v10];
    [(CKOnboardingController *)self setMemojiVideoPlayerLooper:v12];

    id v13 = objc_alloc_init((Class)_CKAVPlayerViewController);
    uint64_t v14 = [v13 view];
    uint64_t v15 = [MEMORY[0x1E4F428B8] clearColor];
    [v14 setBackgroundColor:v15];

    [v13 setPlayer:v11];
    [v13 setShowsPlaybackControls:0];
    [(OBWelcomeFullCenterContentController *)v4 addChildViewController:v13];
    __int16 v16 = [v13 view];
    [(OBWelcomeFullCenterContentController *)v4 setCenteredContentView:v16];

    v44 = [v13 view];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (!CKIsRunningInMacCatalyst())
    {
      v38 = [v44 leadingAnchor];
      v39 = [(OBWelcomeFullCenterContentController *)v4 view];
      v37 = [v39 leadingAnchor];
      v17 = [v38 constraintEqualToAnchor:v37];
      v45[0] = v17;
      uint64_t v18 = [v44 trailingAnchor];
      int v19 = [(OBWelcomeFullCenterContentController *)v4 view];
      v20 = [v19 trailingAnchor];
      __int16 v21 = [v18 constraintEqualToAnchor:v20];
      v45[1] = v21;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
      v22 = v40 = v11;

      [MEMORY[0x1E4F28DC8] activateConstraints:v22];
      __int16 v23 = [v44 heightAnchor];
      v24 = [(OBWelcomeFullCenterContentController *)v4 view];
      uint64_t v25 = [v24 widthAnchor];
      v26 = [v23 constraintEqualToAnchor:v25];

      LODWORD(v27) = 1132068864;
      [v26 setPriority:v27];
      [v26 setActive:1];

      id v11 = v40;
    }
    v28 = [(id)_CKOBBoldTrayButton boldButton];
    v29 = CKFrameworkBundle();
    __int16 v30 = [v29 localizedStringForKey:@"GET_STARTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v28 setTitle:v30 forState:0];

    [v28 addTarget:self action:sel_presentMemojiSetup forControlEvents:64];
    v31 = [(OBWelcomeFullCenterContentController *)v4 buttonTray];
    [v31 addButton:v28];

    v32 = [(id)_CKOBLinkTrayButton linkButton];
    v33 = CKFrameworkBundle();
    v34 = [v33 localizedStringForKey:@"WHATS_NEW_SETUP_LATER_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v32 setTitle:v34 forState:0];

    [v32 addTarget:self action:sel_pushNameAndPhotoSharingIntroStepIfNeeded forControlEvents:64];
    v35 = [(OBWelcomeFullCenterContentController *)v4 buttonTray];
    [v35 addButton:v32];

    objc_storeStrong((id *)p_memojiCreationController, v4);
  }

  return v4;
}

- (void)pushMemojiCreationStep
{
  id v4 = [(CKOnboardingController *)self _memojiCreationController];
  uint64_t v3 = [(CKOnboardingController *)self navigationController];

  if (v3) {
    [(CKOnboardingController *)self _pushOnboardingViewController:v4 animated:1];
  }
  else {
    [(CKOnboardingController *)self presentOnboarding:v4];
  }
  _CKAVTUISetHasDisplayedSplashScreen(1);
}

- (void)presentMemojiSetup
{
  uint64_t v3 = (void *)_CKAVTAvatarEditorViewController;
  id v4 = [(CKOnboardingController *)self avatarStore];
  id v5 = [v3 viewControllerForCreatingAvatarInStore:v4];

  [v5 setDelegate:self];
  [(CKOnboardingController *)self _pushOnboardingViewController:v5 animated:1];
}

- (id)contactForNicknameOnboarding
{
  uint64_t v2 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  uint64_t v3 = [MEMORY[0x1E4F6E6D8] keysForNicknameHandling];
  id v4 = [v2 fetchMeContactWithKeys:v3];

  if (!v4)
  {
    id v4 = +[CKMeCardSharingNameProvider nameContactForPrimaryAccount];
  }

  return v4;
}

- (id)_nameAndPhotoSharingIntroController
{
  uint64_t v3 = CKFrameworkBundle();
  v28 = [v3 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_DETAIL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v4 = CKFrameworkBundle();
  double v27 = [v4 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_DETAIL_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v5 = [[CKNicknameIntroViewController alloc] initWithTitle:v28 detailText:v27 icon:0 contentLayout:1];
  v26 = [(CKOnboardingController *)self contactForNicknameOnboarding];
  id v6 = [CKNicknamePreviewView alloc];
  uint64_t v7 = [(CKOnboardingController *)self avatarRecord];
  id v8 = [(CKNicknamePreviewView *)v6 initWithContact:v26 avatarRecord:v7];

  uint64_t v9 = [(CKNicknamePreviewView *)v8 avatarItemProviderConfiguration];
  [(CKOnboardingController *)self setAvatarItemProviderConfiguration:v9];

  uint64_t v10 = [(CKNicknameIntroViewController *)v5 contentView];
  [v10 addSubview:v8];

  [(CKNicknameIntroViewController *)v5 setNicknamePreviewView:v8];
  [(CKNicknamePreviewView *)v8 setNeedsLayout];
  [(CKNicknamePreviewView *)v8 layoutIfNeeded];
  [(CKNicknamePreviewView *)v8 sizeToFit];
  id v11 = objc_alloc_init(CKOnboardingBoldButtonProvider);
  id v12 = [(CKOnboardingBoldButtonProvider *)v11 boldButton];
  LODWORD(v10) = CKIsRunningInMacCatalyst();
  id v13 = CKFrameworkBundle();
  uint64_t v14 = v13;
  if (v10) {
    uint64_t v15 = @"CONTINUE";
  }
  else {
    uint64_t v15 = @"CHOOSE_NAME_AND_PHOTO";
  }
  __int16 v16 = [v13 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v12 setTitle:v16 forState:0];

  [v12 addTarget:self action:sel_pushNameAndPhotoSharingConfigDataStep forControlEvents:64];
  v17 = [(CKNicknameIntroViewController *)v5 buttonTray];
  [v17 addButton:v12];

  uint64_t v18 = [(id)_CKOBLinkTrayButton linkButton];
  int v19 = CKIsRunningInMacCatalyst();
  v20 = CKFrameworkBundle();
  __int16 v21 = v20;
  if (v19) {
    v22 = @"WHATS_NEW_SETUP_LATER";
  }
  else {
    v22 = @"WHATS_NEW_SETUP_LATER_SETTINGS";
  }
  __int16 v23 = [v20 localizedStringForKey:v22 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v18 setTitle:v23 forState:0];

  [v18 addTarget:self action:sel_showAppleIntelligenceOnboardingStepIfNeeded forControlEvents:64];
  v24 = [(CKNicknameIntroViewController *)v5 buttonTray];
  [v24 addButton:v18];

  return v5;
}

- (void)pushNameAndPhotoSharingIntroStepIfNeeded
{
  if ([(CKOnboardingController *)self _shouldShowNicknameOnboardingFlow]
    && _CKCNSharingProfileOnboardingFlowManager)
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom])
    {
      id v4 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v5 = [v4 userInterfaceIdiom] == 1;
    }
    else
    {
      BOOL v5 = 1;
    }

    id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v7 = [v6 isNameAndPhotoC3Enabled];

    if (v7 && v5)
    {
      id v8 = [(CKOnboardingController *)self delegate];
      id v15 = [v8 presentingViewControllerForOnboardingController:self];

      uint64_t v9 = [(CKOnboardingController *)self sharedProfileOnboardingController];

      if (!v9)
      {
        id v10 = objc_alloc((Class)_CKCNSharedProfileOnboardingController);
        id v11 = [MEMORY[0x1E4F6E6D8] sharedInstance];
        id v12 = [v11 getContactStore];
        id v13 = (void *)[v10 initWithContactStore:v12];
        [(CKOnboardingController *)self setSharedProfileOnboardingController:v13];
      }
      uint64_t v14 = [(CKOnboardingController *)self sharedProfileOnboardingController];
      [v14 presentOnboardingFlowIfNeededForMode:0 fromViewController:v15];
    }
    else
    {
      [(CKOnboardingController *)self pushNameAndPhotoSharingIntroStep];
    }
  }
  else
  {
    [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
  }
}

- (void)flowManager:(id)a3 didFinishWithResult:(id)a4
{
  id v5 = a4;
  id v6 = [(CKOnboardingController *)self _nicknameController];
  [v6 setPersonalNicknameFromOnboardingResult:v5];

  [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
}

- (void)pushNameAndPhotoSharingIntroStep
{
  id v4 = [(CKOnboardingController *)self _nameAndPhotoSharingIntroController];
  uint64_t v3 = [(CKOnboardingController *)self navigationController];

  if (v3) {
    [(CKOnboardingController *)self _pushOnboardingViewController:v4 animated:1];
  }
  else {
    [(CKOnboardingController *)self presentOnboarding:v4];
  }
  [(CKOnboardingController *)self _writeDefaultNicknameOnboardingVersion];
}

- (void)pushNameAndPhotoSharingConfigDataStep
{
  id v11 = [(CKOnboardingController *)self contactForNicknameOnboarding];
  uint64_t v3 = +[CKMeCardSharingNameProvider nameProviderForContact:](CKMeCardSharingNameProvider, "nameProviderForContact:");
  if (!v3)
  {
    uint64_t v3 = +[CKMeCardSharingNameProvider nameProviderForPrimaryAccount];
  }
  id v4 = objc_alloc((Class)_CKCNSharingProfileOnboardingFlowManager);
  id v5 = [(CKOnboardingController *)self navigationController];
  id v6 = [(CKOnboardingController *)self avatarRecord];
  int v7 = [(CKOnboardingController *)self avatarItemProviderConfiguration];
  id v8 = (void *)[v4 initWithNavigationController:v5 contact:v11 avatarRecord:v6 avatarItemProviderConfiguration:v7];

  [v8 setDelegate:self];
  if (v8)
  {
    uint64_t v9 = [(CKOnboardingController *)self navigationController];
    [v9 setModalInPresentation:1];

    [(CKOnboardingController *)self setNicknameFlowManager:v8];
    id v10 = [(CKOnboardingController *)self nicknameFlowManager];
    [v10 startFlow];
  }
  else
  {
    [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
  }
}

- (void)pushNameAndPhotoSharingConfigSharingPreferenceStep
{
  unint64_t v3 = [(CKOnboardingController *)self _meCardSharingAudience];
  if (!v3)
  {
    id v4 = [(CKOnboardingController *)self _meCardSharingState];
    unint64_t v3 = 1;
    [v4 setSharingAudience:1];
  }
  id v5 = (void *)[objc_alloc((Class)_CKCNMeCardSharingOnboardingAudienceViewController) initWithSelectedSharingAudience:v3];
  id v6 = v5;
  if (v5)
  {
    [v5 setDelegate:self];
    [(CKOnboardingController *)self _pushOnboardingViewController:v6 animated:1];
  }
  else
  {
    [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
  }
}

- (void)_pushOnboardingViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(CKOnboardingController *)self navigationController];
  int v7 = [v6 viewControllers];
  char v8 = [v7 containsObject:v10];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(CKOnboardingController *)self navigationController];
    [v9 pushViewController:v10 animated:v4];
  }
}

- (void)onboardCollaborationApps
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F6EA28] sharedManager];
  int v4 = [v3 sharedWithYouKeyExists];

  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Collaboration onboarding sharedWithYouKeyExists = %d", buf, 8u);
    }
  }
  if (v4)
  {
    if (![(CKOnboardingController *)self currentCollaborationOnboardingVersion]) {
      [(CKOnboardingController *)self _writeDefaultCollaborationOnboardingVersion];
    }
    id v6 = [MEMORY[0x1E4F6EA28] sharedManager];
    uint64_t v7 = [v6 isSharedWithYouEnabled];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    char v8 = [MEMORY[0x1E4F6EA28] collaborationAppBundleIDs];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v18;
      *(void *)&long long v10 = 67109378;
      long long v16 = v10;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v6, "isSharedWithYouSetUpForApplicationWithBundleID:", v13, v16) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v16;
                int v22 = v7;
                __int16 v23 = 2112;
                uint64_t v24 = v13;
                _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "App was not set up, setting Shared with You to %d for %@", buf, 0x12u);
              }
            }
            [v6 setSharedWithYouEnabled:v7 forApplicationWithBundleID:v13];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Onboarding: sharedWithYouKey does not exist, skipping onboarding collaboration apps", buf, 2u);
    }
  }
}

- (OBWelcomeController)syndicationIntroController
{
  v55[4] = *MEMORY[0x1E4F143B8];
  syndicationIntroController = self->_syndicationIntroController;
  if (!syndicationIntroController)
  {
    int v4 = (OBWelcomeController *)[objc_alloc((Class)_CKOBWelcomeController) initWithTitle:&stru_1EDE4CA38 detailText:&stru_1EDE4CA38 icon:0];
    v54 = objc_alloc_init(CKOnboardingBoldButtonProvider);
    id v5 = [(CKOnboardingBoldButtonProvider *)v54 boldButton];
    id v6 = CKFrameworkBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v5 setTitle:v7 forState:0];

    v53 = v5;
    [v5 addTarget:self action:sel_enableSyndication forControlEvents:64];
    char v8 = [(OBWelcomeController *)v4 buttonTray];
    [v8 addButton:v5];

    uint64_t v9 = [(id)_CKOBLinkTrayButton linkButton];
    long long v10 = CKFrameworkBundle();
    v52 = [v10 localizedStringForKey:@"WHATS_NEW_SETUP_EDIT_SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];

    [v9 setTitle:v52 forState:0];
    v51 = v9;
    [v9 addTarget:self action:sel_setUpSyndicationLater forControlEvents:64];
    uint64_t v11 = [(OBWelcomeController *)v4 buttonTray];
    [v11 addButton:v9];

    id v12 = [(OBWelcomeController *)v4 buttonTray];
    [(CKOnboardingController *)self setButtonTray:v12];

    uint64_t v13 = objc_alloc_init(CKSyndicationPageViewController);
    [(CKSyndicationPageViewController *)v13 setDelegate:self];
    [(OBWelcomeController *)v4 addChildViewController:v13];
    uint64_t v14 = [(OBWelcomeController *)v4 view];
    id v15 = [(CKSyndicationPageViewController *)v13 view];
    [v14 addSubview:v15];

    [(CKSyndicationPageViewController *)v13 didMoveToParentViewController:v4];
    long long v16 = [(OBWelcomeController *)v4 view];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    uint64_t v25 = [(CKSyndicationPageViewController *)v13 view];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(CKSyndicationPageViewController *)v13 view];
    v48 = [v50 topAnchor];
    v49 = [(OBWelcomeController *)v4 contentView];
    v47 = [v49 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v55[0] = v46;
    v45 = [(CKSyndicationPageViewController *)v13 view];
    v43 = [v45 centerXAnchor];
    v44 = [(OBWelcomeController *)v4 buttonTray];
    v42 = [v44 centerXAnchor];
    v40 = [v43 constraintEqualToAnchor:v42];
    v55[1] = v40;
    v39 = [(CKSyndicationPageViewController *)v13 view];
    v36 = [v39 widthAnchor];
    v37 = [(OBWelcomeController *)v4 contentView];
    uint64_t v26 = [v37 widthAnchor];
    double v27 = [v36 constraintEqualToAnchor:v26];
    v55[2] = v27;
    v28 = [(CKSyndicationPageViewController *)v13 view];
    v29 = [v28 bottomAnchor];
    __int16 v30 = [(OBWelcomeController *)v4 buttonTray];
    v31 = [v30 topAnchor];
    [v29 constraintEqualToAnchor:v31];
    v32 = v38 = self;
    v55[3] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
    [v41 activateConstraints:v33];

    v34 = v38->_syndicationIntroController;
    v38->_syndicationIntroController = v4;

    syndicationIntroController = v38->_syndicationIntroController;
  }

  return syndicationIntroController;
}

- (void)pushSyndicationIntroStep
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CKOnboardingController *)self syndicationIntroController];
  int v4 = [(CKOnboardingController *)self navigationController];

  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [(CKOnboardingController *)self navigationController];
        int v9 = 138412290;
        long long v10 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Push Syndication onboarding, navigationController: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    [(CKOnboardingController *)self _pushOnboardingViewController:v3 animated:1];
  }
  else
  {
    if (v5)
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Present Syndication onboarding", (uint8_t *)&v9, 2u);
      }
    }
    [(CKOnboardingController *)self presentOnboarding:v3];
  }
}

- (void)enableSyndication
{
  if (IMOSLoggingEnabled())
  {
    unint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Enabling syndication for SharedWithYouEnabled and all apps", v5, 2u);
    }
  }
  int v4 = [MEMORY[0x1E4F6EA28] sharedManager];
  [v4 setSharedWithYouEnabled:1];

  [(CKOnboardingController *)self initializeBundleIDsInAppPreferences:1];
  [(CKOnboardingController *)self _writeDefaultSyndicationOnboardingVersion];
  [(CKOnboardingController *)self completedOnboarding];
}

- (void)setUpSyndicationLater
{
  [(CKOnboardingController *)self enableSyndication];
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES&path=SHARED_WITH_YOU_BUTTON"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];

  [(CKOnboardingController *)self completedOnboarding];
}

- (void)initializeBundleIDsInAppPreferences:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  int v5 = [MEMORY[0x1E4F6EA28] sharedManager];
  id v6 = [v5 defaultAppBundleIDs];
  uint64_t v7 = [v4 setWithArray:v6];

  char v8 = [MEMORY[0x1E4F6EA28] collaborationAppBundleIDs];
  [v7 addObjectsFromArray:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
        id v15 = objc_msgSend(MEMORY[0x1E4F6EA28], "sharedManager", (void)v16);
        [v15 setSharedWithYouEnabled:v3 forApplicationWithBundleID:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v9 = [a3 presentedViewController];
  id v4 = [(CKOnboardingController *)self navigationController];
  if (v9 == v4)
  {
    int v5 = [(CKOnboardingController *)self navigationController];
    id v6 = [v5 viewControllers];
    uint64_t v7 = [(CKOnboardingController *)self syndicationIntroController];
    int v8 = [v6 containsObject:v7];

    if (v8)
    {
      [(CKOnboardingController *)self _writeDefaultSyndicationOnboardingVersion];
      [(CKOnboardingController *)self setSyndicationIntroController:0];
    }
  }
  else
  {
  }
}

- (void)completedOnboarding
{
}

- (void)completedOnboardingWithCompletion:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Onboarding completed", v11, 2u);
    }
  }
  [(CKOnboardingController *)self setPendingMeCardSharingResult:0];
  id v6 = [(CKOnboardingController *)self _userDefaults];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  [v6 setObject:v7 forKey:@"OnboardingFinishTime"];

  int v8 = [(CKOnboardingController *)self navigationController];
  id v9 = [v8 presentingViewController];
  [v9 dismissViewControllerAnimated:1 completion:v4];

  uint64_t v10 = [(CKOnboardingController *)self delegate];
  [v10 onboardingControllerDidFinish:self];
}

- (id)_nicknameController
{
  return (id)[MEMORY[0x1E4F6BD50] sharedInstance];
}

- (void)_writeDefaultWhatsNewDidShow
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CKOnboardingController *)self _whatsNewVersion];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int64_t v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Writing WhatsNewInMessagessVersion %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  int v5 = [(CKOnboardingController *)self _userDefaults];
  [v5 setInteger:v3 forKey:@"whatsNewInMessagesVersion"];
}

- (void)_writeDefaultNicknameOnboardingVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134218242;
      uint64_t v6 = 1;
      __int16 v7 = 2112;
      uint64_t v8 = @"NicknameOnboardingVersion";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }
  }
  id v4 = [(CKOnboardingController *)self _userDefaults];
  [v4 setInteger:1 forKey:@"NicknameOnboardingVersion"];
}

- (void)_writeDefaultSyndicationOnboardingVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134218242;
      uint64_t v6 = 3;
      __int16 v7 = 2112;
      uint64_t v8 = @"SyndicationOnboardingVersion";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }
  }
  id v4 = [(CKOnboardingController *)self _userDefaults];
  [v4 setInteger:3 forKey:@"SyndicationOnboardingVersion"];
}

- (void)_writeDefaultCollaborationOnboardingVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134218242;
      uint64_t v6 = 1;
      __int16 v7 = 2112;
      uint64_t v8 = @"CollaborationOnboardingVersion";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Writing %li for %@", (uint8_t *)&v5, 0x16u);
    }
  }
  id v4 = [(CKOnboardingController *)self _userDefaults];
  [v4 setInteger:1 forKey:@"CollaborationOnboardingVersion"];
}

- (int64_t)_whatsNewVersion
{
  return 5;
}

- (int64_t)_whatsNewLatestShippingVersion
{
  return 5;
}

- (id)_meCardSharingState
{
  return (id)[MEMORY[0x1E4F6E820] sharedInstance];
}

- (BOOL)_meCardSharingEnabled
{
  uint64_t v2 = [(CKOnboardingController *)self _meCardSharingState];
  char v3 = [v2 sharingEnabled];

  return v3;
}

- (unint64_t)_meCardSharingNameFormat
{
  uint64_t v2 = [(CKOnboardingController *)self _meCardSharingState];
  unint64_t v3 = [v2 nameFormat];

  return v3;
}

- (unint64_t)_meCardSharingAudience
{
  uint64_t v2 = [(CKOnboardingController *)self _meCardSharingState];
  unint64_t v3 = [v2 sharingAudience];

  return v3;
}

- (void)sharingPickerDidFinish:(id)a3
{
  id v7 = a3;
  if ([v7 sharingEnabled])
  {
    id v4 = [(CKOnboardingController *)self _meCardSharingState];
    objc_msgSend(v4, "setSharingEnabled:", objc_msgSend(v7, "sharingEnabled"));

    int v5 = [(CKOnboardingController *)self _meCardSharingState];
    objc_msgSend(v5, "setSharingAudience:", objc_msgSend(v7, "selectedSharingAudience"));

    uint64_t v6 = [(CKOnboardingController *)self _meCardSharingState];
    objc_msgSend(v6, "setNameFormat:", objc_msgSend(v7, "selectedNameFormat"));
  }
  [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  [(CKOnboardingController *)self setAvatarRecord:a4];

  [(CKOnboardingController *)self pushNameAndPhotoSharingIntroStepIfNeeded];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4 = [(CKOnboardingController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)meCardSharingOnboardingEditController:(id)a3 didFinishWithOnboardingResult:(id)a4
{
  [(CKOnboardingController *)self setPendingMeCardSharingResult:a4];

  [(CKOnboardingController *)self pushNameAndPhotoSharingConfigSharingPreferenceStep];
}

- (void)meCardSharingOnboardingAudienceViewControllerDidFinish:(id)a3 withSharingAudience:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CKOnboardingController *)self _meCardSharingState];
  [v7 setSharingEnabled:1];

  uint64_t v8 = [(CKOnboardingController *)self _meCardSharingState];
  [v8 setSharingAudience:a4];

  uint64_t v9 = [(CKOnboardingController *)self pendingMeCardSharingResult];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [(CKOnboardingController *)self pendingMeCardSharingResult];
        int v14 = 134218242;
        unint64_t v15 = a4;
        __int16 v16 = 2112;
        long long v17 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Sharing audience chosen: %lu, sharing enabled, uploading pending me card sharing result: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    uint64_t v12 = [(CKOnboardingController *)self _nicknameController];
    uint64_t v13 = [(CKOnboardingController *)self pendingMeCardSharingResult];
    [v12 updatePersonalNicknameIfNecessaryWithMeCardSharingResult:v13];
  }
  [(CKOnboardingController *)self showAppleIntelligenceOnboardingStepIfNeeded];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_memojiCreationController != a4)
  {
    id v5 = [(CKOnboardingController *)self memojiVideoPlayer];
    [v5 pause];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_memojiCreationController == a4)
  {
    id v5 = [(CKOnboardingController *)self memojiVideoPlayer];
    [v5 play];
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (IMCloudKitSyncState)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(id)a3
{
}

- (int)micLayout
{
  return self->_micLayout;
}

- (void)setMicLayout:(int)a3
{
  self->_micLayout = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void)setAppleIntelligenceOnboardingController:(id)a3
{
}

- (void)setMemojiCreationController:(id)a3
{
}

- (AVPlayer)memojiVideoPlayer
{
  return self->_memojiVideoPlayer;
}

- (void)setMemojiVideoPlayer:(id)a3
{
}

- (AVPlayerLooper)memojiVideoPlayerLooper
{
  return self->_memojiVideoPlayerLooper;
}

- (void)setMemojiVideoPlayerLooper:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (IMCNMeCardSharingResult)pendingMeCardSharingResult
{
  return self->_pendingMeCardSharingResult;
}

- (void)setPendingMeCardSharingResult:(id)a3
{
}

- (CKCNSharingProfileOnboardingFlowManager)nicknameFlowManager
{
  return self->_nicknameFlowManager;
}

- (void)setNicknameFlowManager:(id)a3
{
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
}

- (CKCNSharedProfileOnboardingController)sharedProfileOnboardingController
{
  return self->_sharedProfileOnboardingController;
}

- (void)setSharedProfileOnboardingController:(id)a3
{
}

- (BOOL)presentingFromPrefs
{
  return self->_presentingFromPrefs;
}

- (void)setPresentingFromPrefs:(BOOL)a3
{
  self->_presentingFromPrefs = a3;
}

- (BOOL)isUserInitiatedEditNameAndPhoto
{
  return self->_isUserInitiatedEditNameAndPhoto;
}

- (void)setIsUserInitiatedEditNameAndPhoto:(BOOL)a3
{
  self->_isUserInitiatedEditNameAndPhoto = a3;
}

- (void)setSyndicationIntroController:(id)a3
{
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
}

@end