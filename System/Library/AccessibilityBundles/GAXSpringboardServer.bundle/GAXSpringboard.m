@interface GAXSpringboard
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (AXAccessQueue)applicationLaunchingQueue;
- (AXAccessQueue)backboardMessageQueue;
- (AXAccessQueueTimer)didEndRequiringWallpaperCheckTimer;
- (AXIPCClient)backboardClient;
- (AXIPCServer)springboardServer;
- (BOOL)_applicationWithIdentifierIsWebApplicationAndForegroundRunning:(id)a3;
- (BOOL)_deviceHasBiometrics;
- (BOOL)_sendReplayableSimpleMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5 error:(id *)a6;
- (BOOL)allowsAutolock;
- (BOOL)allowsLockButton;
- (BOOL)allowsMotion;
- (BOOL)allowsTouch;
- (BOOL)isActive;
- (BOOL)isBundleIDAllowedApp:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isFrontmostAppLayout:(id)a3;
- (BOOL)isInWorkspace;
- (BOOL)isInactive;
- (BOOL)isOnlyGuidedAccessDisablingSystemGestures;
- (BOOL)isRequiringWallpaper;
- (BOOL)needsToUpdatePrefersMirroringForExternalDisplaysDefault;
- (BOOL)shouldAllowMedusaGestures;
- (BOOL)wantsAppSelfLockMode;
- (BOOL)wantsSingleAppMode;
- (BOOL)wantsSingleAppModeOrAppSelfLockMode;
- (BSInvalidatable)captureButtonSuppressionAssertion;
- (GAXSpringBoardOverrideHandler)springboardOverrideHandler;
- (GAXSpringboard)init;
- (NSArray)contextHostWrappers;
- (NSString)frontmostAppIdentifier;
- (SAInvalidatable)systemApertureInertAssertion;
- (SBUILockScreenDisableAssertion)lockScreenDisableAssertion;
- (UIWindow)hostedApplicationWindow;
- (id)_debugGAXDescription;
- (id)_gaxHandleFrontmostAppDidCheckIn:(id)a3;
- (id)_handleDisconnectAllCalls:(id)a3;
- (id)_handleEndRequiringWallpaper:(id)a3;
- (id)_handleGetDisplayNameForBundleID:(id)a3;
- (id)_handleGetNewPasscodeLength:(id)a3;
- (id)_handleIsSystemAppShowingTransientOverlay:(id)a3;
- (id)_handleIsWebApplicationAndForegroundRunning:(id)a3;
- (id)_handleLaunchApplication:(id)a3;
- (id)_handlePrepareTransitionToWorkspace:(id)a3;
- (id)_handlePreventPotentialAppLaunches:(id)a3;
- (id)_handleServerIsReady:(id)a3;
- (id)_handleServerModeTransitionDidComplete:(id)a3;
- (id)_handleStopHostingWorkspaceAppImmediately:(id)a3;
- (id)_handleTerminateApplications:(id)a3;
- (id)_handleTimeRestrictionStatusDidChange:(id)a3;
- (id)_handleUnlockDevice:(id)a3;
- (id)_handleUpdateGAXBackboardState:(id)a3;
- (id)_handleUpdateHostedApplicationState:(id)a3;
- (id)description;
- (unsigned)profileConfiguration;
- (void)_acquireCameraButtonAssertion;
- (void)_acquireLockScreenDisableAssertion;
- (void)_acquireSystemApertureInertAssertion;
- (void)_endHostingApplicationImmediately;
- (void)_extendAXSpringServerInstanceIfExists:(id)a3;
- (void)_handleAXSpringBoardServerDidInit:(id)a3;
- (void)_handleDeviceWasLockedNotification:(id)a3;
- (void)_handleDidShowTripleClickAlertNotification:(id)a3;
- (void)_invalidateCameraButtonAssertion;
- (void)_invalidateSystemApertureInertAssertion;
- (void)_prepareTransitionToWorkspaceWithCompletionHandler:(id)a3;
- (void)_releaseLockScreenDisableAssertion;
- (void)_sendMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5 replyHandler:(id)a6;
- (void)_sendSimpleMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5;
- (void)_updateSpringBoardForServerMode:(unsigned int)a3 previousServerMode:(unsigned int)a4;
- (void)_updateStateOfHostedApplicationWithIdentifier:(id)a3 scaleFactor:(double)a4 center:(CGPoint)a5 animationDuration:(double)a6;
- (void)dealloc;
- (void)deviceWasUnlocked;
- (void)notifyBackboardIsMakingEmergencyCall:(BOOL)a3;
- (void)notifyBackboardSBMiniAlertIsShowing:(BOOL)a3;
- (void)setApplicationLaunchingQueue:(id)a3;
- (void)setBackboardClient:(id)a3;
- (void)setBackboardMessageQueue:(id)a3;
- (void)setCaptureButtonSuppressionAssertion:(id)a3;
- (void)setContextHostWrappers:(id)a3;
- (void)setDidEndRequiringWallpaperCheckTimer:(id)a3;
- (void)setFrontmostAppIdentifier:(id)a3;
- (void)setHostedApplicationWindow:(id)a3;
- (void)setLockScreenDisableAssertion:(id)a3;
- (void)setNeedsToUpdatePrefersMirroringForExternalDisplaysDefault:(BOOL)a3;
- (void)setRequiringWallpaper:(BOOL)a3;
- (void)setSpringboardOverrideHandler:(id)a3;
- (void)setSpringboardServer:(id)a3;
- (void)setSystemApertureInertAssertion:(id)a3;
- (void)systemDidRestartDueToLowBattery;
@end

@implementation GAXSpringboard

+ (id)sharedInstanceIfExists
{
  return (id)qword_37A18;
}

