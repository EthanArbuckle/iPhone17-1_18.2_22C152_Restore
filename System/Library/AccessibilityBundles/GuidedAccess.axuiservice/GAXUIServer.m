@interface GAXUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- ($9BEB610D0CE1B1EDC3D89DA2464F985F)_rotationContextForInterestAreaViewController:(id)a3;
- (AVSpeechSynthesizer)speechSynthesizer;
- (AXAccessQueue)springboardMessageQueue;
- (AXIPCClient)springboardClient;
- (AXUIPasscodeViewController)passcodeViewController;
- (BOOL)_isTimeRestrictionLockoutViewShowing;
- (BOOL)allowsTouch;
- (BOOL)appTimeRestrictionsEnabled;
- (BOOL)isAXUIServerSceneReady;
- (BOOL)isFeatureEnabledForIdentifier:(id)a3;
- (BOOL)isInWorkspace;
- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a3;
- (BOOL)shouldHideAllAlerts;
- (BOOL)shouldShowCancelButtonForPasscodeViewController:(id)a3;
- (GAXInterestAreaViewController)passiveInterestAreaViewController;
- (GAXOverlayUserInterfaceViewController)overlayActiveContentViewController;
- (GAXStyleProvider)styleProvider;
- (GAXTimeRestrictionLockoutViewController)timeRestrictionLockoutViewController;
- (GAXTouchIDManager)touchIDManager;
- (GAXUIServer)init;
- (GAXUnmanagedASAMViewController)unmanagedASAMConfirmationViewController;
- (NSArray)appRestrictionIdentifiers;
- (NSArray)sessionApplicationIdentifiers;
- (NSDictionary)detailTextsForAppRestrictions;
- (NSDictionary)statesForAppRestrictions;
- (NSDictionary)textsForAppRestrictions;
- (NSMutableDictionary)interestAreaPathsForStorageForRotatingView;
- (NSMutableSet)identifiersOfBannerAlertsAboutToAppear;
- (NSMutableSet)identifiersOfVisibleBannerAlerts;
- (NSString)appName;
- (NSString)description;
- (NSString)deviceRestrictedAlertIdentifier;
- (NSString)identifierOfVisibleRegularAlert;
- (NSString)incomingCallAlertIdentifier;
- (NSString)lockoutAlertIdentifier;
- (NSTimer)passcodeDismissalTimer;
- (OS_dispatch_queue)managedConfigurationQueue;
- (UIImage)appIcon;
- (UIViewController)activeContentViewController;
- (double)_minimumDelayForShowingAdditionalBannerAlert;
- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (double)lastBannerAlertShownTimeInterval;
- (double)statusBarHeight;
- (id)_archiveInterestAreaPathsForStorage:(id)a3;
- (id)_archivedInterestAreaPathsInScreenCoordinatesForInterestAreaViewController:(id)a3;
- (id)_clientMessenger;
- (id)_debugGAXDescription;
- (id)_preparedOverlayUserInterfaceViewController;
- (id)_showAlertWithText:(id)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5;
- (id)_showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 asBanner:(BOOL)a6 isUrgent:(BOOL)a7 duration:(double)a8;
- (id)_unarchivedPathMappingWithData:(id)a3;
- (id)_unmanagedASAMRestrictedFeaturesForStyle:(int64_t)a3;
- (id)_unmanagedASAMRestrictionDictionaryForStyle:(int64_t)a3;
- (id)detailTextForAppRestrictionWithIdentifier:(id)a3;
- (id)iconForAppRestrictionWithIdentifier:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (id)styleProviderForAlertWithIdentifier:(id)a3;
- (id)textForAppRestrictionWithIdentifier:(id)a3;
- (int)incomingCallType;
- (int64_t)activeInterfaceOrientationForPasscodeViewController:(id)a3;
- (int64_t)appRestrictionStateForIdentifier:(id)a3;
- (int64_t)appTimeRestrictionDurationInMinutes;
- (int64_t)lastPasscodeViewDismissalReason;
- (unint64_t)numberOfBannerAlertsShownRecently;
- (void)_adjustContentsGeometryOfInterestAreaViewWithController:(id)a3;
- (void)_applyInterestAreaPathsForStorage:(id)a3 toInterestAreaViewController:(id)a4 andFadeInterestAreaPathsIn:(BOOL)a5 fadeInterestAreaSpecialControlsIn:(BOOL)a6 notifyClientOfReplacedInterestAreaPathsDuringSession:(BOOL)a7;
- (void)_changeUnmanagedASAMRestrictionStateEnabled:(BOOL)a3 style:(int64_t)a4 managedConfigurationSettings:(id)a5;
- (void)_clearPasscodeDismissalTimer;
- (void)_confirmUnmanagedASAMWithApplicationDisplayName:(id)a3 completion:(id)a4;
- (void)_disableTelephonyIfNeededForMode:(unsigned int)a3;
- (void)_dismissPasscodeViewAnimated:(BOOL)a3 withReason:(int64_t)a4;
- (void)_displayBlockedIncomingCallWithSourceAddress:(id)a3 serviceIdentifier:(id)a4;
- (void)_hideTimeRestrictionsLockoutView;
- (void)_interestAreaViewControllerInterfaceOrientationDidUpdate:(int64_t)a3;
- (void)_notifyClientOfUpdatedActiveInterfaceOrientation;
- (void)_playPreferredTimeRestrictionsSoundAndSpeakMessageIfNeeded:(id)a3;
- (void)_presentPasscodeViewControllerForSetup:(BOOL)a3 passcodeLength:(unint64_t)a4;
- (void)_presentPasscodeViewControllerForUnlock;
- (void)_reestablishSpringboardClient;
- (void)_restoreTelephony;
- (void)_rotateDeviceToCurrentOrientation;
- (void)_setupOverrides;
- (void)_showAlertWithType:(int)a3 AsBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionRemainingTime:(id)a6 remainingLockoutDuration:(double)a7 effectiveApplicationDisplayName:(id)a8;
- (void)_showTimeRestrictionsLockoutViewWithAppTimeRestrictionDuration:(double)a3;
- (void)_timerDismissPasscode:(id)a3;
- (void)_validateOverrides;
- (void)alertWithIdentifierDidAppear:(id)a3;
- (void)alertWithIdentifierDidDisappear:(id)a3;
- (void)applyUnmanagedASAMRestrictionsForStyle:(int64_t)a3 managedConfigurationSettings:(id)a4;
- (void)archiveInterestAreaPathsForStorageInterestAreaViewController:(id)a3;
- (void)dealloc;
- (void)getContainedViewsInFrontmostApplicationForFingerPath:(id)a3 completion:(id)a4;
- (void)getPasscodeLengthWithCompletion:(id)a3;
- (void)interestAreaViewController:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4;
- (void)interestAreaViewController:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayUserInterfaceWasEntirelyRemovedFromViewController:(id)a3;
- (void)passcodeViewController:(id)a3 didFinishSettingUpPasscode:(id)a4;
- (void)passcodeViewController:(id)a3 isPasscode:(id)a4 correctWithCompletionHandler:(id)a5;
- (void)passcodeViewController:(id)a3 passcodeViewIsVisible:(BOOL)a4;
- (void)passcodeViewController:(id)a3 wasDismissedWithReason:(int64_t)a4;
- (void)processInitializationMessage:(id)a3;
- (void)processMessageAsynchronously:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6;
- (void)removeUnmanagedASAMRestrictions;
- (void)serviceWasFullyInitialized;
- (void)setActiveContentViewController:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppRestrictionIdentifiers:(id)a3;
- (void)setAppRestrictionState:(int64_t)a3 withIdentifier:(id)a4;
- (void)setAppTimeRestrictionDurationInMinutes:(int64_t)a3;
- (void)setAppTimeRestrictionsEnabled:(BOOL)a3;
- (void)setDetailTextsForAppRestrictions:(id)a3;
- (void)setDeviceRestrictedAlertIdentifier:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3 withIdentifier:(id)a4;
- (void)setIdentifierOfVisibleRegularAlert:(id)a3;
- (void)setIdentifiersOfBannerAlertsAboutToAppear:(id)a3;
- (void)setIdentifiersOfVisibleBannerAlerts:(id)a3;
- (void)setIncomingCallAlertIdentifier:(id)a3;
- (void)setIncomingCallType:(int)a3;
- (void)setInterestAreaPathsForStorageForRotatingView:(id)a3;
- (void)setIsAXUIServerSceneReady:(BOOL)a3;
- (void)setLastBannerAlertShownTimeInterval:(double)a3;
- (void)setLastPasscodeViewDismissalReason:(int64_t)a3;
- (void)setLockoutAlertIdentifier:(id)a3;
- (void)setManagedConfigurationQueue:(id)a3;
- (void)setNumberOfBannerAlertsShownRecently:(unint64_t)a3;
- (void)setOverlayActiveContentViewController:(id)a3;
- (void)setPasscodeDismissalTimer:(id)a3;
- (void)setPasscodeViewController:(id)a3;
- (void)setPassiveInterestAreaViewController:(id)a3;
- (void)setSessionApplicationIdentifiers:(id)a3;
- (void)setShouldHideAllAlerts:(BOOL)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)setSpringboardClient:(id)a3;
- (void)setSpringboardMessageQueue:(id)a3;
- (void)setStatesForAppRestrictions:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTextsForAppRestrictions:(id)a3;
- (void)setTimeRestrictionLockoutViewController:(id)a3;
- (void)setTouchIDManager:(id)a3;
- (void)setUnmanagedASAMConfirmationViewController:(id)a3;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)touchIDManager:(id)a3 attemptWasSuccessful:(BOOL)a4;
- (void)touchIDMonitorTimeDidExpire:(id)a3;
- (void)transitionToMode:(unsigned int)a3;
- (void)updateHostedApplicationStateWithScaleFactor:(double)a3 center:(CGPoint)a4 animationDuration:(double)a5;
- (void)updateTimeRestrictionWithDuration:(int64_t)a3 enabled:(BOOL)a4;
@end

@implementation GAXUIServer

