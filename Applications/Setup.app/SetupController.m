@interface SetupController
+ (void)initialize;
- (BOOL)_canShortCircuitGreen;
- (BOOL)_didRestoreIniTunes;
- (BOOL)_doesRestartFlowCauseErase;
- (BOOL)_hasLocaleAndLanguage;
- (BOOL)_isBackInBuddyAfterRestoreFromBackup:(BOOL)a3;
- (BOOL)_isBackInBuddyForActivationOnly;
- (BOOL)_restoreFromBackupJustFinished;
- (BOOL)_userSelectedLocale:(id)a3 localePaneScrollOffset:(double)a4;
- (BOOL)airplaneModeEnabled;
- (BOOL)allowDismissalForExit;
- (BOOL)applyingProximitySettings;
- (BOOL)doesTapFreeSetupAffectsClass:(Class)a3;
- (BOOL)hasCloudConfiguration;
- (BOOL)initialAnimateLanguageChoiceValue;
- (BOOL)initialDisplayZoomRestartValue;
- (BOOL)isAlertPresented:(id)a3;
- (BOOL)isFirstRunWithoutCloudConfiguration;
- (BOOL)isLanguageSet;
- (BOOL)isTeslaEnrolled;
- (BOOL)launchedForMigration;
- (BOOL)markBuddyCompleteDidRun;
- (BOOL)shouldBeginMigration;
- (BOOL)shouldBeginRestore;
- (BOOL)shouldEndLifecycleForCause:(unint64_t)a3;
- (BOOL)shouldLaunchSuspendTaskURL;
- (BOOL)shouldProceedFromAppearancePane;
- (BOOL)shouldRereadCloudConfigurationForControllersToSkip;
- (BOOL)shouldTapFreeSetupSkipControllerClass:(Class)a3;
- (BOOL)updateLanguageLocale:(id)a3;
- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5;
- (BOOL)willRestartFlowToViewController:(id)a3;
- (BOOL)willSetUpAsNew;
- (BYEnvironment)environment;
- (BYGreenController)greenController;
- (BuddyFlowDiverter)flowDiverter;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyFlowProducer)fundamentalFlow;
- (BuddyFundamentalFlowStartupProvider)startupProvider;
- (BuddyInactivityTimer)inactivityTimer;
- (BuddyLanguageLocaleSelectionReceiver)languageLocaleReceiver;
- (BuddyMiscState)miscState;
- (BuddyNavigationAnalytics)navigationAnalytics;
- (BuddyNavigationFlowController)navigationFlowController;
- (BuddyProximityPairingController)proximityPairingController;
- (BuddyRemoteManagementProvider)remoteManagementProvider;
- (BuddyRestoreProvider)restoreProvider;
- (BuddySetupAnalytics)setupAnalytics;
- (FBSDisplayLayoutMonitor)monitor;
- (NSArray)preferredLanguagesAtStartup;
- (NSArray)viewControllersToRemoveOnPush;
- (NSData)defaultAccessibilitySettings;
- (NSString)userSelectedLanguage;
- (NSString)userSelectedLanguageWithLocale;
- (OS_nw_path_monitor)pathMonitor;
- (SetupController)init;
- (UIViewController)backgroundViewController;
- (UIViewController)topViewControllerForRemoving;
- (WFNetworkListController)modalWifiManager;
- (id)_stringForStartupCause:(unint64_t)a3;
- (id)cloudConfigurationChangeNotificationObserver;
- (id)navigationController;
- (unint64_t)cachedStartupCause;
- (unint64_t)intendedRestoreType;
- (unint64_t)restoreType;
- (unint64_t)startupCause;
- (void)TFDEPPollTimerFired:(id)a3;
- (void)_addSBAlertItemsSupressionAssertion;
- (void)_commitAnalytics;
- (void)_connectedToWiFiAfterProximity;
- (void)_createNavigationController;
- (void)_exitBuddyForDemoSetUp;
- (void)_initializeGreen;
- (void)_languageChangeAlertDone;
- (void)_localeChanged;
- (void)_menuButtonPressed;
- (void)_modalWifiControllerDone:(id)a3;
- (void)_networkPathChanged;
- (void)_persistAnalyticsForLanguageReboot;
- (void)_persistAnalyticsForSoftwareUpdate;
- (void)_populatePowerLogAnalytics;
- (void)_populateSetupAnalytics;
- (void)_preCommitAnalytics;
- (void)_preStashAnalytics;
- (void)_preflightDispositionValidationWithControllerClass:(Class)a3;
- (void)_prepareForCloudRestoreReboot;
- (void)_prepareForDeviceMigrationAfterSoftwareUpdate:(BOOL)a3;
- (void)_prepareForMigrationReboot;
- (void)_refreshLanguage;
- (void)_removeSBAlertItemsSupressionAssertion;
- (void)_setupAnalytics;
- (void)_setupAndStartReturnToServiceIfNeeded;
- (void)_setupSnapshotRemoved;
- (void)_setupStateChanged;
- (void)_showMiniAlertWithRestart:(BOOL)a3 withLanguage:(id)a4;
- (void)_showModalWiFiSettings;
- (void)_startDeviceMigration;
- (void)_stashAnalytics;
- (void)_updateLoadingStatus;
- (void)_willEndLifecycleForDataTransfer;
- (void)_writeGreenInformedDefaultPlistIfNecessary;
- (void)_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:(id)a3;
- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4;
- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3;
- (void)checkForUpdatedCarrierBundle;
- (void)checkMiniBuddyBreadcrumbs;
- (void)dealloc;
- (void)dialerDidDismiss:(id)a3;
- (void)didApplyProximitySettingsWithWillReboot:(id)a3;
- (void)didBecomeActive;
- (void)didEnterBackground;
- (void)didMarkBuddyComplete;
- (void)didRestartFlow;
- (void)disableTapFreeSetUp;
- (void)dismissAlert:(id)a3 animated:(BOOL)a4;
- (void)dismissAlert:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissProximityPinCode;
- (void)displayIncompatibleProximityPairingFromDeviceClass:(id)a3;
- (void)displayProximityPinCode:(id)a3 language:(id)a4 visual:(BOOL)a5 accessibilitySettings:(id)a6;
- (void)displayUpdateRequiredToMigrate;
- (void)endAdvertisingProximitySetup;
- (void)endLifecycleDueToCause:(unint64_t)a3;
- (void)handleDebugGesture;
- (void)markBuddyComplete;
- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5;
- (void)prepareWithCompletion:(id)a3;
- (void)presentWiFiSettingsModally;
- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToPairingWithPin:(id)a4;
- (void)respring;
- (void)runWithScene:(id)a3;
- (void)setAllowDismissalForExit:(BOOL)a3;
- (void)setApplyingProximitySettings:(BOOL)a3;
- (void)setBackgroundViewController:(id)a3;
- (void)setCachedStartupCause:(unint64_t)a3;
- (void)setCloudConfigurationChangeNotificationObserver:(id)a3;
- (void)setDefaultAccessibilitySettings:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFlowDiverter:(id)a3;
- (void)setFundamentalFlow:(id)a3;
- (void)setGreenController:(id)a3;
- (void)setInactivityTimer:(id)a3;
- (void)setInitialAnimateLanguageChoiceValue:(BOOL)a3;
- (void)setInitialDisplayZoomRestartValue:(BOOL)a3;
- (void)setLaunchedForMigration:(BOOL)a3;
- (void)setMarkBuddyCompleteDidRun:(BOOL)a3;
- (void)setModalWifiManager:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setNavigationAnalytics:(id)a3;
- (void)setNavigationFlowController:(id)a3;
- (void)setNeedsConfigurationUpdate;
- (void)setPathMonitor:(id)a3;
- (void)setPreferredLanguagesAtStartup:(id)a3;
- (void)setProximityPairingController:(id)a3;
- (void)setSetupAnalytics:(id)a3;
- (void)setShouldLaunchSuspendTaskURL:(BOOL)a3;
- (void)setShouldProceedFromAppearancePane:(BOOL)a3;
- (void)setShouldRereadCloudConfigurationForControllersToSkip:(BOOL)a3;
- (void)setTopViewControllerForRemoving:(id)a3;
- (void)setUserSelectedLanguage:(id)a3;
- (void)setUserSelectedLanguageWithLocale:(id)a3;
- (void)setViewControllersToRemoveOnPush:(id)a3;
- (void)skippedApplyProximitySettings;
- (void)startTFDEPPolling;
- (void)stopTFDEPPolling;
- (void)terminate;
- (void)unableToApplyProximitySettings;
- (void)userDidChooseLanguage;
- (void)userSelectedLanguage:(id)a3;
- (void)willApplyProximitySettingsWithCompletion:(id)a3;
- (void)willEndLifecycleDueToCause:(unint64_t)a3 allowDismissal:(BOOL)a4;
- (void)willMarkBuddyComplete;
- (void)willPerformProximityHandshake;
- (void)willResignActive;
- (void)willTerminate;
@end

@implementation SetupController

+ (void)initialize
{
}

- (SetupController)init
{
  SEL v189 = a2;
  id location = 0;
  v188.receiver = self;
  v188.super_class = (Class)SetupController;
  id location = [(SetupController *)&v188 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init(BYConcreteEnvironment);
    v3 = (void *)*((void *)location + 29);
    *((void *)location + 29) = v2;

    id v4 = objc_alloc_init((Class)BuddyFeatureFlags);
    [*((id *)location + 29) setFeatureFlags:v4];

    id v5 = +[BYDevice currentDevice];
    [*((id *)location + 29) setDeviceProvider:v5];

    id v6 = objc_alloc((Class)BYPasscodeCacheManager);
    id v7 = [location environment];
    id v8 = [v7 featureFlags];
    id v9 = [v6 initWithFeatureFlags:v8];
    [*((id *)location + 29) setPasscodeCacheManager:v9];

    id v10 = +[BYPreferencesController buddyPreferences];
    [*((id *)location + 29) setBuddyPreferences:v10];

    id v11 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
    [*((id *)location + 29) setBuddyPreferencesExcludedFromBackup:v11];

    v12 = [BuddyEnrollmentCoordinator alloc];
    id v13 = [*((id *)location + 29) passcodeCacheManager];
    id v14 = [*((id *)location + 29) buddyPreferences];
    id v15 = [location environment];
    id v16 = [v15 featureFlags];
    v17 = [(BuddyEnrollmentCoordinator *)v12 initWithPasscodeCacheManager:v13 buddyPreferences:v14 featureFlags:v16];
    [*((id *)location + 29) setEnrollmentCoordinator:v17];

    v18 = objc_alloc_init(BuddyMiscState);
    [*((id *)location + 29) setMiscState:v18];

    v19 = objc_alloc_init(BuddySystemTimeUpdateManager);
    [*((id *)location + 29) setSystemTimeUpdateManager:v19];

    objc_initWeak(&from, location);
    v181 = _NSConcreteStackBlock;
    int v182 = -1073741824;
    int v183 = 0;
    v184 = sub_10004AFFC;
    v185 = &unk_1002B0CA8;
    objc_copyWeak(&v186, &from);
    [*((id *)location + 29) setMenuButtonPressedBlock:&v181];
    v175 = _NSConcreteStackBlock;
    int v176 = -1073741824;
    int v177 = 0;
    v178 = sub_10004B040;
    v179 = &unk_1002B0CA8;
    objc_copyWeak(&v180, &from);
    [*((id *)location + 29) setShowModalWiFiSettingsBlock:&v175];
    v169 = _NSConcreteStackBlock;
    int v170 = -1073741824;
    int v171 = 0;
    v172 = sub_10004B084;
    v173 = &unk_1002B0CA8;
    objc_copyWeak(&v174, &from);
    [*((id *)location + 29) setWriteGreenInformedDefaultPlistIfNecessaryBlock:&v169];
    v163 = _NSConcreteStackBlock;
    int v164 = -1073741824;
    int v165 = 0;
    v166 = sub_10004B0C8;
    v167 = &unk_1002B0D98;
    objc_copyWeak(&v168, &from);
    [*((id *)location + 29) setDoesRestartFlowCauseEraseBlock:&v163];
    v157 = _NSConcreteStackBlock;
    int v158 = -1073741824;
    int v159 = 0;
    v160 = sub_10004B11C;
    v161 = &unk_1002B0CA8;
    objc_copyWeak(&v162, &from);
    [*((id *)location + 29) setPrepareForCloudRestoreRebootBlock:&v157];
    v151 = _NSConcreteStackBlock;
    int v152 = -1073741824;
    int v153 = 0;
    v154 = sub_10004B160;
    v155 = &unk_1002B0CA8;
    v104 = &v156;
    objc_copyWeak(&v156, &from);
    [*((id *)location + 29) setExitBuddyForDemoSetUpBlock:&v151];
    v145 = _NSConcreteStackBlock;
    int v146 = -1073741824;
    int v147 = 0;
    v148 = sub_10004B1A4;
    v149 = &unk_1002B0DC0;
    v103 = &v150;
    objc_copyWeak(&v150, &from);
    [*((id *)location + 29) setPrepareForDeviceMigrationBlock:&v145];
    v139 = _NSConcreteStackBlock;
    int v140 = -1073741824;
    int v141 = 0;
    v142 = sub_10004B1F4;
    v143 = &unk_1002B0CA8;
    v102 = &v144;
    objc_copyWeak(&v144, &from);
    [*((id *)location + 29) setStartDeviceMigrationBlock:&v139];
    id v20 = objc_alloc_init((Class)BYSeedProgramManager);
    [*((id *)location + 29) setSeedProgramManager:v20];

    v21 = objc_alloc_init(BuddyNetworkProvider);
    [*((id *)location + 29) setNetworkProvider:v21];

    v22 = objc_alloc_init(BuddyButtonMonitor);
    [*((id *)location + 29) setButtonMonitor:v22];

    id v23 = [*((id *)location + 29) buddyPreferences];
    id v138 = [v23 objectForKey:BYChronicleKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [objc_alloc((Class)BYChronicle) initWithDictionary:v138];
      [*((id *)location + 29) setChronicle:v24];
    }
    else if (v138)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v136 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        id v135 = NSStringFromClass(v25);
        sub_10004B238((uint64_t)buf, (uint64_t)v135);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v136, "Unable to read chronicle data; found %@, expected NSDictionary!",
          buf,
          0xCu);

        objc_storeStrong(&v135, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      os_log_t v134 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v133 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v134;
        os_log_type_t v27 = v133;
        sub_10004B24C(v132);
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Creating new chronicle as a fallback...", v132, 2u);
      }
      objc_storeStrong((id *)&v134, 0);
      id v28 = objc_alloc_init((Class)BYChronicle);
      [*((id *)location + 29) setChronicle:v28];
    }
    else
    {
      os_log_t v131 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v130 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v131;
        os_log_type_t v30 = v130;
        sub_10004B24C(v129);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Creating new chronicle...", v129, 2u);
      }
      objc_storeStrong((id *)&v131, 0);
      id v31 = objc_alloc_init((Class)BYChronicle);
      [*((id *)location + 29) setChronicle:v31];
    }
    if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0)
    {
      v32 = objc_alloc_init(BuddySetupMethod);
      [*((id *)location + 29) setSetupMethod:v32];
    }
    v33 = objc_alloc_init(BuddyExistingSettings);
    [*((id *)location + 29) setExistingSettings:v33];

    v34 = objc_alloc_init(BuddyDisplayZoomExecutor);
    [*((id *)location + 29) setDisplayZoomExecutor:v34];

    v35 = [BuddyPendingRestoreState alloc];
    id v36 = [*((id *)location + 29) existingSettings];
    id v37 = [*((id *)location + 29) setupMethod];
    v38 = [(BuddyPendingRestoreState *)v35 initWithExistingSettings:v36 setupMethod:v37];
    [*((id *)location + 29) setPendingRestoreState:v38];

    v123 = _NSConcreteStackBlock;
    int v124 = -1073741824;
    int v125 = 0;
    v126 = sub_10004B254;
    v127 = &unk_1002B0CA8;
    v101 = &v128;
    objc_copyWeak(&v128, &from);
    [*((id *)location + 29) setWillPerformSoftwareUpdateBlock:&v123];
    v39 = objc_alloc_init(BuddyBetaEnrollmentStateManager);
    [*((id *)location + 29) setBetaEnrollmentStateManager:v39];

    id v40 = objc_alloc_init((Class)BYCapabilities);
    [*((id *)location + 29) setCapabilities:v40];

    v41 = objc_alloc_init(BYSoftwareUpdateCache);
    [*((id *)location + 29) setSoftwareUpdateCache:v41];

    id v42 = objc_alloc_init((Class)BFFSettingsManager);
    [*((id *)location + 29) setSettingsManager:v42];

    id v43 = objc_alloc_init((Class)BYRunState);
    [*((id *)location + 29) setRunState:v43];

    id v44 = objc_alloc_init((Class)BYAnalyticsManager);
    [*((id *)location + 29) setAnalyticsManager:v44];

    id v45 = objc_alloc_init((Class)MCProfileConnection);
    [*((id *)location + 29) setManagedConfiguration:v45];

    v46 = objc_alloc_init(BuddyActivationRecord);
    [*((id *)location + 29) setActivationRecord:v46];

    v47 = objc_alloc_init(BuddyCombinedTermsProvider);
    [*((id *)location + 29) setCombinedTermsProvider:v47];

    v48 = objc_alloc_init(BuddyEmergencyExecutor);
    [*((id *)location + 29) setEmergencyExecutor:v48];

    v49 = objc_alloc_init(BuddyActivationState);
    [*((id *)location + 29) setActivationState:v49];

    id v50 = objc_alloc_init((Class)BYFlowSkipController);
    [*((id *)location + 29) setFlowSkipController:v50];

    id v51 = objc_alloc_init((Class)sub_10004B298());
    [*((id *)location + 29) setMdmReturnToServiceController:v51];

    v52 = [_TtC5Setup22AppearanceModeProvider alloc];
    id v53 = [*((id *)location + 29) displayZoomExecutor];
    v54 = [(AppearanceModeProvider *)v52 initWithDisplayZoomExecutor:v53];
    [*((id *)location + 29) setAppearanceModeProvider:v54];

    v55 = objc_alloc_init(_TtC5Setup28SetupUserDispositionProvider);
    [*((id *)location + 29) setUserDispositionProvider:v55];

    id v56 = +[BYDeviceConfiguration currentConfiguration];
    [*((id *)location + 29) setDeviceConfiguration:v56];

    v57 = [BuddyFlowItemDispositionProvider alloc];
    id v58 = [*((id *)location + 29) setupMethod];
    id v59 = [*((id *)location + 29) runState];
    v60 = [(BuddyFlowItemDispositionProvider *)v57 initWithSetupMethod:v58 runState:v59];
    [*((id *)location + 29) setFlowItemDispositionProvider:v60];

    id v61 = objc_alloc((Class)BYPaneFeatureAnalyticsManager);
    id v62 = [*((id *)location + 29) analyticsManager];
    id v63 = [*((id *)location + 29) runState];
    uint64_t v64 = BYPaneFeatureAnalyticsHostSetupAssistant;
    id v65 = [*((id *)location + 29) flowItemDispositionProvider];
    id v66 = [v61 initWithAnalyticsManager:v62 runState:v63 host:v64 flowItemDispositionProvider:v65];
    [*((id *)location + 29) setPaneFeatureAnalyticsManager:v66];

    v67 = objc_alloc_init(_TtC5Setup19LockdownModeManager);
    [*((id *)location + 29) setLockdownModeProvider:v67];

    id v68 = objc_alloc((Class)BYAnalyticsEventAppearance);
    id v69 = [*((id *)location + 29) analyticsManager];
    id v70 = [*((id *)location + 29) buddyPreferencesExcludedFromBackup];
    id v71 = [v68 initWithAnalyticsManager:v69 buddyPreferencesExcludedFromBackup:v70];
    [*((id *)location + 29) setAnalyticsEventAppearance:v71];

    v72 = objc_alloc_init(BuddyChildSetupPresenter);
    [*((id *)location + 29) setChildSetupPresenter:v72];

    v73 = [_TtC5Setup19IntelligenceManager alloc];
    id v74 = [*((id *)location + 29) featureFlags];
    id v75 = [*((id *)location + 29) buddyPreferencesExcludedFromBackup];
    v76 = [(IntelligenceManager *)v73 initWithFeatureFlags:v74 preferences:v75];
    [*((id *)location + 29) setIntelligenceProvider:v76];

    v77 = objc_alloc_init(BuddyMultilingualFlowManager);
    [*((id *)location + 29) setMultilingualFlowManager:v77];

    v78 = objc_alloc_init(_TtC5Setup32ExpressSettingsSetupCacheManager);
    [*((id *)location + 29) setExpressSettingsCache:v78];

    id v79 = [*((id *)location + 29) runState];
    LOBYTE(v74) = [v79 hasCompletedInitialRun] ^ 1;

    if (v74)
    {
      id v80 = +[BYSetupUserDisposition current];
      id v81 = [v80 isChild];
      unsigned __int8 v82 = [v81 BOOLValue];

      if (v82)
      {
        os_log_t v122 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v121 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          v83 = v122;
          os_log_type_t v84 = v121;
          sub_10004B24C(v120);
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "Assuming default intent as child...", v120, 2u);
        }
        objc_storeStrong((id *)&v122, 0);
        id v85 = [*((id *)location + 29) setupMethod];
        [v85 setIntent:2];

        id v86 = [*((id *)location + 29) flowItemDispositionProvider];
        [v86 setPreferredDispositions:16];
      }
      else if (([location shouldBeginRestore] & 1) != 0 {
             || ([location shouldBeginMigration] & 1) != 0)
      }
      {
        os_log_t v119 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v118 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          v87 = v119;
          os_log_type_t v88 = v118;
          sub_10004B24C(v117);
          _os_log_impl((void *)&_mh_execute_header, v87, v88, "Assuming default intent as self...", v117, 2u);
        }
        objc_storeStrong((id *)&v119, 0);
        id v89 = [*((id *)location + 29) setupMethod];
        [v89 setIntent:1];

        id v90 = [*((id *)location + 29) flowItemDispositionProvider];
        [v90 setPreferredDispositions:4];
      }
    }
    v91 = objc_alloc_init(BuddyInactivityTimer);
    v92 = (void *)*((void *)location + 40);
    *((void *)location + 40) = v91;

    v93 = +[NSNotificationCenter defaultCenter];
    uint64_t v94 = MCCloudConfigurationDidChangeNotification;
    v95 = +[NSOperationQueue mainQueue];
    v111 = _NSConcreteStackBlock;
    int v112 = -1073741824;
    int v113 = 0;
    v114 = sub_10004B3B0;
    v115 = &unk_1002B0DE8;
    id v116 = location;
    id v96 = [(NSNotificationCenter *)v93 addObserverForName:v94 object:0 queue:v95 usingBlock:&v111];
    v97 = (void *)*((void *)location + 23);
    *((void *)location + 23) = v96;

    v98 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v106 = -1073741824;
    int v107 = 0;
    v108 = sub_10004B408;
    v109 = &unk_1002B0D20;
    id v110 = location;
    dispatch_async(v98, &block);

    objc_storeStrong(&v110, 0);
    objc_storeStrong(&v116, 0);
    objc_destroyWeak(v101);
    objc_storeStrong(&v138, 0);
    objc_destroyWeak(v102);
    objc_destroyWeak(v103);
    objc_destroyWeak(v104);
    objc_destroyWeak(&v162);
    objc_destroyWeak(&v168);
    objc_destroyWeak(&v174);
    objc_destroyWeak(&v180);
    objc_destroyWeak(&v186);
    objc_destroyWeak(&from);
  }
  v99 = (SetupController *)location;
  objc_storeStrong(&location, 0);
  return v99;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  [(BuddyLanguageChangeObserver *)self->_languageObserver stopObservingLanguageChanges];
  if (v5->_cloudConfigurationChangeNotificationObserver)
  {
    v2 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v2 removeObserver:v5->_cloudConfigurationChangeNotificationObserver];
  }
  if (v5->_sbAlertItemsSuppressionAssertion)
  {
    CFRelease(v5->_sbAlertItemsSuppressionAssertion);
    v5->_sbAlertItemsSuppressionAssertion = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)SetupController;
  [(SetupController *)&v3 dealloc];
}

