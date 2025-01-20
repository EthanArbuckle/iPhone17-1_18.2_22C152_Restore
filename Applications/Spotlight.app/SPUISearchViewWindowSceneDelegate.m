@interface SPUISearchViewWindowSceneDelegate
+ (id)restorationData;
+ (id)restorationDataQueue;
+ (id)restorationUrl;
+ (void)postMemoryWarningAndPerformBlockIfOverInactiveLimit:(id)a3;
+ (void)saveRestorationData:(id)a3;
- (SPUISearchViewController)searchViewController;
- (SPUIUnifiedFieldViewController)unifiedFieldViewController;
- (UINavigationController)navController;
- (UIWindow)searchViewWindow;
- (double)currentRevealProgress;
- (unint64_t)currentIntent;
- (unint64_t)currentPresentationSource;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)backgroundSearchScene;
- (void)dismissSearchView;
- (void)dismissSearchViewWithReason:(unint64_t)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)setCurrentIntent:(unint64_t)a3;
- (void)setCurrentPresentationSource:(unint64_t)a3;
- (void)setCurrentRevealProgress:(double)a3;
- (void)setNavController:(id)a3;
- (void)setSearchViewController:(id)a3;
- (void)setSearchViewWindow:(id)a3;
- (void)setUnifiedFieldViewController:(id)a3;
- (void)unifiedFieldViewControllerDidLayoutForKeyboardFrameChange:(id)a3;
- (void)unifiedFieldViewControllerDidLayoutUnifiedField:(id)a3 dueToKeyboardLayout:(BOOL)a4;
- (void)updateSearchViewClientSceneSettings;
- (void)updateSearchViewClientSceneSettingsIncludingKeyboard:(BOOL)a3 dueToKeyboardLayout:(BOOL)a4;
@end

@implementation SPUISearchViewWindowSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
  [v3 makeKeyWindow];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  [v6 _setKeepContextAssociationInBackground:1];
  v7 = [[SPUISecureWindow alloc] initWithWindowScene:v6];
  [(SPUISecureWindow *)v7 setHidden:0];
  [(SPUISecureWindow *)v7 setBackgroundColor:0];
  v8 = +[SPUISearchViewControllerHolder sharedInstance];
  v9 = [v8 rootViewController];
  [(SPUISecureWindow *)v7 setRootViewController:v9];

  v10 = [(SPUISecureWindow *)v7 _rootSheetPresentationController];
  [v10 _setShouldScaleDownBehindDescendantSheets:0];

  [(SPUISearchViewWindowSceneDelegate *)self setSearchViewWindow:v7];
  v11 = +[SPUISearchViewControllerHolder sharedInstance];
  v12 = [v11 searchViewController];
  [(SPUISearchViewWindowSceneDelegate *)self setSearchViewController:v12];

  v13 = +[SPUISearchViewControllerHolder sharedInstance];
  v14 = [v13 unifiedFieldController];
  [(SPUISearchViewWindowSceneDelegate *)self setUnifiedFieldViewController:v14];

  v15 = +[SPUISearchViewControllerHolder sharedInstance];
  v16 = [v15 navigationController];
  [(SPUISearchViewWindowSceneDelegate *)self setNavController:v16];

  v17 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
  [v17 setDelegate:self];

  v18 = [(SPUISearchViewWindowSceneDelegate *)self unifiedFieldViewController];
  [v18 setDelegate:self];

  v23 = self;
  v19 = +[NSArray arrayWithObjects:&v23 count:1];
  v20 = [v6 _FBSScene];
  v21 = [v20 identifier];
  [v6 _registerSettingsDiffActionArray:v19 forKey:v21];

  [(SPUISearchViewWindowSceneDelegate *)self updateSearchViewClientSceneSettings];
  v22 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
  [v22 makeKeyWindow];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = [v14 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v61 = v17;
    id v62 = v13;
    id v20 = v16;
    id v63 = v15;
    v21 = [v14 settings];
    id v22 = [v21 interfaceOrientation];
    v23 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
    v24 = [v23 headerView];
    [v24 setActiveInterfaceOrientation:v22];

    id v25 = [v21 presentationSource];
    [(SPUISearchViewWindowSceneDelegate *)self currentRevealProgress];
    double v27 = v26;
    [v21 revealProgress];
    if (v27 != v28
      && v25 != (id)6
      && (+[UIKeyboard isInHardwareKeyboardMode] & 1) == 0
      && [v21 presentationIntent] == (id)1)
    {
      [v21 revealProgress];
      -[SPUISearchViewWindowSceneDelegate setCurrentRevealProgress:](self, "setCurrentRevealProgress:");
      v29 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
      [(SPUISearchViewWindowSceneDelegate *)self currentRevealProgress];
      [v29 searchViewDidUpdatePresentationProgress:];
    }
    uint64_t v30 = [v21 legibilitySettings];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
      v33 = [v32 legibilitySettings];
      v34 = [v21 legibilitySettings];
      unsigned __int8 v35 = [v33 isEqual:v34];

      if ((v35 & 1) == 0)
      {
        v36 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
        v37 = [v21 legibilitySettings];
        [v36 setLegibilitySettings:v37];
      }
    }
    id v38 = [(SPUISearchViewWindowSceneDelegate *)self currentPresentationSource];
    if (v38 != [v21 presentationSource]) {
      -[SPUISearchViewWindowSceneDelegate setCurrentPresentationSource:](self, "setCurrentPresentationSource:", [v21 presentationSource]);
    }
    id v39 = [(SPUISearchViewWindowSceneDelegate *)self currentIntent];
    id v15 = v63;
    id v16 = v20;
    id v17 = v61;
    if (v39 != [v21 presentationIntent])
    {
      -[SPUISearchViewWindowSceneDelegate setCurrentIntent:](self, "setCurrentIntent:", [v21 presentationIntent]);
      switch([(SPUISearchViewWindowSceneDelegate *)self currentIntent])
      {
        case 1uLL:
          v40 = [(id)objc_opt_class() restorationData];
          v41 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v41 setRestorationData:v40];

          v42 = objc_opt_class();
          v43 = objc_opt_new();
          [v42 saveRestorationData:v43];

          v44 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v44 searchViewWillPresentFromSource:[self currentPresentationSource]];

          if (v25 == (id)6)
          {
            v45 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
            [v45 searchViewDidPresentFromSource:[self currentPresentationSource]];
          }
          v46 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v46 setRestorationData:0];
          goto LABEL_21;
        case 2uLL:
          if (v25 != (id)6)
          {
            v47 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
            [v47 searchViewDidPresentFromSource:[self currentPresentationSource]];
          }
          v46 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v46 sendPresentationFeedback];
          goto LABEL_21;
        case 3uLL:
          v46 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v46 searchViewWillDismissWithReason:0];
