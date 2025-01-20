@interface GAXBackboard
+ (id)sharedInstance;
- ($21446A09B9FFC90E178416D3428B6537)gaxState;
- (AXAccessQueueTimer)substantialTransitionTimer;
- (AXAssertion)disableSystemGesturesForASAMStartAssertion;
- (AXAssertion)disableSystemGesturesForActiveAssertion;
- (AXDispatchTimer)appLaunchFailureDetectionTimer;
- (AXDispatchTimer)unmanagedASAMFailsafeTimer;
- (AXPasscodeAccessor)passcodeHandle;
- (AXUIClient)userInterfaceClient;
- (BOOL)_appWithIdentifierIsBeingInstalled:(id)a3;
- (BOOL)_gaxShouldRemainEnabledByManagedConfiguration;
- (BOOL)_hasPasscode;
- (BOOL)_hasSystemPasscode;
- (BOOL)_hasTimeRestrictionExpired;
- (BOOL)_isAllowingAllTouchByOverride;
- (BOOL)_isIgnoringAllTouchByOverride;
- (BOOL)_isPasscodeStale;
- (BOOL)_isRunningInStoreDemoMode;
- (BOOL)_shouldAllowDirectInactiveToActiveTransition;
- (BOOL)allowsMotion;
- (BOOL)allowsTripleClickSheet;
- (BOOL)appIsAllowedToSelfLock:(id)a3;
- (BOOL)appLayoutIsMultiAppForIntegrityVerifier:(id)a3;
- (BOOL)appWithBundleIdentifier:(id)a3 auditToken:(id *)a4 isAuthorizedForASAMStyle:(int64_t)a5;
- (BOOL)areKeyboardsDisabledForViewServicesWithBackboardServer:(id)a3;
- (BOOL)backboardServer:(id)a3 isRectInIgnoredRegion:(CGRect)a4 rectContextId:(unsigned int)a5;
- (BOOL)checkingASAMValidity;
- (BOOL)frontmostAppIsAcceptableForSessionAppWithIntegrityVerifier:(id)a3;
- (BOOL)hasMultipleSessionAppsForIntegrityVerifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isApplicationBeingInstalled;
- (BOOL)isCheckerBoardRunningForIntegrityVerifier:(id)a3;
- (BOOL)isInWorkspace;
- (BOOL)isLocked;
- (BOOL)isLostModeActive;
- (BOOL)isPasscodeViewVisible;
- (BOOL)isPreBoardRunningForIntegrityVerifier:(id)a3;
- (BOOL)isRestrictedForAAC;
- (BOOL)isSelfLockedToAppWithIdentifier:(id)a3;
- (BOOL)isSystemAppAccessDisabledForIntegrityVerifier:(id)a3;
- (BOOL)isUnmanagedSelfLocked;
- (BOOL)processWithAuditTokenIsEntitledForInternalASAM:(id *)a3;
- (BOOL)processWithAuditTokenIsEntitledForUnmanagedASAM:(id *)a3;
- (BOOL)requestAXFeatures:(unint64_t)a3 setEnabled:(BOOL)a4 fromClientAppWithPort:(unsigned int)a5 withErrorCode:(int64_t *)a6;
- (BOOL)sessionAppGAXClientDidCheckInForIntegrityVerifier:(id)a3;
- (BOOL)sessionAppIsPreferencesForIntegrityVerifier:(id)a3;
- (BOOL)sessionAppIsPurpleBuddyForIntegrityVerifier:(id)a3;
- (BOOL)sessionAppWithIdentifier:(id)a3 isRelaunchableForIntegrityVerifier:(id)a4;
- (BOOL)shouldProceedWithVerificationForIntegrityVerifier:(id)a3;
- (BOOL)shouldStartSessionUponFrontmostAppChanged;
- (BOOL)userInterfaceClient:(id)a3 messageWithIdentifierRequiresWritingBlock:(unint64_t)a4;
- (BOOL)wantsAppSelfLockMode;
- (BOOL)wantsSingleAppMode;
- (BOOL)wantsSingleAppModeOrAppSelfLockMode;
- (BOOL)wasEverActiveInCurrentFrontmostApp;
- (GAXAccessibilityFeatureManager)axFeatureManager;
- (GAXAppManager)appManager;
- (GAXBackboard)init;
- (GAXBackboardServer)backboardServer;
- (GAXEventProcessor)eventProcessor;
- (GAXProfileManager)profileManager;
- (GAXSettings)settings;
- (GAXTimeRestrictionManager)timeRestrictionManager;
- (GAXVerifier)integrityVerifier;
- (NSArray)ignoredTouchRegions;
- (NSMutableArray)modeHistory;
- (NSMutableDictionary)clientPortsToBundleIds;
- (NSMutableSet)reasonsToBlockAllEvents;
- (NSString)description;
- (NSString)effectiveAppBundleIdentifier;
- (NSString)eventTapIdentifier;
- (double)_remainingLockoutDuration;
- (double)lastAlertDisplayedTimeInterval;
- (double)lastLockoutStartedTimeInterval;
- (id)_accessIgnoredTouchRegions;
- (id)_availabilitySpringboardParametersFromSystemAppInfoQuery:(id)a3;
- (id)_debugGAXDescription;
- (id)_errorMessageForAvailability:(unint64_t)a3;
- (id)_passcode;
- (id)_unarchivedIgnoredTouchRegionsWithDataArray:(id)a3;
- (id)asamConfigurationDictionaryForBackboardServer:(id)a3;
- (id)checkerBoardDidFinishObserverToken;
- (id)currentReasonsToBlockAllEvents;
- (id)currentSessionApp;
- (id)expectedSessionAppIdentifier;
- (id)preBoardDidFinishObserverToken;
- (id)profileManagerSessionAppID:(id)a3;
- (id)reasonsToBlockAllEventsWithEventProcessor:(id)a3;
- (id)springboardDiedObserverToken;
- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(unint64_t)a4;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (int)activeAppInterfaceOrientationWithBackboardServer:(id)a3;
- (int)activeInterfaceOrientation;
- (int64_t)backboardServer:(id)a3 restrictionStateForIdentifier:(id)a4;
- (int64_t)effectiveASAMStyle;
- (int64_t)effectiveASAMStyleForAppWithBundleIdentifier:(id)a3 auditToken:(id *)a4 desiredStyle:(int64_t)a5;
- (unint64_t)_SBServerQueryForAvailabilitySBParameters;
- (unint64_t)_availabilityForRequestType:(int)a3 springboardParameters:(id)a4;
- (unint64_t)appLaunchGeneration;
- (unint64_t)availabilityForExternalRequestWithSpringboardParameters:(id)a3;
- (unint64_t)currentGuidedAccessModeForBackboardServer;
- (unint64_t)passcodeEntryFailedCount;
- (unint64_t)relaunchAttemptsForSessionAppWithIdentifier:(id)a3 forIntegrityVerifier:(id)a4;
- (unsigned)_previousModeIgnoringWorkspace:(BOOL)a3;
- (unsigned)desiredModeAfterSuccessfulPasscodeEntry;
- (void)_applyAllowedStatesForRestrictions;
- (void)_applyChangedStatesForRestrictions;
- (void)_applyDeniedStatesForRestrictions;
- (void)_applyUnmanagedSelfLockRestrictionsForStyle:(int64_t)a3;
- (void)_clearChangedStatesForRestrictions;
- (void)_clearSavedActiveAppIDAfterRelaunchIfNeeeded;
- (void)_clearSavedTimeRestrictionsSettingsAfterRelaunchIfNeeded;
- (void)_didFinishTransitioningFromWorkspaceToApplication;
- (void)_didFinishTransitioningFromWorkspaceToSession;
- (void)_disableSOSGesture:(BOOL)a3;
- (void)_handleAssistiveTouchEnabledNotification:(id)a3;
- (void)_handleInCheckerBoardScenarioUpdated;
- (void)_handleInPreBoardScenarioUpdated;
- (void)_handleLostModeChanged;
- (void)_handleServerModeChangeRequestWithType:(int)a3;
- (void)_handleSpringboardDidGoInvalid;
- (void)_handleSubstationalTransition;
- (void)_handleTelephonyCallStatusChangedNotification:(id)a3;
- (void)_handleToggleServerModeNotification:(id)a3;
- (void)_handleUpdateGAXClientState;
- (void)_launchSessionAppWithIdentifier:(id)a3;
- (void)_notifyEffectiveAppDidChange:(id)a3;
- (void)_notifyOfGAXBackboardStateChange;
- (void)_performValidation;
- (void)_persistInterestAreaPathsForStorageFromMessage:(id)a3 forInterfaceOrientation:(int)a4;
- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3;
- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3 springBoardPID:(int)a4;
- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3 springBoardPID:(int)a4 screenLocked:(BOOL)a5;
- (void)_removeUnmanagedSelfLockRestrictions;
- (void)_resetOverrideTouchReasons;
- (void)_setPasscode:(id)a3;
- (void)_setTimeRestrictionHasExpired:(BOOL)a3;
- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5;
- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 effectiveAppName:(id)a6;
- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionsEnabled:(BOOL)a6 remainingTime:(int64_t)a7;
- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionsEnabled:(BOOL)a6 remainingTime:(int64_t)a7 effectiveAppName:(id)a8;
- (void)_showUnmanagedASAMBannerWithType:(int)a3;
- (void)_showUnmanagedASAMBeganBanner;
- (void)_showUnmanagedASAMEndedBanner;
- (void)_showUnmanagedASAMTimedOutBanner;
- (void)_transitionToMode:(unsigned int)a3;
- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4;
- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4 assumeUserInterfaceConnectionSevered:(BOOL)a5;
- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4 assumeUserInterfaceConnectionSevered:(BOOL)a5 completion:(id)a6;
- (void)_updateDisablingSystemGesturesForMode:(unsigned int)a3;
- (void)_updateIsInitializingAndWasActiveBeforeReboot:(BOOL)a3;
- (void)_updateMode:(unsigned int)a3;
- (void)_updateRestrictedState:(BOOL)a3;
- (void)_updateSessionAppForSingleAppMode;
- (void)_updateSessionAppWithIdentifier:(id)a3;
- (void)_updateSessionAppWithIdentifier:(id)a3 notifyUserInterfaceServer:(BOOL)a4 sessionAppIdentifierDidChange:(BOOL *)a5;
- (void)_verificationWillPauseForSpringBoardRelaunch;
- (void)addReasonToBlockAllEvents:(id)a3;
- (void)appDidChangeForAppSelfLockModeWithProfileManager:(id)a3;
- (void)appDidChangeForSingleAppModeWithProfileManager:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applyUnmanagedSelfLockStaticRestrictionsWithProfileManager:(id)a3;
- (void)attemptAppRelaunchForAppWithIdentifier:(id)a3 withIntegrityVerifier:(id)a4;
- (void)backboardServer:(id)a3 clientWentInvalid:(unsigned int)a4;
- (void)backboardServer:(id)a3 didFinishLaunchingApplicationWithConfiguration:(unsigned int)a4 appLaunchGeneration:(unint64_t)a5 errorMessage:(id)a6;
- (void)backboardServer:(id)a3 gaxClientAppDidBecomeActive:(id)a4 pid:(int)a5;
- (void)backboardServer:(id)a3 gaxClientDidLoad:(id)a4 pid:(int)a5 port:(unsigned int)a6;
- (void)backboardServer:(id)a3 isMakingEmergencyCall:(BOOL)a4;
- (void)backboardServer:(id)a3 passcodeDidChange:(id)a4;
- (void)backboardServer:(id)a3 sbMiniAlertIsShowing:(BOOL)a4;
- (void)backboardServer:(id)a3 tripleClickSheetDidShow:(unsigned int)a4;
- (void)backboardServer:(id)a3 voiceOverItemChooserDidShow:(unsigned int)a4;
- (void)backboardServerPresentGuidedAccessActiveBanner:(id)a3;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)deviceWasLockedWithBackboardServer:(id)a3;
- (void)deviceWasUnlockedWithBackboardServer:(id)a3;
- (void)didEnableSystemAppAccess;
- (void)didEnterAppSelfLockModeWithProfileManager:(id)a3;
- (void)didEnterSingleAppModeWithProfileManager:(id)a3;
- (void)didExitAppSelfLockModeWithProfileManager:(id)a3;
- (void)didExitSingleAppModeWithProfileManager:(id)a3;
- (void)didFinishVerificationWithIntegrityVerifier:(id)a3;
- (void)didVerifyEvent:(unint64_t)a3 withOutcome:(unint64_t)a4 withIntegrityVerifier:(id)a5;
- (void)effectiveAppDidBecomeInvalidWithAppManager:(id)a3;
- (void)effectiveAppDidChange:(id)a3 withAppManager:(id)a4;
- (void)eventProcessor:(id)a3 shouldAllowTripleClickSheet:(BOOL *)a4 tripleClickAlertIsVisible:(BOOL *)a5;
- (void)eventProcessor:(id)a3 showAlertWithType:(int)a4;
- (void)eventProcessor:(id)a3 transitionToMode:(unsigned int)a4;
- (void)eventProcessor:(id)a3 updateAssistiveTouchBootstrapPort:(unsigned int)a4;
- (void)handleGuidedAccessAutomationCommand:(id)a3 completion:(id)a4;
- (void)homeClickSwallowedInSpringBoard;
- (void)monitorForTouchID;
- (void)monitorForTouchIDWithEventProcessor:(id)a3;
- (void)pauseVerificationForProfileManager:(id)a3;
- (void)presentStandardActiveTopBanner;
- (void)purpleBuddyDidTerminateWithAppManager:(id)a3;
- (void)removeReasonToBlockAllEvents:(id)a3;
- (void)removeUnmanagedSelfLockStaticRestrictionsWithProfileManager:(id)a3;
- (void)resumeVerificationForProfileManager:(id)a3;
- (void)sessionAppIsBeingInstalledForIntegrityVerifier:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5;
- (void)setActiveInterfaceOrientation:(int)a3;
- (void)setAppLaunchFailureDetectionTimer:(id)a3;
- (void)setAppLaunchGeneration:(unint64_t)a3;
- (void)setAppManager:(id)a3;
- (void)setAxFeatureManager:(id)a3;
- (void)setBackboardServer:(id)a3;
- (void)setCheckerBoardDidFinishObserverToken:(id)a3;
- (void)setCheckingASAMValidity:(BOOL)a3;
- (void)setClientPortsToBundleIds:(id)a3;
- (void)setDesiredModeAfterSuccessfulPasscodeEntry:(unsigned int)a3;
- (void)setDisableSystemGesturesForASAMStartAssertion:(id)a3;
- (void)setDisableSystemGesturesForActiveAssertion:(id)a3;
- (void)setEffectiveASAMStyle:(int64_t)a3;
- (void)setEnabled:(BOOL)a3 fromAppWithIdentifier:(id)a4 withAuditToken:(id *)a5 configuration:(id)a6 completion:(id)a7;
- (void)setEventProcessor:(id)a3;
- (void)setEventTapIdentifier:(id)a3;
- (void)setIgnoredTouchRegions:(id)a3;
- (void)setIntegrityVerifier:(id)a3;
- (void)setIsApplicationBeingInstalled:(BOOL)a3;
- (void)setIsLostModeActive:(BOOL)a3;
- (void)setIsRestrictedForAAC:(BOOL)a3;
- (void)setLastAlertDisplayedTimeInterval:(double)a3;
- (void)setLastLockoutStartedTimeInterval:(double)a3;
- (void)setLocked:(BOOL)a3;
- (void)setModeHistory:(id)a3;
- (void)setPasscodeEntryFailedCount:(unint64_t)a3;
- (void)setPreBoardDidFinishObserverToken:(id)a3;
- (void)setProfileManager:(id)a3;
- (void)setReasonsToBlockAllEvents:(id)a3;
- (void)setShouldStartSessionUponFrontmostAppChanged:(BOOL)a3;
- (void)setSpringboardDiedObserverToken:(id)a3;
- (void)setSubstantialTransitionTimer:(id)a3;
- (void)setTimeRestrictionManager:(id)a3;
- (void)setUnmanagedASAMFailsafeTimer:(id)a3;
- (void)setUserInterfaceClient:(id)a3;
- (void)setWasEverActiveInCurrentFrontmostApp:(BOOL)a3;
- (void)systemDidRestartDueToLowBatteryWithBackboardServer:(id)a3;
- (void)timeAlarmDidOccurForTimeRestriction:(id)a3;
- (void)timeDidExpireForTimeRestriction:(id)a3;
- (void)timeRestrictionWasCancelled:(id)a3;
- (void)unlockDeviceIfSleepingWithEventProcessor:(id)a3;
- (void)unlockDeviceWithEventProcessor:(id)a3;
- (void)userConfirmUnmanagedASAMForAppWithBundleID:(id)a3 requireConfirmation:(BOOL)a4 completion:(id)a5;
- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4;
- (void)willBeginVerificationWithIntegrityVerifier:(id)a3;
@end

@implementation GAXBackboard

+ (id)sharedInstance
{
  if (qword_56110 != -1) {
    dispatch_once(&qword_56110, &stru_49410);
  }
  v2 = (void *)qword_56108;

  return v2;
}

- (GAXBackboard)init
{
  v49.receiver = self;
  v49.super_class = (Class)GAXBackboard;
  v2 = [(GAXBackboard *)&v49 init];
  if (!v2) {
    return v2;
  }
  v3 = +[NSMutableDictionary dictionary];
  [(GAXBackboard *)v2 setClientPortsToBundleIds:v3];

  id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  [v4 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  [v4 setUseWallTime:1];
  v44 = v4;
  [(GAXBackboard *)v2 setUnmanagedASAMFailsafeTimer:v4];
  id v5 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];

  [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  v43 = v5;
  [(GAXBackboard *)v2 setAppLaunchFailureDetectionTimer:v5];
  v6 = +[NSMutableSet set];
  [(GAXBackboard *)v2 setReasonsToBlockAllEvents:v6];

  dispatch_queue_t v7 = dispatch_queue_create("GAXBackboardStateAccess", 0);
  gaxStateAccessQueue = v2->_gaxStateAccessQueue;
  v2->_gaxStateAccessQueue = (OS_dispatch_queue *)v7;

  v9 = objc_alloc_init(GAXEventProcessor);
  [(GAXBackboard *)v2 setEventProcessor:v9];
  v42 = v9;
  [(GAXEventProcessor *)v9 setDelegate:v2];
  v10 = objc_alloc_init(GAXVerifier);
  [(GAXBackboard *)v2 setIntegrityVerifier:v10];
  v41 = v10;
  [(GAXVerifier *)v10 setDelegate:v2];
  [(GAXBackboard *)v2 setIsApplicationBeingInstalled:0];
  id v11 = objc_alloc((Class)AXPasscodeAccessor);
  v12 = GAXLogCommon();
  v13 = (AXPasscodeAccessor *)[v11 initWithServiceName:@"GuidedAccess" accountName:@"user" groupName:@"com.apple.springboard" logFacility:v12];
  passcodeHandle = v2->_passcodeHandle;
  v2->_passcodeHandle = v13;

  id v15 = [objc_alloc((Class)AXUIClient) initWithIdentifier:@"GAXUIClientIdentifierBackboard" serviceBundleName:@"GuidedAccess"];
  [v15 setDelegate:v2];
  v40 = v15;
  [(GAXBackboard *)v2 setUserInterfaceClient:v15];
  v16 = objc_alloc_init(GAXBackboardServer);
  [(GAXBackboard *)v2 setBackboardServer:v16];
  [(GAXBackboardServer *)v16 setBackboardDelegate:v2];
  v17 = +[GAXSettings sharedInstance];
  [(GAXBackboard *)v2 _clearSavedActiveAppIDAfterRelaunchIfNeeeded];
  [(GAXBackboard *)v2 _clearSavedTimeRestrictionsSettingsAfterRelaunchIfNeeded];
  v39 = v17;
  v18 = [v17 activeAppID];
  if (v18)
  {

LABEL_5:
    v19 = GAXLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "GAX was active before system rebooted or device wants single app mode. Disabling events immediately until init is complete", buf, 2u);
    }

    [(GAXBackboard *)v2 _updateIsInitializingAndWasActiveBeforeReboot:1];
    goto LABEL_8;
  }
  if ([(GAXBackboard *)v2 wantsSingleAppMode]) {
    goto LABEL_5;
  }