- (BuddyMiscState)miscState
{
  v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 miscState];

  return (BuddyMiscState *)v3;
}

- (BOOL)isFirstRunWithoutCloudConfiguration
{
  char HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  char v5 = 0;
  char v3 = 0;
  if ((HasCompletedInitialRun & 1) == 0)
  {
    id v6 = +[BuddyCloudConfigManager sharedManager];
    char v5 = 1;
    char v3 = [v6 hasCloudConfiguration] ^ 1;
  }
  BOOL v7 = v3 & 1;
  if (v5) {

  }
  return v7;
}

- (id)navigationController
{
  return self->_nav;
}

- (BOOL)_hasLocaleAndLanguage
{
  location[2] = self;
  location[1] = (id)a2;
  id v8 = (id)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
  location[0] = v8;
  if (location[0] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [location[0] length])
  {
    id v7 = (id)CFPreferencesCopyAppValue(@"AppleLanguages", kCFPreferencesAnyApplication);
    id v3 = v7;
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
    {
      char v6 = 1;
      int v4 = 1;
    }
    else
    {
      char v6 = 0;
      int v4 = 1;
    }
    objc_storeStrong(&v3, 0);
  }
  else
  {
    char v6 = 0;
    int v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)_isBackInBuddyForActivationOnly
{
  id v2 = +[BuddyActivationConfiguration currentConfiguration];
  char HasCompletedInitialRun = 0;
  if (([v2 isActivated] & 1) == 0) {
    char HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  }

  return HasCompletedInitialRun & 1;
}

- (BOOL)_isBackInBuddyAfterRestoreFromBackup:(BOOL)a3
{
  unsigned __int8 v3 = 0;
  if (a3)
  {
    unsigned __int8 v4 = [(SetupController *)self _restoreFromBackupJustFinished];
    unsigned __int8 v3 = 0;
    if (v4) {
      unsigned __int8 v3 = [(SetupController *)self _hasLocaleAndLanguage];
    }
  }
  return v3 & 1;
}

- (void)_preflightDispositionValidationWithControllerClass:(Class)a3
{
  v18 = self;
  SEL v17 = a2;
  Class aClass = a3;
  if ((os_variant_has_internal_ui() & 1) == 0)
  {
    unsigned __int8 v3 = [(SetupController *)v18 environment];
    id v4 = [(BYEnvironment *)v3 flowItemDispositionProvider];
    id v5 = [v4 dispositions];

    unint64_t v15 = (unint64_t)v5;
    if ((v5 & 2) == 2
      && ([(objc_class *)aClass conformsToProtocol:&OBJC_PROTOCOL___BFFFlowItem] & 1) != 0)
    {
      unint64_t v14 = (unint64_t)[(objc_class *)aClass applicableDispositions];
      BOOL v13 = (v14 & v15) != 0;
      if ((v14 & v15) == 0)
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id location = NSStringFromClass(aClass);
          sub_10004BB7C((uint64_t)buf, (uint64_t)location);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v11, "Fixing unexpected disposition for initialFlowItemClass %{public}@", buf, 0xCu);

          objc_storeStrong(&location, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        char v6 = [(SetupController *)v18 environment];
        id v7 = [(BYEnvironment *)v6 setupMethod];
        [v7 setIntent:1];

        id v8 = [(SetupController *)v18 environment];
        id v9 = [(BYEnvironment *)v8 flowItemDispositionProvider];
        [v9 setPreferredDispositions:4];
      }
    }
  }
}

- (void)_createNavigationController
{
  os_log_t v131 = self;
  SEL v130 = a2;
  [(SetupController *)self _refreshLanguage];
  id v2 = objc_alloc((Class)BFFNavigationController);
  id v3 = +[BYDevice currentDevice];
  id v4 = (BFFNavigationController *)objc_msgSend(v2, "initIgnoringDismissals:", objc_msgSend(v3, "type") == (id)1);
  nav = v131->_nav;
  v131->_nav = v4;

  +[BFFViewControllerSpinnerManager configureWithNavigationController:v131->_nav];
  char v6 = [(SetupController *)v131 environment];
  id v7 = [(BYEnvironment *)v6 buddyPreferencesExcludedFromBackup];
  LOBYTE(v3) = [v7 BOOLForKey:@"PushWithoutDeferringTransitionsWhileInBackground"];

  char v129 = v3 & 1;
  if ([(SetupController *)v131 launchedForMigration] || (v129 & 1) != 0)
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      if ([(SetupController *)v131 launchedForMigration]) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if (v129) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      sub_10004CECC((uint64_t)buf, (uint64_t)v8, (uint64_t)v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v127, "Will push without deferring transitions because launchedForMigration was: %{public}@, shouldPushWithoutDeferringTransitionsWhileInBackground was: %{public}@", buf, 0x16u);
    }
    objc_storeStrong(&location, 0);
    [(BFFNavigationController *)v131->_nav setPushWithoutDeferringTransitionsWhileInBackground:1];
  }
  [(SetupController *)v131 _setupAnalytics];
  id v10 = +[BFFStyle sharedStyle];
  [v10 applyThemeToNavigationController:v131->_nav];

  id v11 = [(BFFNavigationController *)v131->_nav view];
  id v12 = +[BFFStyle sharedStyle];
  id v13 = [v12 backgroundColor];
  [v11 setBackgroundColor:v13];

  unint64_t v14 = [BuddyFlowDiverter alloc];
  unint64_t v15 = [(BuddyFlowDiverter *)v14 initWithEnvironment:v131->_environment];
  [(SetupController *)v131 setFlowDiverter:v15];

  char v125 = 0;
  BOOL v16 = 0;
  if (os_variant_has_internal_ui())
  {
    id v126 = +[BuddyTestFundamentalFlow allowedFlowItems];
    char v125 = 1;
    BOOL v16 = [v126 count] != 0;
  }
  if (v125) {

  }
  if (v16)
  {
    SEL v17 = objc_alloc_init(BuddyTestFundamentalFlow);
    [(SetupController *)v131 setFundamentalFlow:v17];
  }
  else
  {
    v18 = [BuddyFundamentalFlow alloc];
    v19 = v131;
    SEL v17 = (BuddyTestFundamentalFlow *)objc_alloc_init((Class)BuddyFeatureFlags);
    id v20 = [(BuddyFundamentalFlow *)v18 initWithFlowProvider:v19 featureFlags:v17];
    [(SetupController *)v131 setFundamentalFlow:v20];
  }
  objc_initWeak(&from, v131);
  os_log_type_t v118 = _NSConcreteStackBlock;
  int v119 = -1073741824;
  int v120 = 0;
  os_log_type_t v121 = sub_10004CEEC;
  os_log_t v122 = &unk_1002B0E70;
  objc_copyWeak(&v123, &from);
  v21 = [(SetupController *)v131 fundamentalFlow];
  [(BuddyFlowProducer *)v21 setWillSupplyInitialFlowItemClass:&v118];

  v22 = [BuddyNavigationFlowController alloc];
  id v23 = v131;
  id v24 = v131->_nav;
  v25 = [(SetupController *)v131 flowDiverter];
  v26 = [(SetupController *)v131 environment];
  os_log_type_t v27 = [(BuddyNavigationFlowController *)v22 initWithNavigationController:v24 usingRestoreProvider:v23 usingFlowDiverter:v25 environment:v26];
  [(SetupController *)v131 setNavigationFlowController:v27];

  id v28 = v131;
  v29 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v29 setFlowDelegate:v28];

  os_log_type_t v30 = v131;
  id v31 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v31 setLifecycleDelegate:v30];

  v32 = [(SetupController *)v131 environment];
  id v33 = [(BYEnvironment *)v32 proximitySetupController];
  v34 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v34 setProximitySetupController:v33];

  v35 = [(SetupController *)v131 fundamentalFlow];
  id v36 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v36 setFlowProducer:v35];

  id v37 = [(SetupController *)v131 environment];
  id v38 = [(BYEnvironment *)v37 buddyPreferences];
  v39 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v39 setBuddyPreferences:v38];

  id v40 = [(SetupController *)v131 environment];
  id v41 = [(BYEnvironment *)v40 analyticsManager];
  id v42 = [(SetupController *)v131 navigationFlowController];
  [(BuddyNavigationFlowController *)v42 setAnalyticsManager:v41];

  id v117 = +[NSUserDefaults standardUserDefaults];
  id v116 = [v117 stringForKey:@"Language"];
  id v115 = [v117 objectForKey:@"LockdownSetLanguage"];
  BOOL v114 = 0;
  BOOL v43 = 1;
  if (!v116) {
    BOOL v43 = v115 != 0;
  }
  BOOL v114 = v43;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v112 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004CF38((uint64_t)v135, v114, (uint64_t)v116, (uint64_t)v115);
    _os_log_impl((void *)&_mh_execute_header, oslog, v112, "Language set (%d): %{public}@ %{public}@", v135, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v44 = [(SetupController *)v131 environment];
  id v45 = [(BYEnvironment *)v44 buddyPreferencesExcludedFromBackup];
  unsigned __int8 v46 = [v45 BOOLForKey:@"AnimateLanguageChoice"];

  char v111 = v46 & 1;
  v47 = [(SetupController *)v131 environment];
  id v48 = [(BYEnvironment *)v47 buddyPreferencesExcludedFromBackup];
  [v48 removeObjectForKey:@"AnimateLanguageChoice" onlyFromMemory:0];

  [(SetupController *)v131 setInitialAnimateLanguageChoiceValue:v111 & 1];
  char v49 = 0;
  if (v114) {
    char v49 = v111;
  }
  v131->_shouldAnimateLocaleScreen = v49 & 1;
  id v50 = +[BYLocationController sharedBuddyLocationController];
  [v50 setFakeMode:v131->_shouldAnimateLocaleScreen];

  id v51 = [(SetupController *)v131 environment];
  id v52 = [(BYEnvironment *)v51 buddyPreferencesExcludedFromBackup];
  unsigned __int8 v53 = [v52 BOOLForKey:@"DisplayZoomRestart"];
  [(SetupController *)v131 setShouldProceedFromAppearancePane:v53 & 1];

  v54 = [(SetupController *)v131 environment];
  id v55 = [(BYEnvironment *)v54 buddyPreferencesExcludedFromBackup];
  [v55 removeObjectForKey:@"DisplayZoomRestart" onlyFromMemory:0];

  unsigned __int8 v56 = [(SetupController *)v131 shouldProceedFromAppearancePane];
  [(SetupController *)v131 setInitialDisplayZoomRestartValue:v56 & 1];
  CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
  v57 = [(SetupController *)v131 navigationFlowController];
  v102 = _NSConcreteStackBlock;
  int v103 = -1073741824;
  int v104 = 0;
  v105 = sub_10004CF60;
  int v106 = &unk_1002B0E98;
  int v107 = v131;
  char v109 = v111 & 1;
  BOOL v110 = v114;
  id v108 = v117;
  [(BuddyNavigationFlowController *)v57 setupInitialFlowWithCompletion:&v102];

  id v58 = +[BuddyCloudConfigManager sharedManager];
  unsigned __int8 v59 = [v58 isMultiUser];

  char v101 = v59 & 1;
  id v60 = +[ACAccountStore defaultStore];
  id v100 = [v60 aa_primaryAppleAccount];

  char v99 = [v100 aa_isManagedAppleID] & 1;
  os_log_t v98 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v97 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    if (v101) {
      CFStringRef v61 = @"YES";
    }
    else {
      CFStringRef v61 = @"NO";
    }
    if (v99) {
      CFStringRef v62 = @"YES";
    }
    else {
      CFStringRef v62 = @"NO";
    }
    sub_10004D1D8((uint64_t)v134, (uint64_t)v61, (uint64_t)v100, (uint64_t)v62);
    _os_log_impl((void *)&_mh_execute_header, v98, v97, "isMultiUser: %{public}@, account %p isManagedAppleID: %{public}@", v134, 0x20u);
  }
  objc_storeStrong((id *)&v98, 0);
  os_log_t v96 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v95 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    id v63 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[BYLicenseAgreement versionOfAcceptedAgreement]);
    sub_10004BB7C((uint64_t)v133, (uint64_t)v63);
    _os_log_impl((void *)&_mh_execute_header, v96, v95, "Version of newest accepted iOS SLA: %{public}@", v133, 0xCu);
  }
  objc_storeStrong((id *)&v96, 0);
  id v64 = +[BYSetupStateManager sharedManager];
  unsigned __int8 v65 = [v64 didRestoreFromBackup];

  char v94 = v65 & 1;
  os_log_t v93 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v92 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    if (v94) {
      CFStringRef v66 = @"YES";
    }
    else {
      CFStringRef v66 = @"NO";
    }
    sub_10004BB7C((uint64_t)v132, (uint64_t)v66);
    _os_log_impl((void *)&_mh_execute_header, v93, v92, "Restored from Backup from RestoreState: %{public}@", v132, 0xCu);
  }
  objc_storeStrong((id *)&v93, 0);
  v67 = [(SetupController *)v131 environment];
  id v68 = [(BYEnvironment *)v67 proximitySetupController];
  id v86 = _NSConcreteStackBlock;
  int v87 = -1073741824;
  int v88 = 0;
  id v89 = sub_10004D204;
  id v90 = &unk_1002B0EC0;
  v91 = v131;
  [v68 needsToResume:&v86];

  id v69 = +[BYDevice currentDevice];
  LOBYTE(v68) = [v69 type] == (id)1;

  if (v68)
  {
    id v70 = objc_alloc_init(BuddyBackgroundViewController);
    [(SetupController *)v131 setBackgroundViewController:v70];

    window = v131->_window;
    v72 = [(SetupController *)v131 backgroundViewController];
    [(BFFWindow *)window setRootViewController:v72];

    [(BFFNavigationController *)v131->_nav setModalPresentationStyle:2];
    [(BFFNavigationController *)v131->_nav setModalInPresentation:1];
    +[OBWelcomeController preferredContentSize];
    *(double *)&long long v85 = v73;
    *((double *)&v85 + 1) = v74;
    id v75 = v131->_nav;
    long long v84 = v85;
    -[BFFNavigationController setForcedPreferredContentSize:](v75, "setForcedPreferredContentSize:", v73, v74);
    [(BFFWindow *)v131->_window makeKeyAndVisible];
    v76 = [(SetupController *)v131 backgroundViewController];
    [(UIViewController *)v76 presentViewController:v131->_nav animated:1 completion:0];

    v77 = +[UIApplication sharedApplication];
    v78 = [(UIApplication *)v77 connectedScenes];
    id v83 = [(NSSet *)v78 anyObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v79 = v83;
      [v79 _setBackgroundStyle:3];
      objc_storeStrong(&v82, 0);
    }
    id v80 = [(SetupController *)v131 backgroundViewController];
    [(BYEnvironment *)v131->_environment setBuddyBackgroundViewController:v80];

    objc_storeStrong(&v83, 0);
  }
  else
  {
    [(BFFWindow *)v131->_window setRootViewController:v131->_nav];
    [(BFFWindow *)v131->_window makeKeyAndVisible];
  }
  if (v114)
  {
    id v81 = +[BuddySIMManager sharedManager];
    [v81 allowSIMUnlock];
  }
  objc_storeStrong((id *)&v91, 0);
  objc_storeStrong(&v100, 0);
  objc_storeStrong(&v108, 0);
  objc_storeStrong((id *)&v107, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_destroyWeak(&v123);
  objc_destroyWeak(&from);
}