+ (id)sharedInstance
{
  if (AXProcessIsSpringBoard())
  {
    if (qword_37A20 != -1) {
      dispatch_once(&qword_37A20, &stru_285B8);
    }
    id v2 = (id)qword_37A18;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (GAXSpringboard)init
{
  if ((AXProcessIsSpringBoard() & 1) == 0) {
    _AXAssert();
  }
  v21.receiver = self;
  v21.super_class = (Class)GAXSpringboard;
  v3 = [(GAXSpringboard *)&v21 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("GAXStateAccessQueue", 0);
    gaxStateAccessQueue = v3->_gaxStateAccessQueue;
    v3->_gaxStateAccessQueue = (OS_dispatch_queue *)v4;

    id v6 = +[AXSpringBoardServer server];
    v7 = objc_opt_new();
    [v7 setUp];
    [(GAXSpringboard *)v3 setSpringboardOverrideHandler:v7];
    uint64_t v8 = objc_opt_class();
    id v9 = [objc_alloc((Class)AXAccessQueue) initWithParentClass:v8 description:@"BackboardMessageQueue" appendUUIDToLabel:0];
    [(GAXSpringboard *)v3 setBackboardMessageQueue:v9];
    id v10 = [objc_alloc((Class)AXAccessQueue) initWithParentClass:v8 description:@"ApplicationLaunchingQueue" appendUUIDToLabel:0];
    [(GAXSpringboard *)v3 setApplicationLaunchingQueue:v10];
    id v11 = [objc_alloc((Class)AXIPCClient) initWithServiceName:@"com.apple.accessibility.gax.backboard"];
    [v11 setShouldRegisterCallbackSourceOnMainRunloop:1];
    [(GAXSpringboard *)v3 setBackboardClient:v11];
    id v12 = [objc_alloc((Class)AXIPCServer) initWithServiceName:@"com.apple.accessibility.gax.springboard" perPidService:0];
    [(GAXSpringboard *)v3 setSpringboardServer:v12];
    id v20 = 0;
    unsigned __int8 v13 = [v12 startServerWithError:&v20];
    id v14 = v20;
    if ((v13 & 1) == 0)
    {
      v15 = GAXLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_15844();
      }
    }
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v3 selector:"_handleDeviceWasLockedNotification:" name:@"SBLockScreenUIDidLockNotification" object:0];
    [v16 addObserver:v3 selector:"_handleDeviceWasLockedNotification:" name:@"SBLockScreenUIRelockedNotification" object:0];
    [v16 addObserver:v3 selector:"_handleDidShowTripleClickAlertNotification:" name:AXSBServerDidShowTripleClickNotification object:0];
    [v16 addObserver:v3 selector:"_handleAXSpringBoardServerDidInit:" name:AXSpringBoardServerInstanceDidInitializeNotification object:0];
    v17 = +[_AXSpringBoardServerInstance springBoardServerInstanceIfExists];
    [(GAXSpringboard *)v3 _extendAXSpringServerInstanceIfExists:v17];

    [(GAXSpringboard *)v3 setNeedsToUpdatePrefersMirroringForExternalDisplaysDefault:1];
    v18 = v3;
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"SBLockScreenUIDidLockNotification" object:0];

  dispatch_queue_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SBLockScreenUIRelockedNotification" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:AXSpringBoardServerInstanceDidInitializeNotification object:0];

  id v6 = [(GAXSpringboard *)self springboardServer];
  id v17 = 0;
  unsigned __int8 v7 = [v6 stopServerWithError:&v17];
  id v8 = v17;

  if ((v7 & 1) == 0)
  {
    id v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_15914();
    }
  }
  id v10 = [(GAXSpringboard *)self backboardClient];
  id v16 = v8;
  unsigned __int8 v11 = [v10 disconnectWithError:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    unsigned __int8 v13 = GAXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_158AC();
    }
  }
  -[GAXSpringboard _updateStateOfHostedApplicationWithIdentifier:scaleFactor:center:animationDuration:](self, "_updateStateOfHostedApplicationWithIdentifier:scaleFactor:center:animationDuration:", 0, 1.0, INFINITY, INFINITY, 0.0);
  id v14 = [(GAXSpringboard *)self springboardOverrideHandler];
  [v14 tearDown];

  v15.receiver = self;
  v15.super_class = (Class)GAXSpringboard;
  [(GAXSpringboard *)&v15 dealloc];
}

- (void)_handleAXSpringBoardServerDidInit:(id)a3
{
  id v4 = [a3 object];
  [(GAXSpringboard *)self _extendAXSpringServerInstanceIfExists:v4];
}