LABEL_8:
  v20 = objc_alloc_init(GAXAppManager);
  [(GAXAppManager *)v20 setDelegate:v2];
  [(GAXBackboard *)v2 setAppManager:v20];
  v21 = objc_alloc_init(GAXProfileManager);
  [(GAXBackboard *)v2 setProfileManager:v21];
  [(GAXProfileManager *)v21 setDelegate:v2];
  id v22 = objc_alloc((Class)GAXTimeRestrictionManager);
  v23 = +[AXAccessQueue mainAccessQueue];
  id v24 = [v22 initWithAssertedAccessQueue:v23];

  [(GAXBackboard *)v2 setTimeRestrictionManager:v24];
  [v24 setDelegate:v2];
  v25 = objc_alloc_init(GAXAccessibilityFeatureManager);
  [(GAXBackboard *)v2 setAxFeatureManager:v25];
  [(GAXBackboard *)v2 _prepareGuidedAccessAfterConnectingToSpringboard:0];
  v26 = GAXLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_2A85C();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12398;
  block[3] = &unk_48928;
  v27 = v2;
  v48 = v27;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v28 = +[NSNotificationCenter defaultCenter];
  uint64_t v29 = AXSystemAppServerDiedNotification;
  v30 = +[NSOperationQueue mainQueue];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_123A0;
  v45[3] = &unk_49438;
  v31 = v27;
  v46 = v31;
  v32 = [v28 addObserverForName:v29 object:0 queue:v30 usingBlock:v45];
  [(GAXBackboard *)v31 setSpringboardDiedObserverToken:v32];

  [(GAXBackboard *)v31 setAppLaunchGeneration:1];
  v33 = +[FMDFMIPManager sharedInstance];
  v31->_BOOL isLostModeActive = [v33 lostModeIsActive];

  v34 = GAXLogIntegrity();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isLostModeActive = v31->_isLostModeActive;
    *(_DWORD *)buf = 67109120;
    BOOL v51 = isLostModeActive;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Initial value for Lost Mode: %i", buf, 8u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v31, (CFNotificationCallback)sub_123A8, kLostModeChangedNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
  v37 = +[LSApplicationWorkspace defaultWorkspace];
  [v37 addObserver:v31];

  return v2;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Did get applicationsDidInstall callback", buf, 2u);
  }

  [(GAXBackboard *)self setIsApplicationBeingInstalled:0];
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12490;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setShouldStartSessionUponFrontmostAppChanged:(BOOL)a3
{
  self->_shouldStartSessionUponFrontmostAppChanged = a3;
  if (a3)
  {
    objc_initWeak(&location, self);
    id v4 = [(GAXBackboard *)self appLaunchFailureDetectionTimer];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1271C;
    v6[3] = &unk_49488;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [v4 afterDelay:v6 processBlock:30.0];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(GAXBackboard *)self appLaunchFailureDetectionTimer];
    [v5 cancel];
  }
}

- (void)addReasonToBlockAllEvents:(id)a3
{
  id v4 = a3;
  id v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Adding reason to block events: %{public}@", buf, 0xCu);
  }

  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1297C;
  v8[3] = &unk_49018;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(gaxStateAccessQueue, v8);
}

- (void)removeReasonToBlockAllEvents:(id)a3
{
  id v4 = a3;
  id v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing reason to block events: %{public}@", buf, 0xCu);
  }

  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_12AF0;
  v8[3] = &unk_49018;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(gaxStateAccessQueue, v8);
}

- (id)currentReasonsToBlockAllEvents
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_12C34;
  v10 = sub_12C44;
  id v11 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_12C4C;
  v5[3] = &unk_494B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_hasSystemPasscode
{
  return _AXDeviceHasSystemPasscode(self, a2);
}

- (void)_handleSpringboardDidGoInvalid
{
}

- (void)_verificationWillPauseForSpringBoardRelaunch
{
}

- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3
{
  +[AXSpringBoardServer server];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_12E58;
  v8[3] = &unk_49500;
  v8[4] = self;
  BOOL v10 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  uint64_t v6 = objc_retainBlock(v8);
  id v7 = v6;
  if (v5) {
    [v5 pid:v6];
  }
  else {
    ((void (*)(void *, uint64_t))v6[2])(v6, 0xFFFFFFFFLL);
  }
}

- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3 springBoardPID:(int)a4
{
  memset(v12, 0, 28);
  [(GAXBackboard *)self gaxState];
  id v7 = +[AXSpringBoardServer server];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_13100;
  v9[3] = &unk_49550;
  v9[4] = self;
  BOOL v11 = a3;
  int v10 = a4;
  v8[0] = v12[0];
  *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)v12 + 12);
  [v7 gaxBackboardStateDidChange:v8 completion:v9];
}

- (void)_prepareGuidedAccessAfterConnectingToSpringboard:(BOOL)a3 springBoardPID:(int)a4 screenLocked:(BOOL)a5
{
  BOOL v6 = a3;
  if (a4 <= 0)
  {
    uint64_t v31 = *(void *)&a4;
    _AXAssert();
  }
  uint64_t v8 = GAXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Did connect to SpringBoard, preparing Guided Access", buf, 2u);
  }

  if (v6 && [(GAXBackboard *)self _hasSystemPasscode] || AXSessionIsLoginSession())
  {
    -[GAXBackboard _transitionToMode:requireUserUnlock:](self, "_transitionToMode:requireUserUnlock:", 0, 0, v31);
    [(GAXBackboard *)self _resetOverrideTouchReasons];
LABEL_9:
    -[GAXBackboard _updateIsInitializingAndWasActiveBeforeReboot:](self, "_updateIsInitializingAndWasActiveBeforeReboot:", 0, v31);
    goto LABEL_10;
  }
  id v9 = +[GAXSettings sharedInstance];
  int v10 = [(GAXBackboard *)self profileManager];
  unsigned int v11 = [v10 configuration];

  if (v11 != 3)
  {
    if (v11 == 2)
    {
      [(GAXBackboard *)self _updateSessionAppForSingleAppMode];
      if (![(GAXBackboard *)self _hasSystemPasscode] || !a5)
      {
        id v15 = [(GAXBackboard *)self integrityVerifier];
        v16 = v15;
        if (v6) {
          uint64_t v17 = 5;
        }
        else {
          uint64_t v17 = 2;
        }
        [v15 verifyIntegrityWithEvent:v17 afterDelay:0.1];

        goto LABEL_10;
      }
    }
    else
    {
      if (v11 == 1) {
        goto LABEL_15;
      }
      v18 = GAXLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(GAXBackboard *)self profileManager];
        v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 configuration]);
        *(_DWORD *)buf = 138543362;
        *(void *)v34 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Guided Access profile configuration not supported: %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_9;
  }
LABEL_15:
  unsigned int v12 = objc_msgSend(v9, "systemDidRestartDueToLowBattery", v31);
  if (v12)
  {
    v13 = [(GAXBackboard *)self profileManager];
    unsigned int v14 = [v13 shouldAutolaunchAppsAfterLowBatteryPowerDown];
  }
  else
  {
    unsigned int v14 = 0;
  }
  if ([(GAXBackboard *)self _hasSystemPasscode])
  {
    v21 = [(GAXBackboard *)self profileManager];
    BOOL v22 = [v21 configuration] == 1;
  }
  else
  {
    BOOL v22 = 0;
  }
  v23 = GAXLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v34 = v12;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v14;
    __int16 v35 = 1024;
    BOOL v36 = v22;
    _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "Prepare after SB connect: didRestartBattery: %d, shouldRelaunchBattery: %d, IgnoreDueToSystemPasscode: %d", buf, 0x14u);
  }

  if ((v12 ^ 1 | v14) != 1 || [(GAXBackboard *)self _isRunningInStoreDemoMode] || v22)
  {
    BOOL v24 = 1;
    if (!v12) {
      goto LABEL_50;
    }
    goto LABEL_47;
  }
  v25 = [v9 activeAppID];
  id v26 = [v25 copy];

  if (!v6) {
    [v9 setActiveAppID:0];
  }
  BOOL v24 = v26 == 0;
  if (v26)
  {
    v27 = GAXLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_2A96C();
    }

    [(GAXBackboard *)self _updateSessionAppWithIdentifier:v26];
    v28 = [(GAXBackboard *)self integrityVerifier];
    uint64_t v29 = v28;
    if (v6) {
      uint64_t v30 = 4;
    }
    else {
      uint64_t v30 = 1;
    }
    [v28 verifyIntegrityWithEvent:v30 afterDelay:0.1];
  }
  if (v12)
  {
LABEL_47:
    [v9 setSystemDidRestartDueToLowBattery:0];
    if (([v9 isActiveAppSelfLocked] & 1) == 0) {
      [v9 setActiveAppID:0];
    }
    [(GAXBackboard *)self _updateIsInitializingAndWasActiveBeforeReboot:0];
  }
LABEL_50:

  if (v24) {
    goto LABEL_9;
  }
LABEL_10:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_137AC;
  block[3] = &unk_48928;
  void block[4] = self;
  if (qword_56118 != -1) {
    dispatch_once(&qword_56118, block);
  }
}

- (void)dealloc
{
  id v3 = [(GAXBackboard *)self eventProcessor];
  [v3 cleanup];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.SubstantialTransition", 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, kAXSGuidedAccessActivateNotification, 0);
  BOOL v6 = +[NSNotificationCenter defaultCenter];
  id v7 = [(GAXBackboard *)self springboardDiedObserverToken];
  [v6 removeObserver:v7];

  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  id v9 = [(GAXBackboard *)self preBoardDidFinishObserverToken];
  [v8 removeObserver:v9];

  int v10 = +[NSNotificationCenter defaultCenter];
  unsigned int v11 = [(GAXBackboard *)self checkerBoardDidFinishObserverToken];
  [v10 removeObserver:v11];

  unsigned int v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:self];

  v13 = [(GAXBackboard *)self backboardServer];
  id v21 = 0;
  unsigned __int8 v14 = [v13 stopServerWithError:&v21];
  id v15 = v21;
  if ((v14 & 1) == 0)
  {
    v16 = GAXLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2A9D8();
    }
  }
  [v13 removeAllHandlersForTarget:self];
  uint64_t v17 = [(GAXBackboard *)self userInterfaceClient];
  [v17 setDelegate:0];

  v18 = [(GAXBackboard *)self substantialTransitionTimer];
  [v18 cancel];

  v19 = +[LSApplicationWorkspace defaultWorkspace];
  [v19 removeObserver:self];

  v20.receiver = self;
  v20.super_class = (Class)GAXBackboard;
  [(GAXBackboard *)&v20 dealloc];
}

- (void)_clearSavedActiveAppIDAfterRelaunchIfNeeeded
{
  id v3 = +[GAXSettings sharedInstance];
  if ([v3 selfLockUnmanaged])
  {
    id v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "relaunched and we had been using unmanaged SAM. clearing out self lock information", buf, 2u);
    }

    [v3 setActiveAppID:0];
    [v3 setActiveAppSelfLocked:0];
    [v3 setSelfLockUnmanaged:0];
  }
  [(GAXBackboard *)self _removeUnmanagedSelfLockRestrictions];
  id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"UniqueChipID", @"BuildVersion", 0);
  CFDictionaryRef v6 = (const __CFDictionary *)MGCopyMultipleAnswers();
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    Value = (void *)CFDictionaryGetValue(v6, @"UniqueChipID");
    id v9 = Value;
    if (Value)
    {
      CFTypeID v10 = CFGetTypeID(Value);
      if (v10 == CFNumberGetTypeID()) {
        id v9 = [v9 copy];
      }
      else {
        id v9 = 0;
      }
    }
    unsigned int v12 = (void *)CFDictionaryGetValue(v7, @"BuildVersion");
    id v11 = v12;
    if (v12)
    {
      CFTypeID v13 = CFGetTypeID(v12);
      if (v13 == CFStringGetTypeID()) {
        id v11 = [v11 copy];
      }
      else {
        id v11 = 0;
      }
    }
    CFRelease(v7);
    if (v9)
    {
      unsigned __int8 v14 = [v3 ECID];
      if ([v14 isEqual:v9] && v11)
      {
        id v15 = [v3 productBuildVersion];
        unsigned __int8 v16 = [v15 isEqualToString:v11];

        if (v16) {
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
  }
  else
  {
    id v11 = 0;
    id v9 = 0;
  }
  uint64_t v17 = GAXLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Device (%{public}@, %{public}@) NOT known, not restarting app", buf, 0x16u);
  }

  [v3 setActiveAppID:0];
  [v3 setActiveAppSelfLocked:0];
  [v3 setSelfLockUnmanaged:0];
  [v3 setECID:v9];
  [v3 setProductBuildVersion:v11];
LABEL_24:
  if ([v3 isActiveAppSelfLocked])
  {
    v18 = [v3 activeAppID];
    if (![(GAXBackboard *)self appIsAllowedToSelfLock:v18])
    {
      v19 = GAXLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_2AA40();
      }

      [v3 setActiveAppSelfLocked:0];
      [v3 setSelfLockUnmanaged:0];
      [v3 setActiveAppID:0];
    }
  }
  if (![(GAXBackboard *)self wantsSingleAppModeOrAppSelfLockMode]
    && [(GAXBackboard *)self _hasSystemPasscode])
  {
    [v3 setActiveAppID:0];
  }
}

- (void)_clearSavedTimeRestrictionsSettingsAfterRelaunchIfNeeded
{
  if ([(GAXBackboard *)self wantsSingleAppModeOrAppSelfLockMode]
    || [(GAXBackboard *)self _hasSystemPasscode])
  {
    [(GAXBackboard *)self _setTimeRestrictionHasExpired:0];
  }
}

- ($21446A09B9FFC90E178416D3428B6537)gaxState
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x4010000000;
  id v11 = "";
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  int v15 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13F70;
  v7[3] = &unk_494B0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(gaxStateAccessQueue, v7);
  id v5 = v9;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var3 = *(_OWORD *)((char *)v5 + 44);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14248;
  v5[3] = &unk_494B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPasscodeViewVisible
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14310;
  v5[3] = &unk_494B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInWorkspace
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_143D4;
  v5[3] = &unk_494B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsMotion
{
  v2 = [(GAXBackboard *)self profileManager];
  unsigned __int8 v3 = [v2 shouldAllowMotion];

  return v3;
}

- (BOOL)allowsTripleClickSheet
{
  if ([(GAXBackboard *)self _hasTimeRestrictionExpired]) {
    return 0;
  }
  id v4 = [(GAXBackboard *)self profileManager];
  unsigned int v5 = [v4 isSingleAppMode];

  if (v5)
  {
    uint64_t v6 = [(GAXBackboard *)self axFeatureManager];
    unsigned __int8 v7 = [v6 hasAccessibilityTripleClickOptions];
  }
  else
  {
    uint64_t v8 = [(GAXBackboard *)self profileManager];
    unsigned int v9 = [v8 isAppSelfLockMode];

    if (v9)
    {
      uint64_t v6 = [(GAXBackboard *)self profileManager];
      unsigned __int8 v7 = [v6 shouldAllowAccessibilityShortcut];
    }
    else
    {
      uint64_t v6 = +[AXSettings sharedInstance];
      unsigned __int8 v7 = [v6 guidedAccessAXFeaturesEnabled];
    }
  }
  BOOL v3 = v7;

  return v3;
}

- (NSString)effectiveAppBundleIdentifier
{
  v2 = [(GAXBackboard *)self appManager];
  BOOL v3 = [v2 effectiveAppBundleIdentifier];

  return (NSString *)v3;
}

- (void)_updateMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_146C0;
  block[3] = &unk_49578;
  void block[4] = self;
  void block[5] = &v11;
  unsigned int v10 = a3;
  dispatch_sync(gaxStateAccessQueue, block);
  uint64_t v6 = [(GAXBackboard *)self modeHistory];
  if (!v6)
  {
    uint64_t v6 = objc_opt_new();
    [(GAXBackboard *)self setModeHistory:v6];
  }
  unsigned __int8 v7 = +[NSNumber numberWithUnsignedInt:v3];
  [v6 insertObject:v7 atIndex:0];

  while ((unint64_t)[v6 count] >= 6)
    [v6 removeLastObject];
  if (v3 == 2 || *((_DWORD *)v12 + 6) == 2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, AXGuidedAccessActiveStatusDidChangeBroadcastNotification, 0, 0, 1u);
  }

  _Block_object_dispose(&v11, 8);
}

- (void)_updateDisablingSystemGesturesForMode:(unsigned int)a3
{
  if (a3)
  {
    id v4 = [(GAXBackboard *)self disableSystemGesturesForActiveAssertion];

    if (!v4)
    {
      id v5 = +[AXAssertion assertionWithType:AXAssertionTypeDisableSystemGestures identifier:@"GAX-BB"];
      [(GAXBackboard *)self setDisableSystemGesturesForActiveAssertion:v5];
    }
  }
  else
  {
    [(GAXBackboard *)self setDisableSystemGesturesForActiveAssertion:0];
  }
}

- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionsEnabled:(BOOL)a6 remainingTime:(int64_t)a7 effectiveAppName:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a8;
  +[NSDate timeIntervalSinceReferenceDate];
  double v16 = v15;
  [(GAXBackboard *)self lastAlertDisplayedTimeInterval];
  if (v16 - v17 >= 1.0)
  {
    [(GAXBackboard *)self setLastAlertDisplayedTimeInterval:v16];
    v25[0] = @"alert text type";
    v18 = +[NSNumber numberWithUnsignedInteger:a3];
    v26[0] = v18;
    v25[1] = @"alert is banner";
    v19 = +[NSNumber numberWithBool:v11];
    v26[1] = v19;
    v25[2] = @"alert is urgent";
    objc_super v20 = +[NSNumber numberWithBool:v10];
    v26[2] = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    id v22 = [v21 mutableCopy];

    if (a7 >= 1 && v9)
    {
      id v23 = +[NSNumber numberWithInteger:a7];
      [v22 setObject:v23 forKeyedSubscript:@"alert time restriction remaining time"];
    }
    if (v14) {
      [v22 setObject:v14 forKeyedSubscript:@"application name"];
    }
    BOOL v24 = [(GAXBackboard *)self userInterfaceClient];
    [v24 sendAsynchronousMessage:v22 withIdentifier:5 targetAccessQueue:0 completion:0];
  }
}

- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionsEnabled:(BOOL)a6 remainingTime:(int64_t)a7
{
}

- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5 effectiveAppName:(id)a6
{
}

- (void)_showAlertWithTextType:(int)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5
{
}

- (void)_notifyOfGAXBackboardStateChange
{
  memset(&v7[40], 0, 28);
  [(GAXBackboard *)self gaxState];
  uint64_t v3 = +[AXSpringBoardServer server];
  *(_OWORD *)unsigned __int8 v7 = *(_OWORD *)&v7[40];
  *(_OWORD *)&v7[12] = *(_OWORD *)&v7[52];
  [v3 gaxBackboardStateDidChange:v7];

  id v4 = [(GAXBackboard *)self userInterfaceClient];
  CFStringRef v8 = @"gax backboard state";
  *(_OWORD *)unsigned __int8 v7 = *(_OWORD *)&v7[40];
  *(_OWORD *)&v7[12] = *(_OWORD *)&v7[52];
  id v5 = serializeGAXBackboardState((uint64_t)v7);
  BOOL v9 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v4 sendAsynchronousMessage:v6 withIdentifier:4 targetAccessQueue:0 completion:0];
}

