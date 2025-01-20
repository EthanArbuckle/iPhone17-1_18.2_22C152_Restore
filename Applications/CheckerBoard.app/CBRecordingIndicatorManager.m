@interface CBRecordingIndicatorManager
+ (BOOL)_supportsSecureIndicator;
- (BOOL)_supportsStatusBarItem;
- (BOOL)isIndicatorVisible;
- (BOOL)isIndicatorVisibleAtStatusBarLocation;
- (BOOL)isSystemApertureEmpty;
- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
- (CBRecordingIndicatorManager)initWithWindowScene:(id)a3;
- (NSSet)activeCameraAndMicrophoneActivityAttributions;
- (UIWindowScene)windowScene;
- (id)_indicatorIdentifierForSensorType:(int64_t)a3;
- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3;
- (unint64_t)displayMode;
- (void)_createRecordingIndicatorForStandaloneLocation;
- (void)_createRecordingIndicatorForStatusBarLocation;
- (void)_createRecordingIndicatorForSystemApertureLocation;
- (void)_dataProviderDidUpdate:(id)a3;
- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4;
- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3;
- (void)_updateIndicatorViewForSensorType:(int64_t)a3;
- (void)_updateRecordingIndicatorForStatusBarChanges;
- (void)_updateRecordingIndicatorLocationIfNecessary;
- (void)_updateSystemApertureElementAssertion;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4;
- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3;
- (void)setIndicatorVisible:(BOOL)a3;
- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3;
- (void)setSystemApertureEmpty:(BOOL)a3;
- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateRecordingIndicatorLocationIfNecessary;
@end

@implementation CBRecordingIndicatorManager