- (void)_extendAXSpringServerInstanceIfExists:(id)a3
{
  id v4 = a3;
  if (v4 && (byte_37A28 & 1) == 0)
  {
    id v5 = v4;
    [v4 registerHandlerForMessageKey:4800 target:self selector:"_gaxHandleFrontmostAppDidCheckIn:" entitlements:&off_2E380];
    [v5 registerHandlerForMessageKey:4801 target:self selector:"_handleServerModeTransitionDidComplete:" entitlements:&off_2E398];
    [v5 registerHandlerForMessageKey:4802 target:self selector:"_handleIsWebApplicationAndForegroundRunning:" entitlements:&off_2E3B0];
    [v5 registerHandlerForMessageKey:4809 target:self selector:"_handleIsSystemAppShowingTransientOverlay:" entitlements:&off_2E3C8];
    [v5 registerHandlerForMessageKey:4803 target:self selector:"_handlePrepareTransitionToWorkspace:" entitlements:&off_2E3E0];
    [v5 registerHandlerForMessageKey:4804 target:self selector:"_handleUpdateGAXBackboardState:" entitlements:&off_2E3F8];
    [v5 registerHandlerForMessageKey:4805 target:self selector:"_handleLaunchApplication:" entitlements:&off_2E410];
    [v5 registerHandlerForMessageKey:4806 target:self selector:"_handleEndRequiringWallpaper:" entitlements:&off_2E428];
    [v5 registerHandlerForMessageKey:4807 target:self selector:"_handleUpdateHostedApplicationState:" entitlements:&off_2E440];
    [v5 registerHandlerForMessageKey:4808 target:self selector:"_handleUnlockDevice:" entitlements:&off_2E458];
    [v5 registerHandlerForMessageKey:4810 target:self selector:"_handleGetNewPasscodeLength:" entitlements:&off_2E470];
    [v5 registerHandlerForMessageKey:4811 target:self selector:"_handleStopHostingWorkspaceAppImmediately:" entitlements:&off_2E488];
    [v5 registerHandlerForMessageKey:4812 target:self selector:"_handleTimeRestrictionStatusDidChange:" entitlements:&off_2E4A0];
    [v5 registerHandlerForMessageKey:4814 target:self selector:"_handleTerminateApplications:" entitlements:&off_2E4B8];
    [v5 registerHandlerForMessageKey:4815 target:self selector:"_handleDisconnectAllCalls:" entitlements:&off_2E4D0];
    [v5 registerHandlerForMessageKey:4816 target:self selector:"_handlePreventPotentialAppLaunches:" entitlements:&off_2E4E8];
    [v5 registerHandlerForMessageKey:4813 target:self selector:"_handleGetDisplayNameForBundleID:" entitlements:&off_2E500];
    [v5 registerHandlerForMessageKey:4817 target:self selector:"_handleServerIsReady:" entitlements:&off_2E518];
    id v4 = v5;
    byte_37A28 = 1;
  }
}

- (BOOL)isEnabled
{
  return _AXSGuidedAccessRequiresApplicationAccessibility() != 0;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2794;
  v5[3] = &unk_285E0;
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
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_285C;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInactive
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2924;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsTouch
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_29EC;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsLockButton
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2AB0;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsMotion
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2B74;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsAutolock
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2C38;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)profileConfiguration
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2CFC;
  v5[3] = &unk_285E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setRequiringWallpaper:(BOOL)a3
{
  if (self->_requiringWallpaper != a3)
  {
    BOOL v3 = a3;
    self->_requiringWallpaper = a3;
    id v4 = +[AXSpringBoardServer server];
    id v5 = v4;
    if (v3) {
      [v4 beginRequiringWallpaper];
    }
    else {
      [v4 gaxEndRequiringWallpaper];
    }
  }
}

- (void)_updateStateOfHostedApplicationWithIdentifier:(id)a3 scaleFactor:(double)a4 center:(CGPoint)a5 animationDuration:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  id v52 = a3;
  v53 = self;
  unsigned __int8 v11 = [(GAXSpringboard *)self hostedApplicationWindow];
  id v12 = +[UIScreen mainScreen];
  unsigned __int8 v13 = [v12 fixedCoordinateSpace];
  double v14 = fabs(a4 + -1.0);
  [v13 bounds];
  double v16 = v15;
  double v18 = v17;

  v19 = (int *)[UIApp activeInterfaceOrientation];
  double v20 = v16 - y;
  double v21 = v18 - y;
  if (v19 != (int *)((char *)&dword_0 + 2)) {
    double v21 = y;
  }
  if (v19 == (int *)((char *)&dword_0 + 3)) {
    double v21 = x;
  }
  else {
    double v20 = x;
  }
  if (v19 == &dword_4) {
    double v22 = v18 - x;
  }
  else {
    double v22 = v21;
  }
  if (v19 == &dword_4) {
    double v23 = y;
  }
  else {
    double v23 = v20;
  }
  if (v14 >= 2.22044605e-16 && v11 == 0)
  {
    v27 = +[AXSpringBoardServer server];
    v28 = [v27 _windowsToHost];

    v29 = [v28 firstObject];
    v51 = [v29 windowScene];

    id v57 = [objc_alloc((Class)UIWindow) initWithWindowScene:v51];
    [v57 setWindowLevel:10000004.0];
    v55 = +[NSMutableArray array];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v28;
    id v30 = [obj countByEnumeratingWithState:&v84 objects:v90 count:16];
    if (v30)
    {
      uint64_t v56 = *(void *)v85;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v85 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          uint64_t v78 = 0;
          v79 = &v78;
          uint64_t v80 = 0x3032000000;
          v81 = sub_34FC;
          v82 = sub_350C;
          id v83 = 0;
          v33 = +[NSString stringWithFormat:@"com.apple.GuidedAccess.Workspace.%p", v32];
          v70 = _NSConcreteStackBlock;
          uint64_t v71 = 3221225472;
          v72 = sub_3514;
          v73 = &unk_28648;
          v77 = &v78;
          uint64_t v74 = v32;
          id v34 = v57;
          id v75 = v34;
          id v35 = v33;
          id v76 = v35;
          AXPerformSafeBlock();
          if (v79[5])
          {
            objc_msgSend(v55, "addObject:");
            buf[0] = 0;
            objc_opt_class();
            v36 = [(id)v79[5] safeValueForKey:@"hostView"];
            v37 = __UIAccessibilityCastAsClass();

            if (buf[0]) {
              abort();
            }
            long long v38 = *(_OWORD *)&CGAffineTransformIdentity.c;
            v69[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
            v69[1] = v38;
            v69[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
            [v37 setTransform:v69];
            [v34 bounds];
            -[NSObject setFrame:](v37, "setFrame:");
            [v37 setAutoresizingMask:18];
            [v34 addSubview:v37];
          }
          else
          {
            v37 = GAXLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v89 = v32;
              _os_log_fault_impl(&dword_0, v37, OS_LOG_TYPE_FAULT, "Could not create a hosting wrapper for window: %@.", buf, 0xCu);
            }
          }

          _Block_object_dispose(&v78, 8);
        }
        id v30 = [obj countByEnumeratingWithState:&v84 objects:v90 count:16];
      }
      while (v30);
    }

    [v57 setHidden:0];
    [(GAXSpringboard *)v53 setContextHostWrappers:v55];
    [(GAXSpringboard *)v53 setHostedApplicationWindow:v57];

    v26 = &stru_28620;
    v25 = v57;
    if (!v57) {
      goto LABEL_37;
    }
    goto LABEL_32;
  }
  v25 = v11;
  if (v14 < 2.22044605e-16)
  {
    if (x == INFINITY && y == INFINITY)
    {
      [v11 bounds];
      CGFloat v40 = v91.origin.x;
      CGFloat v41 = v91.origin.y;
      CGFloat width = v91.size.width;
      CGFloat height = v91.size.height;
      double MidX = CGRectGetMidX(v91);
      v92.origin.double x = v40;
      v92.origin.double y = v41;
      v92.size.CGFloat width = width;
      v92.size.CGFloat height = height;
      objc_msgSend(v11, "convertPoint:toWindow:", 0, MidX, CGRectGetMidY(v92));
      double v23 = v45;
      double v22 = v46;
    }
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_35A0;
    v68[3] = &unk_28698;
    v68[4] = v53;
    v26 = objc_retainBlock(v68);
    a4 = 1.0;
    v25 = v11;
    if (!v11) {
      goto LABEL_37;
    }
LABEL_32:
    [v25 transform];
    double v39 = *(double *)&v65 + *(double *)&v66;
    goto LABEL_38;
  }
  v26 = &stru_28620;
  if (v11) {
    goto LABEL_32;
  }