- (void)_notifyEffectiveAppDidChange:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSpringBoardServer server];
  [v4 gaxFrontmostAppDidCheckIn:v3];
}

- (void)_handleUpdateGAXClientState
{
  id v3 = [(GAXBackboard *)self appManager];
  if ([v3 sessionAppGAXClientDidCheckIn])
  {
    id v4 = [(GAXBackboard *)self profileManager];
    uint64_t v10 = 0;
    BOOL v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    gaxStateAccessQueue = self->_gaxStateAccessQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_14CCC;
    v9[3] = &unk_494B0;
    v9[4] = self;
    void v9[5] = &v10;
    dispatch_sync(gaxStateAccessQueue, v9);
    objc_msgSend(v3, "settingsDidChangeWithServerMode:allowsMotion:allowsKeyboardTextInput:", *((unsigned int *)v11 + 6), objc_msgSend(v4, "shouldAllowMotion"), objc_msgSend(v4, "shouldAllowKeyboardTextInput"));
    uint64_t v6 = [(GAXBackboard *)self profileManager];
    if ([v6 isSingleAppMode])
    {
    }
    else
    {
      unsigned __int8 v7 = [(GAXBackboard *)self profileManager];
      unsigned int v8 = [v7 isAppSelfLockMode];

      if (!v8)
      {
LABEL_6:
        _Block_object_dispose(&v10, 8);

        goto LABEL_7;
      }
    }
    [(GAXBackboard *)self _applyDeniedStatesForRestrictions];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)backboardServer:(id)a3 clientWentInvalid:(unsigned int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_14D58;
  v4[3] = &unk_495A0;
  v4[4] = self;
  unsigned int v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)backboardServer:(id)a3 passcodeDidChange:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14FB0;
  v5[3] = &unk_49018;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)backboardServer:(id)a3 gaxClientDidLoad:(id)a4 pid:(int)a5 port:(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  uint64_t v10 = GAXLogAppLaunching();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = +[NSNumber numberWithInt:v7];
    *(_DWORD *)buf = 138543874;
    id v18 = v9;
    __int16 v19 = 2114;
    objc_super v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = a6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Was notified gax client did load: %{public}@. pid:%{public}@ send right name: %llx", buf, 0x20u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15128;
  block[3] = &unk_48FC8;
  void block[4] = self;
  id v14 = v9;
  unsigned int v15 = a6;
  int v16 = v7;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)backboardServer:(id)a3 gaxClientAppDidBecomeActive:(id)a4 pid:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  unsigned int v8 = GAXLogAppLaunching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithInt:v5];
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    double v17 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Was notified that client did become active. ID:%{public}@ PID:%{public}@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15328;
  block[3] = &unk_495C8;
  void block[4] = self;
  id v12 = v7;
  int v13 = v5;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deviceWasLockedWithBackboardServer:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15768;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deviceWasUnlockedWithBackboardServer:(id)a3
{
  if ([(GAXBackboard *)self wantsSingleAppMode])
  {
    id v4 = [(GAXBackboard *)self appManager];
    uint64_t v5 = [(GAXBackboard *)self profileManager];
    id v6 = [v5 singleAppModeAppID];
    unsigned __int8 v7 = [v4 appWithIdentifierIsASessionApp:v6];

    if ((v7 & 1) == 0) {
      [(GAXBackboard *)self _updateSessionAppForSingleAppMode];
    }
  }
  if ([(GAXBackboard *)self wantsSingleAppModeOrAppSelfLockMode])
  {
    unsigned int v8 = [(GAXBackboard *)self appManager];
    unsigned __int8 v9 = [v8 effectiveAppIsPurpleBuddy];

    if ((v9 & 1) == 0)
    {
      unsigned __int8 v10 = [(GAXBackboard *)self isApplicationBeingInstalled];
      BOOL v11 = GAXLogCommon();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Device was unlocked, and system wants Single App Mode or App self-lock mode. App installation is in progress", buf, 2u);
        }
      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Device was unlocked, and system wants Single App Mode or App self-lock mode. Turning on GAX event tap until GAX is verified", buf, 2u);
        }

        gaxStateAccessQueue = self->_gaxStateAccessQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_15984;
        block[3] = &unk_48928;
        void block[4] = self;
        dispatch_sync(gaxStateAccessQueue, block);
        [(GAXBackboard *)self _updateIsInitializingAndWasActiveBeforeReboot:1];
      }
    }
  }
  id v14 = [(GAXBackboard *)self integrityVerifier];
  [v14 verifyIntegrityWithEvent:6 afterDelay:0.7];
}

- (void)backboardServer:(id)a3 tripleClickSheetDidShow:(unsigned int)a4
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15A10;
  v5[3] = &unk_495A0;
  v5[4] = self;
  unsigned int v6 = a4;
  dispatch_sync(gaxStateAccessQueue, v5);
}

- (void)backboardServer:(id)a3 voiceOverItemChooserDidShow:(unsigned int)a4
{
  unsigned int v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = a4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "VoiceOver item chooser shown: %d", buf, 8u);
  }

  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _OWORD v8[2] = sub_15B28;
  v8[3] = &unk_495A0;
  v8[4] = self;
  unsigned int v9 = a4;
  dispatch_sync(gaxStateAccessQueue, v8);
}

- (void)backboardServer:(id)a3 sbMiniAlertIsShowing:(BOOL)a4
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15BB0;
  v5[3] = &unk_494D8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(gaxStateAccessQueue, v5);
}

- (void)backboardServer:(id)a3 isMakingEmergencyCall:(BOOL)a4
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15C44;
  v5[3] = &unk_494D8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(gaxStateAccessQueue, v5);
}

- (void)backboardServerPresentGuidedAccessActiveBanner:(id)a3
{
  [(GAXBackboard *)self gaxState];
  if ((v4 & 0x10) != 0) {
    [(GAXBackboard *)self presentStandardActiveTopBanner];
  }
}

- (void)backboardServer:(id)a3 didFinishLaunchingApplicationWithConfiguration:(unsigned int)a4 appLaunchGeneration:(unint64_t)a5 errorMessage:(id)a6
{
  id v8 = a6;
  if ([(GAXBackboard *)self appLaunchGeneration] <= a5)
  {
    id v9 = v8;
    AXPerformBlockOnMainThread();
  }
  else
  {
    AXPerformBlockOnMainThread();
  }
}

- (void)systemDidRestartDueToLowBatteryWithBackboardServer:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15F60;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)activeAppInterfaceOrientationWithBackboardServer:(id)a3
{
  id v3 = [(GAXBackboard *)self settings];
  int v4 = [v3 activeAppOrientation];

  return v4;
}

- (int64_t)backboardServer:(id)a3 restrictionStateForIdentifier:(id)a4
{
  id v5 = a4;
  if ([(GAXBackboard *)self isActive])
  {
    BOOL v6 = [(GAXBackboard *)self profileManager];
    id v7 = [v6 stateForRestrictionWithIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (BOOL)backboardServer:(id)a3 isRectInIgnoredRegion:(CGRect)a4 rectContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CFArrayRef v10 = [(GAXBackboard *)self _accessIgnoredTouchRegions];
  if (!v10) {
    goto LABEL_9;
  }
  unsigned int v11 = +[CADisplay mainDisplay];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat r2 = v18;

  CFIndex Count = CFArrayGetCount(v10);
  objc_super v20 = +[AXBackBoardServer server];
  objc_msgSend(v20, "convertFrame:fromContextId:", v5, x, y, width, height);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  double v28 = v27;

  v43.origin.double x = v22;
  v43.origin.double y = v24;
  v43.size.double width = v26;
  v43.size.double height = v28;
  v45.origin.double x = v13;
  v45.origin.double y = v15;
  v45.size.double width = v17;
  v45.size.double height = r2;
  CGRect v44 = CGRectIntersection(v43, v45);
  if (Count >= 1)
  {
    CGFloat v29 = v44.origin.x;
    CGFloat v30 = v44.origin.y;
    CFIndex v31 = 0;
    double v32 = v44.origin.y + v44.size.height;
    double v33 = v44.origin.x + v44.size.width;
    double v34 = v28 + v44.origin.y;
    BOOL v35 = 1;
    while (1)
    {
      ValueAtIndedouble x = (const CGPath *)CFArrayGetValueAtIndex(v10, v31);
      v39.double x = v29;
      v39.double y = v30;
      if (CGPathContainsPoint(ValueAtIndex, 0, v39, 1))
      {
        v40.double x = v29;
        v40.double y = v32;
        if (CGPathContainsPoint(ValueAtIndex, 0, v40, 1))
        {
          v41.double x = v33;
          v41.double y = v30;
          if (CGPathContainsPoint(ValueAtIndex, 0, v41, 1))
          {
            v42.double x = v33;
            v42.double y = v34;
            if (CGPathContainsPoint(ValueAtIndex, 0, v42, 1)) {
              break;
            }
          }
        }
      }
      if (Count == ++v31) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v35 = 0;
  }

  return v35;
}

- (BOOL)areKeyboardsDisabledForViewServicesWithBackboardServer:(id)a3
{
  return 0;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  double v12 = v11;
  switch(a5)
  {
    case 2uLL:
      CGFloat v13 = [v11 objectForKey:@"active interface orientation"];
      -[GAXBackboard setActiveInterfaceOrientation:](self, "setActiveInterfaceOrientation:", [v13 unsignedIntegerValue]);
      goto LABEL_50;
    case 0x10uLL:
      CGFloat v15 = [v11 objectForKey:@"passcode is visible"];
      unsigned int v16 = [v15 BOOLValue];

      CGFloat v17 = GAXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v16;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Passcode view visibility did change: %i", buf, 8u);
      }

      gaxStateAccessQueue = self->_gaxStateAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_16F04;
      block[3] = &unk_49618;
      void block[4] = self;
      char v79 = v16;
      id v78 = v12;
      dispatch_sync(gaxStateAccessQueue, block);

      goto LABEL_51;
    case 0x11uLL:
      __int16 v19 = [v11 objectForKey:@"passcode view dismissal reason"];
      objc_super v20 = (char *)[v19 integerValue];

      double v21 = GAXLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v93 = v20;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Passcode view was dismissed: %ld", buf, 0xCu);
      }

      switch((unint64_t)v20)
      {
        case 1uLL:
        case 3uLL:
          +[NSDate timeIntervalSinceReferenceDate];
          [(GAXBackboard *)self setLastLockoutStartedTimeInterval:"setLastLockoutStartedTimeInterval:"];
          if (v20 == (unsigned char *)&dword_0 + 1)
          {
            [(GAXBackboard *)self setPasscodeEntryFailedCount:(char *)[(GAXBackboard *)self passcodeEntryFailedCount] + 1];
            CFStringRef v90 = @"alert remaining lockout duration";
            [(GAXBackboard *)self _remainingLockoutDuration];
            CGFloat v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            v91 = v22;
            double v23 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
          }
          else
          {
            double v23 = 0;
          }
          v62 = [(GAXBackboard *)self appManager];
          unsigned int v63 = [v62 effectiveAppWasPlayingMedia];

          if (!v63) {
            goto LABEL_52;
          }
          double v25 = +[AXSpringBoardServer server];
          v64 = [(GAXBackboard *)self appManager];
          v65 = [v64 effectiveAppBundleIdentifier];
          [v25 resumeMediaForApp:v65];

          goto LABEL_46;
        case 2uLL:
          v59 = +[AXSpringBoardServer server];
          CGFloat v13 = v59;
          v71 = _NSConcreteStackBlock;
          uint64_t v72 = 3221225472;
          v73 = sub_1703C;
          v74 = &unk_49640;
          v75 = self;
          v60 = &v71;
          goto LABEL_49;
        case 4uLL:
          v59 = +[AXSpringBoardServer server];
          CGFloat v13 = v59;
          v66 = _NSConcreteStackBlock;
          uint64_t v67 = 3221225472;
          v68 = sub_17148;
          v69 = &unk_49640;
          v70 = self;
          v60 = &v66;
LABEL_49:
          objc_msgSend(v59, "isSystemAppFrontmost:", v60, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75);
          goto LABEL_50;
        case 5uLL:
          double v14 = GAXLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Notified of passcode view controller programmatic dismissal. Didn't expect to be notified of this, as we initiated it.", buf, 2u);
          }
          goto LABEL_26;
        default:
          goto LABEL_51;
      }
    case 0x12uLL:
      CGFloat v24 = GAXLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Passcode was set", buf, 2u);
      }

      CGFloat v13 = [v12 objectForKey:@"passcode"];
      [(GAXBackboard *)self _setPasscode:v13];
      goto LABEL_50;
    case 0x13uLL:
      double v25 = [v11 objectForKey:@"passcode"];
      if (v25)
      {
        CGFloat v26 = [(GAXBackboard *)self _passcode];
        id v27 = [v26 isEqualToString:v25];
      }
      else
      {
        id v27 = 0;
      }
      CFStringRef v88 = @"passcode is correct";
      v57 = +[NSNumber numberWithBool:v27];
      v89 = v57;
      double v23 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];

      v58 = GAXLogCommon();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v27;
        _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "Passcode is correct: %i", buf, 8u);
      }

LABEL_46:
      break;
    case 0x14uLL:
      double v28 = [(GAXBackboard *)self _passcode];
      CFStringRef v86 = @"passcode length";
      CGFloat v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 length]);
      v87 = v29;
      double v23 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];

      goto LABEL_41;
    case 0x16uLL:
      CGFloat v30 = [(GAXBackboard *)self appManager];
      CFIndex v31 = [v12 objectForKey:@"finger path"];
      double v28 = [v30 effectiveAppContainedViewsForArchivedFingerPath:v31];

      if (!v28) {
        goto LABEL_40;
      }
      CFStringRef v84 = @"container views";
      v85 = v28;
      double v32 = &v85;
      double v33 = &v84;
      goto LABEL_39;
    case 0x17uLL:
      double v34 = [v11 objectForKey:@"server mode"];
      id v35 = [v34 unsignedIntegerValue];

      BOOL v36 = GAXLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v35;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Transition to mode: %i", buf, 8u);
      }

      [(GAXBackboard *)self _transitionToMode:v35];
      goto LABEL_51;
    case 0x18uLL:
      v37 = [v11 objectForKey:@"system feature is enabled"];
      id v38 = [v37 BOOLValue];

      CGFloat v13 = [v12 objectForKey:@"system feature identifier"];
      CGPoint v39 = [(GAXBackboard *)self profileManager];
      CGPoint v40 = +[NSNumber numberWithBool:v38];
      [v39 updateProperty:v13 withValue:v40];

      [(GAXBackboard *)self _notifyOfGAXBackboardStateChange];
      goto LABEL_50;
    case 0x19uLL:
      CGPoint v41 = [(GAXBackboard *)self profileManager];
      CGPoint v42 = [v12 objectForKey:@"time restriction duration"];
      [v41 updateProperty:@"GAXProfileAppTimeoutDuration" withValue:v42];

      CGRect v43 = [(GAXBackboard *)self profileManager];
      CGRect v44 = [v12 objectForKey:@"time restrictions enabled"];
      [v43 updateProperty:@"GAXProfileAppTimeoutEnabled" withValue:v44];

      double v14 = [(GAXBackboard *)self timeRestrictionManager];
      [v14 cancel];
      goto LABEL_26;
    case 0x1AuLL:
      CGRect v45 = [v11 objectForKey:@"interface orientation"];
      id v46 = [v45 unsignedIntegerValue];

      v47 = [(GAXBackboard *)self profileManager];
      double v28 = [v47 ignoredTouchRegionsForOrientation:v46];

      if (v28)
      {
        CFStringRef v82 = @"interest area paths for storage";
        v83 = v28;
        double v32 = &v83;
        double v33 = &v82;
LABEL_39:
        double v23 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v33 count:1];
      }
      else
      {
LABEL_40:
        double v23 = 0;
      }
LABEL_41:

      break;
    case 0x1BuLL:
      v48 = +[AXSpringBoardServer server];
      -[GAXBackboard setActiveInterfaceOrientation:](self, "setActiveInterfaceOrientation:", [v48 activeInterfaceOrientation]);

      [(GAXBackboard *)self _persistInterestAreaPathsForStorageFromMessage:v12 forInterfaceOrientation:[(GAXBackboard *)self activeInterfaceOrientation]];
      goto LABEL_51;
    case 0x1CuLL:
      CGFloat v13 = [v11 objectForKey:@"interest area paths in screen coordinates"];
      objc_super v49 = [(GAXBackboard *)self _unarchivedIgnoredTouchRegionsWithDataArray:v13];
      [(GAXBackboard *)self setIgnoredTouchRegions:v49];

      goto LABEL_50;
    case 0x1FuLL:
      CGFloat v13 = +[AXSpringBoardServer server];
      v50 = [(GAXBackboard *)self appManager];
      BOOL v51 = [v50 effectiveAppBundleIdentifier];
      v52 = [v12 objectForKey:@"hosted application scale factor"];
      v53 = [v12 objectForKey:@"hosted application center"];
      v54 = [v12 objectForKey:@"animation duration"];
      [v13 gaxUpdateStateOfHostedApplicationWithIdentifier:v51 scaleFactorNumber:v52 centerStringRepresentation:v53 animationDurationNumber:v54];

LABEL_50:
      goto LABEL_51;
    case 0x21uLL:
      v55 = GAXLogCommon();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "Touch ID attempt was successful", buf, 2u);
      }

      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_16F80;
      v76[3] = &unk_48928;
      v76[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v76);
      goto LABEL_51;
    case 0x22uLL:
      v56 = GAXLogCommon();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Touch ID attempt was not successful", buf, 2u);
      }

      [(GAXBackboard *)self _showAlertWithTextType:4 asBanner:1 isUrgent:0];
      goto LABEL_51;
    case 0x27uLL:
      CFStringRef v80 = @"has valid passcode";
      double v28 = +[NSNumber numberWithBool:[(GAXBackboard *)self _shouldAllowDirectInactiveToActiveTransition]];
      v81 = v28;
      double v32 = &v81;
      double v33 = &v80;
      goto LABEL_39;
    default:
      double v14 = GAXLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_2AC48((uint64_t)v12, a5);
      }
LABEL_26:

LABEL_51:
      double v23 = 0;
      break;
  }
LABEL_52:
  if (a6) {
    *a6 = 0;
  }

  return v23;
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(unint64_t)a4
{
  BOOL v6 = 0;
  if (a4 <= 0x27 && ((1 << a4) & 0x809FDF0004) != 0)
  {
    BOOL v6 = +[AXAccessQueue mainAccessQueue];
  }
  return v6;
}

- (BOOL)userInterfaceClient:(id)a3 messageWithIdentifierRequiresWritingBlock:(unint64_t)a4
{
  return 1;
}

- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4
{
  memset(&v9[2], 0, 28);
  id v5 = a4;
  [(GAXBackboard *)self gaxState];
  v9[0] = v9[2];
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)&v9[2] + 12);
  BOOL v6 = serializeGAXBackboardState((uint64_t)v9);
  [v5 setValue:v6 forKey:@"gax backboard state"];

  id v7 = [(GAXBackboard *)self appManager];
  id v8 = [v7 sessionAppBundleIdentifiers];
  [v5 setValue:v8 forKey:@"session application identifiers"];
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17348;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginVerificationWithIntegrityVerifier:(id)a3
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17790;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_sync(gaxStateAccessQueue, block);
}