- (GAXUIServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)GAXUIServer;
  v2 = [(GAXUIServer *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("GAXStateAccessQueue", 0);
    gaxStateAccessQueue = v2->_gaxStateAccessQueue;
    v2->_gaxStateAccessQueue = (OS_dispatch_queue *)v3;

    v5 = +[AXUIDisplayManager sharedDisplayManager];
    [v5 addObserver:v2 forKeyPath:@"activeInterfaceOrientation" options:0 context:0];

    id v6 = [objc_alloc((Class)AXAccessQueue) initWithParentClass:objc_opt_class() description:@"SpringboardMessageQueue" appendUUIDToLabel:0];
    [(GAXUIServer *)v2 setSpringboardMessageQueue:v6];
    [(GAXUIServer *)v2 _reestablishSpringboardClient];
    [(GAXUIServer *)v2 _validateOverrides];
    [(GAXUIServer *)v2 _setupOverrides];
    v7 = objc_opt_new();
    [(GAXUIServer *)v2 setStyleProvider:v7];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.GuidedAccess.MC", 0);
    managedConfigurationQueue = v2->_managedConfigurationQueue;
    v2->_managedConfigurationQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(GAXTouchIDManager);
    [(GAXUIServer *)v2 setTouchIDManager:v10];
    [(GAXTouchIDManager *)v10 setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[AXUIDisplayManager sharedDisplayManager];
  [v3 removeObserver:self forKeyPath:@"activeInterfaceOrientation" context:0];

  v4 = [(GAXUIServer *)self springboardClient];
  [v4 setPortDeathHandler:0];
  id v9 = 0;
  unsigned __int8 v5 = [v4 disconnectWithError:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_37728();
    }
  }
  [(GAXUIServer *)self setActiveContentViewController:0];
  [(GAXUIServer *)self setOverlayActiveContentViewController:0];
  [(GAXUIServer *)self setPassiveInterestAreaViewController:0];
  [(GAXUIServer *)self setAppRestrictionIdentifiers:0];
  [(GAXUIServer *)self setStatesForAppRestrictions:0];
  [(GAXUIServer *)self setTextsForAppRestrictions:0];
  [(GAXUIServer *)self setDetailTextsForAppRestrictions:0];
  [(GAXUIServer *)self _clearPasscodeDismissalTimer];

  v8.receiver = self;
  v8.super_class = (Class)GAXUIServer;
  [(GAXUIServer *)&v8 dealloc];
}

- (BOOL)allowsTouch
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5720;
  v5[3] = &unk_5CAE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInWorkspace
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_57E4;
  v5[3] = &unk_5CAE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateHostedApplicationStateWithScaleFactor:(double)a3 center:(CGPoint)a4 animationDuration:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = objc_alloc((Class)NSDictionary);
  v11 = +[NSNumber numberWithDouble:a5];
  objc_super v12 = +[NSNumber numberWithDouble:a3];
  v17.CGFloat x = x;
  v17.CGFloat y = y;
  v13 = NSStringFromCGPoint(v17);
  id v15 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, @"animation duration", v12, @"hosted application scale factor", v13, @"hosted application center", 0);

  v14 = [(GAXUIServer *)self _clientMessenger];
  [v14 sendAsynchronousMessage:v15 withIdentifier:31 targetAccessQueue:0 completion:0];
}

- (void)getContainedViewsInFrontmostApplicationForFingerPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v7, @"finger path", 0);
  char v9 = [(GAXUIServer *)self _clientMessenger];
  id v10 = +[AXAccessQueue mainAccessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5A6C;
  v12[3] = &unk_5CB08;
  id v13 = v6;
  id v11 = v6;
  [v9 sendAsynchronousMessage:v8 withIdentifier:22 targetAccessQueue:v10 completion:v12];
}

- (void)transitionToMode:(unsigned int)a3
{
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v6, @"server mode", 0);
  unsigned __int8 v5 = [(GAXUIServer *)self _clientMessenger];
  [v5 sendAsynchronousMessage:v4 withIdentifier:23 targetAccessQueue:0 completion:0];
}

- (void)setFeatureEnabled:(BOOL)a3 withIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)NSDictionary);
  id v8 = +[NSNumber numberWithBool:v4];
  id v10 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, @"system feature is enabled", v6, @"system feature identifier", 0);

  char v9 = [(GAXUIServer *)self _clientMessenger];
  [v9 sendAsynchronousMessage:v10 withIdentifier:24 targetAccessQueue:0 completion:0];
}

- (void)updateTimeRestrictionWithDuration:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(GAXUIServer *)self _clientMessenger];
  v11[0] = @"time restriction duration";
  id v8 = +[NSNumber numberWithInteger:a3];
  v12[0] = v8;
  v11[1] = @"time restrictions enabled";
  char v9 = +[NSNumber numberWithBool:v4];
  v12[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 sendAsynchronousMessage:v10 withIdentifier:25 targetAccessQueue:0 completion:0];

  [(GAXUIServer *)self setAppTimeRestrictionsEnabled:v4];
  [(GAXUIServer *)self setAppTimeRestrictionDurationInMinutes:a3];
}

- (void)_validateOverrides
{
  char v3 = +[AXValidationManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5FC0;
  v4[3] = &unk_5CB70;
  v4[4] = self;
  [v3 performValidations:&stru_5CB48 withPreValidationHandler:v4 postValidationHandler:0];
}

- (void)_setupOverrides
{
  if (qword_6E7B0 != -1) {
    dispatch_once(&qword_6E7B0, &stru_5CBB0);
  }
}

- (double)statusBarHeight
{
  v2 = [(GAXUIServer *)self activeContentViewController];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 statusBarHeight];
    double v3 = v4;
  }

  return v3;
}

- (void)setActiveContentViewController:(id)a3
{
  unsigned __int8 v5 = (UIViewController *)a3;
  p_activeContentViewController = &self->_activeContentViewController;
  if (self->_activeContentViewController != v5)
  {
    char v9 = v5;
    id v7 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = v7;
    if (*p_activeContentViewController) {
      [v7 removeContentViewController:*p_activeContentViewController withUserInteractionEnabled:1 forService:self context:0 completion:0];
    }
    objc_storeStrong((id *)&self->_activeContentViewController, a3);
    if (v9) {
      [v8 addContentViewController:v9 withUserInteractionEnabled:1 forService:self context:0 completion:0];
    }

    unsigned __int8 v5 = v9;
  }
}

- (void)setOverlayActiveContentViewController:(id)a3
{
  unsigned __int8 v5 = (GAXOverlayUserInterfaceViewController *)a3;
  p_overlayActiveContentViewController = &self->_overlayActiveContentViewController;
  if (self->_overlayActiveContentViewController != v5)
  {
    id v7 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = v7;
    char v9 = *p_overlayActiveContentViewController;
    if (*p_overlayActiveContentViewController)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_6310;
      v12[3] = &unk_5CBF8;
      void v12[4] = self;
      [v7 removeContentViewController:v9 withUserInteractionEnabled:1 forService:self context:0 completion:v12];
      overlayActiveContentViewController = self->_overlayActiveContentViewController;
    }
    else
    {
      overlayActiveContentViewController = 0;
    }
    [(GAXOverlayUserInterfaceViewController *)overlayActiveContentViewController setDelegate:0];
    objc_storeStrong((id *)&self->_overlayActiveContentViewController, a3);
    [(GAXOverlayUserInterfaceViewController *)self->_overlayActiveContentViewController setDelegate:self];
    if (v5)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      void v11[2] = sub_631C;
      v11[3] = &unk_5CBF8;
      v11[4] = self;
      [v8 addContentViewController:v5 withUserInteractionEnabled:1 forService:self context:0 completion:v11];
    }
  }
}

- (void)setPassiveInterestAreaViewController:(id)a3
{
  unsigned __int8 v5 = (GAXInterestAreaViewController *)a3;
  p_passiveInterestAreaViewController = &self->_passiveInterestAreaViewController;
  if (self->_passiveInterestAreaViewController != v5)
  {
    id v10 = v5;
    id v7 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = v7;
    if (*p_passiveInterestAreaViewController)
    {
      [v7 removeContentViewController:*p_passiveInterestAreaViewController withUserInteractionEnabled:0 forService:self context:0 completion:0];
      passiveInterestAreaViewController = self->_passiveInterestAreaViewController;
    }
    else
    {
      passiveInterestAreaViewController = 0;
    }
    [(GAXInterestAreaViewController *)passiveInterestAreaViewController setDelegate:0];
    objc_storeStrong((id *)&self->_passiveInterestAreaViewController, a3);
    [(GAXInterestAreaViewController *)self->_passiveInterestAreaViewController setDelegate:self];
    if (v10) {
      [v8 addContentViewController:v10 withUserInteractionEnabled:0 forService:self context:0 completion:0];
    }

    unsigned __int8 v5 = v10;
  }
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    double v4 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    unsigned __int8 v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    [(AVSpeechSynthesizer *)self->_speechSynthesizer setUsesApplicationAudioSession:0];
    [(AVSpeechSynthesizer *)self->_speechSynthesizer setDelegate:self];
    speechSynthesizer = self->_speechSynthesizer;
  }

  return speechSynthesizer;
}

- (void)setShouldHideAllAlerts:(BOOL)a3
{
  if (self->_shouldHideAllAlerts != a3)
  {
    self->_shouldHideAllAlerts = a3;
    if (a3)
    {
      double v4 = +[AXUIDisplayManager sharedDisplayManager];
      unsigned __int8 v5 = [(GAXUIServer *)self identifiersOfVisibleBannerAlerts];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          char v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            [v4 hideAlertWithIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9) forService:self];
            char v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
      id v10 = [(GAXUIServer *)self identifierOfVisibleRegularAlert];
      if (v10) {
        [v4 hideAlertWithIdentifier:v10 forService:self];
      }
      [(GAXUIServer *)self setIdentifiersOfVisibleBannerAlerts:0];
      [(GAXUIServer *)self setIdentifierOfVisibleRegularAlert:0];
      [(GAXUIServer *)self setIdentifiersOfBannerAlertsAboutToAppear:0];
      [(GAXUIServer *)self setIncomingCallAlertIdentifier:0];
      [(GAXUIServer *)self setLockoutAlertIdentifier:0];
      [(GAXUIServer *)self setIncomingCallType:0];
    }
  }
}

- (double)_minimumDelayForShowingAdditionalBannerAlert
{
  unint64_t v2 = [(GAXUIServer *)self numberOfBannerAlertsShownRecently];
  double result = 30.0;
  if (v2 < 9) {
    double result = 10.0;
  }
  if (v2 < 6) {
    return 3.0;
  }
  return result;
}