LABEL_37:
  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  double v39 = 0.0;
LABEL_38:
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_3734;
  v60[3] = &unk_286C0;
  double v47 = a4 / fabs(v39);
  id v48 = v25;
  id v61 = v48;
  double v62 = v23;
  double v63 = v22;
  double v64 = v47;
  v49 = objc_retainBlock(v60);
  v50 = v49;
  if (fabs(a6) >= 2.22044605e-16)
  {
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_37C0;
    v58[3] = &unk_286E8;
    v59 = v49;
    +[UIView animateWithDuration:v58 animations:v26 completion:a6];
  }
  else
  {
    ((void (*)(void *))v49[2])(v49);
    v26->invoke(v26, 1);
  }
}

- (void)_endHostingApplicationImmediately
{
  uint64_t v3 = [(GAXSpringboard *)self contextHostWrappers];
  uint64_t v4 = [(GAXSpringboard *)self hostedApplicationWindow];
  if (v3 | v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (id)v3;
    uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      unsigned __int8 v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          AXPerformSafeBlock();
        }
        unsigned __int8 v7 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(id)v4 setHidden:1];
    [(GAXSpringboard *)self setHostedApplicationWindow:0];
    [(GAXSpringboard *)self setContextHostWrappers:0];
  }
}

- (void)notifyBackboardSBMiniAlertIsShowing:(BOOL)a3
{
  CFStringRef v6 = @"GAXIPCPayloadKeyOverrideAllTouchValue";
  uint64_t v4 = +[NSNumber numberWithBool:a3];
  unsigned __int8 v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(GAXSpringboard *)self _sendSimpleMessageToBackboardWithIdentifier:13014 payload:v5 description:@"SB Mini alert Showing"];
}

- (void)notifyBackboardIsMakingEmergencyCall:(BOOL)a3
{
  CFStringRef v6 = @"GAXIPCPayloadKeyOverrideAllTouchValue";
  uint64_t v4 = +[NSNumber numberWithBool:a3];
  unsigned __int8 v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(GAXSpringboard *)self _sendSimpleMessageToBackboardWithIdentifier:13015 payload:v5 description:@"Making emergency call"];
}

- (void)deviceWasUnlocked
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GAXDeviceWasUnlockedNotification" object:0];

  [(GAXSpringboard *)self _sendSimpleMessageToBackboardWithIdentifier:13002 payload:0 description:@"device was unlocked"];
}

- (void)systemDidRestartDueToLowBattery
{
}

- (BOOL)wantsSingleAppMode
{
  id v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isInSingleAppMode];

  return v3;
}

- (BOOL)wantsAppSelfLockMode
{
  id v2 = +[GAXSpringboard sharedInstance];
  BOOL v3 = [v2 profileConfiguration] == 3;

  return v3;
}

- (BOOL)wantsSingleAppModeOrAppSelfLockMode
{
  if ([(GAXSpringboard *)self wantsSingleAppMode]) {
    return 1;
  }

  return [(GAXSpringboard *)self wantsAppSelfLockMode];
}

- (BOOL)shouldAllowMedusaGestures
{
  if ([(GAXSpringboard *)self isActive] || [(GAXSpringboard *)self isInWorkspace]) {
    return 0;
  }
  else {
    return ![(GAXSpringboard *)self wantsSingleAppModeOrAppSelfLockMode];
  }
}

- (BOOL)isOnlyGuidedAccessDisablingSystemGestures
{
  id v2 = +[_AXSpringBoardServerInstance springBoardServerInstanceIfExists];
  unsigned __int8 v3 = [v2 onlySystemGesturesDisabledHolderIsGuidedAccess];

  return v3;
}