- (void)didVerifyEvent:(unint64_t)a3 withOutcome:(unint64_t)a4 withIntegrityVerifier:(id)a5
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v20 = 0;
  uint64_t v19 = 0;
  [(GAXBackboard *)self gaxState];
  if (a4 == 26)
  {
    [(GAXBackboard *)self _verificationWillPauseForSpringBoardRelaunch];
  }
  else
  {
    if (a4 != 6)
    {
      if (a4 != 3) {
        return;
      }
      if ((HIDWORD(v19) - 1) <= 2)
      {
        id v7 = GAXLogIntegrity();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_2ACCC();
        }

        id v8 = [(GAXBackboard *)self appManager];
        unsigned int v9 = [v8 effectiveAppIsAcceptableForSessionApps];

        if (v9)
        {
          id v10 = GAXLogAppLaunching();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Frontmost app has already checked in. Going active now", buf, 2u);
          }

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_17A40;
          block[3] = &unk_48928;
          void block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else
        {
          id v11 = [(GAXBackboard *)self appManager];
          double v12 = [v11 sessionAppBundleIdentifiers];

          if (v12)
          {
            CGFloat v13 = GAXLogIntegrity();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Will wait for app to check in as frontmost and then go active.", buf, 2u);
            }

            [(GAXBackboard *)self setShouldStartSessionUponFrontmostAppChanged:1];
          }
        }
      }
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_17A84;
    v14[3] = &unk_48928;
    v14[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
}

- (void)didFinishVerificationWithIntegrityVerifier:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  int v45 = 0;
  uint64_t v44 = 0;
  [(GAXBackboard *)self gaxState];
  int v5 = HIDWORD(v44);
  char v41 = 0;
  objc_msgSend(v4, "outcome:isError:isIndeterminate:", objc_msgSend(v4, "mostRecentOutcome"), &v41, 0);
  if (!v41)
  {
    BOOL v6 = [(GAXBackboard *)self appManager];
    [v6 scheduleResetLaunchAttempts];
  }
  switch((unint64_t)[v4 mostRecentOutcome])
  {
    case 0uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      id v11 = objc_msgSend(v4, "displayStringForOutcome:", objc_msgSend(v4, "mostRecentOutcome"));
      v37 = v11;
      _AXAssert();
      goto LABEL_46;
    case 2uLL:
    case 5uLL:
      int v16 = HIDWORD(v44);
      if (HIDWORD(v44) >= 2)
      {
        uint64_t v17 = +[AXSpringBoardServer server];
        [v17 dismissAppSwitcher];

        uint64_t v18 = +[AXSpringBoardServer server];
        [v18 hideNotificationCenter];

        uint64_t v19 = +[AXSpringBoardServer server];
        [v19 showControlCenter:0];

        int v16 = HIDWORD(v44);
      }
      if (v16 == 1 || v42) {
        goto LABEL_52;
      }
      int v20 = GAXLogIntegrity();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Profile is managed or app self lock. GAX currenlty disabled. Making gax active now", buf, 2u);
      }

      [(GAXBackboard *)self _transitionToMode:2];
      double v21 = self;
      uint64_t v22 = 0;
      goto LABEL_51;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      id v7 = GAXLogIntegrity();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v5 & 0xFFFFFFFD) == 1)
      {
        if (v8)
        {
          unsigned int v9 = objc_msgSend(v4, "displayStringForOutcome:", objc_msgSend(v4, "mostRecentOutcome"));
          *(_DWORD *)buf = 138543362;
          v47 = v9;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Config is user or app self lock. Disabling GAX just to be sure. Verifier failed with: %{public}@", buf, 0xCu);
        }
        id v10 = +[AXSpringBoardServer server];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_18260;
        v39[3] = &unk_49668;
        v39[4] = self;
        int v40 = v5;
        [v10 screenLockStatus:v39 passcodeStatusRequired:1];

        [(GAXBackboard *)self setDesiredModeAfterSuccessfulPasscodeEntry:0];
        goto LABEL_52;
      }
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Config is managed. Could not bring gax app back to frontmost.", buf, 2u);
      }

      double v12 = [(GAXBackboard *)self profileManager];
      unsigned int v13 = [v12 isUserMode];

      if (v13)
      {
        double v14 = GAXLogIntegrity();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          CGFloat v15 = "Back in user mode. Configurator likely removed the single app mode app. Disabling GAX now";
LABEL_24:
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
      double v23 = [(GAXBackboard *)self appManager];
      unsigned int v24 = [v23 effectiveAppIsPurpleBuddy];

      double v14 = GAXLogIntegrity();
      BOOL v25 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v25)
        {
          *(_WORD *)buf = 0;
          CGFloat v15 = "Purple buddy is frontmost. Let it finish";
          goto LABEL_24;
        }
LABEL_25:
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        goto LABEL_50;
      }
      if (v25)
      {
        id v35 = objc_msgSend(v4, "displayStringForOutcome:", objc_msgSend(v4, "mostRecentOutcome"));
        *(_DWORD *)buf = 138543362;
        v47 = v35;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Enabling GAX now and restricting device. %{public}@", buf, 0xCu);
      }
      uint64_t v27 = 1;
      uint64_t v26 = 2;
LABEL_50:

      [(GAXBackboard *)self _transitionToMode:v26];
      double v21 = self;
      uint64_t v22 = v27;
LABEL_51:
      [(GAXBackboard *)v21 _updateRestrictedState:v22];
LABEL_52:
      -[GAXBackboard _updateIsInitializingAndWasActiveBeforeReboot:](self, "_updateIsInitializingAndWasActiveBeforeReboot:", 0, v37);
      gaxStateAccessQueue = self->_gaxStateAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_18284;
      block[3] = &unk_48928;
      void block[4] = self;
      dispatch_sync(gaxStateAccessQueue, block);

      return;
    case 0xDuLL:
      double v28 = [(GAXBackboard *)self appManager];
      [v28 monitorForPurpleBuddyDeath];

      [(GAXBackboard *)self _transitionToMode:0];
      goto LABEL_52;
    case 0xEuLL:
      id v11 = GAXLogIntegrity();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      CGFloat v29 = "Waiting until system app access is enabled.";
      goto LABEL_45;
    case 0xFuLL:
      id v11 = GAXLogIntegrity();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      CGFloat v29 = "Waiting until PreBoard finishes.";
      goto LABEL_45;
    case 0x10uLL:
      id v11 = GAXLogIntegrity();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      CGFloat v29 = "Waiting until CheckerBoard finishes.";
      goto LABEL_45;
    case 0x14uLL:
      CGFloat v30 = GAXLogIntegrity();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Disabling GAX until Lost Mode ends.", buf, 2u);
      }

      if (v5 == 3 && v42 == 2)
      {
        CFIndex v31 = +[GAXSettings sharedInstance];
        double v32 = [v31 activeAppID];

        double v33 = +[GAXSettings sharedInstance];
        [v33 setSavedASAMAppIdForLostMode:v32];

        double v34 = GAXLogIntegrity();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v32;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Saving ASAM app for later: %@", buf, 0xCu);
        }
      }
      [(GAXBackboard *)self _transitionToMode:0 requireUserUnlock:0];
      goto LABEL_52;
    case 0x15uLL:
      id v11 = GAXLogIntegrity();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      CGFloat v29 = "Waiting until SpringBoard server is ready.";
      goto LABEL_45;
    case 0x16uLL:
      id v11 = GAXLogIntegrity();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      CGFloat v29 = "Waiting until SpringBoard server is available.";
LABEL_45:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
LABEL_46:

      goto LABEL_52;
    default:
      goto LABEL_52;
  }
}

- (void)_launchSessionAppWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = GAXLogAppLaunching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Guided Access wants to launch application %@", buf, 0xCu);
  }

  if ([(GAXBackboard *)self wantsSingleAppMode])
  {
    BOOL v6 = [(GAXBackboard *)self appManager];
    id v7 = [(GAXBackboard *)self profileManager];
    BOOL v8 = [v7 singleAppModeAppID];
    if ([v6 appWithIdentifierIsASessionApp:v8])
    {
      unsigned int v9 = [(GAXBackboard *)self appManager];
      id v10 = [v9 sessionAppBundleIdentifiers];

      if (v10) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v11 = GAXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2AD00(self, v11);
    }

    [(GAXBackboard *)self _updateSessionAppForSingleAppMode];
    double v12 = GAXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unsigned int v13 = [(GAXBackboard *)self appManager];
      double v14 = [v13 sessionAppBundleIdentifiers];
      *(_DWORD *)buf = 138543362;
      id v23 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "After attempted recovery, session app bundle ids are %{public}@", buf, 0xCu);
    }
  }
LABEL_13:
  unint64_t v15 = [(GAXBackboard *)self appLaunchGeneration];
  int v16 = +[AXReplayer replayer];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_185AC;
  v18[3] = &unk_49690;
  id v19 = v4;
  int v20 = self;
  unint64_t v21 = v15;
  id v17 = v4;
  [v16 replayWithName:@"GAXAttemptAppRelaunch" attempts:40 interval:1 async:&_dispatch_main_q queue:v18 replayBlock:&stru_496D0 completion:0.5];
}

- (void)attemptAppRelaunchForAppWithIdentifier:(id)a3 withIntegrityVerifier:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(GAXBackboard *)self appManager];
  [v6 incrementRelaunchAttemptsForSessionAppWithIdentifier:v5];

  [(GAXBackboard *)self addReasonToBlockAllEvents:@"GAX verifying app relaunch"];
  id v7 = [(GAXBackboard *)self eventProcessor];
  [v7 beginHandlingSystemEventsForReason:@"GAX Launching app"];

  BOOL v8 = GAXLogIntegrity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "All looks ok. Attempting to relaunch: (%{public}@)", (uint8_t *)&v9, 0xCu);
  }

  [(GAXBackboard *)self _launchSessionAppWithIdentifier:v5];
}

- (id)expectedSessionAppIdentifier
{
  if ([(GAXBackboard *)self wantsSingleAppMode])
  {
    id v3 = [(GAXBackboard *)self profileManager];
    id v4 = [v3 singleAppModeAppID];
  }
  else
  {
    id v3 = [(GAXBackboard *)self appManager];
    id v5 = [v3 sessionAppBundleIdentifiers];
    id v4 = [v5 firstObject];
  }

  return v4;
}

- (BOOL)appLayoutIsMultiAppForIntegrityVerifier:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  unsigned __int8 v4 = [v3 appLayoutIsMultiApp];

  return v4;
}

- (BOOL)shouldProceedWithVerificationForIntegrityVerifier:(id)a3
{
  if (([(GAXBackboard *)self isUnmanagedSelfLocked]
     || _AXSGuidedAccessRequiresApplicationAccessibility())
    && !AXSessionIsLoginSession())
  {
    return 1;
  }
  id v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Guided Access is loaded, but currently unneeded. Not continuing with verification", v5, 2u);
  }

  return 0;
}

- (BOOL)frontmostAppIsAcceptableForSessionAppWithIntegrityVerifier:(id)a3
{
  unsigned __int8 v4 = [(GAXBackboard *)self appManager];
  if ([v4 effectiveAppIsAcceptableForSessionApps])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    BOOL v6 = [(GAXBackboard *)self profileManager];
    id v7 = [(GAXBackboard *)self appManager];
    BOOL v8 = [v7 effectiveAppBundleIdentifier];
    unsigned __int8 v5 = [v6 appAllowlistActiveAndContainsAdditionalApp:v8];
  }
  return v5;
}

- (BOOL)sessionAppWithIdentifier:(id)a3 isRelaunchableForIntegrityVerifier:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(GAXBackboard *)self appManager];
  unsigned __int8 v7 = [v6 sessionAppIsHostedByTheSystemApp:v5];

  return v7 ^ 1;
}

- (BOOL)sessionAppIsPreferencesForIntegrityVerifier:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  unsigned __int8 v4 = [v3 sessionAppsContainPreferences];

  return v4;
}

- (BOOL)sessionAppIsPurpleBuddyForIntegrityVerifier:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  unsigned __int8 v4 = [v3 sessionAppsContainPurpleBuddy];

  return v4;
}

- (BOOL)sessionAppGAXClientDidCheckInForIntegrityVerifier:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  unsigned __int8 v4 = [v3 sessionAppGAXClientDidCheckIn];

  return v4;
}

- (void)sessionAppIsBeingInstalledForIntegrityVerifier:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    sub_2AEB8();
  }
  id v11 = v10;
  launchServiceAccessQueue = self->_launchServiceAccessQueue;
  if (!launchServiceAccessQueue)
  {
    unsigned int v13 = (OS_dispatch_queue *)dispatch_queue_create("accessibility.guidedaccess.launchservice.queue", 0);
    double v14 = self->_launchServiceAccessQueue;
    self->_launchServiceAccessQueue = v13;

    launchServiceAccessQueue = self->_launchServiceAccessQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18C0C;
  block[3] = &unk_496F8;
  void block[4] = self;
  id v18 = v9;
  id v19 = v11;
  id v15 = v11;
  id v16 = v9;
  dispatch_async(launchServiceAccessQueue, block);
}

- (BOOL)_appWithIdentifierIsBeingInstalled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[LSApplicationRecord enumeratorWithOptions:64];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      id v8 = v6;
      char v9 = 0;
      uint64_t v10 = *(void *)v20;
      *(void *)&long long v7 = 138543362;
      long long v18 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v5);
          }
          double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "installType", v18))
          {
            unsigned int v13 = [v12 bundleIdentifier];
            unsigned int v14 = [v4 isEqualToString:v13];

            if (v14)
            {
              id v15 = GAXLogCommon();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v18;
                id v24 = v4;
                _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "App %{public}@ is being installed", buf, 0xCu);
              }

              char v9 = 1;
              [(GAXBackboard *)self setIsApplicationBeingInstalled:1];
            }
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }

    BOOL v16 = v9 & 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)relaunchAttemptsForSessionAppWithIdentifier:(id)a3 forIntegrityVerifier:(id)a4
{
  id v5 = a3;
  id v6 = [(GAXBackboard *)self appManager];
  id v7 = [v6 sessionAppRelaunchAttemptsForAppWithIdentifier:v5];

  return (unint64_t)v7;
}

- (BOOL)isSystemAppAccessDisabledForIntegrityVerifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if ([v4 safeIvarForKey:@"_lock"])
  {
    uint64_t v10 = v4;
    AXPerformSafeBlock();
    id v5 = v10;
  }
  else
  {
    id v5 = GAXLogIntegrity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_2AEE4();
    }
  }

  id v6 = GAXLogIntegrity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned __int8 *)v12 + 24);
    *(_DWORD *)buf = 67109120;
    int v16 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Is system app access enabled: %i", buf, 8u);
  }

  BOOL v8 = *((unsigned char *)v12 + 24) == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)isPreBoardRunningForIntegrityVerifier:(id)a3
{
  id v4 = a3;
  int v5 = AXInPreboardScenario();
  if (v5)
  {
    id v6 = [(GAXBackboard *)self preBoardDidFinishObserverToken];

    if (!v6)
    {
      int v7 = GAXLogIntegrity();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "PreBoard is running. Observing when it finishes.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      BOOL v8 = +[NSNotificationCenter defaultCenter];
      char v9 = +[NSOperationQueue mainQueue];
      uint64_t v10 = AXInPreBoardScenarioUpdatedNotification;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_19310;
      v13[3] = &unk_49748;
      objc_copyWeak(&v14, buf);
      uint64_t v11 = [v8 addObserverForName:v10 object:0 queue:v9 usingBlock:v13];
      [(GAXBackboard *)self setPreBoardDidFinishObserverToken:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(buf);
    }
  }

  return v5;
}

- (BOOL)isCheckerBoardRunningForIntegrityVerifier:(id)a3
{
  id v4 = a3;
  int v5 = AXInCheckerBoardScenario();
  if (v5)
  {
    id v6 = [(GAXBackboard *)self checkerBoardDidFinishObserverToken];

    if (!v6)
    {
      int v7 = GAXLogIntegrity();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "CheckerBoard is running. Observing when it finishes.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      BOOL v8 = +[NSNotificationCenter defaultCenter];
      char v9 = +[NSOperationQueue mainQueue];
      uint64_t v10 = AXInCheckerBoardScenarioUpdatedNotification;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_19508;
      v13[3] = &unk_49748;
      objc_copyWeak(&v14, buf);
      uint64_t v11 = [v8 addObserverForName:v10 object:0 queue:v9 usingBlock:v13];
      [(GAXBackboard *)self setCheckerBoardDidFinishObserverToken:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(buf);
    }
  }

  return v5;
}

- (BOOL)hasMultipleSessionAppsForIntegrityVerifier:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  id v4 = [v3 sessionAppBundleIdentifiers];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

- (id)reasonsToBlockAllEventsWithEventProcessor:(id)a3
{
  return [(GAXBackboard *)self currentReasonsToBlockAllEvents];
}

- (void)eventProcessor:(id)a3 transitionToMode:(unsigned int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1961C;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)eventProcessor:(id)a3 showAlertWithType:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_196A0;
  v4[3] = &unk_495A0;
  v4[4] = self;
  int v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)eventProcessor:(id)a3 updateAssistiveTouchBootstrapPort:(unsigned int)a4
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_197B0;
  v5[3] = &unk_495A0;
  v5[4] = self;
  unsigned int v6 = a4;
  dispatch_sync(gaxStateAccessQueue, v5);
}

- (void)unlockDeviceWithEventProcessor:(id)a3
{
}

- (void)unlockDeviceIfSleepingWithEventProcessor:(id)a3
{
  id v4 = a3;
  int v5 = +[AXSpringBoardServer server];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_198D4;
  v7[3] = &unk_49790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 isSystemSleeping:v7];
}

- (void)monitorForTouchIDWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1995C;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_accessIgnoredTouchRegions
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_12C34;
  uint64_t v10 = sub_12C44;
  id v11 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_19A58;
  v5[3] = &unk_494B0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)eventProcessor:(id)a3 shouldAllowTripleClickSheet:(BOOL *)a4 tripleClickAlertIsVisible:(BOOL *)a5
{
  id v9 = a3;
  if (a5)
  {
    uint64_t v8 = [(id)AXSafeClassFromString() safeValueForKey:@"controller"];
    *a5 = [v8 safeBoolForKey:@"_isAlertVisible"];
  }
  if (a4) {
    *a4 = [(GAXBackboard *)self allowsTripleClickSheet];
  }
}

- (void)monitorForTouchID
{
  id v2 = [(GAXBackboard *)self userInterfaceClient];
  [v2 sendAsynchronousMessage:0 withIdentifier:32 targetAccessQueue:0 completion:0];
}

- (void)_updateIsInitializingAndWasActiveBeforeReboot:(BOOL)a3
{
  int v3 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19E70;
  block[3] = &unk_494B0;
  void block[4] = self;
  void block[5] = &v22;
  dispatch_sync(gaxStateAccessQueue, block);
  if (*((unsigned __int8 *)v23 + 24) != v3)
  {
    uint64_t v6 = self->_gaxStateAccessQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_19E88;
    v19[3] = &unk_494D8;
    v19[4] = self;
    char v20 = v3;
    dispatch_sync(v6, v19);
    if (v3)
    {
      int v7 = GAXLogIntegrity();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Will Begin blocking HID and System events", v18, 2u);
      }

      uint64_t v8 = [(GAXBackboard *)self eventProcessor];
      [v8 beginHandlingSystemEventsForReason:@"GAX Initializing"];

      id v9 = [(GAXBackboard *)self eventProcessor];
      [v9 raiseSystemEventTapPriorityToMaximum];

      uint64_t v10 = [(GAXBackboard *)self eventProcessor];
      [v10 beginBlockingHID];

      id v11 = [(GAXBackboard *)self eventProcessor];
      [v11 beginHandlingHIDEventsForReason:@"GAX Initializing"];

      double v12 = [(GAXBackboard *)self eventProcessor];
      [v12 raiseHIDEventTapPriorityToMaximum];
    }
    else
    {
      uint64_t v13 = GAXLogIntegrity();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Will End blocking HID and System events", v18, 2u);
      }

      id v14 = [(GAXBackboard *)self eventProcessor];
      [v14 restoreSystemEventTapPriorityToDefault];

      id v15 = [(GAXBackboard *)self eventProcessor];
      [v15 endHandlingSystemEventsForReason:@"GAX Initializing"];

      int v16 = [(GAXBackboard *)self eventProcessor];
      [v16 restoreHIDEventTapPriorityToDefault];

      id v17 = [(GAXBackboard *)self eventProcessor];
      [v17 endHandlingHIDEventsForReason:@"GAX Initializing"];

      double v12 = [(GAXBackboard *)self eventProcessor];
      [v12 endBlockingHID];
    }
  }
  _Block_object_dispose(&v22, 8);
}