- (void)_showAlertWithType:(int)a3 AsBanner:(BOOL)a4 isUrgent:(BOOL)a5 timeRestrictionRemainingTime:(id)a6 remainingLockoutDuration:(double)a7 effectiveApplicationDisplayName:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a6;
  id v15 = a8;
  if (![(GAXUIServer *)self _isTimeRestrictionLockoutViewShowing])
  {
    if (!v15)
    {
      if ((a3 - 5) <= 2)
      {
        v16 = GAXLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_37790(a3, v16);
        }
      }
      GAXLocString(@"APP_SELF_LOCK_UNKNOWN_APP_NAME");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v17 = 0.0;
    switch(a3)
    {
      case 0:
        int64_t v18 = [(GAXUIServer *)self lastPasscodeViewDismissalReason];
        v19 = @"USER_LOCKED_OUT_VIA_CANCEL";
        if (v18 == 1) {
          v19 = @"USER_LOCKED_OUT_VIA_FAIL";
        }
        id v20 = v14;
        v21 = v19;
        v22 = +[NSNumber numberWithUnsignedInteger:(unint64_t)a7];
        GAXLocString(v21);
        v24 = BOOL v23 = v10;

        v25 = GAXLocalizedNumber((uint64_t)v22);
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v25);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        id v14 = v20;
        BOOL v10 = v23;
        goto LABEL_23;
      case 1:
        v27 = +[AXSettings sharedInstance];
        unsigned int v28 = [v27 guidedAccessAllowsUnlockWithTouchID];

        if (v28)
        {
          if (AXDeviceHasPearl())
          {
            int v29 = 1;
            v30 = AXLocStringKeyForExclusiveModel();
            GAXLocString(v30);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v31 = @"SESSION_RUNNING_NOTE_WITH_TOUCH_ID";
LABEL_27:
            GAXLocString(v31);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:
            int v29 = 1;
          }
        }
        else
        {
          int v29 = 1;
          v36 = AXLocStringKeyForHomeButtonAndExclusiveModel();
          GAXLocString(v36);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
LABEL_29:
        if (v14)
        {
          int v51 = v29;
          int v37 = a3;
          id v38 = v15;
          v39 = self;
          BOOL v40 = v11;
          [v14 floatValue];
          v42 = GAXLocalizedStringForTimeDuration(v41);
          if ([v42 length])
          {
            id v43 = v14;
            BOOL v44 = v10;
          }
          else
          {
            BOOL v44 = v10;
            id v43 = v14;
            [v14 floatValue];
            uint64_t v46 = GAXLocalizedStringForTimeDuration(v45);

            v42 = (void *)v46;
          }
          v47 = GAXLocString(@"TIME_RESTRICTION_APP_TIME_REMAINING_TOP_BANNER");
          v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v42);

          uint64_t v49 = [(__CFString *)v26 stringByAppendingFormat:@"\n%@", v48];

          v26 = (__CFString *)v49;
          BOOL v10 = v44;
          BOOL v11 = v40;
          id v14 = v43;
          self = v39;
          id v15 = v38;
          a3 = v37;
          int v29 = v51;
        }
        if (v29) {
          [(GAXUIServer *)self _showAlertWithText:v26 asBanner:v11 isUrgent:v10];
        }
        else {
        v50 = [(GAXUIServer *)self _showAlertWithText:v26 subtitleText:0 iconImage:0 asBanner:v11 isUrgent:v10 duration:v17];
        }
        if (a3)
        {
          if (a3 == 3) {
            [(GAXUIServer *)self _playPreferredTimeRestrictionsSoundAndSpeakMessageIfNeeded:v26];
          }
        }
        else
        {
          [(GAXUIServer *)self setLockoutAlertIdentifier:v50];
        }

        break;
      case 2:
        GAXLocString(@"SESSION_ENDED");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v29 = 0;
        double v17 = 2.1;
        goto LABEL_29;
      case 3:
        int v29 = 1;
        v26 = &stru_5E940;
        goto LABEL_29;
      case 4:
        if (AXDeviceHasPearl()) {
          v31 = @"FACE_ID_FAILED_NOTE";
        }
        else {
          v31 = @"TOUCH_ID_FAILED_NOTE";
        }
        goto LABEL_27;
      case 5:
        v22 = AXLocStringKeyForModel();
        GAXLocString(v22);
        v33 = id v32 = v14;
        GAXLocalizedStringForTimeDuration(28800.0);
        v35 = BOOL v34 = v10;
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v15, v35);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        BOOL v10 = v34;
        goto LABEL_22;
      case 6:
      case 7:
        v22 = AXLocStringKeyForModel();
        GAXLocString(v22);
        v33 = id v32 = v14;
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v15);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        id v14 = v32;
LABEL_23:

        goto LABEL_28;
      default:
        v26 = 0;
        goto LABEL_28;
    }
  }
}

- (id)_showAlertWithText:(id)a3 asBanner:(BOOL)a4 isUrgent:(BOOL)a5
{
  unsigned __int8 v5 = (double *)&AXUIAlertDisplayTimeDefaultForBanners;
  if (!a4) {
    unsigned __int8 v5 = (double *)&AXUIAlertDisplayTimeDefaultForAlerts;
  }
  return [(GAXUIServer *)self _showAlertWithText:a3 subtitleText:0 iconImage:0 asBanner:a4 isUrgent:a5 duration:*v5];
}

- (id)_showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 asBanner:(BOOL)a6 isUrgent:(BOOL)a7 duration:(double)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if ([(GAXUIServer *)self shouldHideAllAlerts]) {
    goto LABEL_3;
  }
  double v17 = [(GAXUIServer *)self deviceRestrictedAlertIdentifier];

  if (v17) {
    goto LABEL_3;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v21 = v20;
  if (v10)
  {
    if (!a7)
    {
      [(GAXUIServer *)self lastBannerAlertShownTimeInterval];
      double v23 = v21 - v22;
      [(GAXUIServer *)self _minimumDelayForShowingAdditionalBannerAlert];
      if (v23 <= v24)
      {
LABEL_3:
        int64_t v18 = 0;
        goto LABEL_4;
      }
    }
    uint64_t v25 = 2;
  }
  else
  {
    uint64_t v26 = [(GAXUIServer *)self identifierOfVisibleRegularAlert];
    if (v26)
    {
      v27 = (void *)v26;
      int64_t v18 = 0;
      goto LABEL_22;
    }
    uint64_t v25 = 0;
  }
  unsigned int v28 = +[AXUIDisplayManager sharedDisplayManager];
  int64_t v18 = [v28 showAlertWithText:v14 subtitleText:v15 iconImage:v16 type:v25 priority:20 duration:self forService:a8];

  if (!v18) {
    goto LABEL_4;
  }
  v27 = [(GAXUIServer *)self identifiersOfVisibleBannerAlerts];
  if (!v27)
  {
    v27 = objc_opt_new();
    [(GAXUIServer *)self setIdentifiersOfVisibleBannerAlerts:v27];
  }
  [v27 addObject:v18];
  if (v10)
  {
    [(GAXUIServer *)self setLastBannerAlertShownTimeInterval:v21];
    int v29 = [(GAXUIServer *)self identifiersOfBannerAlertsAboutToAppear];
    if (!v29)
    {
      int v29 = objc_opt_new();
      [(GAXUIServer *)self setIdentifiersOfBannerAlertsAboutToAppear:v29];
    }
    [v29 addObject:v18];
  }
  else
  {
    [(GAXUIServer *)self setIdentifierOfVisibleRegularAlert:v18];
  }
LABEL_22:

LABEL_4:

  return v18;
}

- (void)setAppRestrictionIdentifiers:(id)a3
{
  if (self->_appRestrictionIdentifiers != a3)
  {
    id v4 = a3;
    unsigned __int8 v5 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v4 copyItems:1];

    appRestrictionIdentifiers = self->_appRestrictionIdentifiers;
    self->_appRestrictionIdentifiers = v5;
  }
}

- (void)setStatesForAppRestrictions:(id)a3
{
  if (self->_statesForAppRestrictions != a3)
  {
    id v4 = a3;
    unsigned __int8 v5 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v4 copyItems:1];

    statesForAppRestrictions = self->_statesForAppRestrictions;
    self->_statesForAppRestrictions = v5;
  }
}

- (void)setTextsForAppRestrictions:(id)a3
{
  if (self->_textsForAppRestrictions != a3)
  {
    id v4 = a3;
    unsigned __int8 v5 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v4 copyItems:1];

    textsForAppRestrictions = self->_textsForAppRestrictions;
    self->_textsForAppRestrictions = v5;
  }
}

- (void)setDetailTextsForAppRestrictions:(id)a3
{
  if (self->_detailTextsForAppRestrictions != a3)
  {
    id v4 = a3;
    unsigned __int8 v5 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v4 copyItems:1];

    detailTextsForAppRestrictions = self->_detailTextsForAppRestrictions;
    self->_detailTextsForAppRestrictions = v5;
  }
}

- (int64_t)appRestrictionStateForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GAXUIServer *)self statesForAppRestrictions];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 integerValue];
  return (int64_t)v7;
}

- (void)setAppRestrictionState:(int64_t)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v9 = [(GAXUIServer *)self statesForAppRestrictions];
  id v7 = [v9 mutableCopy];
  uint64_t v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKey:v6];

  [(GAXUIServer *)self setStatesForAppRestrictions:v7];
}

- (id)iconForAppRestrictionWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GAXUIServer *)self styleProvider];
  unsigned int v6 = [v4 isEqualToString:@"GAXProfileAllowsWebTextDefine"];

  if (v6)
  {
    id v7 = [v5 appFeatureViewDefineIcon];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)textForAppRestrictionWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GAXUIServer *)self textsForAppRestrictions];
  unsigned int v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)detailTextForAppRestrictionWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GAXUIServer *)self detailTextsForAppRestrictions];
  unsigned int v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)isFeatureEnabledForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x4010000000;
  long long v13 = &unk_583BD;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v17 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7498;
  block[3] = &unk_5CAE0;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, block);
  if ([v4 isEqualToString:@"GAXProfileAllowsKeyboardTextInput"])
  {
    int v6 = 0x40000;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsTouch"])
  {
    int v6 = 1024;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsMotion"])
  {
    int v6 = 0x10000;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsRingerSwitch"])
  {
    int v6 = 0x8000;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsProximity"])
  {
    int v6 = 0x80000;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsLockButton"])
  {
    int v6 = 2048;
  }
  else if ([v4 isEqualToString:@"GAXProfileAllowsVolumeButtons"])
  {
    int v6 = 0x4000;
  }
  else
  {
    if (([v4 isEqualToString:@"GAXProfileAllowsAutolock"] & 1) == 0)
    {
      _AXAssert();
      BOOL v7 = 0;
      goto LABEL_18;
    }
    int v6 = 0x20000;
  }
  BOOL v7 = (v11[7] & v6) != 0;
LABEL_18:
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_presentPasscodeViewControllerForUnlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7520;
  v2[3] = &unk_5CC20;
  v2[4] = self;
  [(GAXUIServer *)self getPasscodeLengthWithCompletion:v2];
}

- (void)_presentPasscodeViewControllerForSetup:(BOOL)a3 passcodeLength:(unint64_t)a4
{
  BOOL v5 = a3;
  [(GAXUIServer *)self setShouldHideAllAlerts:1];
  BOOL v7 = +[UIDevice currentDevice];
  BOOL v8 = [v7 userInterfaceIdiom] == (char *)&dword_0 + 1;

  id v11 = [(GAXUIServer *)self _preparedOverlayUserInterfaceViewController];
  id v9 = [objc_alloc((Class)AXUIPasscodeViewController) initWithPresentationStyle:v8 forSetup:v5 pinLength:a4];
  [v9 setDelegate:self];
  [v11 willPresentModalViewController];
  [v9 presentPasscodeViewWithParentViewController:v11 animated:1];
  [(GAXUIServer *)self setPasscodeViewController:v9];
  if (!v5)
  {
    [(GAXUIServer *)self _clearPasscodeDismissalTimer];
    uint64_t v10 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_timerDismissPasscode:" selector:0 userInfo:0 repeats:15.0];
    [(GAXUIServer *)self setPasscodeDismissalTimer:v10];
  }
}

- (void)_dismissPasscodeViewAnimated:(BOOL)a3 withReason:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(GAXUIServer *)self passcodeViewController];
  [v6 dismissPasscodeViewAnimated:v5 reason:a4];
}

- (void)_timerDismissPasscode:(id)a3
{
}

- (void)_clearPasscodeDismissalTimer
{
  double v3 = [(GAXUIServer *)self passcodeDismissalTimer];
  [v3 invalidate];

  [(GAXUIServer *)self setPasscodeDismissalTimer:0];
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v4 = a4;
  BOOL v5 = GAXLogTimeRestrictions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Finished speaking: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_playPreferredTimeRestrictionsSoundAndSpeakMessageIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AXSettings sharedInstance];
  id v6 = [objc_alloc((Class)TLAlertConfiguration) initWithType:2];
  id v7 = [v5 guidedAccessToneIdentifierForTimeRestrictionEvents];
  [v6 setToneIdentifier:v7];

  [v6 setVibrationIdentifier:TLVibrationIdentifierNone];
  [v6 setShouldIgnoreRingerSwitch:1];
  BOOL v8 = +[TLAlert alertWithConfiguration:v6];
  [v8 playWithCompletionHandler:0];
  id v9 = GAXLogTimeRestrictions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109379;
    v13[1] = [v5 guidedAccessShouldSpeakForTimeRestrictionEvents];
    __int16 v14 = 2113;
    id v15 = v4;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Will speak: %d, %{private}@", (uint8_t *)v13, 0x12u);
  }

  if ([v5 guidedAccessShouldSpeakForTimeRestrictionEvents])
  {
    uint64_t v10 = +[AVSpeechUtterance speechUtteranceWithString:v4];
    *(float *)&double v11 = AVSpeechUtteranceDefaultSpeechRate;
    [v10 setRate:v11];
    uint64_t v12 = [(GAXUIServer *)self speechSynthesizer];
    [v12 speakUtterance:v10];
  }
}