- (BOOL)isBundleIDAllowedApp:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = +[MCProfileConnection sharedConnection];
  id v5 = [v4 effectiveWhitelistedAppsAndOptions];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = kMCAppWhitelistIdentifierKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:v9];
        unsigned __int8 v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isFrontmostAppLayout:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v5 = a3;
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_prepareTransitionToWorkspaceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSpringBoardServer server];
  unsigned int v6 = [v5 isSystemAppFrontmost];

  if (!v6)
  {
    double v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_428C;
    v26 = &unk_28788;
    v27 = self;
    id v8 = v4;
    id v28 = v8;
    char v9 = objc_retainBlock(&v23);
    long long v10 = +[AXSpringBoardServer server];
    unsigned int v11 = [v10 isNotificationCenterVisible];

    unsigned __int8 v12 = +[AXSpringBoardServer server];
    BOOL v13 = v12;
    if (v11)
    {
      [v12 hideNotificationCenter];

      v14.n128_u64[0] = 0.5;
      ((void (*)(void ***, __n128))v9[2])(v9, v14);
    }
    else
    {
      unsigned int v15 = [v12 isAppSwitcherVisible];

      long long v16 = +[AXSpringBoardServer server];
      long long v17 = v16;
      if (v15)
      {
        [v16 dismissAppSwitcher];
      }
      else
      {
        unsigned int v19 = [v16 isSiriVisible];

        if (!v19)
        {
          double v21 = [(GAXSpringboard *)self didEndRequiringWallpaperCheckTimer];
          [v21 cancel];

          if (![(GAXSpringboard *)self isRequiringWallpaper])
          {
            [(GAXSpringboard *)self setRequiringWallpaper:1];
            double v22 = +[AXSpringBoardServer server];
            [v22 animateWallpaperStyleToNormal];
          }
          if (v8) {
            (*((void (**)(id, void))v8 + 2))(v8, 0);
          }
          goto LABEL_13;
        }
        double v20 = +[AXSpringBoardServer server];
        [v20 dismissSiri];
      }
      v18.n128_u64[0] = 0x3FC999999999999ALL;
      ((void (*)(void ***, __n128))v9[2])(v9, v18);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v4)
  {
    id v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Aborting transition because system app is frontmost.", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_14:
}

- (BOOL)_applicationWithIdentifierIsWebApplicationAndForegroundRunning:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSpringBoardServer server];
  id v5 = [v4 applicationWithIdentifier:v3];

  unsigned int v6 = [v5 safeValueForKey:@"isWebApplication"];
  LODWORD(v4) = [v6 BOOLValue];

  if (v4)
  {
    id v7 = +[AXSpringBoardServer server];
    id v8 = [v7 focusedAppProcess];

    unsigned __int8 v9 = [v5 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_acquireLockScreenDisableAssertion
{
}

- (void)_acquireSystemApertureInertAssertion
{
}

- (void)_invalidateSystemApertureInertAssertion
{
}

- (void)_acquireCameraButtonAssertion
{
}

- (void)_invalidateCameraButtonAssertion
{
}

- (void)_releaseLockScreenDisableAssertion
{
}

- (void)_updateSpringBoardForServerMode:(unsigned int)a3 previousServerMode:(unsigned int)a4
{
  id v7 = [(id)AXSafeClassFromString() safeValueForKeyPath:@"sharedInstance.mainDisplayWindowScene.floatingDockController"];
  BOOL v8 = a3 - 1 < 2 && a4 == 0;
  char v9 = v8;
  if (v8)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, kAXSGuidedAccessStartBlockingEventsInSpringBoard, 0, 0, 1u);
    [(GAXSpringboard *)self _acquireSystemApertureInertAssertion];
    [(GAXSpringboard *)self _acquireCameraButtonAssertion];
    BOOL v13 = 0;
    unsigned int v11 = v29;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    unsigned __int8 v12 = sub_4D38;
  }
  else
  {
    BOOL v13 = a4 == 2;
    char v14 = a3 == 0;
    if (a3 || a4 - 1 > 1) {
      goto LABEL_14;
    }
    unsigned int v15 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v15, kAXSGuidedAccessStopBlockingEventsInSpringBoard, 0, 0, 1u);
    [(GAXSpringboard *)self _invalidateSystemApertureInertAssertion];
    [(GAXSpringboard *)self _invalidateCameraButtonAssertion];
    unsigned int v11 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    unsigned __int8 v12 = sub_4D48;
  }
  char v14 = v9 ^ 1;
  v11[2] = v12;
  v11[3] = &unk_28670;
  v11[4] = v7;
  AXPerformSafeBlock();

LABEL_14:
  BOOL v16 = a3 != 2 && v13;
  BOOL v17 = a4 != 2 && a3 == 2;
  if (v17 || v16)
  {
    __n128 v18 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstanceIfExists"];
    id v19 = [v18 safeValueForKey:@"_rebuildAppListCache"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_4D58;
    v26[3] = &unk_287D0;
    unsigned int v27 = a3;
    [v18 _enumerateSwitcherControllersWithBlock:v26];
  }
  char v20 = v14 ^ 1;
  if (!a4) {
    char v20 = 0;
  }
  if ((v20 & 1) == 0)
  {
    double v21 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstanceIfExists"];
    id v22 = [v21 safeValueForKey:@"_rebuildAppListCache"];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_5098;
    v23[3] = &unk_28820;
    v23[4] = self;
    unsigned int v24 = a4;
    unsigned int v25 = a3;
    [v21 _enumerateSwitcherControllersWithBlock:v23];
  }
}

- (void)_handleDeviceWasLockedNotification:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"GAXDeviceWasLockedOrRelockedNotification" object:0];

  [(GAXSpringboard *)self _sendSimpleMessageToBackboardWithIdentifier:13007 payload:0 description:@"device was locked"];
}

- (void)_handleDidShowTripleClickAlertNotification:(id)a3
{
  id v4 = [a3 userInfo];
  [(GAXSpringboard *)self _sendSimpleMessageToBackboardWithIdentifier:13008 payload:v4 description:@"did show triple click alert"];
}