- (void)_resetOverrideTouchReasons
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19F34;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_sync(gaxStateAccessQueue, block);
}

- (void)_disableSOSGesture:(BOOL)a3
{
  CFPreferencesSetAppValue(@"SBDisablesSOSForAccessibility", +[NSNumber numberWithBool:a3], @"com.apple.springboard");

  CFPreferencesAppSynchronize(@"com.apple.springboard");
}

- (void)_handleToggleServerModeNotification:(id)a3
{
}

- (void)_handleAssistiveTouchEnabledNotification:(id)a3
{
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A05C;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_sync(gaxStateAccessQueue, block);
}

- (void)_handleTelephonyCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  if ([(GAXBackboard *)self isActive])
  {
    int v5 = [v4 object];
    unsigned int v6 = [v5 status];

    gaxStateAccessQueue = self->_gaxStateAccessQueue;
    if (v6 - 2 > 2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1A1F8;
      block[3] = &unk_48928;
      void block[4] = self;
      uint64_t v8 = block;
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1A1E4;
      v10[3] = &unk_48928;
      v10[4] = self;
      uint64_t v8 = v10;
    }
  }
  else
  {
    gaxStateAccessQueue = self->_gaxStateAccessQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1A1D0;
    v11[3] = &unk_48928;
    v11[4] = self;
    uint64_t v8 = v11;
  }
  dispatch_sync(gaxStateAccessQueue, v8);
}

- (void)_transitionToMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(GAXBackboard *)self profileManager];
  -[GAXBackboard _transitionToMode:requireUserUnlock:](self, "_transitionToMode:requireUserUnlock:", v3, [v5 isUserMode]);
}

- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4
{
}

- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4 assumeUserInterfaceConnectionSevered:(BOOL)a5
{
}

- (void)_transitionToMode:(unsigned int)a3 requireUserUnlock:(BOOL)a4 assumeUserInterfaceConnectionSevered:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v147[0] = _NSConcreteStackBlock;
  v147[1] = 3221225472;
  v147[2] = sub_1B4CC;
  v147[3] = &unk_497E0;
  v147[4] = self;
  unsigned int v149 = a3;
  BOOL v150 = a4;
  BOOL v151 = a5;
  id v10 = a6;
  id v148 = v10;
  id v11 = objc_retainBlock(v147);
  double v12 = [(GAXBackboard *)self appLaunchFailureDetectionTimer];
  [v12 cancel];

  uint64_t v13 = [(GAXBackboard *)self settings];
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x2020000000;
  int v146 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B5A8;
  block[3] = &unk_494B0;
  void block[5] = &v143;
  void block[4] = self;
  dispatch_sync(gaxStateAccessQueue, block);
  id v15 = GAXLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = (GAXBackboard *)*((unsigned int *)v144 + 6);
    unsigned int v17 = [(GAXBackboard *)self isLocked];
    *(_DWORD *)buf = 134219008;
    v156 = v16;
    __int16 v157 = 2048;
    unint64_t v158 = a3;
    __int16 v159 = 1024;
    BOOL v160 = v7;
    __int16 v161 = 1024;
    BOOL v162 = v6;
    __int16 v163 = 1024;
    unsigned int v164 = v17;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Transition from %lu to %lu (requireUserUnlock: %i, assumeUserInterfaceConnectionSevered: %i, isLocked: %i)", buf, 0x28u);
  }

  if (*((_DWORD *)v144 + 6) == a3)
  {
    if (v10)
    {
      id v93 = v10;
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    goto LABEL_46;
  }
  if ([(GAXBackboard *)self isLocked] && v7)
  {
    [(GAXBackboard *)self _remainingLockoutDuration];
    uint64_t v19 = v18;
    char v20 = +[AXSpringBoardServer server];
    v138[0] = _NSConcreteStackBlock;
    v138[1] = 3221225472;
    v138[2] = sub_1B5BC;
    v138[3] = &unk_49830;
    uint64_t v140 = v19;
    v138[4] = self;
    unsigned int v141 = a3;
    id v139 = v10;
    [v20 isSystemAppFrontmost:v138];

    goto LABEL_46;
  }
  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472;
  v134[2] = sub_1BB08;
  v134[3] = &unk_49858;
  unsigned int v136 = a3;
  v134[4] = self;
  BOOL v137 = v6;
  id v21 = v10;
  id v135 = v21;
  v92 = objc_retainBlock(v134);
  [(GAXBackboard *)self setPasscodeEntryFailedCount:0];
  uint64_t v22 = +[AXSpringBoardServer server];
  -[GAXBackboard setActiveInterfaceOrientation:](self, "setActiveInterfaceOrientation:", [v22 activeInterfaceOrientation]);

  if (a3 == 1)
  {
    uint64_t v26 = [(GAXBackboard *)self appManager];
    [v26 resumeEffectiveApp];
    uint64_t v27 = [v26 effectiveAppBundleIdentifier];
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_1BE7C;
    v124[3] = &unk_498F8;
    id v129 = v21;
    id v28 = v27;
    id v125 = v28;
    v130 = v11;
    id v29 = v26;
    id v126 = v29;
    v127 = self;
    v132 = &v143;
    id v128 = v13;
    int v133 = 1;
    v131 = v92;
    CGFloat v30 = objc_retainBlock(v124);
    if ([v29 effectiveAppIsHostedByTheSystemApp])
    {
      CFIndex v31 = objc_alloc_init(GAXSpringboardClientStatus);
      v118 = _NSConcreteStackBlock;
      uint64_t v119 = 3221225472;
      v120 = sub_1C748;
      v121 = &unk_49920;
      v123 = v30;
      double v32 = v31;
      v122 = v32;
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    else
    {
      double v32 = +[AXSpringBoardServer server];
      [(GAXSpringboardClientStatus *)v32 gaxPrepareForTransitionToWorkspaceWithAppID:v28 completion:v30];
    }

LABEL_45:
    goto LABEL_46;
  }
  if (a3 != 2)
  {
    double v33 = [(GAXBackboard *)self unmanagedASAMFailsafeTimer];
    [v33 cancel];

    [(GAXBackboard *)self _removeUnmanagedSelfLockRestrictions];
    double v34 = +[GAXSettings sharedInstance];
    [v34 setSelfLockUnmanaged:0];

    id v35 = [(GAXBackboard *)self appManager];
    [v35 resumeEffectiveApp];

    BOOL v36 = [(GAXBackboard *)self appManager];
    unsigned int v37 = [v36 effectiveAppWasPlayingMedia];

    if (v37)
    {
      id v38 = +[AXSpringBoardServer server];
      CGPoint v39 = [(GAXBackboard *)self appManager];
      int v40 = [v39 effectiveAppBundleIdentifier];
      [v38 resumeMediaForApp:v40];
    }
    char v41 = [(GAXBackboard *)self profileManager];
    [v13 setActiveAppID:0];
    uint64_t v42 = [(GAXBackboard *)self timeRestrictionManager];
    [v42 cancel];

    uint64_t v43 = GAXLogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "self.locked = NO (server mode disabled)", buf, 2u);
    }

    [(GAXBackboard *)self setLocked:0];
    if (([v41 isSingleAppMode] & 1) != 0
      || (buf[0] = 0,
          [(GAXBackboard *)self _updateSessionAppWithIdentifier:0 notifyUserInterfaceServer:0 sessionAppIdentifierDidChange:buf], !buf[0]))
    {
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v44 = +[NSNumber numberWithBool:0];
    }
    [(GAXBackboard *)self addReasonToBlockAllEvents:@"GAX transitioning to application"];
    if (v6)
    {
      [(GAXBackboard *)self _didFinishTransitioningFromWorkspaceToApplication];
    }
    else
    {
      v47 = [(GAXBackboard *)self userInterfaceClient];
      id v48 = objc_alloc((Class)NSDictionary);
      objc_super v49 = +[NSNumber numberWithBool:1];
      if (v44)
      {
        v152 = v44;
        v50 = +[NSArray arrayWithObjects:&v152 count:1];
      }
      else
      {
        v50 = 0;
      }
      id v56 = objc_msgSend(v48, "initWithObjectsAndKeys:", v49, @"should restore telephony", v50, @"session application identifiers", 0);
      if (v44) {

      }
      v57 = +[AXAccessQueue mainAccessQueue];
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_1CC74;
      v96[3] = &unk_49998;
      v96[4] = self;
      id v97 = v41;
      id v58 = v47;
      id v98 = v58;
      [v58 sendAsynchronousMessage:v56 withIdentifier:12 targetAccessQueue:v57 completion:v96];
    }
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_1CE64;
    v95[3] = &unk_48928;
    v95[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v95);
    v94 = v92;
    AXPerformBlockAsynchronouslyOnMainThread();

    goto LABEL_45;
  }
  id v23 = [(GAXBackboard *)self appManager];
  uint64_t v24 = (uint64_t)[v23 effectiveAppIsAcceptableForSessionApps];

  if ((v24 & 1) == 0)
  {
    int v45 = GAXLogCommon();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v46 = [(GAXBackboard *)self appManager];
      *(_DWORD *)buf = 138543362;
      v156 = v46;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "Session app is not foreground running. Disabling Guided Access: %{public}@", buf, 0xCu);
    }
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_1C75C;
    v116[3] = &unk_49948;
    v116[4] = self;
    id v117 = v21;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v116);

    goto LABEL_45;
  }
  if ([(GAXBackboard *)self activeInterfaceOrientation])
  {
    if (v7 && [(GAXBackboard *)self _isPasscodeStale])
    {
      [(GAXBackboard *)self setDesiredModeAfterSuccessfulPasscodeEntry:2];
      char v25 = +[AXSpringBoardServer server];
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_1C7BC;
      v115[3] = &unk_48FF0;
      v115[4] = self;
      [v25 gaxGetNewPasscodeLengthWithCompletion:v115];

      if (v21)
      {
        v110 = _NSConcreteStackBlock;
        uint64_t v111 = 3221225472;
        v112 = sub_1C894;
        v113 = &unk_48F78;
        id v114 = v21;
        AXPerformBlockAsynchronouslyOnMainThread();
      }
      goto LABEL_45;
    }
    v85 = [(GAXBackboard *)self appManager];
    v91 = [(GAXBackboard *)self profileManager];
    unsigned int v51 = [v91 configuration];
    if (v51 == 2)
    {
      v52 = 0;
    }
    else
    {
      uint64_t v24 = [v85 sessionAppBundleIdentifiers];
      v52 = [(id)v24 firstObject];
    }
    [v13 setActiveAppID:v52];
    if (v51 != 2)
    {
    }
    v59 = +[NSDate date];
    [v13 setLastActivationDate:v59];

    if ([v91 isUserMode])
    {
      v60 = [v13 userConfiguredAppIDs];
      if (!v60)
      {
        unsigned int v63 = [(GAXBackboard *)self appManager];
        v64 = [v63 effectiveAppBundleIdentifier];
        v65 = +[NSArray arrayWithObject:v64];
        [v13 setUserConfiguredAppIDs:v65];

        goto LABEL_57;
      }
      v61 = [v85 effectiveAppBundleIdentifier];
      unsigned __int8 v62 = [v60 containsObject:v61];

      if ((v62 & 1) == 0)
      {
        unsigned int v63 = [v85 effectiveAppBundleIdentifier];
        v64 = [v60 arrayByAddingObject:v63];
        [v13 setUserConfiguredAppIDs:v64];
LABEL_57:
      }
    }
    else
    {
      if (![v91 isSingleAppMode])
      {
LABEL_59:
        v66 = GAXLogCommon();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v67 = [(GAXBackboard *)self profileManager];
          *(_DWORD *)buf = 138412546;
          v156 = self;
          __int16 v157 = 2112;
          unint64_t v158 = (unint64_t)v67;
          _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "\n**************************************\nActivating Guided Access.\nServer: %@\nProfile: %@\n**************************************\n", buf, 0x16u);
        }
        [(GAXBackboard *)self addReasonToBlockAllEvents:@"GAX transitioning to session"];
        if (![(GAXBackboard *)self activeInterfaceOrientation]) {
          _AXAssert();
        }
        uint64_t v68 = [(GAXBackboard *)self activeInterfaceOrientation];
        v69 = [(GAXBackboard *)self profileManager];
        v89 = [v69 ignoredTouchRegionsForOrientation:v68];
        int v84 = v68;

        uint64_t v70 = [(GAXBackboard *)self userInterfaceClient];
        CFStringRef v88 = +[NSNumber numberWithUnsignedInteger:2];
        v83 = (void *)v70;
        v87 = [(GAXBackboard *)self profileManager];
        CFStringRef v86 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v87 configuration]);
        v154[0] = v86;
        v71 = [(GAXBackboard *)self profileManager];
        uint64_t v72 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v71 timeRestrictionsEnabled]);
        v154[1] = v72;
        v73 = [(GAXBackboard *)self profileManager];
        v74 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v73 appTimeoutDuration]);
        v154[2] = v74;
        v75 = +[NSArray arrayWithObjects:v154 count:3];
        v153[0] = @"profile configuration";
        v153[1] = @"time restrictions enabled";
        v153[2] = @"time restriction duration";
        v76 = +[NSArray arrayWithObjects:v153 count:3];
        CFStringRef v90 = +[NSMutableDictionary dictionaryWithObjects:v75 forKeys:v76];

        if (v88) {
          [v90 setObject:v88 forKeyedSubscript:@"server mode for disabling telephony"];
        }
        if (v89) {
          [v90 setObject:v89 forKeyedSubscript:@"interest area paths for storage"];
        }
        v77 = +[AXAccessQueue mainAccessQueue];
        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472;
        v104[2] = sub_1C8A8;
        v104[3] = &unk_49970;
        int v109 = v84;
        v104[4] = self;
        v108 = &v143;
        id v78 = v85;
        id v105 = v78;
        id v79 = v91;
        id v106 = v79;
        id v80 = v83;
        id v107 = v80;
        [v80 sendAsynchronousMessage:v90 withIdentifier:10 targetAccessQueue:v77 completion:v104];

        v81 = GAXLogCommon();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v81, OS_LOG_TYPE_DEFAULT, "self.locked = YES", buf, 2u);
        }

        [(GAXBackboard *)self setLocked:1];
        [(GAXBackboard *)self setWasEverActiveInCurrentFrontmostApp:1];
        CFStringRef v82 = +[AXSettings sharedInstance];
        objc_msgSend(v82, "setGuidedAccessUsageCount:", (char *)objc_msgSend(v82, "guidedAccessUsageCount") + 1);

        v99 = _NSConcreteStackBlock;
        uint64_t v100 = 3221225472;
        v101 = sub_1CC60;
        v102 = &unk_48F78;
        v103 = v92;
        AXPerformBlockAsynchronouslyOnMainThread();

        goto LABEL_45;
      }
      v60 = [(GAXBackboard *)self axFeatureManager];
      objc_msgSend(v60, "overrideAccessibiltyFeaturesWithFeatureSet:", objc_msgSend(v91, "profileAccessibilityFeatureSet"));
    }

    goto LABEL_59;
  }
  v53 = GAXLogCommon();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = +[NSDate date];
    *(_DWORD *)buf = 138543362;
    v156 = v54;
    _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "Active interface orientation was unknown. trying to transition gax again in .25. %{public}@", buf, 0xCu);
  }
  v55 = +[AXSpringBoardServer server];
  -[GAXBackboard setActiveInterfaceOrientation:](self, "setActiveInterfaceOrientation:", [v55 activeInterfaceOrientation]);

LABEL_46:
  _Block_object_dispose(&v143, 8);
}

- (id)_errorMessageForAvailability:(unint64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = @"Guided Access Ready";
      break;
    case 1uLL:
      uint64_t v3 = +[NSString stringWithFormat:@"Allowing all touch by override."];
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x3032000000;
      double v12 = sub_12C34;
      uint64_t v13 = sub_12C44;
      id v14 = 0;
      gaxStateAccessQueue = self->_gaxStateAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1D108;
      block[3] = &unk_499C0;
      void block[4] = self;
      void block[5] = &v9;
      dispatch_sync(gaxStateAccessQueue, block);
      if (v10[5])
      {
        uint64_t v6 = [(__CFString *)v3 stringByAppendingFormat:@"  %@", v10[5]];

        uint64_t v3 = (__CFString *)v6;
      }
      _Block_object_dispose(&v9, 8);

      break;
    case 2uLL:
      uint64_t v3 = +[NSString stringWithFormat:@"Ignoring all touch by override"];
      break;
    case 3uLL:
      uint64_t v3 = @"Device is busy syncing, resetting, restoring, etc.";
      break;
    case 4uLL:
      uint64_t v3 = @"Transition from Workspace to Active not allowed from external request";
      break;
    case 5uLL:
      uint64_t v3 = @"Profile does not allow exit";
      break;
    case 6uLL:
      uint64_t v3 = @"From External Request. Do nothing as GAX is already active";
      break;
    case 7uLL:
      uint64_t v3 = @"SpringBoard is frontmost";
      break;
    case 8uLL:
      uint64_t v3 = @"Purple Buddy is Frontmost";
      break;
    case 9uLL:
      uint64_t v3 = @"Preferences is Frontmost";
      break;
    case 0xAuLL:
      uint64_t v3 = @"Multiple Apps Not Supported";
      break;
    case 0xBuLL:
      uint64_t v3 = @"No Passcode is set";
      break;
    case 0xDuLL:
      uint64_t v3 = @"Transitioning";
      break;
    case 0xEuLL:
      uint64_t v3 = @"A system gesture is active";
      break;
    case 0xFuLL:
      uint64_t v3 = @"Other";
      break;
    default:
      break;
  }

  return v3;
}