- (void)_showTimeRestrictionsLockoutViewWithAppTimeRestrictionDuration:(double)a3
{
  uint64_t v5 = [(GAXUIServer *)self activeContentViewController];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  id v7 = [(GAXUIServer *)self activeContentViewController];
  BOOL v8 = [(GAXUIServer *)self timeRestrictionLockoutViewController];

  if (v7 != v8)
  {
LABEL_3:
    id v9 = GAXLocString(@"GAX_TIME_RESTRICTION_DID_EXPIRE_SPEECH_STRIMG");
    [(GAXUIServer *)self _playPreferredTimeRestrictionsSoundAndSpeakMessageIfNeeded:v9];

    uint64_t v10 = [(GAXUIServer *)self timeRestrictionLockoutViewController];

    if (!v10)
    {
      double v11 = [[GAXTimeRestrictionLockoutViewController alloc] initWithUIServer:self];
      [(GAXUIServer *)self setTimeRestrictionLockoutViewController:v11];
    }
    uint64_t v12 = [(GAXUIServer *)self timeRestrictionLockoutViewController];
    [v12 setAppTimeRestrictionDuration:a3];

    id v13 = [(GAXUIServer *)self timeRestrictionLockoutViewController];
    [(GAXUIServer *)self setActiveContentViewController:v13];
  }
}

- (void)_hideTimeRestrictionsLockoutView
{
}

- (BOOL)_isTimeRestrictionLockoutViewShowing
{
  double v3 = [(GAXUIServer *)self timeRestrictionLockoutViewController];
  if (v3)
  {
    id v4 = [(GAXUIServer *)self activeContentViewController];
    BOOL v5 = v4 == v3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)_rotationContextForInterestAreaViewController:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  int64_t v18 = &v17;
  uint64_t v19 = 0x4010000000;
  double v20 = &unk_583BD;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  int v24 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7D98;
  v16[3] = &unk_5CAE0;
  v16[4] = self;
  v16[5] = &v17;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v16);
  int v6 = *((_DWORD *)v18 + 8);
  if (v6 == 1)
  {
    id v12 = [(GAXUIServer *)self activeContentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v12;
      unsigned int v13 = [v4 isEditing];
      id v14 = [v12 interestAreaViewController];

      uint64_t v10 = v14 == v4;
      if (v14 == v4) {
        uint64_t v8 = v13;
      }
      else {
        uint64_t v8 = 0;
      }

      uint64_t v7 = 0;
      unsigned int v11 = 1;
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unsigned int v11 = 0;
    }
    goto LABEL_13;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v11 = 0;
  if (v6 == 2)
  {
    id v12 = [(GAXUIServer *)self passiveInterestAreaViewController];
    uint64_t v9 = v12 == v4 && [(GAXUIServer *)self allowsTouch];
    uint64_t v8 = 0;
    uint64_t v7 = 1;
    uint64_t v10 = v9;
    unsigned int v11 = 1;
LABEL_13:
  }
  _Block_object_dispose(&v17, 8);

  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)((v8 << 24) | (v7 << 32) | (v9 << 16) | (v10 << 8) | v11);
}

- (void)_applyInterestAreaPathsForStorage:(id)a3 toInterestAreaViewController:(id)a4 andFadeInterestAreaPathsIn:(BOOL)a5 fadeInterestAreaSpecialControlsIn:(BOOL)a6 notifyClientOfReplacedInterestAreaPathsDuringSession:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v18 = a3;
  id v12 = a4;
  unsigned int v13 = v12;
  if (v18)
  {
    [v12 setInterestAreaPathsForStorage:v18 animated:0];
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [v12 setInterestAreaPaths:0 animated:0];
  if (v9) {
LABEL_3:
  }
    [v13 setAllowsDimmingInterestAreaPaths:1 animated:1];
LABEL_4:
  if (!v8)
  {
    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v17 = [v13 interestAreaView];
  [v17 setSpecialControlsVisible:1 animated:1];

  if (v7)
  {
LABEL_6:
    id v14 = [(GAXUIServer *)self _archivedInterestAreaPathsInScreenCoordinatesForInterestAreaViewController:v13];
    id v15 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v14, @"interest area paths in screen coordinates", 0);
    uint64_t v16 = [(GAXUIServer *)self _clientMessenger];
    [v16 sendAsynchronousMessage:v15 withIdentifier:28 targetAccessQueue:0 completion:0];
  }
LABEL_7:
}

- (id)_archivedInterestAreaPathsInScreenCoordinatesForInterestAreaViewController:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unsigned int v11 = sub_8014;
  id v12 = sub_8024;
  id v13 = 0;
  id v4 = [v3 interestAreaPathsInScreenCoordinates];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_802C;
  v7[3] = &unk_5CC48;
  v7[4] = &v8;
  [v4 enumeratePathsAndParentsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_archiveInterestAreaPathsForStorage:(id)a3
{
  if (a3) {
    +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else {
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  }

  return v3;
}

- (void)_adjustContentsGeometryOfInterestAreaViewWithController:(id)a3
{
  id v3 = a3;
  id v18 = [v3 interestAreaView];
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = +[AXUIDisplayManager sharedDisplayManager];
  id v14 = (char *)[v13 activeInterfaceOrientation];
  if ((unint64_t)(v14 - 3) >= 2) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  if ((unint64_t)(v14 - 3) >= 2) {
    double v16 = v10;
  }
  else {
    double v16 = v12;
  }
  objc_msgSend(v18, "setContentsBounds:", v6, v8, v16, v15);
  uint64_t v17 = [v3 styleProvider];

  [v17 applicationViewRoundedCornerRadius];
  objc_msgSend(v18, "setContentsCornerRadius:");
}

- (void)_disableTelephonyIfNeededForMode:(unsigned int)a3
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  ICFRegisterCallFilterResultBlockWithIdentifier();
}

- (void)_restoreTelephony
{
  unint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  ICFUnregisterCallFilterResultBlockWithIdentifier();
}

- (void)_displayBlockedIncomingCallWithSourceAddress:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(GAXUIServer *)self incomingCallAlertIdentifier];

  if (v8) {
    goto LABEL_47;
  }
  v58 = self;
  id v59 = v7;
  id v9 = objc_alloc_init((Class)CNContactStore);
  double v10 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v77[0] = v10;
  v77[1] = CNContactCallAlertKey;
  v77[2] = CNContactPhoneNumbersKey;
  v77[3] = CNContactEmailAddressesKey;
  uint64_t v11 = +[NSArray arrayWithObjects:v77 count:4];

  double v12 = +[CNPhoneNumber phoneNumberWithStringValue:v6];
  id v13 = +[CNContact predicateForContactsMatchingPhoneNumber:v12];
  id v72 = 0;
  v60 = (void *)v11;
  v61 = v9;
  id v14 = [v9 unifiedContactsMatchingPredicate:v13 keysToFetch:v11 error:&v72];
  id v15 = v72;
  double v16 = [v14 firstObject];

  id v62 = v15;
  if (v15)
  {
    uint64_t v17 = GAXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v15;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Error fetching contact matching phone number: %@", buf, 0xCu);
    }
    goto LABEL_28;
  }
  if (!v16)
  {
    v27 = +[CNContact predicateForContactsMatchingEmailAddress:v6];
    id v67 = 0;
    unsigned int v28 = [v61 unifiedContactsMatchingPredicate:v27 keysToFetch:v60 error:&v67];
    id v62 = v67;
    double v16 = [v28 firstObject];

    if (!v16)
    {
      uint64_t v38 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      goto LABEL_35;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v17 = [v16 emailAddresses];
    id v29 = [v17 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (!v29) {
      goto LABEL_28;
    }
    id v30 = v29;
    v56 = v16;
    double v20 = 0;
    uint64_t v31 = *(void *)v64;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(v17);
        }
        v33 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        BOOL v34 = [v33 value];
        unsigned int v35 = [v34 isEqualToString:v6];

        if (v35)
        {
          uint64_t v36 = [v33 label];

          double v20 = (void *)v36;
        }
      }
      id v30 = [v17 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v30);
LABEL_26:
    double v16 = v56;
    goto LABEL_29;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v17 = [v16 phoneNumbers];
  id v18 = [v17 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v18)
  {
    id v19 = v18;
    v56 = v16;
    double v20 = 0;
    uint64_t v21 = *(void *)v69;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
        int v24 = [v23 value];
        unsigned int v25 = [v24 isEqual:v12];

        if (v25)
        {
          uint64_t v26 = [v23 label];

          double v20 = (void *)v26;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v19);
    id v62 = 0;
    goto LABEL_26;
  }
  id v62 = 0;
LABEL_28:
  double v20 = 0;
LABEL_29:

  if (!v16)
  {
    uint64_t v41 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 0;
    if (v20) {
      goto LABEL_33;
    }
LABEL_35:
    v42 = 0;
    goto LABEL_36;
  }
  int v37 = [v16 callAlert];
  uint64_t v38 = [v37 sound];

  v39 = [v16 callAlert];
  uint64_t v40 = [v39 vibration];

  uint64_t v41 = +[CNContactFormatter stringFromContact:v16 style:0];
  if (!v20) {
    goto LABEL_35;
  }
LABEL_33:
  v42 = +[CNLabeledValue localizedStringForLabel:v20];

LABEL_36:
  id v43 = [objc_alloc((Class)TLAlertConfiguration) initWithType:1];
  BOOL v44 = v43;
  if (v38) {
    [v43 setToneIdentifier:v38];
  }
  if (v40) {
    [v44 setVibrationIdentifier:v40];
  }
  v55 = (void *)v40;
  v57 = (void *)v38;
  [v44 setShouldRepeat:0];
  [v44 setMaximumDuration:60.0];
  float v45 = +[TLAlert alertWithConfiguration:v44];
  [v45 playWithCompletionHandler:&stru_5CCD8];

  if (v41) {
    uint64_t v46 = (void *)v41;
  }
  else {
    uint64_t v46 = v6;
  }
  id v47 = objc_msgSend(v46, "copy", v41);
  v48 = v16;
  if (v42)
  {
    id v49 = [v42 copy];
  }
  else
  {
    v50 = GAXLocString(@"INCOMING_CALL_SUBTITLE");
    id v49 = [v50 copy];
  }
  int v51 = +[NSBundle bundleForClass:objc_opt_class()];
  v52 = +[UIImage imageNamed:@"phone_ga" inBundle:v51];

  v53 = [(GAXUIServer *)v58 _showAlertWithText:v47 subtitleText:v49 iconImage:v52 asBanner:1 isUrgent:1 duration:5.0];
  [(GAXUIServer *)v58 setIncomingCallAlertIdentifier:v53];
  [(GAXUIServer *)v58 setIncomingCallType:0];

  id v7 = v59;
LABEL_47:
}