- (id)_gaxHandleFrontmostAppDidCheckIn:(id)a3
{
  id v5 = a3;
  id v3 = v5;
  AXPerformBlockOnMainThread();

  return 0;
}

- (id)_handleServerModeTransitionDidComplete:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  unsigned __int8 v10 = 0;
  id v5 = [v4 objectForKey:@"GAXIPCPayloadKeyShouldHaveLockScreenDisableAssertion"];
  unsigned __int8 v6 = [v5 BOOLValue];

  unsigned __int8 v10 = v6;
  id v8 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();

  _Block_object_dispose(v9, 8);
  return 0;
}

- (id)_handleIsWebApplicationAndForegroundRunning:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"GAXIPCPayloadKeyApplicationIdentifier"];

  if (v5) {
    BOOL v6 = [(GAXSpringboard *)self _applicationWithIdentifierIsWebApplicationAndForegroundRunning:v5];
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v12 = @"GAXIPCPayloadKeyIsWebApplicationAndForegroundRunning";
  id v8 = +[NSNumber numberWithBool:v6];
  BOOL v13 = v8;
  char v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = [v7 initWithKey:4802 payload:v9];

  return v10;
}

- (id)_handleIsSystemAppShowingTransientOverlay:(id)a3
{
  id v3 = [(id)AXSafeClassFromString() safeValueForKey:@"mainWorkspace"];
  id v4 = [v3 safeValueForKey:@"transientOverlayPresentationManager"];

  id v5 = [v4 safeBoolForKey:@"hasActivePresentation"];
  id v6 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v11 = @"result";
  id v7 = +[NSNumber numberWithBool:v5];
  CFStringRef v12 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [v6 initWithKey:4809 payload:v8];

  return v9;
}

- (id)_handlePrepareTransitionToWorkspace:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  unsigned int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[1] = _NSConcreteStackBlock;
  v21[2] = (id)3221225472;
  v21[3] = sub_62D4;
  v21[4] = &unk_28928;
  v21[5] = self;
  v21[6] = &v26;
  v21[7] = &v22;
  AXPerformBlockAsynchronouslyOnMainThread();
  while (!*((unsigned char *)v23 + 24))
  {
    id v5 = +[NSRunLoop currentRunLoop];
    id v6 = +[NSDate dateWithTimeIntervalSinceNow:0.05];
    [v5 runUntilDate:v6];
  }
  if (*((unsigned char *)v27 + 24))
  {
    id v7 = objc_alloc((Class)NSDictionary);
    id v8 = +[NSNumber numberWithBool:1];
    id v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, @"GAXIPCPayloadKeyShouldAbortServerModeTransition", 0);
  }
  else
  {
    id v10 = [v4 payload];
    CFStringRef v11 = [v10 objectForKey:@"GAXIPCPayloadKeyFrontmostAppIdentifier"];

    if (v11)
    {
      CFStringRef v12 = +[AXSpringBoardServer server];
      id v8 = [v12 appNameForDisplayID:v11];

      BOOL v13 = +[AXSpringBoardServer server];
      char v14 = [v13 appIconForBundleID:v11 format:1];

      if (v14)
      {
        v21[0] = 0;
        unsigned int v15 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:v21];
        id v16 = v21[0];
        if (v16)
        {
          BOOL v17 = GAXLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1597C();
          }
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
    }
    else
    {
      unsigned int v15 = 0;
      id v8 = 0;
    }
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = v18;
    if (v8) {
      [v18 setObject:v8 forKey:@"GAXIPCPayloadKeyFrontmostAppName"];
    }
    if (v15) {
      [v9 setObject:v15 forKey:@"GAXIPCPayloadKeyFrontmostArchivedAppIcon"];
    }
  }
  id v19 = [objc_alloc((Class)AXIPCMessage) initWithKey:4803 payload:v9];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v19;
}

- (id)_handleUpdateGAXBackboardState:(id)a3
{
  id v4 = a3;
  memset(v17, 0, 28);
  extractGAXBackboardStateFromMessage(v4, (uint64_t)v17);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x4010000000;
  CFStringRef v12 = &unk_25C0E;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  gaxStateAccessQueue = self->_gaxStateAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_647C;
  v7[3] = &unk_28870;
  v7[4] = self;
  v7[5] = &v9;
  v8[0] = v17[0];
  *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)v17 + 12);
  dispatch_sync((dispatch_queue_t)gaxStateAccessQueue, v7);
  [(GAXSpringboard *)self _updateSpringBoardForServerMode:LODWORD(v17[0]) previousServerMode:*((unsigned int *)v10 + 8)];
  _Block_object_dispose(&v9, 8);

  return 0;
}

- (id)_handleLaunchApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"GAXIPCPayloadKeyApplicationIdentifier"];

  id v7 = [v4 payload];
  id v8 = [v7 objectForKey:@"GAXIPCPayloadKeyProfileConfiguration"];

  uint64_t v9 = [v4 payload];

  id v10 = [v9 objectForKey:@"GAXIPCPayloadKeyAppLaunchGeneration"];

  uint64_t v11 = [(GAXSpringboard *)self applicationLaunchingQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6620;
  v16[3] = &unk_28AF0;
  id v17 = v6;
  id v18 = self;
  id v19 = v10;
  id v20 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v6;
  [v11 performAsynchronousWritingBlock:v16];

  return 0;
}

- (id)_handleEndRequiringWallpaper:(id)a3
{
  return 0;
}

- (id)_handleUpdateHostedApplicationState:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyAnimationDuration"];
  [v4 doubleValue];

  id v5 = [v3 objectForKey:@"GAXIPCPayloadKeyHostedApplicationScaleFactor"];
  [v5 doubleValue];

  id v6 = [v3 objectForKey:@"GAXIPCPayloadKeyHostedApplicationCenter"];
  CGPointFromString(v6);

  uint64_t v9 = [v3 objectForKey:@"GAXIPCPayloadKeyApplicationIdentifier"];
  id v7 = v9;
  AXPerformBlockOnMainThread();

  return 0;
}