- (void)checkMiniBuddyBreadcrumbs
{
  id v44 = self;
  SEL v43 = a2;
  Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(BYBuddyRunKeychainSyncMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v41 = CFPreferencesGetAppBooleanValue(BYBuddyRunMesaMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v40 = CFPreferencesGetAppBooleanValue(BYBuddyRunPaymentMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v39 = CFPreferencesGetAppBooleanValue(BYBuddyRunDiagnosticsMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v38 = CFPreferencesGetAppBooleanValue(BYBuddyRunCombinedDiagnosticsMismatchMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v37 = CFPreferencesGetAppBooleanValue(BYBuddyRunHSA2MiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v44->_inMiniBuddyFromPostDemoRestoreBreadcrumb = CFPreferencesGetAppBooleanValue(BYBuddyRunPostDemoRestoreMiniBuddy, BYBuddyNotBackedUpIdentifier, 0) != 0;
  Boolean v36 = CFPreferencesGetAppBooleanValue(BYBuddyRunStolenDeviceProtectionMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v35 = CFPreferencesGetAppBooleanValue(BYBuddyRunStandardMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  Boolean v34 = CFPreferencesGetAppBooleanValue(BYBuddyRunRestoreSIMSetupMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004DC08((uint64_t)buf, AppBooleanValue, v41, v40, v39, v38, v37, v44->_inMiniBuddyFromPostDemoRestoreBreadcrumb, v36, v35, v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v32, "Run with breadcrumbs: keychain=%d, touchid=%d, payment=%d, diagnostics=%d, combined diagnostics mismatch=%d, hsa2=%d, post demo restore=%d, stolen device protection=%d, standard=%d, restore SIMSetup: %d", buf, 0x3Eu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (AppBooleanValue
    || v41
    || v40
    || v39
    || v38
    || v37
    || v44->_inMiniBuddyFromPostDemoRestoreBreadcrumb
    || v36
    || v35
    || v34)
  {
    v44->_inMiniBuddyFromBreadcrumb = 1;
    id location = +[NSUserDefaults standardUserDefaults];
    [location setBool:0 forKey:BYBuddyDoneKey];
    if (AppBooleanValue)
    {
      [location setBool:0 forKey:@"AppleIDPB10Presented"];
      [location setBool:0 forKey:@"KeychainSync3Presented"];
    }
    [location setBool:0 forKey:@"Passcode4Presented"];
    if (v41)
    {
      [location removeObjectForKey:@"Mesa2Presented"];
      [location removeObjectForKey:@"MesaPurchasesPresented"];
    }
    if (v40)
    {
      [location removeObjectForKey:@"Payment2Presented"];
      [location setBool:1 forKey:@"PaymentMiniBuddy4Ran"];
    }
    if (v39 || v38)
    {
      [location removeObjectForKey:@"PBDiagnostics4Presented"];
      [location removeObjectForKey:@"DiagnosticsAutoOptInSet"];
      if (v39)
      {
        id v2 = [(SetupController *)v44 environment];
        id v3 = [(BYEnvironment *)v2 managedConfiguration];
        [v3 removeBoolSetting:MCFeatureDiagnosticsSubmissionAllowed];

        id v4 = [(SetupController *)v44 environment];
        id v5 = [(BYEnvironment *)v4 capabilities];
        unsigned __int8 v6 = [v5 eligibleForChlorine];

        if (v6)
        {
          id v7 = [(SetupController *)v44 environment];
          id v8 = [(BYEnvironment *)v7 managedConfiguration];
          [v8 removeBoolSetting:MCFeatureAppAnalyticsAllowed];
        }
      }
      else
      {
        char v29 = 0;
        char v27 = 0;
        unsigned __int8 v9 = 0;
        if (v38)
        {
          id v30 = [(SetupController *)v44 environment];
          char v29 = 1;
          id v28 = [v30 capabilities];
          char v27 = 1;
          unsigned __int8 v9 = [v28 eligibleForChlorine];
        }
        if (v27) {

        }
        if (v29) {
        if (v9)
        }
        {
          os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = v26;
            os_log_type_t v11 = v25;
            sub_10004B24C(v24);
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "Combined analytics mismatch detected", v24, 2u);
          }
          objc_storeStrong((id *)&v26, 0);
          id v12 = [(SetupController *)v44 environment];
          id v13 = [(BYEnvironment *)v12 miscState];
          [v13 setLaunchedWithCombinedAnalyticsMismatch:1];
        }
      }
    }
    if (v37)
    {
      [location removeObjectForKey:@"Mesa2Presented"];
      [location removeObjectForKey:@"AppleIDPB10Presented"];
      [location setBool:1 forKey:@"HSA2UpgradeMiniBuddy3Ran"];
    }
    if (v36)
    {
      unint64_t v14 = [(SetupController *)v44 environment];
      id v15 = [(BYEnvironment *)v14 miscState];
      [v15 setLaunchedToShowStolenDeviceProtection:1];
    }
    if (v34)
    {
      BOOL v16 = [(SetupController *)v44 environment];
      id v17 = [(BYEnvironment *)v16 miscState];
      [v17 setLaunchedToShowSIMSetupAfterRestore:1];
    }
    [location synchronize];
    v18 = [(SetupController *)v44 environment];
    id v19 = [(BYEnvironment *)v18 buddyPreferencesExcludedFromBackup];
    unsigned __int8 v20 = [v19 BOOLForKey:@"ForcePrimaryAppleIDAuthentication"];

    if (v20)
    {
      v21 = [(SetupController *)v44 miscState];
      [(BuddyMiscState *)v21 setForcePrimaryAppleIDAuthentication:1];

      v22 = [(SetupController *)v44 environment];
      id v23 = [(BYEnvironment *)v22 buddyPreferencesExcludedFromBackup];
      [v23 removeObjectForKey:@"ForcePrimaryAppleIDAuthentication" onlyFromMemory:0];
    }
    CFPreferencesSetAppValue(BYBuddyRunKeychainSyncMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunMesaMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunPaymentMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunDiagnosticsMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunCombinedDiagnosticsMismatchMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunHSA2MiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunStolenDeviceProtectionMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunRestoreSIMSetupMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
    objc_storeStrong(&location, 0);
  }
}

- (void)runWithScene:(id)a3
{
  os_log_t v134 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SetupController *)v134 inactivityTimer];
  [(BuddyInactivityTimer *)v3 start];

  id v4 = dispatch_get_global_queue(25, 0);
  dispatch_async(v4, &stru_1002B0EE0);

  id v5 = dispatch_get_global_queue(25, 0);
  dispatch_async(v5, &stru_1002B0F00);

  id v6 = +[BFFStyle sharedStyle];
  [v6 applyThemeToAllTableViews];

  objc_initWeak(&from, v134);
  id v126 = _NSConcreteStackBlock;
  int v127 = -1073741824;
  int v128 = 0;
  char v129 = sub_10004F2D8;
  SEL v130 = &unk_1002B0CA8;
  objc_copyWeak(&v131, &from);
  id v7 = (BuddyMenuController *)+[BuddyMenuController menuButtonConsumerWithHandler:&v126];
  menuButtonConsumer = v134->_menuButtonConsumer;
  v134->_menuButtonConsumer = v7;

  unsigned __int8 v9 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v121 = -1073741824;
  int v122 = 0;
  id v123 = sub_10004F320;
  int v124 = &unk_1002B0D20;
  char v125 = v134;
  dispatch_async(v9, &block);

  CFTypeRef cf = (CFTypeRef)WiFiManagerClientCreate();
  if (cf)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    id v137 = (id)WiFiManagerClientCopyDevices();
    id v118 = v137;
    if ([v118 count])
    {
      id v10 = [v118 objectAtIndexedSubscript:0];

      oslog[1] = v10;
      if (!WiFiDeviceClientGetPower())
      {
        oslog[0] = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v116 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v11 = oslog[0];
          os_log_type_t v12 = v116;
          sub_10004B24C(buf);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, " Wifi is off ! turning it on!", buf, 2u);
        }
        objc_storeStrong((id *)oslog, 0);
        WiFiManagerClientSetPower();
      }
    }
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(cf);
    objc_storeStrong(&v118, 0);
  }
  id v13 = objc_alloc((Class)BFFWindow);
  unint64_t v14 = (BFFWindow *)[v13 initWithWindowScene:location[0]];
  window = v134->_window;
  v134->_window = v14;

  id v16 = +[BYDevice currentDevice];
  BOOL v17 = [v16 type] == 0;

  if (v17)
  {
    v18 = v134->_window;
    id v19 = +[UIColor blackColor];
    [(BFFWindow *)v18 setBackgroundColor:v19];
  }
  unsigned __int8 v20 = v134->_window;
  v21 = +[UIColor systemBlueColor];
  [(BFFWindow *)v20 setTintColor:v21];

  [(SetupController *)v134 checkMiniBuddyBreadcrumbs];
  id v22 = +[BYSetupStateNotifier sharedNotifier];
  [v22 notifyStateChangedTo:1];

  id v23 = +[ACAccountStore defaultStore];
  id v114 = [v23 aa_primaryAppleAccount];

  if (!v114)
  {
    id v24 = +[ACAccountStore defaultStore];
    id v25 = [v24 aa_accountsEnabledForDataclass:kAccountDataclassDeviceLocator];
    id v113 = [v25 lastObject];

    if (v113)
    {
      [v113 aa_setPrimaryAccount:1];
      id v26 = +[ACAccountStore defaultStore];
      [v26 saveAccount:v113 withCompletionHandler:0];
    }
    objc_storeStrong(&v113, 0);
  }
  id v27 = +[BYSetupStateManager sharedManager];
  unsigned __int8 v28 = 1;
  if (([v27 didSetupUsingiTunes] & 1) == 0)
  {
    unsigned __int8 v28 = 1;
    if (![(SetupController *)v134 _didRestoreIniTunes]) {
      unsigned __int8 v28 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers];
    }
  }

  if (v28)
  {
    os_log_t v112 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v111 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      char v29 = v112;
      os_log_type_t v30 = v111;
      sub_10004B24C(v110);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Setting current current language/locale for our language/locale preferences...", v110, 2u);
    }
    objc_storeStrong((id *)&v112, 0);
    id v109 = +[NSUserDefaults standardUserDefaults];
    id v136 = (id)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
    id v108 = v136;
    if (v108)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v108 length]) {
          [v109 setObject:v108 forKey:@"Locale"];
        }
      }
    }
    id v135 = (id)CFPreferencesCopyAppValue(@"AppleLanguages", kCFPreferencesAnyApplication);
    id v107 = v135;
    if (v107)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v107 count])
        {
          id v31 = [v107 objectAtIndexedSubscript:0];
          [v109 setObject:v31 forKey:@"Language"];
        }
      }
    }
    objc_storeStrong(&v107, 0);
    objc_storeStrong(&v108, 0);
    objc_storeStrong(&v109, 0);
  }
  id v106 = [(SetupController *)v134 environment];
  id v32 = [v106 networkProvider];
  unsigned __int8 v33 = [v32 networkReachable];

  if (v33)
  {
    id v34 = +[BuddyAppleIDConfigurationManager sharedManager];
    [v34 getURLConfigurationWithHandler:0];

    Boolean v35 = dispatch_get_global_queue(0, 0);
    dispatch_async(v35, &stru_1002B0F20);
  }
  os_log_t v105 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v104 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = [v106 networkProvider];
    int v37 = [v36 networkReachable] & 1;
    id v38 = [v106 networkProvider];
    sub_10004F3FC((uint64_t)v138, v37, [v38 connectedOverWiFi] & 1);
    _os_log_impl((void *)&_mh_execute_header, v105, v104, "Network reachability at startup: %d isWifi: %d", v138, 0xEu);
  }
  objc_storeStrong((id *)&v105, 0);
  nw_path_monitor_t v39 = nw_path_monitor_create();
  [(SetupController *)v134 setPathMonitor:v39];

  Boolean v40 = [(SetupController *)v134 pathMonitor];
  Boolean v41 = &_dispatch_main_q;
  nw_path_monitor_set_queue(v40, (dispatch_queue_t)v41);

  id v42 = [(SetupController *)v134 pathMonitor];
  update_handler = _NSConcreteStackBlock;
  int v99 = -1073741824;
  int v100 = 0;
  char v101 = sub_10004F41C;
  v102 = &unk_1002B0F48;
  int v103 = v134;
  nw_path_monitor_set_update_handler(v42, &update_handler);

  SEL v43 = [(SetupController *)v134 pathMonitor];
  nw_path_monitor_start(v43);

  id v44 = objc_alloc_init(BuddyProximityAutomatedDeviceEnrollmentController);
  [v106 setProximityAutomatedDeviceEnrollmentController:v44];

  id v45 = v134;
  id v46 = [v106 proximityAutomatedDeviceEnrollmentController];
  [v46 setDelegate:v45];

  v47 = [ProximitySetupController alloc];
  id v48 = [v106 miscState];
  id v49 = [v106 buddyPreferences];
  id v50 = [v106 buddyPreferencesExcludedFromBackup];
  id v51 = [v106 featureFlags];
  id v52 = [v106 analyticsManager];
  id v53 = [v106 setupMethod];
  v54 = [(ProximitySetupController *)v47 initWithMiscState:v48 buddyPreferences:v49 buddyPreferencesExcludedFromBackup:v50 featureFlags:v51 analyticsManager:v52 setupMethod:v53];
  [v106 setProximitySetupController:v54];

  id v55 = v134;
  id v56 = [v106 proximitySetupController];
  [v56 setDelegate:v55];

  [(SetupController *)v134 _createNavigationController];
  v57 = +[UIDevice currentDevice];
  [(UIDevice *)v57 setBatteryMonitoringEnabled:1];

  [(SetupController *)v134 _initializeGreen];
  id v58 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v58 addObserver:v134 selector:"_updateLoadingStatus" name:RUIHTTPRequestLoadingStatusDidChangeNotification object:0];

  CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(center, v134, (CFNotificationCallback)sub_10004F46C, @"com.apple.springboard.setupsnapshotremoved", 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(center, v134, (CFNotificationCallback)sub_10004F4A4, @"com.apple.purplebuddy.SetupStateChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(center, v134, (CFNotificationCallback)sub_10004F4DC, @"AppleDatePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  id v59 = +[BuddyActivationConfiguration currentConfiguration];
  [v59 addDelegate:v134];

  char v95 = 0;
  id v60 = [v106 runState];
  char v61 = 0;
  if (([v60 hasCompletedInitialRun] & 1) == 0)
  {
    id v96 = +[BuddyActivationConfiguration currentConfiguration];
    char v95 = 1;
    char v61 = [v96 isActivated] ^ 1;
  }
  if (v95) {

  }
  if (v61)
  {
    CFStringRef v62 = objc_opt_class();
    id v63 = [(id)objc_opt_class() currentAppStates];
    id v64 = [v106 buddyPreferencesExcludedFromBackup];
    [v62 persist:v63 to:v64];
  }
  unsigned __int8 v65 = objc_alloc_init(BuddyLanguageChangeObserver);
  languageObserver = v134->_languageObserver;
  v134->_languageObserver = v65;

  -[BuddyLanguageChangeObserver setDelegate:](v134->_languageObserver, "setDelegate:");
  [(BuddyLanguageChangeObserver *)v134->_languageObserver startObservingLanguageChanges];
  id v67 = +[BYLocationController sharedBuddyLocationController];
  id v68 = [(SetupController *)v134 environment];
  id v69 = [(BYEnvironment *)v68 analyticsManager];
  [v67 configureForAnalytics:v69];

  id v94 = +[NSFileManager defaultManager];
  if (([v94 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/FirstTime"] & 1) != 0
    && (([v94 createFileAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" contents:0 attributes:0] & 1) == 0|| (objc_msgSend(v94, "createFileAtPath:contents:attributes:", @"/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing", 0, 0) & 1) == 0|| (objc_msgSend(v94, "removeItemAtPath:error:", @"/var/mobile/Media/iTunes_Control/iTunes/FirstTime", 0) & 1) == 0))
  {
    [v94 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" error:0];
    [v94 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing" error:0];
  }
  id v70 = [BFFBackupDeviceController alloc];
  id v71 = [v106 proximitySetupController];
  v72 = [(BFFBackupDeviceController *)v70 initWithProximitySetupController:v71];
  [v106 setBackupDeviceController:v72];

  if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0) {
    [(SetupController *)v134 startTFDEPPolling];
  }
  id v73 = [v106 buddyPreferencesExcludedFromBackup];
  unsigned __int8 v74 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:v73];

  if (v74)
  {
    id v75 = objc_opt_new();
    [v106 setSuspendTask:v75];
  }
  id v76 = +[OBAnalyticsManager sharedManager];
  [v76 setShouldStashMetrics:1];

  v77 = +[BYNetworkMonitor sharedInstance];
  int v88 = _NSConcreteStackBlock;
  int v89 = -1073741824;
  int v90 = 0;
  v91 = sub_10004F514;
  os_log_type_t v92 = &unk_1002B0EC0;
  id v93 = v106;
  [(BYNetworkMonitor *)v77 withMinimumNetworkType:1 timeout:&v88 runBlock:30.0];

  id v83 = _NSConcreteStackBlock;
  uint64_t v84 = 3221225472;
  long long v85 = sub_10004F99C;
  id v86 = &unk_1002B0D20;
  int v87 = v134;
  id v78 = [location[0] statusBarManager];
  [v78 setDebugMenuHandler:&v83];

  id v79 = v134;
  id v80 = [v106 displayZoomExecutor:_NSConcreteStackBlock, 3221225472, sub_10004F9EC, &unk_1002B0D20, v79, v83, v84, v85, v86];
  [v80 setWillCommit:&v81];

  objc_storeStrong(&v82, 0);
  objc_storeStrong((id *)&v87, 0);
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong((id *)&v103, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong((id *)&v125, 0);
  objc_destroyWeak(&v131);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_networkPathChanged
{
  id v35 = self;
  oslog[1] = (os_log_t)a2;
  int v2 = byte_100321AB0 & 1;
  id v3 = [(SetupController *)self environment];
  id v4 = [(BYEnvironment *)v3 networkProvider];
  int v5 = [v4 networkReachable] & 1;

  if (v2 != v5)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v35 environment];
      id v7 = [v6 networkProvider];
      int v8 = [v7 networkReachable] & 1;
      id v9 = [v35 environment];
      id v10 = [v9 networkProvider];
      sub_10004F3FC((uint64_t)buf, v8, [v10 connectedOverWiFi] & 1);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v33, "Network reachability changed: %d isWifi: %d", buf, 0xEu);
    }
    objc_storeStrong((id *)oslog, 0);
    id v11 = [v35 environment];
    id v12 = [v11 networkProvider];
    byte_100321AB0 = [v12 networkReachable] & 1;
  }
  id v13 = [v35 environment];
  id v14 = [v13 networkProvider];
  unsigned __int8 v15 = [v14 networkReachable];

  if (v15)
  {
    id v16 = [v35 environment];
    id v17 = [v16 systemTimeUpdateManager];
    [v17 updateSystemTime];

    id v18 = +[BuddyAppleIDConfigurationManager sharedManager];
    [v18 getURLConfigurationWithHandler:0];

    id v19 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v28 = -1073741824;
    int v29 = 0;
    os_log_type_t v30 = sub_10004FEFC;
    id v31 = &unk_1002B0D20;
    id v32 = v35;
    dispatch_async((dispatch_queue_t)v19, &block);

    objc_storeStrong(&v32, 0);
  }
  id v20 = [v35 environment];
  id v21 = [v20 networkProvider];
  unsigned __int8 v22 = [v21 connectedOverWiFi];

  if (v22) {
    *((unsigned char *)v35 + 120) = 1;
  }
  id v23 = [v35 navigationFlowController];
  id v24 = [v23 wifiController];
  id v25 = [v35 environment];
  id v26 = [v25 networkProvider];
  [v24 reachabilityChanged:[v26 networkReachable] & 1];
}

- (void)checkForUpdatedCarrierBundle
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = oslog;
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Checking for updated carrier bundles...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [location[0] checkForUpdatedBundlesWithAutoInstall:1 completion:&stru_1002B0FC8];
  objc_storeStrong(location, 0);
}

- (void)_refreshLanguage
{
  int v2 = +[NSLocale preferredLanguages];
  os_log_type_t v3 = (NSString *)[(NSArray *)v2 firstObject];
  languageAtStartup = self->_languageAtStartup;
  self->_languageAtStartup = v3;

  os_log_type_t v5 = +[NSLocale preferredLanguages];
  [(SetupController *)self setPreferredLanguagesAtStartup:v5];

  id v6 = +[NSLocale currentLocale];
  id v7 = [(NSLocale *)v6 localeIdentifier];
  localeIdentifierAtStartup = self->_localeIdentifierAtStartup;
  self->_localeIdentifierAtStartup = v7;
}

- (void)_updateLoadingStatus
{
  unsigned __int8 v2 = +[RUIHTTPRequest anyRequestLoading];
  [UIApp setStatusBarShowsProgress:v2 & 1];
}

- (id)_stringForStartupCause:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = @"Unknown";
      break;
    case 1uLL:
      id v4 = @"Post-Language Change";
      break;
    case 2uLL:
      id v4 = @"Post-Display Zoom Change";
      break;
    case 3uLL:
      id v4 = @"Activation";
      break;
    case 4uLL:
      id v4 = @"Post-Restore";
      break;
    case 5uLL:
      id v4 = @"Post-Software Update";
      break;
    case 6uLL:
      id v4 = @"Migration";
      break;
    case 7uLL:
      id v4 = @"Post-Demo Restore";
      break;
    default:
      break;
  }

  return v4;
}

- (void)startTFDEPPolling
{
  id v9 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_TFDEPPollTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v2 = oslog[0];
      os_log_type_t v3 = v7;
      sub_10004B24C(v6);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "TFDEP: starting poll timer", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:v9 target:"TFDEPPollTimerFired:" selector:0 userInfo:1 repeats:1.0];
    TFDEPPollTimer = v9->_TFDEPPollTimer;
    v9->_TFDEPPollTimer = v4;
  }
}