- (void)_reestablishSpringboardClient
{
  id v3 = [objc_alloc((Class)AXIPCClient) initWithServiceName:@"com.apple.accessibility.gax.springboard"];
  [(GAXUIServer *)self setSpringboardClient:v3];
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8C5C;
  v4[3] = &unk_5CD00;
  objc_copyWeak(&v5, &location);
  [v3 setPortDeathHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_rotateDeviceToCurrentOrientation
{
  id v3 = +[AXEventRepresentation buttonRepresentationWithType:50];
  objc_msgSend(v3, "setAdditionalFlags:", (unint64_t)objc_msgSend(v3, "additionalFlags") | 0x4000);
  unint64_t v2 = +[AXBackBoardServer server];
  [v2 postEvent:v3 systemEvent:1];
}

- (id)_unarchivedPathMappingWithData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_clientMessenger
{
  return +[AXUIClientMessenger clientMessengerWithIdentifier:@"GAXUIClientIdentifierBackboard"];
}

- (void)_notifyClientOfUpdatedActiveInterfaceOrientation
{
  id v6 = +[AXUIDisplayManager sharedDisplayManager];
  id v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 activeInterfaceOrientation]);
  id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v3, @"active interface orientation", 0);
  id v5 = [(GAXUIServer *)self _clientMessenger];
  [v5 sendAsynchronousMessage:v4 withIdentifier:2 targetAccessQueue:0 completion:0];
}

- (void)_interestAreaViewControllerInterfaceOrientationDidUpdate:(int64_t)a3
{
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v6, @"active interface orientation", 0);
  id v5 = [(GAXUIServer *)self _clientMessenger];
  [v5 sendAsynchronousMessage:v4 withIdentifier:2 targetAccessQueue:0 completion:0];
}

- (id)_preparedOverlayUserInterfaceViewController
{
  id v3 = [(GAXUIServer *)self overlayActiveContentViewController];
  if (!v3)
  {
    id v3 = objc_opt_new();
    id v4 = [v3 view];
    [v4 setUserInteractionEnabled:1];

    [(GAXUIServer *)self setOverlayActiveContentViewController:v3];
  }
  if (![(GAXUIServer *)self isAXUIServerSceneReady])
  {
    do
    {
      id v5 = GAXLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "AXUIServer scene not ready for overlayActiveContentViewController yet", v9, 2u);
      }

      id v6 = +[NSRunLoop currentRunLoop];
      id v7 = +[NSDate dateWithTimeIntervalSinceNow:0.1];
      [v6 runUntilDate:v7];
    }
    while (![(GAXUIServer *)self isAXUIServerSceneReady]);
  }

  return v3;
}

- (BOOL)shouldShowCancelButtonForPasscodeViewController:(id)a3
{
  id v3 = +[AXSpringBoardServer server];
  char v4 = [v3 isSystemAppFrontmost] ^ 1;

  return v4;
}

- (void)passcodeViewController:(id)a3 passcodeViewIsVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 view];
  id v7 = [v6 window];
  unsigned int v8 = [v7 _contextId];

  id v14 = +[NSNumber numberWithUnsignedInteger:v8];
  id v9 = objc_alloc((Class)NSDictionary);
  double v10 = +[NSNumber numberWithBool:v4];
  id v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"passcode is visible", v14, @"passcode window context ID", 0);

  double v12 = [(GAXUIServer *)self _clientMessenger];
  [v12 sendAsynchronousMessage:v11 withIdentifier:16 targetAccessQueue:0 completion:0];

  if (!v4)
  {
    id v13 = [(GAXUIServer *)self overlayActiveContentViewController];
    [v13 didDismissModalViewController];

    [(GAXUIServer *)self setPasscodeViewController:0];
  }
}

- (void)passcodeViewController:(id)a3 wasDismissedWithReason:(int64_t)a4
{
  [(GAXUIServer *)self setLastPasscodeViewDismissalReason:a4];
  [(GAXUIServer *)self setShouldHideAllAlerts:0];
  if (a4 != 1)
  {
    if (a4 == 5) {
      goto LABEL_9;
    }
    if (a4 != 3)
    {
LABEL_8:
      unsigned int v8 = +[NSNumber numberWithInteger:a4];
      id v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v8, @"passcode view dismissal reason", 0);
      double v10 = [(GAXUIServer *)self _clientMessenger];
      id v11 = +[AXAccessQueue mainAccessQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_94D4;
      v16[3] = &unk_5CD50;
      v16[4] = self;
      v16[5] = a4;
      [v10 sendAsynchronousMessage:v9 withIdentifier:17 targetAccessQueue:v11 completion:v16];

      goto LABEL_9;
    }
  }
  [(GAXUIServer *)self setNumberOfBannerAlertsShownRecently:0];
  id v6 = +[AXSpringBoardServer server];
  if (![v6 isSystemAppFrontmost])
  {
LABEL_7:

    goto LABEL_8;
  }
  id v7 = +[AXSpringBoardServer server];
  if ([v7 hasActiveOrPendingCallOrFaceTime])
  {

    goto LABEL_7;
  }
  double v12 = +[AXSpringBoardServer server];
  unsigned __int8 v13 = [v12 isScreenLockedWithPasscode:0];

  if (v13) {
    goto LABEL_8;
  }
  id v14 = GAXLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"was canceled";
    if (a4 == 1) {
      CFStringRef v15 = @"failed";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v18 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Passcode entry %@ while system app was frontmost. Will present passcode view again.", buf, 0xCu);
  }

  void v16[6] = _NSConcreteStackBlock;
  v16[7] = 3221225472;
  v16[8] = sub_94CC;
  v16[9] = &unk_5CD28;
  v16[10] = self;
  AXPerformBlockOnMainThreadAfterDelay();
LABEL_9:
  [(GAXUIServer *)self _clearPasscodeDismissalTimer];
}

- (void)passcodeViewController:(id)a3 didFinishSettingUpPasscode:(id)a4
{
  id v5 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v5, @"passcode", 0);

  id v6 = [(GAXUIServer *)self _clientMessenger];
  [v6 sendAsynchronousMessage:v7 withIdentifier:18 targetAccessQueue:0 completion:0];
}

- (void)getPasscodeLengthWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXUIServer *)self _clientMessenger];
  id v6 = +[AXAccessQueue mainAccessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9798;
  v8[3] = &unk_5CB08;
  id v9 = v4;
  id v7 = v4;
  [v5 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:20 targetAccessQueue:v6 completion:v8];
}

- (void)passcodeViewController:(id)a3 isPasscode:(id)a4 correctWithCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v8, @"passcode", 0);

  double v10 = [(GAXUIServer *)self _clientMessenger];
  id v11 = +[AXAccessQueue mainAccessQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_9944;
  v13[3] = &unk_5CB08;
  id v14 = v7;
  id v12 = v7;
  [v10 sendAsynchronousMessage:v9 withIdentifier:19 targetAccessQueue:v11 completion:v13];
}

- (int64_t)activeInterfaceOrientationForPasscodeViewController:(id)a3
{
  id v3 = +[UIWindow _applicationKeyWindow];
  id v4 = [v3 windowScene];
  id v5 = [v4 interfaceOrientation];

  return (int64_t)v5;
}

- (void)interestAreaViewController:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v7 = a3;
  unint64_t v8 = (unint64_t)[(GAXUIServer *)self _rotationContextForInterestAreaViewController:v7];
  int v9 = v8;
  if ((v8 & 0x100) != 0)
  {
    v10.i64[0] = 0xFFFFFFFFFFLL;
    v10.i64[1] = 0xFFFFFFFFFFLL;
    uint64x2_t v11 = (uint64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v8), v10);
    int32x4_t v23 = (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_457D0);
    int32x4_t v22 = (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_457E0);
    id v12 = [(GAXUIServer *)self interestAreaPathsForStorageForRotatingView];
    if (!v12)
    {
      id v12 = objc_opt_new();
      [(GAXUIServer *)self setInterestAreaPathsForStorageForRotatingView:v12];
    }
    int32x4_t v24 = vuzp1q_s32(v22, v23);
    unsigned __int8 v13 = +[NSNumber numberWithUnsignedInteger:a4];
    id v14 = +[NSNumber numberWithBool:0];
    [v12 setObject:v14 forKey:v13];

    if ((v9 & 0x10000) != 0) {
      [v7 setAllowsDimmingInterestAreaPaths:0 animated:1];
    }
    v15.i64[1] = v24.i64[1];
    *(int16x4_t *)v15.i8 = vmovn_s32(v24);
    int16x8_t v25 = v15;
    if ((v9 & 0x1000000) != 0)
    {
      double v16 = [v7 interestAreaView];
      [v16 setSpecialControlsVisible:0 animated:1];
    }
    id v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v13, @"interface orientation", 0);
    CFStringRef v18 = [(GAXUIServer *)self _clientMessenger];
    id v19 = +[AXAccessQueue mainAccessQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_9C60;
    v26[3] = &unk_5CD78;
    v26[4] = self;
    id v27 = v12;
    id v28 = v13;
    id v29 = v7;
    char v30 = v9;
    unsigned __int32 v31 = vmovn_s16(v25).u32[0];
    id v20 = v13;
    id v21 = v12;
    [v18 sendAsynchronousMessage:v17 withIdentifier:26 targetAccessQueue:v19 completion:v26];
  }
}

- (void)interestAreaViewController:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v9 = a3;
  -[GAXUIServer _interestAreaViewControllerInterfaceOrientationDidUpdate:](self, "_interestAreaViewControllerInterfaceOrientationDidUpdate:", [v9 interfaceOrientation]);
  unint64_t v5 = (unint64_t)[(GAXUIServer *)self _rotationContextForInterestAreaViewController:v9];
  if (v5) {
    [(GAXUIServer *)self _adjustContentsGeometryOfInterestAreaViewWithController:v9];
  }
  if ((v5 & 0x100) != 0)
  {
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 interfaceOrientation]);
    id v7 = [(GAXUIServer *)self interestAreaPathsForStorageForRotatingView];
    unint64_t v8 = [v7 objectForKey:v6];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      [(GAXUIServer *)self _applyInterestAreaPathsForStorage:v8 toInterestAreaViewController:v9 andFadeInterestAreaPathsIn:(v5 >> 16) & 1 fadeInterestAreaSpecialControlsIn:(v5 >> 24) & 1 notifyClientOfReplacedInterestAreaPathsDuringSession:HIDWORD(v5) & 1];
    }
    [v7 removeObjectForKey:v6];
    if (![v7 count]) {
      [(GAXUIServer *)self setInterestAreaPathsForStorageForRotatingView:0];
    }
  }
}