- (id)_handleUnlockDevice:(id)a3
{
  return 0;
}

- (BOOL)_deviceHasBiometrics
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return _AXDeviceHasPearl();
}

- (id)_handleGetNewPasscodeLength:(id)a3
{
  int v14 = 0;
  id v4 = +[MCProfileConnection sharedConnection];
  unsigned int v5 = [v4 unlockScreenTypeWithOutSimplePasscodeType:&v14];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v14 == -1;
  }
  if (v6) {
    BOOL v7 = [(GAXSpringboard *)self _deviceHasBiometrics];
  }
  else {
    BOOL v7 = v14 == 1;
  }
  if (v7) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 4;
  }
  id v9 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v15 = @"GAXIPCPayloadKeyNewPasscodeLength";
  id v10 = +[NSNumber numberWithUnsignedInteger:v8];
  int v16 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v12 = [v9 initWithKey:4810 payload:v11];

  return v12;
}

- (id)_handleStopHostingWorkspaceAppImmediately:(id)a3
{
  return 0;
}

- (id)_handleTimeRestrictionStatusDidChange:(id)a3
{
  id v3 = +[AXSpringBoardServer server];
  [v3 updateLockAndIdleTimers];

  return 0;
}

- (id)_handleTerminateApplications:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  unsigned int v5 = [v4 objectForKeyedSubscript:@"GAXIPCPayloadKeyAppsNotToTerminate"];

  CGFloat v41 = v3;
  BOOL v6 = [v3 payload];
  BOOL v7 = [v6 objectForKeyedSubscript:@"GAXIPCPayloadKeyAppTerminationReason"];

  uint64_t v8 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  buf[0] = 0;
  objc_opt_class();
  CGFloat v40 = v8;
  id v9 = [v8 safeValueForKey:@"runningApplications"];
  id v10 = __UIAccessibilityCastAsClass();

  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v11)
  {
    id v12 = v11;
    CFStringRef v13 = @"SBApplication";
    uint64_t v14 = *(void *)v51;
    uint64_t v42 = *(void *)v51;
    do
    {
      CFStringRef v15 = 0;
      id v43 = v12;
      do
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(*((void *)&v50 + 1) + 8 * (void)v15);
        buf[0] = 0;
        uint64_t v17 = __UIAccessibilitySafeClass();
        if (buf[0]) {
          goto LABEL_34;
        }
        id v18 = (void *)v17;

        buf[0] = 0;
        objc_opt_class();
        id v19 = [v18 safeValueForKey:@"bundleIdentifier"];
        id v20 = __UIAccessibilityCastAsClass();

        if (buf[0]) {
LABEL_34:
        }
          abort();
        if (([v5 containsObject:v20] & 1) == 0)
        {
          CFStringRef v21 = v13;
          uint64_t v22 = v5;
          double v23 = GAXLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = v20;
            __int16 v57 = 2112;
            v58 = v7;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Terminating %@ because %@", buf, 0x16u);
          }

          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v24 = +[FBProcessManager sharedInstance];
          char v25 = [v24 applicationProcessesForBundleIdentifier:v20];

          id v26 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v47;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v47 != v28) {
                  objc_enumerationMutation(v25);
                }
                [*(id *)(*((void *)&v46 + 1) + 8 * i) killForReason:5 andReport:0 withDescription:v7];
              }
              id v27 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
            }
            while (v27);
          }

          unsigned int v5 = v22;
          CFStringRef v13 = v21;
          uint64_t v14 = v42;
          id v12 = v43;
        }

        CFStringRef v15 = (char *)v15 + 1;
      }
      while (v15 != v12);
      id v12 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v12);
  }

  if (([v5 containsObject:@"com.apple.shortcuts"] & 1) == 0)
  {
    id v30 = objc_alloc((Class)RBSTerminateRequest);
    v31 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.WorkflowKit.BackgroundShortcutRunner"];
    id v32 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:v7];
    id v33 = [v30 initWithPredicate:v31 context:v32];

    id v45 = 0;
    LODWORD(v32) = [v33 execute:&v45];
    id v34 = v45;
    id v35 = v34;
    if (v32)
    {
      v36 = GAXLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v56 = v7;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Terminated BackgroundShortcutRunner for reason \"%@\"", buf, 0xCu);
      }
    }
    else
    {
      v37 = [v34 domain];
      if ([v37 isEqualToString:RBSRequestErrorDomain])
      {
        long long v38 = (char *)[v35 code];

        if (v38 == (unsigned char *)&dword_0 + 3) {
          goto LABEL_32;
        }
      }
      else
      {
      }
      v36 = GAXLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_15A90();
      }
    }

LABEL_32:
  }

  return 0;
}

- (id)_handleDisconnectAllCalls:(id)a3
{
  return 0;
}

- (id)_handlePreventPotentialAppLaunches:(id)a3
{
  return 0;
}

- (id)_handleGetDisplayNameForBundleID:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:@"GAXIPCPayloadKeyBundleIdentifier"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _AXAssert();
  }
  unsigned int v5 = +[AXSpringBoardServer server];
  BOOL v6 = [v5 appNameForDisplayID:v4];

  id v7 = objc_alloc((Class)AXIPCMessage);
  uint64_t v8 = v7;
  if (v6)
  {
    CFStringRef v12 = @"result";
    CFStringRef v13 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = [v8 initWithKey:4813 payload:v9];
  }
  else
  {
    id v10 = [v7 initWithKey:4813 payload:0];
  }

  return v10;
}