- (CBRecordingIndicatorManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBRecordingIndicatorManager;
  v5 = [(CBRecordingIndicatorManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    v7 = +[UIDevice currentDevice];
    id v8 = [v7 userInterfaceIdiom];

    v9 = +[BSPlatform sharedInstance];
    id v10 = [v9 homeButtonType];

    unsigned int v11 = [(id)objc_opt_class() _supportsSecureIndicator];
    BOOL v12 = v10 != (id)2 || v8 == (id)1;
    uint64_t v13 = 2;
    if (!v12) {
      uint64_t v13 = 0;
    }
    if (v11) {
      uint64_t v13 = 1;
    }
    v6->_displayMode = v13;
    if (v13 == 2)
    {
      [(CBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
      [(CBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStatusBarLocation];
    }
    else
    {
      [(CBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
    }
    v14 = +[UIApplication sharedApplication];
    v15 = [v14 delegate];

    v16 = [v15 sensorActivityDataProvider];
    [v16 addObserver:v6];
    [(CBRecordingIndicatorManager *)v6 activityDidChangeForSensorActivityDataProvider:v16];
  }
  return v6;
}

- (void)_createRecordingIndicatorForStandaloneLocation
{
  id v7 = [(CBRecordingIndicatorManager *)self windowScene];
  v3 = [[CBRecordingIndicatorWindow alloc] initWithWindowScene:v7 debugName:@"Recording Indicator"];
  id v4 = [[CBRecordingIndicatorViewController alloc] initForLocation:0];
  recordingIndicatorViewController = self->_recordingIndicatorViewController;
  self->_recordingIndicatorViewController = v4;

  [(CBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewController];
  [(CBRecordingIndicatorWindow *)v3 setWindowLevel:UIScreenshotServicesWindowLevel + 10.0];
  [(CBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(CBRecordingIndicatorWindow *)v3 setHidden:0];
  recordingIndicatorWindow = self->_recordingIndicatorWindow;
  self->_recordingIndicatorWindow = &v3->super.super.super;
}

- (void)_createRecordingIndicatorForStatusBarLocation
{
  id v11 = [(CBRecordingIndicatorManager *)self windowScene];
  v3 = [[CBRecordingIndicatorWindow alloc] initWithWindowScene:v11 debugName:@"Recording Indicator (UIKit Status Bar Portal)"];
  id v4 = [[CBRecordingIndicatorViewController alloc] initForLocation:1];
  recordingIndicatorViewControllerUIKitStatusBarPortal = self->_recordingIndicatorViewControllerUIKitStatusBarPortal;
  self->_recordingIndicatorViewControllerUIKitStatusBarPortal = v4;

  [(CBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewControllerUIKitStatusBarPortal];
  [(CBRecordingIndicatorWindow *)v3 setWindowLevel:UIWindowLevelNormal + -1.0];
  [(CBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(CBRecordingIndicatorWindow *)v3 setHidden:0];
  recordingIndicatorWindowUIKitStatusBarPortal = self->_recordingIndicatorWindowUIKitStatusBarPortal;
  self->_recordingIndicatorWindowUIKitStatusBarPortal = &v3->super.super.super;
  id v7 = v3;

  id v8 = objc_opt_class();
  v9 = [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerUIKitStatusBarPortal indicatorView];

  id v10 = [v11 screen];
  [v8 registerSensorActivityIndicator:v9 forScreen:v10];
}

- (void)_createRecordingIndicatorForSystemApertureLocation
{
  id v10 = [(CBRecordingIndicatorManager *)self windowScene];
  v3 = [[CBRecordingIndicatorWindow alloc] initWithWindowScene:v10 debugName:@"Recording Indicator (SystemAperture Portal)"];
  id v4 = [[CBRecordingIndicatorViewController alloc] initForLocation:2];
  recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
  self->_recordingIndicatorViewControllerSystemAperturePortal = v4;

  [(CBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewControllerSystemAperturePortal];
  [(CBRecordingIndicatorWindow *)v3 setWindowLevel:UIScreenshotServicesWindowLevel + 5.0];
  [(CBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(CBRecordingIndicatorWindow *)v3 setHidden:0];
  recordingIndicatorWindowSystemAperturePortal = self->_recordingIndicatorWindowSystemAperturePortal;
  self->_recordingIndicatorWindowSystemAperturePortal = &v3->super.super.super;
  id v7 = v3;

  id v8 = [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal indicatorContainerView];
  id v9 = [objc_alloc((Class)_UIPortalView) initWithSourceView:v8];
  [v9 setMatchesAlpha:1];
  [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal setDelegate:self];
}

- (void)updateRecordingIndicatorLocationIfNecessary
{
}

- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3
{
  if (a3 != 1) {
    return 0;
  }
  if (UIAccessibilityShouldDifferentiateWithoutColor()) {
    return 2;
  }
  return 1;
}

- (id)_indicatorIdentifierForSensorType:(int64_t)a3
{
  if (a3 == 1) {
    return @"microphone-recording-indicator";
  }
  else {
    return @"camera-recording-indicator";
  }
}

- (void)_dataProviderDidUpdate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_dataProvider, a3);
  if (self->_visibilityIsForcedByPrototypeSettings)
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Visibility is forced by prototype settings", buf, 2u);
    }
    goto LABEL_19;
  }
  v6 = [v5 activeCameraAndMicrophoneActivityAttributions];
  if ([v6 count])
  {
    [(CBRecordingIndicatorManager *)self _updateIndicatorStyleForSensorActivityAttributions:v6];
    id v7 = self;
    uint64_t v8 = 1;
LABEL_6:
    [(CBRecordingIndicatorManager *)v7 setIndicatorVisible:v8];
    goto LABEL_17;
  }
  if ([(CBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    id v9 = +[NSDate date];
    [v9 timeIntervalSinceDate:self->_indicatorDisplayTime];
    double v11 = v10;

    if (v11 <= 2.0)
    {
      unsigned int v12 = [(NSTimer *)self->_minimumTimeOnScreenTimer isValid];
      uint64_t v13 = CheckerBoardLogHandleForCategory();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Timer is already valid", buf, 2u);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 134349312;
          uint64_t v24 = 0x4000000000000000;
          __int16 v25 = 2050;
          double v26 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Starting a timer to keep the indicator on screen for a minimum of %{public}.2f seconds (elapsed %{public}.2fs)", buf, 0x16u);
        }

        v17 = _NSConcreteStackBlock;
        uint64_t v18 = 3221225472;
        v19 = sub_1000220E0;
        v20 = &unk_100079EE0;
        v21 = self;
        id v22 = v5;
        v15 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v17 block:2.0 - v11];
        minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
        self->_minimumTimeOnScreenTimer = v15;
      }
      goto LABEL_17;
    }
    id v7 = self;
    uint64_t v8 = 0;
    goto LABEL_6;
  }
LABEL_17:
  if ([(CBRecordingIndicatorManager *)self _supportsStatusBarItem]) {
    [(CBRecordingIndicatorManager *)self _updateRecordingIndicatorForStatusBarChanges];
  }
LABEL_19:
}

- (BOOL)_supportsStatusBarItem
{
  return (([(CBRecordingIndicatorManager *)self displayMode] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setIndicatorVisible:(BOOL)a3
{
  if (self->_indicatorVisible != a3)
  {
    BOOL v3 = a3;
    self->_indicatorVisible = a3;
    id v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"off";
      if (v3) {
        CFStringRef v6 = @"on";
      }
      int v14 = 138543362;
      CFStringRef v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@...", (uint8_t *)&v14, 0xCu);
    }

    [(NSTimer *)self->_minimumTimeOnScreenTimer invalidate];
    minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
    self->_minimumTimeOnScreenTimer = 0;

    if (v3)
    {
      uint64_t v8 = +[NSDate date];
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = v8;
    }
    else
    {
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = 0;
    }

    unint64_t v10 = [(CBRecordingIndicatorManager *)self displayMode];
    if (v10 < 2)
    {
      double v11 = self;
      BOOL v12 = v3;
      uint64_t v13 = 0;
LABEL_15:
      [(CBRecordingIndicatorManager *)v11 _setIndicatorVisible:v12 atLocation:v13];
      return;
    }
    if (v10 - 3 < 2)
    {
      [(CBRecordingIndicatorManager *)self _updateSystemApertureElementAssertion];
      return;
    }
    if (v10 == 2)
    {
      [(CBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:0];
      double v11 = self;
      BOOL v12 = v3;
      uint64_t v13 = 1;
      goto LABEL_15;
    }
  }
}

- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3
{
  if (self->_indicatorVisibleAtStatusBarLocation != a3)
  {
    BOOL v3 = a3;
    self->_indicatorVisibleAtStatusBarLocation = a3;
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"off";
      if (v3) {
        CFStringRef v5 = @"on";
      }
      int v7 = 138543362;
      CFStringRef v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at Status Bar location (via status bar data change)", (uint8_t *)&v7, 0xCu);
    }

    CFStringRef v6 = +[CBStatusBarStateAggregator sharedInstance];
    [v6 updateStatusBarItem:28];
  }
}

- (void)_updateRecordingIndicatorLocationIfNecessary
{
  BOOL v3 = [(CBRecordingIndicatorManager *)self isIndicatorVisible];
  if (!v3 || (char *)[(CBRecordingIndicatorManager *)self displayMode] - 3 <= (char *)1)
  {
    [(CBRecordingIndicatorManager *)self _setIndicatorVisible:v3 atLocation:0];
    [(CBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:1];
    [(CBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:2];
  }
}

+ (BOOL)_supportsSecureIndicator
{
  if (qword_10008FE48 != -1) {
    dispatch_once(&qword_10008FE48, &stru_100079F00);
  }
  return byte_10008FE50;
}

- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4
{
  BOOL v4 = a3;
  if (a4 == 2)
  {
    unint64_t v8 = [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal indicatorState];
    if (v4)
    {
      if (v8 - 1 < 2) {
        return;
      }
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
      goto LABEL_10;
    }
    if (v8) {
      BOOL v11 = v8 == 3;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
      goto LABEL_24;
    }
  }
  else
  {
    if (a4 != 1)
    {
      if (a4) {
        return;
      }
      unint64_t v6 = [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewController indicatorState];
      if (v4)
      {
        if (v6 - 1 < 2) {
          return;
        }
        recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewController;
LABEL_10:
        uint64_t v9 = 1;
LABEL_25:
        [(CBRecordingIndicatorViewController *)recordingIndicatorViewControllerSystemAperturePortal updateIndicatorVisibility:v9];
        return;
      }
      if (!v6 || v6 == 3) {
        return;
      }
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewController;
LABEL_24:
      uint64_t v9 = 0;
      goto LABEL_25;
    }
    BOOL v10 = a3;
    [(CBRecordingIndicatorManager *)self setIndicatorVisibleAtStatusBarLocation:v10];
  }
}

- (void)_updateRecordingIndicatorForStatusBarChanges
{
  unint64_t v3 = [(CBRecordingIndicatorManager *)self displayMode];
  if (v3 == 4)
  {
    [(CBRecordingIndicatorManager *)self _updateRecordingIndicatorLocationIfNecessary];
  }
  else if (v3 == 2 && [(CBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
    if (self->_indicatorStatusBarPartIsHidden)
    {
      if ((id)[(CBRecordingIndicatorViewController *)recordingIndicatorViewController indicatorState] == (id)1) {
        return;
      }
      [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:1];
      CFStringRef v5 = self;
      uint64_t v6 = 0;
    }
    else
    {
      [(CBRecordingIndicatorViewController *)recordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:0];
      CFStringRef v5 = self;
      uint64_t v6 = 1;
    }
    [(CBRecordingIndicatorManager *)v5 _setIndicatorVisible:v6 atLocation:1];
  }
}

- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "sensor", (void)v10))
          {
            [(CBRecordingIndicatorManager *)self _updateIndicatorViewForSensorType:0];

            goto LABEL_12;
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [(CBRecordingIndicatorManager *)self _updateIndicatorViewForSensorType:1];
  }
LABEL_12:
}

- (void)_updateIndicatorViewForSensorType:(int64_t)a3
{
  unint64_t v5 = -[CBRecordingIndicatorManager _indicatorTypeForSensorType:](self, "_indicatorTypeForSensorType:");
  [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewController updateIndicatorType:v5];
  [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerUIKitStatusBarPortal updateIndicatorType:v5];
  [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal updateIndicatorType:v5];
  id v7 = [(CBRecordingIndicatorManager *)self _indicatorIdentifierForSensorType:a3];
  id v6 = [(CBRecordingIndicatorViewController *)self->_recordingIndicatorViewController indicatorView];
  [v6 setAccessibilityIdentifier:v7];
}

- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4
{
  unint64_t v5 = (CBRecordingIndicatorViewController *)a3;
  long long v12 = v5;
  if (self->_recordingIndicatorViewControllerSystemAperturePortal == v5)
  {
    [(CBRecordingIndicatorManager *)self _updateSystemApertureElementAssertion];
    unint64_t v5 = v12;
  }
  id v6 = [(CBRecordingIndicatorViewController *)v5 viewIfLoaded];
  id v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];

  uint64_t v9 = [v8 traitCollection];
  id v10 = [v9 _backlightLuminance];

  if (v10 == (id)1)
  {
    long long v11 = [v8 _backlightSceneEnvironment];
    [v11 invalidateAllTimelinesForReason:@"recording indicator visibility change"];
  }
}

- (void)_updateSystemApertureElementAssertion
{
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 activeCameraAndMicrophoneActivityAttributions];
  if (![(NSSet *)self->_activeCameraAndMicrophoneActivityAttributions isEqualToSet:v5])
  {
    objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, v5);
    id v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Active camera/microphone activity changed:\n%{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(CBRecordingIndicatorManager *)self _dataProviderDidUpdate:v4];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  unint64_t v5 = +[CBRecordingIndicatorDomain rootSettings];
  id v6 = [v5 sensorType];

  if (v6 == (id)1)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    [(CBRecordingIndicatorManager *)self setIndicatorVisible:1];
    int v7 = self;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (v6 == (id)2)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    [(CBRecordingIndicatorManager *)self setIndicatorVisible:1];
    int v7 = self;
    uint64_t v8 = 1;
LABEL_5:
    [(CBRecordingIndicatorManager *)v7 _updateIndicatorViewForSensorType:v8];
    return;
  }
  self->_visibilityIsForcedByPrototypeSettings = 0;

  [(CBRecordingIndicatorManager *)self setIndicatorVisible:0];
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (BOOL)isIndicatorVisibleAtStatusBarLocation
{
  return self->_indicatorVisibleAtStatusBarLocation;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  return self->_activeCameraAndMicrophoneActivityAttributions;
}

- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3
{
}

- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden
{
  return self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
}

- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3
{
  self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden = a3;
}

- (BOOL)isSystemApertureEmpty
{
  return self->_systemApertureEmpty;
}

- (void)setSystemApertureEmpty:(BOOL)a3
{
  self->_systemApertureEmpty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_minimumTimeOnScreenTimer, 0);
  objc_storeStrong((id *)&self->_indicatorDisplayTime, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, 0);

  objc_storeStrong((id *)&self->_recordingIndicatorWindow, 0);
}

@end