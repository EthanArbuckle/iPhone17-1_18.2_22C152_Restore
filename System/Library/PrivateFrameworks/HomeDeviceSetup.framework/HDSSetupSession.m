@interface HDSSetupSession
+ (OS_os_log)signpostLog;
- (BOOL)_isPreflightError:(id)a3;
- (BOOL)_isVoiceRecognitionSupported;
- (BOOL)_recognizeVoiceAlreadyEnabled;
- (BOOL)_roomHasOdeonConfig:(id)a3;
- (BOOL)_shouldShowPRCardForHomePodsInRoom;
- (BOOL)acceptedMusicTerms;
- (BOOL)delayForOdeonStereoPair;
- (BOOL)forceSoftwareUpdateForADP;
- (BOOL)hasExistingHomePod;
- (BOOL)hasExistingHomePodInAccount;
- (BOOL)hasMultipleUsers;
- (BOOL)homePodBuildRequiresADPForcedSU;
- (BOOL)homePodCanSUNoSetup;
- (BOOL)homePodIsSUNoSetup;
- (BOOL)homePodNeedsSUBeforeSetup;
- (BOOL)homePodSaysNeedsSUNoSetup;
- (BOOL)homePodSoftwareUpdateNonSetupWasCompleted;
- (BOOL)isCLIMode;
- (BOOL)isCompanionSiriLanguageSupportedByHomePod;
- (BOOL)isHPApp;
- (BOOL)isJSEnabled;
- (BOOL)liveOn;
- (BOOL)pauseAfterPreAuth;
- (BOOL)selectedRoomHasHomePods;
- (BOOL)shouldDoSysDrop:(unsigned int)a3;
- (BOOL)shouldShowHomePodSoftwareUpdateAvailable;
- (BOOL)siriDataSharingEnabled;
- (BOOL)sysDropProfileInstalled;
- (BOOL)touchRemoteEnabled;
- (BOOL)userOptedToHH2;
- (HDSSetupSession)init;
- (HMHome)selectedHome;
- (NSArray)availableHomes;
- (NSDictionary)additionalMetrics;
- (NSDictionary)preAuthResponse;
- (NSError)mainError;
- (NSString)appleIDPassword;
- (NSString)selectedSiriLanguageCode;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SysDropSession)sysDropSession;
- (UIViewController)presentingChildViewController;
- (UIViewController)presentingViewController;
- (double)homePodSUNoSetupEstTime;
- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4;
- (id)_homePodsInAccount;
- (id)_homePodsInSelectedHome;
- (id)_selectedRoomAllHomePods;
- (id)_selectedRoomAllStereoPairs;
- (id)_selectedRoomHomePod;
- (id)deviceColorFoundHandler;
- (id)fetchHomePodLoggingProfile;
- (id)preAuthHandler;
- (id)progressHandler;
- (id)promptForAppleMusicHandler;
- (id)promptForAutomaticSoftwareUpdateHandler;
- (id)promptForCaptiveNetworkHandler;
- (id)promptForHomeHandler;
- (id)promptForHomePodSoftwareUpdateNonSetupAck;
- (id)promptForHomePodSoftwareUpdateNonSetupCancelled;
- (id)promptForHomePodSoftwareUpdateNonSetupCompleted;
- (id)promptForHomeiCloudHandler;
- (id)promptForLocationAlreadyEnabledHandler;
- (id)promptForLocationEnableHandler;
- (id)promptForLoggingProfileTransferAck;
- (id)promptForPINHandler;
- (id)promptForPersonalRequestsHandler;
- (id)promptForRoomHandlerDetailed;
- (id)promptForSetupCompletionHandler;
- (id)promptForSetupPSGHandler;
- (id)promptForSiriEnableHandler;
- (id)promptForSiriLanguageHandler;
- (id)promptForSiriVoiceSelectionHandler;
- (id)promptForSoftwareUpdateHandler;
- (id)promptForSoundRecognitionHandler;
- (id)promptForStereoMultipleHandler;
- (id)promptForStereoRoleHandler;
- (id)promptForTVAudioHandler;
- (id)promptForTermsAndConditionsV2Disagree;
- (id)promptForTermsHandler;
- (id)promptForVoiceRecognitionHandler;
- (id)promptForiTunesSignInHandler;
- (id)promptToInstallHomeAppHandler;
- (id)promptToShareSettingsHandler;
- (id)selectedRoom;
- (int)_enableSiriForPersonalRequestIfNecessary;
- (int)_runAppleMusic;
- (int)_runAudioPasscode;
- (int)_runAuthKitTrustFinish;
- (int)_runAutomaticSoftwareUpdate;
- (int)_runBackgroundActivation;
- (int)_runBasicConfig;
- (int)_runBonjourTest;
- (int)_runCDPSetup:(BOOL)a3;
- (int)_runCaptiveJoin;
- (int)_runCheckAccount;
- (int)_runFinishStart;
- (int)_runForcedHomePodSoftwareUpdateNonSetup;
- (int)_runHomeKitSetup;
- (int)_runHomeKitUserInput;
- (int)_runHomePodLoggingProfileTransfer;
- (int)_runHomePodLoggingProfileTransferAck;
- (int)_runHomePodSoftwareUpdate;
- (int)_runHomePodSoftwareUpdateNonSetupAcknowledgement;
- (int)_runHomePodSoftwareUpdateNonSetupCancelled;
- (int)_runHomePodSoftwareUpdateNonSetupComplete;
- (int)_runLEDPassCodeAlignment;
- (int)_runMultiUserEnable;
- (int)_runPairSetup;
- (int)_runPersonalRequests;
- (int)_runPreAuth;
- (int)_runPreAuthAlignmentAndSiri;
- (int)_runPreflightCDP;
- (int)_runPreflightJSCheck;
- (int)_runPreflightMisc;
- (int)_runPreflightWiFi;
- (int)_runPreflightiCloud;
- (int)_runPreflightiTunes;
- (int)_runRecognizeVoice;
- (int)_runSFSessionStart;
- (int)_runSetupPSG;
- (int)_runShareSettings;
- (int)_runSiriEnablementConfigurationFetch;
- (int)_runSiriForEveryone;
- (int)_runSiriLanguage;
- (int)_runSiriPasscode;
- (int)_runSoftwareUpdate;
- (int)_runSoundRecognition;
- (int)_runStereoPairUserInput;
- (int)_runTRActivation;
- (int)_runTRAuthentication:(id)a3;
- (int)_runTROtherAuthentication;
- (int)_runTRSessionStart;
- (int)_runTRSetupConfiguration;
- (int)_runTRiCloudAuthentication;
- (int)_runTVAudioUserInput;
- (int)_runTerms;
- (int)_runWiFiSetup;
- (int)bonjourTestState;
- (int)exportAMSTokenAndAccountSetup:(id)a3 ifMissing:(BOOL)a4 ifInvalid:(BOOL)a5;
- (int)expressSetupState;
- (int)homePodProductVersion;
- (int)homePodSUNoSetupState;
- (int)homePodSUState;
- (int)isHomePodProductVersionParis:(id)a3;
- (int64_t)roomHomePodStereoPairCount;
- (unint64_t)_peerDeviceSupportedStereoPairVersions;
- (unint64_t)delayForOdeonStereoPairSeconds;
- (unint64_t)peerFeatureFlags;
- (unint64_t)signpostID;
- (unint64_t)testFlags;
- (unsigned)stereoCounterpartColor;
- (void)_activate;
- (void)_cleanup;
- (void)_cleanupSession;
- (void)_getSiriEnablementConfiguration;
- (void)_handlePeerEvent:(id)a3 flags:(unsigned int)a4;
- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3;
- (void)_invalidate;
- (void)_logErrorMetrics:(id)a3 inLabel:(id)a4;
- (void)_logHomeKitPerformanceMetrics;
- (void)_logMetrics:(id)a3;
- (void)_logMetricsForSoftError:(id)a3 label:(id)a4;
- (void)_logPerformanceMetrics:(id)a3;
- (void)_logUsageMetrics:(id)a3;
- (void)_logWiFiRetryMetrics:(id)a3;
- (void)_logiTunesAuthRetryMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 retryAttempt:(int)a6;
- (void)_preflightAppleMusicCompleted:(int)a3;
- (void)_promptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_reportError:(id)a3 label:(id)a4;
- (void)_run;
- (void)_runAudioPasscodeCleanup:(BOOL)a3;
- (void)_runAudioPasscodeHandleData:(id)a3;
- (void)_runAudioPasscodeInitRequest;
- (void)_runAudioPasscodeInitResponse:(id)a3 error:(id)a4;
- (void)_runAudioPasscodeLogMetrics;
- (void)_runAudioPasscodeStartRequest;
- (void)_runAudioPasscodeStartResponse:(id)a3 error:(id)a4;
- (void)_runAudioPasscodeStopRequest;
- (void)_runAudioPasscodeTimeout;
- (void)_runAuthKitTrustStartIfNeeded;
- (void)_runBasicConfigReceiveResponse:(id)a3 error:(id)a4;
- (void)_runBasicConfigSendRequest;
- (void)_runFinishRequest;
- (void)_runFinishResponse:(id)a3 error:(id)a4;
- (void)_runHomeKitSetupMode;
- (void)_runMultiUserEnableEnableSettingStart:(id)a3 privateSettings:(BOOL)a4;
- (void)_runMultiUserEnableHome;
- (void)_runPersonalRequestsSkipCard;
- (void)_runPreAuthRequest;
- (void)_runPreAuthResponse:(id)a3 error:(id)a4;
- (void)_runRecognizeVoiceCheckLanguageResponse:(id)a3 error:(id)a4;
- (void)_runRecognizeVoiceCheckLanguageStart;
- (void)_runRecognizeVoiceCheckVoiceProfileResponse:(BOOL)a3 error:(id)a4;
- (void)_runRecognizeVoiceCheckVoiceProfileStart;
- (void)_runSiriPasscodeInitRequest;
- (void)_runSiriPasscodeInitResponse:(id)a3 error:(id)a4;
- (void)_runSiriPasscodeStartPairSetup;
- (void)_runStereoPairUserInputPickColors:(BOOL)a3;
- (void)_setupAudio;
- (void)_speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5;
- (void)_startSysDropLoggingProfileRequest;
- (void)_startSysDropMode:(id)a3;
- (void)_startSysDropSysdiagnoseRequest:(id)a3;
- (void)_updateSFSessionErrorHandlerForSUBS;
- (void)activate;
- (void)appleMusicNext;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionInterrupted:(id)a3;
- (void)automaticSoftwareUpdatesAgreed:(BOOL)a3;
- (void)cancelSoftwareUpdateNoSetup;
- (void)captiveConfirmed;
- (void)dealloc;
- (void)didDismiss;
- (void)disconnect;
- (void)fetchLocationServicesEnabled;
- (void)fetchTermsAndConditionsServerStatus;
- (void)forceCLIPassCode:(id)a3;
- (void)forcePassCode:(id)a3;
- (void)homeAppInstallChoice:(BOOL)a3;
- (void)homeKitReselectHome;
- (void)homeKitSelectHome:(id)a3;
- (void)homeKitSelectRoom:(id)a3;
- (void)homePodLoggingProfileSelected:(int)a3;
- (void)homePodSoftwareUpdateNonSetupAcknowledged;
- (void)homePodSoftwareUpdateNonSetupDidComplete;
- (void)homeiCloudEnable;
- (void)identifyHomePod:(id)a3;
- (void)invalidate;
- (void)isDeviceActiveFetch;
- (void)ledPasscodeMatched;
- (void)loadMultiUserSupportedLanguages;
- (void)locationEnable:(BOOL)a3;
- (void)logMetricsForDismissal:(id)a3 dismissType:(int)a4 cardName:(id)a5 cardDuration:(unint64_t)a6;
- (void)pairSetupTryPIN:(id)a3;
- (void)personalRequestsEnabled:(BOOL)a3;
- (void)playAudioPasscodeAgain;
- (void)preflight;
- (void)preflightAppleMusic;
- (void)psgSelected:(BOOL)a3;
- (void)recognizeVoiceAnswered:(BOOL)a3;
- (void)removeSysDropProfile;
- (void)runHomeKitSUPreAuthResponse:(id)a3;
- (void)runPersonalRequestsAgreedCLI:(BOOL)a3 makeActiveDevice:(BOOL)a4;
- (void)runSUNoSetupPreAuthResponse:(id)a3;
- (void)setAcceptedMusicTerms:(BOOL)a3;
- (void)setAdditionalMetrics:(id)a3;
- (void)setAppleIDPassword:(id)a3;
- (void)setAvailableHomes:(id)a3;
- (void)setDelayForOdeonStereoPair:(BOOL)a3;
- (void)setDelayForOdeonStereoPairSeconds:(unint64_t)a3;
- (void)setDeviceColorFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setForceSoftwareUpdateForADP:(BOOL)a3;
- (void)setHasExistingHomePod:(BOOL)a3;
- (void)setHasExistingHomePodInAccount:(BOOL)a3;
- (void)setHomePodCanSUNoSetup:(BOOL)a3;
- (void)setHomePodIsSUNoSetup:(BOOL)a3;
- (void)setHomePodProductVersion:(int)a3;
- (void)setHomePodSUNoSetupEstTime:(double)a3;
- (void)setHomePodSUNoSetupState:(int)a3;
- (void)setHomePodSUState:(int)a3;
- (void)setHomePodSaysNeedsSUNoSetup:(BOOL)a3;
- (void)setHomePodSoftwareUpdateNonSetupWasCompleted:(BOOL)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setIsHPApp:(BOOL)a3;
- (void)setLiveOn:(BOOL)a3;
- (void)setMainError:(id)a3;
- (void)setPauseAfterPreAuth:(BOOL)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPeerFeatureFlags:(unint64_t)a3;
- (void)setPreAuthHandler:(id)a3;
- (void)setPresentingChildViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForAppleMusicHandler:(id)a3;
- (void)setPromptForAutomaticSoftwareUpdateHandler:(id)a3;
- (void)setPromptForCaptiveNetworkHandler:(id)a3;
- (void)setPromptForHomeHandler:(id)a3;
- (void)setPromptForHomePodSoftwareUpdateNonSetupAck:(id)a3;
- (void)setPromptForHomePodSoftwareUpdateNonSetupCancelled:(id)a3;
- (void)setPromptForHomePodSoftwareUpdateNonSetupCompleted:(id)a3;
- (void)setPromptForHomeiCloudHandler:(id)a3;
- (void)setPromptForLocationAlreadyEnabledHandler:(id)a3;
- (void)setPromptForLocationEnableHandler:(id)a3;
- (void)setPromptForLoggingProfileTransferAck:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setPromptForPersonalRequestsHandler:(id)a3;
- (void)setPromptForRoomHandlerDetailed:(id)a3;
- (void)setPromptForSetupCompletionHandler:(id)a3;
- (void)setPromptForSetupPSGHandler:(id)a3;
- (void)setPromptForSiriEnableHandler:(id)a3;
- (void)setPromptForSiriLanguageHandler:(id)a3;
- (void)setPromptForSiriVoiceSelectionHandler:(id)a3;
- (void)setPromptForSoftwareUpdateHandler:(id)a3;
- (void)setPromptForSoundRecognitionHandler:(id)a3;
- (void)setPromptForStereoMultipleHandler:(id)a3;
- (void)setPromptForStereoRoleHandler:(id)a3;
- (void)setPromptForTVAudioHandler:(id)a3;
- (void)setPromptForTermsAndConditionsV2Disagree:(id)a3;
- (void)setPromptForTermsHandler:(id)a3;
- (void)setPromptForVoiceRecognitionHandler:(id)a3;
- (void)setPromptForiTunesSignInHandler:(id)a3;
- (void)setPromptToInstallHomeAppHandler:(id)a3;
- (void)setPromptToShareSettingsHandler:(id)a3;
- (void)setSysDropMode:(BOOL)a3;
- (void)setSysDropSession:(id)a3;
- (void)setTestFlags:(unint64_t)a3;
- (void)setTouchRemoteEnabled:(BOOL)a3;
- (void)setUserOptedToHH2:(BOOL)a3;
- (void)shareSettingsAgreed;
- (void)showMeDeviceSwitchWithDevice:(id)a3 session:(id)a4 siriEnabled:(BOOL)a5 activeDeviceEnabled:(BOOL)a6;
- (void)siriCheck:(BOOL)a3;
- (void)siriEnable;
- (void)siriForEveryoneAnswered;
- (void)siriForiCloudRecognizeAnswered:(BOOL)a3;
- (void)siriLanguagePicked:(id)a3;
- (void)siriVoicePicked:(id)a3;
- (void)skipAudioPasscode;
- (void)skipiTunesSignIn;
- (void)softwareUpdateAgreed:(BOOL)a3;
- (void)soundRecognitionAgreed:(BOOL)a3;
- (void)speakPasscodeWithCompletion:(id)a3;
- (void)speakPasscodeWithInstructions:(id)a3 completion:(id)a4;
- (void)speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5;
- (void)speakPasscodeWithLanguageCode:(id)a3 completion:(id)a4;
- (void)startAirDropSysdiagnose;
- (void)stereoMultiplePicked:(id)a3;
- (void)stereoRolePicked:(int)a3;
- (void)termsAgreed;
- (void)tvAudioEnabled:(BOOL)a3;
@end

@implementation HDSSetupSession

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupSession_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1) {
    dispatch_once(&signpostLog_onceToken_2, block);
  }
  v2 = (void *)signpostLog_log_2;
  return (OS_os_log *)v2;
}

void __30__HDSSetupSession_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (HDSSetupSession)init
{
  v12.receiver = self;
  v12.super_class = (Class)HDSSetupSession;
  v2 = [(HDSSetupSession *)&v12 init];
  id v3 = v2;
  if (v2)
  {
    v2->_amsOptimizationSecs = 0.0;
    uint64_t v4 = CUMainQueue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_proxSetupActiveToken = -1;
    v3->_homePodSUState = 0;
    v3->_automaticSoftwareUpdateAgreed = 0;
    v3->_softwareUpdateAgreed = 0;
    v3->_odeonState = 0;
    v3->_rmvSelectionState = 0;
    *(_OWORD *)&v3->_siriSettingState = 0u;
    uint64_t v6 = objc_opt_new();
    sessionID = v3->_sessionID;
    v3->_sessionID = (NSUUID *)v6;

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = objc_alloc_init(SysDropSession);
    sysDropSession = v3->_sysDropSession;
    v3->_sysDropSession = v8;

    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    id v3 = (HDSSetupSession *)FatalErrorF();
    [(HDSSetupSession *)v3 _cleanup];
  }
  else
  {
    [(HDSSetupSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)HDSSetupSession;
    [(HDSSetupSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  int proxSetupActiveToken = self->_proxSetupActiveToken;
  if (proxSetupActiveToken != -1)
  {
    notify_set_state(proxSetupActiveToken, 0);
    notify_post("com.apple.sharing.wha-prox-setup");
    notify_cancel(self->_proxSetupActiveToken);
    self->_int proxSetupActiveToken = -1;
  }
  [(HDSSetupSession *)self _cleanupSession];
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    id v5 = self->_progressHandler;
  }
  else
  {
    id v5 = 0;
  }
  self->_progressHandler = 0;

  cdpEncryptionHelper = self->_cdpEncryptionHelper;
  self->_cdpEncryptionHelper = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  id preAuthHandler = self->_preAuthHandler;
  self->_id preAuthHandler = 0;

  id promptForAppleMusicHandler = self->_promptForAppleMusicHandler;
  self->_id promptForAppleMusicHandler = 0;

  id promptForHomeHandler = self->_promptForHomeHandler;
  self->_id promptForHomeHandler = 0;

  id promptForHomeiCloudHandler = self->_promptForHomeiCloudHandler;
  self->_id promptForHomeiCloudHandler = 0;

  id promptForiTunesSignInHandler = self->_promptForiTunesSignInHandler;
  self->_id promptForiTunesSignInHandler = 0;

  id promptForLocationEnableHandler = self->_promptForLocationEnableHandler;
  self->_id promptForLocationEnableHandler = 0;

  id promptForPersonalRequestsHandler = self->_promptForPersonalRequestsHandler;
  self->_id promptForPersonalRequestsHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id promptForRoomHandlerDetailed = self->_promptForRoomHandlerDetailed;
  self->_id promptForRoomHandlerDetailed = 0;

  id promptForSiriEnableHandler = self->_promptForSiriEnableHandler;
  self->_id promptForSiriEnableHandler = 0;

  id promptForSoundRecognitionHandler = self->_promptForSoundRecognitionHandler;
  self->_id promptForSoundRecognitionHandler = 0;

  id promptForTermsHandler = self->_promptForTermsHandler;
  self->_id promptForTermsHandler = 0;

  id promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_id promptToInstallHomeAppHandler = 0;

  id promptToShareSettingsHandler = self->_promptToShareSettingsHandler;
  self->_id promptToShareSettingsHandler = 0;

  id promptForSiriLanguageHandler = self->_promptForSiriLanguageHandler;
  self->_id promptForSiriLanguageHandler = 0;

  id promptForStereoRoleHandler = self->_promptForStereoRoleHandler;
  self->_id promptForStereoRoleHandler = 0;

  id promptForStereoMultipleHandler = self->_promptForStereoMultipleHandler;
  self->_id promptForStereoMultipleHandler = 0;

  id promptForTVAudioHandler = self->_promptForTVAudioHandler;
  self->_id promptForTVAudioHandler = 0;
}

- (void)_cleanupSession
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  sysDropSession = self->_sysDropSession;
  if (sysDropSession) {
    [(SysDropSession *)sysDropSession invalidate];
  }
  [(HDSSetupSession *)self _runAudioPasscodeCleanup:1];
  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_trOperations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "cancel", (void)v19);
        [v10 setCompletionBlock:0];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_trOperations removeAllObjects];
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  [(TRSession *)self->_trSession setDisconnectHandler:0];
  [(TRSession *)self->_trSession disconnect];
  trSession = self->_trSession;
  self->_trSession = 0;

  self->_trAuthenticationStateReset = 0;
  [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  [(HDSBonjourTest *)self->_bonjourTestOperation invalidate];
  bonjourTestOperation = self->_bonjourTestOperation;
  self->_bonjourTestOperation = 0;

  [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HDSSetupSession_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HDSSetupSession_activate__block_invoke(uint64_t a1)
{
  os_log_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[8]) {
    return [v1 _run];
  }
  else {
    return [v1 _activate];
  }
}

- (void)_activate
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v76 = 0;
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  notify_register_check("com.apple.sharing.wha-prox-setup", &self->_proxSetupActiveToken);
  notify_set_state(self->_proxSetupActiveToken, 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  [(HDSSetupSession *)self preflightAppleMusic];
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  self->_apcEnabled = v5;
  uint64_t v6 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  BOOL v8 = !v7;
  self->_appleMusicEnabled = v8;
  self->_appleMusicForce = CFPrefs_GetInt64() != 0;
  self->_forceSoftwareUpdate = CFPrefs_GetInt64() != 0;
  uint64_t v9 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  BOOL v11 = !v10;
  self->_audioProgress = v11;
  uint64_t v12 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v12 == 0;
  }
  BOOL v14 = !v13;
  self->_cdpEnabled = v14;
  uint64_t v15 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15 == 0;
  }
  BOOL v17 = !v16;
  self->_prefTVAudioEnabled = v17;
  if (v16
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v18 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  BOOL v20 = !v19;
  self->_prefBonjourTest = v20;
  uint64_t v21 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21 == 0;
  }
  BOOL v23 = !v22;
  self->_preflightEnabled = v23;
  self->_prefForceSiriGreeting = CFPrefs_GetInt64() != 0;
  uint64_t v24 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = v24 == 0;
  }
  BOOL v26 = !v25;
  self->_prefLEDPasscodeEnabled = v26;
  uint64_t v27 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v28 = 0;
  }
  else {
    BOOL v28 = v27 == 0;
  }
  BOOL v29 = !v28;
  self->_prefMultiUser = v29;
  uint64_t v30 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v31 = 0;
  }
  else {
    BOOL v31 = v30 == 0;
  }
  BOOL v32 = !v31;
  self->_prefStereoPairEnabled = v32;
  uint64_t v33 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = v33 == 0;
  }
  BOOL v35 = !v34;
  self->_prefStereoWait = v35;
  uint64_t v36 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v37 = 0;
  }
  else {
    BOOL v37 = v36 == 0;
  }
  BOOL v38 = !v37;
  self->_preventAppleWiFuint64_t i = v38;
  uint64_t v39 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v40 = 0;
  }
  else {
    BOOL v40 = v39 == 0;
  }
  BOOL v41 = !v40;
  self->_siriPasscodeEnabled = v41;
  int v42 = self->_appleStoreMode | CFPrefs_GetInt64();
  if (v76) {
    int v42 = 0;
  }
  self->_appleStoreMode = v42;
  uint64_t v43 = CFPrefs_GetInt64();
  if (v76) {
    BOOL v44 = 1;
  }
  else {
    BOOL v44 = v43 == 0;
  }
  BOOL v45 = !v44;
  self->_prefPrototypeForceUpdate = v45;
  v46 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.HomeDeviceSetup"];
  int jsDefaultDisabled = [v46 BOOLForKey:@"hdsDisableJS"];
  self->_int jsDefaultDisabled = jsDefaultDisabled;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_103;
      }
      int jsDefaultDisabled = self->_jsDefaultDisabled;
    }
    v48 = "yes";
    if (!jsDefaultDisabled) {
      v48 = "no";
    }
    v68 = v48;
    LogPrintF();
  }
LABEL_103:
  self->_skipWiFiSetup = CFPrefs_GetInt64() != 0;
  if (v76)
  {
    int IsVirtualMachine = SFDeviceIsVirtualMachine();
    self->_skipWiFiSetup = IsVirtualMachine;
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_110;
        }
        int IsVirtualMachine = self->_skipWiFiSetup;
      }
      v50 = "yes";
      if (!IsVirtualMachine) {
        v50 = "no";
      }
      v68 = v50;
      LogPrintF();
    }
  }
LABEL_110:
  uint64_t v51 = CFPrefs_GetInt64();
  unint64_t v52 = 5;
  if (!v76) {
    unint64_t v52 = v51;
  }
  self->_wifiMaxAttempts = v52;
  uint64_t v53 = CFPrefs_GetInt64();
  if (v76) {
    unint64_t v54 = 1;
  }
  else {
    unint64_t v54 = v53;
  }
  self->_wifiRetryDelay = v54;
  [(HDSSetupSession *)self isDeviceActiveFetch];
  [(HDSSetupSession *)self fetchTermsAndConditionsServerStatus];
  [(HDSSetupSession *)self loadMultiUserSupportedLanguages];
  BOOL enablementProfileInstalled = [(HDSSetupSession *)self sysDropProfileInstalled];
  self->_BOOL enablementProfileInstalled = enablementProfileInstalled;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_121;
      }
      BOOL enablementProfileInstalled = self->_enablementProfileInstalled;
    }
    v56 = "yes";
    if (!enablementProfileInstalled) {
      v56 = "no";
    }
    v69 = v56;
    LogPrintF();
  }
LABEL_121:
  id v57 = objc_alloc_init(getAFSettingsConnectionClass_0());
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __28__HDSSetupSession__activate__block_invoke;
  v74[3] = &unk_265040348;
  v74[4] = self;
  id v58 = v57;
  id v75 = v58;
  [v58 getSiriDataSharingOptInStatusWithCompletion:v74];
  objc_initWeak(&location, self);
  v59 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v59;

  [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:self->_dispatchQueue];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __28__HDSSetupSession__activate__block_invoke_2;
  v71[3] = &unk_265040370;
  objc_copyWeak(&v72, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceFoundHandler:v71];
  v61 = self->_companionLinkClient;
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __28__HDSSetupSession__activate__block_invoke_3;
  v70[3] = &unk_26503F7B8;
  v70[4] = self;
  [(RPCompanionLinkClient *)v61 activateWithCompletion:v70];
  v62 = [(objc_class *)getSSAccountStoreClass() defaultStore];
  v63 = [v62 activeAccount];
  iTunesAccount = self->_iTunesAccount;
  self->_iTunesAccount = v63;

  v65 = [(SSAccount *)self->_iTunesAccount accountName];
  iTunesUserID = self->_iTunesUserID;
  self->_iTunesUserID = v65;

  [(HDSSetupSession *)self _setupAudio];
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 10, 0);
  }
  if (self->_isCLIMode)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_132;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_132:
  [(HDSSetupSession *)self _run];
  objc_destroyWeak(&v72);
  objc_destroyWeak(&location);
}

uint64_t __28__HDSSetupSession__activate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5) {
    id v5 = (id)[*(id *)(a1 + 32) _logMetricsForSoftError:v5 label:@"Activate"];
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (id v5 = (id)_LogCategory_Initialize(), v5)) {
      id v5 = (id)LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (id v5 = (id)_LogCategory_Initialize(), v5)) {
        id v5 = (id)LogPrintF();
      }
    }
  }
  if (a3 == 2) {
    int v6 = 5;
  }
  else {
    int v6 = 0;
  }
  if (a3 == 1) {
    int v6 = 6;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 544) = v6;
  return MEMORY[0x270F9A790](v5);
}

void __28__HDSSetupSession__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained deviceColorFoundHandler];
    int v6 = [v9 deviceColor];
    BOOL v7 = [v9 model];
    int v8 = [v7 hasPrefix:@"AudioAccessory5,1"];

    if (v8 && v6 && v5) {
      ((void (**)(void, void *))v5)[2](v5, v6);
    }
  }
}

void __28__HDSSetupSession__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  [(AVAudioPlayer *)self->_audioPlayerStart stop];
  [(AVAudioPlayer *)self->_audioPlayerStart setDelegate:0];
  audioPlayerStart = self->_audioPlayerStart;
  self->_audioPlayerStart = 0;

  [(AVAudioPlayer *)self->_audioPlayerStep stop];
  [(AVAudioPlayer *)self->_audioPlayerStep setDelegate:0];
  audioPlayerStep = self->_audioPlayerStep;
  self->_audioPlayerStep = 0;

  if (self->_audioSession)
  {
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    int v6 = getAVAudioSessionInterruptionNotification();
    [v5 removeObserver:self name:v6 object:self->_audioSession];

    audioSession = self->_audioSession;
    id v13 = 0;
    BOOL v8 = [(AVAudioSession *)audioSession setActive:0 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      [(HDSSetupSession *)self _logMetricsForSoftError:v9 label:@"Invalidate"];
      if (gLogCategory_HDSSetupSession <= 50
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v12 = v9;
        LogPrintF();
      }
    }
    BOOL v10 = self->_audioSession;
    self->_audioSession = 0;
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  [(HDSSetupSession *)self _cleanup];
}

- (void)appleMusicNext
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HDSSetupSession_appleMusicNext__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HDSSetupSession_appleMusicNext__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 208))
  {
    v2 = [(id)objc_opt_class() signpostLog];
    uint64_t v3 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AppleMusic", "", buf, 2u);
      }
    }
  }
  id v5 = [(id)objc_opt_class() signpostLog];
  uint64_t v6 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)id v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "AppleMusic", "", v9, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 208) = 4;
  return [*(id *)(a1 + 32) _run];
}

- (void)homePodSoftwareUpdateNonSetupAcknowledged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_homePodSoftwareUpdateNonSetupAcknowledged__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSSetupSession_homePodSoftwareUpdateNonSetupAcknowledged__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1332) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)homePodSoftwareUpdateNonSetupDidComplete
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HDSSetupSession_homePodSoftwareUpdateNonSetupDidComplete__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__HDSSetupSession_homePodSoftwareUpdateNonSetupDidComplete__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1457) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)disconnect
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_disconnect__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HDSSetupSession_disconnect__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 288) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 288);
  *(void *)(v2 + 288) = 0;
}

- (void)homeAppInstallChoice:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__HDSSetupSession_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_26503F8C8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__HDSSetupSession_homeAppInstallChoice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 968) homeAppInstallChoice:*(unsigned __int8 *)(a1 + 40)];
}

- (void)homeiCloudEnable
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_homeiCloudEnable__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_homeiCloudEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 148) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)homeKitSelectHome:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__HDSSetupSession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__HDSSetupSession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 968) selectHome:*(void *)(a1 + 40)];
}

- (void)homeKitReselectHome
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_homeKitReselectHome__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__HDSSetupSession_homeKitReselectHome__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 968) reselectHome];
}

- (void)homeKitSelectRoom:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__HDSSetupSession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__HDSSetupSession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 968) selectRoom:*(void *)(a1 + 40)];
}

- (void)homePodLoggingProfileSelected:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSSetupSession_homePodLoggingProfileSelected___block_invoke;
  v4[3] = &unk_265040398;
  int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __49__HDSSetupSession_homePodLoggingProfileSelected___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1440) = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)ledPasscodeMatched
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HDSSetupSession_ledPasscodeMatched__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__HDSSetupSession_ledPasscodeMatched__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 453) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)locationEnable:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__HDSSetupSession_locationEnable___block_invoke;
  v4[3] = &unk_26503F8C8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__HDSSetupSession_locationEnable___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 220) = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 221) = 1;
  if (*(unsigned char *)(a1 + 40)) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1280) = v2;
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _run];
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HDSSetupSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__HDSSetupSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 288) pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)personalRequestsEnabled:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__HDSSetupSession_personalRequestsEnabled___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__HDSSetupSession_personalRequestsEnabled___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v2 = *(unsigned char *)(a1 + 40) == 0;
  if (*(unsigned char *)(a1 + 40)) {
    int v3 = 6;
  }
  else {
    int v3 = 5;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 520) = v3;
  if (v2) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1272) = v4;
  BOOL v5 = *(void **)(a1 + 32);
  return [v5 _run];
}

- (void)playAudioPasscodeAgain
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HDSSetupSession_playAudioPasscodeAgain__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__HDSSetupSession_playAudioPasscodeAgain__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 460;
  if (!*(unsigned char *)(v2 + 1154)) {
    uint64_t v3 = 416;
  }
  *(unsigned char *)(v2 + v3) = 1;
  int v4 = *(void **)(a1 + 32);
  return [v4 _run];
}

- (void)preflight
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__HDSSetupSession_preflight__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__HDSSetupSession_preflight__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = [(objc_class *)getSSAccountStoreClass() defaultStore];
  uint64_t v3 = [v2 activeAccount];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v3;

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 160) accountName];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 176);
  *(void *)(v7 + 176) = v6;
  return MEMORY[0x270F9A758](v6, v8);
}

- (void)preflightAppleMusic
{
  int v11 = 0;
  BOOL v3 = CFPrefs_GetInt64() == 0;
  BOOL v4 = !v3;
  self->_appleMusicEnabled = v4;
  if (!v3 && self->_iTunesAccount)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_appleMusicState = 1;
    id v5 = objc_alloc_init(getSKCloudServiceControllerClass());
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__HDSSetupSession_preflightAppleMusic__block_invoke;
    v10[3] = &unk_2650403C0;
    v10[4] = self;
    [v5 requestCapabilitiesWithCompletionHandler:v10];
    uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    appleMusicTimeoutTimer = self->_appleMusicTimeoutTimer;
    self->_appleMusicTimeoutTimer = v6;

    uint64_t v8 = self->_appleMusicTimeoutTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __38__HDSSetupSession_preflightAppleMusic__block_invoke_2;
    handler[3] = &unk_26503F6A8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    HDSDispatchTimerSet(self->_appleMusicTimeoutTimer, 15.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_appleMusicTimeoutTimer);
  }
}

void __38__HDSSetupSession_preflightAppleMusic__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v7 = v8;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_preflightAppleMusicCompleted:", 2, v7);
    [*(id *)(a1 + 32) setAcceptedMusicTerms:0];
    [*(id *)(a1 + 32) _logMetricsForSoftError:v8 label:@"Preflight-AppleMusic"];
    goto LABEL_25;
  }
  if (a2)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = 6;
    goto LABEL_22;
  }
  if ((a2 & 2) == 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = 2;
LABEL_22:
    [v5 _preflightAppleMusicCompleted:v6];
    goto LABEL_25;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _preflightAppleMusicCompleted:5];
  [*(id *)(a1 + 32) setAcceptedMusicTerms:1];
LABEL_25:
}

uint64_t __38__HDSSetupSession_preflightAppleMusic__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _preflightAppleMusicCompleted:2];
}

- (void)_preflightAppleMusicCompleted:(int)a3
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HDSSetupSession__preflightAppleMusicCompleted___block_invoke;
  v6[3] = &unk_265040398;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(dispatchQueue, v6);
}

void __49__HDSSetupSession__preflightAppleMusicCompleted___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(*(void *)(a1 + 32) + 200);
  if (!v1)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_8;
  }
  BOOL v3 = v1;
  dispatch_source_cancel(v3);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 24))
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_8:
    LogPrintF();
    return;
  }
  if (*(unsigned char *)(v6 + 192)) {
    int v7 = 5;
  }
  else {
    int v7 = *(_DWORD *)(a1 + 40);
  }
  *(_DWORD *)(v6 + 188) = v7;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v8 = *(void **)(a1 + 32);
    [v8 _run];
  }
}

- (BOOL)homePodBuildRequiresADPForcedSU
{
  return (self->_homePodProductVersion - 1) < 3;
}

- (void)recognizeVoiceAnswered:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HDSSetupSession_recognizeVoiceAnswered___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __42__HDSSetupSession_recognizeVoiceAnswered___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v2 = *(unsigned char *)(a1 + 40) == 0;
  if (*(unsigned char *)(a1 + 40)) {
    int v3 = 6;
  }
  else {
    int v3 = 5;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 504) = v3;
  if (v2) {
    int v4 = 3;
  }
  else {
    int v4 = 2;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1260) = v4;
  BOOL v5 = *(void **)(a1 + 32);
  return [v5 _run];
}

- (BOOL)homePodNeedsSUBeforeSetup
{
  int v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.HomeDeviceSetup"];
  char v4 = [v3 BOOLForKey:@"forceSUNoSetup"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v5 = (v4 & 1) != 0 || self->_homePodSaysNeedsSUNoSetup;

  return v5;
}

- (HMHome)selectedHome
{
  return [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation homeKitSelectedHome];
}

- (id)selectedRoom
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v3 = [(HDSSetupSession *)self selectedHome];
  char v4 = [v3 rooms];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        id v12 = [v10 name];
        LODWORD(homeKitSelectedRoomName) = [(NSString *)homeKitSelectedRoomName isEqualToString:v12];

        if (homeKitSelectedRoomName)
        {
          id v13 = v10;

          int v7 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)_homePodsInAccount
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v2 = [(HDSSetupSession *)self availableHomes];
  int v3 = (void *)[v2 copy];

  char v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    uint64_t v5 = *MEMORY[0x263F0B0A0];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v8 = [v7 accessories];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              BOOL v14 = [v13 category];
              long long v15 = [v14 categoryType];

              if ([v15 isEqualToString:v5]) {
                [v4 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v4;
}

- (id)_homePodsInSelectedHome
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v2 = [(HDSSetupSession *)self selectedHome];
  int v3 = [v2 accessories];
  char v4 = (void *)[v3 copy];

  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x263F0B0A0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "category", (void)v16);
        BOOL v14 = [v13 categoryType];

        if ([v14 isEqualToString:v10]) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)selectedRoomHasHomePods
{
  int v3 = [(HDSSetupSession *)self selectedHome];
  char v4 = [v3 accessories];
  uint64_t v5 = (void *)[v4 copy];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HDSSetupSession_selectedRoomHasHomePods__block_invoke;
  v8[3] = &unk_2650403E8;
  v8[4] = self;
  uint64_t v6 = [v5 indexOfObjectPassingTest:v8];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __42__HDSSetupSession_selectedRoomHasHomePods__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 room];
  uint64_t v5 = [v4 name];

  uint64_t v6 = [v3 category];

  uint64_t v7 = [v6 categoryType];

  if ([v5 isEqualToString:*(void *)(*(void *)(a1 + 32) + 992)]) {
    uint64_t v8 = [v7 isEqualToString:*MEMORY[0x263F0B0A0]];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_selectedRoomHomePod
{
  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (homeKitSelectedRoomName)
  {
    char v4 = homeKitSelectedRoomName;
    uint64_t v5 = [(HDSSetupSession *)self selectedHome];
    uint64_t v6 = [v5 accessories];
    uint64_t v7 = (void *)[v6 copy];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__HDSSetupSession__selectedRoomHomePod__block_invoke;
    v12[3] = &unk_2650403E8;
    uint64_t v8 = v4;
    id v13 = v8;
    uint64_t v9 = [v7 indexOfObjectPassingTest:v12];
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = [v7 objectAtIndex:v9];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

uint64_t __39__HDSSetupSession__selectedRoomHomePod__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 room];
  uint64_t v5 = [v4 name];

  uint64_t v6 = [v3 category];

  uint64_t v7 = [v6 categoryType];

  if ([v5 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v8 = [v7 isEqualToString:*MEMORY[0x263F0B0A0]];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_roomHasOdeonConfig:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSSetupSession *)self selectedHome];
  uint64_t v6 = [v5 accessories];
  uint64_t v7 = (void *)[v6 copy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = *MEMORY[0x263F0B030];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "room", (void)v22);
        long long v16 = [v15 name];

        long long v17 = [v14 category];
        long long v18 = [v17 categoryType];

        if ([v16 isEqualToString:v4])
        {
          if ([v18 isEqualToString:v12])
          {
            long long v19 = [v14 audioDestinationController];

            if (v19)
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }

              BOOL v20 = 1;
              goto LABEL_21;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (id)_selectedRoomAllHomePods
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v20 = (id)objc_opt_new();
  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (homeKitSelectedRoomName)
  {
    id v4 = homeKitSelectedRoomName;
    uint64_t v5 = [(HDSSetupSession *)self selectedHome];
    uint64_t v6 = [v5 accessories];
    uint64_t v7 = (void *)[v6 copy];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = *MEMORY[0x263F0B0A0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v15 = [v14 room];
          long long v16 = [v15 name];

          long long v17 = [v14 category];
          long long v18 = [v17 categoryType];

          if ([v16 isEqualToString:v4]
            && [v18 isEqualToString:v12])
          {
            [v20 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v20;
}

- (id)_selectedRoomAllStereoPairs
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = (id)objc_opt_new();
  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (homeKitSelectedRoomName)
  {
    long long v21 = homeKitSelectedRoomName;
    id v4 = [(HDSSetupSession *)self selectedHome];
    uint64_t v5 = [v4 mediaSystems];
    uint64_t v6 = (void *)[v5 copy];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = [v11 components];
          id v13 = [v12 firstObject];
          BOOL v14 = [v13 mediaProfile];
          long long v15 = [v14 accessory];
          long long v16 = [v15 room];
          long long v17 = [v16 name];

          if ([v17 isEqualToString:v21]) {
            [v19 addObject:v11];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v19;
}

- (NSString)selectedSiriLanguageCode
{
  BOOL siriLanguagePicked = self->_siriLanguagePicked;
  selectedSiriLanguageCode = self->_selectedSiriLanguageCode;
  if (!siriLanguagePicked && selectedSiriLanguageCode == 0) {
    selectedSiriLanguageCode = self->_companionSiriLanguageCode;
  }
  return selectedSiriLanguageCode;
}

- (void)shareSettingsAgreed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_shareSettingsAgreed__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__HDSSetupSession_shareSettingsAgreed__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 596) = 1;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)siriEnable
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_siriEnable__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupSession_siriEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 222) = 1;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (BOOL)siriDataSharingEnabled
{
  return self->_siriDataSharing == 6;
}

- (void)siriForEveryoneAnswered
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HDSSetupSession_siriForEveryoneAnswered__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__HDSSetupSession_siriForEveryoneAnswered__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 536) = 1;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)siriLanguagePicked:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HDSSetupSession_siriLanguagePicked___block_invoke;
  v7[3] = &unk_26503F8F0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __38__HDSSetupSession_siriLanguagePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 328), *(id *)(a1 + 32));
  *(unsigned char *)(*(void *)(a1 + 40) + 336) = 1;
  BOOL v2 = *(void **)(a1 + 40);
  return [v2 _run];
}

- (void)siriVoicePicked:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HDSSetupSession_siriVoicePicked___block_invoke;
  v7[3] = &unk_26503F8F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__HDSSetupSession_siriVoicePicked___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 344), *(id *)(a1 + 40));
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 360) completionLoggingBlock];
  v2[2](v2, 1);

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 360);
  *(void *)(v3 + 360) = 0;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _run];
}

- (void)didDismiss
{
  siriEnablementConfiguration = self->_siriEnablementConfiguration;
  if (siriEnablementConfiguration)
  {
    uint64_t v3 = [(AFEnablementConfiguration *)siriEnablementConfiguration completionLoggingBlock];
    v3[2](v3, 0);
  }
}

- (void)siriForiCloudRecognizeAnswered:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Class HFUtilitiesClass = getHFUtilitiesClass();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__HDSSetupSession_siriForiCloudRecognizeAnswered___block_invoke;
  v6[3] = &unk_265040410;
  v6[4] = self;
  BOOL v7 = v3;
  [(objc_class *)HFUtilitiesClass updateSiriForiCloudEnabled:v3 completionHandler:v6];
}

void __50__HDSSetupSession_siriForiCloudRecognizeAnswered___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v6 = _LogCategory_Initialize(), id v4 = v9, v6))
      {
        id v7 = v4;
        LogPrintF();
        id v4 = v9;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v4, @"siriForICloud", v7);
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v5 = "yes";
    }
    else {
      uint64_t v5 = "no";
    }
    id v8 = v5;
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 32), "recognizeVoiceAnswered:", *(unsigned __int8 *)(a1 + 40), v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "recognizeVoiceAnswered:", *(unsigned __int8 *)(a1 + 40), v7);
  }
}

- (void)skipAudioPasscode
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HDSSetupSession_skipAudioPasscode__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__HDSSetupSession_skipAudioPasscode__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 460) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 461) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 419) = 1;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)skipiTunesSignIn
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_skipiTunesSignIn__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_skipiTunesSignIn__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 1;
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (BOOL)shouldShowHomePodSoftwareUpdateAvailable
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_userOptedToHH2)
  {
    int v3 = gLogCategory_HDSSetupSession;
    if ((self->_peerFeatureFlags & 0x800) == 0)
    {
      if (gLogCategory_HDSSetupSession > 30) {
        return 1;
      }
      if (gLogCategory_HDSSetupSession == -1)
      {
        BOOL v4 = 1;
        if (!_LogCategory_Initialize()) {
          return v4;
        }
      }
      else
      {
        BOOL v4 = 1;
      }
      goto LABEL_15;
    }
  }
  else
  {
    int v3 = gLogCategory_HDSSetupSession;
  }
  if (v3 > 30) {
    return 0;
  }
  if (v3 == -1)
  {
    BOOL v4 = 0;
    if (!_LogCategory_Initialize()) {
      return v4;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_15:
  LogPrintF();
  return v4;
}

- (int)exportAMSTokenAndAccountSetup:(id)a3 ifMissing:(BOOL)a4 ifInvalid:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  int amsActivationState = self->_amsActivationState;
  if (!amsActivationState)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_amsActivationState)
    {
LABEL_7:
      uint64_t v10 = [(id)objc_opt_class() signpostLog];
      unint64_t v11 = [(HDSSetupSession *)self signpostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AMSMultiUser", "", buf, 2u);
        }
      }
    }
    self->_int amsActivationState = 1;
    self->_amsOptimizationStartTicks = mach_absolute_time();
    id v13 = [MEMORY[0x263F27D70] proxyObjectAsync];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke;
    v15[3] = &unk_265040438;
    v15[4] = self;
    [v13 exportMultiUserTokenForHomeIdentifier:v8 generateIfMissing:v6 generateIfInvalid:v5 completion:v15];

    int amsActivationState = self->_amsActivationState;
  }

  return amsActivationState;
}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2;
  block[3] = &unk_26503F940;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        uint64_t v13 = v2;
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v2, @"ExportAMSToken", v13);
    if (!*(_DWORD *)(*(void *)(a1 + 40) + 480))
    {
      id v5 = [(id)objc_opt_class() signpostLog];
      uint64_t v6 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AMSMultiUser", "", buf, 2u);
        }
      }
    }
    id v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AMSMultiUser", "", buf, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 40) + 480) = 2;
    [*(id *)(a1 + 40) _run];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"amsT"];
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 288);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2_472;
    v14[3] = &unk_26503FC20;
    v14[4] = v11;
    objc_msgSend(v12, "sendRequestID:options:request:responseHandler:", @"_hds_ams_token", &unk_26F260CA8, v3, v14, v13);
  }
}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2_472(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 1176) = v8;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 1176);
    LogPrintF();
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  os_signpost_id_t v10 = *(_DWORD **)(a1 + 32);
  if (v6 || !Int64)
  {
    objc_msgSend(v10, "_logMetricsForSoftError:label:", v6, @"ExportAMSToken", v23);
    if (!*(_DWORD *)(*(void *)(a1 + 32) + 480))
    {
      long long v17 = [(id)objc_opt_class() signpostLog];
      uint64_t v18 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = v18;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "AMSMultiUser", "", v27, 2u);
        }
      }
    }
    id v20 = [(id)objc_opt_class() signpostLog];
    uint64_t v21 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v22 = v21;
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_END, v22, "AMSMultiUser", "", v26, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 480) = 2;
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_28;
    }
  }
  else
  {
    if (!v10[120])
    {
      uint64_t v11 = [(id)objc_opt_class() signpostLog];
      uint64_t v12 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AMSMultiUser", "", buf, 2u);
        }
      }
    }
    id v14 = [(id)objc_opt_class() signpostLog];
    uint64_t v15 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)long long v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_END, v16, "AMSMultiUser", "", v24, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 480) = 4;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_28:
      LogPrintF();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_run", v23);
}

- (void)speakPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HDSSetupSession_speakPasscodeWithCompletion___block_invoke;
  v7[3] = &unk_26503F830;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__HDSSetupSession_speakPasscodeWithCompletion___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _speakPasscodeWithInstructions:0 languageCode:0 completion:v3];
}

- (void)speakPasscodeWithLanguageCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_speakPasscodeWithLanguageCode_completion___block_invoke;
  block[3] = &unk_265040460;
  id v12 = v6;
  os_signpost_id_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSSetupSession_speakPasscodeWithLanguageCode_completion___block_invoke(void *a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  return [v2 _speakPasscodeWithInstructions:0 languageCode:v3 completion:v4];
}

- (void)speakPasscodeWithInstructions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_speakPasscodeWithInstructions_completion___block_invoke;
  block[3] = &unk_265040460;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSSetupSession_speakPasscodeWithInstructions_completion___block_invoke(void *a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 _speakPasscodeWithInstructions:v3 languageCode:0 completion:v4];
}

- (void)speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__HDSSetupSession_speakPasscodeWithInstructions_languageCode_completion___block_invoke;
  v15[3] = &unk_265040300;
  id v16 = v9;
  long long v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __73__HDSSetupSession_speakPasscodeWithInstructions_languageCode_completion___block_invoke(void *a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  return [v2 _speakPasscodeWithInstructions:v4 languageCode:v3 completion:v5];
}

- (void)_speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x263EFF9A0];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  [v12 setObject:&unk_26F260F70 forKeyedSubscript:@"aa"];
  [v12 setObject:v11 forKeyedSubscript:@"authI"];

  [v12 setObject:v8 forKeyedSubscript:@"lang"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v30 = v8;
    LogPrintF();
  }
  id v13 = [(objc_class *)getAFPreferencesClass_0() sharedPreferences];
  id v14 = v13;
  selectedSiriVoice = self->_selectedSiriVoice;
  if (selectedSiriVoice)
  {
    id v16 = selectedSiriVoice;
  }
  else
  {
    id v16 = [v13 outputVoice];
  }
  long long v17 = v16;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v30 = [(AFVoiceInfo *)v17 name];
    LogPrintF();
  }
  id v18 = [(AFVoiceInfo *)v17 languageCode];

  if (v18 != v8)
  {
    id v19 = [(objc_class *)getAFVoiceInfoClass_0() allVoicesForSiriSessionLanguage:v8];
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      BOOL v31 = v19;
      LogPrintF();
    }
    uint64_t v23 = [(AFVoiceInfo *)v17 name];
    long long v24 = objc_msgSend(v19, "hmf_firstObjectWithName:", v23);

    if (!v24)
    {
      long long v24 = [v19 firstObject];
      if (!v24)
      {
        if (gLogCategory_HDSSetupSession <= 90
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        long long v24 = 0;
        uint64_t v21 = 0;
        goto LABEL_47;
      }
    }
    BOOL v35 = self;
    id v25 = v9;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      BOOL v32 = [v24 name];
      LogPrintF();
    }
    uint64_t v26 = objc_msgSend(v24, "gender", v32);
    uint64_t v21 = [v24 name];
    if (v26)
    {
      uint64_t v27 = [NSNumber numberWithInteger:v26];
      [v12 setObject:v27 forKeyedSubscript:@"siriVG"];
    }
    if (v21) {
      [v12 setObject:v21 forKeyedSubscript:@"siriVN"];
    }
    if (gLogCategory_HDSSetupSession > 30)
    {
      id v9 = v25;
    }
    else
    {
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      {
        uint64_t v33 = (void *)v26;
        LogPrintF();
      }
      id v9 = v25;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        {
          uint64_t v33 = v21;
          LogPrintF();
        }
        self = v35;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          BOOL v34 = objc_msgSend(v24, "name", v33);
          LogPrintF();
        }
        goto LABEL_47;
      }
    }
    self = v35;
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  uint64_t v20 = [(AFVoiceInfo *)v17 gender];
  uint64_t v21 = [(AFVoiceInfo *)v17 name];
  if (v20)
  {
    os_signpost_id_t v22 = [NSNumber numberWithInteger:v20];
    [v12 setObject:v22 forKeyedSubscript:@"siriVG"];
  }
  if (v21) {
    [v12 setObject:v21 forKeyedSubscript:@"siriVN"];
  }
  if (v17)
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      {
        BOOL v31 = (void *)v20;
        LogPrintF();
      }
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        {
          BOOL v31 = v21;
          LogPrintF();
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          id v19 = [(AFVoiceInfo *)v17 name];
          LogPrintF();
          goto LABEL_48;
        }
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
LABEL_49:
  sfSession = self->_sfSession;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __74__HDSSetupSession__speakPasscodeWithInstructions_languageCode_completion___block_invoke;
  v36[3] = &unk_2650401E8;
  v36[4] = self;
  id v37 = v9;
  id v29 = v9;
  [(SFSession *)sfSession sendRequestID:@"_aa" options:&unk_26F260CD0 request:v12 responseHandler:v36];
}

void __74__HDSSetupSession__speakPasscodeWithInstructions_languageCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v9 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v11) {
    [*(id *)(a1 + 32) _logMetricsForSoftError:v11 label:@"SecureConnection-SiriPasscode"];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v8);
  }
}

- (void)stereoRolePicked:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HDSSetupSession_stereoRolePicked___block_invoke;
  v4[3] = &unk_265040398;
  int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__HDSSetupSession_stereoRolePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 252) = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)stereoMultiplePicked:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HDSSetupSession_stereoMultiplePicked___block_invoke;
  v7[3] = &unk_26503F8F0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__HDSSetupSession_stereoMultiplePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 240), *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _run];
}

- (void)soundRecognitionAgreed:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

void __42__HDSSetupSession_soundRecognitionAgreed___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v2 = "yes";
    }
    else {
      uint64_t v2 = "no";
    }
    id v11 = v2;
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 568) = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 569) = 1;
  if (*(unsigned char *)(a1 + 40)) {
    int v3 = 2;
  }
  else {
    int v3 = 3;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1264) = v3;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  if (gLogCategory_HDSSetupSession <= 30)
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_18;
      }
      int v5 = *(unsigned __int8 *)(a1 + 40);
    }
    if (v5) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    id v11 = v6;
    LogPrintF();
  }
LABEL_18:
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "selectedHome", v11);
  id v9 = [v8 owner];
  uint64_t v10 = [v8 homeAccessControlForUser:v9];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_2;
  v13[3] = &unk_26503F7B8;
  v13[4] = *(void *)(a1 + 32);
  [v10 updateAudioAnalysisUserDropinAccessLevel:v7 completionHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_3;
  v12[3] = &unk_26503F7B8;
  void v12[4] = *(void *)(a1 + 32);
  [v8 updateAudioAnalysisClassifierOptions:v4 completion:v12];
  [*(id *)(a1 + 32) _run];
}

uint64_t __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v6 = v3;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v6, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v6;
    }
  }
  if (v4)
  {
    id v3 = (id)[*(id *)(a1 + 32) _logMetricsForSoftError:v6 label:@"SoundRecognition"];
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v3)) {
        id v3 = (id)LogPrintF();
      }
    }
  }
  return MEMORY[0x270F9A790](v3);
}

uint64_t __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v8 = v3;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v8, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v8;
    }
  }
  if (v4)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v8, v5))
      {
        id v7 = v4;
        LogPrintF();
      }
    }
    id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v8, @"SoundRecognition", v7);
    id v4 = v8;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)automaticSoftwareUpdatesAgreed:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v2 = "yes";
    }
    else {
      uint64_t v2 = "no";
    }
    id v8 = v2;
    LogPrintF();
  }
  if (*(unsigned char *)(a1 + 40)) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 552) = v3;
  id v4 = *(_DWORD **)(a1 + 32);
  if (v4[138])
  {
    BOOL v5 = [v4 selectedHome];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke_2;
    v9[3] = &unk_26503F7B8;
    v9[4] = *(void *)(a1 + 32);
    [v5 updateAutomaticSoftwareUpdateEnabled:v6 completionHandler:v9];

    id v4 = *(_DWORD **)(a1 + 32);
  }
  return objc_msgSend(v4, "_run", v8);
}

uint64_t __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v3 = (id)[*(id *)(a1 + 32) _logMetricsForSoftError:v3 label:@"AutomaticSoftwareUpdates"];
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v3)) {
LABEL_7:
      }
        id v3 = (id)LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1) {
      goto LABEL_7;
    }
    id v3 = (id)_LogCategory_Initialize();
    if (v3) {
      goto LABEL_7;
    }
  }
  return MEMORY[0x270F9A790](v3);
}

- (void)softwareUpdateAgreed:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__HDSSetupSession_softwareUpdateAgreed___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__HDSSetupSession_softwareUpdateAgreed___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1458))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(_DWORD *)(v2 + 560) = 1;
      *(_DWORD *)(*(void *)(a1 + 32) + 1472) = 1;
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
  }
  else if (*(unsigned char *)(v2 + 1456) && *(_DWORD *)(v2 + 1468) != 4 && *(_DWORD *)(v2 + 552) == 2)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      int v3 = 1;
      *(_DWORD *)(v2 + 560) = 1;
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(v4 + 1468);
      if ((v5 - 2) >= 2 && v5 != 1) {
        goto LABEL_22;
      }
    }
    else
    {
      *(_DWORD *)(v2 + 560) = 2;
      uint64_t v4 = *(void *)(a1 + 32);
      if ((*(_DWORD *)(v4 + 1468) & 0xFFFFFFFE) != 2) {
        goto LABEL_22;
      }
      int v3 = 3;
    }
    *(_DWORD *)(v4 + 1472) = v3;
  }
LABEL_22:
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_26:
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _run];
}

- (void)termsAgreed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupSession_termsAgreed__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__HDSSetupSession_termsAgreed__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 576) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)psgSelected:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__HDSSetupSession_psgSelected___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __31__HDSSetupSession_psgSelected___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1288) = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 1289) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)tvAudioEnabled:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__HDSSetupSession_tvAudioEnabled___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__HDSSetupSession_tvAudioEnabled___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 257) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)identifyHomePod:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPCompanionLinkClient *)self->_companionLinkClient activeDevices];
  uint64_t v6 = (void *)[v5 copy];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    [v4 name];
    id v12 = v11 = v6;
    LogPrintF();
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__HDSSetupSession_identifyHomePod___block_invoke;
  v13[3] = &unk_265040488;
  id v7 = v4;
  id v14 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v13];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v9 = [v6 objectAtIndex:v8];
    uint64_t v10 = [v9 identifier];
    if (v10)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self->_companionLinkClient, "sendRequestID:request:destinationID:options:responseHandler:", *MEMORY[0x263F62CB0], MEMORY[0x263EFFA78], v10, 0, &__block_literal_global_6, v10, v12);
      }
      else
      {
        -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self->_companionLinkClient, "sendRequestID:request:destinationID:options:responseHandler:", *MEMORY[0x263F62CB0], MEMORY[0x263EFFA78], v10, 0, &__block_literal_global_6, v11, v12);
      }
    }
    else if (gLogCategory_HDSSetupSession <= 30 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

uint64_t __35__HDSSetupSession_identifyHomePod___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uniqueIdentifier];
  BOOL v5 = [v3 homeKitIdentifier];

  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  return v6;
}

void __35__HDSSetupSession_identifyHomePod___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (int)expressSetupState
{
  if (!self->_hasExistingHomePodInAccount) {
    return 1;
  }
  if (!self->_hasExistingHomePod) {
    return 2;
  }
  if (self->_existingHomepodInSelectedRoom) {
    return 4;
  }
  return 3;
}

- (void)fetchLocationServicesEnabled
{
  id v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 223) = [(objc_class *)getCLLocationManagerClass_0() locationServicesEnabled];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke_2;
  block[3] = &unk_26503F6A8;
  void block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 216))
  {
    id v3 = [(id)objc_opt_class() signpostLog];
    uint64_t v4 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)id v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PreflightMisc", "", v7, 2u);
      }
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 216) = 10;
  return [*(id *)(a1 + 32) _run];
}

- (void)isDeviceActiveFetch
{
  if (HDSIsDevicePhone())
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init(_TtC15HomeDeviceSetup19FindMyLocateSession);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38__HDSSetupSession_isDeviceActiveFetch__block_invoke;
    v4[3] = &unk_2650404D0;
    v4[4] = self;
    [(FindMyLocateSession *)v3 getActiveLocationSharingDeviceWithCompletionHandler:v4];
  }
  else
  {
    self->_activeDeviceSelectionState = 0;
  }
}

void __38__HDSSetupSession_isDeviceActiveFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_isDeviceActiveFetch__block_invoke_2;
  block[3] = &unk_26503F940;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __38__HDSSetupSession_isDeviceActiveFetch__block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32))
  {
    if (gLogCategory_HDSSetupSession > 90) {
      goto LABEL_17;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      result = _LogCategory_Initialize();
      if (!result) {
        goto LABEL_17;
      }
    }
    goto LABEL_11;
  }
  result = [*(id *)(result + 48) isThisDevice];
  if (!result)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_17;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      result = _LogCategory_Initialize();
      if (!result) {
        goto LABEL_17;
      }
    }
LABEL_11:
    result = LogPrintF();
LABEL_17:
    int v2 = 2;
    goto LABEL_18;
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF();
    }
  }
  int v2 = 1;
LABEL_18:
  *(_DWORD *)(*(void *)(v1 + 40) + 1276) = v2;
  return result;
}

- (void)fetchTermsAndConditionsServerStatus
{
  if (+[HDSDefaults forceFailTCServerResponse])
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_termsAndConditionsServersActive = 0;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = [(objc_class *)getAARemoteServerClass() sharedServerWithNoUrlCache];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke;
    v4[3] = &unk_2650404F8;
    v4[4] = self;
    [v3 configurationWithCompletion:v4];
  }
}

void __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke_2;
  block[3] = &unk_26503F940;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _logMetricsForSoftError:v2 label:@"TermsAndConditions"];
  }
  id v3 = [*(id *)(a1 + 48) homepodSetupiCloudTerms];
  *(unsigned char *)(*(void *)(a1 + 40) + 1389) = v3 != 0;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int64_t)roomHomePodStereoPairCount
{
  if (self->_stereoPairUserInputState == 4)
  {
    if (self->_stereoCounterpartAccessory) {
      uint64_t v2 = -1;
    }
    else {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2 + self->_selectedRoomHomePodAndStereoPairCount;
}

- (void)setSysDropMode:(BOOL)a3
{
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(HDSSetupSession *)self _runSFSessionStart];
    if (v3 == 4 || v3 == 2)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        int v76 = [(SFSession *)self->_sfSession identifier];
        LogPrintF();
      }
      uint64_t v4 = [(SFSession *)self->_sfSession identifier];

      if (v4)
      {
        if (!self->_preAuthState) {
          [(HDSSetupSession *)self _runPreAuthRequest];
        }
        if (self->_pauseAfterPreAuth && !self->_homePodSoftwareUpdateCancelled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          return;
        }
        if ([(HDSSetupSession *)self homePodNeedsSUBeforeSetup]
          && !self->_homePodIsSUNoSetup
          && self->_homePodCanSUNoSetup)
        {
          int v16 = [(HDSSetupSession *)self _runHomePodSoftwareUpdateNonSetupAcknowledgement];
          if (v16 != 4 && v16 != 2) {
            return;
          }
          if (!self->_skipWiFiSetup && self->_preflightEnabled && (self->_testFlags & 0x400000) == 0)
          {
            int v36 = [(HDSSetupSession *)self _runPreflightWiFi];
            if (v36 != 4 && v36 != 2) {
              return;
            }
          }
          int v17 = [(HDSSetupSession *)self _runPreAuthAlignmentAndSiri];
          if (v17 != 4 && v17 != 2) {
            return;
          }
          if (!self->_sfSessionSecured)
          {
            if (self->_apcEnabled && (self->_peerFeatureFlags & 1) != 0 && !self->_forcedCLIPasscode)
            {
              if (self->_prefLEDPasscodeEnabled)
              {
                int v48 = [(HDSSetupSession *)self _runLEDPassCodeAlignment];
                if (v48 != 4 && v48 != 2) {
                  return;
                }
              }
              int v49 = [(HDSSetupSession *)self _runAudioPasscode];
              if (v49 != 4 && v49 != 2) {
                return;
              }
            }
            if (!self->_sfSessionSecured)
            {
              if ((self->_siriFlags & 1) != 0
                && ![(HDSSetupSession *)self isCompanionSiriLanguageSupportedByHomePod])
              {
                int v18 = [(HDSSetupSession *)self _runSiriLanguage];
                if (v18 != 4 && v18 != 2) {
                  return;
                }
              }
              if (!self->_sfSessionSecured && self->_siriPasscodeEnabled && (self->_peerFeatureFlags & 2) != 0)
              {
                int v47 = [(HDSSetupSession *)self _runSiriPasscode];
                if (v47 != 4 && v47 != 2) {
                  return;
                }
              }
            }
          }
          if ((self->_testFlags & 0x800000) == 0)
          {
            if (!self->_skipWiFiSetup)
            {
              int v40 = [(HDSSetupSession *)self _runWiFiSetup];
              if (v40 != 4 && v40 != 2) {
                return;
              }
            }
            int v19 = [(HDSSetupSession *)self _runCaptiveJoin];
            if (v19 != 4 && v19 != 2) {
              return;
            }
            if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0) {
              [(HDSSetupSession *)self _runBonjourTest];
            }
          }
          int v20 = [(HDSSetupSession *)self _runForcedHomePodSoftwareUpdateNonSetup];
          if (v20 != 4 && v20 != 2) {
            return;
          }
        }
        if (self->_homePodSoftwareUpdateStateNonSetup != 4 && !self->_homePodIsSUNoSetup
          || self->_homePodSoftwareUpdateCancelled
          || (int v15 = [(HDSSetupSession *)self _runHomePodSoftwareUpdateNonSetupComplete], v15 == 4)|| v15 == 2)
        {
          if (!self->_homePodSoftwareUpdateCancelled
            || (int v5 = [(HDSSetupSession *)self _runHomePodSoftwareUpdateNonSetupCancelled], v5 == 4)|| v5 == 2)
          {
            [(HDSSetupSession *)self _runHomeKitSetupMode];
            if (!self->_apcState)
            {
              id v6 = [(id)objc_opt_class() signpostLog];
              unint64_t v7 = [(HDSSetupSession *)self signpostID];
              if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v8 = v7;
                if (os_signpost_enabled(v6))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AudioPasscode", "", buf, 2u);
                }
              }

              self->_apcState = 11;
              [(HDSSetupSession *)self _runAudioPasscodeInitRequest];
            }
            if (!self->_preflightEnabled
              || (self->_testFlags & 0x400000) != 0
              || (self->_skipWiFiSetup
               || (int v22 = [(HDSSetupSession *)self _runPreflightWiFi], v22 == 4)
               || v22 == 2)
              && ((int v9 = [(HDSSetupSession *)self _runPreflightiCloud], v9 == 4) || v9 == 2)
              && ((int v10 = [(HDSSetupSession *)self _runPreflightiTunes], v10 == 4) || v10 == 2))
            {
              int v11 = [(HDSSetupSession *)self _runPreflightCDP];
              if (v11 == 4 || v11 == 2)
              {
                if (self->_siriEnablementConfigurationState
                  || (int v21 = [(HDSSetupSession *)self _runSiriEnablementConfigurationFetch], v21 == 4)|| v21 == 2)
                {
                  [(HDSSetupSession *)self _runAuthKitTrustStartIfNeeded];
                  if (self->_enablementProfileInstalled
                    && self->_homePodSysDropCapable
                    && self->_homePodSysDropCapableV2
                    && +[HDSDefaults sysDropBuildMode]
                    && !self->_isCLIMode)
                  {
                    int v37 = [(HDSSetupSession *)self _runHomePodLoggingProfileTransferAck];
                    if (v37 != 4 && v37 != 2) {
                      return;
                    }
                    if (self->_homePodProfileTransferSelection == 1)
                    {
                      int v38 = [(HDSSetupSession *)self _runHomePodLoggingProfileTransfer];
                      if (v38 != 2 && v38 != 4) {
                        return;
                      }
                    }
                  }
                  else if (gLogCategory_HDSSetupSession <= 30 {
                         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
                  }
                  {
                    if (self->_enablementProfileInstalled) {
                      id v12 = "yes";
                    }
                    else {
                      id v12 = "no";
                    }
                    if (self->_homePodSysDropCapable) {
                      uint64_t v13 = "yes";
                    }
                    else {
                      uint64_t v13 = "no";
                    }
                    if (self->_homePodSysDropCapableV2) {
                      id v14 = "yes";
                    }
                    else {
                      id v14 = "no";
                    }
                    v80 = v14;
                    uint64_t v81 = +[HDSDefaults sysDropBuildMode];
                    v77 = v12;
                    v79 = v13;
                    LogPrintF();
                  }
                  if (+[HDSDefaults sysDropForceErrorEarlyEnabled]&& !self->_isCLIMode)
                  {
                    id v29 = NSErrorF();
                    [(HDSSetupSession *)self _reportError:v29 label:@"TestingDefault"];

                    return;
                  }
                  int v23 = [(HDSSetupSession *)self _runPreAuthAlignmentAndSiri];
                  if (v23 == 4 || v23 == 2)
                  {
                    if (self->_sfSessionSecured
                      || (!self->_apcEnabled
                       || (self->_peerFeatureFlags & 1) == 0
                       || self->_forcedCLIPasscode
                       || (!self->_prefLEDPasscodeEnabled
                        || (int v42 = [(HDSSetupSession *)self _runLEDPassCodeAlignment], v42 == 4)
                        || v42 == 2)
                       && ((int v43 = [(HDSSetupSession *)self _runAudioPasscode], v43 == 4) || v43 == 2))
                      && (self->_sfSessionSecured
                       || ((self->_siriFlags & 1) == 0
                        || [(HDSSetupSession *)self isCompanionSiriLanguageSupportedByHomePod]|| (int v24 = [(HDSSetupSession *)self _runSiriLanguage], v24 == 4)|| v24 == 2)&& (self->_sfSessionSecured|| !self->_siriPasscodeEnabled|| (self->_peerFeatureFlags & 2) == 0|| (v41 = [(HDSSetupSession *)self _runSiriPasscode], v41 == 4)|| v41 == 2)))
                    {
                      if (self->_isCLIMode && self->_delayForOdeonStereoPair)
                      {
                        int v25 = [(HDSSetupSession *)self _runBackgroundActivation];
                        if (v25 != 2 && v25 != 4) {
                          return;
                        }
                      }
                      else
                      {
                        [(HDSSetupSession *)self _runBackgroundActivation];
                      }
                      if ((self->_siriFlags & 1) == 0
                        || [(HDSSetupSession *)self isCompanionSiriLanguageSupportedByHomePod]|| (int v26 = [(HDSSetupSession *)self _runSiriLanguage], v26 == 4)|| v26 == 2)
                      {
                        if (self->_jsDefaultDisabled
                          || (int v30 = [(HDSSetupSession *)self _runPreflightJSCheck], v30 == 4)
                          || v30 == 2)
                        {
                          int v27 = [(HDSSetupSession *)self _runHomeKitUserInput];
                          if (v27 == 4 || v27 == 2)
                          {
                            if (_os_feature_enabled_impl())
                            {
                              if (!self->_hasExistingHomePodInAccount
                                && (!self->_canDoV2TermsAndConditions || !self->_termsAndConditionsServersActive))
                              {
                                int v28 = [(HDSSetupSession *)self _runTerms];
                                if (v28 != 2 && v28 != 4) {
                                  return;
                                }
                              }
                            }
                            else if ((!self->_hasExistingHomePod {
                                    || [(ACAccount *)self->_iCloudAccount aa_needsToVerifyTerms])&& !self->_hasExistingHomePodInAccount)
                            }
                            {
                              int v39 = [(HDSSetupSession *)self _runTerms];
                              if (v39 != 4 && v39 != 2) {
                                return;
                              }
                            }
                            int v31 = [(HDSSetupSession *)self _runShareSettings];
                            if (v31 == 4 || v31 == 2)
                            {
                              int v32 = [(HDSSetupSession *)self _runPreAuth];
                              if (v32 == 4 || v32 == 2)
                              {
                                if (!self->_prefStereoPairEnabled
                                  || (int v33 = [(HDSSetupSession *)self _runStereoPairUserInput],
                                      v33 == 4)
                                  || v33 == 2)
                                {
                                  if (!self->_prefTVAudioEnabled
                                    || (int v34 = [(HDSSetupSession *)self _runTVAudioUserInput],
                                        v34 == 4)
                                    || v34 == 2)
                                  {
                                    if (!self->_appleMusicEnabled
                                      || self->_iTunesSignInSkip
                                      || self->_hasExistingHomePod && !self->_appleMusicForce
                                      || (int v46 = [(HDSSetupSession *)self _runAppleMusic], v46 == 4)
                                      || v46 == 2)
                                    {
                                      if (self->_hasExistingHomePodInAccount
                                        || (int v44 = [(HDSSetupSession *)self _runPreflightMisc],
                                            v44 == 4)
                                        || v44 == 2)
                                      {
                                        if (!self->_prefMultiUser
                                          || (self->_peerFeatureFlags & 0x100) == 0
                                          || self->_hasExistingHomePod
                                          || (int v50 = [(HDSSetupSession *)self _runRecognizeVoice],
                                              v50 == 4)
                                          || v50 == 2)
                                        {
                                          if (!self->_hasExistingHomePodInSelectedRoom)
                                          {
                                            int v45 = [(HDSSetupSession *)self _runPersonalRequests];
                                            if (v45 != 2 && v45 != 4) {
                                              return;
                                            }
LABEL_214:
                                            if (self->_userOptedToHH2
                                              && !self->_automaticUpdatesEnabled
                                              && self->_homePodProductVersion != 4)
                                            {
                                              int v52 = [(HDSSetupSession *)self _runAutomaticSoftwareUpdate];
                                              if (v52 != 4 && v52 != 2) {
                                                return;
                                              }
                                            }
                                            if (self->_forceSoftwareUpdateForADP
                                              || self->_userOptedToHH2
                                              && !self->_automaticUpdatesEnabled
                                              && self->_automaticSoftwareUpdateAgreed == 2
                                              && self->_homePodProductVersion != 4)
                                            {
                                              int v53 = [(HDSSetupSession *)self _runSoftwareUpdate];
                                              if (v53 != 4 && v53 != 2) {
                                                return;
                                              }
                                            }
                                            if (!self->_soundRecognitionOptedIn
                                              && self->_homePodIsCallbellCapable
                                              && self->_userOptedToHH2
                                              && self->_homeSafetySecurityEnabled)
                                            {
                                              int v66 = [(HDSSetupSession *)self _runSoundRecognition];
                                              if (v66 != 4 && v66 != 2) {
                                                return;
                                              }
                                            }
                                            int v54 = [(HDSSetupSession *)self _enableSiriForPersonalRequestIfNecessary];
                                            if (v54 != 4 && v54 != 2) {
                                              return;
                                            }
                                            int v55 = [(HDSSetupSession *)self _runCheckAccount];
                                            if (v55 != 4 && v55 != 2) {
                                              return;
                                            }
                                            if (!self->_sfSessionSecured)
                                            {
                                              int v67 = [(HDSSetupSession *)self _runPairSetup];
                                              if (v67 != 4 && v67 != 2) {
                                                return;
                                              }
                                            }
                                            if ((self->_testFlags & 0x800000) == 0)
                                            {
                                              int v56 = [(HDSSetupSession *)self _runBasicConfig];
                                              if (v56 != 4 && v56 != 2) {
                                                return;
                                              }
                                              if (!self->_skipWiFiSetup)
                                              {
                                                int v68 = [(HDSSetupSession *)self _runWiFiSetup];
                                                if (v68 != 4 && v68 != 2) {
                                                  return;
                                                }
                                              }
                                              int v57 = [(HDSSetupSession *)self _runCaptiveJoin];
                                              if (v57 != 4 && v57 != 2) {
                                                return;
                                              }
                                              if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0) {
                                                [(HDSSetupSession *)self _runBonjourTest];
                                              }
                                              int v58 = [(HDSSetupSession *)self _runAuthKitTrustFinish];
                                              if (v58 != 4 && v58 != 2) {
                                                return;
                                              }
                                              int v59 = [(HDSSetupSession *)self _runTRSessionStart];
                                              if (v59 != 4 && v59 != 2) {
                                                return;
                                              }
                                              int v60 = [(HDSSetupSession *)self _runTRSetupConfiguration];
                                              if (v60 != 4 && v60 != 2) {
                                                return;
                                              }
                                              BOOL trUseAIDA = self->_trUseAIDA;
                                              if (self->_trUseAIDA)
                                              {
                                                if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                                                {
                                                  int v62 = [(HDSSetupSession *)self _runCDPSetup:1];
                                                  if (v62 != 4 && v62 != 2) {
                                                    return;
                                                  }
                                                }
                                                int v63 = [(HDSSetupSession *)self _runTRActivation];
                                                if (v63 != 4 && v63 != 2) {
                                                  return;
                                                }
                                                int v64 = [(HDSSetupSession *)self _runTRiCloudAuthentication];
                                                if (v64 != 4 && v64 != 2) {
                                                  return;
                                                }
                                                int v65 = [(HDSSetupSession *)self _runTROtherAuthentication];
                                                if (v65 != 2 && v65 != 4) {
                                                  return;
                                                }
                                              }
                                              else
                                              {
                                                int v69 = [(HDSSetupSession *)self _runTRActivation];
                                                if (v69 != 4 && v69 != 2) {
                                                  return;
                                                }
                                                int v70 = [(HDSSetupSession *)self _runTRAuthentication:self->_trUnauthServices];
                                                if (v70 != 4 && v70 != 2) {
                                                  return;
                                                }
                                                if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                                                {
                                                  int v71 = [(HDSSetupSession *)self _runCDPSetup:0];
                                                  if (v71 != 4 && v71 != 2) {
                                                    return;
                                                  }
                                                }
                                              }
                                              if (self->_prefMultiUser)
                                              {
                                                int v72 = [(HDSSetupSession *)self _runMultiUserEnable];
                                                if (v72 != 4 && v72 != 2) {
                                                  return;
                                                }
                                              }
                                              int v73 = [(HDSSetupSession *)self _runHomeKitSetup];
                                              if (v73 != 4 && v73 != 2) {
                                                return;
                                              }
                                              int v74 = [(HDSSetupSession *)self _runHomePodSoftwareUpdate];
                                              if (v74 != 4 && v74 != 2) {
                                                return;
                                              }
                                              if (!trUseAIDA
                                                && self->_cdpEnabled
                                                && (self->_peerFeatureFlags & 0x10) != 0)
                                              {
                                                int v75 = [(HDSSetupSession *)self _runCDPSetup:1];
                                                if (v75 != 4 && v75 != 2) {
                                                  return;
                                                }
                                              }
                                            }
                                            [(HDSSetupSession *)self _runFinishStart];
                                            return;
                                          }
                                          if (!self->_shouldShowCardForPRCounts) {
                                            goto LABEL_214;
                                          }
                                          if (gLogCategory_HDSSetupSession <= 30)
                                          {
                                            BOOL v35 = "yes";
                                            if (gLogCategory_HDSSetupSession == -1)
                                            {
                                              if (!_LogCategory_Initialize()) {
                                                goto LABEL_212;
                                              }
                                              if (!self->_shouldShowCardForPRCounts) {
                                                BOOL v35 = "no";
                                              }
                                            }
                                            v78 = v35;
                                            LogPrintF();
                                          }
LABEL_212:
                                          int v51 = [(HDSSetupSession *)self _runPersonalRequests];
                                          if (v51 != 4 && v51 != 2) {
                                            return;
                                          }
                                          goto LABEL_214;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_14;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_sfSessionState)
      {
LABEL_14:
        int v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", "", buf, 2u);
          }
        }
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      os_signpost_id_t v8 = (SFSession *)objc_alloc_init(MEMORY[0x263F6C2B8]);
      sfSession = self->_sfSession;
      self->_sfSession = v8;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"B238Setup"];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:*MEMORY[0x263F6C390]];
      [(SFSession *)self->_sfSession setSessionFlags:1];
      [(SFSession *)self->_sfSession setTouchRemoteEnabled:1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke;
      v17[3] = &unk_26503F7B8;
      v17[4] = self;
      [(SFSession *)self->_sfSession setErrorHandler:v17];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_2;
      v16[3] = &unk_26503F6A8;
      v16[4] = self;
      [(SFSession *)self->_sfSession setInterruptionHandler:v16];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_3;
      v15[3] = &unk_265040520;
      void v15[4] = self;
      [(SFSession *)self->_sfSession setPromptForPINHandler:v15];
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 35, 0);
      }
      int v11 = self->_sfSession;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_4;
      v14[3] = &unk_26503F7B8;
      v14[4] = self;
      [(SFSession *)v11 activateWithCompletion:v14];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_611;
      v13[3] = &unk_26503F608;
      void v13[4] = self;
      [(SFSession *)self->_sfSession setReceivedObjectHandler:v13];
    }
  }
  return self->_sfSessionState;
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1379) = 1;
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  id v5 = v3;
  if (!v4[1352]) {
    goto LABEL_7;
  }
  if ([v3 code] != -6753)
  {
    uint64_t v4 = *(unsigned char **)(a1 + 32);
    id v3 = v5;
LABEL_7:
    [v4 _reportError:v3 label:@"SFSessionError"];
    goto LABEL_8;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_8:
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 1379) = 1;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F08410];
  uint64_t v9 = *MEMORY[0x263F08320];
  uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
  id v5 = (void *)v4;
  unint64_t v6 = @"?";
  if (v4) {
    unint64_t v6 = (__CFString *)v4;
  }
  v10[0] = v6;
  os_signpost_id_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  os_signpost_id_t v8 = [v2 errorWithDomain:v3 code:-6762 userInfo:v7];
  [v1 _reportError:v8 label:@"SFSessionInterruption"];
}

void *__37__HDSSetupSession__runSFSessionStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(unsigned int *)(*(void *)(a1 + 32) + 300);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_promptForPINWithFlags:throttleSeconds:", a2, a3, v7);
  result = *(void **)(a1 + 32);
  if (result[152])
  {
    return objc_msgSend(result, "pairSetupTryPIN:");
  }
  return result;
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 300);
  if (v3)
  {
    if (!v4)
    {
      id v5 = [(id)objc_opt_class() signpostLog];
      uint64_t v6 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)int v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SFSessionStart", "", v19, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 300) = 3;
    [*(id *)(a1 + 32) _reportError:v3 label:@"SFSessionActivate"];
  }
  else
  {
    if (!v4)
    {
      int v11 = [(id)objc_opt_class() signpostLog];
      uint64_t v12 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)int v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SFSessionStart", "", v22, 2u);
        }
      }
    }
    id v14 = [(id)objc_opt_class() signpostLog];
    uint64_t v15 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)int v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_END, v16, "SFSessionStart", "", v21, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 300) = 4;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      int v18 = [*(id *)(*(void *)(a1 + 32) + 288) identifier];
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_run", v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_run", v17);
    }
  }
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_611(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (int v6 = _LogCategory_Initialize(), v5 = v8, v6))
    {
      id v7 = v5;
      LogPrintF();
      id v5 = v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_handlePeerEvent:flags:", v5, a2, v7);
}

- (void)_updateSFSessionErrorHandlerForSUBS
{
  sfSession = self->_sfSession;
  if (sfSession)
  {
    [(SFSession *)sfSession setErrorHandler:&__block_literal_global_616];
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __54__HDSSetupSession__updateSFSessionErrorHandlerForSUBS__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HDSSetupSession != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_runHomeKitSetupMode
{
  if (!self->_homeKitSetupModeState && self->_preAuthState == 4 && (self->_peerFeatureFlags & 0x800) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_homeKitSetupModeState)
    {
      id v3 = [(id)objc_opt_class() signpostLog];
      unint64_t v4 = [(HDSSetupSession *)self signpostID];
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "HomeKitSetupMode", "", buf, 2u);
        }
      }
    }
    self->_homeKitSetupModeState = 1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__HDSSetupSession__runHomeKitSetupMode__block_invoke;
    v6[3] = &unk_2650403C0;
    v6[4] = self;
    [MEMORY[0x263F0E3C0] fetchSetupModeWithCompletion:v6];
  }
}

void __39__HDSSetupSession__runHomeKitSetupMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(void *)(a1 + 32) + 484))
    {
      int v6 = [(id)objc_opt_class() signpostLog];
      uint64_t v7 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HomeKitSetupMode", "", buf, 2u);
        }
      }
    }
    uint64_t v9 = [(id)objc_opt_class() signpostLog];
    uint64_t v10 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "HomeKitSetupMode", "", buf, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 484) = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = a2;
      LogPrintF();
    }
    v20[0] = @"hksm";
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a2, v17);
    v20[1] = @"hh2state";
    v21[0] = v12;
    os_signpost_id_t v13 = [NSNumber numberWithInt:a2 == 1];
    v21[1] = v13;
    id v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v15 = *(void *)(a1 + 32);
    os_signpost_id_t v16 = *(void **)(v15 + 288);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __39__HDSSetupSession__runHomeKitSetupMode__block_invoke_2;
    v18[3] = &unk_26503FC20;
    v18[4] = v15;
    [v16 sendRequestID:@"_hds_hh2" options:0 request:v14 responseHandler:v18];
  }
}

void __39__HDSSetupSession__runHomeKitSetupMode__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    os_signpost_id_t v11 = *(void **)(a1 + 32);
    uint64_t v10 = (id *)(a1 + 32);
    [v11 _logMetricsForSoftError:v7 label:@"ExportHH2State "];
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*((_DWORD *)*v10 + 121))
    {
      uint64_t v12 = [(id)objc_opt_class() signpostLog];
      uint64_t v13 = [*v10 signpostID];
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HomeKitSetupMode", "", buf, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    uint64_t v16 = [*v10 signpostID];
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)int v27 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_END, v17, "HomeKitSetupMode", "", v27, 2u);
      }
    }
    int v18 = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v10 = (id *)(a1 + 32);
    if (!*(_DWORD *)(v19 + 484))
    {
      int v20 = [(id)objc_opt_class() signpostLog];
      uint64_t v21 = [*v10 signpostID];
      if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)int v26 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "HomeKitSetupMode", "", v26, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    uint64_t v23 = [*v10 signpostID];
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)int v25 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_END, v24, "HomeKitSetupMode", "", v25, 2u);
      }
    }
    int v18 = 4;
  }

  *((_DWORD *)*v10 + 121) = v18;
}

- (int)_runPreflightWiFi
{
  int preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2) {
    goto LABEL_95;
  }
  id v5 = &gLogCategory_CLISetupInteractor;
  if (preflightWiFiState || self->_preAuthState != 4)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_95;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v6 = (void *)WiFiCopyCurrentNetworkInfoEx();
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  id v8 = (void *)[v6 mutableCopy];
  [v8 removeObjectForKey:@"password"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    int v62 = v8;
    LogPrintF();
  }
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  uint64_t v10 = v9;
  if (!v9)
  {
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    if (!self->_preflightWiFiState)
    {
      int v18 = [(id)objc_opt_class() signpostLog];
      unint64_t v19 = [(HDSSetupSession *)self signpostID];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PreflightWiFi", "", buf, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    unint64_t v21 = [(HDSSetupSession *)self signpostID];
    if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_92;
    }
    os_signpost_id_t v17 = v21;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_92;
    }
    *(_WORD *)buf = 0;
LABEL_90:
    int v44 = buf;
LABEL_91:
    _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PreflightWiFi", "", v44, 2u);
LABEL_92:

    self->_int preflightWiFiState = 3;
    [(HDSSetupSession *)self _reportError:v11 label:@"PreflightWiFi"];
    LODWORD(v5) = self->_preflightWiFiState;

LABEL_93:
    int v45 = 1;
    goto LABEL_94;
  }
  if (self->_preventAppleWiFi
    && (([v9 isEqual:@"AppleWiFi"] & 1) != 0
     || [v10 isEqual:@"AppleWiFiSecure"]))
  {
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    if (!self->_preflightWiFiState)
    {
      uint64_t v12 = [(id)objc_opt_class() signpostLog];
      unint64_t v13 = [(HDSSetupSession *)self signpostID];
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PreflightWiFi", "", buf, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    unint64_t v16 = [(HDSSetupSession *)self signpostID];
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_92;
    }
    os_signpost_id_t v17 = v16;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_92;
    }
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  if (CFDictionaryGetInt64())
  {
    if (Int64Ranged != 1
      && (v62 = (void *)Int64Ranged, NSPrintF(), (os_signpost_id_t v22 = objc_claimAutoreleasedReturnValue()) != 0)
      || [(SFDevice *)self->_peerDevice osVersion] <= 0xA
      && ([(SFDevice *)self->_peerDevice osVersion],
          NSPrintF(),
          (os_signpost_id_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v23 = NSErrorWithOSStatusF();
      if (!self->_preflightWiFiState)
      {
        os_signpost_id_t v24 = objc_msgSend((id)objc_opt_class(), "signpostLog", v22);
        unint64_t v25 = [(HDSSetupSession *)self signpostID];
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PreflightWiFi", "", buf, 2u);
          }
        }
      }
      id v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v27 = [(HDSSetupSession *)self signpostID];
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v28 = v27;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v28, "PreflightWiFi", "", buf, 2u);
        }
      }

      self->_int preflightWiFiState = 3;
      [(HDSSetupSession *)self _reportError:v23 label:@"PreflightWiFi"];
      LODWORD(v5) = self->_preflightWiFiState;

      goto LABEL_93;
    }
  }
  BOOL wifiIsCaptive = CFDictionaryGetInt64() != 0;
  self->_BOOL wifiIsCaptive = wifiIsCaptive;
  BOOL peerSupportsCaptiveNetworks = self->_peerSupportsCaptiveNetworks;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1
      || (int v31 = _LogCategory_Initialize(), wifiIsCaptive = self->_wifiIsCaptive, v31))
    {
      LogPrintF();
      BOOL wifiIsCaptive = self->_wifiIsCaptive;
    }
  }
  if (!peerSupportsCaptiveNetworks && wifiIsCaptive)
  {
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    if (!self->_preflightWiFiState)
    {
      int v32 = [(id)objc_opt_class() signpostLog];
      unint64_t v33 = [(HDSSetupSession *)self signpostID];
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PreflightWiFi", "", buf, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    unint64_t v35 = [(HDSSetupSession *)self signpostID];
    if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_92;
    }
    os_signpost_id_t v17 = v35;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_92;
    }
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  BOOL v37 = Int64Ranged != 5 || !peerSupportsCaptiveNetworks;
  unsigned int v38 = Int64Ranged - 2;
  if (Int64Ranged >= 2 && v37)
  {
    if (v38 > 7) {
      int v39 = "?";
    }
    else {
      int v39 = off_265040840[v38];
    }
    int v63 = v39;
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    if (!self->_preflightWiFiState)
    {
      int v40 = objc_msgSend((id)objc_opt_class(), "signpostLog", v63);
      unint64_t v41 = [(HDSSetupSession *)self signpostID];
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PreflightWiFi", "", buf, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    unint64_t v43 = [(HDSSetupSession *)self signpostID];
    if (v43 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_92;
    }
    os_signpost_id_t v17 = v43;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_92;
    }
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  *(_DWORD *)buf = 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_104:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_104;
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homePod6GCapable && Int64)
  {
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    if (!self->_preflightWiFiState)
    {
      int v48 = [(id)objc_opt_class() signpostLog];
      unint64_t v49 = [(HDSSetupSession *)self signpostID];
      if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v50 = v49;
        if (os_signpost_enabled(v48))
        {
          *(_WORD *)int v64 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v50, "PreflightWiFi", "", v64, 2u);
        }
      }
    }
    uint64_t v15 = [(id)objc_opt_class() signpostLog];
    unint64_t v51 = [(HDSSetupSession *)self signpostID];
    if (v51 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_92;
    }
    os_signpost_id_t v17 = v51;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_92;
    }
    *(_WORD *)int v64 = 0;
    int v44 = v64;
    goto LABEL_91;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiCCA = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiChannel = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  int v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiOUI = self->_wifiOUI;
  self->_wifiOUI = v52;

  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiRSSI = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  int v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiSecurityString = self->_wifiSecurityString;
  self->_wifiSecurityString = v54;

  if (!*(_DWORD *)buf) {
    goto LABEL_151;
  }
  if (gLogCategory_HDSSetupSession <= 60)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
LABEL_151:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_preflightWiFiState)
  {
    int v56 = [(id)objc_opt_class() signpostLog];
    unint64_t v57 = [(HDSSetupSession *)self signpostID];
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v58 = v57;
      if (os_signpost_enabled(v56))
      {
        *(_WORD *)int v64 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v58, "PreflightWiFi", "", v64, 2u);
      }
    }
  }
  int v59 = [(id)objc_opt_class() signpostLog];
  unint64_t v60 = [(HDSSetupSession *)self signpostID];
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v61 = v60;
    if (os_signpost_enabled(v59))
    {
      *(_WORD *)int v64 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v59, OS_SIGNPOST_INTERVAL_END, v61, "PreflightWiFi", "", v64, 2u);
    }
  }

  int v45 = 0;
  self->_int preflightWiFiState = 4;
LABEL_94:

  if (!v45) {
LABEL_95:
  }
    LODWORD(v5) = self->_preflightWiFiState;
  return (int)v5;
}

- (int)_runPreflightiCloud
{
  v64[1] = *MEMORY[0x263EF8340];
  int preflightiCloudState = self->_preflightiCloudState;
  HIDWORD(v5) = preflightiCloudState;
  LODWORD(v5) = preflightiCloudState;
  int v4 = v5 >> 1;
  if ((v4 - 1) < 2) {
    goto LABEL_81;
  }
  if (v4 == 5)
  {
    if (self->_homeiCloudEnabled)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(HDSSetupSession *)self _homeKitUpdateiCloudSwitchState:1];
      if (!self->_preflightiCloudState)
      {
        os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
        unint64_t v29 = [(HDSSetupSession *)self signpostID];
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v30 = v29;
          if (os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PreflightiCloud", "", buf, 2u);
          }
        }
      }
      int v31 = [(id)objc_opt_class() signpostLog];
      unint64_t v32 = [(HDSSetupSession *)self signpostID];
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_END, v33, "PreflightiCloud", "", buf, 2u);
        }
      }

      self->_int preflightiCloudState = 4;
      goto LABEL_81;
    }
    if (preflightiCloudState == 2 || preflightiCloudState == 4)
    {
LABEL_81:
      LODWORD(v27) = self->_preflightiCloudState;
      return (int)v27;
    }
LABEL_15:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_81;
  }
  if (v4) {
    goto LABEL_15;
  }
  if (gLogCategory_HDSSetupSession > 30) {
    goto LABEL_22;
  }
  if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
    LogPrintF();
  }
  if (!self->_preflightiCloudState)
  {
LABEL_22:
    id v7 = [(id)objc_opt_class() signpostLog];
    unint64_t v8 = [(HDSSetupSession *)self signpostID];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PreflightiCloud", "", buf, 2u);
      }
    }
  }
  self->_int preflightiCloudState = 1;
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 120, 0);
  }
  os_signpost_id_t v11 = [MEMORY[0x263EFB210] defaultStore];
  iCloudAccountStore = self->_iCloudAccountStore;
  self->_iCloudAccountStore = v11;

  unint64_t v13 = [(ACAccountStore *)self->_iCloudAccountStore aa_primaryAppleAccount];
  if (!v13)
  {
    if (!self->_preflightiCloudState)
    {
      os_signpost_id_t v20 = [(id)objc_opt_class() signpostLog];
      unint64_t v21 = [(HDSSetupSession *)self signpostID];
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PreflightiCloud", "", buf, 2u);
        }
      }
    }
    uint64_t v23 = [(id)objc_opt_class() signpostLog];
    unint64_t v24 = [(HDSSetupSession *)self signpostID];
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v25 = v24;
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v23, OS_SIGNPOST_INTERVAL_END, v25, "PreflightiCloud", "", buf, 2u);
      }
    }

    self->_int preflightiCloudState = 3;
    os_signpost_id_t v26 = NSErrorWithOSStatusF();
    [(HDSSetupSession *)self _reportError:v26 label:@"PreflightiCloud"];
    LODWORD(v27) = self->_preflightiCloudState;

    return (int)v27;
  }
  os_signpost_id_t v14 = v13;
  objc_storeStrong((id *)&self->_iCloudAccount, v13);
  uint64_t v15 = [v14 username];
  iCloudUserID = self->_iCloudUserID;
  self->_iCloudUserID = v15;

  if (!self->_iCloudAccountState)
  {
    os_signpost_id_t v17 = [(id)objc_opt_class() signpostLog];
    unint64_t v18 = [(HDSSetupSession *)self signpostID];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "iCloudAccountCheck", "", buf, 2u);
      }
    }
  }
  self->_iCloudAccountState = 1;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_signpost_id_t v34 = self->_iCloudAccountStore;
  uint64_t v63 = *MEMORY[0x263EFB388];
  v64[0] = MEMORY[0x263EFFA88];
  unint64_t v35 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke;
  v59[3] = &unk_265040548;
  id v36 = v14;
  id v60 = v36;
  os_signpost_id_t v61 = self;
  [(ACAccountStore *)v34 aa_updatePropertiesForAppleAccount:v36 options:v35 completion:v59];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v37 = [(objc_class *)getAKAccountManagerClass() sharedInstance];
  unsigned int v38 = [v36 accountPropertyForKey:@"altDSID"];
  if (!v38)
  {
    int v39 = 0;
LABEL_71:
    if (!self->_preflightiCloudState)
    {
      unint64_t v43 = [(id)objc_opt_class() signpostLog];
      unint64_t v44 = [(HDSSetupSession *)self signpostID];
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v45 = v44;
        if (os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v45, "PreflightiCloud", "", buf, 2u);
        }
      }
    }
    unint64_t v27 = [(id)objc_opt_class() signpostLog];
    unint64_t v46 = [(HDSSetupSession *)self signpostID];
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v47 = v46;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v27, OS_SIGNPOST_INTERVAL_END, v47, "PreflightiCloud", "", buf, 2u);
      }
    }

    self->_int preflightiCloudState = 3;
    int v48 = NSErrorWithOSStatusF();
    [(HDSSetupSession *)self _reportError:v48 label:@"PreflightiCloudHSA2"];
    LODWORD(v27) = self->_preflightiCloudState;

    char v49 = 0;
    goto LABEL_80;
  }
  int v39 = [v37 authKitAccountWithAltDSID:v38];
  if (!v39) {
    goto LABEL_71;
  }
  uint64_t v40 = [v37 securityLevelForAccount:v39];
  if (v40 == 5 || !v40) {
    goto LABEL_71;
  }
  unint64_t v41 = getkAccountDataclassHome();
  char v42 = [v36 isEnabledForDataclass:v41];

  if ((v42 & 1) == 0)
  {
    if (self->_promptForHomeiCloudHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiCloudState)
      {
        unint64_t v51 = [(id)objc_opt_class() signpostLog];
        unint64_t v52 = [(HDSSetupSession *)self signpostID];
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v53 = v52;
          if (os_signpost_enabled(v51))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v53, "PreflightiCloud", "", buf, 2u);
          }
        }
      }
      self->_int preflightiCloudState = 10;
      (*((void (**)(void))self->_promptForHomeiCloudHandler + 2))();
      char v49 = 0;
      LODWORD(v27) = self->_preflightiCloudState;
      goto LABEL_80;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HDSSetupSession *)self _homeKitUpdateiCloudSwitchState:1];
  }
  if (!self->_preflightiCloudState)
  {
    int v54 = [(id)objc_opt_class() signpostLog];
    unint64_t v55 = [(HDSSetupSession *)self signpostID];
    if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v56 = v55;
      if (os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PreflightiCloud", "", buf, 2u);
      }
    }
  }
  unint64_t v27 = [(id)objc_opt_class() signpostLog];
  unint64_t v57 = [(HDSSetupSession *)self signpostID];
  if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v58 = v57;
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v27, OS_SIGNPOST_INTERVAL_END, v58, "PreflightiCloud", "", buf, 2u);
    }
  }

  self->_int preflightiCloudState = 4;
  char v49 = 1;
LABEL_80:

  if (v49) {
    goto LABEL_81;
  }
  return (int)v27;
}

void __38__HDSSetupSession__runPreflightiCloud__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    int v6 = objc_msgSend(*(id *)(a1 + 32), "aa_needsToVerifyTerms");
    id v7 = "no";
    if (v6) {
      unint64_t v8 = "yes";
    }
    else {
      unint64_t v8 = "no";
    }
    if (a2) {
      id v7 = "yes";
    }
    unint64_t v13 = v7;
    id v14 = v5;
    uint64_t v12 = v8;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v5, @"Preflight-iCloud", v12, v13, v14);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  os_signpost_id_t v11 = *(void **)(v10 + 120);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke_2;
  v15[3] = &unk_26503FA80;
  void v15[4] = v10;
  [v11 saveVerifiedAccount:v9 withCompletionHandler:v15];
}

void __38__HDSSetupSession__runPreflightiCloud__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v5) {
      [*(id *)(a1 + 32) _logMetricsForSoftError:v5 label:@"Preflight-iCloud"];
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke_3;
  block[3] = &unk_26503F6A8;
  void block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __38__HDSSetupSession__runPreflightiCloud__block_invoke_3(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 144))
  {
    id v2 = [(id)objc_opt_class() signpostLog];
    uint64_t v3 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "iCloudAccountCheck", "", buf, 2u);
      }
    }
  }
  id v5 = [(id)objc_opt_class() signpostLog];
  uint64_t v6 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "iCloudAccountCheck", "", v9, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 144) = 4;
  return [*(id *)(a1 + 32) _run];
}

- (int)_runPreflightiTunes
{
  int result = self->_preflightiTunesState;
  switch(result)
  {
    case 0:
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_20;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
LABEL_20:
        id v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreflightiTunes", "", buf, 2u);
          }
        }
      }
      self->_preflightiTunesState = 1;
      if (self->_iTunesAccount)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_appleMusicEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (!self->_preflightiTunesState)
          {
            int v31 = [(id)objc_opt_class() signpostLog];
            unint64_t v32 = [(HDSSetupSession *)self signpostID];
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v33 = v32;
              if (os_signpost_enabled(v31))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PreflightiTunes", "", buf, 2u);
              }
            }
          }
          os_signpost_id_t v11 = [(id)objc_opt_class() signpostLog];
          unint64_t v34 = [(HDSSetupSession *)self signpostID];
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v13 = v34;
            if (os_signpost_enabled(v11))
            {
              *(_WORD *)buf = 0;
              goto LABEL_93;
            }
          }
          goto LABEL_94;
        }
        int appleMusicState = self->_appleMusicState;
        if (appleMusicState == 1)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (self->_preflightiTunesState)
          {
LABEL_113:
            int result = 11;
            self->_preflightiTunesState = 11;
            progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
            if (progressHandler)
            {
              progressHandler[2](self->_progressHandler, 122, 0);
              return self->_preflightiTunesState;
            }
            return result;
          }
          uint64_t v15 = [(id)objc_opt_class() signpostLog];
          unint64_t v41 = [(HDSSetupSession *)self signpostID];
          if (v41 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v17 = v41, !os_signpost_enabled(v15)))
          {
LABEL_112:

            goto LABEL_113;
          }
          *(_WORD *)buf = 0;
        }
        else
        {
          if (appleMusicState)
          {
            if (!self->_preflightiTunesState)
            {
              unint64_t v18 = [(id)objc_opt_class() signpostLog];
              unint64_t v19 = [(HDSSetupSession *)self signpostID];
              if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v20 = v19;
                if (os_signpost_enabled(v18))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PreflightiTunes", "", buf, 2u);
                }
              }
            }
            unint64_t v21 = [(id)objc_opt_class() signpostLog];
            unint64_t v22 = [(HDSSetupSession *)self signpostID];
            if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v23 = v22;
              if (os_signpost_enabled(v21))
              {
                *(_WORD *)buf = 0;
                goto LABEL_75;
              }
            }
            goto LABEL_76;
          }
          [(HDSSetupSession *)self preflightAppleMusic];
          if (self->_preflightiTunesState) {
            goto LABEL_113;
          }
          uint64_t v15 = [(id)objc_opt_class() signpostLog];
          unint64_t v16 = [(HDSSetupSession *)self signpostID];
          if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_112;
          }
          os_signpost_id_t v17 = v16;
          if (!os_signpost_enabled(v15)) {
            goto LABEL_112;
          }
          *(_WORD *)buf = 0;
        }
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PreflightiTunes", "", buf, 2u);
        goto LABEL_112;
      }
      if (self->_promptForiTunesSignInHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_preflightiTunesState)
        {
          os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
          unint64_t v29 = [(HDSSetupSession *)self signpostID];
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v30 = v29;
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PreflightiTunes", "", buf, 2u);
            }
          }
        }
        self->_preflightiTunesState = 10;
        (*((void (**)(void))self->_promptForiTunesSignInHandler + 2))();
        return self->_preflightiTunesState;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        unint64_t v35 = [(id)objc_opt_class() signpostLog];
        unint64_t v36 = [(HDSSetupSession *)self signpostID];
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v37 = v36;
          if (os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v37, "PreflightiTunes", "", buf, 2u);
          }
        }
      }
      unsigned int v38 = [(id)objc_opt_class() signpostLog];
      unint64_t v39 = [(HDSSetupSession *)self signpostID];
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v38, OS_SIGNPOST_INTERVAL_END, v40, "PreflightiTunes", "", buf, 2u);
        }
      }

      int result = 2;
      self->_preflightiTunesState = 2;
      self->_iTunesSignInSkip = 1;
      return result;
    case 2:
    case 4:
      return result;
    case 10:
      if (!self->_iTunesSignInSkip) {
        goto LABEL_13;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        unint64_t v8 = [(id)objc_opt_class() signpostLog];
        unint64_t v9 = [(HDSSetupSession *)self signpostID];
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v10 = v9;
          if (os_signpost_enabled(v8))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreflightiTunes", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v11 = [(id)objc_opt_class() signpostLog];
      unint64_t v12 = [(HDSSetupSession *)self signpostID];
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
LABEL_93:
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PreflightiTunes", "", buf, 2u);
        }
      }
LABEL_94:

      int result = 2;
      goto LABEL_95;
    case 11:
      if (self->_appleMusicState < 2) {
        goto LABEL_13;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        unint64_t v24 = [(id)objc_opt_class() signpostLog];
        unint64_t v25 = [(HDSSetupSession *)self signpostID];
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PreflightiTunes", "", buf, 2u);
          }
        }
      }
      unint64_t v21 = [(id)objc_opt_class() signpostLog];
      unint64_t v27 = [(HDSSetupSession *)self signpostID];
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v23 = v27;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
LABEL_75:
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v21, OS_SIGNPOST_INTERVAL_END, v23, "PreflightiTunes", "", buf, 2u);
        }
      }
LABEL_76:

      int result = 4;
LABEL_95:
      self->_preflightiTunesState = result;
      return result;
    default:
LABEL_13:
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1
          || (int v4 = _LogCategory_Initialize(), result = self->_preflightiTunesState, v4))
        {
          LogPrintF();
          return self->_preflightiTunesState;
        }
      }
      return result;
  }
}

- (int)_runPreflightCDP
{
  int result = self->_preflightCDPState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_preflightCDPState = 1;
    int v4 = [(objc_class *)getCDPAccountClass() sharedInstance];
    id v5 = SVSLocalizedString(@"HOME_DEVICE_SETUP_CUSTOMER_NAME");
    id v6 = objc_alloc(MEMORY[0x263F34A18]);
    os_signpost_id_t v7 = [v4 primaryAccountAltDSID];
    unint64_t v8 = (void *)[v6 initWithAltDSID:v7];

    [v8 setFeatureName:v5];
    [v8 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
    [v8 setDeviceToDeviceEncryptionUpgradeType:0];
    if (self->_presentingChildViewController) {
      objc_msgSend(v8, "setPresentingViewController:");
    }
    [v8 setSecurityUpgradeContext:*MEMORY[0x263F29098]];
    unint64_t v9 = (CDPUIDeviceToDeviceEncryptionHelper *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v8];
    cdpEncryptionHelper = self->_cdpEncryptionHelper;
    self->_cdpEncryptionHelper = v9;

    os_signpost_id_t v11 = self->_cdpEncryptionHelper;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__HDSSetupSession__runPreflightCDP__block_invoke;
    v12[3] = &unk_26503FA80;
    void v12[4] = self;
    [(CDPUIDeviceToDeviceEncryptionHelper *)v11 performDeviceToDeviceEncryptionStateRepairWithCompletion:v12];

    return self->_preflightCDPState;
  }
  return result;
}

void __35__HDSSetupSession__runPreflightCDP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  os_signpost_id_t v7 = *(NSObject **)(v6 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession__runPreflightCDP__block_invoke_2;
  block[3] = &unk_265040570;
  id v10 = v5;
  uint64_t v11 = v6;
  char v12 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __35__HDSSetupSession__runPreflightCDP__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (int v3 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v3))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    int v4 = *(void **)(a1 + 40);
    return [v4 _reportError:v2 label:@"CDPManateeRepair"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 40) + 100) = 4;
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 _run];
  }
}

- (int)_runPreflightJSCheck
{
  int homePodJSCheckState = self->_homePodJSCheckState;
  switch(homePodJSCheckState)
  {
    case 4:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodJSCheckState;
      }
LABEL_12:
      LogPrintF();
      return self->_homePodJSCheckState;
    case 1:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodJSCheckState;
      }
      goto LABEL_12;
    case 0:
      self->_int homePodJSCheckState = 1;
      int v4 = objc_opt_new();
      id v5 = [(HDSSetupSession *)self selectedSiriLanguageCode];
      [v4 setObject:v5 forKeyedSubscript:@"usr_lang_code"];

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        unint64_t v9 = v4;
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 40, 0);
      }
      sfSession = self->_sfSession;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      void v10[2] = __39__HDSSetupSession__runPreflightJSCheck__block_invoke;
      v10[3] = &unk_26503FC20;
      v10[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_hds_hp_js", &unk_26F260CF8, v4, v10, v9 options request responseHandler];

      break;
  }
  return self->_homePodJSCheckState;
}

void __39__HDSSetupSession__runPreflightJSCheck__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  os_signpost_id_t v7 = *(NSObject **)(v6 + 1512);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__HDSSetupSession__runPreflightJSCheck__block_invoke_2;
  v9[3] = &unk_26503F8F0;
  v9[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

uint64_t __39__HDSSetupSession__runPreflightJSCheck__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1368) = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1372) = 4;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (int)_runPreflightMisc
{
  int preflightMiscState = self->_preflightMiscState;
  id v5 = &gLogCategory_HDSSetupSession;
  uint64_t v6 = "-[HDSSetupSession _runPreflightMisc]";
  os_signpost_id_t v7 = "_runPreflightMisc start\n";
  id v8 = "Preflight Misc done\n";
  unint64_t v9 = "_runPreflightMisc location fetch status\n";
  id v10 = &gLogCategory_CLISetupInteractor;
  while (2)
  {
    int v11 = preflightMiscState;
    switch(preflightMiscState)
    {
      case 0:
        int v12 = v10[570];
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(HDSSetupSession *)self fetchLocationServicesEnabled];
        goto LABEL_102;
      case 4:
        int v13 = v10[570];
        if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_102;
      case 10:
        int v14 = v10[570];
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        BOOL locationServicesEnabled = self->_locationServicesEnabled;
        if (self->_locationServicesEnabled)
        {
          int v23 = v10[570];
LABEL_37:
          if (v23 <= 30)
          {
            if (v23 != -1)
            {
LABEL_39:
              BOOL v24 = !locationServicesEnabled;
              unint64_t v25 = "yes";
              if (v24) {
                unint64_t v25 = "no";
              }
              int v62 = v25;
              LogPrintF();
              goto LABEL_83;
            }
            if (_LogCategory_Initialize())
            {
              BOOL locationServicesEnabled = self->_locationServicesEnabled;
              goto LABEL_39;
            }
          }
LABEL_83:
          self->_locationEnabled = 1;
          if (!self->_preflightMiscState)
          {
            char v49 = [(id)objc_opt_class() signpostLog];
            unint64_t v50 = [(HDSSetupSession *)self signpostID];
            if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v51 = v50;
              if (os_signpost_enabled(v49))
              {
                *(_WORD *)int v71 = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v51, "PreflightMisc", "", v71, 2u);
              }
            }

            id v10 = &gLogCategory_CLISetupInteractor;
          }
          self->_int preflightMiscState = 12;
          promptForLocationAlreadyEnabledHandler = (void (**)(id, BOOL))self->_promptForLocationAlreadyEnabledHandler;
          if (promptForLocationAlreadyEnabledHandler) {
            promptForLocationAlreadyEnabledHandler[2](promptForLocationAlreadyEnabledHandler, self->_locationServicesEnabled);
          }
          goto LABEL_102;
        }
        int v23 = v10[570];
        if (!self->_promptForLocationEnableHandler) {
          goto LABEL_37;
        }
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (!self->_preflightMiscState)
        {
          os_signpost_id_t v58 = [(id)objc_opt_class() signpostLog];
          unint64_t v59 = [(HDSSetupSession *)self signpostID];
          if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v60 = v59;
            if (os_signpost_enabled(v58))
            {
              *(_WORD *)int v70 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v60, "PreflightMisc", "", v70, 2u);
            }
          }

          id v10 = &gLogCategory_CLISetupInteractor;
        }
        self->_int preflightMiscState = 11;
        id promptForLocationEnableHandler = (void (**)(id, SEL, void))self->_promptForLocationEnableHandler;
        if (promptForLocationEnableHandler) {
          goto LABEL_101;
        }
LABEL_102:
        int preflightMiscState = self->_preflightMiscState;
        if (preflightMiscState != v11) {
          continue;
        }
        return v11;
      case 11:
        if (self->_locationDecided)
        {
          int v15 = 12;
          goto LABEL_62;
        }
        goto LABEL_102;
      case 12:
        int v16 = v10[570];
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        os_signpost_id_t v26 = [(objc_class *)getVTPreferencesClass_0() sharedPreferences];
        int v27 = [v26 voiceTriggerEnabled];

        id v10 = &gLogCategory_CLISetupInteractor;
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
            LogPrintF();
          }
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            {
              char v42 = v5;
              unint64_t v43 = v6;
              unint64_t v44 = v9;
              os_signpost_id_t v45 = v8;
              unint64_t v46 = v7;
              if (v27) {
                os_signpost_id_t v47 = "yes";
              }
              else {
                os_signpost_id_t v47 = "no";
              }
              int v48 = _Block_copy(self->_promptForSiriEnableHandler);
              [(HDSSetupSession *)self selectedSiriLanguageCode];
              v64 = uint64_t v63 = v48;
              int v62 = v47;
              os_signpost_id_t v7 = v46;
              id v8 = v45;
              unint64_t v9 = v44;
              uint64_t v6 = v43;
              id v5 = v42;
              LogPrintF();

              id v10 = &gLogCategory_CLISetupInteractor;
            }
            int v53 = v10[570];
            if (v53 <= 30 && (v53 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
          }
        }
        if (!self->_preflightMiscState)
        {
          int v54 = [(id)objc_opt_class() signpostLog];
          unint64_t v55 = [(HDSSetupSession *)self signpostID];
          if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v56 = v55;
            if (os_signpost_enabled(v54))
            {
              *(_WORD *)int v69 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PreflightMisc", "", v69, 2u);
            }
          }

          id v10 = &gLogCategory_CLISetupInteractor;
        }
        self->_int preflightMiscState = 13;
        id promptForLocationEnableHandler = (void (**)(id, SEL, void))self->_promptForSiriEnableHandler;
        if (promptForLocationEnableHandler) {
LABEL_101:
        }
          promptForLocationEnableHandler[2](promptForLocationEnableHandler, a2, v2);
        goto LABEL_102;
      case 13:
        int v17 = v10[570];
        if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v18 = "yes";
          if (!self->_siriEnabled) {
            unint64_t v18 = "no";
          }
          int v62 = v18;
          LogPrintF();
        }
        if (self->_siriEnabled)
        {
          self->_int preflightMiscState = 4;
          os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
          unint64_t v29 = [(HDSSetupSession *)self signpostID];
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v30 = v29;
            if (os_signpost_enabled(v28))
            {
              __int16 v68 = 0;
              int v31 = (uint8_t *)&v68;
              unint64_t v32 = v28;
              os_signpost_id_t v33 = v30;
              goto LABEL_73;
            }
          }
          goto LABEL_74;
        }
        goto LABEL_102;
      case 14:
        int v19 = v10[570];
        if (v19 <= 30)
        {
          if (v19 != -1 || _LogCategory_Initialize()) {
            LogPrintF();
          }
          if (!self->_preflightMiscState)
          {
            unint64_t v34 = [(id)objc_opt_class() signpostLog];
            unint64_t v35 = [(HDSSetupSession *)self signpostID];
            if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v36 = v35;
              if (os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PreflightMisc", "", buf, 2u);
              }
            }

            id v10 = &gLogCategory_CLISetupInteractor;
          }
        }
        int v15 = 15;
LABEL_62:
        self->_int preflightMiscState = v15;
        goto LABEL_102;
      case 15:
        int v20 = v10[570];
        if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v21 = "yes";
          if (!self->_selectedSiriVoice) {
            unint64_t v21 = "no";
          }
          int v62 = v21;
          LogPrintF();
        }
        if (self->_selectedSiriVoice)
        {
          if (!self->_preflightMiscState)
          {
            os_signpost_id_t v37 = [(id)objc_opt_class() signpostLog];
            unint64_t v38 = [(HDSSetupSession *)self signpostID];
            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v39 = v38;
              if (os_signpost_enabled(v37))
              {
                *(_WORD *)int v66 = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PreflightMisc", "", v66, 2u);
              }
            }
          }
          os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
          unint64_t v40 = [(HDSSetupSession *)self signpostID];
          if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v41 = v40;
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)int v65 = 0;
              int v31 = v65;
              unint64_t v32 = v28;
              os_signpost_id_t v33 = v41;
LABEL_73:
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v32, OS_SIGNPOST_INTERVAL_END, v33, "PreflightMisc", "", v31, 2u);
            }
          }
LABEL_74:

          self->_int preflightMiscState = 4;
          id v10 = &gLogCategory_CLISetupInteractor;
        }
        goto LABEL_102;
      default:
        goto LABEL_102;
    }
  }
}

- (int)_runHomeKitUserInput
{
  int homeKitUserInputState = self->_homeKitUserInputState;
  if (homeKitUserInputState != 4)
  {
    if (homeKitUserInputState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_11;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_homeKitUserInputState)
      {
LABEL_11:
        int v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitUserInput", "", buf, 2u);
          }
        }
      }
      self->_int homeKitUserInputState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 230, 0);
      }
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
      id v8 = objc_alloc_init(HDSDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v8;

      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setSessionID:self->_sessionID];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setIsCLIMode:self->_isCLIMode];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setUserInteractive:1];
      id v10 = [(SSAccount *)self->_iTunesAccount backingAccount];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setITunesAccount:v10];

      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setITunesAccountID:self->_iTunesUserID];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPauseAfterUserInput:1];
      if (self->_promptForHomeHandler) {
        -[HDSDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetupOperation, "setPromptForHomeHandler:");
      }
      if (self->_promptForRoomHandlerDetailed) {
        -[HDSDeviceOperationHomeKitSetup setPromptForRoomHandlerDetailed:](self->_homeKitSetupOperation, "setPromptForRoomHandlerDetailed:");
      }
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPromptToInstallHomeAppHandler:self->_promptToInstallHomeAppHandler];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __39__HDSSetupSession__runHomeKitUserInput__block_invoke;
      v13[3] = &unk_26503F6A8;
      void v13[4] = self;
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPauseHandler:v13];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __39__HDSSetupSession__runHomeKitUserInput__block_invoke_2;
      v12[3] = &unk_265040598;
      void v12[4] = self;
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v12];
      [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation activate];
    }
  }
  return self->_homeKitUserInputState;
}

uint64_t __39__HDSSetupSession__runHomeKitUserInput__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 968) homeKitSelectedRoomName];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 992);
  *(void *)(v3 + 992) = v2;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 976))
  {
    unint64_t v5 = [(id)objc_opt_class() signpostLog];
    uint64_t v6 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HomeKitUserInput", "", buf, 2u);
      }
    }
  }
  id v8 = [(id)objc_opt_class() signpostLog];
  uint64_t v9 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)unint64_t v38 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "HomeKitUserInput", "", v38, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 976) = 4;
  *(unsigned char *)(*(void *)(a1 + 32) + 1450) = [*(id *)(*(void *)(a1 + 32) + 968) hasHomePod];
  *(unsigned char *)(*(void *)(a1 + 32) + 1080) = [*(id *)(a1 + 32) selectedRoomHasHomePods];
  uint64_t v11 = [*(id *)(a1 + 32) _selectedRoomHomePod];
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 1088);
  *(void *)(v12 + 1088) = v11;

  int v14 = [*(id *)(a1 + 32) _homePodsInSelectedHome];
  *(void *)(*(void *)(a1 + 32) + 1184) = [v14 count];

  *(unsigned char *)(*(void *)(a1 + 32) + 1096) = [*(id *)(a1 + 32) _shouldShowPRCardForHomePodsInRoom];
  *(unsigned char *)(*(void *)(a1 + 32) + 1451) = [*(id *)(*(void *)(a1 + 32) + 968) hasMultipleUsers];
  int v15 = [*(id *)(*(void *)(a1 + 32) + 968) homeKitHomeManager];
  *(unsigned char *)(*(void *)(a1 + 32) + 1456) = [v15 hasOptedToHH2];

  int v16 = [*(id *)(*(void *)(a1 + 32) + 968) homeKitHomeManager];
  *(unsigned char *)(*(void *)(a1 + 32) + 1258) = [v16 homeSafetySecurityEnabled];

  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 1456)) {
        int v17 = "yes";
      }
      else {
        int v17 = "no";
      }
      unint64_t v35 = v17;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 1258)) {
        unint64_t v18 = "yes";
      }
      else {
        unint64_t v18 = "no";
      }
      unint64_t v35 = v18;
      LogPrintF();
    }
  }
  int v19 = objc_msgSend(*(id *)(a1 + 32), "selectedHome", v35);
  *(unsigned char *)(*(void *)(a1 + 32) + 570) = [v19 didOnboardAudioAnalysis];

  int v20 = [*(id *)(a1 + 32) _homePodsInAccount];
  *(void *)(*(void *)(a1 + 32) + 1192) = [v20 count];

  *(unsigned char *)(*(void *)(a1 + 32) + 1449) = *(void *)(*(void *)(a1 + 32) + 1192) != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1449)) {
      unint64_t v21 = "yes";
    }
    else {
      unint64_t v21 = "no";
    }
    os_signpost_id_t v36 = v21;
    LogPrintF();
  }
  unint64_t v22 = objc_msgSend(*(id *)(a1 + 32), "availableHomes", v36);
  *(void *)(*(void *)(a1 + 32) + 1200) = [v22 count];

  int v23 = [*(id *)(a1 + 32) selectedHome];
  *(unsigned char *)(*(void *)(a1 + 32) + 1257) = [v23 isAutomaticSoftwareUpdateEnabled];

  BOOL v24 = [*(id *)(a1 + 32) selectedHome];
  if ([v24 didOnboardAudioAnalysis]) {
    int v25 = 1;
  }
  else {
    int v25 = 3;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1264) = v25;

  [*(id *)(*(void *)(a1 + 32) + 968) homekitDataSyncSeconds];
  *(void *)(*(void *)(a1 + 32) + 1064) = v26;
  [*(id *)(*(void *)(a1 + 32) + 968) accessorySyncSeconds];
  *(void *)(*(void *)(a1 + 32) + 1072) = v27;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      os_signpost_id_t v28 = [*(id *)(*(void *)(a1 + 32) + 968) homeKitSelectedHome];
      os_signpost_id_t v37 = [v28 residentDevices];
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 1257)) {
        unint64_t v29 = "yes";
      }
      else {
        unint64_t v29 = "no";
      }
      os_signpost_id_t v37 = (void *)v29;
      LogPrintF();
    }
  }
  uint64_t v30 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v30 + 1446) && *(unsigned char *)(v30 + 1448))
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v31 = _LogCategory_Initialize(), uint64_t v30 = *(void *)(a1 + 32), v31))
      {
        LogPrintF();
        uint64_t v30 = *(void *)(a1 + 32);
      }
    }
    os_signpost_id_t v37 = *(void **)(v30 + 1496);
    FPrintF();
    unint64_t v32 = dispatch_semaphore_create(0);
    dispatch_time_t v33 = dispatch_time(0, 1000000000 * *(void *)(*(void *)(a1 + 32) + 1496));
    dispatch_semaphore_wait(v32, v33);

    uint64_t v30 = *(void *)(a1 + 32);
  }
  return objc_msgSend((id)v30, "_run", v37);
}

void __39__HDSSetupSession__runHomeKitUserInput__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 968))
  {
    if (!v5)
    {
      NSErrorWithOSStatusF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = *(void *)(a1 + 32);
    }
    if (!*(_DWORD *)(v7 + 976))
    {
      id v8 = [(id)objc_opt_class() signpostLog];
      uint64_t v9 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitUserInput", "", buf, 2u);
        }
      }
    }
    uint64_t v11 = [(id)objc_opt_class() signpostLog];
    uint64_t v12 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)int v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitUserInput", "", v15, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 976) = 3;
    if (v6) {
      int v14 = v6;
    }
    else {
      int v14 = @"NoLabel";
    }
    [*(id *)(a1 + 32) _reportError:v5 label:v14];
  }
}

- (int)_runStereoPairUserInput
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  int stereoPairUserInputState = self->_stereoPairUserInputState;
  while (2)
  {
    int v4 = stereoPairUserInputState;
    switch(stereoPairUserInputState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_48;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_stereoPairUserInputState)
        {
LABEL_48:
          int v19 = [(id)objc_opt_class() signpostLog];
          unint64_t v20 = [(HDSSetupSession *)self signpostID];
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v21 = v20;
            if (os_signpost_enabled(v19))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "StereoUserInput", "", buf, 2u);
            }
          }
        }
        int v11 = 10;
        goto LABEL_100;
      case 10:
        id v5 = [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation findStereoCounterpartsWithSupportedVersions:[(HDSSetupSession *)self _peerDeviceSupportedStereoPairVersions]];
        potentialStereoCounterparts = self->_potentialStereoCounterparts;
        self->_potentialStereoCounterparts = v5;

        deviceSerialNumber = self->_deviceSerialNumber;
        if (!deviceSerialNumber) {
          goto LABEL_76;
        }
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_66;
        }
        if (gLogCategory_HDSSetupSession != -1) {
          goto LABEL_9;
        }
        if (_LogCategory_Initialize())
        {
          deviceSerialNumber = self->_deviceSerialNumber;
LABEL_9:
          unint64_t v55 = deviceSerialNumber;
          LogPrintF();
        }
LABEL_66:
        os_signpost_id_t v28 = (NSArray *)objc_opt_new();
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        unint64_t v29 = self->_potentialStereoCounterparts;
        uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v57 != v32) {
                objc_enumerationMutation(v29);
              }
              unint64_t v34 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              unint64_t v35 = objc_msgSend(v34, "serialNumber", v55);
              char v36 = [v35 isEqualToString:self->_deviceSerialNumber];

              if ((v36 & 1) == 0) {
                [(NSArray *)v28 addObject:v34];
              }
            }
            uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v56 objects:v61 count:16];
          }
          while (v31);
        }

        os_signpost_id_t v37 = self->_potentialStereoCounterparts;
        self->_potentialStereoCounterparts = v28;

LABEL_76:
        if ([(NSArray *)self->_potentialStereoCounterparts count])
        {
          if (_os_feature_enabled_impl()) {
            [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation performReadinessCheck:self->_potentialStereoCounterparts];
          }
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            unint64_t v55 = self->_potentialStereoCounterparts;
            LogPrintF();
          }
          int v38 = self->_stereoPairUserInputState;
LABEL_99:
          int v11 = v38 + 1;
LABEL_100:
          self->_int stereoPairUserInputState = v11;
          goto LABEL_122;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_stereoPairUserInputState)
        {
          unint64_t v46 = [(id)objc_opt_class() signpostLog];
          unint64_t v47 = [(HDSSetupSession *)self signpostID];
          if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v48 = v47;
            if (os_signpost_enabled(v46))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "StereoUserInput", "", buf, 2u);
            }
          }
        }
        unint64_t v43 = [(id)objc_opt_class() signpostLog];
        unint64_t v49 = [(HDSSetupSession *)self signpostID];
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_119;
        }
        os_signpost_id_t v45 = v49;
        if (!os_signpost_enabled(v43)) {
          goto LABEL_119;
        }
        goto LABEL_118;
      case 11:
        if (self->_promptForStereoRoleHandler)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          -[HDSSetupSession _runStereoPairUserInputPickColors:](self, "_runStereoPairUserInputPickColors:", 0, v55);
          ++self->_stereoPairUserInputState;
          (*((void (**)(void))self->_promptForStereoRoleHandler + 2))();
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (!self->_stereoPairUserInputState)
          {
            unint64_t v50 = [(id)objc_opt_class() signpostLog];
            unint64_t v51 = [(HDSSetupSession *)self signpostID];
            if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v52 = v51;
              if (os_signpost_enabled(v50))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v52, "StereoUserInput", "", buf, 2u);
              }
            }
          }
          unint64_t v43 = [(id)objc_opt_class() signpostLog];
          unint64_t v53 = [(HDSSetupSession *)self signpostID];
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v45 = v53;
            if (os_signpost_enabled(v43))
            {
LABEL_118:
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v43, OS_SIGNPOST_INTERVAL_END, v45, "StereoUserInput", "", buf, 2u);
            }
          }
LABEL_119:

          self->_int stereoPairUserInputState = 2;
        }
LABEL_122:
        int stereoPairUserInputState = self->_stereoPairUserInputState;
        if (stereoPairUserInputState != v4) {
          continue;
        }
        return v4;
      case 12:
        uint64_t stereoPairRole = self->_stereoPairRole;
        if (!stereoPairRole) {
          goto LABEL_122;
        }
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1
            || (int v39 = _LogCategory_Initialize(), stereoPairRole = self->_stereoPairRole, v39))
          {
            os_signpost_id_t v13 = "?";
            if (stereoPairRole <= 3) {
              os_signpost_id_t v13 = off_265040918[(int)stereoPairRole];
            }
            unint64_t v55 = (void *)v13;
            LogPrintF();
            uint64_t stereoPairRole = self->_stereoPairRole;
          }
        }
        -[HDSDeviceOperationHomeKitSetup setStereoRole:](self->_homeKitSetupOperation, "setStereoRole:", stereoPairRole, v55);
        int v38 = self->_stereoPairUserInputState;
        if (self->_stereoPairRole != 1) {
          goto LABEL_99;
        }
        if (!v38)
        {
          unint64_t v40 = [(id)objc_opt_class() signpostLog];
          unint64_t v41 = [(HDSSetupSession *)self signpostID];
          if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v42 = v41;
            if (os_signpost_enabled(v40))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "StereoUserInput", "", buf, 2u);
            }
          }
        }
        unint64_t v43 = [(id)objc_opt_class() signpostLog];
        unint64_t v44 = [(HDSSetupSession *)self signpostID];
        if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v45 = v44;
          if (os_signpost_enabled(v43)) {
            goto LABEL_118;
          }
        }
        goto LABEL_119;
      case 13:
        if ([(NSArray *)self->_potentialStereoCounterparts count] == 1
          || !self->_promptForStereoMultipleHandler)
        {
          int v14 = [(NSArray *)self->_potentialStereoCounterparts firstObject];
          stereoCounterpartAccessory = self->_stereoCounterpartAccessory;
          self->_stereoCounterpartAccessory = v14;

          [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setStereoCounterpart:self->_stereoCounterpartAccessory];
          if (!self->_stereoPairUserInputState)
          {
            int v16 = [(id)objc_opt_class() signpostLog];
            unint64_t v17 = [(HDSSetupSession *)self signpostID];
            if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v18 = v17;
              if (os_signpost_enabled(v16))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "StereoUserInput", "", buf, 2u);
              }
            }
          }
          self->_int stereoPairUserInputState = 15;
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            unint64_t v55 = self->_stereoCounterpartAccessory;
            LogPrintF();
          }
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            unint64_t v55 = self->_potentialStereoCounterparts;
            LogPrintF();
          }
          ++self->_stereoPairUserInputState;
          (*((void (**)(void))self->_promptForStereoMultipleHandler + 2))();
        }
        goto LABEL_122;
      case 14:
        if (!self->_stereoCounterpartAccessory) {
          goto LABEL_122;
        }
        -[HDSDeviceOperationHomeKitSetup setStereoCounterpart:](self->_homeKitSetupOperation, "setStereoCounterpart:");
        if (!self->_stereoPairUserInputState)
        {
          id v8 = [(id)objc_opt_class() signpostLog];
          unint64_t v9 = [(HDSSetupSession *)self signpostID];
          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v10 = v9;
            if (os_signpost_enabled(v8))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StereoUserInput", "", buf, 2u);
            }
          }
        }
        int v11 = 15;
        goto LABEL_100;
      case 15:
        [(HDSSetupSession *)self _runStereoPairUserInputPickColors:1];
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_stereoPairUserInputState)
        {
          unint64_t v22 = [(id)objc_opt_class() signpostLog];
          unint64_t v23 = [(HDSSetupSession *)self signpostID];
          if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v24 = v23;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "StereoUserInput", "", buf, 2u);
            }
          }
        }
        int v25 = [(id)objc_opt_class() signpostLog];
        unint64_t v26 = [(HDSSetupSession *)self signpostID];
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_END, v27, "StereoUserInput", "", buf, 2u);
          }
        }

        int v11 = 4;
        goto LABEL_100;
      default:
        goto LABEL_122;
    }
  }
}

- (int)_runSetupPSG
{
  uint64_t v2 = self;
  uint64_t v71 = *MEMORY[0x263EF8340];
  switch(self->_psgState)
  {
    case 0:
      if (!self->_promptForSetupPSGHandler)
      {
        if (gLogCategory_HDSSetupSession > 30
          || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_95;
        }
        goto LABEL_22;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v2->_psgState = 1;
      (*((void (**)(void))v2->_promptForSetupPSGHandler + 2))();
      break;
    case 1:
      if (self->_psgSelected)
      {
        if (self->_psgEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          unint64_t v53 = [(NSSet *)v2->_psgsInSelectedRoom anyObject];
          uint64_t v3 = [(HDSSetupSession *)v2 _selectedRoomAllHomePods];
          unint64_t v51 = (void *)[v3 copy];

          int v54 = v2;
          int v4 = [(HDSSetupSession *)v2 _selectedRoomAllStereoPairs];
          id v5 = (void *)[v4 copy];

          uint64_t v6 = objc_opt_new();
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          obuint64_t j = v5;
          uint64_t v7 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v65 != v9) {
                  objc_enumerationMutation(obj);
                }
                int v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                uint64_t v12 = [v11 components];
                uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
                if (v13)
                {
                  uint64_t v14 = v13;
                  uint64_t v15 = *(void *)v61;
                  do
                  {
                    for (uint64_t j = 0; j != v14; ++j)
                    {
                      if (*(void *)v61 != v15) {
                        objc_enumerationMutation(v12);
                      }
                      unint64_t v17 = [*(id *)(*((void *)&v60 + 1) + 8 * j) mediaProfile];
                      os_signpost_id_t v18 = [v17 accessory];
                      [v6 addObject:v18];
                    }
                    uint64_t v14 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
                  }
                  while (v14);
                }
              }
              uint64_t v8 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
            }
            while (v8);
          }

          if (v54->_stereoPairUserInputState == 4)
          {
            stereoCounterpartAccessory = v54->_stereoCounterpartAccessory;
            if (stereoCounterpartAccessory)
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1
                 || (int v20 = _LogCategory_Initialize(), stereoCounterpartAccessory = v54->_stereoCounterpartAccessory, v20)))
              {
                unint64_t v49 = stereoCounterpartAccessory;
                LogPrintF();
                objc_msgSend(v6, "addObject:", v54->_stereoCounterpartAccessory, v49);
              }
              else
              {
                objc_msgSend(v6, "addObject:", stereoCounterpartAccessory, v48);
              }
            }
          }
          os_signpost_id_t v21 = objc_opt_new();
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v22 = v51;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v57;
            do
            {
              for (uint64_t k = 0; k != v24; ++k)
              {
                if (*(void *)v57 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * k);
                if (([v6 containsObject:v27] & 1) == 0) {
                  [v21 addObject:v27];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v24);
          }

          uint64_t v2 = v54;
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            {
              id v48 = v53;
              LogPrintF();
            }
            if (gLogCategory_HDSSetupSession <= 30)
            {
              if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
              {
                id v48 = v21;
                LogPrintF();
              }
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                id v48 = obj;
                LogPrintF();
              }
            }
          }
          os_signpost_id_t v28 = NSString;
          unint64_t v29 = objc_msgSend(@"psgStereoPairs", "substringToIndex:", 1, v48);
          uint64_t v30 = [v29 uppercaseString];
          uint64_t v31 = [@"psgStereoPairs" substringFromIndex:1];
          uint64_t v32 = [v28 stringWithFormat:@"%@%@", v30, v31];

          dispatch_time_t v33 = NSString;
          unint64_t v34 = [@"psgHomePods" substringToIndex:1];
          unint64_t v35 = [v34 uppercaseString];
          char v36 = [@"psgHomePods" substringFromIndex:1];
          os_signpost_id_t v37 = [v33 stringWithFormat:@"%@%@", v35, v36];

          int v38 = NSString;
          int v39 = [@"existingMediaGroup" substringToIndex:1];
          unint64_t v40 = [v39 uppercaseString];
          unint64_t v41 = [@"existingMediaGroup" substringFromIndex:1];
          uint64_t v42 = [v38 stringWithFormat:@"%@%@", v40, v41];

          os_signpost_id_t v52 = (void *)v32;
          uint64_t v50 = v32;
          unint64_t v43 = (void *)v42;
          unint64_t v44 = [NSString stringWithFormat:@"set%@:", v50];
          NSSelectorFromString(v44);

          os_signpost_id_t v45 = [NSString stringWithFormat:@"set%@:", v37];
          NSSelectorFromString(v45);

          unint64_t v46 = [NSString stringWithFormat:@"set%@:", v43];
          NSSelectorFromString(v46);

          if (objc_opt_respondsToSelector())
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            [(HDSDeviceOperationHomeKitSetup *)v54->_homeKitSetupOperation setValue:obj forKey:@"psgStereoPairs"];
          }
          if (objc_opt_respondsToSelector())
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            [(HDSDeviceOperationHomeKitSetup *)v54->_homeKitSetupOperation setValue:v21 forKey:@"psgHomePods"];
          }
          if (objc_opt_respondsToSelector())
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            [(HDSDeviceOperationHomeKitSetup *)v54->_homeKitSetupOperation setValue:v53 forKey:@"existingMediaGroup"];
          }
        }
        else if (gLogCategory_HDSSetupSession <= 30 {
               && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        }
        {
LABEL_22:
          LogPrintF();
        }
LABEL_95:
        v2->_psgState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_19;
      }
      break;
    case 2:
    case 4:
      return v2->_psgState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_19:
        LogPrintF();
      }
      break;
  }
  return v2->_psgState;
}

- (void)_runStereoPairUserInputPickColors:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v4 = *MEMORY[0x263F6C350];
  self->_stereoCounterpartColor = v4;
  id v5 = self->_stereoCounterpartAccessory;
  if (!v5)
  {
    id v5 = [(NSArray *)self->_potentialStereoCounterparts firstObject];
  }
  uint64_t v6 = [(HMAccessory *)v5 uniqueIdentifier];
  if (!v6)
  {
LABEL_17:

    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_26;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(RPCompanionLinkClient *)self->_companionLinkClient activeDevices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v9 = v8;
  int v18 = v4;
  uint64_t v10 = *(void *)v20;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v20 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
    uint64_t v13 = [v12 homeKitIdentifier];
    int v14 = [v13 isEqual:v6];

    if (v14) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  uint64_t v15 = [v12 deviceColor];
  int v16 = v15;
  if (!v15 || (unsigned __int8 v17 = [v15 intValue], v18 == v17))
  {

    goto LABEL_16;
  }
  self->_stereoCounterpartColor = v17;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_19;
  }
LABEL_26:
}

- (int)_runTVAudioUserInput
{
  int tvAudioUserInputState = self->_tvAudioUserInputState;
  while (2)
  {
    int v4 = tvAudioUserInputState;
    switch(tvAudioUserInputState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_48;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_tvAudioUserInputState)
        {
LABEL_48:
          int v14 = [(id)objc_opt_class() signpostLog];
          unint64_t v15 = [(HDSSetupSession *)self signpostID];
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "TVAudioUserInput", "", buf, 2u);
            }
          }
        }
        int v13 = 10;
        goto LABEL_125;
      case 10:
        stereoCounterpartAccessory = self->_stereoCounterpartAccessory;
        if (!stereoCounterpartAccessory)
        {
          int v13 = 11;
          goto LABEL_125;
        }
        if ([(HMAccessory *)stereoCounterpartAccessory supportsAudioDestination])
        {
          if (gLogCategory_HDSSetupSession > 30
            || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_124;
          }
          goto LABEL_74;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_tvAudioUserInputState)
        {
          os_signpost_id_t v37 = [(id)objc_opt_class() signpostLog];
          unint64_t v38 = [(HDSSetupSession *)self signpostID];
          if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v39 = v38;
            if (os_signpost_enabled(v37))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v39, "TVAudioUserInput", "", buf, 2u);
            }
          }
        }
        unint64_t v34 = [(id)objc_opt_class() signpostLog];
        unint64_t v40 = [(HDSSetupSession *)self signpostID];
        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_109;
        }
        os_signpost_id_t v36 = v40;
        if (!os_signpost_enabled(v34)) {
          goto LABEL_109;
        }
        goto LABEL_108;
      case 11:
        uint64_t v6 = [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation findTVs];
        potentialTVs = self->_potentialTVs;
        self->_potentialTVs = v6;

        if ([(NSArray *)self->_potentialTVs count])
        {
          uint64_t v8 = self->_potentialTVs;
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __39__HDSSetupSession__runTVAudioUserInput__block_invoke;
          v56[3] = &unk_2650405C0;
          v56[4] = self;
          uint64_t v9 = [(NSArray *)v8 cuFilteredArrayUsingBlock:v56];
          if (_os_feature_enabled_impl()) {
            [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation performReadinessCheck:v9];
          }
          uint64_t v10 = (HMAccessory *)objc_msgSend(v9, "count", v55);
          if (v10)
          {
            uint64_t v10 = [v9 firstObject];
          }
          tvAudioInput = self->_tvAudioInput;
          self->_tvAudioInput = v10;

          if (self->_tvAudioInput)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              unint64_t v55 = self->_potentialTVs;
              LogPrintF();
            }
            int v30 = self->_tvAudioUserInputState + 1;
          }
          else
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            if (!self->_tvAudioUserInputState)
            {
              unint64_t v41 = [(id)objc_opt_class() signpostLog];
              unint64_t v42 = [(HDSSetupSession *)self signpostID];
              if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v43 = v42;
                if (os_signpost_enabled(v41))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_23EB5C000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v43, "TVAudioUserInput", "", buf, 2u);
                }
              }
            }
            unint64_t v44 = [(id)objc_opt_class() signpostLog];
            unint64_t v45 = [(HDSSetupSession *)self signpostID];
            if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v46 = v45;
              if (os_signpost_enabled(v44))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v44, OS_SIGNPOST_INTERVAL_END, v46, "TVAudioUserInput", "", buf, 2u);
              }
            }

            int v30 = 2;
          }
          self->_int tvAudioUserInputState = v30;

          goto LABEL_126;
        }
        if (gLogCategory_HDSSetupSession <= 90
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_tvAudioUserInputState)
        {
          uint64_t v31 = [(id)objc_opt_class() signpostLog];
          unint64_t v32 = [(HDSSetupSession *)self signpostID];
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v33 = v32;
            if (os_signpost_enabled(v31))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "TVAudioUserInput", "", buf, 2u);
            }
          }
        }
        unint64_t v34 = [(id)objc_opt_class() signpostLog];
        unint64_t v35 = [(HDSSetupSession *)self signpostID];
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v36 = v35;
          if (os_signpost_enabled(v34))
          {
LABEL_108:
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v34, OS_SIGNPOST_INTERVAL_END, v36, "TVAudioUserInput", "", buf, 2u);
          }
        }
LABEL_109:

        goto LABEL_110;
      case 12:
        if (self->_promptForTVAudioHandler)
        {
          int v12 = gLogCategory_HDSSetupSession;
          if (self->_tvAudioInput)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            ++self->_tvAudioUserInputState;
            (*((void (**)(void))self->_promptForTVAudioHandler + 2))();
            goto LABEL_126;
          }
        }
        else
        {
          int v12 = gLogCategory_HDSSetupSession;
        }
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (!self->_tvAudioUserInputState)
        {
          uint64_t v24 = [(id)objc_opt_class() signpostLog];
          unint64_t v25 = [(HDSSetupSession *)self signpostID];
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v26 = v25;
            if (os_signpost_enabled(v24))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "TVAudioUserInput", "", buf, 2u);
            }
          }
        }
        uint64_t v27 = [(id)objc_opt_class() signpostLog];
        unint64_t v28 = [(HDSSetupSession *)self signpostID];
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v29 = v28;
          if (os_signpost_enabled(v27))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v27, OS_SIGNPOST_INTERVAL_END, v29, "TVAudioUserInput", "", buf, 2u);
          }
        }

LABEL_110:
        self->_int tvAudioUserInputState = 2;
LABEL_126:
        int tvAudioUserInputState = self->_tvAudioUserInputState;
        if (tvAudioUserInputState != v4) {
          continue;
        }
        return v4;
      case 13:
        if (!self->_tvAudioInputAvailable) {
          goto LABEL_126;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (self->_tvAudioEnabled)
        {
          uint64_t v23 = self->_tvAudioInput;
          if (v23)
          {
            if (gLogCategory_HDSSetupSession <= 30)
            {
              if (gLogCategory_HDSSetupSession != -1
                || (v47 = _LogCategory_Initialize(), uint64_t v23 = self->_tvAudioInput, v47))
              {
                unint64_t v55 = [(HMAccessory *)v23 uniqueIdentifier];
                LogPrintF();

                uint64_t v23 = self->_tvAudioInput;
              }
            }
            self->_odeonState = 1;
            -[HDSDeviceOperationHomeKitSetup setTvAudioInput:](self->_homeKitSetupOperation, "setTvAudioInput:", v23, v55);
          }
          else if (gLogCategory_HDSSetupSession <= 30 {
                 && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          }
          {
LABEL_74:
            LogPrintF();
          }
LABEL_124:
          int v13 = self->_tvAudioUserInputState + 1;
LABEL_125:
          self->_int tvAudioUserInputState = v13;
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (!self->_tvAudioUserInputState)
          {
            id v48 = [(id)objc_opt_class() signpostLog];
            unint64_t v49 = [(HDSSetupSession *)self signpostID];
            if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v50 = v49;
              if (os_signpost_enabled(v48))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v50, "TVAudioUserInput", "", buf, 2u);
              }
            }
          }
          unint64_t v51 = [(id)objc_opt_class() signpostLog];
          unint64_t v52 = [(HDSSetupSession *)self signpostID];
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v53 = v52;
            if (os_signpost_enabled(v51))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v51, OS_SIGNPOST_INTERVAL_END, v53, "TVAudioUserInput", "", buf, 2u);
            }
          }

          self->_int tvAudioUserInputState = 2;
          self->_odeonState = 2;
        }
        goto LABEL_126;
      case 14:
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
            LogPrintF();
          }
          if (!self->_tvAudioUserInputState)
          {
            unsigned __int8 v17 = [(id)objc_opt_class() signpostLog];
            unint64_t v18 = [(HDSSetupSession *)self signpostID];
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v19 = v18;
              if (os_signpost_enabled(v17))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "TVAudioUserInput", "", buf, 2u);
              }
            }
          }
        }
        long long v20 = [(id)objc_opt_class() signpostLog];
        unint64_t v21 = [(HDSSetupSession *)self signpostID];
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_END, v22, "TVAudioUserInput", "", buf, 2u);
          }
        }

        int v13 = 4;
        goto LABEL_125;
      default:
        goto LABEL_126;
    }
  }
}

id __39__HDSSetupSession__runTVAudioUserInput__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isControllable])
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = [v3 name];
      LogPrintF();
    }
    id v4 = v3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = [v3 name];
      LogPrintF();
    }
    id v4 = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 1252) = 3;
  }

  return v4;
}

- (int)_runPreAuth
{
  switch(self->_preAuthState)
  {
    case 0:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(HDSSetupSession *)self _runPreAuthRequest];
      break;
    case 1:
      if (self->_preAuthStartedProgress) {
        goto LABEL_6;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthStartedProgress = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 40, 0);
      }
      break;
    case 2:
    case 4:
      return self->_preAuthState;
    default:
LABEL_6:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  return self->_preAuthState;
}

- (void)_runPreAuthRequest
{
  if (self->_isCLIMode) {
    self->_pauseAfterPreAuth = 1;
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!self->_preAuthState)
  {
    id v4 = [(id)objc_opt_class() signpostLog];
    unint64_t v5 = [(HDSSetupSession *)self signpostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PreAuth", "", buf, 2u);
      }
    }
  }
  self->_preAuthState = 1;
  uint64_t apcEnabled = self->_apcEnabled;
  if (self->_siriPasscodeEnabled) {
    apcEnabled |= 2uLL;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:apcEnabled | 8];
  [v3 setObject:v8 forKeyedSubscript:@"ff"];

  uint64_t v9 = [(objc_class *)getAFPreferencesClass_0() sharedPreferences];
  if ([v9 assistantIsEnabled])
  {
    uint64_t v10 = [v9 languageCode];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v10 = [v11 firstObject];
  }
  if ([(__CFString *)v10 isEqual:@"en"])
  {

    uint64_t v10 = @"en-US";
LABEL_16:
    [v3 setObject:v10 forKeyedSubscript:@"siriLL"];
    goto LABEL_17;
  }
  if (v10) {
    goto LABEL_16;
  }
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v10 = 0;
LABEL_17:
  p_companionSiriLanguageCode = &self->_companionSiriLanguageCode;
  companionSiriLanguageCode = self->_companionSiriLanguageCode;
  self->_companionSiriLanguageCode = &v10->isa;

  int v14 = [v9 outputVoice];
  unint64_t v15 = [v14 languageCode];
  if (v15)
  {
    [v3 setObject:v15 forKeyedSubscript:@"siriVL"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  if (!*p_companionSiriLanguageCode) {
    objc_storeStrong((id *)&self->_companionSiriLanguageCode, v15);
  }
  objc_storeStrong((id *)&self->_selectedSiriVoice, v14);
  uint64_t v16 = [v14 gender];
  if (v16)
  {
    unsigned __int8 v17 = [NSNumber numberWithInteger:v16];
    [v3 setObject:v17 forKeyedSubscript:@"siriVG"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  unint64_t v18 = [v14 name];

  if (v18)
  {
    [v3 setObject:v18 forKeyedSubscript:@"siriVN"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession > 60) {
      goto LABEL_47;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      selectedSiriVoice = (AFVoiceInfo *)*p_companionSiriLanguageCode;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      selectedSiriVoice = self->_selectedSiriVoice;
      LogPrintF();
    }
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"companionSU", selectedSiriVoice);
  os_signpost_id_t v19 = softLinkAFPreferencesHorsemanSupplementalLanguageDictionary();
  if ([v19 count]) {
    [v3 setObject:v19 forKeyedSubscript:@"siriSupLangs"];
  }
  [v3 setObject:&unk_26F260F88 forKeyedSubscript:@"sndID"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v22 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __37__HDSSetupSession__runPreAuthRequest__block_invoke;
  v23[3] = &unk_26503FC20;
  v23[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_pa", &unk_26F260D20, v3, v23, v22 options request responseHandler];
}

uint64_t __37__HDSSetupSession__runPreAuthRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runPreAuthResponse:a4 error:a2];
}

- (void)_runPreAuthResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  unsigned int v40 = 0;
  if (v7 && !v8)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v36 = (uint64_t)v7;
      LogPrintF();
    }
    self->_unint64_t peerFeatureFlags = CFDictionaryGetInt64();
    objc_storeStrong((id *)&self->_preAuthResponse, a3);
    self->_siriFlags = CFDictionaryGetInt64Ranged();
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    uint64_t v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siriLanguageCodes = self->_siriLanguageCodes;
    self->_siriLanguageCodes = v16;

    [(SFSession *)self->_sfSession setPairSetupACL:&unk_26F260D48];
    CFStringGetTypeID();
    unint64_t v18 = CFDictionaryGetTypedValue();
    if (v18)
    {
      objc_storeStrong((id *)&self->_deviceGUID, v18);
    }
    else if (gLogCategory_HDSSetupSession <= 60 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v36 = v40;
      LogPrintF();
    }
    CFStringGetTypeID();
    long long v20 = CFDictionaryGetTypedValue();

    if (v20)
    {
      objc_storeStrong((id *)&self->_deviceSerialNumber, v20);
    }
    else if (gLogCategory_HDSSetupSession <= 60 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v36 = v40;
      LogPrintF();
    }
    CFStringGetTypeID();
    os_signpost_id_t v19 = CFDictionaryGetTypedValue();

    if (v19)
    {
      objc_storeStrong((id *)&self->_deviceModel, v19);
    }
    else if (gLogCategory_HDSSetupSession <= 60 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v36 = v40;
      LogPrintF();
    }
    unint64_t peerFeatureFlags = self->_peerFeatureFlags;
    if ((peerFeatureFlags & 4) == 0)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v36 = [(SFSession *)self->_sfSession sharingSourceVersion];
        LogPrintF();
      }
      self->_prefStereoPairEnabled = 0;
      unint64_t peerFeatureFlags = self->_peerFeatureFlags;
    }
    if ((peerFeatureFlags & 0x400) == 0)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v36 = [(SFSession *)self->_sfSession sharingSourceVersion];
        LogPrintF();
      }
      self->_prefTVAudioEnabled = 0;
      unint64_t peerFeatureFlags = self->_peerFeatureFlags;
    }
    self->_BOOL peerSupportsCaptiveNetworks = (peerFeatureFlags & 0x2000) != 0;
    id preAuthHandler = (void (**)(void))self->_preAuthHandler;
    if (preAuthHandler)
    {
      preAuthHandler[2]();
      id v23 = self->_preAuthHandler;
      self->_id preAuthHandler = 0;
    }
    BOOL homePodIsCallbellCapable = CFDictionaryGetInt64() != 0;
    self->_BOOL homePodIsCallbellCapable = homePodIsCallbellCapable;
    if (v40)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_61:
        LogPrintF();
      }
LABEL_65:
      BOOL homePod6GCapable = CFDictionaryGetInt64() != 0;
      self->_BOOL homePod6GCapable = homePod6GCapable;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1)
        {
LABEL_67:
          if (homePod6GCapable) {
            uint64_t v27 = "yes";
          }
          else {
            uint64_t v27 = "no";
          }
          uint64_t v36 = (uint64_t)v27;
          uint64_t v37 = v40;
          LogPrintF();
          goto LABEL_72;
        }
        if (_LogCategory_Initialize())
        {
          BOOL homePod6GCapable = self->_homePod6GCapable;
          goto LABEL_67;
        }
      }
LABEL_72:
      -[HDSSetupSession runSUNoSetupPreAuthResponse:](self, "runSUNoSetupPreAuthResponse:", v7, v36, v37);
      [(HDSSetupSession *)self runHomeKitSUPreAuthResponse:v7];
      self->_homePodSysDropCapable = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodSysDropCapableV2 = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      self->_canDoV2TermsAndConditions = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodIsWiFiRetryV2 = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (self->_canDoV2TermsAndConditions && self->_termsAndConditionsServersActive) {
        char v28 = _os_feature_enabled_impl();
      }
      else {
        char v28 = 0;
      }
      self->_termsAndConditionsV2Shown = v28;
      if (!self->_preAuthState)
      {
        os_signpost_id_t v29 = [(id)objc_opt_class() signpostLog];
        unint64_t v30 = [(HDSSetupSession *)self signpostID];
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v31 = v30;
          if (os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PreAuth", "", buf, 2u);
          }
        }
      }
      unint64_t v32 = [(id)objc_opt_class() signpostLog];
      unint64_t v33 = [(HDSSetupSession *)self signpostID];
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v32, OS_SIGNPOST_INTERVAL_END, v34, "PreAuth", "", buf, 2u);
        }
      }

      self->_preAuthState = 4;
      id v35 = objc_alloc_init(getCDPWalrusStateControllerClass());
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __45__HDSSetupSession__runPreAuthResponse_error___block_invoke;
      v38[3] = &unk_2650403C0;
      v38[4] = self;
      [v35 walrusStatusWithCompletion:v38];

      goto LABEL_105;
    }
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_65;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_65;
      }
      BOOL homePodIsCallbellCapable = self->_homePodIsCallbellCapable;
    }
    if (homePodIsCallbellCapable) {
      unint64_t v25 = "yes";
    }
    else {
      unint64_t v25 = "no";
    }
    uint64_t v36 = (uint64_t)v25;
    goto LABEL_61;
  }
  if (!self->_preAuthState)
  {
    uint64_t v10 = [(id)objc_opt_class() signpostLog];
    unint64_t v11 = [(HDSSetupSession *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PreAuth", "", buf, 2u);
      }
    }
  }
  int v13 = [(id)objc_opt_class() signpostLog];
  unint64_t v14 = [(HDSSetupSession *)self signpostID];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "PreAuth", "", buf, 2u);
    }
  }

  self->_preAuthState = 3;
  if ([v9 code] == -6732 || !v9)
  {
    os_signpost_id_t v19 = NSErrorWithOSStatusF();
    [(HDSSetupSession *)self _reportError:v19 label:@"PreAuth"];
LABEL_105:

    goto LABEL_106;
  }
  [(HDSSetupSession *)self _reportError:v9 label:@"PreAuth"];
LABEL_106:
}

void __45__HDSSetupSession__runPreAuthResponse_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HDSSetupSession__runPreAuthResponse_error___block_invoke_2;
  block[3] = &unk_2650405E8;
  uint64_t v11 = v6;
  uint64_t v12 = a2;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __45__HDSSetupSession__runPreAuthResponse_error___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(void *)(a1 + 48) == 1 && [*(id *)(a1 + 40) homePodBuildRequiresADPForcedSU])
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 40) + 1458) = 1;
    }
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 1446)) {
    *(unsigned char *)(v2 + 1453) = 0;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = v3[200];
  if (v4)
  {
    (*(void (**)(void, uint64_t, void))(v4 + 16))(v3[200], 50, 0);
    id v3 = *(void **)(a1 + 40);
  }
  return [v3 _run];
}

- (void)runSUNoSetupPreAuthResponse:(id)a3
{
  id v4 = a3;
  self->_homePodCanSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodIsSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodSaysNeedsSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodSUNoSetupState = Int64Ranged;
}

- (void)runHomeKitSUPreAuthResponse:(id)a3
{
  id v4 = a3;
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    objc_storeStrong((id *)&self->_deviceBuildVersion, v5);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      deviceBuildVersion = self->_deviceBuildVersion;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    deviceBuildVersion = 0;
    goto LABEL_8;
  }
  self->_homePodNeedsSU = CFDictionaryGetInt64() != 0;
  self->_homePodReceivedSUResponse = 1;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  homePodProductVersionString = self->_homePodProductVersionString;
  self->_homePodProductVersionString = v6;

  self->_homePodRecievedProductVersionResponse = 1;
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v10 = self->_homePodProductVersionString;
    LogPrintF();
    int v8 = -[HDSSetupSession isHomePodProductVersionParis:](self, "isHomePodProductVersionParis:", self->_homePodProductVersionString, v10);
  }
  else
  {
    int v8 = -[HDSSetupSession isHomePodProductVersionParis:](self, "isHomePodProductVersionParis:", self->_homePodProductVersionString, deviceBuildVersion);
  }
  self->_homePodProductVersion = v8;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int)isHomePodProductVersionParis:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F42670];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithVersionString:v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"16.0.0"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v5)
  {
    if ([v6 isGreaterThanVersion:v5])
    {
      int v7 = 1;
    }
    else if ([v5 isEqualToVersion:v6])
    {
      int v7 = 2;
    }
    else if ([v5 isGreaterThanVersion:v6])
    {
      int v8 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"16.1.0"];
      if ([v5 isGreaterThanVersion:v8])
      {
        int v7 = 4;
      }
      else if ([v5 isEqualToVersion:v8])
      {
        int v7 = 3;
      }
      else
      {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 1;
  }

  return v7;
}

- (int)_runCheckAccount
{
  int result = self->_iCloudAccountState;
  switch(result)
  {
    case 0:
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_13;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_iCloudAccountState)
      {
LABEL_13:
        id v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "iCloudAccountCheck", "", buf, 2u);
          }
        }
      }
      int v7 = [(id)objc_opt_class() signpostLog];
      unint64_t v8 = [(HDSSetupSession *)self signpostID];
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_END, v9, "iCloudAccountCheck", "", v16, 2u);
        }
      }

      int result = 2;
      goto LABEL_30;
    case 1:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 124, 0);
      }
      if (!self->_iCloudAccountState)
      {
        uint64_t v11 = [(id)objc_opt_class() signpostLog];
        unint64_t v12 = [(HDSSetupSession *)self signpostID];
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)os_signpost_id_t v15 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "iCloudAccountCheck", "", v15, 2u);
          }
        }
      }
      int result = 11;
LABEL_30:
      self->_iCloudAccountState = result;
      break;
    case 2:
    case 4:
      return result;
    default:
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1
          || (int v14 = _LogCategory_Initialize(), result = self->_iCloudAccountState, v14))
        {
          LogPrintF();
          int result = self->_iCloudAccountState;
        }
      }
      break;
  }
  return result;
}

- (int)_enableSiriForPersonalRequestIfNecessary
{
  id v3 = [(objc_class *)getAFPreferencesClass_0() sharedPreferences];
  int personalRequestsChoice = self->_personalRequestsChoice;
  int v5 = [v3 assistantIsEnabled];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    os_signpost_id_t v6 = "yes";
    if (personalRequestsChoice == 6) {
      int v7 = "yes";
    }
    else {
      int v7 = "no";
    }
    if (!v5) {
      os_signpost_id_t v6 = "no";
    }
    uint64_t v11 = v7;
    os_signpost_id_t v13 = v6;
    LogPrintF();
  }
  if (personalRequestsChoice == 6) {
    char v8 = v5;
  }
  else {
    char v8 = 1;
  }
  if (v8)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v3, "setAssistantIsEnabled:", 1, v11, v13);
    if (self->_selectedSiriVoice)
    {
      os_signpost_id_t v9 = [(HDSSetupSession *)self selectedSiriLanguageCode];
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        unint64_t v12 = v9;
        LogPrintF();
      }
      objc_msgSend(v3, "setLanguageCode:outputVoice:", v9, self->_selectedSiriVoice, v12);
    }
  }

  return 4;
}

- (int)_runSiriLanguage
{
  switch(self->_siriLanguageState)
  {
    case 0:
      if (self->_promptForSiriLanguageHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          id v3 = [(id)objc_opt_class() signpostLog];
          unint64_t v4 = [(HDSSetupSession *)self signpostID];
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v5 = v4;
            if (os_signpost_enabled(v3))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SiriLanguage", "", buf, 2u);
            }
          }
        }
        self->_siriLanguageState = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          unint64_t v25 = [(NSArray *)self->_siriLanguageCodes firstObject];
          LogPrintF();
        }
        id promptForSiriLanguageHandler = (void (**)(id, NSArray *, __CFString *))self->_promptForSiriLanguageHandler;
        siriLanguageCodes = self->_siriLanguageCodes;
        uint64_t v15 = [(NSArray *)siriLanguageCodes firstObject];
        uint64_t v16 = (void *)v15;
        if (v15) {
          unsigned __int8 v17 = (__CFString *)v15;
        }
        else {
          unsigned __int8 v17 = @"?";
        }
        promptForSiriLanguageHandler[2](promptForSiriLanguageHandler, siriLanguageCodes, v17);
      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          unint64_t v18 = [(id)objc_opt_class() signpostLog];
          unint64_t v19 = [(HDSSetupSession *)self signpostID];
          if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v20 = v19;
            if (os_signpost_enabled(v18))
            {
              *(_WORD *)os_signpost_id_t v29 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SiriLanguage", "", v29, 2u);
            }
          }
        }
        unint64_t v21 = [(id)objc_opt_class() signpostLog];
        unint64_t v22 = [(HDSSetupSession *)self signpostID];
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v23 = v22;
          if (os_signpost_enabled(v21))
          {
            *(_WORD *)char v28 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v21, OS_SIGNPOST_INTERVAL_END, v23, "SiriLanguage", "", v28, 2u);
          }
        }

        self->_siriLanguageState = 4;
      }
      break;
    case 1:
      if (self->_siriLanguagePicked)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          os_signpost_id_t v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)uint64_t v27 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SiriLanguage", "", v27, 2u);
            }
          }
        }
        os_signpost_id_t v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v10 = [(HDSSetupSession *)self signpostID];
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)os_signpost_id_t v26 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SiriLanguage", "", v26, 2u);
          }
        }

        self->_siriLanguageState = 4;
        promptForVoiceRecognitionHandler = (void (**)(id, BOOL))self->_promptForVoiceRecognitionHandler;
        if (promptForVoiceRecognitionHandler) {
          promptForVoiceRecognitionHandler[2](promptForVoiceRecognitionHandler, [(HDSSetupSession *)self _isVoiceRecognitionSupported]);
        }
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_siriLanguageState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_siriLanguageState;
}

- (int)_runRecognizeVoice
{
  uint64_t v36 = v38;
  int recognizeVoiceState = self->_recognizeVoiceState;
  while (2)
  {
    int v4 = recognizeVoiceState;
    switch(recognizeVoiceState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_30;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_recognizeVoiceState)
        {
LABEL_30:
          unint64_t v7 = [(id)objc_opt_class() signpostLog];
          unint64_t v8 = [(HDSSetupSession *)self signpostID];
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v9 = v8;
            if (os_signpost_enabled(v7))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecognizeMyVoice", "", buf, 2u);
            }
          }
        }
        self->_int recognizeVoiceState = 10;
        goto LABEL_103;
      case 10:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        [(HDSSetupSession *)self _runRecognizeVoiceCheckLanguageStart];
        goto LABEL_103;
      case 11:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int recognizeVoiceStepState = self->_recognizeVoiceStepState;
        if (recognizeVoiceStepState != 1)
        {
          if (recognizeVoiceStepState == 4) {
            goto LABEL_77;
          }
          int v11 = 2;
          goto LABEL_78;
        }
        goto LABEL_103;
      case 12:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        [(HDSSetupSession *)self _runRecognizeVoiceCheckVoiceProfileStart];
        goto LABEL_103;
      case 13:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v12 = self->_recognizeVoiceStepState;
        if (v12 == 1) {
          goto LABEL_103;
        }
        if (v12 == 4)
        {
          int v13 = self->_recognizeVoiceState + 1;
          self->_int recognizeVoiceState = v13;
          if (v13 != 2) {
            goto LABEL_103;
          }
        }
        else
        {
          self->_int recognizeVoiceState = 2;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          int v14 = "yes";
          if (!self->_recognizeVoiceEnabled) {
            int v14 = "no";
          }
          id v35 = v14;
          LogPrintF();
        }
LABEL_103:
        int recognizeVoiceState = self->_recognizeVoiceState;
        if (recognizeVoiceState != v4) {
          continue;
        }
        return v4;
      case 14:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if ([(HDSSetupSession *)self _recognizeVoiceAlreadyEnabled]) {
          BOOL hasExistingHomePodInSelectedRoom = self->_hasExistingHomePodInSelectedRoom;
        }
        else {
          BOOL hasExistingHomePodInSelectedRoom = 0;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          uint64_t v16 = "yes";
          if (!hasExistingHomePodInSelectedRoom) {
            uint64_t v16 = "no";
          }
          id v35 = v16;
          LogPrintF();
        }
        if (hasExistingHomePodInSelectedRoom)
        {
          self->_int recognizeVoiceEnabled = 6;
          self->_rmvSelectionState = 2;
          if (!self->_recognizeVoiceState)
          {
            unint64_t v19 = [(id)objc_opt_class() signpostLog];
            unint64_t v20 = [(HDSSetupSession *)self signpostID];
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v21 = v20;
              if (os_signpost_enabled(v19))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "RecognizeMyVoice", "", buf, 2u);
              }
            }
          }
          unint64_t v22 = [(id)objc_opt_class() signpostLog];
          unint64_t v23 = [(HDSSetupSession *)self signpostID];
          if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v24 = v23;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_END, v24, "RecognizeMyVoice", "", buf, 2u);
            }
          }

          int v11 = 4;
        }
        else
        {
LABEL_77:
          int v11 = self->_recognizeVoiceState + 1;
        }
LABEL_78:
        self->_int recognizeVoiceState = v11;
        goto LABEL_103;
      case 15:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        self->_int recognizeVoiceEnabled = 0;
        unsigned __int8 v17 = _Block_copy(self->_progressHandler);
        id v18 = v17;
        if (v17) {
          (*((void (**)(void *, uint64_t, void))v17 + 2))(v17, 140, 0);
        }
        goto LABEL_102;
      case 16:
        int recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
        if (!recognizeVoiceEnabled) {
          goto LABEL_103;
        }
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_80;
        }
        os_signpost_id_t v6 = "yes";
        if (gLogCategory_HDSSetupSession != -1) {
          goto LABEL_27;
        }
        if (_LogCategory_Initialize())
        {
          os_signpost_id_t v6 = "yes";
          if (!self->_recognizeVoiceEnabled) {
            os_signpost_id_t v6 = "no";
          }
LABEL_27:
          id v35 = v6;
          LogPrintF();
        }
LABEL_80:
        if (!self->_recognizeVoiceState)
        {
          unint64_t v25 = [(id)objc_opt_class() signpostLog];
          unint64_t v26 = [(HDSSetupSession *)self signpostID];
          if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v27 = v26;
            if (os_signpost_enabled(v25))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "RecognizeMyVoice", "", buf, 2u);
            }
          }
        }
        char v28 = [(id)objc_opt_class() signpostLog];
        unint64_t v29 = [(HDSSetupSession *)self signpostID];
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v30 = v29;
          if (os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_END, v30, "RecognizeMyVoice", "", buf, 2u);
          }
        }

        if (recognizeVoiceEnabled == 6) {
          int v31 = 4;
        }
        else {
          int v31 = 2;
        }
        self->_int recognizeVoiceState = v31;
        if (recognizeVoiceEnabled == 6) {
          int v32 = 2;
        }
        else {
          int v32 = 3;
        }
        self->_rmvSelectionState = v32;
        [(HDSSetupSession *)self _runMultiUserEnableEnableSettingStart:@"root.home.dismissedIdentifyVoiceOnboarding", 1, v35, v36 privateSettings];
        if (recognizeVoiceEnabled == 6)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            id v35 = "yes";
            LogPrintF();
          }
          id v33 = objc_alloc_init(getAFSettingsConnectionClass_0());
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v38[0] = __37__HDSSetupSession__runRecognizeVoice__block_invoke;
          v38[1] = &unk_26503F7E0;
          v38[2] = self;
          id v39 = v33;
          id v18 = v33;
          [v18 homeOnboardingFlowInvoked:1 completion:v37];

LABEL_102:
        }
        goto LABEL_103;
      default:
        goto LABEL_103;
    }
  }
}

void __37__HDSSetupSession__runRecognizeVoice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int)_runSiriEnablementConfigurationFetch
{
  int siriEnablementConfigurationState = self->_siriEnablementConfigurationState;
  do
  {
    int v4 = siriEnablementConfigurationState;
    if (siriEnablementConfigurationState) {
      break;
    }
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_8;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_siriEnablementConfigurationState)
    {
LABEL_8:
      os_signpost_id_t v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v6 = [(HDSSetupSession *)self signpostID];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)os_signpost_id_t v9 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriEnablementState", "", v9, 2u);
        }
      }
    }
    self->_int siriEnablementConfigurationState = 1;
    [(HDSSetupSession *)self _getSiriEnablementConfiguration];
    int siriEnablementConfigurationState = self->_siriEnablementConfigurationState;
  }
  while (siriEnablementConfigurationState != v4);
  return v4;
}

- (void)_runRecognizeVoiceCheckLanguageStart
{
  if ([(NSString *)self->_companionSiriLanguageCode length])
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      id v3 = [(id)objc_opt_class() signpostLog];
      unint64_t v4 = [(HDSSetupSession *)self signpostID];
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    self->_int recognizeVoiceStepState = 1;
    id v6 = objc_alloc_init(getAFSettingsConnectionClass_0());
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke;
    v13[3] = &unk_265040610;
    void v13[4] = self;
    [v6 fetchSupportedMultiUserLanguageCodes:v13];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
      unint64_t v8 = [(HDSSetupSession *)self signpostID];
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    unint64_t v10 = [(id)objc_opt_class() signpostLog];
    unint64_t v11 = [(HDSSetupSession *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "RecognizeVoiceCheckLanguage", "", buf, 2u);
      }
    }

    self->_int recognizeVoiceStepState = 2;
  }
}

void __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(NSObject **)(v7 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke_2;
  block[3] = &unk_26503F940;
  void block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke_2(void *a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 _runRecognizeVoiceCheckLanguageResponse:v3 error:v4];
}

- (void)_runRecognizeVoiceCheckLanguageResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    unint64_t v8 = self->_companionSiriLanguageCode;
    int recognizeVoiceStepState = 2;
    if (v8)
    {
      if ([v6 containsObject:v8]) {
        int recognizeVoiceStepState = 4;
      }
      else {
        int recognizeVoiceStepState = 2;
      }
    }
    if (!self->_recognizeVoiceStepState)
    {
      id v10 = [(id)objc_opt_class() signpostLog];
      unint64_t v11 = [(HDSSetupSession *)self signpostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    id v13 = [(id)objc_opt_class() signpostLog];
    unint64_t v14 = [(HDSSetupSession *)self signpostID];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)unint64_t v26 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "RecognizeVoiceCheckLanguage", "", v26, 2u);
      }
    }

    self->_int recognizeVoiceStepState = recognizeVoiceStepState;
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_36;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_36:
        [(HDSSetupSession *)self _run];

        goto LABEL_37;
      }
      int recognizeVoiceStepState = self->_recognizeVoiceStepState;
    }
    if (recognizeVoiceStepState >= 8)
    {
      uint64_t v16 = "?";
      if (recognizeVoiceStepState > 9) {
        uint64_t v16 = "User";
      }
    }
    else
    {
      uint64_t v16 = off_2650408D8[recognizeVoiceStepState];
    }
    os_signpost_id_t v24 = v8;
    unint64_t v25 = v16;
    id v23 = v6;
    LogPrintF();
    goto LABEL_36;
  }
  [(HDSSetupSession *)self _logMetricsForSoftError:v7 label:@"RMV"];
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_recognizeVoiceStepState)
  {
    unsigned __int8 v17 = [(id)objc_opt_class() signpostLog];
    unint64_t v18 = [(HDSSetupSession *)self signpostID];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)unint64_t v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "RecognizeVoiceCheckLanguage", "", v29, 2u);
      }
    }
  }
  unint64_t v20 = [(id)objc_opt_class() signpostLog];
  unint64_t v21 = [(HDSSetupSession *)self signpostID];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)char v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_END, v22, "RecognizeVoiceCheckLanguage", "", v28, 2u);
    }
  }

  self->_int recognizeVoiceStepState = 3;
  [(HDSSetupSession *)self _run];
LABEL_37:
}

- (void)_runRecognizeVoiceCheckVoiceProfileStart
{
  uint64_t v3 = self->_companionSiriLanguageCode;
  if ([(NSString *)v3 length])
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      uint64_t v4 = [(id)objc_opt_class() signpostLog];
      unint64_t v5 = [(HDSSetupSession *)self signpostID];
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    self->_int recognizeVoiceStepState = 1;
    id v7 = [(objc_class *)getSSRVoiceProfileManagerClass() sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke;
    v14[3] = &unk_2650401C0;
    v14[4] = self;
    [v7 isVoiceProfileUploadedToiCloudForLanguageCode:v3 withCompletionBlock:v14];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      unint64_t v8 = [(id)objc_opt_class() signpostLog];
      unint64_t v9 = [(HDSSetupSession *)self signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    unint64_t v11 = [(id)objc_opt_class() signpostLog];
    unint64_t v12 = [(HDSSetupSession *)self signpostID];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "RecognizeVoiceCheckLanguage", "", buf, 2u);
      }
    }

    self->_int recognizeVoiceStepState = 2;
  }
}

void __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke_2;
  block[3] = &unk_265040570;
  char v11 = a3;
  void block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) _recognizeVoiceAlreadyEnabled]) {
      int v2 = 2;
    }
    else {
      int v2 = 3;
    }
  }
  else
  {
    int v2 = 1;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 1260) = v2;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _runRecognizeVoiceCheckVoiceProfileResponse:v3 error:v5];
}

- (void)_getSiriEnablementConfiguration
{
  v10[1] = *MEMORY[0x263EF8340];
  if (!self->_siriEnablementConfigurationProvider)
  {
    uint64_t v3 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(getAFEnablementFlowConfigurationProviderClass());
    siriEnablementConfigurationProvider = self->_siriEnablementConfigurationProvider;
    self->_siriEnablementConfigurationProvider = v3;
  }
  siriLanguageCodes = self->_siriLanguageCodes;
  if (siriLanguageCodes)
  {
    uint64_t v6 = siriLanguageCodes;
  }
  else
  {
    v10[0] = self->_companionSiriLanguageCode;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  id v7 = v6;
  id v8 = self->_siriEnablementConfigurationProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke;
  v9[3] = &unk_265040638;
  v9[4] = self;
  [(AFEnablementFlowConfigurationProvider *)v8 configurationForEnablementFlow:3 recognitionLanguageCodes:v7 completion:v9];
}

void __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 1512);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke_2(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 352))
  {
    int v2 = [(id)objc_opt_class() signpostLog];
    uint64_t v3 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SiriEnablementState", "", buf, 2u);
      }
    }
  }
  uint64_t v5 = [(id)objc_opt_class() signpostLog];
  uint64_t v6 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "SiriEnablementState", "", v9, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 352) = 4;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), *(id *)(a1 + 40));
  return [*(id *)(a1 + 32) _run];
}

- (void)_runRecognizeVoiceCheckVoiceProfileResponse:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (char *)a4;
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6)
  {
    [(HDSSetupSession *)self _logMetricsForSoftError:v6 label:@"RMV"];
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      unint64_t v21 = v6;
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      id v8 = [(id)objc_opt_class() signpostLog];
      unint64_t v9 = [(HDSSetupSession *)self signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RecognizeVoiceCheckLanguage", "", buf, 2u);
        }
      }
    }
    char v11 = [(id)objc_opt_class() signpostLog];
    unint64_t v12 = [(HDSSetupSession *)self signpostID];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)os_signpost_id_t v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "RecognizeVoiceCheckLanguage", "", v24, 2u);
      }
    }

    int v14 = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      os_signpost_id_t v7 = "no";
      if (v4) {
        os_signpost_id_t v7 = "yes";
      }
      unint64_t v21 = v7;
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      os_signpost_id_t v15 = [(id)objc_opt_class() signpostLog];
      unint64_t v16 = [(HDSSetupSession *)self signpostID];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)id v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RecognizeVoiceCheckLanguage", "", v23, 2u);
        }
      }
    }
    unint64_t v18 = [(id)objc_opt_class() signpostLog];
    unint64_t v19 = [(HDSSetupSession *)self signpostID];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)os_signpost_id_t v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_END, v20, "RecognizeVoiceCheckLanguage", "", v22, 2u);
      }
    }

    if (v4) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
  }
  self->_int recognizeVoiceStepState = v14;
  [(HDSSetupSession *)self _run];
}

- (int)_runPersonalRequests
{
  switch(self->_personalRequestsState)
  {
    case 0:
      if (!self->_promptForPersonalRequestsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_personalRequestsState)
        {
          int v14 = [(id)objc_opt_class() signpostLog];
          unint64_t v15 = [(HDSSetupSession *)self signpostID];
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)os_signpost_id_t v22 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PersonalRequests", "", v22, 2u);
            }
          }
        }
        os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
        unint64_t v17 = [(HDSSetupSession *)self signpostID];
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v17;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)unint64_t v21 = 0;
            os_signpost_id_t v13 = v21;
            goto LABEL_47;
          }
        }
        goto LABEL_48;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_personalRequestsState)
      {
        uint64_t v3 = [(id)objc_opt_class() signpostLog];
        unint64_t v4 = [(HDSSetupSession *)self signpostID];
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PersonalRequests", "", buf, 2u);
          }
        }
      }
      self->_personalRequestsState = 1;
      id promptForPersonalRequestsHandler = (void (**)(id, SEL))self->_promptForPersonalRequestsHandler;
      if (promptForPersonalRequestsHandler) {
        promptForPersonalRequestsHandler[2](promptForPersonalRequestsHandler, a2);
      }
      break;
    case 1:
      if (self->_personalRequestsChoice)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_personalRequestsState)
        {
          os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
          unint64_t v8 = [(HDSSetupSession *)self signpostID];
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v9 = v8;
            if (os_signpost_enabled(v7))
            {
              *(_WORD *)os_signpost_id_t v20 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PersonalRequests", "", v20, 2u);
            }
          }
        }
        os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
        unint64_t v11 = [(HDSSetupSession *)self signpostID];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            __int16 v19 = 0;
            os_signpost_id_t v13 = (uint8_t *)&v19;
LABEL_47:
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PersonalRequests", "", v13, 2u);
          }
        }
LABEL_48:

        self->_personalRequestsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_personalRequestsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_personalRequestsState;
}

- (void)runPersonalRequestsAgreedCLI:(BOOL)a3 makeActiveDevice:(BOOL)a4
{
  if (HDSIsDevicePhone())
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    os_signpost_id_t v7 = objc_alloc_init(_TtC15HomeDeviceSetup19FindMyLocateSession);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke;
    v9[3] = &unk_265040688;
    BOOL v11 = a3;
    v9[4] = self;
    os_signpost_id_t v10 = v7;
    BOOL v12 = a4;
    unint64_t v8 = v7;
    [(FindMyLocateSession *)v8 getActiveLocationSharingDeviceWithCompletionHandler:v9];
  }
  else
  {
    [(HDSSetupSession *)self personalRequestsEnabled:0];
  }
}

void __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke_2;
  block[3] = &unk_265040660;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  char v16 = *(unsigned char *)(a1 + 48);
  id v15 = v8;
  char v17 = *(unsigned char *)(a1 + 49);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v2 = *(void **)(a1 + 40);
    return [v2 personalRequestsEnabled:0];
  }
  else if ([*(id *)(a1 + 48) isThisDevice])
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
    return [v4 siriCheck:v5];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 65);
    return [v6 showMeDeviceSwitchWithDevice:v7 session:v8 siriEnabled:v9 activeDeviceEnabled:v10];
  }
}

- (void)siriCheck:(BOOL)a3
{
  id v8 = [(objc_class *)getAFPreferencesClass_0() sharedPreferences];
  if (([v8 assistantIsEnabled] & 1) != 0
    || ([(objc_class *)getVTPreferencesClass_0() sharedPreferences],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 voiceTriggerEnabled],
        v5,
        v6))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = 1;
  }
  else if (a3)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = 1;
    [v8 setAssistantIsEnabled:1];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = 0;
  }
  [(HDSSetupSession *)self personalRequestsEnabled:v7];
}

- (void)showMeDeviceSwitchWithDevice:(id)a3 session:(id)a4 siriEnabled:(BOOL)a5 activeDeviceEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  if (!v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HDSSetupSession *)self personalRequestsEnabled:0];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke;
  aBlock[3] = &unk_265040410;
  aBlock[4] = self;
  BOOL v16 = a5;
  id v12 = _Block_copy(aBlock);
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_3;
    v13[3] = &unk_26503FE50;
    id v14 = v12;
    [v11 setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:v13];
  }
}

void __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_2;
  block[3] = &unk_26503F8C8;
  void block[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriCheck:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldShowPRCardForHomePodsInRoom
{
  int v2 = self;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [(HDSSetupSession *)self selectedHome];
  if (!v3
    && gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unint64_t v4 = [v3 owner];
  char v5 = v4;
  if (v4)
  {
    if (v3)
    {
      uint64_t v6 = [v4 assistantAccessControlForHome:v3];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        char v8 = 0;
        goto LABEL_19;
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 90 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v7 = 0;
  char v8 = 1;
LABEL_19:
  uint64_t v9 = [(HDSSetupSession *)v2 _selectedRoomAllHomePods];
  uint64_t v10 = [v9 count];

  id v11 = v2->_homeKitSelectedRoomName;
  if (!v10)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_49;
    }
LABEL_36:
    LogPrintF();
LABEL_49:
    BOOL v26 = 1;
    goto LABEL_50;
  }
  if (v8)
  {
LABEL_42:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    os_signpost_id_t v24 = v2;
    uint64_t v25 = 0;
    goto LABEL_47;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = [v7 accessories];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v13)
  {

    goto LABEL_42;
  }
  uint64_t v14 = v13;
  uint64_t v28 = v10;
  unint64_t v29 = v7;
  os_signpost_id_t v30 = v2;
  int v31 = v5;
  int v32 = v3;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v34;
  uint64_t v17 = *MEMORY[0x263F0B0A0];
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(v12);
      }
      __int16 v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      os_signpost_id_t v20 = [v19 room];
      unint64_t v21 = [v20 name];

      os_signpost_id_t v22 = [v19 category];
      id v23 = [v22 categoryType];

      if ([v21 isEqualToString:v11]) {
        v15 += [v23 isEqualToString:v17];
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v14);

  if (v28 != v15)
  {
    char v5 = v31;
    id v3 = v32;
    uint64_t v7 = v29;
    int v2 = v30;
    if (v15)
    {
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_49;
      }
      goto LABEL_36;
    }
    goto LABEL_42;
  }
  char v5 = v31;
  id v3 = v32;
  uint64_t v7 = v29;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_signpost_id_t v24 = v30;
  uint64_t v25 = 1;
LABEL_47:
  [(HDSSetupSession *)v24 personalRequestsEnabled:v25];
  BOOL v26 = 0;
LABEL_50:

  return v26;
}

- (void)_runPersonalRequestsSkipCard
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (self->_personalRequestsSkipCardState) {
    return;
  }
  id v3 = [(id)objc_opt_class() signpostLog];
  unint64_t v4 = [(HDSSetupSession *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PersonalRequestsSkipCard", "", buf, 2u);
    }
  }

  self->_personalRequestsSkipCardState = 1;
  uint64_t v6 = [(HDSSetupSession *)self selectedHome];
  uint64_t v7 = &gLogCategory_CLISetupInteractor;
  if (!v6
    && gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  char v8 = [v6 owner];
  uint64_t v9 = v8;
  if (!v8)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_30;
  }
  if (!v6 || ([v8 assistantAccessControlForHome:v6], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_30:
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v11 = 0;
    goto LABEL_35;
  }
  id v11 = (void *)v10;
  id v12 = self->_existingHomepodInSelectedRoom;
  if (v12)
  {
    uint64_t v13 = v12;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = [v11 accessories];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v28 = v11;
      unint64_t v29 = v9;
      uint64_t v16 = *(void *)v31;
LABEL_16:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v17), "uniqueIdentifier", v28, v29);
        __int16 v19 = [(HMAccessory *)v13 uniqueIdentifier];
        int v20 = [v18 isEqual:v19];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v15) {
            goto LABEL_16;
          }
          uint64_t v7 = &gLogCategory_CLISetupInteractor;
          goto LABEL_51;
        }
      }
      uint64_t v7 = &gLogCategory_CLISetupInteractor;
      if (gLogCategory_HDSSetupSession > 30)
      {
        uint64_t v15 = 1;
LABEL_51:
        id v11 = v28;
        uint64_t v9 = v29;
        goto LABEL_54;
      }
      id v11 = v28;
      uint64_t v9 = v29;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      uint64_t v15 = 1;
    }
LABEL_54:

    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
LABEL_36:
  [(HDSSetupSession *)self personalRequestsEnabled:v15];
  if (!self->_personalRequestsSkipCardState)
  {
    unint64_t v21 = [(id)objc_opt_class() signpostLog];
    unint64_t v22 = [(HDSSetupSession *)self signpostID];
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PersonalRequestsSkipCard", "", buf, 2u);
      }
    }
  }
  os_signpost_id_t v24 = [(id)objc_opt_class() signpostLog];
  unint64_t v25 = [(HDSSetupSession *)self signpostID];
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v26 = v25;
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v24, OS_SIGNPOST_INTERVAL_END, v26, "PersonalRequestsSkipCard", "", buf, 2u);
    }
  }

  self->_personalRequestsSkipCardState = 4;
  int v27 = v7[570];
  if (v27 <= 30 && (v27 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (int)_runSiriForEveryone
{
  int siriForEveryoneState = self->_siriForEveryoneState;
  if (siriForEveryoneState != 4 && siriForEveryoneState != 2)
  {
    if (siriForEveryoneState)
    {
      if (self->_siriForEveryoneAnswered)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriForEveryoneState)
        {
          uint64_t v10 = [(id)objc_opt_class() signpostLog];
          unint64_t v11 = [(HDSSetupSession *)self signpostID];
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v12 = v11;
            if (os_signpost_enabled(v10))
            {
              *(_WORD *)unint64_t v18 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SiriForEveryone", "", v18, 2u);
            }
          }
        }
        uint64_t v13 = [(id)objc_opt_class() signpostLog];
        unint64_t v14 = [(HDSSetupSession *)self signpostID];
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)uint64_t v17 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "SiriForEveryone", "", v17, 2u);
          }
        }

        self->_int siriForEveryoneState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_18;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_siriForEveryoneState)
      {
LABEL_18:
        os_signpost_id_t v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriForEveryone", "", buf, 2u);
          }
        }
      }
      self->_int siriForEveryoneState = 1;
      char v8 = _Block_copy(self->_progressHandler);
      uint64_t v9 = v8;
      if (v8) {
        (*((void (**)(void *, uint64_t, void))v8 + 2))(v8, 150, 0);
      }
    }
  }
  return self->_siriForEveryoneState;
}

- (int)_runAutomaticSoftwareUpdate
{
  int automaticSoftwareUpdateState = self->_automaticSoftwareUpdateState;
  if (automaticSoftwareUpdateState != 1)
  {
    if (automaticSoftwareUpdateState) {
      return self->_automaticSoftwareUpdateState;
    }
    if (self->_promptForAutomaticSoftwareUpdateHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_automaticSoftwareUpdateState)
      {
        unint64_t v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AutomaticSoftwareUpdatePrompt", "", buf, 2u);
          }
        }
      }
      self->_int automaticSoftwareUpdateState = 1;
      (*((void (**)(void))self->_promptForAutomaticSoftwareUpdateHandler + 2))();
      return self->_automaticSoftwareUpdateState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_automaticSoftwareUpdateState)
    {
      unint64_t v14 = [(id)objc_opt_class() signpostLog];
      unint64_t v15 = [(HDSSetupSession *)self signpostID];
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)os_signpost_id_t v24 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AutomaticSoftwareUpdatePrompt", "", v24, 2u);
        }
      }
    }
    uint64_t v17 = [(id)objc_opt_class() signpostLog];
    unint64_t v18 = [(HDSSetupSession *)self signpostID];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)os_signpost_id_t v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "AutomaticSoftwareUpdatePrompt", "", v23, 2u);
      }
    }

    int v13 = 2;
LABEL_44:
    self->_int automaticSoftwareUpdateState = v13;
    return self->_automaticSoftwareUpdateState;
  }
  if (self->_automaticSoftwareUpdateAgreed)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_automaticSoftwareUpdateState)
    {
      os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
      unint64_t v8 = [(HDSSetupSession *)self signpostID];
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)unint64_t v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AutomaticSoftwareUpdatePrompt", "", v22, 2u);
        }
      }
    }
    uint64_t v10 = [(id)objc_opt_class() signpostLog];
    unint64_t v11 = [(HDSSetupSession *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)unint64_t v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "AutomaticSoftwareUpdatePrompt", "", v21, 2u);
      }
    }

    int v13 = 4;
    goto LABEL_44;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_automaticSoftwareUpdateState;
}

- (int)_runSoftwareUpdate
{
  int softwareUpdateState = self->_softwareUpdateState;
  if (softwareUpdateState != 1)
  {
    if (softwareUpdateState) {
      return self->_softwareUpdateState;
    }
    if (self->_promptForSoftwareUpdateHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_softwareUpdateState)
      {
        unint64_t v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SoftwareUpdatePrompt", "", buf, 2u);
          }
        }
      }
      self->_int softwareUpdateState = 1;
      (*((void (**)(void))self->_promptForSoftwareUpdateHandler + 2))();
      return self->_softwareUpdateState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_softwareUpdateState)
    {
      unint64_t v14 = [(id)objc_opt_class() signpostLog];
      unint64_t v15 = [(HDSSetupSession *)self signpostID];
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)os_signpost_id_t v24 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SoftwareUpdatePrompt", "", v24, 2u);
        }
      }
    }
    uint64_t v17 = [(id)objc_opt_class() signpostLog];
    unint64_t v18 = [(HDSSetupSession *)self signpostID];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)os_signpost_id_t v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "SoftwareUpdatePrompt", "", v23, 2u);
      }
    }

    int v13 = 2;
LABEL_44:
    self->_int softwareUpdateState = v13;
    return self->_softwareUpdateState;
  }
  if (self->_softwareUpdateAgreed)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_softwareUpdateState)
    {
      os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
      unint64_t v8 = [(HDSSetupSession *)self signpostID];
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)unint64_t v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SoftwareUpdatePrompt", "", v22, 2u);
        }
      }
    }
    uint64_t v10 = [(id)objc_opt_class() signpostLog];
    unint64_t v11 = [(HDSSetupSession *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)unint64_t v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "SoftwareUpdatePrompt", "", v21, 2u);
      }
    }

    int v13 = 4;
    goto LABEL_44;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_softwareUpdateState;
}

- (int)_runSoundRecognition
{
  switch(self->_soundRecognitionAndDropInState)
  {
    case 0:
      if (self->_promptForSoundRecognitionHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          id v3 = [(id)objc_opt_class() signpostLog];
          unint64_t v4 = [(HDSSetupSession *)self signpostID];
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v5 = v4;
            if (os_signpost_enabled(v3))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SoundRecognition", "", buf, 2u);
            }
          }
        }
        self->_soundRecognitionAndDropInState = 1;
        (*((void (**)(void))self->_promptForSoundRecognitionHandler + 2))();
      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          int v13 = [(id)objc_opt_class() signpostLog];
          unint64_t v14 = [(HDSSetupSession *)self signpostID];
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SoundRecognition", "", buf, 2u);
            }
          }
        }
        os_signpost_id_t v16 = [(id)objc_opt_class() signpostLog];
        unint64_t v17 = [(HDSSetupSession *)self signpostID];
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v18 = v17;
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v16, OS_SIGNPOST_INTERVAL_END, v18, "SoundRecognition", "", buf, 2u);
          }
        }

        self->_soundRecognitionAndDropInState = 4;
      }
      break;
    case 1:
      if (self->_soundRecognitionAndDropInSelected)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          os_signpost_id_t v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SoundRecognition", "", buf, 2u);
            }
          }
        }
        os_signpost_id_t v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v10 = [(HDSSetupSession *)self signpostID];
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SoundRecognition", "", buf, 2u);
          }
        }

        self->_soundRecognitionAndDropInState = 4;
        os_signpost_id_t v12 = [(HDSSetupSession *)self selectedHome];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        void v20[2] = __39__HDSSetupSession__runSoundRecognition__block_invoke;
        v20[3] = &unk_26503F7B8;
        v20[4] = self;
        [v12 updateDidOnboardAudioAnalysis:1 completion:v20];
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_soundRecognitionAndDropInState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_soundRecognitionAndDropInState;
}

void __39__HDSSetupSession__runSoundRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) _logMetricsForSoftError:v3 label:@"SoundRecognition"];
    if (gLogCategory_HDSSetupSession > 90) {
      goto LABEL_15;
    }
    if (gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (gLogCategory_HDSSetupSession > 30) {
    goto LABEL_15;
  }
  if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
LABEL_7:
  }
    LogPrintF();
LABEL_11:
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    unint64_t v4 = [*(id *)(a1 + 32) selectedHome];
    [v4 didOnboardAudioAnalysis];
    os_signpost_id_t v5 = [*(id *)(a1 + 32) selectedHome];
    os_signpost_id_t v6 = [v5 uniqueIdentifier];
    LogPrintF();
  }
LABEL_15:
}

- (int)_runHomePodSoftwareUpdateNonSetupAcknowledgement
{
  switch(self->_homePodSoftwareUpdateAckNonSetupState)
  {
    case 0:
      if (!self->_promptForHomePodSoftwareUpdateNonSetupAck)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodSoftwareUpdateAckNonSetupState = 1;
      (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupAck + 2))();
      break;
    case 1:
      if (self->_homePodSoftwareUpdateAckNonSetupEnabled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_15:
          LogPrintF();
        }
LABEL_26:
        self->_homePodSoftwareUpdateAckNonSetupState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateAckNonSetupState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateAckNonSetupState;
}

- (int)_runHomePodSoftwareUpdateNonSetupComplete
{
  switch(self->_homePodSoftwareUpdateNonSetupCompletedState)
  {
    case 0:
      if (!self->_promptForHomePodSoftwareUpdateNonSetupCompleted)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodSoftwareUpdateNonSetupCompletedState = 1;
      (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupCompleted + 2))();
      break;
    case 1:
      if (self->_homePodSoftwareUpdateNonSetupWasCompleted)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_15:
          LogPrintF();
        }
LABEL_26:
        self->_homePodSoftwareUpdateNonSetupCompletedState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateNonSetupCompletedState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateNonSetupCompletedState;
}

- (int)_runHomePodSoftwareUpdateNonSetupCancelled
{
  switch(self->_homePodSoftwareUpdateNonSetupCancelled)
  {
    case 0:
      if (self->_promptForHomePodSoftwareUpdateNonSetupCancelled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homePodSoftwareUpdateNonSetupCancelled = 1;
        (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupCancelled + 2))();
      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homePodSoftwareUpdateNonSetupCancelled = 4;
      }
      break;
    case 1:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_11;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateNonSetupCancelled;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_11:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateNonSetupCancelled;
}

- (int)_runForcedHomePodSoftwareUpdateNonSetup
{
  int homePodSoftwareUpdateStateNonSetup = self->_homePodSoftwareUpdateStateNonSetup;
  switch(homePodSoftwareUpdateStateNonSetup)
  {
    case 4:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodSoftwareUpdateStateNonSetup;
      }
LABEL_12:
      LogPrintF();
      return self->_homePodSoftwareUpdateStateNonSetup;
    case 1:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodSoftwareUpdateStateNonSetup;
      }
      goto LABEL_12;
    case 0:
      self->_int homePodSoftwareUpdateStateNonSetup = 1;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 900, 0);
      }
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke;
      v7[3] = &unk_26503FC20;
      void v7[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_hds_fu" options:0 request:MEMORY[0x263EFFA78] responseHandler:v7];
      break;
  }
  return self->_homePodSoftwareUpdateStateNonSetup;
}

void __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  os_signpost_id_t v11 = *(NSObject **)(v10 + 1512);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke_2;
  v15[3] = &unk_26503FA30;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
}

void __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      long long v10 = *(_OWORD *)(a1 + 32);
      LogPrintF();
    }
  }
  if (*(void *)(a1 + 32))
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 1328) = 3;
    int v2 = *(void **)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 32);
    [v2 _reportError:v3 label:@"SU-No-Setup Scan failed"];
  }
  else
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      os_signpost_id_t v6 = "yes";
      if (!Int64) {
        os_signpost_id_t v6 = "no";
      }
      *(void *)&long long v10 = v6;
      LogPrintF();
    }
    if (Int64)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 56) + 1328) = 4;
      *(unsigned char *)(*(void *)(a1 + 56) + 1459) = 1;
      unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
      *(_DWORD *)(*(void *)(a1 + 56) + 1476) = Int64Ranged;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        if (Int64Ranged > 6) {
          id v8 = "Unknown";
        }
        else {
          id v8 = off_2650408A0[Int64Ranged];
        }
        *(void *)&long long v10 = v8;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 56), "_run", v10, v11);
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 56) + 1328) = 3;
      id v9 = *(void **)(a1 + 56);
      unint64_t v4 = NSErrorWithOSStatusF();
      [v9 _reportError:v4 label:@"SU-No-Setup Scan failed"];
    }
  }
}

- (int)_runTerms
{
  switch(self->_termsState)
  {
    case 0:
      if (!self->_promptForTermsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_termsState)
        {
          id v13 = [(id)objc_opt_class() signpostLog];
          unint64_t v14 = [(HDSSetupSession *)self signpostID];
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)unint64_t v21 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TermsPrompt", "", v21, 2u);
            }
          }
        }
        id v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v16 = [(HDSSetupSession *)self signpostID];
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v16;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)int v20 = 0;
            id v12 = v20;
            goto LABEL_46;
          }
        }
        goto LABEL_47;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_termsState)
      {
        uint64_t v3 = [(id)objc_opt_class() signpostLog];
        unint64_t v4 = [(HDSSetupSession *)self signpostID];
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "TermsPrompt", "", buf, 2u);
          }
        }
      }
      self->_termsState = 1;
      (*((void (**)(void))self->_promptForTermsHandler + 2))();
      break;
    case 1:
      if (self->_termsAgreed)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_termsState)
        {
          os_signpost_id_t v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)uint64_t v19 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TermsPrompt", "", v19, 2u);
            }
          }
        }
        id v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v10 = [(HDSSetupSession *)self signpostID];
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            __int16 v18 = 0;
            id v12 = (uint8_t *)&v18;
LABEL_46:
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "TermsPrompt", "", v12, 2u);
          }
        }
LABEL_47:

        self->_termsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_termsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_termsState;
}

- (int)_runHomePodLoggingProfileTransferAck
{
  int homePodProfileTransferAckState = self->_homePodProfileTransferAckState;
  if (homePodProfileTransferAckState == 1)
  {
    if (self->_homePodProfileTransferSelection == 1)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int homePodProfileTransferAckState = 4;
    }
    else if (gLogCategory_HDSSetupSession <= 30 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (!homePodProfileTransferAckState)
  {
    self->_int homePodProfileTransferAckState = 1;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    promptForLoggingProfileTransferAcuint64_t k = (void (**)(void))self->_promptForLoggingProfileTransferAck;
    if (promptForLoggingProfileTransferAck) {
      promptForLoggingProfileTransferAck[2]();
    }
  }
  return self->_homePodProfileTransferAckState;
}

- (int)_runHomePodLoggingProfileTransfer
{
  int homePodProfileTransferState = self->_homePodProfileTransferState;
  if (homePodProfileTransferState == 1)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!homePodProfileTransferState)
  {
    self->_int homePodProfileTransferState = 1;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 913, 0);
    }
    [(HDSSetupSession *)self _startSysDropLoggingProfileRequest];
  }
  return self->_homePodProfileTransferState;
}

- (int)_runPreAuthAlignmentAndSiri
{
  int result = self->_preShareSettingsState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler)
    {
      if (self->_lpcSkip || self->_isCLIMode || !self->_prefLEDPasscodeEnabled) {
        uint64_t v6 = 60;
      }
      else {
        uint64_t v6 = 55;
      }
      progressHandler[2](progressHandler, v6, 0);
    }
    int result = 4;
    self->_preShareSettingsState = 4;
  }
  return result;
}

- (int)_runShareSettings
{
  switch(self->_shareSettingsState)
  {
    case 0:
      if (!self->_promptToShareSettingsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_shareSettingsState)
        {
          id v13 = [(id)objc_opt_class() signpostLog];
          unint64_t v14 = [(HDSSetupSession *)self signpostID];
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)unint64_t v21 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ShareSettingsPrompt", "", v21, 2u);
            }
          }
        }
        id v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v16 = [(HDSSetupSession *)self signpostID];
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v16;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)int v20 = 0;
            id v12 = v20;
            goto LABEL_46;
          }
        }
        goto LABEL_47;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_shareSettingsState)
      {
        uint64_t v3 = [(id)objc_opt_class() signpostLog];
        unint64_t v4 = [(HDSSetupSession *)self signpostID];
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ShareSettingsPrompt", "", buf, 2u);
          }
        }
      }
      self->_shareSettingsState = 1;
      (*((void (**)(void))self->_promptToShareSettingsHandler + 2))();
      break;
    case 1:
      if (self->_shareSettingsAgreed)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_shareSettingsState)
        {
          uint64_t v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)uint64_t v19 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ShareSettingsPrompt", "", v19, 2u);
            }
          }
        }
        id v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v10 = [(HDSSetupSession *)self signpostID];
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            __int16 v18 = 0;
            id v12 = (uint8_t *)&v18;
LABEL_46:
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "ShareSettingsPrompt", "", v12, 2u);
          }
        }
LABEL_47:

        self->_shareSettingsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_shareSettingsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_shareSettingsState;
}

- (void)_runAuthKitTrustStartIfNeeded
{
  if (!self->_authKitTrustState)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_authKitTrustState)
    {
LABEL_7:
      uint64_t v3 = [(id)objc_opt_class() signpostLog];
      unint64_t v4 = [(HDSSetupSession *)self signpostID];
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AuthKitTrust", "", buf, 2u);
        }
      }
    }
    self->_authKitTrustState = 1;
    id v6 = objc_alloc_init(getAKAppleIDAuthenticationInAppContextClass());
    unint64_t v7 = [(ACAccount *)self->_iCloudAccount accountPropertyForKey:@"altDSID"];
    [v6 setAltDSID:v7];

    [v6 setAuthenticationType:0];
    [v6 setIsUsernameEditable:0];
    [v6 setPresentingViewController:self->_presentingViewController];
    [v6 setServiceType:1];
    os_signpost_id_t v8 = [(ACAccount *)self->_iCloudAccount username];
    [v6 setUsername:v8];

    id v9 = objc_alloc_init(MEMORY[0x263F29118]);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke;
    v10[3] = &unk_265040438;
    v10[4] = self;
    [v9 authenticateWithContext:v6 completion:v10];
  }
}

void __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 1512);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke_2;
  v8[3] = &unk_26503F8F0;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v2 = *(_DWORD *)(*(void *)(a1 + 40) + 600);
  if (*(void *)(a1 + 32))
  {
    if (!v2)
    {
      uint64_t v3 = [(id)objc_opt_class() signpostLog];
      uint64_t v4 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AuthKitTrust", "", buf, 2u);
        }
      }
    }
    id v6 = [(id)objc_opt_class() signpostLog];
    uint64_t v7 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)__int16 v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AuthKitTrust", "", v18, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 40) + 600) = 3;
    return [*(id *)(a1 + 40) _reportError:*(void *)(a1 + 32) label:@"AuthKitTrustFailed"];
  }
  else
  {
    if (!v2)
    {
      uint64_t v10 = [(id)objc_opt_class() signpostLog];
      uint64_t v11 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)id v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AuthKitTrust", "", v17, 2u);
        }
      }
    }
    id v13 = [(id)objc_opt_class() signpostLog];
    uint64_t v14 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)unint64_t v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "AuthKitTrust", "", v16, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 40) + 600) = 4;
    return [*(id *)(a1 + 40) _run];
  }
}

- (int)_runAuthKitTrustFinish
{
  int result = self->_authKitTrustState;
  if (result != 2 && result != 4 && gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (int v5 = _LogCategory_Initialize(), result = self->_authKitTrustState, v5))
    {
      LogPrintF();
      return self->_authKitTrustState;
    }
  }
  return result;
}

- (int)_runLEDPassCodeAlignment
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_lpcPlayAgain)
  {
    self->_lpcAlignmentState = 0;
    self->_lpcAligned = 0;
    self->_lpcPlayAgain = 0;
  }
  if (self->_lpcSkip)
  {
    self->_lpcAlignmentState = 2;
    self->_lpcSkip = 0;
    if (self->_apcSkip)
    {
      if (!self->_apcState)
      {
        uint64_t v3 = [(id)objc_opt_class() signpostLog];
        unint64_t v4 = [(HDSSetupSession *)self signpostID];
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AudioPasscode", "", buf, 2u);
          }
        }
      }
      id v6 = [(id)objc_opt_class() signpostLog];
      unint64_t v7 = [(HDSSetupSession *)self signpostID];
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AudioPasscode", "", v11, 2u);
        }
      }

      self->_apcState = 2;
    }
  }
  int result = self->_lpcAlignmentState;
  if (!result)
  {
    int result = 1;
    self->_lpcAlignmentState = 1;
  }
  if (self->_lpcAligned && result != 2 && result != 4)
  {
    self->_apcPlayAgain = 1;
    int result = 4;
    self->_lpcAlignmentState = 4;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler)
    {
      progressHandler[2](self->_progressHandler, 60, 0);
      return self->_lpcAlignmentState;
    }
  }
  return result;
}

- (int)_runAudioPasscode
{
  int apcState = self->_apcState;
  while (2)
  {
    int v4 = apcState;
    switch(apcState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_35;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_apcState)
        {
LABEL_35:
          id v9 = [(id)objc_opt_class() signpostLog];
          unint64_t v10 = [(HDSSetupSession *)self signpostID];
          if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v11 = v10;
            if (os_signpost_enabled(v9))
            {
              *(_WORD *)__int16 v18 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", "", v18, 2u);
            }
          }
        }
        int v5 = 10;
        goto LABEL_40;
      case 2:
        [(HDSSetupSession *)self _runAudioPasscodeLogMetrics];
        [(HDSSetupSession *)self _runAudioPasscodeCleanup:1];
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 4:
        [(HDSSetupSession *)self _runAudioPasscodeCleanup:1];
        self->_sfSessionSecured = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 10:
        self->_int apcState = 11;
        [(HDSSetupSession *)self _runAudioPasscodeInitRequest];
        goto LABEL_41;
      case 11:
        if (self->_apcInitDone)
        {
          int v5 = 12;
          goto LABEL_40;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 12:
        self->_int apcState = 13;
        if (!self->_apcListening)
        {
          [(APCListener *)self->_apcListener startListeningWithError:0];
          self->_apcListening = 1;
        }
        [(HDSSetupSession *)self _runAudioPasscodeStartRequest];
        goto LABEL_41;
      case 13:
        if (self->_apcStartDone)
        {
          int v5 = 14;
          goto LABEL_40;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_30:
          LogPrintF();
        }
        goto LABEL_41;
      case 14:
        if (self->_apcSecured)
        {
          id v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AudioPasscode", "", buf, 2u);
            }
          }

          int v5 = 4;
LABEL_40:
          self->_int apcState = v5;
          goto LABEL_41;
        }
        if (self->_apcPlayAgain)
        {
          self->_int apcState = 12;
          self->_apcPlayAgain = 0;
          goto LABEL_41;
        }
        if (self->_apcSkip)
        {
          os_signpost_id_t v12 = [(id)objc_opt_class() signpostLog];
          unint64_t v13 = [(HDSSetupSession *)self signpostID];
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v14 = v13;
            if (os_signpost_enabled(v12))
            {
              *(_WORD *)unint64_t v16 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", "", v16, 2u);
            }
          }

          int v5 = 2;
          goto LABEL_40;
        }
LABEL_41:
        int apcState = self->_apcState;
        if (apcState != v4) {
          continue;
        }
        return v4;
      default:
        goto LABEL_41;
    }
  }
}

- (void)_runAudioPasscodeInitRequest
{
  self->_apcInitDone = 0;
  self->_apcStartDone = 0;
  self->_apcStartTicks = mach_absolute_time();
  self->_pairSetupFlags = 2048;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F260FA0 forKeyedSubscript:@"aa"];
  int v4 = [(objc_class *)getAPCListenerClass() capabilityData];
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:@"apcLC"];
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v13 = v3;
      LogPrintF();
    }
    sfSession = self->_sfSession;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__HDSSetupSession__runAudioPasscodeInitRequest__block_invoke;
    v14[3] = &unk_26503FC20;
    v14[4] = self;
    [(SFSession *)sfSession sendRequestID:@"_aa", &unk_26F260D70, v3, v14, v13 options request responseHandler];
  }
  else
  {
    if (!self->_apcState)
    {
      int v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v6 = [(HDSSetupSession *)self signpostID];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AudioPasscode", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v8 = [(id)objc_opt_class() signpostLog];
    unint64_t v9 = [(HDSSetupSession *)self signpostID];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AudioPasscode", "", buf, 2u);
      }
    }

    self->_int apcState = 3;
    os_signpost_id_t v11 = NSErrorWithOSStatusF();
    [(HDSSetupSession *)self _reportError:v11 label:@"APCInitRequest"];
  }
}

unsigned char *__47__HDSSetupSession__runAudioPasscodeInitRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result _runAudioPasscodeInitResponse:a4 error:a2];
  }
  return result;
}

- (void)_runAudioPasscodeInitResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = v7;
  if (v6 && !v7)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v31 = v6;
      LogPrintF();
    }
    CFDataGetTypeID();
    os_signpost_id_t v15 = CFDictionaryGetTypedValue();
    if (v15)
    {
      [(APCListener *)self->_apcListener stopListening];
      self->_apcListening = 0;
      unint64_t v16 = (APCListener *)[objc_alloc(getAPCListenerClass()) initWithConfigurationData:v15];
      apcListener = self->_apcListener;
      self->_apcListener = v16;

      __int16 v18 = self->_apcListener;
      if (v18)
      {
        [(APCListener *)v18 setDispatchQueue:self->_dispatchQueue];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke;
        v33[3] = &unk_26503F6A8;
        v33[4] = self;
        [(APCListener *)self->_apcListener setInvalidationHandler:v33];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke_2;
        v32[3] = &unk_2650406B0;
        v32[4] = self;
        [(APCListener *)self->_apcListener setRetrievedDataHandler:v32];
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_apcInitDone = 1;
        [(HDSSetupSession *)self _run];
        goto LABEL_41;
      }
      if (!self->_apcState)
      {
        unint64_t v25 = [(id)objc_opt_class() signpostLog];
        unint64_t v26 = [(HDSSetupSession *)self signpostID];
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AudioPasscode", "", buf, 2u);
          }
        }
      }
      unint64_t v22 = [(id)objc_opt_class() signpostLog];
      unint64_t v28 = [(HDSSetupSession *)self signpostID];
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v29 = v28;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_END, v29, "AudioPasscode", "", buf, 2u);
        }
      }
    }
    else
    {
      if (!self->_apcState)
      {
        uint64_t v19 = [(id)objc_opt_class() signpostLog];
        unint64_t v20 = [(HDSSetupSession *)self signpostID];
        if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v21 = v20;
          if (os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "AudioPasscode", "", buf, 2u);
          }
        }
      }
      unint64_t v22 = [(id)objc_opt_class() signpostLog];
      unint64_t v23 = [(HDSSetupSession *)self signpostID];
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v24 = v23;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_END, v24, "AudioPasscode", "", buf, 2u);
        }
      }
    }

    self->_int apcState = 3;
    long long v30 = NSErrorWithOSStatusF();
    [(HDSSetupSession *)self _reportError:v30 label:@"APCInitResponse"];

LABEL_41:
    goto LABEL_42;
  }
  if (!self->_apcState)
  {
    unint64_t v9 = [(id)objc_opt_class() signpostLog];
    unint64_t v10 = [(HDSSetupSession *)self signpostID];
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", "", buf, 2u);
      }
    }
  }
  os_signpost_id_t v12 = [(id)objc_opt_class() signpostLog];
  unint64_t v13 = [(HDSSetupSession *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", "", buf, 2u);
    }
  }

  self->_int apcState = 3;
  [(HDSSetupSession *)self _reportError:v8 label:@"APCInitResponse"];
LABEL_42:
}

void __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 1512));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 1512));
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    id v6 = v5;
    id v7 = *(void **)(a1 + 32);
    if (v8 || !v6)
    {
      objc_msgSend(v7, "_logMetricsForSoftError:label:");
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      [v7 _runAudioPasscodeHandleData:v6];
    }
  }
}

- (void)_runAudioPasscodeStartRequest
{
  self->_apcPlaying = 1;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F260FB8 forKeyedSubscript:@"aa"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__HDSSetupSession__runAudioPasscodeStartRequest__block_invoke;
  v5[3] = &unk_26503FC20;
  v5[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_aa" options:&unk_26F260D98 request:v3 responseHandler:v5];
}

unsigned char *__48__HDSSetupSession__runAudioPasscodeStartRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result _runAudioPasscodeStartResponse:a4 error:a2];
  }
  return result;
}

- (void)_runAudioPasscodeStartResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || v7)
  {
    if (!self->_apcState)
    {
      unint64_t v9 = [(id)objc_opt_class() signpostLog];
      unint64_t v10 = [(HDSSetupSession *)self signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v12 = [(id)objc_opt_class() signpostLog];
    unint64_t v13 = [(HDSSetupSession *)self signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", "", buf, 2u);
      }
    }

    self->_int apcState = 3;
    [(HDSSetupSession *)self _reportError:v8 label:@"APCStartResponse"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    apcTimer = self->_apcTimer;
    if (apcTimer)
    {
      unint64_t v16 = apcTimer;
      dispatch_source_cancel(v16);
      id v17 = self->_apcTimer;
      self->_apcTimer = 0;
    }
    __int16 v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v19 = self->_apcTimer;
    self->_apcTimer = v18;

    unint64_t v20 = self->_apcTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __56__HDSSetupSession__runAudioPasscodeStartResponse_error___block_invoke;
    handler[3] = &unk_26503F6A8;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    HDSDispatchTimerSet(self->_apcTimer, 10.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_apcTimer);
    self->_apcStartDone = 1;
    [(HDSSetupSession *)self _run];
  }
}

uint64_t __56__HDSSetupSession__runAudioPasscodeStartResponse_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAudioPasscodeTimeout];
}

- (void)_runAudioPasscodeStopRequest
{
  self->_apcPlaying = 0;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F260FD0 forKeyedSubscript:@"aa"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HDSSetupSession__runAudioPasscodeStopRequest__block_invoke;
  v6[3] = &unk_26503FC20;
  v6[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_aa", &unk_26F260DC0, v3, v6, v5 options request responseHandler];
}

void __47__HDSSetupSession__runAudioPasscodeStopRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_runAudioPasscodeHandleData:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  apcListener = self->_apcListener;
  id v20 = 0;
  int v6 = [(APCListener *)apcListener getResultData:&v20];
  id v7 = v20;
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "completionTime"));
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v17 = v9;
      LogPrintF();
    }
    [(HDSSetupSession *)self _run];
  }
  if (self->_apcPlaying)
  {
    if (self->_apcSecured)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_14:
        LogPrintF();
      }
    }
    else
    {
      uint64_t v10 = [v4 length];
      if ((unint64_t)(v10 - 9) > 0xFFFFFFFFFFFFFFF9)
      {
        uint64_t v11 = v10;
        [v4 getBytes:v21 length:v10];
        bzero((char *)v21 + v11, 8 - v11);
        os_signpost_id_t v12 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", v21[0]);
        if (self->_apcTryingPasscode)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            IsAppleInternalBuild();
            IsAppleInternalBuild();
            LogPrintF();
          }
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            __int16 v18 = v12;
            LogPrintF();
          }
          self->_apcTryingPasscode = 1;
          if (self->_apcStartedPairSetup)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              int v13 = IsAppleInternalBuild();
              os_signpost_id_t v14 = @"*";
              if (v13) {
                os_signpost_id_t v14 = v12;
              }
              __int16 v18 = v14;
              LogPrintF();
            }
            -[SFSession pairSetupTryPIN:](self->_sfSession, "pairSetupTryPIN:", v12, v18);
          }
          else
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            objc_storeStrong((id *)&self->_apcPasscode, v12);
            self->_apcStartedPairSetup = 1;
            sfSession = self->_sfSession;
            uint64_t v16 = self->_pairSetupFlags | 0x80008;
            v19[0] = MEMORY[0x263EF8330];
            v19[1] = 3221225472;
            v19[2] = __47__HDSSetupSession__runAudioPasscodeHandleData___block_invoke;
            v19[3] = &unk_26503F7B8;
            v19[4] = self;
            [(SFSession *)sfSession pairSetupWithFlags:v16 completion:v19];
          }
        }
      }
      else if (gLogCategory_HDSSetupSession <= 60 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_14;
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_14;
  }
}

void __47__HDSSetupSession__runAudioPasscodeHandleData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 24))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 420))
      {
        id v5 = [(id)objc_opt_class() signpostLog];
        uint64_t v6 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AudioPasscode", "", buf, 2u);
          }
        }
      }
      id v8 = [(id)objc_opt_class() signpostLog];
      uint64_t v9 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)int v13 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AudioPasscode", "", v13, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 420) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"ACPPairSetup"];
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v11 = *(void *)(a1 + 32);
      os_signpost_id_t v12 = *(void **)(v11 + 408);
      *(void *)(v11 + 408) = 0;

      *(unsigned char *)(*(void *)(a1 + 32) + 452) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 418) = 1;
      [*(id *)(a1 + 32) _runAudioPasscodeLogMetrics];
      [*(id *)(a1 + 32) _run];
    }
  }
}

- (void)_runAudioPasscodeTimeout
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ++self->_apcTimeoutCount;
  apcTimer = self->_apcTimer;
  if (apcTimer)
  {
    uint64_t v4 = apcTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_apcTimer;
    self->_apcTimer = 0;
  }
  if (!self->_invalidateCalled)
  {
    [(HDSSetupSession *)self _runAudioPasscodeStopRequest];
    id promptForPINHandler = self->_promptForPINHandler;
    if (promptForPINHandler)
    {
      os_signpost_id_t v7 = (void (*)(void))*((void *)promptForPINHandler + 2);
      v7();
    }
  }
}

- (void)_runAudioPasscodeCleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(HDSSetupSession *)self _runAudioPasscodeLogMetrics];
  if (v3 && self->_apcPlaying) {
    [(HDSSetupSession *)self _runAudioPasscodeStopRequest];
  }
  self->_apcInitDone = 0;
  apcListener = self->_apcListener;
  [(APCListener *)apcListener stopListening];
  self->_apcListening = 0;
  uint64_t v6 = self->_apcListener;
  self->_apcListener = 0;

  apcPasscode = self->_apcPasscode;
  self->_apcPasscode = 0;

  *(_WORD *)&self->_apcStartDone = 0;
  apcTimer = self->_apcTimer;
  if (apcTimer)
  {
    uint64_t v9 = apcTimer;
    dispatch_source_cancel(v9);
    os_signpost_id_t v10 = self->_apcTimer;
    self->_apcTimer = 0;
  }
  self->_apcTryingPasscode = 0;
  if (apcListener)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    audioSession = self->_audioSession;
    os_signpost_id_t v12 = getAVAudioSessionCategoryAmbient();
    id v21 = 0;
    BOOL v13 = [(AVAudioSession *)audioSession setCategory:v12 error:&v21];
    id v14 = v21;

    if (!v13)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(HDSSetupSession *)self _logMetricsForSoftError:v14, @"SecureConnection-AudioPasscode", v14 label];
      }
      else
      {
        [(HDSSetupSession *)self _logMetricsForSoftError:v14, @"SecureConnection-AudioPasscode", v19 label];
      }
    }
    os_signpost_id_t v15 = self->_audioSession;
    uint64_t v16 = getAVAudioSessionModeDefault();
    id v20 = v14;
    BOOL v17 = [(AVAudioSession *)v15 setMode:v16 error:&v20];
    id v18 = v20;

    if (!v17)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(HDSSetupSession *)self _logMetricsForSoftError:v18, @"SecureConnection-AudioPasscode", v18 label];
      }
      else
      {
        [(HDSSetupSession *)self _logMetricsForSoftError:v18, @"SecureConnection-AudioPasscode", v19 label];
      }
    }
  }
}

- (void)_runAudioPasscodeLogMetrics
{
  v10[4] = *MEMORY[0x263EF8340];
  if (!self->_apcMetricsLogged)
  {
    if (self->_apcStartTicks)
    {
      mach_absolute_time();
      uint64_t v3 = UpTicksToMilliseconds();
      v9[0] = @"secured";
      uint64_t v4 = [NSNumber numberWithBool:self->_apcSecured];
      v10[0] = v4;
      v9[1] = @"skipped";
      id v5 = [NSNumber numberWithBool:self->_apcSkip];
      v10[1] = v5;
      v9[2] = @"timeouts";
      uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_apcTimeoutCount];
      void v10[2] = v6;
      v9[3] = @"totalMs";
      os_signpost_id_t v7 = [NSNumber numberWithUnsignedLongLong:v3];
      v10[3] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
      HDSMetricsLog(@"com.apple.sharing.HomePodAudioPasscode", v8);

      self->_apcMetricsLogged = 1;
    }
  }
}

- (int)_runSiriPasscode
{
  int siriPasscodeState = self->_siriPasscodeState;
  do
  {
    int v4 = siriPasscodeState;
    switch(siriPasscodeState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_24;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_siriPasscodeState)
        {
LABEL_24:
          uint64_t v9 = [(id)objc_opt_class() signpostLog];
          unint64_t v10 = [(HDSSetupSession *)self signpostID];
          if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v11 = v10;
            if (os_signpost_enabled(v9))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SiriPasscode", "", buf, 2u);
            }
          }
        }
        self->_int siriPasscodeState = 10;
        break;
      case 4:
        self->_sfSessionSecured = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_21;
        }
        break;
      case 10:
        self->_int siriPasscodeState = 11;
        [(HDSSetupSession *)self _runSiriPasscodeInitRequest];
        break;
      case 11:
        if (self->_siriPasscodeInitDone)
        {
          int v5 = 12;
          goto LABEL_18;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_21:
          LogPrintF();
        }
        break;
      case 12:
        self->_int siriPasscodeState = 13;
        [(HDSSetupSession *)self _runSiriPasscodeStartPairSetup];
        break;
      case 13:
        if (self->_siriPasscodeSecured)
        {
          uint64_t v6 = [(id)objc_opt_class() signpostLog];
          unint64_t v7 = [(HDSSetupSession *)self signpostID];
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)BOOL v13 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_END, v8, "SiriPasscode", "", v13, 2u);
            }
          }

          int v5 = 4;
LABEL_18:
          self->_int siriPasscodeState = v5;
        }
        break;
      default:
        break;
    }
    int siriPasscodeState = self->_siriPasscodeState;
  }
  while (siriPasscodeState != v4);
  return v4;
}

- (void)_runSiriPasscodeInitRequest
{
  self->_siriPasscodeInitDone = 0;
  self->_pairSetupFlags = 1024;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F260FE8 forKeyedSubscript:@"aa"];
  if (self->_forcedCLIPasscode) {
    -[HDSSetupSession forcePassCode:](self, "forcePassCode:");
  }
  if (IsAppleInternalBuild() && [(NSString *)self->_forcedPasscode length]) {
    [v3 setObject:self->_forcedPasscode forKeyedSubscript:@"saFixedPIN"];
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__HDSSetupSession__runSiriPasscodeInitRequest__block_invoke;
  v5[3] = &unk_26503FC20;
  v5[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_aa" options:&unk_26F260DE8 request:v3 responseHandler:v5];
}

unsigned char *__46__HDSSetupSession__runSiriPasscodeInitRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result _runSiriPasscodeInitResponse:a4 error:a2];
  }
  return result;
}

- (void)_runSiriPasscodeInitResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = v7;
  if (!v6 || v7)
  {
    if (!self->_siriPasscodeState)
    {
      uint64_t v9 = [(id)objc_opt_class() signpostLog];
      unint64_t v10 = [(HDSSetupSession *)self signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SiriPasscode", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v12 = [(id)objc_opt_class() signpostLog];
    unint64_t v13 = [(HDSSetupSession *)self signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)os_signpost_id_t v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_END, v14, "SiriPasscode", "", v15, 2u);
      }
    }

    self->_int siriPasscodeState = 3;
    [(HDSSetupSession *)self _reportError:v8 label:@"SiriPasscodeInitResponse"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_siriPasscodeInitDone = 1;
    [(HDSSetupSession *)self _run];
  }
}

- (void)_runSiriPasscodeStartPairSetup
{
  sfSession = self->_sfSession;
  uint64_t v3 = self->_pairSetupFlags | 0x80008;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSSetupSession__runSiriPasscodeStartPairSetup__block_invoke;
  v4[3] = &unk_26503F7B8;
  v4[4] = self;
  [(SFSession *)sfSession pairSetupWithFlags:v3 completion:v4];
}

void __49__HDSSetupSession__runSiriPasscodeStartPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 24))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 468))
      {
        int v5 = [(id)objc_opt_class() signpostLog];
        uint64_t v6 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriPasscode", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v8 = [(id)objc_opt_class() signpostLog];
      uint64_t v9 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)unint64_t v13 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SiriPasscode", "", v13, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 468) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"SiriPasscodePairSetup"];
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 464) = 1;
      os_signpost_id_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = v11[200];
      if (v12)
      {
        (*(void (**)(void, uint64_t, void))(v12 + 16))(v11[200], 70, 0);
        os_signpost_id_t v11 = *(void **)(a1 + 32);
      }
      [v11 _run];
    }
  }
}

- (int)_runPairSetup
{
  int pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4 && pairSetupState != 2)
  {
    if (pairSetupState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      int v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v6 = [(HDSSetupSession *)self signpostID];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PairSetup", "", buf, 2u);
        }
      }

      *(void *)&self->_pairSetupFlags = 0x100000000;
      uint64_t v8 = mach_absolute_time();
      sfSession = self->_sfSession;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __32__HDSSetupSession__runPairSetup__block_invoke;
      v11[3] = &unk_265040078;
      v11[4] = self;
      v11[5] = v8;
      [(SFSession *)sfSession pairSetupWithFlags:524296 completion:v11];
    }
  }
  return self->_pairSetupState;
}

void __32__HDSSetupSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 496) = v4;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v3)
    {
      if (!*(_DWORD *)(v5 + 492))
      {
        unint64_t v6 = [(id)objc_opt_class() signpostLog];
        uint64_t v7 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PairSetup", "", buf, 2u);
          }
        }
      }
      uint64_t v9 = [(id)objc_opt_class() signpostLog];
      uint64_t v10 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)id v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PairSetup", "", v20, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 492) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"PairSetup"];
    }
    else
    {
      *(unsigned char *)(v5 + 296) = 1;
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 492))
      {
        uint64_t v12 = [(id)objc_opt_class() signpostLog];
        uint64_t v13 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v14 = v13;
          if (os_signpost_enabled(v12))
          {
            *(_WORD *)unint64_t v23 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PairSetup", "", v23, 2u);
          }
        }
      }
      os_signpost_id_t v15 = [(id)objc_opt_class() signpostLog];
      uint64_t v16 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)unint64_t v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PairSetup", "", v22, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 492) = 4;
      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = v18[200];
      if (v19)
      {
        (*(void (**)(void, uint64_t, void))(v19 + 16))(v18[200], 70, 0);
        id v18 = *(void **)(a1 + 32);
      }
      [v18 _run];
    }
  }
}

- (int)_runBasicConfig
{
  int basicConfigState = self->_basicConfigState;
  if (basicConfigState != 4 && basicConfigState != 2)
  {
    if (basicConfigState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 80, 0);
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      unint64_t v6 = [(id)objc_opt_class() signpostLog];
      unint64_t v7 = [(HDSSetupSession *)self signpostID];
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UserWaitTime", "", buf, 2u);
        }
      }

      if (!self->_basicConfigState)
      {
        uint64_t v9 = [(id)objc_opt_class() signpostLog];
        unint64_t v10 = [(HDSSetupSession *)self signpostID];
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)os_signpost_id_t v14 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "BasicConfig", "", v14, 2u);
          }
        }
      }
      self->_int basicConfigState = 1;
      uint64_t v12 = mach_absolute_time();
      self->_userWaitStartTicks = v12;
      self->_configureStartTicks = v12;
      self->_basicConfigStartTicks = v12;
      [(HDSSetupSession *)self _runBasicConfigSendRequest];
    }
  }
  return self->_basicConfigState;
}

- (void)_runBasicConfigSendRequest
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F261000 forKeyedSubscript:@"op"];
  uint64_t v4 = [NSNumber numberWithUnsignedChar:softLink_AXSVoiceOverTouchEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"voe"];

  uint64_t v5 = NSNumber;
  softLink_AXSVoiceOverTouchSpeakingRate();
  unint64_t v6 = objc_msgSend(v5, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"vosr"];

  unint64_t v7 = [(objc_class *)getAXSettingsClass_0() sharedInstance];
  os_signpost_id_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "touchAccommodationsEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"taE"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "touchAccommodationsHoldDurationEnabled"));
  [v3 setObject:v9 forKeyedSubscript:@"taHE"];

  unint64_t v10 = NSNumber;
  [v7 touchAccommodationsHoldDuration];
  os_signpost_id_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"taHD"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "touchAccommodationsIgnoreRepeatEnabled"));
  [v3 setObject:v12 forKeyedSubscript:@"taIRE"];

  uint64_t v13 = NSNumber;
  [v7 touchAccommodationsIgnoreRepeatDuration];
  os_signpost_id_t v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKeyedSubscript:@"taIRD"];

  os_signpost_id_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "touchAccommodationsTapActivationMethod"));
  [v3 setObject:v15 forKeyedSubscript:@"taTAM"];

  uint64_t v16 = NSNumber;
  [v7 touchAccommodationsTapActivationTimeout];
  os_signpost_id_t v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:@"taTAT"];

  id v18 = NSNumber;
  [v7 voiceOverDoubleTapInterval];
  uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:@"vodti"];

  id v20 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v21 = [v20 effectiveBoolValueForSetting:*MEMORY[0x263F538B8]] == 1;

  unint64_t v22 = [NSNumber numberWithBool:v21];
  [v3 setObject:v22 forKeyedSubscript:@"eca"];

  unint64_t v23 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v24 = [v23 effectiveBoolValueForSetting:*MEMORY[0x263F53878]] == 1;

  unint64_t v25 = [NSNumber numberWithBool:v24];
  [v3 setObject:v25 forKeyedSubscript:@"dsub"];

  if (self->_liveOn)
  {
    unint64_t v26 = [NSNumber numberWithBool:1];
    [v3 setObject:v26 forKeyedSubscript:@"liveOn"];
  }
  if (self->_appleStoreMode)
  {
    os_signpost_id_t v27 = objc_msgSend(NSNumber, "numberWithInt:");
    [v3 setObject:v27 forKeyedSubscript:@"appleStore"];
  }
  unint64_t v28 = [NSNumber numberWithBool:self->_locationEnabled];
  [v3 setObject:v28 forKeyedSubscript:@"lsEn"];

  os_signpost_id_t v29 = [MEMORY[0x263EFF960] preferredLanguages];
  long long v30 = [v29 firstObject];

  if (v30)
  {
    [v3 setObject:v30 forKeyedSubscript:@"lang"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v31 = [MEMORY[0x263EFF960] currentLocale];
  long long v32 = [v31 localeIdentifier];

  if (v32)
  {
    [v3 setObject:v32 forKeyedSubscript:@"locale"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  long long v33 = [MEMORY[0x263EFF960] currentLocale];
  long long v34 = [v33 objectForKey:*MEMORY[0x263EFF548]];

  if (v34)
  {
    [v3 setObject:v34 forKeyedSubscript:@"tempUnit"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  if (self->_stereoPairRole)
  {
    long long v35 = objc_msgSend(NSNumber, "numberWithInt:");
    [v3 setObject:v35 forKeyedSubscript:@"msRo"];
  }
  uint64_t v36 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v37 = [v36 effectiveBoolValueForSetting:@"newsAllowed"] == 1;

  uint64_t v38 = [NSNumber numberWithBool:v37];
  [v3 setObject:v38 forKeyedSubscript:@"newsAllowed"];

  if (!self->_siriLanguagePicked)
  {
    unsigned int v40 = 0;
LABEL_35:
    int v41 = 1;
    goto LABEL_43;
  }
  selectedSiriLanguageCode = self->_selectedSiriLanguageCode;
  if (selectedSiriLanguageCode)
  {
    unsigned int v40 = selectedSiriLanguageCode;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      long long v67 = (const char *)v40;
      LogPrintF();
    }
    goto LABEL_35;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"siriD"];
  unsigned int v40 = 0;
  int v41 = 2;
LABEL_43:
  self->_siriSettingState = v41;
  int siriDataSharing = self->_siriDataSharing;
  if (siriDataSharing == 6)
  {
    uint64_t v43 = MEMORY[0x263EFFA88];
  }
  else
  {
    if (siriDataSharing != 5) {
      goto LABEL_48;
    }
    uint64_t v43 = MEMORY[0x263EFFA80];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, @"siriDS", v67);
LABEL_48:
  unint64_t v44 = [(objc_class *)getAFPreferencesClass_0() sharedPreferences];
  unint64_t v45 = v44;
  if (v40)
  {
    os_signpost_id_t v46 = v40;

LABEL_51:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, @"siriLL", v67);
    goto LABEL_52;
  }
  os_signpost_id_t v46 = [v44 languageCode];

  if (v46) {
    goto LABEL_51;
  }
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_signpost_id_t v46 = 0;
LABEL_52:
  selectedSiriVoice = self->_selectedSiriVoice;
  if (selectedSiriVoice)
  {
    id v48 = selectedSiriVoice;
    if (v40)
    {
LABEL_54:
      unint64_t v49 = v40;

LABEL_57:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, @"siriVL", v67);
      goto LABEL_58;
    }
  }
  else
  {
    id v48 = [v45 outputVoice];

    if (v40) {
      goto LABEL_54;
    }
  }
  unint64_t v49 = [(AFVoiceInfo *)v48 languageCode];

  if (v49) {
    goto LABEL_57;
  }
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unint64_t v49 = 0;
LABEL_58:
  uint64_t v50 = [(AFVoiceInfo *)v48 gender];
  if (v50)
  {
    unint64_t v51 = [NSNumber numberWithInteger:v50];
    [v3 setObject:v51 forKeyedSubscript:@"siriVG"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  unint64_t v52 = [(AFVoiceInfo *)v48 name];

  if (v52)
  {
    [v3 setObject:v52 forKeyedSubscript:@"siriVN"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  os_signpost_id_t v53 = [MEMORY[0x263EFF910] date];
  [v3 setObject:v53 forKeyedSubscript:@"time"];

  CFStringRef v54 = (const __CFString *)*MEMORY[0x263EFFE48];
  if (CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", (CFStringRef)*MEMORY[0x263EFFE48], 0))
  {
    uint64_t v55 = 12;
  }
  else if (CFPreferencesGetAppBooleanValue(@"AppleICUForce24HourTime", v54, 0))
  {
    uint64_t v55 = 24;
  }
  else
  {
    uint64_t v55 = 0;
  }
  long long v56 = [NSNumber numberWithInteger:v55];
  [v3 setObject:v56 forKeyedSubscript:@"timeCycle"];

  long long v57 = [NSNumber numberWithBool:softLinkTMIsAutomaticTimeEnabled() != 0];
  [v3 setObject:v57 forKeyedSubscript:@"timeAuto"];

  long long v58 = [MEMORY[0x263EFFA18] systemTimeZone];
  long long v59 = [v58 name];

  if (v59)
  {
    [v3 setObject:v59 forKeyedSubscript:@"tz"];
  }
  else if (gLogCategory_HDSSetupSession <= 60 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  long long v60 = [NSNumber numberWithBool:softLinkTMIsAutomaticTimeZoneEnabled() != 0];
  [v3 setObject:v60 forKeyedSubscript:@"tzAuto"];

  long long v61 = (void *)WiFiCopyCurrentNetworkInfoEx();
  if (v61 && (int)CFDictionaryGetInt64Ranged() >= 1)
  {
    long long v62 = objc_msgSend(NSNumber, "numberWithInt:");
    [v3 setObject:v62 forKeyedSubscript:@"wifiCh"];
  }
  BOOL v63 = [(HDSSetupSession *)self isJSEnabled];
  long long v64 = [NSNumber numberWithBool:v63];
  [v3 setObject:v64 forKeyedSubscript:@"user_js_enabled"];

  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      long long v65 = "no";
      if (v63) {
        long long v65 = "yes";
      }
      long long v67 = v65;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      long long v67 = (const char *)v3;
      LogPrintF();
    }
  }
  sfSession = self->_sfSession;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __45__HDSSetupSession__runBasicConfigSendRequest__block_invoke;
  v68[3] = &unk_2650406D8;
  v68[4] = self;
  -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v3, v68, v67);
}

uint64_t __45__HDSSetupSession__runBasicConfigSendRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runBasicConfigReceiveResponse:a4 error:a3];
}

- (void)_runBasicConfigReceiveResponse:(id)a3 error:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    goto LABEL_38;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged)
  {
    os_signpost_id_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08410];
    uint64_t v17 = Int64Ranged;
    uint64_t v32 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v19 = (void *)v18;
    id v20 = @"?";
    if (v18) {
      id v20 = (__CFString *)v18;
    }
    v33[0] = v20;
    BOOL v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v7 = [v15 errorWithDomain:v16 code:v17 userInfo:v21];

    if (v7)
    {
LABEL_38:
      if (!self->_basicConfigState)
      {
        os_signpost_id_t v8 = [(id)objc_opt_class() signpostLog];
        unint64_t v9 = [(HDSSetupSession *)self signpostID];
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v10 = v9;
          if (os_signpost_enabled(v8))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BasicConfig", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v11 = [(id)objc_opt_class() signpostLog];
      unint64_t v12 = [(HDSSetupSession *)self signpostID];
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "BasicConfig", "", buf, 2u);
        }
      }

      self->_int basicConfigState = 3;
      [(HDSSetupSession *)self _reportError:v7 label:@"BasicConfig"];

      goto LABEL_34;
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    double v30 = *(double *)&v6;
    LogPrintF();
  }
  if (!self->_basicConfigState)
  {
    unint64_t v22 = [(id)objc_opt_class() signpostLog];
    unint64_t v23 = [(HDSSetupSession *)self signpostID];
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "BasicConfig", "", buf, 2u);
      }
    }
  }
  unint64_t v25 = [(id)objc_opt_class() signpostLog];
  unint64_t v26 = [(HDSSetupSession *)self signpostID];
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_END, v27, "BasicConfig", "", buf, 2u);
    }
  }

  self->_int basicConfigState = 4;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_double basicConfigSecs = basicConfigSecs;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_31;
      }
      double basicConfigSecs = self->_basicConfigSecs;
    }
    double v30 = basicConfigSecs;
    LogPrintF();
  }
LABEL_31:
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 90, 0);
  }
  [(HDSSetupSession *)self _run];
LABEL_34:
}

- (int)_runAppleMusic
{
  int preflightAppleMusicState = self->_preflightAppleMusicState;
  if (preflightAppleMusicState != 4 && preflightAppleMusicState != 2)
  {
    if (preflightAppleMusicState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return self->_preflightAppleMusicState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int appleMusicState = self->_appleMusicState;
    if (appleMusicState == 2)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        uint64_t v16 = [(id)objc_opt_class() signpostLog];
        unint64_t v17 = [(HDSSetupSession *)self signpostID];
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v18 = v17;
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AppleMusic", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
      unint64_t v19 = [(HDSSetupSession *)self signpostID];
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_64;
      }
      os_signpost_id_t v15 = v19;
      if (!os_signpost_enabled(v13)) {
        goto LABEL_64;
      }
      *(_WORD *)buf = 0;
      goto LABEL_63;
    }
    if (appleMusicState == 6)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
        unint64_t v11 = [(HDSSetupSession *)self signpostID];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AppleMusic", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
      unint64_t v14 = [(HDSSetupSession *)self signpostID];
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_64;
      }
      os_signpost_id_t v15 = v14;
      if (!os_signpost_enabled(v13)) {
        goto LABEL_64;
      }
      *(_WORD *)buf = 0;
LABEL_63:
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "AppleMusic", "", buf, 2u);
LABEL_64:

      int v9 = 2;
      self->_int preflightAppleMusicState = 2;
      return v9;
    }
    if (!self->_deviceGUID || !self->_deviceSerialNumber)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        id v20 = [(id)objc_opt_class() signpostLog];
        unint64_t v21 = [(HDSSetupSession *)self signpostID];
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "AppleMusic", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
      unint64_t v23 = [(HDSSetupSession *)self signpostID];
      if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_64;
      }
      os_signpost_id_t v15 = v23;
      if (!os_signpost_enabled(v13)) {
        goto LABEL_64;
      }
      *(_WORD *)buf = 0;
      goto LABEL_63;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.Music" allowPlaceholder:0 error:0];
    id v7 = [v6 applicationState];
    char v8 = [v7 isInstalled];

    if (v8)
    {
      if (self->_promptForAppleMusicHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_preflightAppleMusicState)
        {
          id v31 = [(id)objc_opt_class() signpostLog];
          unint64_t v32 = [(HDSSetupSession *)self signpostID];
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v33 = v32;
            if (os_signpost_enabled(v31))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "AppleMusic", "", buf, 2u);
            }
          }
        }
        self->_int preflightAppleMusicState = 1;
        (*((void (**)(void))self->_promptForAppleMusicHandler + 2))();

        return self->_preflightAppleMusicState;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        long long v34 = [(id)objc_opt_class() signpostLog];
        unint64_t v35 = [(HDSSetupSession *)self signpostID];
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v36 = v35;
          if (os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "AppleMusic", "", buf, 2u);
          }
        }
      }
      unint64_t v28 = [(id)objc_opt_class() signpostLog];
      unint64_t v37 = [(HDSSetupSession *)self signpostID];
      if (v37 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v30 = v37, !os_signpost_enabled(v28)))
      {
LABEL_95:

        int v9 = 2;
        self->_int preflightAppleMusicState = 2;

        return v9;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        unint64_t v25 = [(id)objc_opt_class() signpostLog];
        unint64_t v26 = [(HDSSetupSession *)self signpostID];
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AppleMusic", "", buf, 2u);
          }
        }
      }
      unint64_t v28 = [(id)objc_opt_class() signpostLog];
      unint64_t v29 = [(HDSSetupSession *)self signpostID];
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_95;
      }
      os_signpost_id_t v30 = v29;
      if (!os_signpost_enabled(v28)) {
        goto LABEL_95;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_END, v30, "AppleMusic", "", buf, 2u);
    goto LABEL_95;
  }
  return self->_preflightAppleMusicState;
}

- (int)_runTRSessionStart
{
  v36[1] = *MEMORY[0x263EF8340];
  int trSessionState = self->_trSessionState;
  if (trSessionState == 4 || trSessionState == 2) {
    return self->_trSessionState;
  }
  if (!trSessionState)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_14;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_trSessionState)
    {
LABEL_14:
      uint64_t v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v6 = [(HDSSetupSession *)self signpostID];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRSessionStart", "", buf, 2u);
        }
      }
    }
    self->_int trSessionState = 1;
    char v8 = (TROperationQueue *)objc_alloc_init(getTROperationQueueClass_0());
    trOperationQueue = self->_trOperationQueue;
    self->_trOperationQueue = v8;

    if (self->_trOperationQueue)
    {
      os_signpost_id_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      trOperations = self->_trOperations;
      self->_trOperations = v10;

      os_signpost_id_t v12 = [(SFSession *)self->_sfSession trSession];
      trSession = self->_trSession;
      self->_trSession = v12;

      if (self->_trSession)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_trSessionState)
        {
          unint64_t v14 = [(id)objc_opt_class() signpostLog];
          unint64_t v15 = [(HDSSetupSession *)self signpostID];
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "TRSessionStart", "", buf, 2u);
            }
          }
        }
        unint64_t v17 = [(id)objc_opt_class() signpostLog];
        unint64_t v18 = [(HDSSetupSession *)self signpostID];
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "TRSessionStart", "", buf, 2u);
          }
        }

        self->_int trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_HDSSetupSession > 90
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_45;
      }
    }
    else if (gLogCategory_HDSSetupSession > 90 {
           || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_45;
    }
    LogPrintF();
LABEL_45:
    if (!self->_trSessionState)
    {
      unint64_t v21 = [(id)objc_opt_class() signpostLog];
      unint64_t v22 = [(HDSSetupSession *)self signpostID];
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v23 = v22;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "TRSessionStart", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v24 = [(id)objc_opt_class() signpostLog];
    unint64_t v25 = [(HDSSetupSession *)self signpostID];
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v24, OS_SIGNPOST_INTERVAL_END, v26, "TRSessionStart", "", buf, 2u);
      }
    }

    self->_int trSessionState = 3;
    os_signpost_id_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08410];
    uint64_t v35 = *MEMORY[0x263F08320];
    uint64_t v29 = [NSString stringWithUTF8String:DebugGetErrorString()];
    os_signpost_id_t v30 = (void *)v29;
    id v31 = @"?";
    if (v29) {
      id v31 = (__CFString *)v29;
    }
    v36[0] = v31;
    unint64_t v32 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    os_signpost_id_t v33 = [v27 errorWithDomain:v28 code:-6700 userInfo:v32];
    [(HDSSetupSession *)self _reportError:v33 label:@"TRSessionStart"];

    return self->_trSessionState;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runWiFiSetup
{
  int wifiSetupState = self->_wifiSetupState;
  if (wifiSetupState == 4)
  {
    if (self->_prefPrototypeForceUpdate)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFSession *)self->_sfSession sendRequestID:@"_hds_fu" options:0 request:MEMORY[0x263EFFA78] responseHandler:&__block_literal_global_1435];
      if (!self->_wifiSetupState)
      {
        os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
        unint64_t v11 = [(HDSSetupSession *)self signpostID];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "WiFiSetup", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
      unint64_t v14 = [(HDSSetupSession *)self signpostID];
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v15 = v14;
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "WiFiSetup", "", buf, 2u);
        }
      }

      self->_int wifiSetupState = 3;
    }
  }
  else if (wifiSetupState)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_15;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_wifiSetupState)
    {
LABEL_15:
      uint64_t v4 = [(id)objc_opt_class() signpostLog];
      unint64_t v5 = [(HDSSetupSession *)self signpostID];
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WiFiSetup", "", buf, 2u);
        }
      }
    }
    self->_int wifiSetupState = 1;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 200, 0);
    }
    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
    char v8 = (SFDeviceOperationWiFiSetup *)objc_alloc_init(MEMORY[0x263F6C260]);
    wifiSetupOperation = self->_wifiSetupOperation;
    self->_wifiSetupOperation = v8;

    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSfSession:self->_sfSession];
    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSkipReachability:self->_peerSupportsCaptiveNetworks];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __32__HDSSetupSession__runWiFiSetup__block_invoke;
    v17[3] = &unk_26503F7B8;
    v17[4] = self;
    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setCompletionHandler:v17];
    [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation activate];
  }
  return self->_wifiSetupState;
}

void __32__HDSSetupSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 656);
  if (v5)
  {
    if (v3)
    {
      ++*(void *)(v4 + 672);
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v42 = v3;
        uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 664) - *(void *)(*(void *)(a1 + 32) + 672);
        LogPrintF();
      }
      uint64_t v8 = objc_msgSend(v3, "code", v42, v43);
      uint64_t v9 = *(void *)(a1 + 32);
      if (v8 == -71159)
      {
        if (!*(_DWORD *)(v9 + 696))
        {
          os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
          uint64_t v11 = [*(id *)(a1 + 32) signpostID];
          if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v12 = v11;
            if (os_signpost_enabled(v10))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "WiFiSetup", "", buf, 2u);
            }
          }
        }
        os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
        uint64_t v14 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "WiFiSetup", "", buf, 2u);
          }
        }

        *(_DWORD *)(*(void *)(a1 + 32) + 696) = 3;
        os_signpost_id_t v16 = *(id **)(a1 + 32);
        unint64_t v17 = [v16[82] wiFiRetryMetrics];
        [v16 _logWiFiRetryMetrics:v17];

        unint64_t v18 = *(void **)(a1 + 32);
        os_signpost_id_t v19 = @"WiFiSetupTimeOut";
        goto LABEL_20;
      }
      if (*(void *)(v9 + 672) >= *(void *)(v9 + 664))
      {
        if (!*(_DWORD *)(v9 + 696))
        {
          unint64_t v22 = [(id)objc_opt_class() signpostLog];
          uint64_t v23 = [*(id *)(a1 + 32) signpostID];
          if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v24 = v23;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "WiFiSetup", "", buf, 2u);
            }
          }
        }
        unint64_t v25 = [(id)objc_opt_class() signpostLog];
        uint64_t v26 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_END, v27, "WiFiSetup", "", buf, 2u);
          }
        }

        *(_DWORD *)(*(void *)(a1 + 32) + 696) = 3;
        if ([v3 code] == 301009)
        {
          unint64_t v18 = *(void **)(a1 + 32);
          os_signpost_id_t v19 = @"WiFiSetup";
LABEL_20:
          [v18 _reportError:v3 label:v19];
          goto LABEL_52;
        }
        if ([v3 code] != -71157) {
          [v3 code];
        }
        uint64_t v28 = NSErrorNestedF();
        uint64_t v29 = *(id **)(a1 + 32);
        os_signpost_id_t v30 = [v29[82] wiFiRetryMetrics];
        [v29 _logWiFiRetryMetrics:v30];

        [*(id *)(a1 + 32) _reportError:v28 label:@"WiFiSetup"];
      }
      else
      {
        *(_DWORD *)(v9 + 696) = 0;
        uint64_t v20 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v20 + 1380))
        {
          unint64_t v21 = [*(id *)(v20 + 656) wiFiRetryMetrics];
          [(id)v20 _logWiFiRetryMetrics:v21];
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        dispatch_time_t v39 = dispatch_time(0, 1000000000 * *(void *)(*(void *)(a1 + 32) + 680));
        uint64_t v40 = *(void *)(a1 + 32);
        int v41 = *(NSObject **)(v40 + 1512);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __32__HDSSetupSession__runWiFiSetup__block_invoke_2;
        block[3] = &unk_26503F6A8;
        void block[4] = v40;
        dispatch_after(v39, v41, block);
      }
    }
    else
    {
      [v5 metricTotalSeconds];
      *(void *)(*(void *)(a1 + 32) + 704) = v6;
      [*(id *)(*(void *)(a1 + 32) + 656) metricWiFiSetupSeconds];
      *(void *)(*(void *)(a1 + 32) + 712) = v7;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 696))
      {
        id v31 = [(id)objc_opt_class() signpostLog];
        uint64_t v32 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v33 = v32;
          if (os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "WiFiSetup", "", buf, 2u);
          }
        }
      }
      long long v34 = [(id)objc_opt_class() signpostLog];
      uint64_t v35 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v36 = v35;
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v34, OS_SIGNPOST_INTERVAL_END, v36, "WiFiSetup", "", buf, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 696) = 4;
      unint64_t v37 = *(id **)(a1 + 32);
      uint64_t v38 = [v37[82] wiFiRetryMetrics];
      [v37 _logWiFiRetryMetrics:v38];

      [*(id *)(a1 + 32) _run];
    }
  }
LABEL_52:
}

uint64_t __32__HDSSetupSession__runWiFiSetup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

void __32__HDSSetupSession__runWiFiSetup__block_invoke_1433(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int)_runBonjourTest
{
  int bonjourTestState = self->_bonjourTestState;
  if (bonjourTestState != 4)
  {
    if (bonjourTestState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_11;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_bonjourTestState)
      {
LABEL_11:
        uint64_t v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "BonjourTest", "", (uint8_t *)buf, 2u);
          }
        }
      }
      self->_int bonjourTestState = 1;
      objc_initWeak(buf, self);
      [(HDSBonjourTest *)self->_bonjourTestOperation invalidate];
      id v7 = objc_alloc_init(HDSBonjourTest);
      bonjourTestOperation = self->_bonjourTestOperation;
      self->_bonjourTestOperation = v7;

      [(HDSBonjourTest *)self->_bonjourTestOperation setDispatchQueue:self->_dispatchQueue];
      [(HDSBonjourTest *)self->_bonjourTestOperation setSfSession:self->_sfSession];
      [(HDSBonjourTest *)self->_bonjourTestOperation setTimeout:16.0];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      void v10[2] = __34__HDSSetupSession__runBonjourTest__block_invoke;
      v10[3] = &unk_265040720;
      objc_copyWeak(&v11, buf);
      v10[4] = self;
      [(HDSBonjourTest *)self->_bonjourTestOperation setCompletionHandler:v10];
      [(HDSBonjourTest *)self->_bonjourTestOperation activate];
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  return self->_bonjourTestState;
}

void __34__HDSSetupSession__runBonjourTest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 688);
    if (v4)
    {
      if (!*(unsigned char *)(v3 + 24))
      {
        [v4 metricTotalSeconds];
        *(void *)(*(void *)(a1 + 32) + 720) = v5;
        uint64_t v6 = *(void *)(a1 + 32);
        if (!*(_DWORD *)(v6 + 1464))
        {
          int v7 = [*(id *)(v6 + 688) bonjourTestState];
          uint64_t v6 = *(void *)(a1 + 32);
          if (v7)
          {
            id v8 = [(id)objc_opt_class() signpostLog];
            uint64_t v9 = [*(id *)(a1 + 32) signpostID];
            if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v10 = v9;
              if (os_signpost_enabled(v8))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BonjourTest", "", buf, 2u);
              }
            }

            uint64_t v6 = *(void *)(a1 + 32);
          }
        }
        if ([*(id *)(v6 + 688) bonjourTestState] == 2
          || [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState] == 3
          || [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState] == 4
          || [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState] == 5
          || [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState] == 6
          || [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState] == 7)
        {
          id v11 = [(id)objc_opt_class() signpostLog];
          uint64_t v12 = [*(id *)(a1 + 32) signpostID];
          if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v13 = v12;
            if (os_signpost_enabled(v11))
            {
              *(_WORD *)uint64_t v14 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "BonjourTest", "", v14, 2u);
            }
          }
        }
        *(_DWORD *)(*(void *)(a1 + 32) + 1464) = [*(id *)(*(void *)(a1 + 32) + 688) bonjourTestState];
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

- (void)captiveConfirmed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_captiveConfirmed__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_captiveConfirmed__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1600);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, 200, 0);
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 760) = 1;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 736);
  return [v3 showWebSheet];
}

- (int)_runCaptiveJoin
{
  int captiveJoinState = self->_captiveJoinState;
  if (captiveJoinState != 4 && captiveJoinState != 2)
  {
    if (captiveJoinState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_peerSupportsCaptiveNetworks)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_captiveJoinState)
      {
        id v11 = [(id)objc_opt_class() signpostLog];
        unint64_t v12 = [(HDSSetupSession *)self signpostID];
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Reachability", "", buf, 2u);
          }
        }
      }
      self->_int captiveJoinState = 1;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
      uint64_t v14 = (SFDeviceOperationCNJSetup *)objc_alloc_init(MEMORY[0x263F6C240]);
      captiveJoin = self->_captiveJoin;
      self->_captiveJoin = v14;

      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setSfSession:self->_sfSession];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setIsSetup:1];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setPresentingViewController:self->_presentingViewController];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setPromptForConfirmationHandler:self->_promptForCaptiveNetworkHandler];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __34__HDSSetupSession__runCaptiveJoin__block_invoke;
      v17[3] = &unk_26503F7B8;
      v17[4] = self;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setCompletionHandler:v17];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin activate];
    }
    else
    {
      uint64_t v5 = [(id)objc_opt_class() signpostLog];
      unint64_t v6 = [(HDSSetupSession *)self signpostID];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Reachability", "", buf, 2u);
        }
      }

      id v8 = [(id)objc_opt_class() signpostLog];
      unint64_t v9 = [(HDSSetupSession *)self signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "Reachability", "", buf, 2u);
        }
      }

      self->_int captiveJoinState = 2;
    }
  }
  return self->_captiveJoinState;
}

void __34__HDSSetupSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 1512);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__HDSSetupSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __34__HDSSetupSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3)
  {
    if (*(unsigned char *)(v2 + 728))
    {
      if (!*(_DWORD *)(v2 + 744))
      {
        uint64_t v4 = [(id)objc_opt_class() signpostLog];
        uint64_t v5 = [*(id *)(a1 + 40) signpostID];
        if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Reachability", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
      uint64_t v8 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)uint64_t v32 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_END, v9, "Reachability", "", v32, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 40) + 744) = 3;
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      unint64_t v17 = NSErrorNestedF();
      [*(id *)(a1 + 40) _reportError:v17 label:@"CaptiveNetwork"];
    }
    else
    {
      unint64_t v17 = [*(id *)(v2 + 736) reachabilityError];
      if (!*(_DWORD *)(*(void *)(a1 + 40) + 744))
      {
        unint64_t v18 = [(id)objc_opt_class() signpostLog];
        uint64_t v19 = [*(id *)(a1 + 40) signpostID];
        if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v20 = v19;
          if (os_signpost_enabled(v18))
          {
            *(_WORD *)id v31 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "Reachability", "", v31, 2u);
          }
        }
      }
      unint64_t v21 = [(id)objc_opt_class() signpostLog];
      uint64_t v22 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v23 = v22;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)os_signpost_id_t v30 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v21, OS_SIGNPOST_INTERVAL_END, v23, "Reachability", "", v30, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 40) + 744) = 3;
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v26 = NSErrorNestedF();
      [*(id *)(a1 + 40) _reportError:v26 label:@"Reachability"];
    }
  }
  else
  {
    if (!*(_DWORD *)(v2 + 744))
    {
      os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
      uint64_t v11 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)uint64_t v29 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Reachability", "", v29, 2u);
        }
      }
    }
    os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
    uint64_t v14 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "Reachability", "", v28, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 40) + 744) = 4;
    [*(id *)(*(void *)(a1 + 40) + 736) metricTotalSeconds];
    *(void *)(*(void *)(a1 + 40) + 752) = v16;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 752);
      LogPrintF();
    }
    os_signpost_id_t v24 = *(void **)(a1 + 40);
    uint64_t v25 = v24[200];
    if (v25)
    {
      (*(void (**)(void, uint64_t, void))(v25 + 16))(v24[200], 200, 0);
      os_signpost_id_t v24 = *(void **)(a1 + 40);
    }
    objc_msgSend(v24, "_run", v27);
  }
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4 && trSetupConfigurationState != 2)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_14;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_trSetupConfigurationState)
      {
LABEL_14:
        uint64_t v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRSetupConfiguration", "", buf, 2u);
          }
        }
      }
      self->_int trSetupConfigurationState = 1;
      self->_trSetupConfigurationStartTicks = mach_absolute_time();
      uint64_t v8 = (void *)[objc_alloc(getTRSetupConfigurationOperationClass()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v8];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __43__HDSSetupSession__runTRSetupConfiguration__block_invoke;
      v11[3] = &unk_26503F8F0;
      v11[4] = self;
      id v12 = v8;
      id v9 = v8;
      [v9 setCompletionBlock:v11];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v9];
    }
  }
  return self->_trSetupConfigurationState;
}

void __43__HDSSetupSession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 1512);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__HDSSetupSession__runTRSetupConfiguration__block_invoke_2;
  v3[3] = &unk_26503F8F0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __43__HDSSetupSession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 768))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 808) = v2;
    uint64_t v3 = [*(id *)(a1 + 40) result];
    if (v3)
    {
      getTRSetupConfigurationOperationNeedsNetworkKey();
      *(unsigned char *)(*(void *)(a1 + 32) + 816) = CFDictionaryGetInt64() != 0;
      getTRSetupConfigurationOperationUnauthenticatedServicesKey();
      CFSetGetTypeID();
      uint64_t v4 = CFDictionaryGetTypedValue();
      uint64_t v5 = *(void *)(a1 + 32);
      unint64_t v6 = *(void **)(v5 + 824);
      *(void *)(v5 + 824) = v4;

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 824) debugDescription];
        LogPrintF();
      }
      uint64_t v15 = *(void *)(a1 + 32);
      if (*(_DWORD *)(v15 + 480) == 4)
      {
        uint64_t v16 = (void *)[*(id *)(v15 + 824) mutableCopy];
        [v16 removeObject:&unk_26F261018];
        uint64_t v17 = *(void *)(a1 + 32);
        unint64_t v18 = *(void **)(v17 + 824);
        *(void *)(v17 + 824) = v16;
      }
      getTRSetupConfigurationOperationUseAIDAKey();
      *(unsigned char *)(*(void *)(a1 + 32) + 832) = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 792))
      {
        uint64_t v19 = [(id)objc_opt_class() signpostLog];
        uint64_t v20 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v21 = v20;
          if (os_signpost_enabled(v19))
          {
            *(_WORD *)uint64_t v29 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "TRSetupConfiguration", "", v29, 2u);
          }
        }
      }
      uint64_t v22 = [(id)objc_opt_class() signpostLog];
      uint64_t v23 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v24 = v23;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)uint64_t v28 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_END, v24, "TRSetupConfiguration", "", v28, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 792) = 4;
      [*(id *)(a1 + 32) _run];
    }
    else
    {
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 792))
      {
        os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
        uint64_t v8 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v9 = v8;
          if (os_signpost_enabled(v7))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TRSetupConfiguration", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
      uint64_t v11 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)uint64_t v26 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "TRSetupConfiguration", "", v26, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 792) = 3;
      os_signpost_id_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) error];
      [v13 _reportError:v14 label:@"TRSetupConfig"];
    }
  }
}

- (int)_runBackgroundActivation
{
  int bgActivationState = self->_bgActivationState;
  if (bgActivationState != 4 && bgActivationState != 2)
  {
    if (bgActivationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 40) {
        goto LABEL_14;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_bgActivationState)
      {
LABEL_14:
        unint64_t v6 = [(id)objc_opt_class() signpostLog];
        unint64_t v7 = [(HDSSetupSession *)self signpostID];
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DeviceActivation", "", buf, 2u);
          }
        }
      }
      self->_int bgActivationState = 1;
      os_signpost_id_t v9 = objc_alloc_init(HDSDeviceActivationOperation);
      [(HDSDeviceActivationOperation *)v9 setDispatchQueue:self->_dispatchQueue];
      [(HDSDeviceActivationOperation *)v9 setSfSession:self->_sfSession];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __43__HDSSetupSession__runBackgroundActivation__block_invoke;
      v12[3] = &unk_265040770;
      void v12[4] = self;
      os_signpost_id_t v13 = v9;
      SEL v14 = a2;
      os_signpost_id_t v10 = v9;
      [(HDSDeviceActivationOperation *)v10 setCompletionHandler:v12];
      [(HDSDeviceActivationOperation *)v10 activate];
    }
  }
  return self->_bgActivationState;
}

void __43__HDSSetupSession__runBackgroundActivation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(NSObject **)(v6 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HDSSetupSession__runBackgroundActivation__block_invoke_2;
  block[3] = &unk_265040748;
  id v12 = v5;
  uint64_t v13 = v6;
  uint64_t v15 = a3;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v14 = v8;
  uint64_t v16 = v9;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __43__HDSSetupSession__runBackgroundActivation__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 40
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v20 = [NSString stringWithFormat:@" (%@)", *(void *)(a1 + 32)];
      LogPrintF();
    }
    else
    {
      uint64_t v20 = &stru_26F254F18;
      LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _logMetricsForSoftError:v2 label:@"BackgroundActivation"];
  }
  switch(*(void *)(a1 + 56))
  {
    case 0:
    case 2:
      if (!*(_DWORD *)(*(void *)(a1 + 40) + 892))
      {
        uint64_t v3 = [(id)objc_opt_class() signpostLog];
        uint64_t v4 = [*(id *)(a1 + 40) signpostID];
        if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DeviceActivation", "", buf, 2u);
          }
        }
      }
      uint64_t v6 = [(id)objc_opt_class() signpostLog];
      uint64_t v7 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_END, v8, "DeviceActivation", "", v23, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 40) + 892) = 4;
      *(_DWORD *)(*(void *)(a1 + 40) + 888) = 4;
      [*(id *)(a1 + 48) metricTotalSeconds];
      *(void *)(*(void *)(a1 + 40) + 896) = v9;
      break;
    case 1:
    case 3:
      if (!*(_DWORD *)(*(void *)(a1 + 40) + 892))
      {
        id v10 = [(id)objc_opt_class() signpostLog];
        uint64_t v11 = [*(id *)(a1 + 40) signpostID];
        if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)uint64_t v22 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DeviceActivation", "", v22, 2u);
          }
        }
      }
      uint64_t v13 = [(id)objc_opt_class() signpostLog];
      uint64_t v14 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v15 = v14;
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)os_signpost_id_t v21 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivation", "", v21, 2u);
        }
      }

      uint64_t v16 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v16 + 1446)) {
        int v17 = 2;
      }
      else {
        int v17 = 3;
      }
      *(_DWORD *)(v16 + 892) = v17;
      *(_DWORD *)(*(void *)(a1 + 40) + 888) = 0;
      break;
    default:
      unint64_t v18 = [MEMORY[0x263F08690] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"HDSSetupSession.m" lineNumber:6897 description:@"Invalid result"];

      break;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_run", v20);
}

- (int)_runTRActivation
{
  int trActivationState = self->_trActivationState;
  if (trActivationState != 4 && trActivationState != 2)
  {
    if (trActivationState || self->_bgActivationState == 1)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_trActivationState)
      {
        os_signpost_id_t v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRDeviceActivation", "", buf, 2u);
          }
        }
      }
      self->_int trActivationState = 1;
      uint64_t v8 = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 210, 0);
      }
      id v10 = (void *)[objc_alloc(getTRActivationOperationClass()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v10];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __35__HDSSetupSession__runTRActivation__block_invoke;
      v13[3] = &unk_2650405E8;
      id v14 = v10;
      uint64_t v15 = v8;
      void v13[4] = self;
      id v11 = v10;
      [v11 setCompletionBlock:v13];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v11];
    }
  }
  return self->_trActivationState;
}

void __35__HDSSetupSession__runTRActivation__block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(NSObject **)(v1 + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession__runTRActivation__block_invoke_2;
  block[3] = &unk_2650405E8;
  uint64_t v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  void block[4] = v1;
  uint64_t v7 = v3;
  id v6 = v4;
  dispatch_async(v2, block);
}

void __35__HDSSetupSession__runTRActivation__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 768))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 896) = v2;
    uint64_t v3 = [*(id *)(a1 + 40) result];
    getTRActivationOperationIsActivatedKey();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 888))
      {
        id v11 = [(id)objc_opt_class() signpostLog];
        uint64_t v12 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "TRDeviceActivation", "", v20, 2u);
          }
        }
      }
      id v14 = [(id)objc_opt_class() signpostLog];
      uint64_t v15 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_END, v16, "TRDeviceActivation", "", v19, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 888) = 4;
      [*(id *)(a1 + 32) _run];
    }
    else
    {
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 888))
      {
        uint64_t v4 = [(id)objc_opt_class() signpostLog];
        uint64_t v5 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TRDeviceActivation", "", buf, 2u);
          }
        }
      }
      uint64_t v7 = [(id)objc_opt_class() signpostLog];
      uint64_t v8 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)int v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_END, v9, "TRDeviceActivation", "", v17, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 888) = 3;
      id v10 = [*(id *)(a1 + 40) error];
      if (!v10)
      {
        getTRActivationOperationErrorKey();
        CFErrorGetTypeID();
        id v10 = CFDictionaryGetTypedValue();
        if (!v10)
        {
          id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"UserErrorDomain" code:301003 userInfo:0];
        }
      }
      [*(id *)(a1 + 32) _reportError:v10 label:@"TRActivation"];
    }
  }
}

- (int)_runTRiCloudAuthentication
{
  if (![(NSSet *)self->_trUnauthServices containsObject:&unk_26F261030]) {
    return 4;
  }
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithObject:&unk_26F261030];
  int v4 = [(HDSSetupSession *)self _runTRAuthentication:v3];

  return v4;
}

- (int)_runTROtherAuthentication
{
  if (!self->_trAuthenticationStateReset)
  {
    self->_trAuthenticationState = 0;
    self->_trAuthenticationStateReset = 1;
  }
  return [(HDSSetupSession *)self _runTRAuthentication:self->_trUnauthServices];
}

- (int)_runTRAuthentication:(id)a3
{
  id v4 = a3;
  char v5 = [v4 containsObject:&unk_26F261018];
  int trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      char v8 = v5;
      id v19 = v4;
      FPrintF();
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v19 = v4;
        LogPrintF();
      }
      os_signpost_id_t v9 = objc_msgSend((id)objc_opt_class(), "signpostLog", v19);
      unint64_t v10 = [(HDSSetupSession *)self signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Auth", "", buf, 2u);
        }
      }

      self->_int trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      if (self->_progressHandler
        && [(NSSet *)self->_trUnauthServices containsObject:&unk_26F261030])
      {
        (*((void (**)(void))self->_progressHandler + 2))();
      }
      uint64_t v12 = (void *)[objc_alloc(getTRAuthenticationOperationClass()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v12];
      [v12 setShouldIgnoreAuthFailures:0];
      [v12 setShouldUseAIDA:self->_trUseAIDA];
      [v12 setTargetedServices:v4];
      [v12 setShouldSetupHomePod:1];
      if (self->_canDoV2TermsAndConditions && self->_termsAndConditionsServersActive) {
        uint64_t v13 = _os_feature_enabled_impl();
      }
      else {
        uint64_t v13 = 0;
      }
      [v12 setCanDoTermsAndConditions:v13];
      id v14 = [(NSUUID *)self->_sessionID UUIDString];
      [v12 setSessionID:v14];

      [v12 setPresentingChildViewController:self->_presentingChildViewController];
      if (IsAppleInternalBuild())
      {
        if (self->_isCLIMode)
        {
          appleIDPassword = self->_appleIDPassword;
          if (appleIDPassword)
          {
            if ([(NSString *)appleIDPassword length])
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              [v12 setIsCLIMode:self->_isCLIMode];
              [v12 setRawPassword:self->_appleIDPassword];
            }
          }
        }
      }
      if (self->_presentingViewController) {
        objc_msgSend(v12, "setPresentingViewController:");
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      uint8_t v20[2] = __40__HDSSetupSession__runTRAuthentication___block_invoke;
      v20[3] = &unk_26503F9B8;
      v20[4] = self;
      id v21 = v12;
      id v22 = v4;
      char v23 = v8;
      id v16 = v12;
      [v16 setCompletionBlock:v20];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v16];
    }
  }
  int v17 = self->_trAuthenticationState;

  return v17;
}

void __40__HDSSetupSession__runTRAuthentication___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 1512);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__HDSSetupSession__runTRAuthentication___block_invoke_2;
  v4[3] = &unk_26503F9B8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 56);
  dispatch_async(v3, v4);
}

void __40__HDSSetupSession__runTRAuthentication___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 768))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 920) = v2;
    *(double *)(*(void *)(a1 + 32) + 928) = *(double *)(*(void *)(a1 + 32) + 920)
                                              + *(double *)(*(void *)(a1 + 32) + 928);
    uint64_t v3 = [(id)objc_opt_class() signpostLog];
    uint64_t v4 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_END, v5, "Auth", "", buf, 2u);
      }
    }

    id v6 = [*(id *)(a1 + 40) result];
    getTRAuthenticationOperationUnauthenticatedServicesKey();
    CFSetGetTypeID();
    char v7 = CFDictionaryGetTypedValue();
    char v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 824) mutableCopy];
    [v8 minusSet:*(void *)(a1 + 48)];
    [v8 unionSet:v7];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 824), v8);
    os_signpost_id_t v9 = [*(id *)(a1 + 40) error];
    if (!v9)
    {
      getTRAuthenticationOperationErrorKey();
      CFErrorGetTypeID();
      os_signpost_id_t v9 = CFDictionaryGetTypedValue();
      if (!v9)
      {
        os_signpost_id_t v9 = NSErrorWithOSStatusF();
      }
    }
    unint64_t v10 = [v9 domain];
    os_signpost_id_t v11 = getTROperationErrorDomain();
    if ([v10 isEqualToString:v11])
    {
      uint64_t v12 = [v9 code];

      if (v12 == -12002)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 1776);
        if (v13)
        {
          (*(void (**)(void))(v13 + 16))();
        }
        else if (gLogCategory_HDSSetupSession <= 30 {
               && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }
        goto LABEL_65;
      }
    }
    else
    {
    }
    if (_os_feature_enabled_impl() && *(unsigned char *)(a1 + 56))
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "_logiTunesAuthRetryMetrics:durationSeconds:authType:retryAttempt:", v9, objc_msgSend(*(id *)(a1 + 40), "authType"), *(unsigned int *)(*(void *)(a1 + 32) + 1384), *(double *)(*(void *)(a1 + 32) + 920));
    }
    if (v6 && ![v7 count])
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v21 = *(void **)(*(void *)(a1 + 32) + 920);
        uint64_t v20 = *(void **)(a1 + 48);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 904) = 4;
      id v16 = objc_msgSend(*(id *)(a1 + 48), "anyObject", v20, v21);

      if (v16)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          uint64_t v20 = v16;
          LogPrintF();
        }
        if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", &unk_26F261018, v20))
        {
          *(void *)(*(void *)(a1 + 32) + 848) = *(void *)(*(void *)(a1 + 32) + 920);
        }
        else if ([*(id *)(a1 + 48) containsObject:&unk_26F261030])
        {
          *(void *)(*(void *)(a1 + 32) + 840) = *(void *)(*(void *)(a1 + 32) + 920);
        }
      }
      goto LABEL_64;
    }
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = v7;
      id v21 = v6;
      LogPrintF();
    }
    if (_os_feature_enabled_impl())
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_44;
      }
      int v15 = *(_DWORD *)(v14 + 1384);
      if (v15 <= 0)
      {
        *(_DWORD *)(v14 + 1384) = v15 + 1;
        if (gLogCategory_HDSSetupSession <= 60
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_DWORD *)(*(void *)(a1 + 32) + 904) = 0;
        uint64_t v17 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26F260AD8];
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = *(void **)(v18 + 824);
        *(void *)(v18 + 824) = v17;

LABEL_64:
        objc_msgSend(*(id *)(a1 + 32), "_run", v20, v21);
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_44;
      }
    }
    if (!*(void *)(v14 + 648))
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 904) = 2;
      goto LABEL_64;
    }
LABEL_44:
    *(_DWORD *)(v14 + 904) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v9, @"TRAuth", v20, v21);
LABEL_65:
  }
}

- (int)_runCDPSetup:(BOOL)a3
{
  int result = self->_cdpState;
  if (result != 4)
  {
    if (result)
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize()) {
        goto LABEL_25;
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_11;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_cdpState)
      {
LABEL_11:
        id v6 = [(id)objc_opt_class() signpostLog];
        unint64_t v7 = [(HDSSetupSession *)self signpostID];
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CDPSetup", "", buf, 2u);
          }
        }
      }
      self->_cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 236, 0);
      }
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
      unint64_t v10 = (SFDeviceOperationCDPSetup *)objc_alloc_init(MEMORY[0x263F6C238]);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v10;

      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSfSession:self->_sfSession];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSkipSetupRequest:self->_trUseAIDA];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSkipEscrowFetches:1];
      if (self->_presentingViewController) {
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      }
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __32__HDSSetupSession__runCDPSetup___block_invoke;
      v12[3] = &unk_26503F7B8;
      void v12[4] = self;
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setCompletionHandler:v12];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation activate];
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    LogPrintF();
LABEL_25:
    int result = self->_cdpState;
  }
LABEL_26:
  if (!a3)
  {
    if (result != 4
      && gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 4;
  }
  return result;
}

void __32__HDSSetupSession__runCDPSetup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 944))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 960))
      {
        os_signpost_id_t v5 = [(id)objc_opt_class() signpostLog];
        uint64_t v6 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDPSetup", "", buf, 2u);
          }
        }
      }
      os_signpost_id_t v8 = [(id)objc_opt_class() signpostLog];
      uint64_t v9 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CDPSetup", "", v20, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 960) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"CDPSetup"];
    }
    else
    {
      [*(id *)(v4 + 944) metricSeconds];
      *(void *)(*(void *)(a1 + 32) + 952) = v11;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 960))
      {
        uint64_t v12 = [(id)objc_opt_class() signpostLog];
        uint64_t v13 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v14 = v13;
          if (os_signpost_enabled(v12))
          {
            *(_WORD *)id v19 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CDPSetup", "", v19, 2u);
          }
        }
      }
      int v15 = [(id)objc_opt_class() signpostLog];
      uint64_t v16 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_END, v17, "CDPSetup", "", v18, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 960) = 4;
      [*(id *)(a1 + 32) _run];
    }
  }
}

- (int)_runHomeKitSetup
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (!homeKitSetupState)
    {
      if (gLogCategory_HDSSetupSession > 30) {
        goto LABEL_11;
      }
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_homeKitSetupState)
      {
LABEL_11:
        uint64_t v4 = [(id)objc_opt_class() signpostLog];
        unint64_t v5 = [(HDSSetupSession *)self signpostID];
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitSetup", "", buf, 2u);
          }
        }
      }
      self->_int homeKitSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 234, 0);
      }
      if (!self->_homeKitSetupOperation)
      {
        if (!self->_homeKitSetupState)
        {
          os_signpost_id_t v14 = [(id)objc_opt_class() signpostLog];
          unint64_t v15 = [(HDSSetupSession *)self signpostID];
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "HomeKitSetup", "", buf, 2u);
            }
          }
        }
        os_signpost_id_t v17 = [(id)objc_opt_class() signpostLog];
        unint64_t v18 = [(HDSSetupSession *)self signpostID];
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "HomeKitSetup", "", buf, 2u);
          }
        }

        self->_int homeKitSetupState = 3;
        os_signpost_id_t v8 = NSErrorWithOSStatusF();
        [(HDSSetupSession *)self _reportError:v8 label:@"HomeKitSetup"];
        goto LABEL_75;
      }
      os_signpost_id_t v8 = softLinkIDSCopyLocalDeviceUniqueID();
      if (!v8)
      {
        uint64_t v12 = 0;
        goto LABEL_64;
      }
      int personalRequestsChoice = self->_personalRequestsChoice;
      uint64_t v10 = [(HMAccessory *)self->_stereoCounterpartAccessory uniqueIdentifier];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = personalRequestsChoice == 6;
      if (personalRequestsChoice == 6 || !v10)
      {
LABEL_63:

LABEL_64:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          uint64_t v28 = "no";
          if (v12) {
            uint64_t v28 = "yes";
          }
          id v31 = v28;
          LogPrintF();
        }
        -[HDSDeviceOperationHomeKitSetup setPersonalRequestsEnabled:](self->_homeKitSetupOperation, "setPersonalRequestsEnabled:", v12, v31);
        [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPauseHandler:0];
        [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTrSession:self->_trSession];
        uint64_t v29 = [(SFSession *)self->_sfSession pairedPeer];
        [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPairedPeer:v29];

        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __35__HDSSetupSession__runHomeKitSetup__block_invoke;
        v34[3] = &unk_265040598;
        v34[4] = self;
        [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v34];
        [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation resume];
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homeKitStartTicks = mach_absolute_time();
LABEL_75:

        return self->_homeKitSetupState;
      }
      uint64_t v13 = [(HDSSetupSession *)self selectedHome];
      if (!v13
        && gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v20 = [v13 owner];
      id v21 = v20;
      if (v20)
      {
        if (v13)
        {
          id v22 = [v20 assistantAccessControlForHome:v13];
          if (v22)
          {
LABEL_51:
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            char v23 = [v22 accessories];
            uint64_t v12 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
            if (v12)
            {
              uint64_t v32 = v21;
              os_signpost_id_t v33 = v13;
              uint64_t v24 = *(void *)v36;
              while (2)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v36 != v24) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v26 = [*(id *)(*((void *)&v35 + 1) + 8 * i) uniqueIdentifier];
                  int v27 = [v26 isEqual:v11];

                  if (v27)
                  {
                    self->_int personalRequestsChoice = 6;
                    uint64_t v12 = 1;
                    goto LABEL_61;
                  }
                }
                uint64_t v12 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
LABEL_61:
              id v21 = v32;
              uint64_t v13 = v33;
            }

            goto LABEL_63;
          }
        }
      }
      else if (gLogCategory_HDSSetupSession <= 90 {
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v22 = 0;
      goto LABEL_51;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_homeKitSetupState;
}

void __35__HDSSetupSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  os_signpost_id_t v6 = a3;
  os_signpost_id_t v7 = *(void **)(*(void *)(a1 + 32) + 968);
  if (v7)
  {
    if (v5)
    {
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v34 = v5;
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 980))
      {
        os_signpost_id_t v19 = [(id)objc_opt_class() signpostLog];
        uint64_t v20 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v21 = v20;
          if (os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "HomeKitSetup", "", buf, 2u);
          }
        }
      }
      id v22 = [(id)objc_opt_class() signpostLog];
      uint64_t v23 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v24 = v23;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)long long v37 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v22, OS_SIGNPOST_INTERVAL_END, v24, "HomeKitSetup", "", v37, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 980) = 3;
      if (v6) {
        uint64_t v25 = v6;
      }
      else {
        uint64_t v25 = @"NoLabel";
      }
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v5, v25, v34);
    }
    else
    {
      uint64_t v8 = [v7 homeKitSelectedRoomName];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 992);
      *(void *)(v9 + 992) = v8;

      [*(id *)(*(void *)(a1 + 32) + 968) metricNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 984) = v11;
      [*(id *)(*(void *)(a1 + 32) + 968) setupDeviceNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1000) = v12;
      [*(id *)(*(void *)(a1 + 32) + 968) addDeviceNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1008) = v13;
      [*(id *)(*(void *)(a1 + 32) + 968) assignRoomNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1016) = v14;
      [*(id *)(*(void *)(a1 + 32) + 968) personalRequestsNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1024) = v15;
      [*(id *)(*(void *)(a1 + 32) + 968) ulhNonUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1032) = v16;
      [*(id *)(*(void *)(a1 + 32) + 968) odeonSeconds];
      *(void *)(*(void *)(a1 + 32) + 1040) = v17;
      [*(id *)(*(void *)(a1 + 32) + 968) metricUserSeconds];
      *(void *)(*(void *)(a1 + 32) + 1048) = v18;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v34 = *(id *)(*(void *)(a1 + 32) + 984);
        LogPrintF();
      }
      if (!*(_DWORD *)(*(void *)(a1 + 32) + 980))
      {
        uint64_t v26 = [(id)objc_opt_class() signpostLog];
        uint64_t v27 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)long long v36 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HomeKitSetup", "", v36, 2u);
          }
        }
      }
      uint64_t v29 = [(id)objc_opt_class() signpostLog];
      uint64_t v30 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v31 = v30;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)long long v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v29, OS_SIGNPOST_INTERVAL_END, v31, "HomeKitSetup", "", v35, 2u);
        }
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 980) = 4;
      mach_absolute_time();
      UpTicksToSecondsF();
      *(void *)(*(void *)(a1 + 32) + 1232) = v32;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        id v34 = *(id *)(*(void *)(a1 + 32) + 1232);
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 968), "stereoPairSeconds", v34);
      *(void *)(*(void *)(a1 + 32) + 1056) = v33;
      [*(id *)(a1 + 32) _run];
    }
  }
}

- (int)_runHomePodSoftwareUpdate
{
  int result = self->_homepodSoftwareUpdateState;
  if (!result)
  {
    uint64_t v4 = [(id)objc_opt_class() signpostLog];
    unint64_t v5 = [(HDSSetupSession *)self signpostID];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomePodSoftwareUpdate", "", buf, 2u);
      }
    }

    self->_homepodSoftwareUpdateState = 1;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_forceSoftwareUpdateForADP || self->_homePodSUState && (self->_homePodProductVersion & 0xFFFFFFFE) == 2)
    {
      if (!self->_homepodSoftwareUpdateState)
      {
        os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
        unint64_t v8 = [(HDSSetupSession *)self signpostID];
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v9 = v8;
          if (os_signpost_enabled(v7))
          {
            *(_WORD *)long long v36 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HomePodSoftwareUpdate", "", v36, 2u);
          }
        }
      }
      uint64_t v10 = [(id)objc_opt_class() signpostLog];
      unint64_t v11 = [(HDSSetupSession *)self signpostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)long long v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "HomePodSoftwareUpdate", "", v35, 2u);
        }
      }

      self->_homepodSoftwareUpdateState = 4;
      BOOL v13 = self->_forceSoftwareUpdateForADP || self->_homePodSUState != 3;
      uint64_t v14 = [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation homeKitAccessory];
      uint64_t v15 = [v14 uniqueIdentifier];

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v16 = [v15 UUIDString];
        uint64_t v17 = (void *)v16;
        uint64_t v18 = "no";
        if (v13) {
          uint64_t v18 = "yes";
        }
        uint64_t v31 = v16;
        uint64_t v32 = v18;
        LogPrintF();
      }
      os_signpost_id_t v19 = [(HDSSetupSession *)self selectedHome];
      uint64_t v20 = [v19 softwareUpdateController];
      softwareUpdateController = self->_softwareUpdateController;
      self->_softwareUpdateController = v20;

      id v22 = self->_softwareUpdateController;
      uint64_t v23 = [(HDSDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation homeKitAccessory];
      os_signpost_id_t v24 = [v23 uniqueIdentifier];
      [(HMAccessorySoftwareUpdateControllerV2 *)v22 scanForSoftwareUpdateRepeatedlyOnAccessory:v24 andInstallUpdate:v13];

      return self->_homepodSoftwareUpdateState;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_homepodSoftwareUpdateState)
      {
        uint64_t v25 = [(id)objc_opt_class() signpostLog];
        unint64_t v26 = [(HDSSetupSession *)self signpostID];
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)id v34 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "HomePodSoftwareUpdate", "", v34, 2u);
          }
        }
      }
      os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
      unint64_t v29 = [(HDSSetupSession *)self signpostID];
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v30 = v29;
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)uint64_t v33 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_END, v30, "HomePodSoftwareUpdate", "", v33, 2u);
        }
      }

      int result = 2;
      self->_homepodSoftwareUpdateState = 2;
    }
  }
  return result;
}

- (int)_runMultiUserEnable
{
  int multiUserEnableState = self->_multiUserEnableState;
  while (2)
  {
    int v4 = multiUserEnableState;
    switch(multiUserEnableState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30) {
          goto LABEL_41;
        }
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (!self->_multiUserEnableState)
        {
LABEL_41:
          uint64_t v25 = [(id)objc_opt_class() signpostLog];
          unint64_t v26 = [(HDSSetupSession *)self signpostID];
          if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v27 = v26;
            if (os_signpost_enabled(v25))
            {
              *(_WORD *)uint64_t v40 = 0;
              _os_signpost_emit_with_name_impl(&dword_23EB5C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MultiUserEnablement", "", v40, 2u);
            }
          }
        }
        int v13 = 10;
        goto LABEL_46;
      case 10:
        self->_int multiUserEnableState = 11;
        [(HDSSetupSession *)self _runMultiUserEnableHome];
        goto LABEL_60;
      case 11:
        if (self->_multiUserEnableStepState == 1) {
          goto LABEL_60;
        }
        unint64_t v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(HDSSetupSession *)self signpostID];
        if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_19;
        }
        os_signpost_id_t v7 = v6;
        if (!os_signpost_enabled(v5)) {
          goto LABEL_19;
        }
        __int16 v39 = 0;
        unint64_t v8 = (uint8_t *)&v39;
        os_signpost_id_t v9 = v5;
        os_signpost_id_t v10 = v7;
        goto LABEL_18;
      case 12:
        if (gLogCategory_HDSSetupSession > 30)
        {
          int v24 = 12;
        }
        else
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
            LogPrintF();
          }
          int v24 = self->_multiUserEnableState;
          if (!v24)
          {
            os_signpost_id_t v28 = [(id)objc_opt_class() signpostLog];
            unint64_t v29 = [(HDSSetupSession *)self signpostID];
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v30 = v29;
              if (os_signpost_enabled(v28))
              {
                *(_WORD *)long long v38 = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MultiUserEnablement", "", v38, 2u);
              }
            }

            int v24 = self->_multiUserEnableState;
          }
          if ((v24 - 1) <= 5)
          {
            uint64_t v31 = [(id)objc_opt_class() signpostLog];
            unint64_t v32 = [(HDSSetupSession *)self signpostID];
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v33 = v32;
              if (os_signpost_enabled(v31))
              {
                *(_WORD *)long long v37 = 0;
                _os_signpost_emit_with_name_impl(&dword_23EB5C000, v31, OS_SIGNPOST_INTERVAL_END, v33, "MultiUserEnablement", "", v37, 2u);
              }
            }

            int v24 = self->_multiUserEnableState;
          }
        }
        self->_int multiUserEnableState = v24 + 1;
        uint64_t v14 = self;
        uint64_t v15 = @"root.siri.identifyVoice";
        uint64_t v16 = 0;
        goto LABEL_59;
      case 13:
        if (self->_multiUserEnableStepState == 1) {
          goto LABEL_60;
        }
        unint64_t v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v11 = [(HDSSetupSession *)self signpostID];
        if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_19;
        }
        os_signpost_id_t v12 = v11;
        if (!os_signpost_enabled(v5)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        unint64_t v8 = buf;
        os_signpost_id_t v9 = v5;
        os_signpost_id_t v10 = v12;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MultiUserEnablement", "", v8, 2u);
LABEL_19:

        if (self->_multiUserEnableStepState == 4) {
          int v13 = self->_multiUserEnableState + 1;
        }
        else {
          int v13 = 2;
        }
LABEL_46:
        self->_int multiUserEnableState = v13;
        goto LABEL_60;
      case 14:
        self->_int multiUserEnableState = 15;
        uint64_t v14 = self;
        uint64_t v15 = @"root.home.dismissedIdentifyVoiceOnboarding";
        uint64_t v16 = 1;
LABEL_59:
        [(HDSSetupSession *)v14 _runMultiUserEnableEnableSettingStart:v15 privateSettings:v16];
        goto LABEL_60;
      case 15:
        if (self->_multiUserEnableStepState == 1) {
          goto LABEL_60;
        }
        uint64_t v17 = [(id)objc_opt_class() signpostLog];
        unint64_t v18 = [(HDSSetupSession *)self signpostID];
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)long long v35 = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "MultiUserEnablement", "", v35, 2u);
          }
        }

        int multiUserEnableStepState = self->_multiUserEnableStepState;
        int v21 = gLogCategory_HDSSetupSession;
        BOOL v22 = multiUserEnableStepState == 4;
        if (multiUserEnableStepState == 4) {
          int v23 = 4;
        }
        else {
          int v23 = 2;
        }
        self->_int multiUserEnableState = v23;
        if (v22)
        {
          if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize())) {
LABEL_38:
          }
            LogPrintF();
        }
        else if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_38;
        }
LABEL_60:
        int multiUserEnableState = self->_multiUserEnableState;
        if (multiUserEnableState != v4) {
          continue;
        }
        return v4;
      default:
        goto LABEL_60;
    }
  }
}

- (void)_runMultiUserEnableHome
{
  id v3 = [(HDSSetupSession *)self selectedHome];
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_multiUserEnableStepState)
    {
      int v4 = [(id)objc_opt_class() signpostLog];
      unint64_t v5 = [(HDSSetupSession *)self signpostID];
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }
    }
    self->_int multiUserEnableStepState = 1;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__HDSSetupSession__runMultiUserEnableHome__block_invoke;
    v13[3] = &unk_26503F7B8;
    void v13[4] = self;
    [v3 enableMultiUserWithCompletionHandler:v13];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_multiUserEnableStepState)
    {
      os_signpost_id_t v7 = [(id)objc_opt_class() signpostLog];
      unint64_t v8 = [(HDSSetupSession *)self signpostID];
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }
    }
    os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
    unint64_t v11 = [(HDSSetupSession *)self signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_END, v12, "HomeKitEnableMultiUser", "", buf, 2u);
      }
    }

    self->_int multiUserEnableStepState = 2;
  }
}

void __42__HDSSetupSession__runMultiUserEnableHome__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(NSObject **)(v4 + 1512);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HDSSetupSession__runMultiUserEnableHome__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __42__HDSSetupSession__runMultiUserEnableHome__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(void *)(a1 + 40) + 1104))
    {
      uint64_t v2 = [(id)objc_opt_class() signpostLog];
      uint64_t v3 = [*(id *)(a1 + 40) signpostID];
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }
    }
    unint64_t v5 = [(id)objc_opt_class() signpostLog];
    uint64_t v6 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", "", v17, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 40) + 1104) = 2;
    [*(id *)(a1 + 40) _logMetricsForSoftError:*(void *)(a1 + 32) label:@"MultiUser"];
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(void *)(a1 + 40) + 1104))
  {
    id v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", "", v16, 2u);
      }
    }
  }
  unint64_t v11 = [(id)objc_opt_class() signpostLog];
  uint64_t v12 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", "", v15, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 40) + 1104) = 4;
  return [*(id *)(a1 + 40) _run];
}

- (void)_runMultiUserEnableEnableSettingStart:(id)a3 privateSettings:(BOOL)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = [(HDSSetupSession *)self selectedHome];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 owner];
    os_signpost_id_t v10 = [v9 userSettingsForHome:v8];

    if (a4) {
      [v10 privateSettings];
    }
    else {
    unint64_t v11 = [v10 settings];
    }
    uint64_t v12 = v11;
    if (!v11)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        unint64_t v32 = [(id)objc_opt_class() signpostLog];
        unint64_t v33 = [(HDSSetupSession *)self signpostID];
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v34 = v33;
          if (os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "HomeKitEnableMultiUser", "", buf, 2u);
          }
        }
      }
      long long v35 = [(id)objc_opt_class() signpostLog];
      unint64_t v36 = [(HDSSetupSession *)self signpostID];
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v37 = v36;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v35, OS_SIGNPOST_INTERVAL_END, v37, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }

      self->_int multiUserEnableStepState = 2;
      goto LABEL_94;
    }
    os_signpost_id_t v13 = [v11 rootGroup];
    if (!v13)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        long long v38 = [(id)objc_opt_class() signpostLog];
        unint64_t v39 = [(HDSSetupSession *)self signpostID];
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v40 = v39;
          if (os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v40, "HomeKitEnableMultiUser", "", buf, 2u);
          }
        }
      }
      uint64_t v41 = [(id)objc_opt_class() signpostLog];
      unint64_t v42 = [(HDSSetupSession *)self signpostID];
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v43 = v42;
        if (os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v41, OS_SIGNPOST_INTERVAL_END, v43, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }

      self->_int multiUserEnableStepState = 2;
      goto LABEL_93;
    }
    uint64_t v14 = [(HDSSetupSession *)self _homeKitFindSettingsWithKeyPath:v6 group:v13];
    if (v14)
    {
      if (!self->_multiUserEnableStepState)
      {
        uint64_t v15 = [(id)objc_opt_class() signpostLog];
        unint64_t v16 = [(HDSSetupSession *)self signpostID];
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v17 = v16;
          if (os_signpost_enabled(v15))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "HomeKitEnableMultiUser", "", buf, 2u);
          }
        }
      }
      self->_int multiUserEnableStepState = 1;
      if ([v6 isEqualToString:@"root.siri.identifyVoice"])
      {
        int recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
        if (recognizeVoiceEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1
              || (int v48 = _LogCategory_Initialize(), recognizeVoiceEnabled = self->_recognizeVoiceEnabled, v48))
            {
              if (recognizeVoiceEnabled == 6) {
                os_signpost_id_t v19 = "yes";
              }
              else {
                os_signpost_id_t v19 = "no";
              }
              id v51 = v6;
              unint64_t v52 = v19;
              LogPrintF();
              int recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
            }
          }
          unint64_t v49 = objc_msgSend(NSNumber, "numberWithInt:", recognizeVoiceEnabled == 6, v51, v52);
          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke;
          v55[3] = &unk_26503F7E0;
          v55[4] = self;
          id v56 = v6;
          [v14 updateValue:v49 completionHandler:v55];

          uint64_t v50 = v56;
LABEL_91:

          goto LABEL_92;
        }
      }
      if ([v6 isEqualToString:@"root.home.dismissedIdentifyVoiceOnboarding"]
        && !self->_hasExistingHomePod)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_1566;
        v53[3] = &unk_26503F7E0;
        v53[4] = self;
        id v54 = v6;
        [v14 updateValue:MEMORY[0x263EFFA88] completionHandler:v53];
        uint64_t v50 = v54;
        goto LABEL_91;
      }
      if (!self->_multiUserEnableStepState)
      {
        uint64_t v20 = [(id)objc_opt_class() signpostLog];
        unint64_t v21 = [(HDSSetupSession *)self signpostID];
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "HomeKitEnableMultiUser", "", buf, 2u);
          }
        }
      }
      int v23 = [(id)objc_opt_class() signpostLog];
      unint64_t v24 = [(HDSSetupSession *)self signpostID];
      if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v25 = v24, !os_signpost_enabled(v23)))
      {
LABEL_86:

        self->_int multiUserEnableStepState = 2;
LABEL_92:

LABEL_93:
LABEL_94:

        goto LABEL_95;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        unint64_t v44 = [(id)objc_opt_class() signpostLog];
        unint64_t v45 = [(HDSSetupSession *)self signpostID];
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v46 = v45;
          if (os_signpost_enabled(v44))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v46, "HomeKitEnableMultiUser", "", buf, 2u);
          }
        }
      }
      int v23 = [(id)objc_opt_class() signpostLog];
      unint64_t v47 = [(HDSSetupSession *)self signpostID];
      if (v47 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_86;
      }
      os_signpost_id_t v25 = v47;
      if (!os_signpost_enabled(v23)) {
        goto LABEL_86;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_23EB5C000, v23, OS_SIGNPOST_INTERVAL_END, v25, "HomeKitEnableMultiUser", "", buf, 2u);
    goto LABEL_86;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_multiUserEnableStepState)
  {
    unint64_t v26 = [(id)objc_opt_class() signpostLog];
    unint64_t v27 = [(HDSSetupSession *)self signpostID];
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v28 = v27;
      if (os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HomeKitEnableMultiUser", "", buf, 2u);
      }
    }
  }
  unint64_t v29 = [(id)objc_opt_class() signpostLog];
  unint64_t v30 = [(HDSSetupSession *)self signpostID];
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v29, OS_SIGNPOST_INTERVAL_END, v31, "HomeKitEnableMultiUser", "", buf, 2u);
    }
  }

  self->_int multiUserEnableStepState = 2;
LABEL_95:
}

void __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2;
  block[3] = &unk_26503F940;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(void *)(a1 + 48) + 1104))
    {
      uint64_t v2 = [(id)objc_opt_class() signpostLog];
      uint64_t v3 = [*(id *)(a1 + 48) signpostID];
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }
    }
    id v5 = [(id)objc_opt_class() signpostLog];
    uint64_t v6 = [*(id *)(a1 + 48) signpostID];
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)os_signpost_id_t v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", "", v17, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 48) + 1104) = 2;
    [*(id *)(a1 + 48) _logMetricsForSoftError:*(void *)(a1 + 32) label:@"MultiUser"];
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(void *)(a1 + 48) + 1104))
  {
    id v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 48) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)unint64_t v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", "", v16, 2u);
      }
    }
  }
  uint64_t v11 = [(id)objc_opt_class() signpostLog];
  uint64_t v12 = [*(id *)(a1 + 48) signpostID];
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", "", v15, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 48) + 1104) = 4;
  return [*(id *)(a1 + 48) _run];
}

void __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_1566(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 1512);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2_1567;
  block[3] = &unk_26503F940;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2_1567(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(void *)(a1 + 48) + 1104))
    {
      uint64_t v2 = [(id)objc_opt_class() signpostLog];
      uint64_t v3 = [*(id *)(a1 + 48) signpostID];
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", "", buf, 2u);
        }
      }
    }
    id v5 = [(id)objc_opt_class() signpostLog];
    uint64_t v6 = [*(id *)(a1 + 48) signpostID];
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)os_signpost_id_t v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", "", v17, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 48) + 1104) = 2;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(void *)(a1 + 48) + 1104))
  {
    id v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 48) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)unint64_t v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", "", v16, 2u);
      }
    }
  }
  uint64_t v11 = [(id)objc_opt_class() signpostLog];
  uint64_t v12 = [*(id *)(a1 + 48) signpostID];
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", "", v15, 2u);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 48) + 1104) = 4;
  return [*(id *)(a1 + 48) _run];
}

- (int)_runFinishStart
{
  int result = self->_finishState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (!self->_finishState)
    {
LABEL_7:
      os_signpost_id_t v4 = [(id)objc_opt_class() signpostLog];
      unint64_t v5 = [(HDSSetupSession *)self signpostID];
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Finish", "", buf, 2u);
        }
      }
    }
    self->_finishState = 1;
    self->_finishStartTicks = mach_absolute_time();
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_double configureTimeSecs = configureTimeSecs;
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_15;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_15;
      }
      double configureTimeSecs = self->_configureTimeSecs;
    }
    double v8 = configureTimeSecs;
    LogPrintF();
LABEL_15:
    [(HDSSetupSession *)self _runFinishRequest];
    return self->_finishState;
  }
  return result;
}

- (void)_runFinishRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&unk_26F261048 forKeyedSubscript:@"op"];
  os_signpost_id_t v4 = [(HDSSetupSession *)self selectedSiriLanguageCode];

  if (!v4
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_hasExistingHomePod
    && !self->_prefForceSiriGreeting
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (IsAppleInternalBuild() && [(NSString *)self->_forcedPasscode length])
  {
    if (gLogCategory_HDSSetupSession > 30) {
      goto LABEL_22;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_22:
  if ((self->_stereoPairRole & 0xFFFFFFFE) != 2)
  {
LABEL_29:
    uint64_t v5 = 1;
    goto LABEL_30;
  }
  if (!self->_prefStereoWait)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  uint64_t v5 = 3;
LABEL_30:
  os_signpost_id_t v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:@"finF"];

  os_signpost_id_t v7 = self->_homeKitSelectedRoomName;
  if (v7)
  {
    if ((self->_testFlags & 0x800000) == 0)
    {
      [v3 setObject:v7 forKeyedSubscript:@"fnm"];
      uint64_t v8 = _CSCopyLocalHostnameForComputerName();
      if (v8)
      {
        uint64_t v9 = (const void *)v8;
        [v3 setObject:v8 forKeyedSubscript:@"hnm"];
        CFRelease(v9);
      }
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v11 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__HDSSetupSession__runFinishRequest__block_invoke;
  v12[3] = &unk_2650406D8;
  void v12[4] = self;
  -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v3, v12, v11);
}

void __36__HDSSetupSession__runFinishRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    if (Int64Ranged)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08410];
      uint64_t v11 = Int64Ranged;
      uint64_t v16 = *MEMORY[0x263F08320];
      uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
      os_signpost_id_t v13 = (void *)v12;
      uint64_t v14 = @"?";
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      v17[0] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v6 = [v9 errorWithDomain:v10 code:v11 userInfo:v15];
    }
    else
    {
      id v6 = 0;
    }
  }
  [*(id *)(a1 + 32) _runFinishResponse:v7 error:v6];
}

- (void)_runFinishResponse:(id)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[HDSDefaults forceFailSetupLater])
  {
    NSErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(HDSSetupSession *)self _reportError:v8 label:@"ForcedError"];
LABEL_62:

    goto LABEL_63;
  }
  if (!v7)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      double v38 = *(double *)&v6;
      LogPrintF();
    }
    if (!self->_finishState)
    {
      uint64_t v15 = [(id)objc_opt_class() signpostLog];
      unint64_t v16 = [(HDSSetupSession *)self signpostID];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Finish", "", buf, 2u);
        }
      }
    }
    unint64_t v18 = [(id)objc_opt_class() signpostLog];
    unint64_t v19 = [(HDSSetupSession *)self signpostID];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v18, OS_SIGNPOST_INTERVAL_END, v20, "Finish", "", buf, 2u);
      }
    }

    self->_finishState = 4;
    if (self->_personalRequestsChoice == 6)
    {
      CFPrefs_SetValue();
      CFPreferencesAppSynchronize(@"com.apple.Sharing");
      notify_post("com.apple.Sharing.prefsChanged");
    }
    unint64_t v21 = self->_deviceSerialNumber;
    if (v21)
    {
      if (gLogCategory_HDSSetupSession < 31
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(objc_class *)getAMSDeviceClass() registerCompanionWithSerialNumber:v21];
    }

    mach_absolute_time();
    UpTicksToSecondsF();
    self->_double userWaitTimeSecs = userWaitTimeSecs;
    if (gLogCategory_HDSSetupSession >= 31) {
      goto LABEL_37;
    }
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_37:
        int v23 = [(id)objc_opt_class() signpostLog];
        unint64_t v24 = [(HDSSetupSession *)self signpostID];
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v25 = v24;
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v23, OS_SIGNPOST_INTERVAL_END, v25, "UserWaitTime", "", buf, 2u);
          }
        }

        unint64_t v26 = [(id)objc_opt_class() signpostLog];
        unint64_t v27 = [(HDSSetupSession *)self signpostID];
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v28 = v27;
          if (os_signpost_enabled(v26))
          {
            if (self->_userOptedToHH2) {
              unint64_t v29 = "yes";
            }
            else {
              unint64_t v29 = "no";
            }
            uint64_t stereoPairRole = self->_stereoPairRole;
            if (stereoPairRole > 3) {
              os_signpost_id_t v31 = "?";
            }
            else {
              os_signpost_id_t v31 = off_265040918[stereoPairRole];
            }
            *(_DWORD *)buf = 136315394;
            unint64_t v42 = v29;
            __int16 v43 = 2080;
            unint64_t v44 = v31;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v26, OS_SIGNPOST_EVENT, v28, "SetupComplete", "hh2=%s stereoRole=%s", buf, 0x16u);
          }
        }

        mach_absolute_time();
        UpTicksToSecondsF();
        self->_finishSecs = v32;
        CFDictionaryGetDouble();
        self->_iTunesWaitSecs = v33;
        CFDictionaryGetDouble();
        self->_mediaSystemWaitSecs = v34;
        mach_absolute_time();
        UpTicksToSecondsF();
        self->_totalSecs = v35;
        if (!self->_logMetricsCalled)
        {
          [(HDSSetupSession *)self _logErrorMetrics:0 inLabel:@"Finish"];
          [(HDSSetupSession *)self _logMetrics:0];
          [(HDSSetupSession *)self _logUsageMetrics:0];
          [(HDSSetupSession *)self _logPerformanceMetrics:0];
          [(HDSSetupSession *)self _logHomeKitPerformanceMetrics];
        }
        id v36 = objc_alloc_init(MEMORY[0x263F6C1F0]);
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __44__HDSSetupSession__runFinishResponse_error___block_invoke;
        v39[3] = &unk_26503F7E0;
        v39[4] = self;
        id v8 = v36;
        id v40 = v8;
        [v8 reenableProxCardType:33 completion:v39];
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
            LogPrintF();
          }
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            double v38 = [(SFSession *)self->_sfSession identifier];
            LogPrintF();
          }
        }
        progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
        if (progressHandler) {
          progressHandler[2](progressHandler, 96, 0);
        }
        [(HDSSetupSession *)self _cleanupSession];

        goto LABEL_62;
      }
      double userWaitTimeSecs = self->_userWaitTimeSecs;
    }
    double v38 = userWaitTimeSecs;
    LogPrintF();
    goto LABEL_37;
  }
  if (!self->_finishState)
  {
    uint64_t v9 = [(id)objc_opt_class() signpostLog];
    unint64_t v10 = [(HDSSetupSession *)self signpostID];
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Finish", "", buf, 2u);
      }
    }
  }
  uint64_t v12 = [(id)objc_opt_class() signpostLog];
  unint64_t v13 = [(HDSSetupSession *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v12, OS_SIGNPOST_INTERVAL_END, v14, "Finish", "", buf, 2u);
    }
  }

  self->_finishState = 3;
  [(HDSSetupSession *)self _reportError:v7 label:@"Finish"];
  [(HDSSetupSession *)self _cleanup];
LABEL_63:
}

void __44__HDSSetupSession__runFinishResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v3);
}

- (void)_handlePeerEvent:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  if (v4) {
    goto LABEL_44;
  }
  if (+[HDSDefaults sysDropBuildMode]
    && [(SysDropSession *)self->_sysDropSession sysDropActivated])
  {
    [(SysDropSession *)self->_sysDropSession handlePeerEvent:v13 flags:v4];
    goto LABEL_55;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  int v7 = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetInt64())
  {
    self->_homePodSoftwareUpdateUpdateInstalled = 1;
  }
  else if (!self->_homePodSoftwareUpdateUpdateInstalled)
  {
    goto LABEL_13;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(HDSSetupSession *)self _updateSFSessionErrorHandlerForSUBS];
LABEL_13:
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      SFDeviceSetupProgressEventToString(Int64Ranged);
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (Int64Ranged == 901)
  {
    if (self->_isCLIMode) {
      goto LABEL_44;
    }
    if (self->_homePodSoftwareUpdateUpdateInstalled)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_homePodSoftwareUpdateCancelled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_44;
      }
      if (v7)
      {
        uint64_t v9 = NSErrorWithOSStatusF();
        [(HDSSetupSession *)self _reportError:v9, @"SU-No-Setup error encountered, SU terminated", 0 label];

        goto LABEL_44;
      }
    }
    progressHandler = (void (**)(id, uint64_t))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 901);
    }
    goto LABEL_44;
  }
  if (Int64Ranged != 905)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_55;
    }
LABEL_53:
    LogPrintF();
    goto LABEL_55;
  }
  if (!self->_isCLIMode)
  {
    id v8 = (void (**)(id, uint64_t))self->_progressHandler;
    if (v8) {
      v8[2](v8, 905);
    }
  }
LABEL_44:
  int v11 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    SFDeviceSetupProgressEventToString(v11);
    LogPrintF();
  }
  if (v11 != 600)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  uint64_t v12 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v12) {
    v12[2](v12, 96, 0);
  }
LABEL_55:
}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 settings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        os_signpost_id_t v14 = [v13 keyPath];
        char v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v20 = v13;
          goto LABEL_19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = objc_msgSend(v7, "groups", 0);
  uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v8);
      }
      id v20 = [(HDSSetupSession *)self _homeKitFindSettingsWithKeyPath:v6 group:*(void *)(*((void *)&v23 + 1) + 8 * v19)];
      if (v20) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    unint64_t v21 = v20;
  }
  else
  {
LABEL_17:
    unint64_t v21 = 0;
  }

  return v21;
}

- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke;
  v4[3] = &unk_26503F8C8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

void __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(getHMHomeManagerClass_1()) initWithOptions:0];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke_2;
  v6[3] = &unk_265040798;
  uint64_t v4 = *(void *)(a1 + 32);
  char v8 = v3;
  v6[4] = v4;
  id v7 = v2;
  id v5 = v2;
  [v5 updateiCloudSwitchState:v3 completionHandler:v6];
}

void __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) _logMetricsForSoftError:v3 label:@"Preflight-iCloud"];
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 40) status];
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30 {
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)_logiTunesAuthRetryMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 retryAttempt:(int)a6
{
  v37[12] = *MEMORY[0x263EF8340];
  if (!self->_testFlags)
  {
    id v8 = a3;
    uint64_t v9 = [v8 code];
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 domain];
    uint64_t v12 = [v8 underlyingErrors];

    id v13 = [v12 firstObject];

    uint64_t v14 = [v13 code];
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v14);
    double v34 = v13;
    uint64_t v16 = [v13 domain];
    long long v30 = [(NSUUID *)self->_sessionID UUIDString];
    v36[0] = @"duration";
    os_signpost_id_t v31 = [NSNumber numberWithUnsignedInt:(a4 * 1000.0)];
    v37[0] = v31;
    v36[1] = @"errorCode";
    uint64_t v17 = [NSNumber numberWithInteger:v9];
    uint64_t v18 = (void *)v17;
    double v35 = (void *)v11;
    if (v10) {
      uint64_t v19 = v10;
    }
    else {
      uint64_t v19 = @"0";
    }
    v37[1] = v17;
    void v37[2] = v19;
    void v36[2] = @"errorCodeString";
    v36[3] = @"errorDomain";
    if (v11) {
      id v20 = (__CFString *)v11;
    }
    else {
      id v20 = @"NoDomain";
    }
    v37[3] = v20;
    v36[4] = @"underlyingErrorCode";
    uint64_t v21 = [NSNumber numberWithInteger:v14];
    os_signpost_id_t v22 = (void *)v21;
    if (v15) {
      long long v23 = (__CFString *)v15;
    }
    else {
      long long v23 = @"0";
    }
    long long v24 = (void *)v15;
    v37[4] = v21;
    v37[5] = v23;
    void v36[5] = @"underlyingErrorCodeString";
    v36[6] = @"underlyingErrorDomain";
    if (v16) {
      long long v25 = v16;
    }
    else {
      long long v25 = @"NoDomain";
    }
    v37[6] = v25;
    v36[7] = @"failureType";
    long long v26 = [NSNumber numberWithInt:a5];
    v37[7] = v26;
    v36[8] = @"retryAttempt";
    long long v27 = [NSNumber numberWithInt:a6];
    v37[8] = v27;
    v37[9] = &unk_26F260FA0;
    v36[9] = @"retryCount";
    v36[10] = @"success";
    long long v28 = [NSNumber numberWithInt:v8 == 0];
    v36[11] = @"sessionID";
    v37[10] = v28;
    v37[11] = v30;
    long long v29 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:12];

    HDSMetricsLog(@"com.apple.homedevicesetup.iTunesRetry", v29);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logWiFiRetryMetrics:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && !self->_testFlags)
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v6 = v4, v7 = _LogCategory_Initialize(), id v4 = v6, v7))
      {
        id v5 = v4;
        LogPrintF();
        id v4 = v5;
      }
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v4;
    obuint64_t j = v4;
    uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v44;
      uint64_t v33 = self;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v8;
          CFDictionaryGetDouble();
          double v10 = v9;
          uint64_t Int64 = CFDictionaryGetInt64();
          CFStringGetTypeID();
          unint64_t v42 = CFDictionaryGetTypedValue();
          CFStringGetTypeID();
          id v40 = CFDictionaryGetTypedValue();
          uint64_t v12 = CFDictionaryGetInt64();
          uint64_t v39 = CFDictionaryGetInt64();
          BOOL v35 = v12 != 0;
          id v13 = [(NSUUID *)self->_sessionID UUIDString];
          id v29 = (id)Int64;
          uint64_t v14 = [NSString stringWithFormat:@"%ld"];
          uint64_t v15 = Int64;
          id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v47[0] = @"cca";
          os_signpost_id_t v37 = [NSNumber numberWithInteger:self->_wifiCCA];
          v48[0] = v37;
          v47[1] = @"channel";
          uint64_t v17 = [NSNumber numberWithInteger:self->_wifiChannel];
          id v36 = (void *)v17;
          wifiOUI = (__CFString *)self->_wifiOUI;
          if (!wifiOUI) {
            wifiOUI = @"None";
          }
          v48[1] = v17;
          v48[2] = wifiOUI;
          v47[2] = @"oui";
          v47[3] = @"rssi";
          uint64_t v19 = [NSNumber numberWithInteger:self->_wifiRSSI];
          id v20 = (void *)v19;
          wifiSecurityString = (__CFString *)self->_wifiSecurityString;
          if (!wifiSecurityString) {
            wifiSecurityString = @"None";
          }
          v48[3] = v19;
          v48[4] = wifiSecurityString;
          v47[4] = @"securityStr";
          v47[5] = @"duration";
          os_signpost_id_t v22 = [NSNumber numberWithUnsignedInt:(v10 * 1000.0)];
          v48[5] = v22;
          v47[6] = @"errorCode";
          long long v23 = [NSNumber numberWithInteger:v15];
          v48[6] = v23;
          v48[7] = v14;
          double v38 = (void *)v14;
          v47[7] = @"errorCodeString";
          v47[8] = @"errorDomain";
          v48[8] = v42;
          v47[9] = @"failureType";
          long long v24 = [NSNumber numberWithUnsignedLongLong:v39];
          v48[9] = v24;
          v47[10] = @"retryAttempt";
          long long v25 = [NSNumber numberWithUnsignedLongLong:self->_wifiNumRetries];
          v48[10] = v25;
          v47[11] = @"retryCount";
          long long v26 = [NSNumber numberWithUnsignedLongLong:self->_wifiMaxAttempts];
          v48[11] = v26;
          v47[12] = @"success";
          long long v27 = [NSNumber numberWithBool:v35];
          v47[13] = @"sessionID";
          v48[12] = v27;
          v48[13] = v13;
          long long v28 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:14];
          [v16 addEntriesFromDictionary:v28];

          HDSMetricsLog(@"com.apple.sharing.wifiretry", v16);
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            id v29 = v16;
            LogPrintF();
          }

          uint64_t v8 = v41 + 1;
          self = v33;
        }
        while (v34 != v41 + 1);
        uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v34);
    }

    id v4 = v30;
  }
}

- (void)_logMetricsForSoftError:(id)a3 label:(id)a4
{
  if (!self->_testFlags)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [v7 code];
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    double v9 = [(NSUUID *)self->_sessionID UUIDString];
    additionalMetrics = self->_additionalMetrics;
    if (additionalMetrics) {
      uint64_t v11 = (void *)[(NSDictionary *)additionalMetrics mutableCopy];
    }
    else {
      uint64_t v11 = objc_opt_new();
    }
    uint64_t v12 = v11;
    [v11 setObject:v9 forKeyedSubscript:@"sessionID"];
    [v12 setObject:v6 forKeyedSubscript:@"state"];

    if (self->_deviceBuildVersion) {
      deviceBuildVersion = (__CFString *)self->_deviceBuildVersion;
    }
    else {
      deviceBuildVersion = @"?";
    }
    [v12 setObject:deviceBuildVersion forKeyedSubscript:@"setupDeviceBuild"];
    [v12 setObject:self->_deviceModel forKeyedSubscript:@"setupDeviceModel"];
    uint64_t v14 = [v7 debugDescription];
    [v12 setObject:v14 forKeyedSubscript:@"setupDescription"];

    [v12 setObject:v17 forKeyedSubscript:@"setupErrorCode"];
    uint64_t v15 = [v7 domain];

    [v12 setObject:v15 forKeyedSubscript:@"setupErrorDomain"];
    id v16 = [NSNumber numberWithInt:v8 == 0];
    [v12 setObject:v16 forKeyedSubscript:@"success"];

    HDSMetricsLog(@"com.apple.hdsErrors", v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logErrorMetrics:(id)a3 inLabel:(id)a4
{
  v58[20] = *MEMORY[0x263EF8340];
  if (!self->_testFlags)
  {
    id v6 = (__CFString *)a4;
    id v7 = a3;
    uint64_t v8 = [v7 code];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v8);
    double v10 = [v7 underlyingErrors];
    uint64_t v11 = [v10 firstObject];

    uint64_t v49 = [v11 code];
    uint64_t v12 = [v11 domain];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"NoUnderlyingError";
    }
    id v56 = v14;

    os_signpost_id_t v53 = v11;
    uint64_t v15 = [v11 underlyingErrors];
    id v16 = [v15 firstObject];

    uint64_t v46 = [v16 code];
    uint64_t v17 = [v16 domain];
    uint64_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    else {
      uint64_t v19 = @"NoUnderlyingError";
    }
    uint64_t v55 = v19;

    unint64_t v52 = v16;
    id v20 = [v16 underlyingErrors];
    uint64_t v21 = [v20 firstObject];

    uint64_t v43 = [v21 code];
    id v51 = v21;
    uint64_t v22 = [v21 domain];
    long long v23 = (void *)v22;
    if (v22) {
      long long v24 = (__CFString *)v22;
    }
    else {
      long long v24 = @"NoUnderlyingError";
    }
    unint64_t v42 = v24;

    long long v25 = [(NSUUID *)self->_sessionID UUIDString];
    id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v58[0] = v25;
    v57[0] = @"sessionID";
    v57[1] = @"apcState";
    uint64_t v50 = [NSNumber numberWithInt:self->_apcState];
    v58[1] = v50;
    v57[2] = @"isHH2";
    int v48 = [NSNumber numberWithBool:self->_userOptedToHH2];
    v58[2] = v48;
    v57[3] = @"role";
    unint64_t v47 = [NSNumber numberWithInt:self->_stereoPairRole];
    v58[3] = v47;
    v57[4] = @"spcState";
    long long v44 = [NSNumber numberWithInt:self->_siriPasscodeState];
    v58[4] = v44;
    v57[5] = @"websheet";
    uint64_t v26 = [NSNumber numberWithBool:self->_didShowCaptiveSheet];
    uint64_t v41 = (void *)v26;
    deviceBuildVersion = (__CFString *)self->_deviceBuildVersion;
    long long v28 = @"?";
    if (!deviceBuildVersion) {
      deviceBuildVersion = @"?";
    }
    v58[5] = v26;
    v58[6] = deviceBuildVersion;
    v57[6] = @"setupDeviceBuild";
    v57[7] = @"setupDeviceModel";
    deviceModel = (__CFString *)self->_deviceModel;
    if (!deviceModel) {
      deviceModel = @"?";
    }
    id v54 = (void *)v9;
    if (v9) {
      long long v28 = (__CFString *)v9;
    }
    v58[7] = deviceModel;
    v58[8] = v28;
    v57[8] = @"setupErrorCodeString";
    v57[9] = @"setupErrorCode";
    id v30 = [NSNumber numberWithInteger:v8];
    v58[9] = v30;
    v57[10] = @"errorDomain";
    os_signpost_id_t v31 = [v7 domain];

    uint64_t v32 = @"No domain";
    if (v31) {
      uint64_t v32 = v31;
    }
    uint64_t v33 = @"Unknown";
    if (v6) {
      uint64_t v33 = v6;
    }
    if (v8)
    {
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v33 = @"NoError";
      uint64_t v34 = 1;
    }
    v58[10] = v32;
    v58[11] = v33;
    v57[11] = @"errorLabel";
    v57[12] = @"setupUnderlyingErrorCode";
    BOOL v35 = [NSNumber numberWithInteger:v49];
    v58[12] = v35;
    v58[13] = v56;
    v57[13] = @"setupUnderlyingErrorDomain";
    v57[14] = @"setupUnderlyingErrorCode3";
    id v36 = [NSNumber numberWithInteger:v46];
    v58[14] = v36;
    v58[15] = v55;
    v57[15] = @"setupUnderlyingErrorDomain3";
    v57[16] = @"setupUnderlyingErrorCode4";
    os_signpost_id_t v37 = [NSNumber numberWithInteger:v43];
    v58[16] = v37;
    v58[17] = v42;
    v57[17] = @"setupUnderlyingErrorDomain4";
    v57[18] = @"success";
    double v38 = [NSNumber numberWithInt:v34];
    v58[18] = v38;
    v57[19] = @"isCLIMode";
    uint64_t v39 = [NSNumber numberWithInt:self->_isCLIMode];
    v58[19] = v39;
    id v40 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:20];

    [v45 addEntriesFromDictionary:v40];
    HDSMetricsLog(@"com.apple.HomeDeviceSetup.Error", v45);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logMetrics:(id)a3
{
  v70[41] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!self->_testFlags)
  {
    uint64_t v6 = [v4 code];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v6);
    uint64_t v8 = [v5 underlyingErrors];
    uint64_t v9 = [v8 firstObject];
    uint64_t v64 = [v9 code];

    long long v67 = v5;
    double v10 = [v5 underlyingErrors];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = [v11 domain];
    id v13 = (void *)v12;
    uint64_t v14 = @"NoUnderlyingError";
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    uint64_t v15 = v14;

    uint64_t v16 = [(NSUUID *)self->_sessionID UUIDString];
    additionalMetrics = self->_additionalMetrics;
    if (additionalMetrics) {
      id v18 = (id)[(NSDictionary *)additionalMetrics mutableCopy];
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    BOOL v63 = (void *)v16;
    v70[0] = v16;
    __int16 v68 = v18;
    v69[0] = @"sessionID";
    v69[1] = @"activateMs";
    long long v62 = [NSNumber numberWithUnsignedInt:(self->_activationSecs * 1000.0)];
    v70[1] = v62;
    v69[2] = @"amsOptimizationSec";
    long long v61 = [NSNumber numberWithUnsignedInt:self->_amsOptimizationSecs];
    v70[2] = v61;
    v69[3] = @"amsSucceeded";
    long long v60 = [NSNumber numberWithInt:self->_amsActivationState == 4];
    v70[3] = v60;
    v69[4] = @"apcState";
    long long v59 = [NSNumber numberWithInt:self->_apcState];
    v70[4] = v59;
    v69[5] = @"authMs";
    long long v58 = [NSNumber numberWithUnsignedInt:((self->_trAuthenticationTotalSecs + self->_amsOptimizationSecs) * 1000.0)];
    void v70[5] = v58;
    v69[6] = @"iTunesAuthMs";
    long long v57 = [NSNumber numberWithUnsignedInt:(self->_iTunesAuthMs * 1000.0)];
    v70[6] = v57;
    v69[7] = @"iCloudAuthMs";
    id v56 = [NSNumber numberWithUnsignedInt:(self->_iCloudAuthMs * 1000.0)];
    v70[7] = v56;
    v69[8] = @"basicConfigMs";
    uint64_t v55 = [NSNumber numberWithUnsignedInt:(self->_basicConfigSecs * 1000.0)];
    v70[8] = v55;
    v69[9] = @"bonjourTestMs";
    id v54 = [NSNumber numberWithUnsignedInt:(self->_wifiBonjourTestSecs * 1000.0)];
    v70[9] = v54;
    v69[10] = @"finishMs";
    os_signpost_id_t v53 = [NSNumber numberWithUnsignedInt:(self->_finishSecs * 1000.0)];
    v70[10] = v53;
    v69[11] = @"homeKitMs";
    unint64_t v52 = [NSNumber numberWithUnsignedInt:(self->_homeKitSetupSecs * 1000.0)];
    v70[11] = v52;
    v69[12] = @"homeKitHDSMs";
    id v51 = [NSNumber numberWithUnsignedInt:(self->_homeKitHDSMs * 1000.0)];
    v70[12] = v51;
    v69[13] = @"isHH2";
    uint64_t v50 = [NSNumber numberWithBool:self->_userOptedToHH2];
    v70[13] = v50;
    v69[14] = @"iTunesWaitMs";
    uint64_t v49 = [NSNumber numberWithUnsignedInt:(self->_iTunesWaitSecs * 1000.0)];
    v70[14] = v49;
    v69[15] = @"mediaSystemWaitMs";
    int v48 = [NSNumber numberWithUnsignedInt:(self->_mediaSystemWaitSecs * 1000.0)];
    v70[15] = v48;
    uint8_t v69[16] = @"netMs";
    unint64_t v47 = [NSNumber numberWithUnsignedInt:((self->_wifiSetupSecs + self->_reachabilitySecs) * 1000.0)];
    uint8_t v70[16] = v47;
    v69[17] = @"numberOfHomePodsInHome";
    uint64_t v46 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomePodsInHome];
    v70[17] = v46;
    v69[18] = @"numberOfHomePodsInAccount";
    id v45 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomePodsInAccount];
    v70[18] = v45;
    v69[19] = @"numberOfHomes";
    long long v44 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomes];
    v70[19] = v44;
    v69[20] = @"pairMs";
    uint64_t v43 = [NSNumber numberWithUnsignedInt:(self->_pairSetupSecs * 1000.0)];
    v70[20] = v43;
    v69[21] = @"role";
    unint64_t v42 = [NSNumber numberWithInt:self->_stereoPairRole];
    v70[21] = v42;
    v69[22] = @"setupConfigMs";
    uint64_t v41 = [NSNumber numberWithUnsignedInt:(self->_trSetupConfigurationSecs * 1000.0)];
    v70[22] = v41;
    v69[23] = @"spcState";
    id v40 = [NSNumber numberWithInt:self->_siriPasscodeState];
    v70[23] = v40;
    v69[24] = @"totalMs";
    uint64_t v39 = [NSNumber numberWithUnsignedInt:(self->_totalSecs * 1000.0)];
    v70[24] = v39;
    v69[25] = @"wifiMs";
    double v38 = [NSNumber numberWithUnsignedInt:(self->_wifiSetupStepSecs * 1000.0)];
    v70[25] = v38;
    v69[26] = @"reachabilityMs";
    os_signpost_id_t v37 = [NSNumber numberWithUnsignedInt:(self->_reachabilitySecs * 1000.0)];
    v70[26] = v37;
    v69[27] = @"websheet";
    uint64_t v19 = [NSNumber numberWithBool:self->_didShowCaptiveSheet];
    id v36 = (void *)v19;
    deviceBuildVersion = (__CFString *)self->_deviceBuildVersion;
    if (!deviceBuildVersion) {
      deviceBuildVersion = @"?";
    }
    v70[27] = v19;
    v70[28] = deviceBuildVersion;
    v69[28] = @"setupDeviceBuild";
    v69[29] = @"isV2Terms";
    BOOL v35 = [NSNumber numberWithBool:self->_termsAndConditionsV2Shown];
    v70[29] = v35;
    v69[30] = @"automaticSoftwareUpdateAgreed";
    uint64_t v34 = [NSNumber numberWithInt:self->_automaticSoftwareUpdateAgreed];
    v70[30] = v34;
    v69[31] = @"softwareUpdateAgreed";
    uint64_t v21 = [NSNumber numberWithInt:self->_softwareUpdateAgreed];
    v70[31] = v21;
    v69[32] = @"homePodSUState";
    uint64_t v22 = [NSNumber numberWithInt:self->_homePodSUState];
    v70[32] = v22;
    v69[33] = @"homePodProductVersion";
    uint64_t v23 = [NSNumber numberWithInt:self->_homePodProductVersion];
    long long v24 = (void *)v23;
    deviceModel = (__CFString *)self->_deviceModel;
    if (!deviceModel) {
      deviceModel = @"?";
    }
    v70[33] = v23;
    v70[34] = deviceModel;
    v69[34] = @"setupDeviceModel";
    v69[35] = @"setupErrorCodeString";
    long long v66 = (void *)v7;
    if (v7) {
      uint64_t v26 = (__CFString *)v7;
    }
    else {
      uint64_t v26 = @"?";
    }
    v70[35] = v26;
    v69[36] = @"setupErrorCode";
    long long v27 = [NSNumber numberWithInteger:v6];
    v70[36] = v27;
    v69[37] = @"setupUnderlyingErrorCode";
    long long v28 = [NSNumber numberWithInteger:v64];
    v70[37] = v28;
    long long v65 = v15;
    v70[38] = v15;
    v69[38] = @"setupUnderlyingErrorDomain";
    v69[39] = @"isCLIMode";
    id v29 = [NSNumber numberWithBool:self->_isCLIMode];
    v70[39] = v29;
    v69[40] = @"success";
    id v30 = [NSNumber numberWithInt:v6 == 0];
    v70[40] = v30;
    os_signpost_id_t v31 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:41];
    [v68 addEntriesFromDictionary:v31];

    if (self->_cdpEnabled)
    {
      uint64_t v32 = [NSNumber numberWithUnsignedInt:(self->_cdpSetupSecs * 1000.0)];
      [v68 setObject:v32 forKeyedSubscript:@"cdpSetupMs"];
    }
    id v5 = v67;
    if (v67)
    {
      uint64_t v33 = [v67 domain];
      [v68 setObject:v33 forKeyedSubscript:@"errorDomain"];
    }
    HDSMetricsLog(@"com.apple.sharing.ASSetupSuccess", v68);
    HDSMetricsLog(@"com.apple.HomeDeviceSetup.SetupCompleted", v68);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logUsageMetrics:(id)a3
{
  v46[28] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!self->_testFlags)
  {
    uint64_t v6 = [v4 code];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v6);
    uint64_t v8 = [(HDSSetupSession *)self expressSetupState];
    uint64_t v9 = [(NSUUID *)self->_sessionID UUIDString];
    id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v42 = (void *)v9;
    v46[0] = v9;
    v45[0] = @"sessionID";
    v45[1] = @"apcState";
    uint64_t v41 = [NSNumber numberWithInt:self->_apcState];
    v46[1] = v41;
    v45[2] = @"spcState";
    id v40 = [NSNumber numberWithInt:self->_siriPasscodeState];
    v46[2] = v40;
    v45[3] = @"isHH2";
    uint64_t v39 = [NSNumber numberWithBool:self->_userOptedToHH2];
    v46[3] = v39;
    v45[4] = @"isCLIMode";
    double v38 = [NSNumber numberWithBool:self->_isCLIMode];
    v46[4] = v38;
    v45[5] = @"amsSucceeded";
    os_signpost_id_t v37 = [NSNumber numberWithInt:self->_amsActivationState == 4];
    v46[5] = v37;
    v45[6] = @"role";
    id v36 = [NSNumber numberWithInt:self->_stereoPairRole];
    v46[6] = v36;
    v45[7] = @"numberOfHomePodsInHome";
    uint64_t v34 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomePodsInHome];
    v46[7] = v34;
    v45[8] = @"numberOfHomePodsInAccount";
    uint64_t v33 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomePodsInAccount];
    v46[8] = v33;
    v45[9] = @"numberOfHomes";
    uint64_t v32 = [NSNumber numberWithUnsignedLongLong:self->_numberOfHomes];
    v46[9] = v32;
    v45[10] = @"websheet";
    os_signpost_id_t v31 = [NSNumber numberWithBool:self->_didShowCaptiveSheet];
    v46[10] = v31;
    v45[11] = @"automaticSoftwareUpdateAgreed";
    id v30 = [NSNumber numberWithInt:self->_automaticSoftwareUpdateAgreed];
    v46[11] = v30;
    v45[12] = @"softwareUpdateAgreed";
    id v29 = [NSNumber numberWithInt:self->_softwareUpdateAgreed];
    v46[12] = v29;
    v45[13] = @"homePodSUState";
    long long v28 = [NSNumber numberWithInt:self->_homePodSUState];
    v46[13] = v28;
    v45[14] = @"odeonState";
    long long v27 = [NSNumber numberWithInt:self->_odeonState];
    v46[14] = v27;
    v45[15] = @"homePodProductVersion";
    uint64_t v10 = [NSNumber numberWithInt:self->_homePodProductVersion];
    uint64_t v26 = (void *)v10;
    long long v44 = v5;
    deviceModel = (__CFString *)self->_deviceModel;
    if (!deviceModel) {
      deviceModel = @"?";
    }
    v46[15] = v10;
    v46[16] = deviceModel;
    v45[16] = @"setupDeviceModel";
    v45[17] = @"setupDeviceBuild";
    deviceBuildVersion = (__CFString *)self->_deviceBuildVersion;
    if (!deviceBuildVersion) {
      deviceBuildVersion = @"?";
    }
    v46[17] = deviceBuildVersion;
    v45[18] = @"rmvState";
    long long v25 = [NSNumber numberWithInt:self->_rmvSelectionState];
    v46[18] = v25;
    v45[19] = @"soundRecognitionState";
    id v13 = [NSNumber numberWithInt:self->_soundRecognitionSelectionState];
    v46[19] = v13;
    v45[20] = @"siriSettingState";
    uint64_t v14 = [NSNumber numberWithInt:self->_siriSettingState];
    v46[20] = v14;
    v45[21] = @"personalRequestsState";
    uint64_t v15 = [NSNumber numberWithInt:self->_personalRequestsSelectionState];
    v46[21] = v15;
    v45[22] = @"activeDeviceState";
    uint64_t v16 = [NSNumber numberWithInt:self->_activeDeviceSelectionState];
    v46[22] = v16;
    v45[23] = @"locationSelectionState";
    uint64_t v17 = [NSNumber numberWithInt:self->_locationSelectionState];
    v46[23] = v17;
    v45[24] = @"expressSetupState";
    uint64_t v18 = [NSNumber numberWithInt:v8];
    uint64_t v19 = (void *)v18;
    uint64_t v43 = (void *)v7;
    if (v7) {
      id v20 = (__CFString *)v7;
    }
    else {
      id v20 = @"?";
    }
    v46[24] = v18;
    v46[25] = v20;
    v45[25] = @"setupErrorCodeString";
    v45[26] = @"setupErrorCode";
    uint64_t v21 = [NSNumber numberWithInteger:v6];
    v46[26] = v21;
    v45[27] = @"success";
    uint64_t v22 = [NSNumber numberWithInt:v6 == 0];
    v46[27] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:28];
    [v35 addEntriesFromDictionary:v23];

    id v5 = v44;
    if (v44)
    {
      long long v24 = [v44 domain];
      [v35 setObject:v24 forKeyedSubscript:@"errorDomain"];
    }
    HDSMetricsLog(@"com.apple.HDSUsage", v35);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logPerformanceMetrics:(id)a3
{
  v44[32] = *MEMORY[0x263EF8340];
  if (!self->_testFlags)
  {
    uint64_t v4 = [a3 code];
    uint64_t v5 = [(NSUUID *)self->_sessionID UUIDString];
    double v6 = self->_basicConfigSecs
       + self->_wifiSetupSecs
       + self->_reachabilitySecs
       + self->_wifiBonjourTestSecs
       + self->_trSetupConfigurationSecs
       + self->_cdpSetupSecs
       + self->_activationSecs
       + self->_iCloudAuthMs
       + self->_iTunesAuthMs
       + self->_setupDeviceSecs
       + self->_addDeviceSecs;
    id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v42 = (void *)v5;
    v43[0] = @"sessionID";
    v44[0] = v5;
    v43[1] = @"userWaitMs";
    uint64_t v41 = [NSNumber numberWithUnsignedInt:(self->_userWaitTimeSecs * 1000.0)];
    v44[1] = v41;
    v43[2] = @"configureTimeMs";
    id v40 = [NSNumber numberWithUnsignedInt:(self->_configureTimeSecs * 1000.0)];
    v44[2] = v40;
    v43[3] = @"role";
    uint64_t v39 = [NSNumber numberWithInt:self->_stereoPairRole];
    v44[3] = v39;
    v43[4] = @"activateMs";
    double v38 = [NSNumber numberWithUnsignedInt:(self->_activationSecs * 1000.0)];
    v44[4] = v38;
    v43[5] = @"amsOptimizationSec";
    os_signpost_id_t v37 = [NSNumber numberWithUnsignedInt:self->_amsOptimizationSecs];
    v44[5] = v37;
    v43[6] = @"authMs";
    id v36 = [NSNumber numberWithUnsignedInt:((self->_trAuthenticationTotalSecs + self->_amsOptimizationSecs) * 1000.0)];
    v44[6] = v36;
    v43[7] = @"iTunesAuthMs";
    id v35 = [NSNumber numberWithUnsignedInt:(self->_iTunesAuthMs * 1000.0)];
    v44[7] = v35;
    v43[8] = @"iCloudAuthMs";
    uint64_t v33 = [NSNumber numberWithUnsignedInt:(self->_iCloudAuthMs * 1000.0)];
    v44[8] = v33;
    v43[9] = @"basicConfigMs";
    uint64_t v32 = [NSNumber numberWithUnsignedInt:(self->_basicConfigSecs * 1000.0)];
    v44[9] = v32;
    v43[10] = @"bonjourTestMs";
    os_signpost_id_t v31 = [NSNumber numberWithUnsignedInt:(self->_wifiBonjourTestSecs * 1000.0)];
    v44[10] = v31;
    v43[11] = @"finishMs";
    id v30 = [NSNumber numberWithUnsignedInt:(self->_finishSecs * 1000.0)];
    v44[11] = v30;
    v43[12] = @"homeKitMs";
    id v29 = [NSNumber numberWithUnsignedInt:(self->_homeKitSetupSecs * 1000.0)];
    v44[12] = v29;
    v43[13] = @"homeKitHDSMs";
    long long v28 = [NSNumber numberWithUnsignedInt:(self->_homeKitHDSMs * 1000.0)];
    v44[13] = v28;
    v43[14] = @"iTunesWaitMs";
    long long v27 = [NSNumber numberWithUnsignedInt:(self->_iTunesWaitSecs * 1000.0)];
    v44[14] = v27;
    v43[15] = @"mediaSystemWaitMs";
    uint64_t v26 = [NSNumber numberWithUnsignedInt:(self->_mediaSystemWaitSecs * 1000.0)];
    v44[15] = v26;
    v43[16] = @"netMs";
    long long v25 = [NSNumber numberWithUnsignedInt:((self->_wifiSetupSecs + self->_reachabilitySecs) * 1000.0)];
    v44[16] = v25;
    v43[17] = @"pairMs";
    long long v24 = [NSNumber numberWithUnsignedInt:(self->_pairSetupSecs * 1000.0)];
    v44[17] = v24;
    v43[18] = @"setupConfigMs";
    uint64_t v23 = [NSNumber numberWithUnsignedInt:(self->_trSetupConfigurationSecs * 1000.0)];
    v44[18] = v23;
    v43[19] = @"totalMs";
    uint64_t v22 = [NSNumber numberWithUnsignedInt:(self->_totalSecs * 1000.0)];
    v44[19] = v22;
    v43[20] = @"wifiMs";
    uint64_t v21 = [NSNumber numberWithUnsignedInt:(self->_wifiSetupStepSecs * 1000.0)];
    v44[20] = v21;
    v43[21] = @"setupDeviceNonUserMs";
    id v20 = [NSNumber numberWithUnsignedInt:(self->_setupDeviceSecs * 1000.0)];
    v44[21] = v20;
    v43[22] = @"addDeviceMs";
    uint64_t v19 = [NSNumber numberWithUnsignedInt:(self->_addDeviceSecs * 1000.0)];
    v44[22] = v19;
    v43[23] = @"assignRoomMs";
    uint64_t v18 = [NSNumber numberWithUnsignedInt:(self->_assignRoomSecs * 1000.0)];
    v44[23] = v18;
    v43[24] = @"personalRequestsMs";
    uint64_t v17 = [NSNumber numberWithUnsignedInt:(self->_personalRequestSecs * 1000.0)];
    v44[24] = v17;
    v43[25] = @"ulhNonUserMs";
    uint64_t v7 = [NSNumber numberWithUnsignedInt:(self->_ulhNonUserWaitSecs * 1000.0)];
    v44[25] = v7;
    v43[26] = @"odeonStepMs";
    uint64_t v8 = [NSNumber numberWithUnsignedInt:(self->_odeonSecs * 1000.0)];
    v44[26] = v8;
    v43[27] = @"reachabilityMs";
    uint64_t v9 = [NSNumber numberWithUnsignedInt:(self->_reachabilitySecs * 1000.0)];
    v44[27] = v9;
    v43[28] = @"setupUntilConfiguringMs";
    uint64_t v10 = [NSNumber numberWithUnsignedInt:(v6 * 1000.0)];
    v44[28] = v10;
    v43[29] = @"odeonState";
    uint64_t v11 = [NSNumber numberWithInt:self->_odeonState];
    uint64_t v12 = (void *)v11;
    deviceModel = @"?";
    if (self->_deviceModel) {
      deviceModel = (__CFString *)self->_deviceModel;
    }
    v44[29] = v11;
    v44[30] = deviceModel;
    v43[30] = @"setupDeviceModel";
    v43[31] = @"success";
    uint64_t v14 = [NSNumber numberWithInt:v4 == 0];
    v44[31] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:32];
    [v34 addEntriesFromDictionary:v15];

    if (self->_cdpEnabled)
    {
      uint64_t v16 = [NSNumber numberWithUnsignedInt:(self->_cdpSetupSecs * 1000.0)];
      [v34 setObject:v16 forKeyedSubscript:@"cdpSetupMs"];
    }
    HDSMetricsLog(@"com.apple.HomeDeviceSetupPerformance", v34);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_logHomeKitPerformanceMetrics
{
  v18[13] = *MEMORY[0x263EF8340];
  if (!self->_testFlags)
  {
    uint64_t v16 = [(NSUUID *)self->_sessionID UUIDString];
    v17[0] = @"sessionID";
    v18[0] = v16;
    v17[1] = @"homeKitMs";
    uint64_t v15 = [NSNumber numberWithUnsignedInt:(self->_homeKitSetupSecs * 1000.0)];
    v18[1] = v15;
    void v17[2] = @"homeKitHDSMs";
    uint64_t v14 = [NSNumber numberWithUnsignedInt:(self->_homeKitHDSMs * 1000.0)];
    v18[2] = v14;
    v17[3] = @"setupDeviceNonUserMs";
    id v13 = [NSNumber numberWithUnsignedInt:(self->_setupDeviceSecs * 1000.0)];
    v18[3] = v13;
    v17[4] = @"addDeviceMs";
    id v3 = [NSNumber numberWithUnsignedInt:(self->_addDeviceSecs * 1000.0)];
    v18[4] = v3;
    void v17[5] = @"assignRoomMs";
    uint64_t v4 = [NSNumber numberWithUnsignedInt:(self->_assignRoomSecs * 1000.0)];
    void v18[5] = v4;
    v17[6] = @"personalRequestsMs";
    uint64_t v5 = [NSNumber numberWithUnsignedInt:(self->_personalRequestSecs * 1000.0)];
    v18[6] = v5;
    v17[7] = @"ulhNonUserMs";
    double v6 = [NSNumber numberWithUnsignedInt:(self->_ulhNonUserWaitSecs * 1000.0)];
    v18[7] = v6;
    v17[8] = @"odeonStepMs";
    uint64_t v7 = [NSNumber numberWithUnsignedInt:(self->_odeonSecs * 1000.0)];
    v18[8] = v7;
    v17[9] = @"nonUserWaitMs";
    uint64_t v8 = [NSNumber numberWithUnsignedInt:(self->_nonUserWaitSecs * 1000.0)];
    v18[9] = v8;
    v17[10] = @"hkDataSyncMs";
    uint64_t v9 = [NSNumber numberWithUnsignedInt:(self->_homeKitDataSyncSecs * 1000.0)];
    v18[10] = v9;
    v17[11] = @"stereoPairMs";
    uint64_t v10 = [NSNumber numberWithUnsignedInt:(self->_stereoPairSecs * 1000.0)];
    v18[11] = v10;
    v17[12] = @"hkAccessoryDataSyncMs";
    uint64_t v11 = [NSNumber numberWithUnsignedInt:(self->_homeKitAccessoryDataSyncSecs * 1000.0)];
    v18[12] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:13];

    HDSMetricsLog(@"com.apple.HDSHomeKitPerformance", v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)logMetricsForDismissal:(id)a3 dismissType:(int)a4 cardName:(id)a5 cardDuration:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  v26[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (!self->_testFlags)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v24 = [v9 code];
    uint64_t v11 = [(NSUUID *)self->_sessionID UUIDString];
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v25[0] = @"cardDuration";
    id v13 = NSNumber;
    mach_absolute_time();
    UpTicksToSecondsF();
    uint64_t v15 = [v13 numberWithUnsignedInt:(v14 * 1000.0)];
    v26[0] = v15;
    v25[1] = @"dismissType";
    uint64_t v16 = [NSNumber numberWithInt:v7];
    v26[1] = v16;
    v25[2] = @"totalDuration";
    uint64_t v17 = NSNumber;
    mach_absolute_time();
    UpTicksToSecondsF();
    uint64_t v19 = [v17 numberWithUnsignedInt:(v18 * 1000.0)];
    v25[3] = @"sessionID";
    v26[2] = v19;
    v26[3] = v11;
    id v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    [v12 addEntriesFromDictionary:v20];

    if (v10) {
      [v12 setObject:v10 forKeyedSubscript:@"cardName"];
    }
    deviceModel = self->_deviceModel;
    if (deviceModel) {
      [v12 setObject:deviceModel forKeyedSubscript:@"homePodModel"];
    }
    if (v9)
    {
      uint64_t v22 = [NSNumber numberWithInteger:v24];
      [v12 setObject:v22 forKeyedSubscript:@"errorCode"];

      uint64_t v23 = [v9 domain];
      [v12 setObject:v23 forKeyedSubscript:@"errorDomain"];
    }
    HDSMetricsLog(@"com.apple.HomeDeviceSetup.cardDismiss", v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_promptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v6 = (__CFString *)(self->_pairSetupFlags | a3);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = &unk_23EBBE728;
    uint64_t v18 = v4;
    uint64_t v16 = v6;
    LogPrintF();
  }
  if ((self->_pairSetupFlags & 0x800) != 0)
  {
    if ((int)v4 > 0 || (v6 & 0x10000) != 0)
    {
      apcPasscode = self->_apcPasscode;
      self->_apcPasscode = 0;
    }
    uint64_t v8 = self->_apcPasscode;
    if (v8)
    {
      uint64_t v19 = (__CFString *)v8;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        int v9 = IsAppleInternalBuild();
        id v10 = @"*";
        if (v9) {
          id v10 = v19;
        }
        uint64_t v16 = v10;
        LogPrintF();
      }
      uint64_t v8 = (NSString *)-[SFSession pairSetupTryPIN:](self->_sfSession, "pairSetupTryPIN:", v19, v16, v17, v18);
    }
    else
    {
      apcTimer = self->_apcTimer;
      if (apcTimer)
      {
        id v12 = apcTimer;
        dispatch_source_cancel(v12);
        id v13 = self->_apcTimer;
        self->_apcTimer = 0;
      }
      self->_apcTryingPasscode = 0;
    }
    MEMORY[0x270F9A790](v8);
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id promptForPINHandler = self->_promptForPINHandler;
    if (promptForPINHandler)
    {
      uint64_t v15 = (void (*)(void))*((void *)promptForPINHandler + 2);
      v15();
    }
  }
}

- (BOOL)_recognizeVoiceAlreadyEnabled
{
  id v3 = [(HDSSetupSession *)self selectedHome];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 owner];
    double v6 = [v5 userSettingsForHome:v4];
    uint64_t v7 = [v6 settings];

    if (!v7)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      BOOL v13 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [v7 rootGroup];
    if (!v8)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      BOOL v13 = 0;
      goto LABEL_8;
    }
    int v9 = [(HDSSetupSession *)self _homeKitFindSettingsWithKeyPath:@"root.siri.identifyVoice" group:v8];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 value];
      uint64_t v12 = CFGetInt64();

      if (v12)
      {
        BOOL v13 = 1;
LABEL_7:

LABEL_8:
LABEL_9:

        goto LABEL_10;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v15 = [v10 value];
        LogPrintF();
      }
    }
    else if (gLogCategory_HDSSetupSession <= 30 {
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    BOOL v13 = 0;
    goto LABEL_7;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (void)_startSysDropLoggingProfileRequest
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [MEMORY[0x263F08C38] UUID];
  uint64_t v5 = [v4 UUIDString];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  id v12 = 0;
  [v3 setObject:v5 forKeyedSubscript:@"_hds_kfti"];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke;
  v8[3] = &unk_2650407C0;
  void v8[4] = self;
  id v10 = v11;
  id v7 = v5;
  id v9 = v7;
  [(SFSession *)sfSession sendRequestID:@"_hds_rpft_sysdrop_enablement" options:&unk_26F260E10 request:v3 responseHandler:v8];

  _Block_object_dispose(v11, 8);
}

void __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 1432) = 3;
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = NSErrorF();
    [v10 _reportError:v11 label:@"ProfileFileTransfer"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v19 = v9;
      LogPrintF();
    }
    id v12 = objc_alloc_init(HDSFileTransfer);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v11 = [*(id *)(a1 + 32) fetchHomePodLoggingProfile];
    if (v11)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      uint8_t v20[2] = __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke_2;
      v20[3] = &unk_26503F7B8;
      v20[4] = *(void *)(a1 + 32);
      objc_msgSend(v16, "beginSysDropFileTransfer:pathToFile:withCompletion:", v15, v11, v20, v19);
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 1432) = 3;
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = NSErrorF();
      [v17 _reportError:v18 label:@"ProfileFileTransfer"];
    }
  }
}

void __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 1512);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke_3;
  v7[3] = &unk_26503F8F0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __53__HDSSetupSession__startSysDropLoggingProfileRequest__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 40) + 1432) = 3;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    return [v2 _reportError:v3 label:@"ProfileFileTransfer"];
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 40) + 1432) = 4;
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 _run];
  }
}

- (void)_startSysDropSysdiagnoseRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  sfSession = self->_sfSession;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HDSSetupSession__startSysDropSysdiagnoseRequest___block_invoke;
  v8[3] = &unk_2650407E8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SFSession *)sfSession sendRequestID:@"sysdrop_sys_start" options:&unk_26F260E38 request:v5 responseHandler:v8];
}

void __51__HDSSetupSession__startSysDropSysdiagnoseRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _startSysDropMode:*(void *)(a1 + 40)];
}

- (void)_startSysDropMode:(id)a3
{
  sysDropSession = self->_sysDropSession;
  id v5 = a3;
  [(SysDropSession *)sysDropSession setStartedFromSetup:1];
  [(SysDropSession *)self->_sysDropSession setSetupError:v5];

  [(SysDropSession *)self->_sysDropSession setSfSession:self->_sfSession];
  id v6 = self->_sysDropSession;
  [(SysDropSession *)v6 activate];
}

- (BOOL)_isPreflightError:(id)a3
{
  int v3 = NSErrorToOSStatus();
  BOOL result = 1;
  if ((v3 - 301000) > 0x1B || ((1 << (v3 + 56)) & 0x8160C61) == 0) {
    return v3 == -71138;
  }
  return result;
}

- (void)_reportError:(id)a3 label:(id)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = gLogCategory_HDSSetupSession;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      id v4 = [(SFSession *)self->_sfSession identifier];
      LogPrintF();
    }
    int v10 = gLogCategory_HDSSetupSession;
  }
  if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FPrintF();
  if (!self->_mainError) {
    objc_storeStrong((id *)&self->_mainError, a3);
  }
  if (self->_totalSecs == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_totalSecs = v11;
  }
  if (objc_msgSend(v8, "code", v9, v8) != -6723)
  {
    if (!self->_logMetricsCalled)
    {
      self->_logMetricsCalled = 1;
      [(HDSSetupSession *)self _logMetrics:v8];
      [(HDSSetupSession *)self _logErrorMetrics:v8 inLabel:v9];
      [(HDSSetupSession *)self _logUsageMetrics:v8];
      [(HDSSetupSession *)self _logPerformanceMetrics:v8];
      [(HDSSetupSession *)self _logHomeKitPerformanceMetrics];
      additionalMetrics = self->_additionalMetrics;
      if (additionalMetrics) {
        id v13 = (id)[(NSDictionary *)additionalMetrics mutableCopy];
      }
      else {
        id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      double v14 = v13;
      v34[0] = v9;
      v33[0] = @"label";
      v33[1] = @"errDomain";
      uint64_t v15 = [v8 domain];
      id v4 = (void *)v15;
      uint64_t v16 = @"?";
      if (v15) {
        uint64_t v16 = (__CFString *)v15;
      }
      v34[1] = v16;
      void v33[2] = @"errCode";
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
      v34[2] = v17;
      v33[3] = @"totalMs";
      uint64_t v18 = [NSNumber numberWithUnsignedInt:(self->_totalSecs * 1000.0)];
      v34[3] = v18;
      id v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
      [v14 addEntriesFromDictionary:v19];

      HDSMetricsLog(@"com.apple.sharing.ASSetupError", v14);
    }
    id v20 = (void *)0x26503F000;
    uint64_t v21 = +[HDSDefaults sysDropBuildMode];
    if (v21
      && [(HDSSetupSession *)self shouldDoSysDrop:v21]
      && self->_homePodSysDropCapable
      && _os_feature_enabled_impl()
      && ![(SysDropSession *)self->_sysDropSession sysDropActivated]
      && !self->_isCLIMode
      && !self->_isConnectionError
      && (![(HDSSetupSession *)self _isPreflightError:v8]
       || +[HDSDefaults sysDropForceErrorEarlyEnabled]
       && [v8 code] == 301006))
    {
      [(HDSSetupSession *)self _startSysDropSysdiagnoseRequest:v8];
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SysDropSession *)self->_sysDropSession setSysDropFailed:1];
      [(HDSSetupSession *)self _cleanupSession];
      progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
      if (progressHandler)
      {
        os_signpost_id_t v31 = @"eo";
        uint64_t v23 = v8;
        if (!v8)
        {
          uint64_t v24 = (void *)MEMORY[0x263F087E8];
          uint64_t v25 = *MEMORY[0x263F08410];
          uint64_t v29 = *MEMORY[0x263F08320];
          uint64_t v26 = [NSString stringWithUTF8String:DebugGetErrorString()];
          id v20 = (void *)v26;
          long long v27 = @"?";
          if (v26) {
            long long v27 = (__CFString *)v26;
          }
          id v30 = v27;
          id v4 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          uint64_t v23 = [v24 errorWithDomain:v25 code:-6700 userInfo:v4];
        }
        uint64_t v32 = v23;
        long long v28 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        progressHandler[2](progressHandler, 30, v28);

        if (!v8)
        {
        }
      }
    }
  }
}

- (void)_setupAudio
{
  int v3 = [(objc_class *)getAVAudioSessionClass() sharedInstance];
  audioSession = self->_audioSession;
  self->_audioSession = v3;

  id v5 = self->_audioSession;
  id v42 = 0;
  int v6 = [(AVAudioSession *)v5 setEligibleForBTSmartRoutingConsideration:0 error:&v42];
  id v7 = v42;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    id v8 = "no";
    if (v6) {
      id v8 = "yes";
    }
    uint64_t v33 = v8;
    id v36 = v7;
    LogPrintF();
  }
  id v9 = self->_audioSession;
  int v10 = getAVAudioSessionCategoryAmbient();
  id v41 = 0;
  BOOL v11 = [(AVAudioSession *)v9 setCategory:v10 error:&v41];
  id v12 = (char *)v41;

  if (!v11)
  {
    [(HDSSetupSession *)self _logMetricsForSoftError:v12 label:@"PreSetup-SetupAudio"];
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = v12;
      LogPrintF();
    }
  }
  id v13 = self->_audioSession;
  double v14 = getAVAudioSessionModeDefault();
  id v40 = v12;
  BOOL v15 = [(AVAudioSession *)v13 setMode:v14 error:&v40];
  uint64_t v16 = v40;

  if (!v15)
  {
    [(HDSSetupSession *)self _logMetricsForSoftError:v16 label:@"PreSetup-SetupAudio"];
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = v16;
      LogPrintF();
    }
  }
  uint64_t v17 = self->_audioSession;
  uint64_t v39 = v16;
  BOOL v18 = -[AVAudioSession setActive:error:](v17, "setActive:error:", 1, &v39, v33, v36);
  id v19 = v39;

  if (!v18)
  {
    [(HDSSetupSession *)self _logMetricsForSoftError:v19 label:@"PreSetup-SetupAudio"];
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      id v34 = v19;
      LogPrintF();
    }
  }
  id v20 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v34);
  uint64_t v21 = getAVAudioSessionInterruptionNotification();
  [v20 addObserver:self selector:sel_audioSessionInterrupted_ name:v21 object:self->_audioSession];

  uint64_t v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HomeDeviceSetup"];
  uint64_t v23 = [v22 URLForResource:@"HomePodSetupSource1-b238.m4a" withExtension:0];
  if (v23)
  {
    id v24 = objc_alloc((Class)getAVAudioPlayerClass());
    double v38 = v19;
    uint64_t v25 = (AVAudioPlayer *)[v24 initWithContentsOfURL:v23 error:&v38];
    uint64_t v26 = v38;

    audioPlayerStart = self->_audioPlayerStart;
    self->_audioPlayerStart = v25;

    [(AVAudioPlayer *)self->_audioPlayerStart setDelegate:self];
    [(AVAudioPlayer *)self->_audioPlayerStart prepareToPlay];
    if (!self->_audioPlayerStart)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(HDSSetupSession *)self _logMetricsForSoftError:v26, @"PreSetup-SetupAudio", v26 label];
      }
      else
      {
        [(HDSSetupSession *)self _logMetricsForSoftError:v26, @"PreSetup-SetupAudio", v35 label];
      }
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v26 = v19;
  }
  long long v28 = [v22 URLForResource:@"HomePodSetupSource2-b238.m4a" withExtension:0];

  if (v28)
  {
    id v29 = objc_alloc((Class)getAVAudioPlayerClass());
    os_signpost_id_t v37 = v26;
    id v30 = (AVAudioPlayer *)[v29 initWithContentsOfURL:v28 error:&v37];
    os_signpost_id_t v31 = v37;

    audioPlayerStep = self->_audioPlayerStep;
    self->_audioPlayerStep = v30;

    [(AVAudioPlayer *)self->_audioPlayerStep setDelegate:self];
    [(AVAudioPlayer *)self->_audioPlayerStep prepareToPlay];
    if (!self->_audioPlayerStep)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(HDSSetupSession *)self _logMetricsForSoftError:v31, @"PreSetup-SetupAudio", v31 label];
      }
      else
      {
        [(HDSSetupSession *)self _logMetricsForSoftError:v31, @"PreSetup-SetupAudio", v35 label];
      }
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    os_signpost_id_t v31 = v26;
  }
}

- (unint64_t)_peerDeviceSupportedStereoPairVersions
{
  if ([(SFDevice *)self->_peerDevice deviceModelCode] == 5) {
    return 2;
  }
  if ([(SFDevice *)self->_peerDevice deviceModelCode] != 6) {
    return 1;
  }
  if ([(SFDevice *)self->_peerDevice deviceType] == 2) {
    return 8;
  }
  return 4;
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HDSSetupSession_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  v8[3] = &unk_26503F8F0;
  id v9 = v5;
  int v10 = self;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __56__HDSSetupSession_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 40) _logMetricsForSoftError:v2 label:@"SecureConnection-AudioPasscode"];
    if (gLogCategory_HDSSetupSession > 60) {
      goto LABEL_10;
    }
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_10:
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 72);
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = 0;
  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_audioPlayerDidFinishPlaying_successfully___block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __60__HDSSetupSession_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;
  }
}

- (void)audioSessionInterrupted:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HDSSetupSession_audioSessionInterrupted___block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __43__HDSSetupSession_audioSessionInterrupted___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;
  }
}

- (void)forcePassCode:(id)a3
{
  id v6 = a3;
  if (IsAppleInternalBuild())
  {
    uint64_t v4 = (NSString *)[v6 copy];
    forcedPasscode = self->_forcedPasscode;
    self->_forcedPasscode = v4;
  }
}

- (void)forceCLIPassCode:(id)a3
{
  id v6 = a3;
  if (IsAppleInternalBuild())
  {
    uint64_t v4 = (NSString *)[v6 copy];
    forcedCLIPasscode = self->_forcedCLIPasscode;
    self->_forcedCLIPasscode = v4;
  }
}

- (void)cancelSoftwareUpdateNoSetup
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodSoftwareUpdateCancelled && self->_homePodSoftwareUpdateUpdateInstalled)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_homePodSoftwareUpdateCancelled = 1;
    sfSession = self->_sfSession;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke;
    v5[3] = &unk_26503FC20;
    v5[4] = self;
    [(SFSession *)sfSession sendRequestID:@"unsetup_hp_sunosetup_cancel_su" options:&unk_26F260E60 request:v3 responseHandler:v5];
  }
}

void __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(NSObject **)(v10 + 1512);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke_2;
  v15[3] = &unk_26503FA30;
  id v16 = v8;
  id v17 = v7;
  uint64_t v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke_2(uint64_t a1)
{
  void v10[2] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 1341) = 0;
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    [v3 _reportError:v4 label:@"SUBS purge error"];
  }
  else
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      LogPrintF();
    }
    if (Int64)
    {
      *(unsigned char *)(*(void *)(a1 + 48) + 1341) = 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v5 = objc_msgSend(NSNumber, "numberWithBool:", 1, v8, @"spe", @"unsetup_hp_su_applying", &unk_26F261060);
      v10[1] = v5;
      id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:2];

      [*(id *)(a1 + 48) _handlePeerEvent:v6 flags:0];
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v7 = *(void **)(a1 + 48);
      [v7 homePodSoftwareUpdateNonSetupDidComplete];
    }
  }
}

- (BOOL)isJSEnabled
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodCapableOfJS)
  {
    id v3 = [(HDSSetupSession *)self selectedHome];
    if (v3)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = [v3 siriPhraseOptions];
        LogPrintF();
      }
      uint64_t v4 = [(HDSSetupSession *)self _homePodsInSelectedHome];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        BOOL v6 = [v3 siriPhraseOptions] != 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        id v7 = [(objc_class *)getVTPreferencesClass_0() sharedPreferences];
        id v12 = 0;
        uint64_t v8 = [v7 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v12];
        id v9 = v12;

        BOOL v6 = v8 != 0;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      BOOL v6 = 0;
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 0;
  }
  return v6;
}

- (void)startAirDropSysdiagnose
{
}

- (BOOL)isCompanionSiriLanguageSupportedByHomePod
{
  return [(NSArray *)self->_siriLanguageCodes count] == 0;
}

- (BOOL)_isVoiceRecognitionSupported
{
  id v3 = [(HDSSetupSession *)self selectedSiriLanguageCode];
  multiUserSupportedLanguages = self->_multiUserSupportedLanguages;
  if (multiUserSupportedLanguages)
  {
    uint64_t v5 = multiUserSupportedLanguages;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
  }
  BOOL v6 = v5;
  if (v3) {
    BOOL v7 = [(NSArray *)v5 containsObject:v3];
  }
  else {
    BOOL v7 = 0;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v7;
}

- (void)loadMultiUserSupportedLanguages
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = objc_alloc_init(getAFSettingsConnectionClass_0());
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke;
  v4[3] = &unk_265040610;
  v4[4] = self;
  [v3 fetchSupportedMultiUserLanguageCodes:v4];
}

void __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 1512);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke_2;
    block[3] = &unk_26503F8F0;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(v7, block);
  }
}

void __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id *)(*(void *)(a1 + 40) + 528);
  objc_storeStrong(v3, v2);
}

- (BOOL)sysDropProfileInstalled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [v2 installedProfilesWithFilterFlags:3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        uint64_t v9 = v8;
        if (v8 && [v8 isEqualToString:@"com.apple.homedevicesetup.sysdrop"])
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)fetchHomePodLoggingProfile
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = "-[HDSSetupSession fetchHomePodLoggingProfile]";
    LogPrintF();
  }
  uint64_t v2 = objc_msgSend(NSURL, "URLWithString:", @"https://secure-appldnld.apple.com/HomeProfiles/HPSetup.mobileconfig", v9);
  id v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2];
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = [v5 containerURLForSecurityApplicationGroupIdentifier:@"group.homedevicesetup.diagnostics"];
    BOOL v7 = [v6 path];

    id v4 = [NSString stringWithFormat:@"%@/%@", v7, @"/Library/Caches/HPSetup.mobileconfig"];
    [v3 writeToFile:v4 atomically:1];
  }
  else
  {
    id v4 = 0;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v4;
}

- (void)removeSysDropProfile
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    long long v14 = "-[HDSSetupSession removeSysDropProfile]";
    LogPrintF();
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", v14);
  id v3 = [v2 installedProfilesWithFilterFlags:3];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    BOOL v15 = v3;
    LogPrintF();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", v15);
        int v11 = [v10 isEqualToString:@"com.apple.homedevicesetup.sysdrop"];

        if (v11)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          long long v12 = [MEMORY[0x263F53C50] sharedConnection];
          long long v13 = [v9 identifier];
          [v12 removeProfileWithIdentifier:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (BOOL)shouldDoSysDrop:(unsigned int)a3
{
  if (a3 != 2) {
    return a3 == 1;
  }
  if (self->_homePodSysDropCapableV2) {
    return self->_enablementProfileInstalled;
  }
  return 0;
}

- (BOOL)acceptedMusicTerms
{
  return self->_acceptedMusicTerms;
}

- (void)setAcceptedMusicTerms:(BOOL)a3
{
  self->_acceptedMusicTerms = a3;
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (void)setAdditionalMetrics:(id)a3
{
}

- (NSArray)availableHomes
{
  return self->_availableHomes;
}

- (void)setAvailableHomes:(id)a3
{
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (BOOL)isHPApp
{
  return self->_isHPApp;
}

- (void)setIsHPApp:(BOOL)a3
{
  self->_isHPApp = a3;
}

- (BOOL)delayForOdeonStereoPair
{
  return self->_delayForOdeonStereoPair;
}

- (void)setDelayForOdeonStereoPair:(BOOL)a3
{
  self->_delayForOdeonStereoPair = a3;
}

- (unint64_t)delayForOdeonStereoPairSeconds
{
  return self->_delayForOdeonStereoPairSeconds;
}

- (void)setDelayForOdeonStereoPairSeconds:(unint64_t)a3
{
  self->_delayForOdeonStereoPairSeconds = a3;
}

- (NSString)appleIDPassword
{
  return self->_appleIDPassword;
}

- (void)setAppleIDPassword:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)hasExistingHomePodInAccount
{
  return self->_hasExistingHomePodInAccount;
}

- (void)setHasExistingHomePodInAccount:(BOOL)a3
{
  self->_hasExistingHomePodInAccount = a3;
}

- (BOOL)hasExistingHomePod
{
  return self->_hasExistingHomePod;
}

- (void)setHasExistingHomePod:(BOOL)a3
{
  self->_hasExistingHomePod = a3;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)liveOn
{
  return self->_liveOn;
}

- (void)setLiveOn:(BOOL)a3
{
  self->_liveOn = a3;
}

- (int)homePodProductVersion
{
  return self->_homePodProductVersion;
}

- (void)setHomePodProductVersion:(int)a3
{
  self->_homePodProductVersion = a3;
}

- (int)homePodSUState
{
  return self->_homePodSUState;
}

- (void)setHomePodSUState:(int)a3
{
  self->_homePodSUState = a3;
}

- (NSError)mainError
{
  return self->_mainError;
}

- (void)setMainError:(id)a3
{
}

- (BOOL)pauseAfterPreAuth
{
  return self->_pauseAfterPreAuth;
}

- (void)setPauseAfterPreAuth:(BOOL)a3
{
  self->_pauseAfterPreAuth = a3;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_unint64_t peerFeatureFlags = a3;
}

- (NSDictionary)preAuthResponse
{
  return self->_preAuthResponse;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
}

- (unsigned)stereoCounterpartColor
{
  return self->_stereoCounterpartColor;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (BOOL)touchRemoteEnabled
{
  return self->_touchRemoteEnabled;
}

- (void)setTouchRemoteEnabled:(BOOL)a3
{
  self->_touchRemoteEnabled = a3;
}

- (BOOL)userOptedToHH2
{
  return self->_userOptedToHH2;
}

- (void)setUserOptedToHH2:(BOOL)a3
{
  self->_userOptedToHH2 = a3;
}

- (BOOL)homePodSoftwareUpdateNonSetupWasCompleted
{
  return self->_homePodSoftwareUpdateNonSetupWasCompleted;
}

- (void)setHomePodSoftwareUpdateNonSetupWasCompleted:(BOOL)a3
{
  self->_homePodSoftwareUpdateNonSetupWasCompleted = a3;
}

- (BOOL)forceSoftwareUpdateForADP
{
  return self->_forceSoftwareUpdateForADP;
}

- (void)setForceSoftwareUpdateForADP:(BOOL)a3
{
  self->_forceSoftwareUpdateForADP = a3;
}

- (BOOL)homePodIsSUNoSetup
{
  return self->_homePodIsSUNoSetup;
}

- (void)setHomePodIsSUNoSetup:(BOOL)a3
{
  self->_homePodIsSUNoSetup = a3;
}

- (BOOL)homePodCanSUNoSetup
{
  return self->_homePodCanSUNoSetup;
}

- (void)setHomePodCanSUNoSetup:(BOOL)a3
{
  self->_homePodCanSUNoSetup = a3;
}

- (BOOL)homePodSaysNeedsSUNoSetup
{
  return self->_homePodSaysNeedsSUNoSetup;
}

- (void)setHomePodSaysNeedsSUNoSetup:(BOOL)a3
{
  self->_homePodSaysNeedsSUNoSetup = a3;
}

- (double)homePodSUNoSetupEstTime
{
  return self->_homePodSUNoSetupEstTime;
}

- (void)setHomePodSUNoSetupEstTime:(double)a3
{
  self->_homePodSUNoSetupEstTime = a3;
}

- (int)homePodSUNoSetupState
{
  return self->_homePodSUNoSetupState;
}

- (void)setHomePodSUNoSetupState:(int)a3
{
  self->_homePodSUNoSetupState = a3;
}

- (SysDropSession)sysDropSession
{
  return self->_sysDropSession;
}

- (void)setSysDropSession:(id)a3
{
}

- (id)preAuthHandler
{
  return self->_preAuthHandler;
}

- (void)setPreAuthHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)promptForAppleMusicHandler
{
  return self->_promptForAppleMusicHandler;
}

- (void)setPromptForAppleMusicHandler:(id)a3
{
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
}

- (id)promptForHomeiCloudHandler
{
  return self->_promptForHomeiCloudHandler;
}

- (void)setPromptForHomeiCloudHandler:(id)a3
{
}

- (id)promptForLoggingProfileTransferAck
{
  return self->_promptForLoggingProfileTransferAck;
}

- (void)setPromptForLoggingProfileTransferAck:(id)a3
{
}

- (id)promptForiTunesSignInHandler
{
  return self->_promptForiTunesSignInHandler;
}

- (void)setPromptForiTunesSignInHandler:(id)a3
{
}

- (id)promptForLocationAlreadyEnabledHandler
{
  return self->_promptForLocationAlreadyEnabledHandler;
}

- (void)setPromptForLocationAlreadyEnabledHandler:(id)a3
{
}

- (id)promptForLocationEnableHandler
{
  return self->_promptForLocationEnableHandler;
}

- (void)setPromptForLocationEnableHandler:(id)a3
{
}

- (id)promptForPersonalRequestsHandler
{
  return self->_promptForPersonalRequestsHandler;
}

- (void)setPromptForPersonalRequestsHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
}

- (id)promptForSiriEnableHandler
{
  return self->_promptForSiriEnableHandler;
}

- (void)setPromptForSiriEnableHandler:(id)a3
{
}

- (id)promptForSiriVoiceSelectionHandler
{
  return self->_promptForSiriVoiceSelectionHandler;
}

- (void)setPromptForSiriVoiceSelectionHandler:(id)a3
{
}

- (id)promptForSetupCompletionHandler
{
  return self->_promptForSetupCompletionHandler;
}

- (void)setPromptForSetupCompletionHandler:(id)a3
{
}

- (id)promptForSoundRecognitionHandler
{
  return self->_promptForSoundRecognitionHandler;
}

- (void)setPromptForSoundRecognitionHandler:(id)a3
{
}

- (id)promptForVoiceRecognitionHandler
{
  return self->_promptForVoiceRecognitionHandler;
}

- (void)setPromptForVoiceRecognitionHandler:(id)a3
{
}

- (id)promptForAutomaticSoftwareUpdateHandler
{
  return self->_promptForAutomaticSoftwareUpdateHandler;
}

- (void)setPromptForAutomaticSoftwareUpdateHandler:(id)a3
{
}

- (id)promptForSoftwareUpdateHandler
{
  return self->_promptForSoftwareUpdateHandler;
}

- (void)setPromptForSoftwareUpdateHandler:(id)a3
{
}

- (id)promptForTermsHandler
{
  return self->_promptForTermsHandler;
}

- (void)setPromptForTermsHandler:(id)a3
{
}

- (id)promptForHomePodSoftwareUpdateNonSetupAck
{
  return self->_promptForHomePodSoftwareUpdateNonSetupAck;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupAck:(id)a3
{
}

- (id)promptForHomePodSoftwareUpdateNonSetupCompleted
{
  return self->_promptForHomePodSoftwareUpdateNonSetupCompleted;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupCompleted:(id)a3
{
}

- (id)promptForHomePodSoftwareUpdateNonSetupCancelled
{
  return self->_promptForHomePodSoftwareUpdateNonSetupCancelled;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupCancelled:(id)a3
{
}

- (id)promptForTermsAndConditionsV2Disagree
{
  return self->_promptForTermsAndConditionsV2Disagree;
}

- (void)setPromptForTermsAndConditionsV2Disagree:(id)a3
{
}

- (id)promptForCaptiveNetworkHandler
{
  return self->_promptForCaptiveNetworkHandler;
}

- (void)setPromptForCaptiveNetworkHandler:(id)a3
{
}

- (id)promptForTVAudioHandler
{
  return self->_promptForTVAudioHandler;
}

- (void)setPromptForTVAudioHandler:(id)a3
{
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
}

- (id)promptToShareSettingsHandler
{
  return self->_promptToShareSettingsHandler;
}

- (void)setPromptToShareSettingsHandler:(id)a3
{
}

- (id)promptForSiriLanguageHandler
{
  return self->_promptForSiriLanguageHandler;
}

- (void)setPromptForSiriLanguageHandler:(id)a3
{
}

- (id)promptForStereoRoleHandler
{
  return self->_promptForStereoRoleHandler;
}

- (void)setPromptForStereoRoleHandler:(id)a3
{
}

- (id)promptForSetupPSGHandler
{
  return self->_promptForSetupPSGHandler;
}

- (void)setPromptForSetupPSGHandler:(id)a3
{
}

- (id)promptForStereoMultipleHandler
{
  return self->_promptForStereoMultipleHandler;
}

- (void)setPromptForStereoMultipleHandler:(id)a3
{
}

- (id)deviceColorFoundHandler
{
  return self->_deviceColorFoundHandler;
}

- (void)setDeviceColorFoundHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceColorFoundHandler, 0);
  objc_storeStrong(&self->_promptForStereoMultipleHandler, 0);
  objc_storeStrong(&self->_promptForSetupPSGHandler, 0);
  objc_storeStrong(&self->_promptForStereoRoleHandler, 0);
  objc_storeStrong(&self->_promptForSiriLanguageHandler, 0);
  objc_storeStrong(&self->_promptToShareSettingsHandler, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForTVAudioHandler, 0);
  objc_storeStrong(&self->_promptForCaptiveNetworkHandler, 0);
  objc_storeStrong(&self->_promptForTermsAndConditionsV2Disagree, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupCancelled, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupCompleted, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupAck, 0);
  objc_storeStrong(&self->_promptForTermsHandler, 0);
  objc_storeStrong(&self->_promptForSoftwareUpdateHandler, 0);
  objc_storeStrong(&self->_promptForAutomaticSoftwareUpdateHandler, 0);
  objc_storeStrong(&self->_promptForVoiceRecognitionHandler, 0);
  objc_storeStrong(&self->_promptForSoundRecognitionHandler, 0);
  objc_storeStrong(&self->_promptForSetupCompletionHandler, 0);
  objc_storeStrong(&self->_promptForSiriVoiceSelectionHandler, 0);
  objc_storeStrong(&self->_promptForSiriEnableHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForPersonalRequestsHandler, 0);
  objc_storeStrong(&self->_promptForLocationEnableHandler, 0);
  objc_storeStrong(&self->_promptForLocationAlreadyEnabledHandler, 0);
  objc_storeStrong(&self->_promptForiTunesSignInHandler, 0);
  objc_storeStrong(&self->_promptForLoggingProfileTransferAck, 0);
  objc_storeStrong(&self->_promptForHomeiCloudHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_promptForAppleMusicHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_preAuthHandler, 0);
  objc_storeStrong((id *)&self->_sysDropSession, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_preAuthResponse, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_mainError, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleIDPassword, 0);
  objc_storeStrong((id *)&self->_availableHomes, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_wifiSecurityString, 0);
  objc_storeStrong((id *)&self->_wifiOUI, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_roomsInPSG, 0);
  objc_storeStrong((id *)&self->_psgsInSelectedRoom, 0);
  objc_storeStrong((id *)&self->_psgHelper, 0);
  objc_storeStrong((id *)&self->_softwareUpdateController, 0);
  objc_storeStrong((id *)&self->_forcedCLIPasscode, 0);
  objc_storeStrong((id *)&self->_homePodProductVersionString, 0);
  objc_storeStrong((id *)&self->_existingHomepodInSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_bonjourTestOperation, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_deviceBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_multiUserSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_forcedPasscode, 0);
  objc_storeStrong((id *)&self->_apcTimer, 0);
  objc_storeStrong((id *)&self->_apcPasscode, 0);
  objc_storeStrong((id *)&self->_apcListener, 0);
  objc_storeStrong((id *)&self->_companionSiriLanguageCode, 0);
  objc_storeStrong((id *)&self->_siriEnablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_siriEnablementConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedSiriVoice, 0);
  objc_storeStrong((id *)&self->_selectedSiriLanguageCode, 0);
  objc_storeStrong((id *)&self->_siriLanguageCodes, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_potentialTVs, 0);
  objc_storeStrong((id *)&self->_stereoCounterpartAccessory, 0);
  objc_storeStrong((id *)&self->_potentialStereoCounterparts, 0);
  objc_storeStrong((id *)&self->_appleMusicTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_iTunesUserID, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iCloudUserID, 0);
  objc_storeStrong((id *)&self->_iCloudAccount, 0);
  objc_storeStrong((id *)&self->_iCloudAccountStore, 0);
  objc_storeStrong((id *)&self->_cdpEncryptionHelper, 0);
  objc_storeStrong(&self->_audioPlayerCompletion, 0);
  objc_storeStrong((id *)&self->_audioPlayerStep, 0);
  objc_storeStrong((id *)&self->_audioPlayerStart, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
}

@end