- (void)archiveInterestAreaPathsForStorageInterestAreaViewController:(id)a3
{
  id v4 = a3;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 interfaceOrientation]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 interestAreaPathsForStorage];

  id v6 = [(GAXUIServer *)self _archiveInterestAreaPathsForStorage:v5];

  id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v9, @"interface orientation", v6, @"interest area paths for storage", 0);
  unint64_t v8 = [(GAXUIServer *)self _clientMessenger];
  [v8 sendAsynchronousMessage:v7 withIdentifier:27 targetAccessQueue:0 completion:0];
}

- (id)_unmanagedASAMRestrictedFeaturesForStyle:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v8 = MCFeatureDefinitionLookupAllowed;
    id v3 = &v8;
    uint64_t v4 = 1;
  }
  else
  {
    v7[0] = MCFeatureSpellCheckAllowed;
    v7[1] = MCFeatureDefinitionLookupAllowed;
    v7[2] = MCFeatureAutoCorrectionAllowed;
    v7[3] = MCFeaturePredictiveKeyboardAllowed;
    v7[4] = MCFeatureKeyboardShortcutsAllowed;
    void v7[5] = MCFeatureActivityContinuationAllowed;
    v7[6] = MCFeatureDictationAllowed;
    v7[7] = MCFeatureScreenShotAllowed;
    v7[8] = MCFeatureSmartPunctuationAllowed;
    v7[9] = MCFeatureAccessibilitySpeechAllowed;
    v7[10] = MCFeaturePasswordAutoFillAllowed;
    v7[11] = MCFeatureContinuousPathKeyboardAllowed;
    v7[12] = MCFeatureSelectedTextSharingAllowed;
    v7[13] = MCFeatureTranslationLookupAllowed;
    v7[14] = MCFeatureWritingToolsAllowed;
    id v3 = v7;
    uint64_t v4 = 15;
  }
  unint64_t v5 = +[NSArray arrayWithObjects:v3 count:v4];

  return v5;
}

- (id)_unmanagedASAMRestrictionDictionaryForStyle:(int64_t)a3
{
  unint64_t v5 = +[NSMutableDictionary dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = -[GAXUIServer _unmanagedASAMRestrictedFeaturesForStyle:](self, "_unmanagedASAMRestrictedFeaturesForStyle:", a3, 0);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 MCSetBoolRestriction:*(void *)(*((void *)&v12 + 1) + 8 * i) value:0];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)applyUnmanagedASAMRestrictionsForStyle:(int64_t)a3 managedConfigurationSettings:(id)a4
{
  id v6 = a4;
  id v7 = [(GAXUIServer *)self managedConfigurationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2E4;
  block[3] = &unk_5CDA0;
  id v10 = v6;
  uint64x2_t v11 = self;
  int64_t v12 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)removeUnmanagedASAMRestrictions
{
  unint64_t v2 = [(GAXUIServer *)self managedConfigurationQueue];
  dispatch_async(v2, &stru_5CDC0);
}

- (void)_changeUnmanagedASAMRestrictionStateEnabled:(BOOL)a3 style:(int64_t)a4 managedConfigurationSettings:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1 && v6)
  {
    uint64_t v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_379C4();
    }
  }
  if (v6) {
    [(GAXUIServer *)self applyUnmanagedASAMRestrictionsForStyle:a4 managedConfigurationSettings:v8];
  }
  else {
    [(GAXUIServer *)self removeUnmanagedASAMRestrictions];
  }
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  int64_t v12 = 0;
  switch(a4)
  {
    case 1uLL:
      long long v13 = [v10 objectForKey:@"gax backboard state"];
      memset(buf, 0, 28);
      [v13 getBytes:buf length:28];
      gaxStateAccessQueue = self->_gaxStateAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_AE64;
      block[3] = &unk_5CDE8;
      void block[4] = self;
      v55[0] = *(_OWORD *)buf;
      *(_OWORD *)((char *)v55 + 12) = *(_OWORD *)&buf[12];
      dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, block);
      long long v15 = [v10 objectForKey:@"time restriction did expire"];
      unsigned int v16 = [v15 BOOLValue];

      if (v16)
      {
        id v17 = [v10 objectForKey:@"time restriction duration"];
        double v18 = (double)(uint64_t)[v17 integerValue] * 60.0;

        [(GAXUIServer *)self _showTimeRestrictionsLockoutViewWithAppTimeRestrictionDuration:v18];
      }
      goto LABEL_34;
    case 2uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      goto LABEL_36;
    case 3uLL:
      long long v13 = [v10 objectForKey:@"session application identifiers"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        long long v13 = 0;
      }
      [(GAXUIServer *)self setSessionApplicationIdentifiers:v13];
      goto LABEL_34;
    case 4uLL:
      long long v13 = [v10 objectForKey:@"gax backboard state"];
      memset(buf, 0, 28);
      [v13 getBytes:buf length:28];
      int32x4_t v23 = self->_gaxStateAccessQueue;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_AE7C;
      v52[3] = &unk_5CDE8;
      v52[4] = self;
      v53[0] = *(_OWORD *)buf;
      *(_OWORD *)((char *)v53 + 12) = *(_OWORD *)&buf[12];
      dispatch_sync((dispatch_queue_t)v23, v52);
      goto LABEL_34;
    case 5uLL:
      int32x4_t v24 = [v10 objectForKey:@"alert is banner"];
      id v25 = [v24 BOOLValue];

      uint64_t v26 = [v10 objectForKey:@"alert is urgent"];
      id v27 = [v26 BOOLValue];

      id v28 = [v10 objectForKey:@"alert time restriction remaining time"];
      id v29 = [v10 objectForKey:@"alert text type"];
      id v30 = [v29 unsignedIntegerValue];

      unsigned __int32 v31 = [v10 objectForKey:@"alert remaining lockout duration"];
      [v31 doubleValue];
      double v33 = v32;

      BOOL v34 = [v10 objectForKey:@"application name"];
      [(GAXUIServer *)self _showAlertWithType:v30 AsBanner:v25 isUrgent:v27 timeRestrictionRemainingTime:v28 remainingLockoutDuration:v34 effectiveApplicationDisplayName:v33];

      goto LABEL_35;
    case 6uLL:
      id v21 = [v10 objectForKey:@"new passcode length"];
      id v22 = [v21 unsignedIntegerValue];

      [(GAXUIServer *)self _presentPasscodeViewControllerForSetup:1 passcodeLength:v22];
      goto LABEL_35;
    case 7uLL:
      unsigned int v35 = GAXLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Received request to show passcode view for verification.", buf, 2u);
      }

      uint64_t v36 = [(GAXUIServer *)self passcodeViewController];
      unsigned int v37 = [v36 isPasscodeViewVisible];

      if (v37)
      {
        uint64_t v38 = GAXLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Ignoring because already visible.", buf, 2u);
        }

        v39 = +[NSNumber numberWithBool:1];
        int64_t v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v39, @"passcode view was visible", 0];
      }
      else
      {
        id v49 = [(GAXUIServer *)self passiveInterestAreaViewController];
        long long v13 = v49;
        if (v49) {
          [v49 setAllowsDimmingInterestAreaPaths:0 animated:1];
        }
        v50 = GAXLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "Presenting.", buf, 2u);
        }

        [(GAXUIServer *)self _presentPasscodeViewControllerForUnlock];
LABEL_34:

LABEL_35:
        int64_t v12 = 0;
      }
LABEL_36:
      if (a6) {
        *a6 = 0;
      }

      return v12;
    case 0xEuLL:
      if (![(GAXUIServer *)self shouldHideAllAlerts])
      {
        [(GAXUIServer *)self setShouldHideAllAlerts:1];
        [(GAXUIServer *)self setShouldHideAllAlerts:0];
      }
      long long v13 = +[AXUIDisplayManager sharedDisplayManager];
      uint64_t v40 = [(GAXUIServer *)self deviceRestrictedAlertIdentifier];
      if (v40) {
        [v13 hideAlertWithIdentifier:v40 forService:self];
      }
      uint64_t v41 = GAXLocString(@"DEVICE_IS_RESTRICTED");
      v42 = [v13 showAlertWithText:v41 subtitleText:0 iconImage:0 type:0 priority:30 duration:self forService:AXUIAlertDisplayTimeForever];
      [(GAXUIServer *)self setDeviceRestrictedAlertIdentifier:v42];

      goto LABEL_34;
    case 0xFuLL:
      long long v13 = [(GAXUIServer *)self deviceRestrictedAlertIdentifier];
      if (v13)
      {
        id v43 = +[AXUIDisplayManager sharedDisplayManager];
        [v43 hideAlertWithIdentifier:v13 forService:self];

        [(GAXUIServer *)self setDeviceRestrictedAlertIdentifier:0];
      }
      goto LABEL_34;
    case 0x15uLL:
      UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
      goto LABEL_35;
    default:
      switch((unint64_t)&vars0)
      {
        case 0x9DuLL:
          id v19 = [v10 objectForKey:@"time restriction duration"];
          double v20 = (double)(uint64_t)[v19 integerValue] * 60.0;

          [(GAXUIServer *)self _showTimeRestrictionsLockoutViewWithAppTimeRestrictionDuration:v20];
          goto LABEL_35;
        case 0x9EuLL:
          [(GAXUIServer *)self _hideTimeRestrictionsLockoutView];
          goto LABEL_35;
        case 0xA0uLL:
          BOOL v44 = [(GAXUIServer *)self touchIDManager];
          [v44 brieflyListenForTouchIDAttempts];

          goto LABEL_35;
        case 0xA4uLL:
          long long v13 = [v10 objectForKeyedSubscript:@"restrictions enabled"];
          id v45 = [v13 BOOLValue];
          uint64_t v46 = [v10 objectForKeyedSubscript:@"autonomous single app mode style"];
          id v47 = [v46 integerValue];
          v48 = [v10 objectForKeyedSubscript:@"autonomous single app MC settings"];
          [(GAXUIServer *)self _changeUnmanagedASAMRestrictionStateEnabled:v45 style:v47 managedConfigurationSettings:v48];

          goto LABEL_34;
        default:
          goto LABEL_36;
      }
      goto LABEL_36;
  }
}

- (void)_confirmUnmanagedASAMWithApplicationDisplayName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GAXUIServer *)self activeContentViewController];

  if (v8)
  {
    (*((void (**)(id, _UNKNOWN **, void))v7 + 2))(v7, &off_61660, 0);
  }
  else
  {
    if (!v6)
    {
      GAXLocString(@"APP_SELF_LOCK_UNKNOWN_APP_NAME");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = GAXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_37A38(v9);
      }
    }
    id v10 = [GAXUnmanagedASAMViewController alloc];
    long long v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    unsigned int v16 = sub_B034;
    id v17 = &unk_5CE10;
    double v18 = self;
    id v19 = v7;
    id v11 = [(GAXUnmanagedASAMViewController *)v10 initWithApplicationDisplayName:v6 resultHandler:&v14];
    -[GAXUIServer setUnmanagedASAMConfirmationViewController:](self, "setUnmanagedASAMConfirmationViewController:", v11, v14, v15, v16, v17, v18);

    int64_t v12 = +[AXUIDisplayManager sharedDisplayManager];
    long long v13 = [(GAXUIServer *)self unmanagedASAMConfirmationViewController];
    [v12 addContentViewController:v13 withUserInteractionEnabled:1 forService:self context:0 completion:0];
  }
}