LABEL_21:

          break;
        case 4uLL:
          v48 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          uint64_t v49 = [v48 searchViewRestorationContext];

          v50 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v50 searchViewDidDismissWithReason:0];

          v51 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
          [v51 setRestorationData:0];

          id v65 = 0;
          v60 = (void *)v49;
          v52 = +[NSKeyedArchiver archivedDataWithRootObject:v49 requiringSecureCoding:1 error:&v65];
          id v53 = v65;
          if (v53)
          {
            v54 = spuiLogHandles[0];
            if (!spuiLogHandles[0])
            {
              SPUIInitLogging();
              v54 = spuiLogHandles[0];
            }
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
              sub_100006918();
            }
          }
          else
          {
            [(id)objc_opt_class() saveRestorationData:v52];
          }
          v55 = [(SPUISearchViewWindowSceneDelegate *)self navController];
          id v56 = [v55 popToRootViewControllerAnimated:0];

          v57 = [(SPUISearchViewWindowSceneDelegate *)self navController];
          v58 = [v57 view];
          [v58 layoutIfNeeded];

          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100005B40;
          v64[3] = &unk_10000C568;
          v64[4] = self;
          [(id)objc_opt_class() postMemoryWarningAndPerformBlockIfOverInactiveLimit:v64];
          +[SUIUtilities releaseVisionCachedResources];

          [(id)objc_opt_class() postMemoryWarningAndPerformBlockIfOverInactiveLimit:0];
          [(SPUISearchViewWindowSceneDelegate *)self backgroundSearchScene];

          id v15 = v63;
          break;
        default:
          break;
      }
    }

    id v13 = v62;
  }
}

- (void)updateSearchViewClientSceneSettingsIncludingKeyboard:(BOOL)a3 dueToKeyboardLayout:(BOOL)a4
{
  if ((+[SPUIDefaults enableFloatingWindow] & 1) == 0)
  {
    BOOL v56 = a3;
    v7 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
    [v7 distanceToTopOfAppIcons];
    uint64_t v9 = v8;

    v10 = [(SPUISearchViewWindowSceneDelegate *)self searchViewController];
    v11 = [v10 headerView];

    v12 = [v11 searchField];
    id v13 = [v12 layer];
    uint64_t RenderId = CALayerGetRenderId();

    id v14 = [v11 searchField];
    id v15 = [v14 layer];
    id v16 = CALayerGetContext();
    unsigned int v54 = [v16 contextId];

    id v17 = +[SPUISearchViewControllerHolder sharedInstance];
    v18 = [v17 searchProtectorLayer];
    uint64_t v52 = CALayerGetRenderId();

    v19 = +[SPUISearchViewControllerHolder sharedInstance];
    id v20 = [v19 searchProtectorLayer];
    v21 = CALayerGetContext();
    unsigned int v22 = [v21 contextId];

    v23 = [v11 backgroundBlurView];
    if (v23)
    {
      v24 = [v11 backgroundBlurView];
      id v25 = [v24 layer];
      uint64_t v26 = CALayerGetRenderId();
    }
    else
    {
      uint64_t v26 = 0;
    }

    double v27 = [v11 backgroundBlurView];
    if (v27)
    {
      double v28 = [v11 backgroundBlurView];
      v29 = [v28 layer];
      uint64_t v30 = CALayerGetContext();
      unsigned int v31 = [v30 contextId];
    }
    else
    {
      unsigned int v31 = 0;
    }

    uint64_t v32 = 0;
    if ((+[UIKeyboard isInHardwareKeyboardMode] & 1) == 0)
    {
      v33 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
      id v34 = [v33 interfaceOrientation];
      unsigned __int8 v35 = [v11 searchField];
      +[UIKeyboard sizeForInterfaceOrientation:v34 inputDelegate:v35];
      uint64_t v32 = v36;
    }
    v37 = [(SPUISearchViewWindowSceneDelegate *)self unifiedFieldViewController];
    char v38 = [v37 isUnifiedFieldDocked] ^ 1;
    [v37 unifiedFieldSize];
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    [v37 dockedUnifiedFieldSize];
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    [v37 unifiedFieldCornerRadius];
    uint64_t v48 = v47;
    uint64_t v49 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
    v50 = [v49 _scene];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100003A54;
    v57[3] = &unk_10000C540;
    unsigned int v69 = v54;
    unsigned int v70 = v22;
    uint64_t v61 = v32;
    uint64_t v62 = v9;
    uint64_t v59 = RenderId;
    uint64_t v60 = v53;
    id v58 = v37;
    BOOL v72 = a4;
    BOOL v73 = v56;
    char v74 = v38;
    uint64_t v63 = v40;
    uint64_t v64 = v42;
    uint64_t v65 = v44;
    uint64_t v66 = v46;
    uint64_t v67 = v48;
    unsigned int v71 = v31;
    uint64_t v68 = v26;
    id v51 = v37;
    [v50 updateClientSettingsWithBlock:v57];
  }
}