- (id)_handleServerIsReady:(id)a3
{
  id v3 = [objc_alloc((Class)AXIPCMessage) initWithKey:4817 payload:&off_2E530];

  return v3;
}

- (BOOL)_sendReplayableSimpleMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_34FC;
  char v29 = sub_350C;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  CFStringRef v12 = [(GAXSpringboard *)self backboardMessageQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8868;
  v16[3] = &unk_28BE0;
  void v16[4] = self;
  int v20 = a3;
  id v13 = v10;
  id v17 = v13;
  id v18 = &v21;
  id v19 = &v25;
  [v12 performSynchronousWritingBlock:v16];

  if (a6) {
    *a6 = (id) v26[5];
  }
  char v14 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)_sendSimpleMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5
{
}

- (void)_sendMessageToBackboardWithIdentifier:(int)a3 payload:(id)a4 description:(id)a5 replyHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_8A98;
  v24[3] = &unk_28C08;
  id v25 = v11;
  id v13 = v11;
  char v14 = objc_retainBlock(v24);
  CFStringRef v15 = [(GAXSpringboard *)self backboardMessageQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_8AFC;
  v19[3] = &unk_28C58;
  int v23 = a3;
  v19[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v10;
  [v15 performAsynchronousWritingBlock:v19];
}

- (id)_debugGAXDescription
{
  id v3 = +[NSMutableString stringWithString:@"\n************************************\n"];
  objc_msgSend(v3, "appendFormat:", @"GAX Springboard: %p\n", self);
  *(_OWORD *)BOOL v6 = *(_OWORD *)&self->_reflectedBackboardState.mode;
  *(_OWORD *)&v6[3] = *(_OWORD *)&self->_reflectedBackboardState.tripleClickSheetWindowContextID;
  id v4 = gaxDebugDescriptionForGAXBackboardState(v6);
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @"Wants Single App Mode:%ld\n", -[GAXSpringboard wantsSingleAppMode](self, "wantsSingleAppMode"));
  objc_msgSend(v3, "appendFormat:", @"Wants App Self-lock Mode:%ld\n", -[GAXSpringboard wantsAppSelfLockMode](self, "wantsAppSelfLockMode"));
  [v3 appendString:@"\n************************************\n"];

  return v3;
}

- (id)description
{
  return [(GAXSpringboard *)self _debugGAXDescription];
}

- (BOOL)isRequiringWallpaper
{
  return self->_requiringWallpaper;
}

- (AXAccessQueueTimer)didEndRequiringWallpaperCheckTimer
{
  return self->_didEndRequiringWallpaperCheckTimer;
}

- (void)setDidEndRequiringWallpaperCheckTimer:(id)a3
{
}

- (NSArray)contextHostWrappers
{
  return self->_contextHostWrappers;
}

- (void)setContextHostWrappers:(id)a3
{
}

- (UIWindow)hostedApplicationWindow
{
  return self->_hostedApplicationWindow;
}

- (void)setHostedApplicationWindow:(id)a3
{
}

- (NSString)frontmostAppIdentifier
{
  return self->_frontmostAppIdentifier;
}

- (void)setFrontmostAppIdentifier:(id)a3
{
}

- (AXIPCServer)springboardServer
{
  return self->_springboardServer;
}

- (void)setSpringboardServer:(id)a3
{
}

- (AXIPCClient)backboardClient
{
  return self->_backboardClient;
}

- (void)setBackboardClient:(id)a3
{
}

- (AXAccessQueue)backboardMessageQueue
{
  return self->_backboardMessageQueue;
}

- (void)setBackboardMessageQueue:(id)a3
{
}

- (GAXSpringBoardOverrideHandler)springboardOverrideHandler
{
  return self->_springboardOverrideHandler;
}

- (void)setSpringboardOverrideHandler:(id)a3
{
}

- (AXAccessQueue)applicationLaunchingQueue
{
  return self->_applicationLaunchingQueue;
}

- (void)setApplicationLaunchingQueue:(id)a3
{
}

- (SBUILockScreenDisableAssertion)lockScreenDisableAssertion
{
  return self->_lockScreenDisableAssertion;
}

- (void)setLockScreenDisableAssertion:(id)a3
{
}

- (SAInvalidatable)systemApertureInertAssertion
{
  return self->_systemApertureInertAssertion;
}

- (void)setSystemApertureInertAssertion:(id)a3
{
}

- (BSInvalidatable)captureButtonSuppressionAssertion
{
  return self->_captureButtonSuppressionAssertion;
}

- (void)setCaptureButtonSuppressionAssertion:(id)a3
{
}

- (BOOL)needsToUpdatePrefersMirroringForExternalDisplaysDefault
{
  return self->_needsToUpdatePrefersMirroringForExternalDisplaysDefault;
}

- (void)setNeedsToUpdatePrefersMirroringForExternalDisplaysDefault:(BOOL)a3
{
  self->_needsToUpdatePrefersMirroringForExternalDisplaysDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureInertAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenDisableAssertion, 0);
  objc_storeStrong((id *)&self->_applicationLaunchingQueue, 0);
  objc_storeStrong((id *)&self->_springboardOverrideHandler, 0);
  objc_storeStrong((id *)&self->_backboardMessageQueue, 0);
  objc_storeStrong((id *)&self->_backboardClient, 0);
  objc_storeStrong((id *)&self->_springboardServer, 0);
  objc_storeStrong((id *)&self->_frontmostAppIdentifier, 0);
  objc_storeStrong((id *)&self->_hostedApplicationWindow, 0);
  objc_storeStrong((id *)&self->_contextHostWrappers, 0);
  objc_storeStrong((id *)&self->_didEndRequiringWallpaperCheckTimer, 0);

  objc_storeStrong((id *)&self->_gaxStateAccessQueue, 0);
}

@end