- (BOOL)_isAllowingAllTouchByOverride
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1D218;
  v5[3] = &unk_494B0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isIgnoringAllTouchByOverride
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1D2E0;
  v5[3] = &unk_499C0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_availabilityForRequestType:(int)a3 springboardParameters:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 objectForKeyedSubscript:@"isSpringBoardFrontmost"];
    unsigned int v8 = [v7 BOOLValue];

    char v9 = [v6 objectForKeyedSubscript:@"isAppSwitcherVisible"];
    unsigned int v10 = [v9 BOOLValue];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"isSyncingRestoringResettingOrUpdating"];
    unsigned __int8 v12 = [v11 BOOLValue];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"isSiriVisible"];
    unsigned int v14 = [v13 BOOLValue];

    id v15 = [v6 objectForKeyedSubscript:&off_4D7A0];
    unsigned __int8 v16 = [v15 BOOLValue];
  }
  else
  {
    _AXAssert();
    unsigned int v10 = 0;
    unsigned int v14 = 0;
    unsigned __int8 v16 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v8 = 0;
  }
  uint64_t v38 = 0;
  CGPoint v39 = &v38;
  uint64_t v40 = 0x4010000000;
  char v41 = "";
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  int v45 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1D8A8;
  block[3] = &unk_494B0;
  void block[4] = self;
  void block[5] = &v38;
  dispatch_sync(gaxStateAccessQueue, block);
  uint64_t v18 = [(GAXBackboard *)self appManager];
  uint64_t v19 = [v18 effectiveAppBundleIdentifier];

  if (v19 || *((_DWORD *)v39 + 8) == 2)
  {
    if ([(GAXBackboard *)self _isAllowingAllTouchByOverride])
    {
      unint64_t v20 = 1;
    }
    else if ([(GAXBackboard *)self _isIgnoringAllTouchByOverride])
    {
      unint64_t v20 = 2;
    }
    else if ((v8 | v10 | v14) == 1)
    {
      if (v8 && *((_DWORD *)v39 + 8) == 2) {
        unint64_t v20 = 0;
      }
      else {
        unint64_t v20 = 7;
      }
    }
    else if (v12)
    {
      unint64_t v20 = 3;
    }
    else
    {
      uint64_t v33 = 0;
      double v34 = &v33;
      uint64_t v35 = 0x2020000000;
      int v36 = 0;
      id v21 = self->_gaxStateAccessQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1D8C4;
      v32[3] = &unk_494B0;
      v32[4] = self;
      v32[5] = &v33;
      dispatch_sync(v21, v32);
      int v22 = *((_DWORD *)v34 + 6);
      if (v22 == 2)
      {
        if (a3 == 2)
        {
          unint64_t v20 = 6;
        }
        else
        {
          uint64_t v24 = [(GAXBackboard *)self profileManager];
          unsigned int v25 = [v24 shouldAllowExit];

          if (v25) {
            unint64_t v20 = 0;
          }
          else {
            unint64_t v20 = 5;
          }
        }
      }
      else if (v22 == 1)
      {
        unint64_t v20 = 4 * (a3 == 2);
      }
      else
      {
        id v23 = [(GAXBackboard *)self appManager];
        if ([v23 effectiveAppIsPurpleBuddy])
        {
          unint64_t v20 = 8;
        }
        else
        {
          unsigned int v26 = [v23 effectiveAppIsPreferences];
          char v27 = v26 | v16;
          if (v26) {
            unint64_t v20 = 9;
          }
          else {
            unint64_t v20 = 14;
          }
          if ((v27 & 1) == 0)
          {
            if (a3 == 2 && ![(GAXBackboard *)self _hasPasscode])
            {
              unint64_t v20 = 11;
            }
            else
            {
              id v28 = [(GAXBackboard *)self appManager];
              unsigned int v29 = [v28 appLayoutIsMultiApp];

              if (v29) {
                unint64_t v20 = 10;
              }
              else {
                unint64_t v20 = 0;
              }
            }
          }
        }
      }
      _Block_object_dispose(&v33, 8);
    }
  }
  else
  {
    unint64_t v20 = 13;
  }

  _Block_object_dispose(&v38, 8);
  return v20;
}

- (unint64_t)availabilityForExternalRequestWithSpringboardParameters:(id)a3
{
  return [(GAXBackboard *)self _availabilityForRequestType:2 springboardParameters:a3];
}

- (BOOL)_shouldAllowDirectInactiveToActiveTransition
{
  char v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 guidedAccessDisallowDirectInactiveToActiveTransition];

  if (v4)
  {
    id v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_2AFDC();
    }

    return 0;
  }
  else
  {
    BOOL v7 = [(GAXBackboard *)self profileManager];
    if ([v7 isAppSelfLockMode])
    {
      unsigned __int8 v6 = 1;
    }
    else if ([(GAXBackboard *)self _isPasscodeStale] {
           || ![v7 isUserMode])
    }
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      unsigned int v8 = [(GAXBackboard *)self appManager];
      char v9 = [v8 effectiveAppBundleIdentifier];

      unsigned int v10 = [(GAXBackboard *)self settings];
      uint64_t v11 = [v10 userConfiguredAppIDs];

      unsigned __int8 v6 = [v11 containsObject:v9];
    }
  }
  return v6;
}

- (id)_availabilitySpringboardParametersFromSystemAppInfoQuery:(id)a3
{
  v10[0] = @"isSpringBoardFrontmost";
  id v3 = a3;
  unsigned int v4 = [v3 objectForKeyedSubscript:&off_4D7B8];
  v11[0] = v4;
  v10[1] = @"isSyncingRestoringResettingOrUpdating";
  id v5 = [v3 objectForKeyedSubscript:&off_4D7D0];
  v11[1] = v5;
  v10[2] = @"isAppSwitcherVisible";
  unsigned __int8 v6 = [v3 objectForKeyedSubscript:&off_4D7E8];
  v11[2] = v6;
  v10[3] = @"isSiriVisible";
  BOOL v7 = [v3 objectForKeyedSubscript:&off_4D800];

  v11[3] = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (unint64_t)_SBServerQueryForAvailabilitySBParameters
{
  return 57392;
}

- (void)_handleServerModeChangeRequestWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = +[NSNumber numberWithUnsignedInt:v3];
    *(_DWORD *)buf = 138543362;
    unsigned int v14 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "GAX did get request to change mode. type:%{public}@", buf, 0xCu);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  if (vabdd_f64(v7, *(double *)&qword_56120) >= 2.0)
  {
    qword_56120 = *(void *)&v7;
    unint64_t v9 = [(GAXBackboard *)self _SBServerQueryForAvailabilitySBParameters];
    unsigned int v10 = +[AXSpringBoardServer server];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1DD0C;
    v11[3] = &unk_499E8;
    int v12 = v3;
    void v11[4] = self;
    [v10 systemAppInfoWithQuery:v9 completion:v11];
  }
  else
  {
    unsigned int v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "currently handling a mode change request. Ignoring this one", buf, 2u);
    }
  }
}

- (void)_didFinishTransitioningFromWorkspaceToSession
{
  if ([(GAXBackboard *)self _previousModeIgnoringWorkspace:1] == 2) {
    [(GAXBackboard *)self _applyChangedStatesForRestrictions];
  }
  else {
    [(GAXBackboard *)self _applyDeniedStatesForRestrictions];
  }
  id v19 = [(GAXBackboard *)self appManager];
  uint64_t v3 = +[AXSpringBoardServer server];
  unsigned int v4 = [v19 effectiveAppBundleIdentifier];
  [v3 resumeMediaForApp:v4];

  [v19 resetRelaunchAttempts];
  [(GAXBackboard *)self removeReasonToBlockAllEvents:@"GAX transitioning to session"];
  id v5 = +[AXSpringBoardServer server];
  [v5 gaxEndRequiringWallpaper];

  unsigned __int8 v6 = [(GAXBackboard *)self profileManager];
  if ([v6 isSingleAppMode])
  {

LABEL_7:
    unint64_t v9 = [(GAXBackboard *)self profileManager];
    unsigned __int8 v10 = [v9 isSingleAppMode];

    if (v10)
    {
      CFStringRef v11 = @"Guided Access is locked in SAM";
    }
    else
    {
      int v12 = [(GAXBackboard *)self profileManager];
      unsigned int v13 = [v12 isAppSelfLockMode];

      if (v13) {
        CFStringRef v11 = @"Guided Access is locked in ASAM";
      }
      else {
        CFStringRef v11 = @"unknown reason";
      }
    }
    unsigned int v14 = +[AXSpringBoardServer server];
    [v14 gaxDisconnectAllCalls];

    id v15 = +[AXSpringBoardServer server];
    unsigned __int8 v16 = [(GAXBackboard *)self appManager];
    unsigned int v17 = [v16 sessionAllowedBundleIdentifiers];
    [v15 gaxTerminateRunningApplicationsOtherThan:v17 forReason:v11];

    uint64_t v18 = +[AXSpringBoardServer server];
    [v18 gaxPreventPotentialAppLaunches];

    goto LABEL_13;
  }
  double v7 = [(GAXBackboard *)self profileManager];
  unsigned int v8 = [v7 isAppSelfLockMode];

  if (v8) {
    goto LABEL_7;
  }
LABEL_13:
}

- (void)_didFinishTransitioningFromWorkspaceToApplication
{
  if ([(GAXBackboard *)self _previousModeIgnoringWorkspace:1] == 2) {
    [(GAXBackboard *)self _applyAllowedStatesForRestrictions];
  }
  else {
    [(GAXBackboard *)self _clearChangedStatesForRestrictions];
  }
  [(GAXBackboard *)self removeReasonToBlockAllEvents:@"GAX transitioning to application"];
  id v3 = +[AXSpringBoardServer server];
  [v3 gaxEndRequiringWallpaper];
}

- (double)_remainingLockoutDuration
{
  if ([(GAXBackboard *)self _isRunningInStoreDemoMode]) {
    return 0.0;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  [(GAXBackboard *)self lastLockoutStartedTimeInterval];
  double v7 = v6;
  unint64_t v8 = [(GAXBackboard *)self passcodeEntryFailedCount];
  double v9 = 180.0;
  if (v8 == 2) {
    double v9 = 60.0;
  }
  if (v8 < 2) {
    double v9 = 10.0;
  }
  double v10 = v7 - v5 + v9;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  return ceil(v10);
}

- (void)applyUnmanagedSelfLockStaticRestrictionsWithProfileManager:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  [v3 effectiveAppRestrictionWithIdentifier:@"GAXProfileAllowsWebTextDefine" didChangeState:1];
}

- (void)removeUnmanagedSelfLockStaticRestrictionsWithProfileManager:(id)a3
{
  id v3 = [(GAXBackboard *)self appManager];
  [v3 effectiveAppRestrictionWithIdentifier:@"GAXProfileAllowsWebTextDefine" didChangeState:0];
}

- (BOOL)isSelfLockedToAppWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2B010();
  }

  if ([(GAXBackboard *)self isActive])
  {
    double v6 = +[GAXSettings sharedInstance];
    if ([v6 isActiveAppSelfLocked])
    {
      double v7 = [v6 activeAppID];
      unsigned __int8 v8 = [v7 isEqualToString:v4];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isUnmanagedSelfLocked
{
  id v2 = +[GAXSettings sharedInstance];
  if ([v2 isActiveAppSelfLocked]) {
    unsigned __int8 v3 = [v2 selfLockUnmanaged];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)processWithAuditTokenIsEntitledForUnmanagedASAM:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v7.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v7.val[4] = v3;
  id v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v7);
  if (GAXSecTaskHasBooleanEntitlement(v4, kAXAACLegacyEntitlement))
  {
    char HasBooleanEntitlement = 1;
    if (!v4) {
      return HasBooleanEntitlement;
    }
    goto LABEL_5;
  }
  char HasBooleanEntitlement = GAXSecTaskHasBooleanEntitlement(v4, kAXAACEntitlement);
  if (v4) {
LABEL_5:
  }
    CFRelease(v4);
  return HasBooleanEntitlement;
}

- (BOOL)processWithAuditTokenIsEntitledForInternalASAM:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v7.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v7.val[4] = v3;
  id v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v7);
  BOOL HasBooleanEntitlement = GAXSecTaskHasBooleanEntitlement(v4, kAXInternalASAMEntitlement);
  if (v4) {
    CFRelease(v4);
  }
  return HasBooleanEntitlement;
}

- (void)_showUnmanagedASAMBannerWithType:(int)a3
{
  double v5 = [(GAXBackboard *)self profileManager];
  unsigned int v6 = [v5 shouldShowUserConfirmationPromptsAndBanners];

  audit_token_t v7 = GAXLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Profile configuration requires ASAM to operate with user prompts and banners: showing ASAM text banner", buf, 2u);
    }

    audit_token_t v7 = +[AXSpringBoardServer server];
    double v9 = [(GAXBackboard *)self appManager];
    double v10 = [v9 effectiveAppBundleIdentifier];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1E768;
    v11[3] = &unk_49A10;
    void v11[4] = self;
    int v12 = a3;
    [v7 gaxGetDisplayNameForBundleId:v10 completion:v11];
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Profile configuration allows for operating ASAM without user prompts and banners: not showing ASAM text banner", buf, 2u);
  }
}

- (void)_showUnmanagedASAMBeganBanner
{
}

- (void)_showUnmanagedASAMEndedBanner
{
}

- (void)_showUnmanagedASAMTimedOutBanner
{
}

- (void)userConfirmUnmanagedASAMForAppWithBundleID:(id)a3 requireConfirmation:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = GAXLogCommon();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Profile configuration requires ASAM to operate with user prompts and banners: showing ASAM confirmation prompt", buf, 2u);
    }

    int v12 = +[AXSpringBoardServer server];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1E91C;
    v13[3] = &unk_49A60;
    id v14 = v8;
    id v15 = self;
    id v16 = v9;
    [v12 gaxGetDisplayNameForBundleId:v14 completion:v13];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Profile configuration allows for operating ASAM without user prompts and banners: not showing ASAM confirmation prompt", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (BOOL)appWithBundleIdentifier:(id)a3 auditToken:(id *)a4 isAuthorizedForASAMStyle:(int64_t)a5
{
  id v8 = a3;
  switch(a5)
  {
    case 0:
      id v9 = [(GAXBackboard *)self profileManager];
      LOBYTE(self) = [v9 isAppPrivilagedToSelfLock:v8];

      break;
    case 1:
      long long v10 = *(_OWORD *)&a4->var0[4];
      long long v16 = *(_OWORD *)a4->var0;
      long long v17 = v10;
      unsigned __int8 v11 = [(GAXBackboard *)self processWithAuditTokenIsEntitledForUnmanagedASAM:&v16];
      goto LABEL_7;
    case 2:
      int v12 = [(GAXBackboard *)self profileManager];
      if ([v12 isAppPrivilagedToSelfLock:v8])
      {
        LOBYTE(self) = 1;
      }
      else
      {
        long long v14 = *(_OWORD *)&a4->var0[4];
        long long v16 = *(_OWORD *)a4->var0;
        long long v17 = v14;
        LOBYTE(self) = [(GAXBackboard *)self processWithAuditTokenIsEntitledForUnmanagedASAM:&v16];
      }

      break;
    case 3:
      long long v13 = *(_OWORD *)&a4->var0[4];
      long long v16 = *(_OWORD *)a4->var0;
      long long v17 = v13;
      unsigned __int8 v11 = [(GAXBackboard *)self processWithAuditTokenIsEntitledForInternalASAM:&v16];
LABEL_7:
      LOBYTE(self) = v11;
      break;
    default:
      break;
  }

  return self & 1;
}

- (int64_t)effectiveASAMStyleForAppWithBundleIdentifier:(id)a3 auditToken:(id *)a4 desiredStyle:(int64_t)a5
{
  int64_t v5 = a5;
  if (a5 == 2)
  {
    id v7 = a3;
    id v8 = [(GAXBackboard *)self profileManager];
    unsigned int v9 = [v8 isAppPrivilagedToSelfLock:v7];

    int64_t v5 = v9 ^ 1;
  }
  return v5;
}

- (id)asamConfigurationDictionaryForBackboardServer:(id)a3
{
  id v4 = +[GAXSettings sharedInstance];
  unsigned int v5 = [v4 isActiveAppSelfLocked];

  if (v5)
  {
    BOOL v6 = +[NSNumber numberWithInteger:[(GAXBackboard *)self effectiveASAMStyle]];
    id v7 = +[NSMutableDictionary dictionaryWithObject:v6 forKey:&off_4D818];

    id v8 = [(GAXBackboard *)self profileManager];
    unsigned int v9 = [v8 unmanagedSelfLockPropertiesMap];

    if (v9)
    {
      long long v10 = [(GAXBackboard *)self profileManager];
      unsigned __int8 v11 = [v10 unmanagedSelfLockPropertiesMap];
      [v7 setObject:v11 forKeyedSubscript:&off_4D830];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)requestAXFeatures:(unint64_t)a3 setEnabled:(BOOL)a4 fromClientAppWithPort:(unsigned int)a5 withErrorCode:(int64_t *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  unsigned __int8 v11 = [(GAXBackboard *)self clientPortsToBundleIds];
  int v12 = +[NSNumber numberWithUnsignedInt:v7];
  long long v13 = [v11 objectForKeyedSubscript:v12];

  if (v13
    && [(GAXBackboard *)self wantsSingleAppModeOrAppSelfLockMode]
    && ([(GAXBackboard *)self expectedSessionAppIdentifier],
        long long v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 isEqual:v13],
        v14,
        v15))
  {
    if (a6) {
      *a6 = 0;
    }
    long long v16 = [(GAXBackboard *)self axFeatureManager];
    [v16 configureAXFeatures:a3 enabled:v8];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
    if (a6) {
      *a6 = 1;
    }
  }

  return v17;
}

- (void)setEnabled:(BOOL)a3 fromAppWithIdentifier:(id)a4 withAuditToken:(id *)a5 configuration:(id)a6 completion:(id)a7
{
  BOOL v10 = a3;
  id v42 = a4;
  id v12 = a6;
  long long v13 = a7;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  int v85 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  char v41 = [(GAXBackboard *)self profileManager];
  long long v14 = [v12 objectForKeyedSubscript:&off_4D830];
  unsigned int v15 = [v14 objectForKey:@"GAXProfileShowsUserConfirmationPromptsAndBanners"];

  if (v15)
  {
    long long v16 = [v14 objectForKey:@"GAXProfileShowsUserConfirmationPromptsAndBanners"];
    unsigned __int8 v17 = [v16 BOOLValue];
  }
  else
  {
    unsigned __int8 v17 = 1;
  }
  if (![(GAXBackboard *)self checkingASAMValidity])
  {
    uint64_t v77 = 0;
    id v78 = &v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 2;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 2;
    id v19 = objc_retainBlock(v13);
    objc_initWeak(&location, self);
    unint64_t v20 = [(GAXBackboard *)self eventProcessor];
    [v20 cancelCurrentTouches];

    id v21 = +[AXAssertion assertionWithType:AXAssertionTypeDisableSystemGestures identifier:@"GAX-ASAM-BB"];
    [(GAXBackboard *)self setDisableSystemGesturesForASAMStartAssertion:v21];

    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1F504;
    v67[3] = &unk_49AB0;
    objc_copyWeak(&v70, &location);
    BOOL v71 = v10;
    v67[4] = self;
    v69 = &v73;
    uint64_t v40 = v19;
    id v68 = v40;
    int v22 = objc_retainBlock(v67);

    [(GAXBackboard *)self setCheckingASAMValidity:1];
    if (!v10)
    {
      unsigned __int8 v33 = 0;
      if (![(GAXBackboard *)self isSelfLockedToAppWithIdentifier:v42]) {
        *((_DWORD *)v83 + 6) = 3;
      }
      goto LABEL_19;
    }
    id v23 = [v12 objectForKeyedSubscript:&off_4D818];
    uint64_t v24 = v23;
    if (!v23) {
      id v23 = &off_4D848;
    }
    id v25 = [v23 integerValue];
    v78[3] = (uint64_t)v25;

    uint64_t v26 = v78[3];
    long long v27 = *(_OWORD *)&a5->var0[4];
    long long v65 = *(_OWORD *)a5->var0;
    long long v66 = v27;
    int64_t v28 = [(GAXBackboard *)self effectiveASAMStyleForAppWithBundleIdentifier:v42 auditToken:&v65 desiredStyle:v26];
    v74[3] = v28;
    unsigned int v29 = [(GAXBackboard *)self appManager];
    CGFloat v30 = [v29 effectiveAppBundleIdentifier];

    uint64_t v31 = v74[3];
    long long v32 = *(_OWORD *)&a5->var0[4];
    long long v65 = *(_OWORD *)a5->var0;
    long long v66 = v32;
    unsigned __int8 v33 = [(GAXBackboard *)self appWithBundleIdentifier:v42 auditToken:&v65 isAuthorizedForASAMStyle:v31];
    if (v33)
    {
      if ([v30 isEqualToString:v42])
      {
LABEL_18:

LABEL_19:
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1F6DC;
        v49[3] = &unk_49BC8;
        BOOL v62 = v10;
        unsigned __int8 v63 = v33;
        v55 = &v82;
        id v56 = &v73;
        id v50 = v42;
        unsigned int v51 = self;
        id v35 = v41;
        id v52 = v35;
        v57 = &v77;
        long long v36 = *(_OWORD *)&a5->var0[4];
        long long v60 = *(_OWORD *)a5->var0;
        long long v61 = v36;
        long long v13 = v22;
        unsigned __int8 v64 = v17;
        id v54 = v13;
        id v58 = v81;
        id v53 = v12;
        objc_copyWeak(&v59, &location);
        unsigned int v37 = objc_retainBlock(v49);
        if (*((_DWORD *)v83 + 6))
        {
          AXPerformBlockAsynchronouslyOnMainThread();
        }
        else
        {
          unint64_t v38 = [(GAXBackboard *)self _SBServerQueryForAvailabilitySBParameters];
          CGPoint v39 = +[AXSpringBoardServer server];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_20804;
          v43[3] = &unk_49BF0;
          id v46 = v81;
          v43[4] = self;
          v47 = &v82;
          id v44 = v35;
          BOOL v48 = v10;
          int v45 = v37;
          [v39 systemAppInfoWithQuery:v38 completion:v43];
        }
        objc_destroyWeak(&v59);

        objc_destroyWeak(&v70);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);
        goto LABEL_23;
      }
      int v34 = 4;
    }
    else
    {
      int v34 = 1;
    }
    *((_DWORD *)v83 + 6) = v34;
    goto LABEL_18;
  }
  uint64_t v18 = GAXLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_2B160();
  }

  ((void (*)(void *, void, void))v13[2])(v13, 0, 0);