- (void)stopTFDEPPolling
{
  os_log_type_t v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_TFDEPPollTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "TFDEP: stopping poll timer", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    [(NSTimer *)v7->_TFDEPPollTimer invalidate];
    objc_storeStrong((id *)&v7->_TFDEPPollTimer, 0);
  }
}

- (BOOL)isTeslaEnrolled
{
  id location[2] = self;
  location[1] = (id)a2;
  unsigned __int8 v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 managedConfiguration];
  location[0] = [v3 cloudConfigurationDetails];

  id v4 = [location[0] objectForKeyedSubscript:kMCCCConfigurationSourceKey];
  LOBYTE(v3) = [v4 intValue] == 1;

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)TFDEPPollTimerFired:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SetupController *)v19 environment];
  id v17 = [(BYEnvironment *)v3 managedConfiguration];

  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  if ([(SetupController *)v19 isTeslaEnrolled]
    || (id v16 = [(SetupController *)v19 environment],
        char v15 = 1,
        id v14 = [v16 mdmReturnToServiceController],
        char v13 = 1,
        BOOL v4 = 0,
        ([v14 shouldDoReturnToService] & 1) != 0))
  {
    id v12 = [v17 installedMDMProfileIdentifier];
    char v11 = 1;
    BOOL v4 = v12 != 0;
  }
  if (v11) {

  }
  if (v13) {
  if (v15)
  }

  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v5 = oslog;
      os_log_type_t v6 = v9;
      sub_10004B24C(v8);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "TFDEP: We are undergoing tap free setup!", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SetupController *)v19 stopTFDEPPolling];
    v19->_isTapFreeSetup = 1;
    [v17 cloudConfigurationUIDidCompleteWasApplied:1];
    os_log_type_t v7 = [(SetupController *)v19 navigationFlowController];
    [(BuddyNavigationFlowController *)v7 beginTapFreeSetUp];
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)doesTapFreeSetupAffectsClass:(Class)a3
{
  char v3 = objc_opt_respondsToSelector();
  unsigned __int8 v4 = 0;
  if (v3) {
    unsigned __int8 v4 = [(objc_class *)a3 controllerAffectedByTapFreeSetup];
  }
  return v4 & 1;
}

- (BOOL)shouldTapFreeSetupSkipControllerClass:(Class)a3
{
  BOOL isTapFreeSetup = self->_isTapFreeSetup;
  unsigned __int8 v4 = 0;
  if (isTapFreeSetup) {
    unsigned __int8 v4 = [(SetupController *)self doesTapFreeSetupAffectsClass:a3];
  }
  return v4 & 1;
}

- (void)_setupAndStartReturnToServiceIfNeeded
{
  id v25 = self;
  v24[1] = (id)a2;
  v24[0] = [(BYEnvironment *)self->_environment mdmReturnToServiceController];
  id v2 = +[BuddyCloudConfigManager sharedManager];
  [v2 setMdmReturnToServiceController:v24[0]];

  if ([v24[0] shouldDoReturnToService])
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      char v3 = location;
      os_log_type_t v4 = v22;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "We are in auto re-enrollment flow. Will push without deferring transitions…", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    [(BFFNavigationController *)v25->_nav setPushWithoutDeferringTransitionsWhileInBackground:1];
    os_log_type_t v5 = dispatch_get_global_queue(2, 0);
    block = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = sub_100050CB8;
    id v19 = &unk_1002B0D20;
    id v20 = v24[0];
    dispatch_async(v5, &block);

    id v6 = [v24[0] languageStrings];
    id v14 = [v6 firstObject];

    id v13 = [v24[0] localeString];
    if ([v14 length] && objc_msgSend(v13, "length"))
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v7 = oslog;
        os_log_type_t v8 = v11;
        sub_10004B24C(v10);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Doing auto re-enrollment, setting language & locale...", (uint8_t *)v10, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(SetupController *)v25 userSelectedLanguageWithLocale:v14 countryCode:v13 localePaneScrollOffset:0.0];
      os_log_type_t v9 = [(SetupController *)v25 navigationFlowController];
      [(BuddyNavigationFlowController *)v9 proceedPastLanguageLocalePane];
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(v24, 0);
}

- (void)didBecomeActive
{
  id v21 = self;
  SEL v20 = a2;
  if (self->_lockStartTimestamp)
  {
    uint64_t v19 = 0;
    +[BuddyTimestamp intervalSinceTimestamp:v21->_lockStartTimestamp];
    uint64_t v19 = *(void *)&v2;
    v21->_cumulativeLockedDuration = v21->_cumulativeLockedDuration + v2;
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046588((uint64_t)buf, v19);
      _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Spent %0.2fs locked/inactive", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v21->_lockStartTimestamp = 0;
  }
  if (!v21->_buddyStartTimestamp)
  {
    unint64_t v3 = +[BuddyTimestamp currentTimestamp];
    v21->_buddyStartTimestamp = v3;
    os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id location = +[NSDate date];
      sub_10004BB7C((uint64_t)v22, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, v16, v15, "Buddy UI started at %{public}@", v22, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&v16, 0);
  }
  os_log_type_t v4 = [(SetupController *)v21 navigationFlowController];
  id v13 = [(BuddyNavigationFlowController *)v4 topFlowItem];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v13 shouldStopInactivityTimer] & 1) != 0)
  {
    os_log_type_t v5 = [(SetupController *)v21 inactivityTimer];
    [(BuddyInactivityTimer *)v5 stop];
  }
  id v6 = dispatch_get_global_queue(0, 0);
  os_log_type_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000510F8;
  os_log_type_t v11 = &unk_1002B0D20;
  id v12 = v21;
  dispatch_async(v6, &v8);

  os_log_type_t v7 = [(SetupController *)v21 navigationAnalytics];
  [(BuddyNavigationAnalytics *)v7 didBecomeActive];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
}

- (void)willResignActive
{
  self->_lockStartTimestamp = +[BuddyTimestamp currentTimestamp];
  if (self->_buddyDone) {
    [(SetupController *)self willMarkBuddyComplete];
  }
}

- (void)didEnterBackground
{
  os_log_type_t v15 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v15->_buddyDone) {
      CFStringRef v2 = @"complete";
    }
    else {
      CFStringRef v2 = @"not complete";
    }
    if ([UIApp isSuspendedUnderLock]) {
      CFStringRef v3 = @"locked";
    }
    else {
      CFStringRef v3 = @"not locked";
    }
    sub_100051470((uint64_t)buf, (uint64_t)v2, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v13, "Entered background (setup is %@, device is %@)", buf, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  os_log_type_t v4 = [(SetupController *)v15 monitor];

  if (v4)
  {
    os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
    char v11 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v5 = v12;
      os_log_type_t v6 = v11;
      sub_10004B24C(v10);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "Entered background before a display layout update was received; forcing completion...",
        (uint8_t *)v10,
        2u);
    }
    objc_storeStrong((id *)&v12, 0);
    os_log_type_t v7 = [(SetupController *)v15 monitor];
    [(FBSDisplayLayoutMonitor *)v7 invalidate];

    [(SetupController *)v15 setMonitor:0];
    [(SetupController *)v15 markBuddyComplete];
    [(SetupController *)v15 didMarkBuddyComplete];
  }
  if (!v15->_buddyDone || ([UIApp isSuspendedUnderLock] & 1) != 0)
  {
    os_log_type_t v8 = [(SetupController *)v15 inactivityTimer];
    [(BuddyInactivityTimer *)v8 start];
  }
  else
  {
    [(SetupController *)v15 terminate];
  }
  [(SetupController *)v15 endAdvertisingProximitySetup];
  uint64_t v9 = [(SetupController *)v15 navigationAnalytics];
  [(BuddyNavigationAnalytics *)v9 didEnterBackground];
}

- (void)willTerminate
{
  CFStringRef v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 proximitySetupController];
  [v3 setupFinished];
}

- (void)terminate
{
  SEL v20 = self;
  location[1] = (id)a2;
  id v2 = +[BYSetupStateNotifier sharedNotifier];
  [v2 notifyStateChangedTo:3];

  location[0] = 0;
  if ([(SetupController *)v20 shouldLaunchSuspendTaskURL])
  {
    id v3 = [(SetupController *)v20 environment];
    id v4 = [(BYEnvironment *)v3 suspendTask];
    id v5 = [v4 launchURL];
    id v6 = location[0];
    location[0] = v5;
  }
  os_log_type_t v7 = [(SetupController *)v20 environment];
  id v8 = [(BYEnvironment *)v7 displayZoomExecutor];
  [v8 setWillCommit:0];

  uint64_t v9 = [(SetupController *)v20 environment];
  id v10 = [(BYEnvironment *)v9 displayZoomExecutor];
  unsigned __int8 v11 = [v10 commitIfNeededWithRelaunchURL:location[0] transitionWithScreenshot:0];

  if (v11)
  {
    os_log_t v12 = +[NSRunLoop mainRunLoop];
    [(NSRunLoop *)v12 run];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v13 = oslog;
      os_log_type_t v14 = v17;
      sub_10004B24C(v16);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Buddy exiting...", (uint8_t *)v16, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_type_t v15 = +[UIApplication sharedApplication];
    [(UIApplication *)v15 terminateWithSuccess];
  }
  objc_storeStrong(location, 0);
}

- (void)willMarkBuddyComplete
{
  Boolean v40 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v38;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing any work before marking buddy as complete...", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  id v4 = +[ACAccountStore defaultStore];
  id v5 = [v4 aa_primaryAppleAccount];

  if (v5)
  {
    id v6 = [(SetupController *)v40 environment];
    id v7 = [(BYEnvironment *)v6 proximitySetupController];
    unsigned __int8 v8 = [v7 hasAppliedSettings];

    char v36 = v8 & 1;
    BOOL v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    BOOL v9 = 0;
    if (v8)
    {
      id v34 = [(SetupController *)v40 environment];
      char v33 = 1;
      id v32 = [(BYEnvironment *)v34 pendingRestoreState];
      char v31 = 1;
      id v30 = [v32 backupItem];
      char v29 = 1;
      BOOL v9 = v30 == 0;
    }
    if (v29) {

    }
    if (v31) {
    if (v33)
    }

    BOOL v35 = v9;
    if (v9)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = oslog;
        os_log_type_t v11 = v27;
        sub_10004B24C(v26);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Enabling Find My...", v26, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      os_log_t v12 = +[FMDFMIPManager sharedInstance];
      id v25 = [(FMDFMIPManager *)v12 enableFMIPInContext:5];

      if (v25)
      {
        os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          char v21 = 0;
          char v19 = 0;
          if (_BYIsInternalInstall())
          {
            os_log_type_t v13 = (NSString *)v25;
          }
          else
          {
            id v22 = [v25 domain];
            char v21 = 1;
            os_log_type_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v22, [v25 code]);
            id v20 = v13;
            char v19 = 1;
          }
          sub_10004BB7C((uint64_t)v41, (uint64_t)v13);
          _os_log_error_impl((void *)&_mh_execute_header, v24, v23, "Failed to enable Find My: %{public}@", v41, 0xCu);
          if (v19) {

          }
          if (v21) {
        }
          }
        objc_storeStrong((id *)&v24, 0);
      }
      objc_storeStrong(&v25, 0);
    }
  }
  CFStringRef v18 = @"com.apple.WebUI";
  CFStringRef v17 = @"DefaultValueForPasswordAndCreditCardAutoFill";
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"DefaultValueForPasswordAndCreditCardAutoFill", @"com.apple.WebUI", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    os_log_type_t v14 = [(SetupController *)v40 environment];
    id v15 = [(BYEnvironment *)v14 managedConfiguration];
    CFPreferencesSetAppValue(@"DefaultValueForPasswordAndCreditCardAutoFill", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[v15 isPasscodeSet] & 1), @"com.apple.WebUI");

    CFPreferencesAppSynchronize(@"com.apple.WebUI");
  }
}

- (void)markBuddyComplete
{
  id v53 = self;
  SEL v52 = a2;
  id v2 = self;
  objc_sync_enter(v2);
  char v51 = [(SetupController *)v53 markBuddyCompleteDidRun];
  [(SetupController *)v53 setMarkBuddyCompleteDidRun:1];
  objc_sync_exit(v2);

  if (v51)
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v3 = location;
      os_log_type_t v4 = v49;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Already marked buddy as complete.", buf, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v46;
      sub_10004B24C(v45);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Marking buddy as complete...", v45, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = [(SetupController *)v53 environment];
    id v8 = [(BYEnvironment *)v7 buddyPreferences];
    id v9 = [(BYEnvironment *)v53->_environment chronicle];
    id v10 = [v9 dictionaryRepresentation];
    [v8 setObject:v10 forKey:BYChronicleKey];

    os_log_type_t v11 = [(SetupController *)v53 environment];
    id v12 = [(BYEnvironment *)v11 buddyPreferences];
    [v12 removeObjectForKey:@"DebugFlowItemClassNames" onlyFromMemory:0];

    os_log_type_t v13 = [(SetupController *)v53 environment];
    id v14 = [(BYEnvironment *)v13 buddyPreferencesExcludedFromBackup];
    [v14 removeObjectForKey:@"PushWithoutDeferringTransitionsWhileInBackground"];

    id v15 = [(SetupController *)v53 environment];
    id v16 = [(BYEnvironment *)v15 buddyPreferencesExcludedFromBackup];
    +[BuddySetupAnalytics removeFromDiskWithPreferences:v16];

    id v44 = dispatch_semaphore_create(0);
    CFStringRef v17 = [(SetupController *)v53 environment];
    id v18 = [(BYEnvironment *)v17 expressSettingsCache];
    os_log_type_t v38 = _NSConcreteStackBlock;
    int v39 = -1073741824;
    int v40 = 0;
    Boolean v41 = sub_100052394;
    id v42 = &unk_1002B0FF0;
    id v43 = v44;
    [v18 applyHandlers:&v38];

    char v19 = v44;
    dispatch_time_t v20 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      os_log_t v37 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        char v21 = v37;
        os_log_type_t v22 = v36;
        sub_10004B24C(v35);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to apply pending express settings in time.", (uint8_t *)v35, 2u);
      }
      objc_storeStrong((id *)&v37, 0);
    }
    +[BYPreferencesController persistEverything];
    os_log_type_t v23 = +[NSUserDefaults standardUserDefaults];
    [(NSUserDefaults *)v23 setObject:&__kCFBooleanTrue forKey:BYBuddyDoneKey];

    os_log_t v24 = +[NSUserDefaults standardUserDefaults];
    id v25 = +[NSNumber numberWithInt:BYBuddyIOSCurrentVersion];
    [(NSUserDefaults *)v24 setObject:v25 forKey:BYBuddyIOSVersionKey];

    id v26 = +[NSUserDefaults standardUserDefaults];
    [(NSUserDefaults *)v26 setObject:&__kCFBooleanTrue forKey:BYBuddyFinishedInitialRunKey];

    os_log_type_t v27 = +[NSUserDefaults standardUserDefaults];
    int v28 = +[NSDate date];
    [(NSUserDefaults *)v27 setObject:v28 forKey:BYBuddyLastExitKey];

    char v29 = [(SetupController *)v53 environment];
    id v30 = [(BYEnvironment *)v29 buddyPreferences];
    +[BuddyRestoreState removeFromPreferences:v30];

    char v31 = [(SetupController *)v53 environment];
    id v32 = [(BYEnvironment *)v31 buddyPreferencesExcludedFromBackup];
    +[BuddyMigrationState removeFromPreferences:v32];

    id v33 = +[BYSetupStateManager sharedManager];
    [v33 recordSetupUsingBuddy];

    id v34 = +[NSUserDefaults standardUserDefaults];
    [(NSUserDefaults *)v34 synchronize];

    CFPreferencesSynchronize(BYSetupAssistantBundleIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    CFPreferencesSetAppValue(BYBuddyRunPostDemoRestoreMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(@"CloudConfigPresented", kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
    _CFPreferencesFlushCachesForIdentifier();
    _CFPreferencesFlushCachesForIdentifier();
    [(SetupController *)v53 _commitAnalytics];
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v44, 0);
  }
}

- (void)didMarkBuddyComplete
{
  id v18 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v16;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing any work after marking buddy as complete...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  CFPreferencesSetValue(@"BuddySetupDone", kCFBooleanTrue, @"com.apple.keyboard", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.keyboard", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  [(SetupController *)v18 checkForUpdatedCarrierBundle];
  os_log_type_t v4 = [(SetupController *)v18 environment];
  id v5 = [(BYEnvironment *)v4 managedConfiguration];
  [v5 setupAssistantDidFinish];

  os_log_type_t v6 = [(SetupController *)v18 environment];
  id v7 = [(BYEnvironment *)v6 mdmReturnToServiceController];
  [v7 returnToServiceFlowCompleted];

  BYSetLaunchSentinel();
  os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v14;
    os_log_type_t v9 = v13;
    sub_10004B24C(v12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Posting buddy finished...", v12, 2u);
  }
  objc_storeStrong((id *)&v14, 0);
  id v10 = +[BYSetupStateNotifier sharedNotifier];
  [v10 notifyStateChangedTo:2];

  BYObserveFinishSetupTriggers();
  CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(center, v18);
  [(BuddyLanguageChangeObserver *)v18->_languageObserver stopObservingLanguageChanges];
}

- (void)_exitBuddyForDemoSetUp
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if ([(SetupController *)self shouldEndLifecycleForCause:2])
  {
    [(SetupController *)v7 willEndLifecycleDueToCause:2 allowDismissal:1];
    [(SetupController *)v7 endLifecycleDueToCause:2];
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v5 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Unable to exit buddy for demo setup!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_prepareForCloudRestoreReboot
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if ([(SetupController *)self shouldEndLifecycleForCause:3])
  {
    [(SetupController *)v7 willEndLifecycleDueToCause:3 allowDismissal:0];
    [(SetupController *)v7 endLifecycleDueToCause:3];
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v5 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Unable to exit buddy for iCloud restore!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_prepareForMigrationReboot
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if ([(SetupController *)self shouldEndLifecycleForCause:4])
  {
    [(SetupController *)v7 willEndLifecycleDueToCause:4 allowDismissal:0];
    [(SetupController *)v7 endLifecycleDueToCause:4];
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v5 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Unable to exit buddy for migration!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_willEndLifecycleForDataTransfer
{
  os_log_type_t v36 = self;
  location[1] = (id)a2;
  [(SetupController *)self _stashAnalytics];
  id v2 = +[AALoginPluginManager sharedInstance];
  [(AALoginPluginManager *)v2 unstashLoginResponse];

  os_log_type_t v3 = [(SetupController *)v36 environment];
  id v4 = [(BYEnvironment *)v3 settingsManager];
  char v5 = [(SetupController *)v36 environment];
  id v6 = [(BYEnvironment *)v5 flowSkipController];
  id v7 = [v6 getFlowSkipIdentifiers];
  [v4 stashFlowSkipIdentifiers:v7];

  id v8 = [(SetupController *)v36 environment];
  id v9 = [(BYEnvironment *)v8 buddyPreferences];
  id v10 = +[NSDate date];
  [v9 setObject:v10 forKey:BYBuddyLastExitKey];

  os_log_type_t v11 = [(SetupController *)v36 environment];
  id v12 = [(BYEnvironment *)v11 settingsManager];
  id v37 = (id)_AXSCopySettingsDataBlobForBuddy();
  id v13 = v37;
  [v12 stashAccessibilityData:v13];

  os_log_t v14 = [(SetupController *)v36 environment];
  id v15 = [(BYEnvironment *)v14 buddyPreferences];
  location[0] = [v15 preferences];

  memset(__b, 0, sizeof(__b));
  id v16 = [location[0] allKeys];
  id v17 = [v16 countByEnumeratingWithState:__b objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v17; ++i)
      {
        if (*(void *)__b[2] != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v34 = *(void *)(__b[1] + 8 * i);
        dispatch_time_t v20 = [(SetupController *)v36 environment];
        id v21 = [(BYEnvironment *)v20 settingsManager];
        id v22 = [location[0] objectForKeyedSubscript:v34];
        os_log_type_t v23 = [(SetupController *)v36 environment];
        id v24 = [(BYEnvironment *)v23 buddyPreferences];
        id v25 = [v24 domain];
        [v21 setObject:v22 forDomain:v25 key:v34];
      }
      id v17 = [v16 countByEnumeratingWithState:__b objects:v38 count:16];
    }
    while (v17);
  }

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = oslog;
    os_log_type_t v27 = v31;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Stashing settings into the safe haven...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v28 = [(SetupController *)v36 environment];
  id v29 = [(BYEnvironment *)v28 settingsManager];
  [v29 hideStashInSafeHaven];

  objc_storeStrong(location, 0);
}

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5
{
  int v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v38 = a4;
  BOOL v37 = a5;
  BOOL v36 = 0;
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [(NSUserDefaults *)v7 objectForKey:@"LockdownSetLanguage"];
  char v34 = 0;
  char v32 = 0;
  BOOL v9 = 1;
  if (!v8)
  {
    BOOL v35 = +[NSUserDefaults standardUserDefaults];
    char v34 = 1;
    id v33 = [(NSUserDefaults *)v35 objectForKey:@"LockdownSetLocale"];
    char v32 = 1;
    BOOL v9 = v33 != 0;
  }
  if (v32) {

  }
  if (v34) {
  BOOL v36 = v9;
  }
  if (v9)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = oslog;
      os_log_type_t v11 = v30;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Language observer: Lockdown has overridden values will push without deferring transitions…", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BFFNavigationController *)v40->_nav setPushWithoutDeferringTransitionsWhileInBackground:1];
    id v12 = [(SetupController *)v40 environment];
    id v13 = [(BYEnvironment *)v12 buddyPreferencesExcludedFromBackup];
    [v13 setObject:&__kCFBooleanTrue forKey:@"PushWithoutDeferringTransitionsWhileInBackground" persistImmediately:1];
  }
  os_log_t v28 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v14 = v28;
    os_log_type_t v15 = v27;
    sub_10004B24C(v26);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Language observer: changed", v26, 2u);
  }
  objc_storeStrong((id *)&v28, 0);
  if (!v38) {
    goto LABEL_27;
  }
  id v16 = +[NSLocale preferredLanguages];
  id v25 = [(NSArray *)v16 firstObject];

  char v24 = 0;
  char v24 = ([v25 isEqualToString:v40->_languageAtStartup] ^ 1) & 1;
  if (v24)
  {
    [(SetupController *)v40 respring];
    int v23 = 1;
  }
  else
  {
    int v23 = 0;
  }
  objc_storeStrong(&v25, 0);
  if (!v23)
  {
LABEL_27:
    if (!v37) {
      goto LABEL_23;
    }
    id v22 = (id)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    char v21 = 0;
    char v21 = ![(NSString *)v40->_localeIdentifierAtStartup isEqualToString:v22];
    if (v21)
    {
      id v17 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v22];
      id v20 = [v17 countryCode];

      [(SetupController *)v40 _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:v20];
      uint64_t v18 = [(SetupController *)v40 environment];
      id v19 = [(BYEnvironment *)v18 capabilities];
      [v19 eligibilitySetDeviceLocale:v20];

      [(SetupController *)v40 respring];
      int v23 = 1;
      objc_storeStrong(&v20, 0);
    }
    else
    {
      int v23 = 0;
    }
    objc_storeStrong(&v22, 0);
    if (!v23) {
LABEL_23:
    }
      int v23 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)respring
{
  char v5 = self;
  location[1] = (id)a2;
  SBSLockDevice();
  [(BFFWindow *)v5->_window setUserInteractionEnabled:0];
  location[0] = +[SBSRelaunchAction actionWithReason:@"Language change remotely" options:6 targetURL:0];
  id v2 = +[FBSSystemService sharedService];
  os_log_type_t v3 = +[NSSet setWithObject:location[0]];
  [v2 sendActions:v3 withResult:0];

  objc_storeStrong(location, 0);
}

- (BOOL)isAlertPresented:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SetupController *)v9 navigationController];
  id v4 = [v3 topViewController];
  id v5 = [v4 presentedViewController];
  BOOL v6 = v5 == location[0];

  objc_storeStrong(location, 0);
  return v6;
}