- (void)processMessageAsynchronously:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  switch(a4)
  {
    case 8uLL:
      uint64_t v13 = [v10 objectForKey:@"session application identifiers"];
      if (v13)
      {
        long long v14 = (void *)v13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          long long v14 = 0;
        }
        [(GAXUIServer *)self setSessionApplicationIdentifiers:v14];
      }
      uint64_t v15 = [v10 objectForKey:@"server mode for disabling telephony"];
      id v16 = [v15 unsignedIntegerValue];

      [(GAXUIServer *)self _disableTelephonyIfNeededForMode:v16];
      id v17 = [v10 objectForKey:@"gax backboard state"];
      memset(v118, 0, 28);
      [v17 getBytes:v118 length:28];
      gaxStateAccessQueue = self->_gaxStateAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_BDF8;
      block[3] = &unk_5CDE8;
      void block[4] = self;
      v117[0] = v118[0];
      *(_OWORD *)((char *)v117 + 12) = *(_OWORD *)((char *)v118 + 12);
      dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, block);
      id v19 = [v10 objectForKey:@"time restriction duration"];
      -[GAXUIServer setAppTimeRestrictionDurationInMinutes:](self, "setAppTimeRestrictionDurationInMinutes:", [v19 integerValue]);

      double v20 = [v10 objectForKey:@"time restrictions enabled"];
      -[GAXUIServer setAppTimeRestrictionsEnabled:](self, "setAppTimeRestrictionsEnabled:", [v20 BOOLValue]);

      id v21 = [v10 objectForKey:@"application name"];
      [(GAXUIServer *)self setAppName:v21];

      id v22 = [v10 objectForKey:@"archived application icon"];
      v93 = v17;
      id v95 = v11;
      if (v22)
      {
        int32x4_t v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:0];
        [(GAXUIServer *)self setAppIcon:v23];
      }
      else
      {
        [(GAXUIServer *)self setAppIcon:0];
      }
      long long v71 = [v10 objectForKey:@"restriction identifiers"];
      [(GAXUIServer *)self setAppRestrictionIdentifiers:v71];

      id v72 = [v10 objectForKey:@"states for restrictions"];
      [(GAXUIServer *)self setStatesForAppRestrictions:v72];

      v73 = [v10 objectForKey:@"texts for restrictions"];
      [(GAXUIServer *)self setTextsForAppRestrictions:v73];

      v74 = [v10 objectForKey:@"detail texts for restrictions"];
      [(GAXUIServer *)self setDetailTextsForAppRestrictions:v74];

      v75 = [v10 objectForKey:@"previous server mode"];
      unsigned int v76 = [v75 unsignedIntegerValue];

      v77 = [v10 objectForKey:@"interest area paths for storage"];
      v78 = [(GAXUIServer *)self _unarchivedPathMappingWithData:v77];

      v79 = [(GAXUIServer *)self identifierOfVisibleRegularAlert];
      if (v79)
      {
        v80 = +[AXUIDisplayManager sharedDisplayManager];
        [v80 hideAlertWithIdentifier:v79 forService:self];

        [(GAXUIServer *)self setIdentifierOfVisibleRegularAlert:0];
      }
      v81 = [(GAXUIServer *)self styleProvider];
      v82 = [(GAXUIServer *)self _preparedOverlayUserInterfaceViewController];
      v83 = [[GAXWorkspaceViewController alloc] initWithOverlayUserInterfaceViewController:v82];
      [(GAXWorkspaceViewController *)v83 setUserInterfaceServer:self];
      [(GAXWorkspaceViewController *)v83 setStyleProvider:v81];
      [(GAXWorkspaceViewController *)v83 setUsesResumeNavigationTitles:v76 == 2];
      v84 = [(GAXWorkspaceViewController *)v83 interestAreaViewController];
      [v84 setInterestAreaPathsForStorage:v78];

      [(GAXUIServer *)self setPassiveInterestAreaViewController:0];
      [(GAXUIServer *)self setActiveContentViewController:v83];
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);

      goto LABEL_56;
    case 9uLL:
      id v25 = [v10 objectForKey:@"previous server mode"];
      unsigned int v26 = [v25 unsignedIntegerValue];

      id v27 = [(GAXUIServer *)self activeContentViewController];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _AXAssert();
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v26) {
          uint64_t v28 = 3;
        }
        else {
          uint64_t v28 = 1;
        }
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_BE10;
        v114[3] = &unk_5CE38;
        id v115 = v12;
        [v27 transitionInWithContext:v28 completion:v114];
      }
      break;
    case 0xAuLL:
      id v29 = [v10 objectForKey:@"server mode for disabling telephony"];
      id v30 = [v29 unsignedIntegerValue];

      unsigned __int32 v31 = [v10 objectForKey:@"profile configuration"];
      unsigned int v32 = [v31 unsignedIntegerValue];

      [(GAXUIServer *)self _disableTelephonyIfNeededForMode:v30];
      [(GAXUIServer *)self setNumberOfBannerAlertsShownRecently:0];
      double v33 = [(GAXUIServer *)self activeContentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      unsigned int v94 = v32;
      id v95 = v11;
      v92 = v33;
      if (isKindOfClass)
      {
        id v35 = v33;
        uint64_t v36 = [v35 interestAreaViewController];
        unsigned int v37 = [v36 interestAreaPathsForStorage];
      }
      else
      {
        v54 = [v10 objectForKey:@"interest area paths for storage"];
        unsigned int v37 = [(GAXUIServer *)self _unarchivedPathMappingWithData:v54];

        id v35 = 0;
        uint64_t v36 = 0;
      }
      v55 = objc_opt_new();
      v56 = [(GAXUIServer *)self styleProvider];
      [v55 setStyleProvider:v56];

      [v55 setEditing:0];
      if (v36)
      {
        v57 = [v36 interestAreaView];
        [v57 contentsBounds];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        long long v66 = [v55 interestAreaView];
        objc_msgSend(v66, "setContentsBounds:", v59, v61, v63, v65);

        id v67 = [v36 interestAreaView];
        [v67 contentsCornerRadius];
        double v69 = v68;
        long long v70 = [v55 interestAreaView];
        [v70 setContentsCornerRadius:v69];
      }
      else
      {
        [(GAXUIServer *)self _adjustContentsGeometryOfInterestAreaViewWithController:v55];
      }
      [v55 setInterestAreaPathsForStorage:v37];
      unsigned int v85 = [(GAXUIServer *)self allowsTouch];
      unsigned int v86 = v85;
      if (v35) {
        uint64_t v87 = 0;
      }
      else {
        uint64_t v87 = v85;
      }
      [v55 setAllowsDimmingInterestAreaPaths:v87];
      [v55 setBackgroundShouldCoverEverything:v86 ^ 1];
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_BE28;
      v105[3] = &unk_5CE60;
      unsigned int v112 = v94;
      id v106 = v10;
      v107 = self;
      id v88 = v55;
      id v108 = v88;
      char v113 = isKindOfClass & 1;
      id v89 = v37;
      id v109 = v89;
      id v90 = v35;
      id v110 = v90;
      id v111 = v12;
      v91 = objc_retainBlock(v105);
      [(GAXUIServer *)self setPassiveInterestAreaViewController:v88];
      if (v35)
      {
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_C0FC;
        v103[3] = &unk_5CE38;
        v104 = v91;
        [v90 transitionOutWithContext:2 completion:v103];
      }
      else
      {
        [(GAXUIServer *)self setActiveContentViewController:0];
        ((void (*)(void *))v91[2])(v91);
      }

LABEL_56:
      id v11 = v95;
      break;
    case 0xBuLL:
      BOOL v38 = [(GAXUIServer *)self allowsTouch];
      v39 = [(GAXUIServer *)self passiveInterestAreaViewController];
      [v39 setAllowsDimmingInterestAreaPaths:v38];

      [(GAXUIServer *)self setActiveContentViewController:0];
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      break;
    case 0xCuLL:
      uint64_t v40 = [v10 objectForKey:@"session application identifiers"];
      if (v40)
      {
        uint64_t v41 = (void *)v40;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v41 = 0;
        }
        [(GAXUIServer *)self setSessionApplicationIdentifiers:v41];
      }
      v42 = [v10 objectForKey:@"should restore telephony"];
      unsigned int v43 = [v42 BOOLValue];

      if (v43) {
        [(GAXUIServer *)self _restoreTelephony];
      }
      BOOL v44 = [(GAXUIServer *)self activeContentViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v45 = v44;
      }
      else {
        id v45 = 0;
      }
      id v46 = v45;
      unsigned __int8 v47 = [v46 usesResumeNavigationTitles];
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_C10C;
      v98[3] = &unk_5CE88;
      id v48 = v46;
      id v99 = v48;
      v100 = self;
      unsigned __int8 v102 = v47;
      id v101 = v12;
      id v49 = objc_retainBlock(v98);
      [(GAXUIServer *)self _dismissPasscodeViewAnimated:1 withReason:5];
      if (v48)
      {
        v96[0] = _NSConcreteStackBlock;
        v96[1] = 3221225472;
        v96[2] = sub_C308;
        v96[3] = &unk_5CE38;
        v97 = v49;
        [v48 transitionOutWithContext:4 completion:v96];
      }
      else
      {
        [(GAXUIServer *)self setActiveContentViewController:0];
        ((void (*)(void *))v49[2])(v49);
      }

      goto LABEL_47;
    case 0xDuLL:
      BOOL v44 = [(GAXUIServer *)self activeContentViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v50 = v44;
      }
      else {
        v50 = 0;
      }
      unsigned int v51 = [v50 usesResumeNavigationTitles];
      [(GAXUIServer *)self setActiveContentViewController:0];
      [(GAXUIServer *)self _rotateDeviceToCurrentOrientation];
      if (v51)
      {
        v52 = GAXLocString(@"SESSION_ENDED");
        id v53 = [(GAXUIServer *)self _showAlertWithText:v52 subtitleText:0 iconImage:0 asBanner:0 isUrgent:0 duration:2.1];
      }
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
LABEL_47:

      break;
    default:
      if (a4 == 35)
      {
        int32x4_t v24 = [v10 objectForKey:@"application name"];
        [(GAXUIServer *)self _confirmUnmanagedASAMWithApplicationDisplayName:v24 completion:v12];
      }
      break;
  }
}

- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a3
{
  return (a3 < 0x24) & (0x800003F00uLL >> a3);
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.BackBoard";
}

- (void)processInitializationMessage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKey:@"gax backboard state"];
  memset(v11, 0, 28);
  [v5 getBytes:v11 length:28];
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C498;
  block[3] = &unk_5CDE8;
  void block[4] = self;
  v10[0] = v11[0];
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v11 + 12);
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, block);
  id v7 = [v4 objectForKey:@"session application identifiers"];

  id v8 = v7;
  AXPerformBlockOnMainThread();
}

- (void)serviceWasFullyInitialized
{
}

- (void)alertWithIdentifierDidAppear:(id)a3
{
  id v5 = a3;
  id v4 = [(GAXUIServer *)self identifiersOfBannerAlertsAboutToAppear];
  if ([v4 containsObject:v5])
  {
    [v4 removeObject:v5];
    if (![v4 count]) {
      [(GAXUIServer *)self setIdentifiersOfBannerAlertsAboutToAppear:0];
    }
    [(GAXUIServer *)self setNumberOfBannerAlertsShownRecently:(char *)[(GAXUIServer *)self numberOfBannerAlertsShownRecently] + 1];
  }
}