LABEL_23:

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v82, 8);
}

- (void)_applyUnmanagedSelfLockRestrictionsForStyle:(int64_t)a3
{
  [(GAXBackboard *)self setIsRestrictedForAAC:a3 == 1];
  id v6 = [(GAXBackboard *)self profileManager];
  unsigned int v5 = [(GAXBackboard *)self userInterfaceClient];
  [v6 applyUnmanagedSelfLockRestrictionsForStyle:a3 withUserInterfaceClient:v5];
}

- (void)_removeUnmanagedSelfLockRestrictions
{
  [(GAXBackboard *)self setIsRestrictedForAAC:0];
  id v4 = [(GAXBackboard *)self profileManager];
  long long v3 = [(GAXBackboard *)self userInterfaceClient];
  [v4 removeUnmanagedSelfLockRestrictionsWithUserInterfaceClient:v3];
}

- (id)_passcode
{
  long long v3 = [(GAXBackboard *)self passcodeHandle];

  if (!v3)
  {
    id v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_2B1C8();
    }
  }
  unsigned int v5 = [(GAXBackboard *)self passcodeHandle];
  id v6 = [v5 passcode];

  return v6;
}

- (void)_setPasscode:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXBackboard *)self passcodeHandle];

  if (!v5)
  {
    id v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_2B1C8();
    }
  }
  id v7 = [v4 length];
  BOOL v8 = [(GAXBackboard *)self passcodeHandle];
  unsigned int v9 = [v8 attemptToSetPasscode:v4];

  if (v9)
  {
    _AXSGuidedAccessSetHasPasscode();
    if (v7)
    {
      BOOL v10 = +[NSDate date];
    }
    else
    {
      BOOL v10 = 0;
    }
    unsigned __int8 v11 = [(GAXBackboard *)self settings];
    [v11 setLastPasscodeSetDate:v10];

    if (v7) {
  }
    }
}

- (BOOL)_hasPasscode
{
  id v2 = [(GAXBackboard *)self _passcode];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_isPasscodeStale
{
  if (![(GAXBackboard *)self _hasPasscode]) {
    return 1;
  }
  BOOL v3 = +[NSDate date];
  id v4 = [(GAXBackboard *)self settings];
  id v5 = [v4 lastPasscodeSetDate];

  if (!v5)
  {
    id v6 = [(GAXBackboard *)self settings];
    [v6 setLastPasscodeSetDate:v3];

    id v5 = v3;
  }
  id v7 = [(GAXBackboard *)self settings];
  BOOL v8 = [v7 lastActivationDate];

  if (!v8)
  {
    BOOL v8 = +[NSDate date];
  }
  [v8 timeIntervalSinceDate:v3];
  double v10 = fabs(v9);
  [v5 timeIntervalSinceDate:v3];
  BOOL v12 = fabs(v11) > *(double *)&GAXProfileStalePasscodeTimeInterval
     && v10 > *(double *)&GAXProfileStalePasscodeTimeInterval;

  return v12;
}

- (GAXSettings)settings
{
  return +[GAXSettings sharedInstance];
}

- (void)_performValidation
{
  id v2 = +[AXValidationManager sharedInstance];
  [v2 performValidations:&stru_49C30 withPreValidationHandler:&stru_49C50 postValidationHandler:&stru_49C90 safeCategoryInstallationHandler:&stru_49CD0];
}

- (id)_unarchivedIgnoredTouchRegionsWithDataArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    id v5 = (char *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = AX_CGPathCreateWithDataRepresentation();
          if (v10)
          {
            double v11 = (const void *)v10;
            if (!v7) {
              id v7 = (__CFArray *)objc_opt_new();
            }
            CFArrayAppendValue(v7, v11);
            CGPathRelease((CGPathRef)v11);
          }
          else
          {
            BOOL v12 = GAXLogCommon();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              sub_2B1FC(&v14, v15, v12);
            }
          }
        }
        id v6 = (char *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_persistInterestAreaPathsForStorageFromMessage:(id)a3 forInterfaceOrientation:(int)a4
{
  id v4 = *(id *)&a4;
  id v6 = a3;
  id v11 = v6;
  if (!v4)
  {
    id v7 = [v6 objectForKey:@"interface orientation"];
    id v4 = [v7 unsignedIntegerValue];

    id v6 = v11;
    if (!v4)
    {
      _AXAssert();
      id v6 = v11;
    }
  }
  uint64_t v8 = [v6 objectForKey:@"interest area paths for storage"];
  if (v8)
  {
    double v9 = (void *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      double v9 = 0;
    }
    uint64_t v10 = [(GAXBackboard *)self profileManager];
    [v10 setIgnoredTouchRegions:v9 forOrientation:v4];
  }
}

- (void)_applyAllowedStatesForRestrictions
{
  id v3 = [(GAXBackboard *)self profileManager];
  id v4 = [(GAXBackboard *)self appManager];
  id v5 = [v4 effectiveAppRestrictionIdentifiers];
  id v6 = [v3 statesForRestrictionsWithIdentifiers:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_212D4;
  v9[3] = &unk_49CF8;
  _OWORD v9[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = [v3 unappliedChangedStatesForRestrictions];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _OWORD v8[2] = sub_2134C;
  v8[3] = &unk_49CF8;
  v8[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
  [v3 clearUnappliedChangedStatesForRestrictions];
}

- (void)_applyChangedStatesForRestrictions
{
  id v3 = [(GAXBackboard *)self profileManager];
  id v4 = [(GAXBackboard *)self appManager];
  id v5 = [v3 unappliedChangedStatesForRestrictions];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_21494;
  v7[3] = &unk_49CF8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
  [v3 clearUnappliedChangedStatesForRestrictions];
}

- (void)_applyDeniedStatesForRestrictions
{
  id v3 = [(GAXBackboard *)self profileManager];
  id v4 = [(GAXBackboard *)self appManager];
  id v5 = [v4 effectiveAppRestrictionIdentifiers];
  id v6 = [v3 statesForRestrictionsWithIdentifiers:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _OWORD v8[2] = sub_215D4;
  v8[3] = &unk_49CF8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)_clearChangedStatesForRestrictions
{
  id v2 = [(GAXBackboard *)self profileManager];
  [v2 clearUnappliedChangedStatesForRestrictions];
}

- (void)_updateSessionAppForSingleAppMode
{
  id v2 = [(GAXBackboard *)self profileManager];
  id v3 = [v2 singleAppModeAppID];

  id v4 = +[NSMutableArray array];
  id v5 = +[LSApplicationRecord enumeratorWithOptions:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_16;
  }
  id v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v25;
  do
  {
    uint64_t v10 = 0;
    id v23 = v7;
    do
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
      [v4 addObject:v11];
      if (!v8)
      {
        BOOL v12 = [v11 bundleIdentifier];
        if ([v3 isEqualToString:v12])
        {

LABEL_10:
          unint64_t v20 = [v11 bundleIdentifier];
          id v8 = [v20 copy];

          goto LABEL_12;
        }
        [v11 iTunesMetadata];
        uint64_t v13 = v9;
        uint8_t v14 = v4;
        unsigned int v15 = v5;
        long long v17 = v16 = v3;
        long long v18 = [v17 itemName];
        unsigned int v19 = [v16 isEqualToString:v18];

        id v3 = v16;
        id v5 = v15;
        id v4 = v14;
        uint64_t v9 = v13;
        id v7 = v23;

        if (v19) {
          goto LABEL_10;
        }
        id v8 = 0;
      }
LABEL_12:
      uint64_t v10 = (char *)v10 + 1;
    }
    while (v7 != v10);
    id v7 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  }
  while (v7);
LABEL_16:
  id v21 = GAXLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v29 = v8;
    __int16 v30 = 2114;
    uint64_t v31 = v3;
    __int16 v32 = 2114;
    unsigned __int8 v33 = v4;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Updating session app for single app mode. final result: %{public}@ allowed app id: %{public}@ all installed apps: %{public}@", buf, 0x20u);
  }

  [(GAXBackboard *)self _updateSessionAppWithIdentifier:v8];
}

- (BOOL)_isRunningInStoreDemoMode
{
  CFStringRef v2 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v2)
  {
    CFStringRef v3 = v2;
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", v2, &keyExistsAndHasValidFormat);
    CFRelease(v3);
    if (keyExistsAndHasValidFormat) {
      BOOL v5 = AppBooleanValue == 0;
    }
    else {
      BOOL v5 = 1;
    }
    LOBYTE(v2) = !v5;
  }
  return (char)v2;
}

- (void)_updateSessionAppWithIdentifier:(id)a3
{
}

- (void)_updateSessionAppWithIdentifier:(id)a3 notifyUserInterfaceServer:(BOOL)a4 sessionAppIdentifierDidChange:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = GAXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Updating session app bundle ID to %{public}@.", buf, 0xCu);
  }

  uint64_t v10 = [(GAXBackboard *)self appManager];
  unsigned __int8 v11 = [v10 appWithIdentifierIsASessionApp:v8];
  unsigned __int8 v12 = v11;
  if (v8 && (v11 & 1) == 0)
  {
    id v20 = v8;
    uint64_t v13 = +[NSArray arrayWithObjects:&v20 count:1];
    [v10 updateSessionAppBundleIdentifiers:v13];
  }
  char v14 = v12 | !a4;
  if ((v14 & 1) == 0)
  {
    if (v8)
    {
      id v19 = v8;
      uint64_t v15 = +[NSArray arrayWithObjects:&v19 count:1];
    }
    else
    {
      uint64_t v15 = +[NSNumber numberWithBool:0];
    }
    long long v16 = (void *)v15;
    id v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v15, @"session application identifiers", 0);
    long long v18 = [(GAXBackboard *)self userInterfaceClient];
    [v18 sendAsynchronousMessage:v17 withIdentifier:3 targetAccessQueue:0 completion:0];
  }
  if (a5) {
    *a5 = v14 ^ 1;
  }
}

- (unsigned)_previousModeIgnoringWorkspace:(BOOL)a3
{
  id v4 = [(GAXBackboard *)self modeHistory];
  id v5 = [v4 count];
  if ((unint64_t)v5 < 2)
  {
LABEL_6:
    unsigned int v9 = 0;
  }
  else
  {
    id v6 = v5;
    uint64_t v7 = 1;
    while (1)
    {
      id v8 = [v4 objectAtIndexedSubscript:v7];
      unsigned int v9 = [v8 intValue];

      if (v9 != 1 || !a3) {
        break;
      }
      if (v6 == (id)++v7) {
        goto LABEL_6;
      }
    }
  }

  return v9;
}

- (void)_updateRestrictedState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21DCC;
  block[3] = &unk_49D20;
  void block[4] = self;
  void block[5] = &v14;
  BOOL v13 = a3;
  dispatch_sync(gaxStateAccessQueue, block);
  id v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "GAX restriction state did change: %{public}@", buf, 0xCu);
  }
  id v8 = [(GAXBackboard *)self userInterfaceClient];
  unsigned int v9 = v8;
  if (v3) {
    uint64_t v10 = 14;
  }
  else {
    uint64_t v10 = 15;
  }
  [v8 sendAsynchronousMessage:0 withIdentifier:v10 targetAccessQueue:0 completion:0];

  if (v3)
  {
    unsigned __int8 v11 = [(GAXBackboard *)self eventProcessor];
    [v11 beginHandlingSystemEventsForReason:@"GAX Restricted"];
LABEL_10:

    goto LABEL_11;
  }
  if (*((unsigned char *)v15 + 24))
  {
    unsigned __int8 v11 = [(GAXBackboard *)self eventProcessor];
    [v11 endHandlingSystemEventsForReason:@"GAX Restricted"];
    goto LABEL_10;
  }
LABEL_11:
  _Block_object_dispose(&v14, 8);
}

- (void)effectiveAppDidChange:(id)a3 withAppManager:(id)a4
{
}

- (void)effectiveAppDidBecomeInvalidWithAppManager:(id)a3
{
  if ([(GAXBackboard *)self isInWorkspace])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_21E88;
    block[3] = &unk_48928;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)purpleBuddyDidTerminateWithAppManager:(id)a3
{
  id v3 = [(GAXBackboard *)self integrityVerifier];
  [v3 verifyIntegrityWithEvent:9];
}

- (BOOL)_hasTimeRestrictionExpired
{
  CFStringRef v2 = +[GAXSettings sharedInstance];
  unsigned __int8 v3 = [v2 timeRestrictionHasExpired];

  return v3;
}

- (void)_setTimeRestrictionHasExpired:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[GAXSettings sharedInstance];
  [v5 setTimeRestrictionHasExpired:v3];

  id v6 = [(GAXBackboard *)self eventProcessor];
  [v6 setForceDisableLockButton:v3];

  id v7 = +[AXSpringBoardServer server];
  [v7 gaxTimeRestrictionStatusDidChange];
}

- (void)timeDidExpireForTimeRestriction:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22058;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  BOOL v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_2B23C();
  }
}

- (void)timeRestrictionWasCancelled:(id)a3
{
  BOOL v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_2B270();
  }
}

- (void)timeAlarmDidOccurForTimeRestriction:(id)a3
{
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2B2A4();
  }

  id v5 = [(GAXBackboard *)self profileManager];
  id v6 = [v5 timeRestrictionsEnabled];
  id v7 = [(GAXBackboard *)self timeRestrictionManager];
  -[GAXBackboard _showAlertWithTextType:asBanner:isUrgent:timeRestrictionsEnabled:remainingTime:](self, "_showAlertWithTextType:asBanner:isUrgent:timeRestrictionsEnabled:remainingTime:", 3, 1, 0, v6, [v7 remainingTimeInSeconds]);
}

- (id)profileManagerSessionAppID:(id)a3
{
  id v4 = [(GAXBackboard *)self appManager];
  id v5 = [v4 sessionAppBundleIdentifiers];
  id v6 = [v5 firstObject];

  if (!v6)
  {
    id v7 = [(GAXBackboard *)self appManager];
    id v6 = [v7 effectiveAppBundleIdentifier];
  }

  return v6;
}

- (BOOL)_gaxShouldRemainEnabledByManagedConfiguration
{
  CFStringRef v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveWhitelistedAppsAndOptions];

  id v4 = +[MCProfileConnection sharedConnection];
  id v5 = [v4 autonomousSingleAppModePermittedBundleIDs];

  if ([v3 count]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 count] != 0;
  }

  return v6;
}

- (void)didEnterSingleAppModeWithProfileManager:(id)a3
{
  _AXSGuidedAccessSetEnabledByManagedConfiguration();
  id v4 = +[AXSpringBoardServer server];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_225FC;
  v5[3] = &unk_49460;
  v5[4] = self;
  [v4 screenLockStatus:v5 passcodeStatusRequired:1];
}

- (void)appDidChangeForSingleAppModeWithProfileManager:(id)a3
{
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2B2D8();
  }

  id v5 = +[AXSpringBoardServer server];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2274C;
  v6[3] = &unk_49460;
  v6[4] = self;
  [v5 screenLockStatus:v6 passcodeStatusRequired:1];
}

- (void)didExitSingleAppModeWithProfileManager:(id)a3
{
  [(GAXBackboard *)self setAppLaunchGeneration:(char *)[(GAXBackboard *)self appLaunchGeneration] + 1];
  int v4 = _AXSGuidedAccessEnabledByManagedConfiguration();
  if (![(GAXBackboard *)self _gaxShouldRemainEnabledByManagedConfiguration])_AXSGuidedAccessSetEnabledByManagedConfiguration(); {
  id v5 = GAXLogCommon();
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2B30C();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_228E0;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  char v6 = [(GAXBackboard *)self axFeatureManager];
  [v6 restoreAccessibilityFeatures];

  if (v4) {
    _AXSGuidedAccessSetEnabled();
  }
}

- (void)didEnterAppSelfLockModeWithProfileManager:(id)a3
{
  BOOL v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_2B340();
  }

  _AXSGuidedAccessSetEnabledByManagedConfiguration();
}

- (void)appDidChangeForAppSelfLockModeWithProfileManager:(id)a3
{
  int v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2B374();
  }

  id v5 = [(GAXBackboard *)self profileManager];
  unsigned int v6 = [v5 configuration];

  if (v6 != 3) {
    _AXAssert();
  }
  if ([(GAXBackboard *)self isActive])
  {
    id v7 = +[GAXSettings sharedInstance];
    id v8 = [v7 activeAppID];
    if ([(GAXBackboard *)self appIsAllowedToSelfLock:v8])
    {
    }
    else
    {
      unsigned int v9 = +[GAXSettings sharedInstance];
      unsigned __int8 v10 = [v9 selfLockUnmanaged];

      if ((v10 & 1) == 0)
      {
        unsigned __int8 v11 = +[GAXSettings sharedInstance];
        [v11 setActiveAppSelfLocked:0];

        unsigned __int8 v12 = +[GAXSettings sharedInstance];
        [v12 setSelfLockUnmanaged:0];

        [(GAXBackboard *)self setAppLaunchGeneration:(char *)[(GAXBackboard *)self appLaunchGeneration] + 1];
        [(GAXBackboard *)self removeReasonToBlockAllEvents:@"GAX verifying app relaunch"];
        [(GAXBackboard *)self _transitionToMode:0 requireUserUnlock:0];
        [(GAXBackboard *)self _updateRestrictedState:0];
      }
    }
  }
}

- (void)didExitAppSelfLockModeWithProfileManager:(id)a3
{
  [(GAXBackboard *)self setAppLaunchGeneration:(char *)[(GAXBackboard *)self appLaunchGeneration] + 1];
  [(GAXBackboard *)self removeReasonToBlockAllEvents:@"GAX verifying app relaunch"];
  int v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2B3A8();
  }

  if (![(GAXBackboard *)self _gaxShouldRemainEnabledByManagedConfiguration])_AXSGuidedAccessSetEnabledByManagedConfiguration(); {
  block[0] = _NSConcreteStackBlock;
  }
  block[1] = 3221225472;
  block[2] = sub_22BE4;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)pauseVerificationForProfileManager:(id)a3
{
  id v3 = [(GAXBackboard *)self integrityVerifier];
  [v3 pause];
}

- (void)resumeVerificationForProfileManager:(id)a3
{
  id v3 = [(GAXBackboard *)self integrityVerifier];
  [v3 resume];
}