- (void)dismissAlert:(id)a3 animated:(BOOL)a4
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SetupController *)v6 dismissAlert:location[0] animated:a4 completion:0];
  objc_storeStrong(location, 0);
}

- (void)dismissAlert:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if (![(SetupController *)v11 isAlertPresented:location[0]]
    || ([location[0] isBeingDismissed] & 1) != 0)
  {
    if (v8) {
      (*((void (**)(void))v8 + 2))();
    }
  }
  else
  {
    id v7 = [location[0] presentingViewController];
    [v7 dismissViewControllerAnimated:v9 completion:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_menuButtonPressed
{
  SEL v130 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v128 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v128;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Menu requested", buf, 2u);
  }
  objc_storeStrong(location, 0);
  id v4 = [(SetupController *)v130 navigationFlowController];
  char v125 = 0;
  char v123 = 0;
  char v5 = 0;
  if (![(BuddyNavigationFlowController *)v4 isStartOverAllowed])
  {
    id v126 = [(SetupController *)v130 navigationController];
    char v125 = 1;
    id v124 = [v126 topViewController];
    char v123 = 1;
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass() ^ 1;
  }
  if (v123) {

  }
  if (v125) {
  if ((v5 & 1) == 0 && !v130->_emergencyDialer)
  }
  {
    id v6 = [(SetupController *)v130 navigationController];
    id v7 = [v6 topViewController];
    id v122 = [v7 presentedViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v122;
    }
    else {
      id v8 = 0;
    }
    objc_storeStrong(&v122, v8);
    if (v130->_homeButtonMenuController)
    {
      [(SetupController *)v130 dismissAlert:v130->_homeButtonMenuController animated:1];
      [(SetupController *)v130 _removeSBAlertItemsSupressionAssertion];
      objc_storeStrong((id *)&v130->_homeButtonMenuController, 0);
    }
    else if (!v122)
    {
      if (v130->_buddyDone)
      {
        if ([(SetupController *)v130 allowDismissalForExit])
        {
          [(SetupController *)v130 endLifecycleDueToCause:1];
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = oslog;
            os_log_type_t v61 = v63;
            sub_10004B24C(v62);
            _os_log_impl((void *)&_mh_execute_header, v60, v61, "Preventing lifecycle end as dismissal is not allowed", (uint8_t *)v62, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
      }
      else
      {
        id v9 = +[BuddySIMManager sharedManager];
        [v9 disallowSIMUnlock];

        id v10 = [(SetupController *)v130 navigationFlowController];
        id v121 = [(BuddyNavigationFlowController *)v10 topFlowItem];

        id v120 = 0;
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v121 displayLanguage];
          id v12 = v120;
          id v120 = v11;
        }
        char v117 = 0;
        char v115 = 0;
        if (BFFIsiPad())
        {
          id v118 = +[NSBundle mainBundle];
          char v117 = 1;
          id v13 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          id v116 = v13;
          char v115 = 1;
        }
        else
        {
          id v13 = 0;
        }
        id v119 = v13;
        if (v115) {

        }
        if (v117) {
        os_log_t v14 = +[UIAlertController alertControllerWithTitle:v119 message:0 preferredStyle:(BFFIsiPad() & 1) != 0];
        }
        homeButtonMenuController = v130->_homeButtonMenuController;
        v130->_homeButtonMenuController = v14;

        if (MGGetBoolAnswer() & 1)
        {
          id v16 = v130->_homeButtonMenuController;
          id v17 = +[NSBundle mainBundle];
          id v18 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          id v108 = _NSConcreteStackBlock;
          int v109 = -1073741824;
          int v110 = 0;
          os_log_type_t v111 = sub_100054634;
          os_log_t v112 = &unk_1002B1040;
          id v113 = v130;
          id v19 = +[UIAlertAction actionWithTitle:v18 style:2 handler:&v108];
          [(UIAlertController *)v16 addAction:v19];

          [(SetupController *)v130 _addSBAlertItemsSupressionAssertion];
          objc_storeStrong((id *)&v113, 0);
        }
        id v107 = +[BuddyAccessibilityUtilities accessibilityViewController];
        char v105 = 0;
        char v103 = 0;
        BOOL v20 = 0;
        if (v107)
        {
          id v106 = [(SetupController *)v130 navigationController];
          char v105 = 1;
          id v104 = [v106 presentedViewController];
          char v103 = 1;
          BOOL v20 = v104 == 0;
        }
        if (v103) {

        }
        if (v105) {
        if (v20)
        }
        {
          char v21 = v130->_homeButtonMenuController;
          id v22 = +[NSBundle mainBundle];
          id v23 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          id v96 = _NSConcreteStackBlock;
          int v97 = -1073741824;
          int v98 = 0;
          int v99 = sub_1000548D0;
          int v100 = &unk_1002B1068;
          char v101 = v130;
          id v102 = v107;
          char v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:&v96];
          [(UIAlertController *)v21 addAction:v24];

          objc_storeStrong(&v102, 0);
          objc_storeStrong((id *)&v101, 0);
        }
        id v95 = 0;
        id v25 = [(SetupController *)v130 environment];
        id v26 = [(BYEnvironment *)v25 networkProvider];
        char v93 = 0;
        BOOL showWiFiInMenu = 0;
        if ([v26 supportsWiFi])
        {
          id v94 = [(BFFNavigationController *)v130->_nav presentedViewController];
          char v93 = 1;
          BOOL showWiFiInMenu = 0;
          if (!v94) {
            BOOL showWiFiInMenu = v130->_showWiFiInMenu;
          }
        }
        if (v93) {

        }
        if (showWiFiInMenu)
        {
          id v28 = [(SetupController *)v130 navigationController];
          id v29 = [v28 topViewController];
          os_log_type_t v30 = [(SetupController *)v130 navigationFlowController];
          os_log_type_t v31 = [(BuddyNavigationFlowController *)v30 wifiController];
          id v32 = [(BuddyWiFiController *)v31 viewController];

          if (v29 == v32 || !v130->_wifiControllerInAdvancedMode)
          {
            id v33 = (id)SFLocalizableWAPIStringKeyForKey();
            char v34 = +[NSBundle mainBundle];
            id v35 = (id)SFLocalizedStringFromTableInBundleForLanguage();
            id v36 = v95;
            id v95 = v35;
          }
        }
        if (v95)
        {
          BOOL v37 = v130->_homeButtonMenuController;
          int v87 = _NSConcreteStackBlock;
          int v88 = -1073741824;
          int v89 = 0;
          int v90 = sub_100054A04;
          v91 = &unk_1002B1040;
          os_log_type_t v92 = v130;
          BOOL v38 = +[UIAlertAction actionWithTitle:v95 style:0 handler:&v87];
          [(UIAlertController *)v37 addAction:v38];

          objc_storeStrong((id *)&v92, 0);
        }
        char v86 = 0;
        char v84 = 0;
        unsigned __int8 v39 = 0;
        if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0)
        {
          id v85 = [(SetupController *)v130 navigationFlowController];
          char v84 = 1;
          unsigned __int8 v39 = [v85 isStartOverAllowed];
        }
        if (v84) {

        }
        char v86 = v39 & 1;
        if (v39)
        {
          int v40 = v130->_homeButtonMenuController;
          Boolean v41 = +[NSBundle mainBundle];
          id v42 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          id v78 = _NSConcreteStackBlock;
          int v79 = -1073741824;
          int v80 = 0;
          uint64_t v81 = sub_100054B0C;
          id v82 = &unk_1002B1040;
          id v83 = v130;
          id v43 = +[UIAlertAction actionWithTitle:v42 style:0 handler:&v78];
          [(UIAlertController *)v40 addAction:v43];

          objc_storeStrong((id *)&v83, 0);
        }
        if (+[BuddyMenuController supportsHomeGesture])
        {
          id v44 = v130->_homeButtonMenuController;
          id v45 = +[NSBundle mainBundle];
          id v46 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          v72 = _NSConcreteStackBlock;
          int v73 = -1073741824;
          int v74 = 0;
          id v75 = sub_100054D44;
          id v76 = &unk_1002B1040;
          v77 = v130;
          v47 = +[UIAlertAction actionWithTitle:v46 style:0 handler:&v72];
          [(UIAlertController *)v44 addAction:v47];

          objc_storeStrong((id *)&v77, 0);
        }
        if (+[DMCMultiUserModeUtilities inSharediPadUserSession])
        {
          id v48 = v130->_homeButtonMenuController;
          os_log_type_t v49 = +[NSBundle mainBundle];
          id v50 = (id)SFLocalizedStringFromTableInBundleForLanguage();
          char v51 = +[UIAlertAction actionWithTitle:v50 style:0 handler:&stru_1002B10A8];
          [(UIAlertController *)v48 addAction:v51];
        }
        if (os_variant_has_internal_ui())
        {
          id v52 = +[BYPreferencesController buddyPreferencesEphemeral];
          unsigned __int8 v53 = [v52 BOOLForKey:@"showInternalUI"];

          v54 = v130->_homeButtonMenuController;
          if (v53) {
            id v55 = +[UIAlertAction actionWithTitle:@"Hide Internal UI" style:0 handler:&stru_1002B10E8];
          }
          else {
            id v55 = +[UIAlertAction actionWithTitle:@"Show Internal UI" style:0 handler:&stru_1002B1108];
          }
          [(UIAlertController *)v54 addAction:v55];
        }
        BFFIsiPad();
        id v56 = +[NSBundle mainBundle];
        id v71 = (id)SFLocalizedStringFromTableInBundleForLanguage();

        v57 = v130->_homeButtonMenuController;
        unsigned __int8 v65 = _NSConcreteStackBlock;
        int v66 = -1073741824;
        int v67 = 0;
        id v68 = sub_1000551EC;
        id v69 = &unk_1002B1040;
        id v70 = v130;
        id v58 = +[UIAlertAction actionWithTitle:v71 style:1 handler:&v65];
        [(UIAlertController *)v57 addAction:v58];

        id v59 = [(SetupController *)v130 navigationController];
        [v59 buddy_presentAlertController:v130->_homeButtonMenuController];

        objc_storeStrong((id *)&v70, 0);
        objc_storeStrong(&v71, 0);
        objc_storeStrong(&v95, 0);
        objc_storeStrong(&v107, 0);
        objc_storeStrong(&v119, 0);
        objc_storeStrong(&v120, 0);
        objc_storeStrong(&v121, 0);
      }
    }
    objc_storeStrong(&v122, 0);
  }
}

- (void)_showModalWiFiSettings
{
  id v42 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v40;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Manage WiFi.", buf, 2u);
  }
  objc_storeStrong(location, 0);
  id v4 = [(SetupController *)v42 navigationController];
  id v5 = [v4 topViewController];
  id v6 = [(SetupController *)v42 navigationFlowController];
  id v7 = [(BuddyNavigationFlowController *)v6 wifiController];
  id v8 = [(BuddyWiFiController *)v7 viewController];

  if (v5 == v8)
  {
    id v9 = [(SetupController *)v42 navigationFlowController];
    id v10 = [(BuddyNavigationFlowController *)v9 wifiController];
    [(BuddyWiFiController *)v10 setShowNetworkSettings:1];

    v42->_wifiControllerInAdvancedMode = 1;
  }
  else
  {
    id v38 = objc_alloc_init((Class)sub_100055710());
    [v38 setShowNetworkSettings:1];
    id v11 = +[BuddyActivationConfiguration currentConfiguration];
    [v38 setSupportsCellularActivation:[v11 supportsCellularActivation]];

    [v38 setBuddyDelegate:v42];
    id v12 = (WFNetworkListController *)[objc_alloc((Class)sub_100055828()) initWithViewController:v38];
    modalWifiManager = v42->_modalWifiManager;
    v42->_modalWifiManager = v12;

    id v14 = objc_alloc((Class)UIBarButtonItem);
    os_log_type_t v15 = +[NSBundle mainBundle];
    id v16 = [(NSBundle *)v15 localizedStringForKey:@"DONE" value:&stru_1002B4E18 table:@"Localizable"];
    id v17 = [v14 initWithTitle:v16 style:2 target:v42 action:"_modalWifiControllerDone:"];
    id v18 = [(WFNetworkListController *)v42->_modalWifiManager viewController];
    id v19 = [v18 navigationItem];
    [v19 setRightBarButtonItem:v17];

    id v37 = [v38 buddy_animationController:@"WIFI"];
    id v20 = objc_alloc((Class)BFFNavigationController);
    id v21 = [(WFNetworkListController *)v42->_modalWifiManager viewController];
    id v36 = [v20 initWithRootViewController:v21];

    id v22 = [(SetupController *)v42 navigationController];
    [v22 forcedPreferredContentSize];
    *(double *)&long long v35 = v23;
    *((double *)&v35 + 1) = v24;
    long long v34 = v35;
    [v36 setForcedPreferredContentSize:v23, v24];

    id v25 = [(SetupController *)v42 navigationFlowController];
    [v36 setDelegate:v25];

    id v26 = [(SetupController *)v42 navigationController];
    [v36 setModalPresentationStyle:[v26 modalPresentationStyle]];

    id v27 = [(SetupController *)v42 navigationController];
    id v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    os_log_type_t v31 = sub_100055940;
    id v32 = &unk_1002B0D20;
    id v33 = v37;
    [v27 presentViewController:v36 animated:1 completion:&v28];

    [(WFNetworkListController *)v42->_modalWifiManager startScanning];
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
}

- (void)_modalWifiControllerDone:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SetupController *)v5 navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  objc_storeStrong(location, 0);
}

- (void)_addSBAlertItemsSupressionAssertion
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_sbAlertItemsSuppressionAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Adding SBSAlertItemsSuppressionAssertion!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v7->_sbAlertItemsSuppressionAssertion = (SBSAlertItemsSuppressionAssertion *)SBSAlertItemsSuppressionAssertionCreate();
  }
}

- (void)_removeSBAlertItemsSupressionAssertion
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_sbAlertItemsSuppressionAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Removing SBSAlertItemsSuppressionAssertion!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    CFRelease(v7->_sbAlertItemsSuppressionAssertion);
    v7->_sbAlertItemsSuppressionAssertion = 0;
  }
}

- (void)dialerDidDismiss:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SetupController *)v10 _removeSBAlertItemsSupressionAssertion];
  objc_storeStrong((id *)&v10->_emergencyDialer, 0);
  id v3 = +[BuddySIMManager sharedManager];
  [v3 allowSIMUnlock];

  id v4 = [(SetupController *)v10 environment];
  id v5 = [(BYEnvironment *)v4 proximitySetupController];
  unsigned __int8 v6 = [v5 shouldEnableProximity];

  if (v6)
  {
    id v7 = [(SetupController *)v10 environment];
    id v8 = [(BYEnvironment *)v7 proximitySetupController];
    [v8 beginAdvertisingProximitySetup];
  }
  objc_storeStrong(location, 0);
}

- (void)_setupSnapshotRemoved
{
  id v17 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v15;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "SpringBoard removed the screen snapshot", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  char v13 = 0;
  unsigned __int8 v4 = 1;
  if (!v17->_shouldAnimateLocaleScreen) {
    unsigned __int8 v4 = [(SetupController *)v17 shouldProceedFromAppearancePane];
  }
  char v13 = v4 & 1;
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    unsigned __int8 v6 = &_dispatch_main_q;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_100055DFC;
    id v11 = &unk_1002B0D20;
    id v12 = v17;
    dispatch_after(v5, (dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (void)_setupStateChanged
{
  int v9 = self;
  v8[1] = (id)a2;
  id v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  unsigned __int8 v6 = sub_100055F88;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showMiniAlertWithRestart:(BOOL)a3 withLanguage:(id)a4
{
  id v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int v4 = +[NSBundle mainBundle];
  id obj = (id)SFLocalizedStringFromTableInBundleForLanguage();

  id v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v22 pointSize];
  id v21 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  id v5 = objc_alloc((Class)NSMutableAttributedString);
  id v6 = sub_100147FCC(obj, location);
  id v20 = [v5 initWithAttributedString:v6];

  NSAttributedStringKey v32 = NSFontAttributeName;
  id v33 = v21;
  id v7 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v8 = [v20 length];
  uint64_t v29 = 0;
  id v28 = v8;
  uint64_t v30 = 0;
  id v31 = v8;
  v19[2] = v8;
  v19[1] = 0;
  [v20 addAttributes:v7 range:0];

  v19[0] = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  [v19[0] _setAttributedTitle:v20];
  id v9 = [(SetupController *)v27 navigationController];
  id v10 = [v9 topViewController];
  BOOL v11 = v25;
  id v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  os_log_type_t v15 = sub_100056530;
  id v16 = &unk_1002B1130;
  BOOL v18 = v25;
  id v17 = v27;
  [v10 presentViewController:v19[0] animated:v11 completion:&v12];

  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&location, 0);
}

- (void)_languageChangeAlertDone
{
  id location[2] = self;
  location[1] = (id)a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleLanguagePreferencesChangedNotification", 0, 0, 1u);
  os_log_type_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v3, @"com.apple.language.changed", 0, 0, 1u);
  int v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, BYSetupAssistantDidCompleteLanguageLocaleNotification, 0, 0, 1u);
  location[0] = +[SBSRelaunchAction actionWithReason:@"Language change in Setup Assistant" options:6 targetURL:0];
  id v5 = +[FBSSystemService sharedService];
  id v6 = +[NSSet setWithObject:location[0]];
  [v5 sendActions:v6 withResult:0];

  objc_storeStrong(location, 0);
}