- (void)alertWithIdentifierDidDisappear:(id)a3
{
  id v11 = a3;
  id v4 = [(GAXUIServer *)self identifiersOfVisibleBannerAlerts];
  [v4 removeObject:v11];
  if (![v4 count]) {
    [(GAXUIServer *)self setIdentifiersOfVisibleBannerAlerts:0];
  }
  id v5 = [(GAXUIServer *)self identifierOfVisibleRegularAlert];
  unsigned int v6 = [v5 isEqualToString:v11];

  if (v6) {
    [(GAXUIServer *)self setIdentifierOfVisibleRegularAlert:0];
  }
  id v7 = [(GAXUIServer *)self incomingCallAlertIdentifier];
  unsigned int v8 = [v7 isEqualToString:v11];

  if (v8)
  {
    [(GAXUIServer *)self setIncomingCallAlertIdentifier:0];
    [(GAXUIServer *)self setIncomingCallType:0];
  }
  uint64_t v9 = [(GAXUIServer *)self lockoutAlertIdentifier];
  unsigned int v10 = [v9 isEqualToString:v11];

  if (v10) {
    [(GAXUIServer *)self setLockoutAlertIdentifier:0];
  }
}

- (double)desiredWindowLevelForAlertWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXUIServer *)self lockoutAlertIdentifier];
  unsigned int v6 = [v5 isEqualToString:v4];

  double result = 10000005.0;
  if (v6) {
    return 10000007.0;
  }
  return result;
}

- (id)styleProviderForAlertWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXUIServer *)self incomingCallAlertIdentifier];
  unsigned int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    id v7 = +[GAXUIIncomingCallAlertStyleProvider styleProviderWithIncomingCallType:[(GAXUIServer *)self incomingCallType]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(GAXUIServer *)self activeContentViewController];

  if (v6 == v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v9 = 10000006.0;
    }
    else {
      double v9 = 10000003.0;
    }
  }
  else
  {
    id v7 = [(GAXUIServer *)self overlayActiveContentViewController];
    BOOL v8 = v7 == v5;

    double v9 = dbl_457F0[v8];
  }

  return v9;
}

- (void)overlayUserInterfaceWasEntirelyRemovedFromViewController:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[AXUIDisplayManager sharedDisplayManager];
  if (v13 == v11 && [v10 isEqualToString:@"activeInterfaceOrientation"])
  {
    [(GAXUIServer *)self _notifyClientOfUpdatedActiveInterfaceOrientation];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)GAXUIServer;
    [(GAXUIServer *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)touchIDMonitorTimeDidExpire:(id)a3
{
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Touch ID monitor time did expire.", v5, 2u);
  }

  [(GAXUIServer *)self _showAlertWithType:1 AsBanner:1 isUrgent:0 timeRestrictionRemainingTime:0 remainingLockoutDuration:0 effectiveApplicationDisplayName:0.0];
}

- (void)touchIDManager:(id)a3 attemptWasSuccessful:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Touch ID monitor attempt was successful: %i.", buf, 8u);
  }

  id v7 = [(GAXUIServer *)self _clientMessenger];
  BOOL v8 = !v4;
  if (v4) {
    uint64_t v9 = 33;
  }
  else {
    uint64_t v9 = 34;
  }
  id v10 = &off_616A0;
  if (!v8) {
    id v10 = &off_61688;
  }
  CFStringRef v12 = @"passcode view dismissal reason";
  id v13 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v7 sendAsynchronousMessage:v11 withIdentifier:v9 targetAccessQueue:0 completion:0];
}

- (id)_debugGAXDescription
{
  id v3 = +[NSMutableString stringWithString:@"\n************************************\n"];
  objc_msgSend(v3, "appendFormat:", @"GAX UI Server: %p\n", self);
  *(_OWORD *)id v6 = *(_OWORD *)&self->_reflectedBackboardState.mode;
  *(_OWORD *)&v6[3] = *(_OWORD *)&self->_reflectedBackboardState.tripleClickSheetWindowContextID;
  BOOL v4 = gaxDebugDescriptionForGAXBackboardState(v6);
  [v3 appendString:v4];

  [v3 appendString:@"\n************************************\n"];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(GAXUIServer *)self _debugGAXDescription];
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (NSArray)sessionApplicationIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionApplicationIdentifiers:(id)a3
{
}

- (UIViewController)activeContentViewController
{
  return self->_activeContentViewController;
}

- (GAXOverlayUserInterfaceViewController)overlayActiveContentViewController
{
  return self->_overlayActiveContentViewController;
}

- (GAXInterestAreaViewController)passiveInterestAreaViewController
{
  return self->_passiveInterestAreaViewController;
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (unint64_t)numberOfBannerAlertsShownRecently
{
  return self->_numberOfBannerAlertsShownRecently;
}

- (void)setNumberOfBannerAlertsShownRecently:(unint64_t)a3
{
  self->_numberOfBannerAlertsShownRecentlCGFloat y = a3;
}

- (NSMutableSet)identifiersOfBannerAlertsAboutToAppear
{
  return self->_identifiersOfBannerAlertsAboutToAppear;
}

- (void)setIdentifiersOfBannerAlertsAboutToAppear:(id)a3
{
}

- (double)lastBannerAlertShownTimeInterval
{
  return self->_lastBannerAlertShownTimeInterval;
}

- (void)setLastBannerAlertShownTimeInterval:(double)a3
{
  self->_lastBannerAlertShownTimeInterval = a3;
}

- (NSMutableSet)identifiersOfVisibleBannerAlerts
{
  return self->_identifiersOfVisibleBannerAlerts;
}

- (void)setIdentifiersOfVisibleBannerAlerts:(id)a3
{
}

- (NSString)identifierOfVisibleRegularAlert
{
  return self->_identifierOfVisibleRegularAlert;
}

- (void)setIdentifierOfVisibleRegularAlert:(id)a3
{
}

- (NSString)deviceRestrictedAlertIdentifier
{
  return self->_deviceRestrictedAlertIdentifier;
}

- (void)setDeviceRestrictedAlertIdentifier:(id)a3
{
}

- (NSString)incomingCallAlertIdentifier
{
  return self->_incomingCallAlertIdentifier;
}

- (void)setIncomingCallAlertIdentifier:(id)a3
{
}

- (NSString)lockoutAlertIdentifier
{
  return self->_lockoutAlertIdentifier;
}

- (void)setLockoutAlertIdentifier:(id)a3
{
}

- (int)incomingCallType
{
  return self->_incomingCallType;
}

- (void)setIncomingCallType:(int)a3
{
  self->_incomingCallType = a3;
}

- (BOOL)shouldHideAllAlerts
{
  return self->_shouldHideAllAlerts;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (NSArray)appRestrictionIdentifiers
{
  return self->_appRestrictionIdentifiers;
}

- (NSDictionary)statesForAppRestrictions
{
  return self->_statesForAppRestrictions;
}

- (NSDictionary)textsForAppRestrictions
{
  return self->_textsForAppRestrictions;
}

- (NSDictionary)detailTextsForAppRestrictions
{
  return self->_detailTextsForAppRestrictions;
}

- (int64_t)lastPasscodeViewDismissalReason
{
  return self->_lastPasscodeViewDismissalReason;
}

- (void)setLastPasscodeViewDismissalReason:(int64_t)a3
{
  self->_lastPasscodeViewDismissalReason = a3;
}

- (AXUIPasscodeViewController)passcodeViewController
{
  return self->_passcodeViewController;
}

- (void)setPasscodeViewController:(id)a3
{
}

- (NSTimer)passcodeDismissalTimer
{
  return self->_passcodeDismissalTimer;
}

- (void)setPasscodeDismissalTimer:(id)a3
{
}

- (int64_t)appTimeRestrictionDurationInMinutes
{
  return self->_appTimeRestrictionDurationInMinutes;
}

- (void)setAppTimeRestrictionDurationInMinutes:(int64_t)a3
{
  self->_appTimeRestrictionDurationInMinutes = a3;
}

- (BOOL)appTimeRestrictionsEnabled
{
  return self->_appTimeRestrictionsEnabled;
}

- (void)setAppTimeRestrictionsEnabled:(BOOL)a3
{
  self->_appTimeRestrictionsEnabled = a3;
}

- (GAXTimeRestrictionLockoutViewController)timeRestrictionLockoutViewController
{
  return self->_timeRestrictionLockoutViewController;
}

- (void)setTimeRestrictionLockoutViewController:(id)a3
{
}

- (NSMutableDictionary)interestAreaPathsForStorageForRotatingView
{
  return self->_interestAreaPathsForStorageForRotatingView;
}

- (void)setInterestAreaPathsForStorageForRotatingView:(id)a3
{
}

- (AXIPCClient)springboardClient
{
  return self->_springboardClient;
}

- (void)setSpringboardClient:(id)a3
{
}

- (AXAccessQueue)springboardMessageQueue
{
  return self->_springboardMessageQueue;
}

- (void)setSpringboardMessageQueue:(id)a3
{
}

- (BOOL)isAXUIServerSceneReady
{
  return self->_isAXUIServerSceneReady;
}

- (void)setIsAXUIServerSceneReady:(BOOL)a3
{
  self->_isAXUIServerSceneReadCGFloat y = a3;
}

- (GAXTouchIDManager)touchIDManager
{
  return self->_touchIDManager;
}

- (void)setTouchIDManager:(id)a3
{
}

- (GAXUnmanagedASAMViewController)unmanagedASAMConfirmationViewController
{
  return self->_unmanagedASAMConfirmationViewController;
}

- (void)setUnmanagedASAMConfirmationViewController:(id)a3
{
}

- (OS_dispatch_queue)managedConfigurationQueue
{
  return self->_managedConfigurationQueue;
}

- (void)setManagedConfigurationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_unmanagedASAMConfirmationViewController, 0);
  objc_storeStrong((id *)&self->_touchIDManager, 0);
  objc_storeStrong((id *)&self->_springboardMessageQueue, 0);
  objc_storeStrong((id *)&self->_springboardClient, 0);
  objc_storeStrong((id *)&self->_interestAreaPathsForStorageForRotatingView, 0);
  objc_storeStrong((id *)&self->_timeRestrictionLockoutViewController, 0);
  objc_storeStrong((id *)&self->_passcodeDismissalTimer, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_detailTextsForAppRestrictions, 0);
  objc_storeStrong((id *)&self->_textsForAppRestrictions, 0);
  objc_storeStrong((id *)&self->_statesForAppRestrictions, 0);
  objc_storeStrong((id *)&self->_appRestrictionIdentifiers, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_lockoutAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingCallAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceRestrictedAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_identifierOfVisibleRegularAlert, 0);
  objc_storeStrong((id *)&self->_identifiersOfVisibleBannerAlerts, 0);
  objc_storeStrong((id *)&self->_identifiersOfBannerAlertsAboutToAppear, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_passiveInterestAreaViewController, 0);
  objc_storeStrong((id *)&self->_overlayActiveContentViewController, 0);
  objc_storeStrong((id *)&self->_activeContentViewController, 0);
  objc_storeStrong((id *)&self->_sessionApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);

  objc_storeStrong((id *)&self->_gaxStateAccessQueue, 0);
}

@end