- (UIWindow)searchViewWindow
{
  return (UIWindow *)objc_getProperty(self, a2, 8, 1);
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

- (SPUIUnifiedFieldViewController)unifiedFieldViewController
{
  return (SPUIUnifiedFieldViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)unifiedFieldViewControllerDidLayoutUnifiedField:(id)a3 dueToKeyboardLayout:(BOOL)a4
{
}

- (void)updateSearchViewClientSceneSettings
{
}

- (void)setUnifiedFieldViewController:(id)a3
{
}

- (void)setSearchViewWindow:(id)a3
{
}

- (void)setSearchViewController:(id)a3
{
}

- (void)setNavController:(id)a3
{
}

+ (id)restorationUrl
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];

  v4 = +[NSString stringWithFormat:@"%@/%@/%@.%@", v3, @"Saved Application State", @"com.apple.Spotlight", @"savedState"];
  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) == 0)
  {
    v7 = +[NSFileManager defaultManager];
    [v7 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:0];
  }
  uint64_t v8 = [v4 stringByAppendingString:@"/spotlightRestorationData.data"];

  id v9 = [objc_alloc((Class)NSURL) initFileURLWithPath:v8 isDirectory:1];

  return v9;
}

+ (id)restorationDataQueue
{
  if (qword_100012690 != -1) {
    dispatch_once(&qword_100012690, &stru_10000C4C8);
  }
  v2 = (void *)qword_100012698;

  return v2;
}

+ (id)restorationData
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000575C;
  v11 = sub_10000576C;
  id v12 = 0;
  id v3 = [a1 restorationDataQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005774;
  v6[3] = &unk_10000C4F0;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)saveRestorationData:(id)a3
{
  id v4 = a3;
  v5 = [a1 restorationDataQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000597C;
  v7[3] = &unk_10000C518;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)postMemoryWarningAndPerformBlockIfOverInactiveLimit:(id)a3
{
  id v3 = (void (**)(void))a3;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  pid_t v4 = getpid();
  proc_pid_rusage(v4, 4, (rusage_info_t *)&v7);
  if (*((void *)&v11 + 1) >> 21 >= 0x19uLL)
  {
    if (v3) {
      v3[2](v3);
    }
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
}

- (void)unifiedFieldViewControllerDidLayoutForKeyboardFrameChange:(id)a3
{
}

- (void)backgroundSearchScene
{
  id v3 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
  v2 = [v3 _scene];
  [v2 updateClientSettingsWithTransitionBlock:&stru_10000C588];
}

- (void)dismissSearchView
{
}

- (void)dismissSearchViewWithReason:(unint64_t)a3
{
  id v4 = [(SPUISearchViewWindowSceneDelegate *)self searchViewWindow];
  id v3 = [v4 _scene];
  [v3 updateClientSettingsWithTransitionBlock:&stru_10000C5A8];
}

- (UINavigationController)navController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)currentPresentationSource
{
  return self->_currentPresentationSource;
}

- (void)setCurrentPresentationSource:(unint64_t)a3
{
  self->_currentPresentationSource = a3;
}

- (unint64_t)currentIntent
{
  return self->_currentIntent;
}

- (void)setCurrentIntent:(unint64_t)a3
{
  self->_currentIntent = a3;
}

- (double)currentRevealProgress
{
  return self->_currentRevealProgress;
}

- (void)setCurrentRevealProgress:(double)a3
{
  self->_currentRevealProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_unifiedFieldViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);

  objc_storeStrong((id *)&self->_searchViewWindow, 0);
}

@end