- (void)userDidChooseLanguage
{
  os_log_t oslog[2] = &self->super;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Setting up QR code control center module...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id location = objc_alloc_init((Class)sub_100056748());
  [location setUpQRCodeControlCenterModuleWithCompletionHandler:&stru_1002B1170];
  objc_storeStrong(&location, 0);
}

- (BOOL)_didRestoreIniTunes
{
  id v2 = +[BYSetupStateManager sharedManager];
  BOOL v3 = [v2 restoreType] == (id)1;

  return v3;
}

- (BOOL)_restoreFromBackupJustFinished
{
  v9[2] = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init((Class)MBManager);
  id v8 = [v9[0] restoreInfo];
  id location = [v8 date];
  [location timeIntervalSinceNow];
  double v6 = v2;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100056BAC((uint64_t)buf, (uint64_t)location, COERCE__INT64(v6 * -1.0));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Last restore date = %{public}@, %lf seconds ago.", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  BOOL v3 = 0;
  if (location)
  {
    BOOL v3 = 0;
    if (v6 < 0.0) {
      BOOL v3 = v6 > -600.0;
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return v3;
}

- (void)_localeChanged
{
  v11[2] = self;
  v11[1] = (id)a2;
  v11[0] = +[NSUserDefaults standardUserDefaults];
  [v11[0] synchronize];
  id v2 = [v11[0] objectForKey:@"LockdownSetLanguage"];
  BOOL v3 = v2 != 0;

  BOOL v10 = v3;
  if (v3)
  {
    int v4 = +[NSFileManager defaultManager];
    unsigned __int8 v5 = [(NSFileManager *)v4 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/Warranty.html"];

    if (v5)
    {
      int v9 = 1;
    }
    else if (BYSetupAssistantHasCompletedInitialRun())
    {
      int v9 = 1;
    }
    else
    {
      id location = +[BuddyWarrantyTCController warrantyFilePath];
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004CECC((uint64_t)buf, (uint64_t)location, @"/var/mobile/Media/iTunes_Control/iTunes/Warranty.html");
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Copying Warranty from %{public}@ to %{public}@", buf, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      double v6 = +[NSFileManager defaultManager];
      [(NSFileManager *)v6 copyItemAtPath:location toPath:@"/var/mobile/Media/iTunes_Control/iTunes/Warranty.html" error:0];

      objc_storeStrong(&location, 0);
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 1;
  }
  objc_storeStrong(v11, 0);
}

- (BOOL)updateLanguageLocale:(id)a3
{
  char v93 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v91 = (id)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v91];
  id v90 = [v3 countryCode];

  [(SetupController *)v93 _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:v90];
  int v4 = [(SetupController *)v93 environment];
  id v5 = [(BYEnvironment *)v4 capabilities];
  [v5 eligibilitySetDeviceLocale:v90];

  id v89 = +[NSUserDefaults standardUserDefaults];
  id v88 = v93->_languageAtStartup;
  id v87 = 0;
  id v86 = 0;
  id v85 = 0;
  char v84 = 1;
  char v83 = 0;
  double v6 = [(SetupController *)v93 environment];
  id v7 = [(BYEnvironment *)v6 proximitySetupController];
  id v8 = [v7 receivedLanguages];
  id v9 = [v8 count];

  if (v9)
  {
    BOOL v10 = +[NSBundle mainBundle];
    BOOL v11 = [(NSBundle *)v10 localizations];
    id v12 = [(SetupController *)v93 environment];
    id v13 = [(BYEnvironment *)v12 proximitySetupController];
    id v14 = [v13 receivedLanguages];
    os_log_type_t v15 = +[NSBundle preferredLocalizationsFromArray:v11 forPreferences:v14];
    id v16 = [(NSArray *)v15 firstObject];
    id v17 = v87;
    id v87 = v16;

    char v84 = 0;
    BOOL v18 = [(SetupController *)v93 environment];
    id v19 = [(BYEnvironment *)v18 proximitySetupController];
    id v20 = [v19 receivedLanguages];
    id v21 = v85;
    id v85 = v20;

    id v22 = [(SetupController *)v93 preferredLanguagesAtStartup];
    char v83 = ([v85 isEqualToArray:v22] ^ 1) & 1;
  }
  else
  {
    double v23 = [(SetupController *)v93 userSelectedLanguageWithLocale];

    if (v23)
    {
      double v24 = [(SetupController *)v93 userSelectedLanguageWithLocale];
      id v25 = v87;
      id v87 = v24;

      SEL v26 = +[NSLocale localeWithLocaleIdentifier:v87];
      id v27 = [(NSLocale *)v26 regionCode];
      id v28 = v86;
      id v86 = v27;
    }
    else
    {
      uint64_t v29 = [(SetupController *)v93 userSelectedLanguage];

      if (v29)
      {
        uint64_t v30 = [(SetupController *)v93 userSelectedLanguage];
        id v31 = v87;
        id v87 = v30;
      }
    }
  }
  if (v87 && !v85)
  {
    id v99 = v87;
    id v85 = +[NSArray arrayWithObjects:&v99 count:1];
  }
  if (v87) {
    id v32 = v87;
  }
  else {
    id v32 = v88;
  }
  id v82 = v32;
  id v33 = [(SetupController *)v93 environment];
  id v34 = [(BYEnvironment *)v33 buddyPreferences];
  [v34 setObject:v82 forKey:@"Language"];

  [v89 removeObjectForKey:@"LockdownSetLanguage"];
  [v89 removeObjectForKey:@"LockdownSetLocale"];
  BOOL v81 = 1;
  if (v87 && ([v88 isEqualToString:v87] & 1) == 0)
  {
    long long v35 = +[NSBundle mainBundle];
    id v36 = [(NSBundle *)v35 preferredLocalizations];
    id v80 = [(NSArray *)v36 firstObject];

    id v37 = +[NSBundle mainBundle];
    id v38 = [(NSBundle *)v37 localizations];
    unsigned __int8 v39 = +[NSBundle preferredLocalizationsFromArray:v38 forPreferences:v85];
    id v79 = [(NSArray *)v39 firstObject];

    if ([v80 length] && objc_msgSend(v79, "length")) {
      BOOL v81 = ([v79 isEqualToString:v80] & 1) == 0;
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v77 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100057BFC((uint64_t)buf, (uint64_t)v80, (uint64_t)v79, v81);
      _os_log_impl((void *)&_mh_execute_header, oslog, v77, "currentBundle: %{public}@; selectedBundle: %{public}@; selectedLanguageLoadsDifferentBundle? %d",
        buf,
        0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
  }
  if (v83)
  {
    os_log_t v76 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v40 = v76;
      os_log_type_t v41 = v75;
      sub_10004B24C(v74);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Preferred languages did change (via proximity), will trigger a language restart", v74, 2u);
    }
    objc_storeStrong((id *)&v76, 0);
  }
  if (v87 && ([v88 isEqualToString:v87] & 1) == 0 && (v81 || (v83 & 1) != 0))
  {
    os_log_t v64 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004CECC((uint64_t)v95, (uint64_t)v88, (uint64_t)v87);
      _os_log_impl((void *)&_mh_execute_header, v64, v63, "language changed (%{public}@ to %{public}@), prepping for restart...", v95, 0x16u);
    }
    objc_storeStrong((id *)&v64, 0);
    [(BFFWindow *)v93->_window setUserInteractionEnabled:0];
    if (location[0]) {
      (*((void (**)(void))location[0] + 2))();
    }
    [v89 setObject:v82 forKey:@"Language"];
    [v89 synchronize];
    id v52 = [(SetupController *)v93 environment];
    id v53 = [(BYEnvironment *)v52 buddyPreferencesExcludedFromBackup];
    [v53 setObject:&__kCFBooleanTrue forKey:@"AnimateLanguageChoice" persistImmediately:1];

    CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
    if (v84) {
      +[NSLocale setPreferredLanguages:v85];
    }
    if (v86)
    {
      +[IPSettingsUtilities setRegion:v86 changeLanguageVariant:1 postNotification:1];
      CFPropertyListRef v62 = CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      id v54 = +[UIKeyboardPreferencesController sharedPreferencesController];
      [v54 setValue:v62 forKey:3];

      id v55 = [(SetupController *)v93 environment];
      id v56 = [(BYEnvironment *)v55 buddyPreferences];
      [v56 setObject:v62 forKey:@"Locale"];

      objc_storeStrong((id *)&v62, 0);
    }
    [(SetupController *)v93 userDidChooseLanguage];
    [(SetupController *)v93 _persistAnalyticsForLanguageReboot];
    v57 = [(SetupController *)v93 environment];
    id v58 = [(BYEnvironment *)v57 proximitySetupController];
    [v58 prepareForReboot];

    id v59 = [(SetupController *)v93 environment];
    id v60 = [(BYEnvironment *)v59 proximitySetupController];
    [v60 endAdvertisingProximitySetup];

    [(SetupController *)v93 _showMiniAlertWithRestart:1 withLanguage:v87];
    char v94 = 1;
    int v65 = 1;
  }
  else
  {
    os_log_t v73 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004CECC((uint64_t)v97, (uint64_t)v88, (uint64_t)v87);
      _os_log_impl((void *)&_mh_execute_header, v73, v72, "Language did not change (%{public}@ => %{public}@)!", v97, 0x16u);
    }
    objc_storeStrong((id *)&v73, 0);
    [v89 synchronize];
    id v71 = [v89 objectForKey:@"AppleLanguages"];
    id v70 = [v71 firstObject];
    char v69 = 0;
    char v42 = 0;
    if (v87) {
      char v42 = [v70 isEqualToString:v87] ^ 1;
    }
    char v69 = v42 & 1;
    os_log_t v68 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004CECC((uint64_t)v96, (uint64_t)v70, (uint64_t)v87);
      _os_log_impl((void *)&_mh_execute_header, v68, v67, "current default: %{public}@; selected language: %{public}@",
        v96,
        0x16u);
    }
    objc_storeStrong((id *)&v68, 0);
    if ((v69 & 1) != 0 || !v81)
    {
      if (v84) {
        +[NSLocale setPreferredLanguages:v85];
      }
      if (v86)
      {
        +[IPSettingsUtilities setRegion:v86 changeLanguageVariant:1 postNotification:1];
        id v66 = (id)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
        id v43 = +[UIKeyboardPreferencesController sharedPreferencesController];
        [v43 setValue:v66 forKey:3];

        id v44 = [(SetupController *)v93 environment];
        id v45 = [(BYEnvironment *)v44 buddyPreferences];
        [v45 setObject:v66 forKey:@"Locale"];

        objc_storeStrong(&v66, 0);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleLanguagePreferencesChangedNotification", 0, 0, 1u);
      v47 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v47, @"com.apple.language.changed", 0, 0, 1u);
    }
    id v48 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v48, BYSetupAssistantDidCompleteLanguageLocaleNotification, 0, 0, 1u);
    [(SetupController *)v93 userDidChooseLanguage];
    os_log_type_t v49 = [(SetupController *)v93 environment];
    id v50 = [(BYEnvironment *)v49 proximitySetupController];
    [v50 languageChangeCompleted];

    id v51 = +[BuddySIMManager sharedManager];
    [v51 allowSIMUnlock];

    char v94 = 0;
    int v65 = 1;
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(location, 0);
  return v94 & 1;
}

- (void)_setupAnalytics
{
  id v25 = self;
  v24[1] = (id)a2;
  id v2 = [BuddyNavigationAnalytics alloc];
  id v3 = [(SetupController *)v25 navigationController];
  int v4 = [(BuddyNavigationAnalytics *)v2 initWithNavigationController:v3];
  [(SetupController *)v25 setNavigationAnalytics:v4];

  id v5 = [(SetupController *)v25 environment];
  id v6 = [(BYEnvironment *)v5 buddyPreferencesExcludedFromBackup];
  id v7 = +[BuddySetupAnalytics loadFromDiskWithPreferences:v6];
  [(SetupController *)v25 setSetupAnalytics:v7];

  id v8 = [(SetupController *)v25 setupAnalytics];
  LOBYTE(v7) = v8 == 0;

  if (v7)
  {
    id v9 = [BuddySetupAnalytics alloc];
    BOOL v10 = [(SetupController *)v25 environment];
    id v11 = [(BYEnvironment *)v10 buddyPreferencesExcludedFromBackup];
    id v12 = [(BuddySetupAnalytics *)v9 initWithPreferences:v11];
    [(SetupController *)v25 setSetupAnalytics:v12];

    LOBYTE(v12) = BYSetupAssistantHasCompletedInitialRun();
    id v13 = [(SetupController *)v25 setupAnalytics];
    [(BuddySetupAnalytics *)v13 setHasCompletedInitialSetup:v12 & 1];
  }
  id v14 = [(SetupController *)v25 environment];
  id v15 = [(BYEnvironment *)v14 buddyPreferences];
  v24[0] = +[BuddyRestoreState loadFromPreferences:v15];

  id v16 = [(SetupController *)v25 environment];
  id v17 = [(BYEnvironment *)v16 buddyPreferencesExcludedFromBackup];
  id v23 = +[BuddyMigrationState loadFromPreferences:v17];

  if (v24[0] || v23)
  {
    id location = [v24[0] persistDate];
    if (!location)
    {
      id location = [v23 persistDate];
    }
    BOOL v18 = [(SetupController *)v25 setupAnalytics];
    [(BuddySetupAnalytics *)v18 setSoftwareUpdatePerformed:1];

    [location timeIntervalSinceNow];
    double v20 = -v19;
    id v21 = [(SetupController *)v25 setupAnalytics];
    [(BuddySetupAnalytics *)v21 setOtherDuration:v20];

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
}

- (void)_preStashAnalytics
{
  [(SetupController *)self _populateSetupAnalytics];
  id v2 = [(SetupController *)self navigationAnalytics];
  [(BuddyNavigationAnalytics *)v2 prepareEventForCurrentViewController];

  id v3 = [(SetupController *)self navigationAnalytics];
  int v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 analyticsManager];
  [(BuddyNavigationAnalytics *)v3 addEventsUsingAnalyticsManager:v5];

  id v6 = [(SetupController *)self setupAnalytics];
  id v7 = [(SetupController *)self environment];
  id v8 = [(BYEnvironment *)v7 analyticsManager];
  [(BuddySetupAnalytics *)v6 addEventUsingAnalyticsManager:v8];

  [(SetupController *)self setSetupAnalytics:0];
}

- (void)_stashAnalytics
{
  [(SetupController *)self _preStashAnalytics];
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 analyticsManager];
  int v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 settingsManager];
  [v3 stash:v5];

  id v6 = [(SetupController *)self environment];
  id v7 = [(BYEnvironment *)v6 analyticsManager];
  [v7 reset];
}

- (void)_preCommitAnalytics
{
  [(SetupController *)self _populateSetupAnalytics];
  [(SetupController *)self _populatePowerLogAnalytics];
  id v2 = [(SetupController *)self navigationAnalytics];
  [(BuddyNavigationAnalytics *)v2 prepareEventForCurrentViewController];

  id v3 = [(SetupController *)self navigationAnalytics];
  int v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 analyticsManager];
  [(BuddyNavigationAnalytics *)v3 addEventsUsingAnalyticsManager:v5];

  id v6 = [(SetupController *)self setupAnalytics];
  id v7 = [(SetupController *)self environment];
  id v8 = [(BYEnvironment *)v7 analyticsManager];
  [(BuddySetupAnalytics *)v6 addEventUsingAnalyticsManager:v8];
}

- (void)_commitAnalytics
{
  [(SetupController *)self _preCommitAnalytics];
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 analyticsManager];
  [v3 commit];
}

- (void)_populateSetupAnalytics
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 setupMethod];
  id v4 = [v3 dataTransferMethod];
  id v5 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v5 setDataTransferMethod:v4];

  id v6 = [(SetupController *)self setupAnalytics];
  id v7 = [(SetupController *)self environment];
  id v8 = [(BYEnvironment *)v7 networkProvider];
  -[BuddySetupAnalytics setInAppleStore:](v6, "setInAppleStore:", (-[BuddySetupAnalytics inAppleStore](v6, "inAppleStore") | [v8 inAppleStore] & 1) != 0);

  id v9 = [(SetupController *)self setupAnalytics];
  id v10 = [(BFFNavigationController *)self->_nav viewControllers];
  -[BuddySetupAnalytics setNumberOfPanesPresented:](v9, "setNumberOfPanesPresented:", (char *)[v10 count] + -[BuddySetupAnalytics numberOfPanesPresented](v9, "numberOfPanesPresented"));

  id v11 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v11 backgroundDuration];
  [(BuddySetupAnalytics *)v11 setBackgroundDuration:v12 + self->_cumulativeLockedDuration];

  id v13 = [(SetupController *)self setupAnalytics];
  +[BuddyTimestamp intervalSinceTimestamp:self->_buddyStartTimestamp];
  double v15 = v14 - self->_cumulativeLockedDuration;
  [(BuddySetupAnalytics *)v13 activeDuration];
  [(BuddySetupAnalytics *)v13 setActiveDuration:v16 + v15];

  id v17 = +[ACAccountStore defaultStore];
  id v18 = [v17 aa_primaryAppleAccount];
  double v19 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v19 setIsSignedIntoAppleID:v18 != 0];

  double v20 = [(SetupController *)self environment];
  id v21 = [(BYEnvironment *)v20 flowSkipController];
  id v22 = [v21 getFlowSkipIdentifiers];
  id v23 = [v22 count];
  double v24 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v24 setFollowUpItemsCount:v23];
}

- (void)_populatePowerLogAnalytics
{
  id v2 = objc_alloc_init((Class)BYSetupUserDisposition);
  id v3 = [v2 date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  id v6 = [(SetupController *)self environment];
  id v7 = [(BYEnvironment *)v6 analyticsManager];
  id v8 = +[NSNumber numberWithDouble:v5];
  [v7 addPowerLogEvent:0 withPayload:v8];

  id v9 = [(SetupController *)self environment];
  id v10 = [(BYEnvironment *)v9 setupMethod];

  if (v10)
  {
    id v11 = [(SetupController *)self environment];
    id v12 = [(BYEnvironment *)v11 analyticsManager];
    id v13 = [(SetupController *)self environment];
    id v14 = [(BYEnvironment *)v13 setupMethod];
    double v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 dataTransferMethod]);
    [v12 addPowerLogEvent:1 withPayload:v15];
  }
}

- (void)_persistAnalyticsForLanguageReboot
{
  [(SetupController *)self _populateSetupAnalytics];
  id v2 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v2 persist];
}

- (void)_persistAnalyticsForSoftwareUpdate
{
  [(SetupController *)self _populateSetupAnalytics];
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 analyticsManager];
  double v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 settingsManager];
  [v3 stash:v5];

  id v6 = [(SetupController *)self setupAnalytics];
  [(BuddySetupAnalytics *)v6 persist];
}