- (void)_handleSubstationalTransition
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22D64;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleLostModeChanged
{
  id v3 = +[FMDFMIPManager sharedInstance];
  -[GAXBackboard setIsLostModeActive:](self, "setIsLostModeActive:", [v3 lostModeIsActive]);

  int v4 = GAXLogIntegrity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = [(GAXBackboard *)self isLostModeActive];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Lost Mode status changed: %i", buf, 8u);
  }

  if (![(GAXBackboard *)self isLostModeActive])
  {
    id v5 = [(GAXBackboard *)self profileManager];
    unsigned int v6 = [v5 configuration];

    if (v6 == 3)
    {
      id v7 = +[GAXSettings sharedInstance];
      id v8 = [v7 savedASAMAppIdForLostMode];

      unsigned int v9 = GAXLogIntegrity();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Using saved ASAM App ID: %@", buf, 0xCu);
        }

        unsigned int v9 = [(GAXBackboard *)self appManager];
        uint64_t v14 = v8;
        unsigned __int8 v11 = +[NSArray arrayWithObjects:&v14 count:1];
        [v9 updateSessionAppBundleIdentifiers:v11];
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No saved ASAM App ID to restore.", buf, 2u);
      }
    }
  }
  unsigned __int8 v12 = [(GAXBackboard *)self integrityVerifier];
  [v12 verifyIntegrityWithEvent:17];

  BOOL v13 = +[GAXSettings sharedInstance];
  [v13 setSavedASAMAppIdForLostMode:0];
}

- (void)_handleInPreBoardScenarioUpdated
{
  int v3 = AXInPreboardScenario();
  int v4 = GAXLogIntegrity();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "PreBoard scenario updated, but PreBoard is running.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "PreBoard did finish.", v8, 2u);
    }

    unsigned int v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(GAXBackboard *)self preBoardDidFinishObserverToken];
    [v6 removeObserver:v7];

    [(GAXBackboard *)self setPreBoardDidFinishObserverToken:0];
    int v4 = [(GAXBackboard *)self integrityVerifier];
    [v4 verifyIntegrityWithEvent:11];
  }
}

- (void)_handleInCheckerBoardScenarioUpdated
{
  int v3 = AXInCheckerBoardScenario();
  int v4 = GAXLogIntegrity();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CheckerBoard scenario updated, but CheckerBoard is running.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CheckerBoard did finish.", v8, 2u);
    }

    unsigned int v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(GAXBackboard *)self checkerBoardDidFinishObserverToken];
    [v6 removeObserver:v7];

    [(GAXBackboard *)self setCheckerBoardDidFinishObserverToken:0];
    int v4 = [(GAXBackboard *)self integrityVerifier];
    [v4 verifyIntegrityWithEvent:12];
  }
}

- (void)presentStandardActiveTopBanner
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_235C8;
  block[3] = &unk_48928;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)wantsSingleAppMode
{
  CFStringRef v2 = [(GAXBackboard *)self profileManager];
  BOOL v3 = [v2 configuration] == 2;

  return v3;
}

- (BOOL)wantsAppSelfLockMode
{
  CFStringRef v2 = +[GAXSettings sharedInstance];
  unsigned __int8 v3 = [v2 isActiveAppSelfLocked];

  return v3;
}

- (BOOL)wantsSingleAppModeOrAppSelfLockMode
{
  if ([(GAXBackboard *)self wantsSingleAppMode]) {
    return 1;
  }

  return [(GAXBackboard *)self wantsAppSelfLockMode];
}

- (BOOL)appIsAllowedToSelfLock:(id)a3
{
  id v3 = a3;
  int v4 = +[MCProfileConnection sharedConnection];
  BOOL v5 = [v4 autonomousSingleAppModePermittedBundleIDs];
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

- (void)homeClickSwallowedInSpringBoard
{
  [(GAXBackboard *)self gaxState];
  CFStringRef v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v4 = 0;
    __int16 v5 = 1024;
    int v6 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Home click swallowed in SpringBoard. Mode: %i, allows exit: %i", buf, 0xEu);
  }
}

- (void)didEnableSystemAppAccess
{
  id v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "System app access was enabled.", v5, 2u);
  }

  int v4 = [(GAXBackboard *)self integrityVerifier];
  [v4 verifyIntegrityWithEvent:10];
}

- (id)_debugGAXDescription
{
  id v3 = +[NSMutableString stringWithString:@"\n************************************\n"];
  objc_msgSend(v3, "appendFormat:", @"GAX Backboard: %p\n", self);
  [(GAXBackboard *)self gaxState];
  int v4 = gaxDebugDescriptionForGAXBackboardState(v8);
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @"Wants Single App Mode:%ld\n", -[GAXBackboard wantsSingleAppMode](self, "wantsSingleAppMode"));
  objc_msgSend(v3, "appendFormat:", @"Wants App Self-lock mode:%ld\n", -[GAXBackboard wantsAppSelfLockMode](self, "wantsAppSelfLockMode"));
  __int16 v5 = +[GAXSettings sharedInstance];
  [v3 appendFormat:@"GAX Settings:\n%@\n", v5];

  int v6 = [(GAXBackboard *)self appManager];
  [v3 appendFormat:@"GAX Apps:\n%@\n", v6];

  [v3 appendString:@"\n************************************\n"];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(GAXBackboard *)self _debugGAXDescription];
}

- (void)handleGuidedAccessAutomationCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = GAXLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2B5E8();
    }

    uint64_t v15 = 0;
    goto LABEL_31;
  }
  id v8 = +[GAXAutomationCommand commandWithData:v6];
  unsigned int v9 = GAXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_2B57C();
  }

  if (!v8)
  {
    uint64_t v16 = GAXLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2B4B0();
    }
    goto LABEL_13;
  }
  BOOL v10 = [v8 command];
  unsigned int v11 = [v10 isEqualToString:GAXUIACommandQueryGAXMode];

  if (v11)
  {
    uint64_t v67 = 0;
    id v68 = &v67;
    uint64_t v69 = 0x2020000000;
    int v70 = 0;
    gaxStateAccessQueue = self->_gaxStateAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_24394;
    block[3] = &unk_494B0;
    void block[4] = self;
    void block[5] = &v67;
    dispatch_sync(gaxStateAccessQueue, block);
    BOOL v13 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v68 + 6)];
    [v8 setResult:v13];
LABEL_7:

    _Block_object_dispose(&v67, 8);
LABEL_29:
    char v31 = 0;
    goto LABEL_30;
  }
  char v17 = [v8 command];
  unsigned int v18 = [v17 isEqualToString:GAXUIACommandSetGAXMode];

  if (v18)
  {
    id v19 = [v8 parameters];
    id v20 = [v19 objectForKeyedSubscript:@"mode"];

    if ([(__CFString *)v20 isEqualToString:@"Active"])
    {
      unsigned int v21 = 2;
    }
    else if ([(__CFString *)v20 isEqualToString:@"Disabled"])
    {
      unsigned int v21 = 0;
    }
    else
    {
      unsigned int v21 = [(__CFString *)v20 isEqualToString:@"Workspace"];
    }
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_243A8;
    v64[3] = &unk_495A0;
    v64[4] = self;
    unsigned int v65 = v21;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v64);
LABEL_28:

    goto LABEL_29;
  }
  id v22 = [v8 command];
  unsigned int v23 = [v22 isEqualToString:GAXUIACommandQueryGAXProfileConfiguration];

  if (v23)
  {
    uint64_t v67 = 0;
    id v68 = &v67;
    uint64_t v69 = 0x2020000000;
    int v70 = 0;
    long long v24 = self->_gaxStateAccessQueue;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_243BC;
    v63[3] = &unk_494B0;
    v63[4] = self;
    v63[5] = &v67;
    dispatch_sync(v24, v63);
    BOOL v13 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v68 + 6)];
    [v8 setResult:v13];
    goto LABEL_7;
  }
  long long v25 = [v8 command];
  unsigned int v26 = [v25 isEqualToString:GAXUIACommandQuerySessionAppBundleID];

  if (v26)
  {
    long long v27 = [(GAXBackboard *)self appManager];
    int64_t v28 = [v27 sessionAppBundleIdentifiers];
    id v29 = [v28 firstObject];

    if (v29) {
      __int16 v30 = v29;
    }
    else {
      __int16 v30 = GAXUIACommandResultNull;
    }
    [v8 setResult:v30];

    goto LABEL_29;
  }
  __int16 v32 = [v8 command];
  unsigned int v33 = [v32 isEqualToString:GAXUIACommandQueryEffectiveAppBundleID];

  if (v33)
  {
    int v34 = [(GAXBackboard *)self appManager];
    id v20 = [v34 effectiveAppBundleIdentifier];

    if (v20) {
      id v35 = v20;
    }
    else {
      id v35 = GAXUIACommandResultNull;
    }
    [v8 setResult:v35];
    goto LABEL_28;
  }
  long long v36 = [v8 command];
  unsigned int v37 = [v36 isEqualToString:GAXUIACommandQueryPasscode];

  if (v37)
  {
    uint64_t v38 = [(GAXBackboard *)self _passcode];
LABEL_40:
    uint64_t v16 = v38;
    [v8 setResult:v38];
LABEL_13:

    goto LABEL_29;
  }
  CGPoint v39 = [v8 command];
  unsigned int v40 = [v39 isEqualToString:GAXUIACommandSetPasscode];

  if (v40)
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_243D0;
    v61[3] = &unk_49018;
    v61[4] = self;
    id v41 = v8;
    id v62 = v41;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v61);
    [v41 setResult:GAXUIACommandResultOK];

    goto LABEL_29;
  }
  id v42 = [v8 command];
  unsigned int v43 = [v42 isEqualToString:GAXUIACommandQueryIsAppLayoutMultiApp];

  if (v43)
  {
    uint64_t v16 = [(GAXBackboard *)self appManager];
    id v44 = +[NSNumber numberWithBool:[v16 appLayoutIsMultiApp]];
    [v8 setResult:v44];

    goto LABEL_13;
  }
  int v45 = [v8 command];
  unsigned int v46 = [v45 isEqualToString:GAXUIACommandQueryIsKeyboardInputAllowed];

  if (v46)
  {
    [(GAXBackboard *)self gaxState];
    uint64_t v38 = +[NSNumber numberWithUnsignedInt:(v60 >> 18) & 1];
    goto LABEL_40;
  }
  v47 = [v8 command];
  unsigned int v48 = [v47 isEqualToString:GAXUIACommandSetKeyboardInputAllowed];

  if (v48)
  {
    objc_super v49 = [v8 parameters];
    id v50 = [v49 objectForKeyedSubscript:@"enabled"];

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_2443C;
    v58[3] = &unk_49018;
    v58[4] = self;
    id v59 = v50;
    uint64_t v16 = v50;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v58);
    [v8 setResult:GAXUIACommandResultOK];

    goto LABEL_13;
  }
  unsigned int v51 = [v8 command];
  unsigned int v52 = [v51 isEqualToString:GAXUIACommandQueryIsMediaPlaying];

  if (!v52)
  {
    id v54 = +[NSString stringWithFormat:@"Did not understand this automation command: %@", v8];
    [v8 setErrorMessage:v54];

    uint64_t v16 = GAXLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2B4E4(v8, v16);
    }
    goto LABEL_13;
  }
  id v53 = +[AXSpringBoardServer server];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_244AC;
  v55[3] = &unk_49D48;
  id v56 = v8;
  id v57 = v7;
  [v53 isMediaPlayingForApp:0 completionHandler:v55];

  char v31 = 1;
LABEL_30:
  uint64_t v15 = [v8 data];

  if ((v31 & 1) == 0) {
LABEL_31:
  }
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
}

- (unint64_t)currentGuidedAccessModeForBackboardServer
{
  if (![(GAXBackboard *)self isActive]) {
    return 0;
  }
  if ([(GAXBackboard *)self wantsAppSelfLockMode]) {
    return 2;
  }
  if ([(GAXBackboard *)self wantsSingleAppMode]) {
    return 3;
  }
  return 1;
}

- (id)currentSessionApp
{
  CFStringRef v2 = [(GAXBackboard *)self appManager];
  id v3 = [v2 sessionAppBundleIdentifiers];
  int v4 = [v3 firstObject];

  return v4;
}

- (GAXBackboardServer)backboardServer
{
  return self->_backboardServer;
}

- (void)setBackboardServer:(id)a3
{
}

- (AXUIClient)userInterfaceClient
{
  return self->_userInterfaceClient;
}

- (void)setUserInterfaceClient:(id)a3
{
}

- (id)springboardDiedObserverToken
{
  return self->_springboardDiedObserverToken;
}

- (void)setSpringboardDiedObserverToken:(id)a3
{
}

- (id)preBoardDidFinishObserverToken
{
  return self->_preBoardDidFinishObserverToken;
}

- (void)setPreBoardDidFinishObserverToken:(id)a3
{
}

- (id)checkerBoardDidFinishObserverToken
{
  return self->_checkerBoardDidFinishObserverToken;
}

- (void)setCheckerBoardDidFinishObserverToken:(id)a3
{
}

- (GAXAppManager)appManager
{
  return self->_appManager;
}

- (void)setAppManager:(id)a3
{
}

- (GAXProfileManager)profileManager
{
  return self->_profileManager;
}

- (void)setProfileManager:(id)a3
{
}

- (GAXTimeRestrictionManager)timeRestrictionManager
{
  return self->_timeRestrictionManager;
}

- (void)setTimeRestrictionManager:(id)a3
{
}

- (GAXAccessibilityFeatureManager)axFeatureManager
{
  return self->_axFeatureManager;
}

- (void)setAxFeatureManager:(id)a3
{
}

- (GAXVerifier)integrityVerifier
{
  return self->_integrityVerifier;
}

- (void)setIntegrityVerifier:(id)a3
{
}

- (AXPasscodeAccessor)passcodeHandle
{
  return self->_passcodeHandle;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)shouldStartSessionUponFrontmostAppChanged
{
  return self->_shouldStartSessionUponFrontmostAppChanged;
}

- (unsigned)desiredModeAfterSuccessfulPasscodeEntry
{
  return self->_desiredModeAfterSuccessfulPasscodeEntry;
}

- (void)setDesiredModeAfterSuccessfulPasscodeEntry:(unsigned int)a3
{
  self->_desiredModeAfterSuccessfulPasscodeEntrdouble y = a3;
}

- (unint64_t)passcodeEntryFailedCount
{
  return self->_passcodeEntryFailedCount;
}

- (void)setPasscodeEntryFailedCount:(unint64_t)a3
{
  self->_passcodeEntryFailedCFIndex Count = a3;
}

- (double)lastLockoutStartedTimeInterval
{
  return self->_lastLockoutStartedTimeInterval;
}

- (void)setLastLockoutStartedTimeInterval:(double)a3
{
  self->_lastLockoutStartedTimeInterval = a3;
}

- (BOOL)wasEverActiveInCurrentFrontmostApp
{
  return self->_wasEverActiveInCurrentFrontmostApp;
}

- (void)setWasEverActiveInCurrentFrontmostApp:(BOOL)a3
{
  self->_wasEverActiveInCurrentFrontmostApp = a3;
}

- (AXAccessQueueTimer)substantialTransitionTimer
{
  return self->_substantialTransitionTimer;
}

- (void)setSubstantialTransitionTimer:(id)a3
{
}

- (BOOL)isApplicationBeingInstalled
{
  return self->_isApplicationBeingInstalled;
}

- (void)setIsApplicationBeingInstalled:(BOOL)a3
{
  self->_isApplicationBeingInstalled = a3;
}

- (GAXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (NSString)eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (void)setEventTapIdentifier:(id)a3
{
}

- (NSArray)ignoredTouchRegions
{
  return self->_ignoredTouchRegions;
}

- (void)setIgnoredTouchRegions:(id)a3
{
}

- (NSMutableArray)modeHistory
{
  return self->_modeHistory;
}

- (void)setModeHistory:(id)a3
{
}

- (double)lastAlertDisplayedTimeInterval
{
  return self->_lastAlertDisplayedTimeInterval;
}

- (void)setLastAlertDisplayedTimeInterval:(double)a3
{
  self->_lastAlertDisplayedTimeInterval = a3;
}

- (int)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setActiveInterfaceOrientation:(int)a3
{
  self->_activeInterfaceOrientation = a3;
}

- (AXAssertion)disableSystemGesturesForActiveAssertion
{
  return self->_disableSystemGesturesForActiveAssertion;
}

- (void)setDisableSystemGesturesForActiveAssertion:(id)a3
{
}

- (AXAssertion)disableSystemGesturesForASAMStartAssertion
{
  return self->_disableSystemGesturesForASAMStartAssertion;
}

- (void)setDisableSystemGesturesForASAMStartAssertion:(id)a3
{
}

- (AXDispatchTimer)unmanagedASAMFailsafeTimer
{
  return self->_unmanagedASAMFailsafeTimer;
}

- (void)setUnmanagedASAMFailsafeTimer:(id)a3
{
}

- (AXDispatchTimer)appLaunchFailureDetectionTimer
{
  return self->_appLaunchFailureDetectionTimer;
}

- (void)setAppLaunchFailureDetectionTimer:(id)a3
{
}

- (BOOL)checkingASAMValidity
{
  return self->_checkingASAMValidity;
}

- (void)setCheckingASAMValidity:(BOOL)a3
{
  self->_checkingASAMValiditdouble y = a3;
}

- (NSMutableSet)reasonsToBlockAllEvents
{
  return self->_reasonsToBlockAllEvents;
}

- (void)setReasonsToBlockAllEvents:(id)a3
{
}

- (unint64_t)appLaunchGeneration
{
  return self->_appLaunchGeneration;
}

- (void)setAppLaunchGeneration:(unint64_t)a3
{
  self->_appLaunchGeneration = a3;
}

- (NSMutableDictionary)clientPortsToBundleIds
{
  return self->_clientPortsToBundleIds;
}

- (void)setClientPortsToBundleIds:(id)a3
{
}

- (int64_t)effectiveASAMStyle
{
  return self->_effectiveASAMStyle;
}

- (void)setEffectiveASAMStyle:(int64_t)a3
{
  self->_effectiveASAMStyle = a3;
}

- (BOOL)isRestrictedForAAC
{
  return self->_isRestrictedForAAC;
}

- (void)setIsRestrictedForAAC:(BOOL)a3
{
  self->_isRestrictedForAAC = a3;
}

- (BOOL)isLostModeActive
{
  return self->_isLostModeActive;
}

- (void)setIsLostModeActive:(BOOL)a3
{
  self->_BOOL isLostModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPortsToBundleIds, 0);
  objc_storeStrong((id *)&self->_reasonsToBlockAllEvents, 0);
  objc_storeStrong((id *)&self->_appLaunchFailureDetectionTimer, 0);
  objc_storeStrong((id *)&self->_unmanagedASAMFailsafeTimer, 0);
  objc_storeStrong((id *)&self->_disableSystemGesturesForASAMStartAssertion, 0);
  objc_storeStrong((id *)&self->_disableSystemGesturesForActiveAssertion, 0);
  objc_storeStrong((id *)&self->_modeHistory, 0);
  objc_storeStrong((id *)&self->_ignoredTouchRegions, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_substantialTransitionTimer, 0);
  objc_storeStrong((id *)&self->_passcodeHandle, 0);
  objc_storeStrong((id *)&self->_integrityVerifier, 0);
  objc_storeStrong((id *)&self->_axFeatureManager, 0);
  objc_storeStrong((id *)&self->_timeRestrictionManager, 0);
  objc_storeStrong((id *)&self->_profileManager, 0);
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_storeStrong(&self->_checkerBoardDidFinishObserverToken, 0);
  objc_storeStrong(&self->_preBoardDidFinishObserverToken, 0);
  objc_storeStrong(&self->_springboardDiedObserverToken, 0);
  objc_storeStrong((id *)&self->_userInterfaceClient, 0);
  objc_storeStrong((id *)&self->_backboardServer, 0);
  objc_storeStrong((id *)&self->_launchServiceAccessQueue, 0);

  objc_storeStrong((id *)&self->_gaxStateAccessQueue, 0);
}

@end