- (void)displayProximityPinCode:(id)a3 language:(id)a4 visual:(BOOL)a5 accessibilitySettings:(id)a6
{
  id v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  BOOL v35 = a5;
  id v34 = 0;
  objc_storeStrong(&v34, a6);
  id v9 = [(SetupController *)v38 proximityPairingController];

  if (!v9)
  {
    id v10 = objc_alloc_init(BuddyProximityPairingController);
    [(SetupController *)v38 setProximityPairingController:v10];

    id v11 = (void *)_AXSCopySettingsDataBlobForBuddy();
    [(SetupController *)v38 setDefaultAccessibilitySettings:v11];

    id v12 = [(SetupController *)v38 navigationFlowController];
    id v13 = (uint64_t (**)(id, id))[(BuddyNavigationFlowController *)v12 environmentInjector];
    id v14 = [(SetupController *)v38 proximityPairingController];
    id v15 = (id)v13[2](v13, v14);
  }
  double v16 = [(SetupController *)v38 navigationFlowController];
  id v17 = [(SetupController *)v38 proximityPairingController];
  [(BuddyProximityPairingController *)v17 setDelegate:v16];

  id v18 = [(SetupController *)v38 proximityPairingController];
  [(BuddyProximityPairingController *)v18 setNonUserInitiatedDismissal:0];

  id v19 = location[0];
  double v20 = [(SetupController *)v38 proximityPairingController];
  [(BuddyProximityPairingController *)v20 setPairingCode:v19];

  id v21 = v36;
  id v22 = [(SetupController *)v38 proximityPairingController];
  [(BuddyProximityPairingController *)v22 setLanguage:v21];

  if (v35)
  {
    id v23 = [(SetupController *)v38 proximityPairingController];
    [(BuddyProximityPairingController *)v23 showVisualPairing];
  }
  else
  {
    id v23 = [(SetupController *)v38 proximityPairingController];
    [(BuddyProximityPairingController *)v23 showPairingCode];
  }

  id v24 = [(SetupController *)v38 navigationController];
  id v25 = [v24 topViewController];
  id v26 = [v25 navigationItem];
  id v27 = +[NSBundle mainBundle];
  id v28 = (id)SFLocalizedStringFromTableInBundleForLanguage();
  [v26 setBackButtonTitle:v28];

  id v29 = [(SetupController *)v38 navigationController];
  uint64_t v30 = (BuddyProximityPairingController *)[v29 topViewController];
  id v31 = [(SetupController *)v38 proximityPairingController];

  if (v30 != v31)
  {
    if (v34) {
      _AXSRestoreSettingsFromDataBlobForBuddy();
    }
    id v32 = [(SetupController *)v38 navigationFlowController];
    id v33 = [(SetupController *)v38 proximityPairingController];
    [(BuddyNavigationFlowController *)v32 pushFlowItem:v33 animated:1];
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissProximityPinCode
{
  id v2 = [(SetupController *)self navigationController];
  id v3 = (BuddyProximityPairingController *)[v2 topViewController];
  double v4 = [(SetupController *)self proximityPairingController];
  BOOL v5 = 0;
  if (v3 == v4) {
    BOOL v5 = ![(SetupController *)self applyingProximitySettings];
  }

  if (v5)
  {
    id v6 = [(SetupController *)self defaultAccessibilitySettings];
    _AXSRestoreSettingsFromDataBlobForBuddy();

    [(SetupController *)self setDefaultAccessibilitySettings:0];
    id v7 = [(SetupController *)self proximityPairingController];
    [(BuddyProximityPairingController *)v7 setNonUserInitiatedDismissal:1];

    id v8 = [(SetupController *)self navigationController];
    id v9 = [v8 popViewControllerAnimated:1];

    [(SetupController *)self setProximityPairingController:0];
  }
}

- (void)displayIncompatibleProximityPairingFromDeviceClass:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[NSBundle mainBundle];
  id v4 = +[BuddyLocalizationUtilities modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PAIRING_INVALID_TITLE" deviceClass:location[0]];
  id v13 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  BOOL v5 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PAIRING_INVALID_MESSAGE"];
  id v12 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Localizable"];

  id v11 = +[UIAlertController alertControllerWithTitle:v13 message:v12 preferredStyle:1];
  id v7 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v7 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:0];
  [(UIAlertController *)v11 addAction:v9];

  id v10 = [(SetupController *)v15 navigationController];
  [v10 presentViewController:v11 animated:1 completion:0];

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)displayUpdateRequiredToMigrate
{
  id v17 = self;
  v16[1] = (id)a2;
  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"SETUP_CONTROLLER"];
  [(BFFWindow *)v17->_window setUserInteractionEnabled:1];
  id v2 = [(SetupController *)v17 navigationController];
  id v3 = (BuddyProximityPairingController *)[v2 topViewController];
  id v4 = [(SetupController *)v17 proximityPairingController];

  if (v3 == v4)
  {
    id v5 = [(SetupController *)v17 navigationController];
    id v6 = [v5 popViewControllerAnimated:1];

    [(SetupController *)v17 setProximityPairingController:0];
  }
  id v7 = +[NSBundle mainBundle];
  v16[0] = [(NSBundle *)v7 localizedStringForKey:@"PROXIMITY_PAIRING_UPDATE_REQUIRED_TO_MIGRATE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  id v8 = +[NSBundle mainBundle];
  id v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_PAIRING_UPDATE_REQUIRED_TO_MIGRATE_MESSAGE"];
  id v15 = [(NSBundle *)v8 localizedStringForKey:v9 value:&stru_1002B4E18 table:@"Localizable"];

  id location = +[UIAlertController alertControllerWithTitle:v16[0] message:v15 preferredStyle:1];
  id v10 = +[NSBundle mainBundle];
  id v11 = [(NSBundle *)v10 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
  [location addAction:v12];

  id v13 = [(SetupController *)v17 navigationController];
  [v13 presentViewController:location animated:1 completion:0];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)willPerformProximityHandshake
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_1000594BC;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)willApplyProximitySettingsWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10005967C;
  id v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didApplyProximitySettingsWithWillReboot:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000597E4;
  id v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)unableToApplyProximitySettings
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_100059AB4;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)skippedApplyProximitySettings
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_100059C80;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_connectedToWiFiAfterProximity
{
  id v9 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v7;
    sub_10004B24C(v6);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Setting Wi-Fi network as connected and reachable as proximity has done the check for us", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  int v4 = [(SetupController *)v9 environment];
  id v5 = [(BYEnvironment *)v4 networkProvider];
  [v5 assumeNetworkReachabilityOverWiFi];
}

- (void)endAdvertisingProximitySetup
{
  id v2 = [(SetupController *)self navigationController];
  os_log_type_t v3 = (BuddyProximityPairingController *)[v2 topViewController];
  int v4 = [(SetupController *)self proximityPairingController];

  if (v3 != v4)
  {
    id v5 = [(SetupController *)self environment];
    id v6 = [(BYEnvironment *)v5 proximitySetupController];
    [v6 endAdvertisingProximitySetup];

    [(SetupController *)self dismissProximityPinCode];
  }
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  id v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  BOOL v16 = a4;
  if (a3)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10005A060(buf, v16);
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Activation State Changed, isActivated = %d", buf, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v4 = objc_alloc_init(BuddyActivationRecord);
    id v5 = [(SetupController *)v19 environment];
    [(BYEnvironment *)v5 setActivationRecord:v4];

    id v6 = &_dispatch_main_q;
    os_log_type_t v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_10005A074;
    id v11 = &unk_1002B1130;
    id v12 = v19;
    BOOL v13 = v16;
    dispatch_async((dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToPairingWithPin:(id)a4
{
  os_log_type_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = [BuddyProximityAutomatedDeviceEnrollmentPairingController alloc];
  id v11 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v5 initWithPairingCode:v12];
  id v6 = [(SetupController *)v14 navigationFlowController];
  os_log_type_t v7 = (uint64_t (**)(id, id))[(BuddyNavigationFlowController *)v6 environmentInjector];
  id v8 = (id)v7[2](v7, v11);

  int v9 = [(SetupController *)v14 navigationFlowController];
  [v11 setDelegate:v9];

  id v10 = [(SetupController *)v14 navigationFlowController];
  [(BuddyNavigationFlowController *)v10 pushFlowItem:v11 animated:1];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_prepareForDeviceMigrationAfterSoftwareUpdate:(BOOL)a3
{
  id v87 = self;
  SEL v86 = a2;
  BOOL v85 = a3;
  os_log_type_t v3 = [(SetupController *)self environment];
  id v4 = [(BYEnvironment *)v3 miscState];
  id v5 = [v4 migrationManager];

  if (!v5)
  {
    id location = 0;
    char v83 = 0;
    char v82 = +[BuddyMigrationCapability currentDeviceShouldOfferMigration];
    char v81 = 0;
    id v6 = [(SetupController *)v87 environment];
    id v7 = [(BYEnvironment *)v6 proximitySetupController];
    id v8 = [v7 information];
    int v9 = [(SetupController *)v87 environment];
    id v10 = [(BYEnvironment *)v9 proximitySetupController];
    id v11 = [v10 productVersion];
    id v12 = [(SetupController *)v87 environment];
    id v13 = [(BYEnvironment *)v12 proximitySetupController];
    id v14 = [v13 deviceClass];
    id obj = 0;
    unsigned __int8 v15 = +[BuddyMigrationCapability sourceDeviceSupportsMigration:v8 productVersion:v11 deviceClass:v14 softwareUpdateRequired:&v83 reason:&obj];
    objc_storeStrong(&location, obj);

    char v81 = v15 & 1;
    char v79 = 0;
    char v16 = 0;
    if (v82) {
      char v16 = v81;
    }
    char v79 = v16;
    if (v16)
    {
      objc_initWeak(&from, v87);
      BOOL v17 = [(SetupController *)v87 environment];
      id v18 = [(BYEnvironment *)v17 proximitySetupController];
      os_log_type_t v72 = _NSConcreteStackBlock;
      int v73 = -1073741824;
      int v74 = 0;
      os_log_type_t v75 = sub_10005AF44;
      os_log_t v76 = &unk_1002B0CA8;
      objc_copyWeak(&v77, &from);
      id v19 = [(SetupController *)v87 environment];
      id v20 = [(BYEnvironment *)v19 passcodeCacheManager];
      id v21 = [(SetupController *)v87 environment];
      id v22 = [(BYEnvironment *)v21 analyticsManager];
      id v23 = [(SetupController *)v87 environment];
      id v24 = [(BYEnvironment *)v23 lockdownModeProvider];
      id v25 = [v18 createTargetDeviceMigrationManagerWithPrepareForMigrationRebootBlock:&v72 passcodeCacheManager:v20 analyticsManager:v22 lockdownModeProvider:v24];
      CFPropertyListRef v62 = [(SetupController *)v87 environment];
      id v61 = [(BYEnvironment *)v62 miscState];
      [v61 setMigrationManager:v25];

      LOBYTE(v20) = v83;
      id v26 = [(SetupController *)v87 environment];
      id v27 = [(BYEnvironment *)v26 miscState];
      id v28 = [v27 migrationManager];
      [v28 setRequiresUpdateToMigrate:v20 & 1];

      id v29 = [(SetupController *)v87 environment];
      id v30 = [(BYEnvironment *)v29 networkProvider];
      id v31 = [(SetupController *)v87 environment];
      id v32 = [(BYEnvironment *)v31 miscState];
      id v33 = [v32 migrationManager];
      [v33 setNetworkProvider:v30];

      id v34 = [(SetupController *)v87 environment];
      id v35 = [(BYEnvironment *)v34 miscState];
      id v36 = [v35 migrationManager];
      LOBYTE(v31) = [v36 requiresUpdateToMigrate];

      if (v31)
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = oslog;
          os_log_type_t v38 = v70;
          sub_10004B24C(buf);
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "Migration requires update; not starting any migration operations...",
            buf,
            2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        unsigned __int8 v39 = [(SetupController *)v87 environment];
        id v40 = [(BYEnvironment *)v39 miscState];
        id v41 = [v40 migrationManager];
        [v41 setWillMigrate:1];
      }
      else
      {
        BOOL v42 = v85;
        id v43 = [(SetupController *)v87 environment];
        id v44 = [(BYEnvironment *)v43 miscState];
        id v45 = [v44 migrationManager];
        [v45 setSoftwareUpdateDidOccur:v42];

        id v46 = [(SetupController *)v87 environment];
        id v47 = [(BYEnvironment *)v46 proximitySetupController];
        [v47 beginDeviceToDeviceMigration];

        id v48 = [(SetupController *)v87 environment];
        id v49 = [(BYEnvironment *)v48 proximitySetupController];
        id v50 = [(SetupController *)v87 environment];
        id v51 = [(BYEnvironment *)v50 miscState];
        id v52 = [v51 migrationManager];
        [v49 addObserver:v52];

        id v53 = [(SetupController *)v87 environment];
        id v54 = [(BYEnvironment *)v53 miscState];
        id v55 = [v54 migrationManager];
        os_log_type_t v63 = _NSConcreteStackBlock;
        int v64 = -1073741824;
        int v65 = 0;
        id v66 = sub_10005AF88;
        os_log_type_t v67 = &unk_1002B0FF0;
        os_log_t v68 = v87;
        [v55 startKeychainDataTransferWithCompletionHandler:&v63];

        objc_storeStrong((id *)&v68, 0);
      }
      objc_destroyWeak(&v77);
      objc_destroyWeak(&from);
    }
    if (![location length]) {
      objc_storeStrong(&location, @"none");
    }
    id v56 = [(SetupController *)v87 environment];
    id v57 = [(BYEnvironment *)v56 analyticsManager];
    v88[0] = @"targetSupports";
    id v58 = +[NSNumber numberWithBool:v82 & 1];
    v89[0] = v58;
    v88[1] = @"sourceSupports";
    id v59 = +[NSNumber numberWithBool:v81 & 1];
    v89[1] = v59;
    v88[2] = @"reason";
    v89[2] = location;
    id v60 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:3];
    [v57 addEvent:@"com.apple.setupassistant.ios.migration.ability" withPayload:v60 persist:1];

    objc_storeStrong(&location, 0);
  }
}

- (void)_startDeviceMigration
{
  id v30 = self;
  location[1] = (id)a2;
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 buddyPreferences];
  [v3 setObject:&__kCFBooleanTrue forKey:@"RestoreChoice"];

  id v4 = [v30 environment];
  id v5 = [v4 setupMethod];
  [v5 setDataTransferMethod:2];

  id v6 = [v30 environment];
  id v7 = [v6 proximitySetupController];
  location[0] = [v7 backupMetadata];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v27, "Using metadata from source device: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v8 = location[0];
  id v9 = [v30 environment];
  id v10 = [v9 existingSettings];
  [v10 setBackupMetadata:v8];

  id v11 = [v30 environment];
  id v12 = [v11 miscState];
  id v13 = [v12 migrationManager];
  [v13 setUserChoseMigration:1];

  id v14 = [v30 environment];
  id v15 = [v14 miscState];
  id v16 = [v15 migrationManager];
  char v17 = [v16 requiresUpdateToMigrate] ^ 1;

  if (v17)
  {
    id v18 = [v30 environment];
    id v19 = [v18 miscState];
    id v20 = [v19 migrationManager];
    id v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    id v24 = sub_10005B454;
    id v25 = &unk_1002B0FF0;
    id v26 = v30;
    [v20 waitForKeychainDataTransfer:&v21];

    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setNeedsConfigurationUpdate
{
  id v2 = +[BuddyCloudConfigManager sharedManager];
  [v2 cloudConfigMayHaveChanged];
}

- (BOOL)_doesRestartFlowCauseErase
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 flowItemDispositionProvider];
  unint64_t v4 = (unint64_t)[v3 dispositions] & 0x10;

  if (v4 == 16) {
    return 0;
  }
  id v5 = +[ACAccountStore defaultStore];
  id v6 = [v5 aa_primaryAppleAccount];
  BOOL v7 = v6 != 0;

  BOOL v18 = v7;
  id v8 = [(SetupController *)self environment];
  id v9 = [(BYEnvironment *)v8 managedConfiguration];
  unsigned __int8 v10 = [v9 isPasscodeSet];

  char v17 = v10 & 1;
  id v11 = [(SetupController *)self environment];
  id v12 = [(BYEnvironment *)v11 miscState];
  id v13 = [v12 migrationManager];
  unsigned __int8 v14 = [v13 hasTransferredData];

  BOOL v15 = 1;
  if ((v17 & 1) == 0)
  {
    BOOL v15 = 1;
    if (!v18) {
      return v14 & 1;
    }
  }
  return v15;
}

- (BOOL)willRestartFlowToViewController:(id)a3
{
  char v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v15 = [(SetupController *)v17 _doesRestartFlowCauseErase];
  if (!v15 || (BYSetupAssistantHasCompletedInitialRun() & 1) != 0)
  {
    if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___OBWelcomeHeaderAnimatable])
    {
      id v10 = location[0];
      [v10 markPaneToAnimateHeaderOnNextAppearance];
      objc_storeStrong(&v12, 0);
    }
    char v18 = 1;
    int v13 = 1;
  }
  else
  {
    window = v17->_window;
    id v4 = [(SetupController *)v17 navigationController];
    id v5 = [(SetupController *)v17 environment];
    id v6 = [(BYEnvironment *)v5 proximitySetupController];
    BOOL v7 = [(SetupController *)v17 environment];
    id v8 = [(BYEnvironment *)v7 analyticsManager];
    id v14 = +[BuddyEraseAlertController alertControllerWithWindow:window navigationController:v4 proximitySetupController:v6 analyticsManager:v8];

    id v9 = [(SetupController *)v17 navigationController];
    [v9 buddy_presentAlertController:v14];

    char v18 = 0;
    int v13 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (void)didRestartFlow
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 miscState];
  [v3 setUserSelectedCellularActivation:0];

  id v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 pendingRestoreState];
  [v5 clearBackupItem];

  id v6 = [(SetupController *)self environment];
  id v7 = [(BYEnvironment *)v6 proximitySetupController];
  [v7 startOver];

  id v8 = [(SetupController *)self environment];
  id v9 = [(BYEnvironment *)v8 flowItemDispositionProvider];
  unint64_t v10 = (unint64_t)[v9 dispositions] & 0x10;

  if (v10 != 16)
  {
    id v11 = [(SetupController *)self environment];
    id v12 = [(BYEnvironment *)v11 setupMethod];
    [v12 setIntent:0];
  }
}

- (void)disableTapFreeSetUp
{
  if (self->_TFDEPPollTimer) {
    [(SetupController *)self stopTFDEPPolling];
  }
}

- (void)presentWiFiSettingsModally
{
}

- (BOOL)_canShortCircuitGreen
{
  return 0;
}

- (void)_initializeGreen
{
  id v8 = self;
  oslog[1] = (os_log_t)a2;
  if ([(SetupController *)self _canShortCircuitGreen])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v6;
      sub_10004B24C(v5);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "green short-circuiting initialize", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    id v4 = objc_alloc_init((Class)BYGreenController);
    [(SetupController *)v8 setGreenController:v4];
  }
}

- (void)_writeGreenInformedDefaultPlistIfNecessary
{
  os_log_type_t v3 = +[NSLocale currentLocale];
  id v4 = [(NSLocale *)v3 countryCode];
  [(SetupController *)self _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:v4];
}

- (void)_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:(id)a3
{
  unint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SetupController *)v10 _canShortCircuitGreen])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v3 = oslog;
      os_log_type_t v4 = v7;
      sub_10004B24C(v6);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "green short-circuiting write informed defaults", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    id v5 = [(SetupController *)v10 greenController];
    [(BYGreenController *)v5 writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  os_log_type_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SetupController *)v4 setUserSelectedLanguage:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  unint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [(SetupController *)v10 setUserSelectedLanguageWithLocale:location[0]];
  LOBYTE(a4) = [(SetupController *)v10 _userSelectedLocale:0 localePaneScrollOffset:a5];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

- (BOOL)_userSelectedLocale:(id)a3 localePaneScrollOffset:(double)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v18 = a4;
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v16, "Setting locale %@...", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    [v5 setValue:location[0] forKey:3];

    os_log_type_t v6 = [(SetupController *)v20 environment];
    id v7 = [(BYEnvironment *)v6 buddyPreferences];
    [v7 setObject:location[0] forKey:@"Locale"];
  }
  id v8 = v20;
  unint64_t v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_10005C0B8;
  id v14 = &unk_1002B1198;
  v15[0] = v20;
  v15[1] = *(id *)&v18;
  LOBYTE(v8) = [(SetupController *)v8 updateLanguageLocale:&v10];
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)shouldEndLifecycleForCause:(unint64_t)a3
{
  if (a3)
  {
    if (a3 - 1 < 4) {
      char v9 = 1;
    }
  }
  else
  {
    uint64_t v7 = BYSetupAssistantHasCompletedInitialRun() & 1;
    id v3 = +[BuddyActivationConfiguration currentConfiguration];
    unsigned __int8 v4 = [v3 hasActivated];

    char v5 = 0;
    if (v7)
    {
      char v5 = 0;
      if (!self->_inMiniBuddyFromBreadcrumb) {
        char v5 = v4 & 1;
      }
    }
    char v9 = v5 & 1;
  }
  return v9 & 1;
}

- (void)willEndLifecycleDueToCause:(unint64_t)a3 allowDismissal:(BOOL)a4
{
  id v57 = self;
  SEL v56 = a2;
  unint64_t v55 = a3;
  BOOL v54 = a4;
  if (self->_buddyDone)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v52 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100046588((uint64_t)buf, v55);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v52, "Ignoring request will exit cause %ld request as an exit has already begun", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    if (v54)
    {
      os_log_t v51 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046588((uint64_t)v61, v55);
        _os_log_impl((void *)&_mh_execute_header, v51, v50, "Will end lifecycle due to cause %ld with dismissal allowed...", v61, 0xCu);
      }
      objc_storeStrong((id *)&v51, 0);
    }
    else
    {
      os_log_t v49 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046588((uint64_t)v60, v55);
        _os_log_impl((void *)&_mh_execute_header, v49, v48, "Will end lifecycle due to cause %ld...", v60, 0xCu);
      }
      objc_storeStrong((id *)&v49, 0);
    }
    id v4 = [v57 environment];
    id v5 = [v4 lockdownModeProvider];
    unsigned __int8 v6 = [v5 hasStagedEnablement];

    char v47 = v6 & 1;
    if (v55 == 1
      && v54
      && +[BuddyMenuController supportsHomeGesture]
      && (v47 & 1) == 0)
    {
      [*((id *)v57 + 12) invalidate];
      objc_storeStrong((id *)v57 + 12, 0);
    }
    *((unsigned char *)v57 + 42) = 1;
    [v57 setAllowDismissalForExit:v54];
    id v7 = [v57 environment];
    id v8 = [v7 analyticsManager];
    v58[0] = @"duration";
    +[BuddyTimestamp intervalSinceTimestamp:*((void *)v57 + 16)];
    char v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v59[0] = v9;
    v58[1] = @"startupCause";
    unint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v57 cachedStartupCause]);
    v59[1] = v10;
    v58[2] = @"exitCause";
    int v11 = +[NSNumber numberWithUnsignedInteger:v55];
    v59[2] = v11;
    v58[3] = @"hasCompletedInitialRun";
    int v12 = +[NSNumber numberWithBool:BYSetupAssistantHasCompletedInitialRun()];
    v59[3] = v12;
    int v13 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
    [v8 addEvent:@"com.apple.setupassistant.ios.duration" withPayload:v13 persist:1];

    if (v55 < 3 || v55 - 3 >= 2)
    {
      id v14 = +[ACAccountStore defaultStore];
      id v15 = [v14 aa_primaryAppleAccount];

      if (v15)
      {
        id v16 = +[BYPreferencesController buddyPreferencesInternal];
        unsigned __int8 v17 = [v16 BOOLForKey:@"SkipExpressSettingsUpload"];

        char v46 = v17 & 1;
        if (v17)
        {
          os_log_t v45 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            double v18 = v45;
            os_log_type_t v19 = v44;
            sub_10004B24C(v43);
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Skipping express settings upload due to default", v43, 2u);
          }
          objc_storeStrong((id *)&v45, 0);
        }
        else
        {
          id location = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
          [location startExpressSettingsUpload];
          objc_storeStrong(&location, 0);
        }
      }
      char v41 = 0;
      id v20 = [v57 environment];
      id v21 = [v20 suspendTask];
      id v22 = [v21 launchURL];
      char v39 = 0;
      char v37 = 0;
      char v23 = 1;
      if (v22)
      {
        id v40 = [v57 environment];
        char v39 = 1;
        id v38 = [v40 lockdownModeProvider];
        char v37 = 1;
        char v23 = [v38 hasStagedEnablement] ^ 1;
      }
      if (v37) {

      }
      if (v39) {
      char v41 = v23 & 1;
      }
      if (v23)
      {
        os_log_t v36 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v36;
          os_log_type_t v25 = v35;
          sub_10004B24C(v34);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Monitoring for display layout changes...", v34, 2u);
        }
        objc_storeStrong((id *)&v36, 0);
        id v33 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
        id v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        id v30 = sub_10005C9E4;
        id v31 = &unk_1002B11C0;
        id v32 = v57;
        [v33 setTransitionHandler:&v28];
        id v26 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v33, v28, v29, v30, v31);
        [v57 setMonitor:v26];

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, BYSetupAssistantUISessionNoLongerExclusiveNotification, 0, 0, 1u);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
      }
    }
    else
    {
      [v57 _willEndLifecycleForDataTransfer];
    }
  }
}

- (void)endLifecycleDueToCause:(unint64_t)a3
{
  id v90 = self;
  SEL v89 = a2;
  unint64_t v88 = a3;
  id location = (id)_BYLoggingFacility();
  os_log_type_t v86 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, v88);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v86, "Ending lifecycle due to cause %ld...", buf, 0xCu);
  }
  objc_storeStrong(&location, 0);
  BOOL v85 = 1;
  BOOL v84 = 0;
  BOOL v3 = 1;
  if (v88 != 3) {
    BOOL v3 = v88 == 4;
  }
  BOOL v84 = v3;
  char v83 = 0;
  id v4 = +[UIApplication sharedApplication];
  BOOL v5 = (id)[(UIApplication *)v4 applicationState] == (id)2;

  BOOL v82 = v5;
  id v6 = [(SetupController *)v90 navigationController];
  id v7 = [v6 viewControllers];
  id v8 = [v7 lastObject];
  unsigned __int8 v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___BFFFlowItem];

  if (v9)
  {
    id v10 = [(SetupController *)v90 navigationController];
    id v11 = [v10 viewControllers];
    id v81 = [v11 lastObject];

    if (objc_opt_respondsToSelector()) {
      BOOL v85 = [v81 allowedTerminationSources] == 0;
    }
    objc_storeStrong(&v81, 0);
  }
  if (v82 && !v85 && !v84)
  {
    id v80 = (id)_BYLoggingFacility();
    os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v80;
      os_log_type_t v13 = v79;
      sub_10004B24C(v78);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Application state is background when attempting to end lifecycle", v78, 2u);
    }
    objc_storeStrong(&v80, 0);
    char v83 = 1;
  }
  switch(v88)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_42;
    case 1uLL:
      char v77 = 0;
      id v14 = [(SetupController *)v90 environment];
      id v15 = [(BYEnvironment *)v14 suspendTask];
      id v16 = [v15 launchURL];
      char v75 = 0;
      char v73 = 0;
      unsigned __int8 v17 = 0;
      if (v16)
      {
        id v76 = [(SetupController *)v90 environment];
        char v75 = 1;
        id v74 = [v76 buddyPreferencesExcludedFromBackup];
        char v73 = 1;
        unsigned __int8 v17 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
      }
      if (v73) {

      }
      if (v75) {
      char v77 = v17 & 1;
      }
      double v18 = [(SetupController *)v90 environment];
      id v19 = [(BYEnvironment *)v18 lockdownModeProvider];
      unsigned __int8 v20 = [v19 hasStagedEnablement];

      if (v20)
      {
        if (v77)
        {
          id v21 = [(SetupController *)v90 environment];
          id v22 = [(BYEnvironment *)v21 buddyPreferencesExcludedFromBackup];
          [v22 setObject:&__kCFBooleanTrue forKey:BYBuddyRunStandardMiniBuddy];
        }
        [(SetupController *)v90 willMarkBuddyComplete];
        [(SetupController *)v90 markBuddyComplete];
        [(SetupController *)v90 didMarkBuddyComplete];
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          char v23 = oslog;
          os_log_type_t v24 = v71;
          sub_10004B24C(v70);
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Enabling lockdown...", v70, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        os_log_type_t v25 = [(SetupController *)v90 environment];
        id v26 = [(BYEnvironment *)v25 lockdownModeProvider];
        [v26 enableWithStrategy:0 completionHandler:&stru_1002B11E0];
      }
      else if (v77)
      {
        [(SetupController *)v90 setShouldLaunchSuspendTaskURL:1];
        [(SetupController *)v90 willMarkBuddyComplete];
        [(SetupController *)v90 markBuddyComplete];
        [(SetupController *)v90 didMarkBuddyComplete];
        id v69 = 0;
        id v27 = +[LSApplicationWorkspace defaultWorkspace];
        id v28 = [(SetupController *)v90 environment];
        id v29 = [(BYEnvironment *)v28 suspendTask];
        id v30 = [v29 launchURL];
        uint64_t v94 = SBSOpenApplicationOptionKeyLaunchApplicationAfterSetup;
        id v95 = &__kCFBooleanTrue;
        id v31 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id obj = 0;
        unsigned __int8 v32 = [v27 openURL:v30 withOptions:v31 error:&obj];
        objc_storeStrong(&v69, obj);

        if ((v32 ^ 1))
        {
          os_log_t v67 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v66 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            char v64 = 0;
            char v62 = 0;
            if (_BYIsInternalInstall())
            {
              id v33 = (NSString *)v69;
            }
            else if (v69)
            {
              id v65 = [v69 domain];
              char v64 = 1;
              id v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v65, [v69 code]);
              id v63 = v33;
              char v62 = 1;
            }
            else
            {
              id v33 = 0;
            }
            sub_10004BB7C((uint64_t)v93, (uint64_t)v33);
            _os_log_error_impl((void *)&_mh_execute_header, v67, v66, "Failed to open suspend task URL: %{public}@", v93, 0xCu);
            if (v62) {

            }
            if (v64) {
          }
            }
          objc_storeStrong((id *)&v67, 0);
          [(SetupController *)v90 terminate];
        }
        objc_storeStrong(&v69, 0);
      }
      else
      {
LABEL_42:
        if (v85 && v82 && v88 == 1)
        {
          id v34 = [(SetupController *)v90 environment];
          id v35 = [(BYEnvironment *)v34 managedConfiguration];
          unsigned __int8 v36 = [v35 isPasscodeSet];

          if (v36)
          {
            os_log_t v61 = (os_log_t)(id)_BYLoggingFacility();
            os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              char v37 = v61;
              os_log_type_t v38 = v60;
              sub_10004B24C(v59);
              _os_log_impl((void *)&_mh_execute_header, v37, v38, "Forcing termination since Setup skipped a terminal pane and cannot unlock to suspend...", v59, 2u);
            }
            objc_storeStrong((id *)&v61, 0);
            [(SetupController *)v90 willMarkBuddyComplete];
            [(SetupController *)v90 markBuddyComplete];
            [(SetupController *)v90 didMarkBuddyComplete];
            [(SetupController *)v90 terminate];
          }
          else
          {
            os_log_t v58 = (os_log_t)(id)_BYLoggingFacility();
            os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              char v39 = v58;
              os_log_type_t v40 = v57;
              sub_10004B24C(v56);
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "Unlocking device, then suspending...", v56, 2u);
            }
            objc_storeStrong((id *)&v58, 0);
            id v41 = +[FBSSystemService sharedService];
            BOOL v42 = +[NSBundle mainBundle];
            id v43 = [(NSBundle *)v42 bundleIdentifier];
            uint64_t v91 = FBSOpenApplicationOptionKeyUnlockDevice;
            os_log_type_t v92 = &__kCFBooleanTrue;
            os_log_type_t v44 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            [v41 openApplication:v43 options:v44 withResult:&stru_1002B1200];
          }
        }
        else if (v83)
        {
          os_log_t v55 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v45 = v55;
            os_log_type_t v46 = v54;
            sub_10004B24C(v53);
            _os_log_impl((void *)&_mh_execute_header, v45, v46, "Forcing termination since Setup is in the background...", v53, 2u);
          }
          objc_storeStrong((id *)&v55, 0);
          [(SetupController *)v90 didMarkBuddyComplete];
          [(SetupController *)v90 terminate];
        }
        else
        {
          os_log_t v52 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            char v47 = v52;
            os_log_type_t v48 = v51;
            sub_10004B24C(v50);
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "Suspending...", v50, 2u);
          }
          objc_storeStrong((id *)&v52, 0);
          os_log_t v49 = +[UIApplication sharedApplication];
          [(UIApplication *)v49 suspend];
        }
      }
      break;
    case 3uLL:
    case 4uLL:
      [(SetupController *)v90 willMarkBuddyComplete];
      [(SetupController *)v90 markBuddyComplete];
      break;
    default:
      return;
  }
}

- (unint64_t)intendedRestoreType
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 setupMethod];
  id v4 = [v3 intendedDataTransferMethod];

  return v4 == (id)1;
}

- (unint64_t)restoreType
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 setupMethod];
  id v4 = [v3 dataTransferMethod];

  return v4 == (id)1;
}

- (void)prepareWithCompletion:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(2, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10005DD30;
  id v8 = &unk_1002B0CD0;
  unsigned __int8 v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)startupCause
{
  return [(SetupController *)self cachedStartupCause];
}

- (BOOL)airplaneModeEnabled
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)RadiosPreferences);
  unsigned __int8 v2 = [location[0] airplaneMode];
  objc_storeStrong(location, 0);
  return v2 & 1;
}

- (BOOL)shouldBeginRestore
{
  unsigned __int8 v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 pendingRestoreState];
  id v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 buddyPreferences];
  unsigned __int8 v6 = +[BuddySoftwareUpdateRestoreFlow controllerNeedsToRunWithPendingRestoreState:v3 buddyPreferences:v5];

  return v6 & 1;
}

- (BOOL)shouldBeginMigration
{
  unsigned __int8 v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 buddyPreferencesExcludedFromBackup];
  id v4 = [(SetupController *)self environment];
  id v5 = [(BYEnvironment *)v4 runState];
  id v6 = +[BuddyMigrationStateProvider validateAndResolveMigrationStateUsingPreferences:didCompleteInitialRun:](BuddyMigrationStateProvider, "validateAndResolveMigrationStateUsingPreferences:didCompleteInitialRun:", v3, (unint64_t)[v5 hasCompletedInitialRun] & 1);
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)isLanguageSet
{
  id location[2] = self;
  location[1] = (id)a2;
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults];
  location[0] = [(NSUserDefaults *)v2 stringForKey:@"Language"];

  id v3 = +[NSUserDefaults standardUserDefaults];
  id v6 = [(NSUserDefaults *)v3 objectForKey:@"LockdownSetLanguage"];

  BOOL v4 = 1;
  if (!location[0]) {
    BOOL v4 = v6 != 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BuddyRestoreProvider)restoreProvider
{
  return self;
}

- (BOOL)hasCloudConfiguration
{
  id v2 = +[BuddyCloudConfigManager sharedManager];
  id v3 = [v2 cloudConfigurationDetails];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)willSetUpAsNew
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 pendingRestoreState];
  id v4 = [v3 backupItem];
  BOOL v5 = v4 != 0;

  BOOL v12 = v5;
  id v6 = [(SetupController *)self environment];
  id v7 = [(BYEnvironment *)v6 miscState];
  id v8 = [v7 migrationManager];
  unsigned __int8 v9 = [v8 migrationInProgressOrCompleted];

  char v10 = 1;
  if (!v12) {
    char v10 = v9 & 1;
  }
  return (v10 ^ 1) & 1;
}

- (BuddyFundamentalFlowStartupProvider)startupProvider
{
  return self;
}

- (BuddyLanguageLocaleSelectionReceiver)languageLocaleReceiver
{
  return self;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 flowItemDispositionProvider];

  return (BuddyFlowItemDispositionProvider *)v3;
}

- (BuddyRemoteManagementProvider)remoteManagementProvider
{
  id v2 = [(SetupController *)self environment];
  id v3 = [(BYEnvironment *)v2 enrollmentCoordinator];

  return (BuddyRemoteManagementProvider *)v3;
}

- (void)handleDebugGesture
{
  id v2 = [(SetupController *)self navigationFlowController];
  [(BuddyNavigationFlowController *)v2 handleDebugGesture];
}

- (BOOL)launchedForMigration
{
  return self->_launchedForMigration;
}

- (void)setLaunchedForMigration:(BOOL)a3
{
  self->_launchedForMigration = a3;
}

- (BOOL)markBuddyCompleteDidRun
{
  return self->_markBuddyCompleteDidRun;
}

- (void)setMarkBuddyCompleteDidRun:(BOOL)a3
{
  self->_markBuddyCompleteDidRun = a3;
}

- (NSArray)viewControllersToRemoveOnPush
{
  return self->_viewControllersToRemoveOnPush;
}

- (void)setViewControllersToRemoveOnPush:(id)a3
{
}

- (UIViewController)topViewControllerForRemoving
{
  return self->_topViewControllerForRemoving;
}

- (void)setTopViewControllerForRemoving:(id)a3
{
}

- (BOOL)shouldRereadCloudConfigurationForControllersToSkip
{
  return self->_shouldRereadCloudConfigurationForControllersToSkip;
}

- (void)setShouldRereadCloudConfigurationForControllersToSkip:(BOOL)a3
{
  self->_shouldRereadCloudConfigurationForControllersToSkip = a3;
}

- (id)cloudConfigurationChangeNotificationObserver
{
  return self->_cloudConfigurationChangeNotificationObserver;
}

- (void)setCloudConfigurationChangeNotificationObserver:(id)a3
{
}

- (WFNetworkListController)modalWifiManager
{
  return self->_modalWifiManager;
}

- (void)setModalWifiManager:(id)a3
{
}

- (BuddyNavigationFlowController)navigationFlowController
{
  return self->_navigationFlowController;
}

- (void)setNavigationFlowController:(id)a3
{
}

- (BuddyFlowProducer)fundamentalFlow
{
  return self->_fundamentalFlow;
}

- (void)setFundamentalFlow:(id)a3
{
}

- (BuddyProximityPairingController)proximityPairingController
{
  return self->_proximityPairingController;
}

- (void)setProximityPairingController:(id)a3
{
}

- (NSData)defaultAccessibilitySettings
{
  return self->_defaultAccessibilitySettings;
}

- (void)setDefaultAccessibilitySettings:(id)a3
{
}

- (BOOL)applyingProximitySettings
{
  return self->_applyingProximitySettings;
}

- (void)setApplyingProximitySettings:(BOOL)a3
{
  self->_applyingProximitySettings = a3;
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)userSelectedLanguage
{
  return self->_userSelectedLanguage;
}

- (void)setUserSelectedLanguage:(id)a3
{
}

- (NSString)userSelectedLanguageWithLocale
{
  return self->_userSelectedLanguageWithLocale;
}

- (void)setUserSelectedLanguageWithLocale:(id)a3
{
}

- (unint64_t)cachedStartupCause
{
  return self->_cachedStartupCause;
}

- (void)setCachedStartupCause:(unint64_t)a3
{
  self->_cachedStartupCause = a3;
}

- (BuddyFlowDiverter)flowDiverter
{
  return self->_flowDiverter;
}

- (void)setFlowDiverter:(id)a3
{
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
}

- (NSArray)preferredLanguagesAtStartup
{
  return self->_preferredLanguagesAtStartup;
}

- (void)setPreferredLanguagesAtStartup:(id)a3
{
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (BOOL)shouldLaunchSuspendTaskURL
{
  return self->_shouldLaunchSuspendTaskURL;
}

- (void)setShouldLaunchSuspendTaskURL:(BOOL)a3
{
  self->_shouldLaunchSuspendTaskURL = a3;
}

- (BuddyNavigationAnalytics)navigationAnalytics
{
  return self->_navigationAnalytics;
}

- (void)setNavigationAnalytics:(id)a3
{
}

- (BuddySetupAnalytics)setupAnalytics
{
  return self->_setupAnalytics;
}

- (void)setSetupAnalytics:(id)a3
{
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (BuddyInactivityTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setInactivityTimer:(id)a3
{
}

- (BOOL)shouldProceedFromAppearancePane
{
  return self->_shouldProceedFromAppearancePane;
}

- (void)setShouldProceedFromAppearancePane:(BOOL)a3
{
  self->_shouldProceedFromAppearancePane = a3;
}

- (BOOL)initialDisplayZoomRestartValue
{
  return self->_initialDisplayZoomRestartValue;
}

- (void)setInitialDisplayZoomRestartValue:(BOOL)a3
{
  self->_initialDisplayZoomRestartValue = a3;
}

- (BOOL)allowDismissalForExit
{
  return self->_allowDismissalForExit;
}

- (void)setAllowDismissalForExit:(BOOL)a3
{
  self->_allowDismissalForExit = a3;
}

- (BYGreenController)greenController
{
  return self->_greenController;
}

- (void)setGreenController:(id)a3
{
}

- (BOOL)initialAnimateLanguageChoiceValue
{
  return self->_initialAnimateLanguageChoiceValue;
}

- (void)setInitialAnimateLanguageChoiceValue:(BOOL)a3
{
  self->_initialAnimateLanguageChoiceValue = a3;
}

- (void).cxx_destruct
{
}

@end