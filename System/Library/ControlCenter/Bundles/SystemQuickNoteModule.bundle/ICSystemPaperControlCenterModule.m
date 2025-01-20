@interface ICSystemPaperControlCenterModule
- (BOOL)isOnCoverSheetOrAppSwitcher;
- (CCUIButtonModuleViewController)moduleViewController;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)_primaryApplicationBundleIdentifier;
- (id)contentViewControllerForContext:(id)a3;
- (id)iconGlyph;
- (void)_cleanupRemoteAlertHandle:(id)a3;
- (void)_updateIconGlyph;
- (void)activateAlert;
- (void)activateAlertWithPresentationTarget:(id)a3;
- (void)activateSystemPaper;
- (void)dealloc;
- (void)handleTapWithTouchType:(int64_t)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setModuleViewController:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
@end

@implementation ICSystemPaperControlCenterModule

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICSystemPaperControlCenterModule;
  [(ICSystemPaperControlCenterModule *)&v3 dealloc];
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  unsigned int v4 = [(ICSystemPaperControlCenterModule *)self isOnCoverSheetOrAppSwitcher];
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "About to open System Paper from the Control Center", buf, 2u);
  }

  v6 = [(ICSystemPaperControlCenterModule *)self contentModuleContext];
  [v6 dismissControlCenter];

  if (v4)
  {
    v16[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v16[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v17[0] = &__kCFBooleanTrue;
    v17[1] = &__kCFBooleanTrue;
    v7 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v8 = +[FBSOpenApplicationOptions optionsWithDictionary:v7];

    v9 = [(ICSystemPaperControlCenterModule *)self _primaryApplicationBundleIdentifier];
    v10 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v11 = v10;
    if (v9) {
      CFStringRef v12 = v9;
    }
    else {
      CFStringRef v12 = @"com.apple.springboard";
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10FC;
    v14[3] = &unk_4278;
    v14[4] = self;
    [v10 openApplication:v12 withOptions:v8 completion:v14];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_11D4;
    v13[3] = &unk_4250;
    v13[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (void)activateSystemPaper
{
  objc_super v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v6 = [objc_alloc((Class)SBSSystemNotesPresentationConfiguration) initWithSceneBundleIdentifier:@"com.apple.mobilenotes" userActivity:0 preferredPresentationMode:0];
    id v5 = [objc_alloc((Class)SBSSystemNotesPresentationHandle) initWithConfiguration:v6];
    [v5 activate];
  }
  else if (_os_feature_enabled_impl())
  {
    [(ICSystemPaperControlCenterModule *)self activateAlert];
  }
}

- (void)activateAlert
{
  objc_super v3 = [(ICSystemPaperControlCenterModule *)self _primaryApplicationBundleIdentifier];
  if ([v3 length])
  {
    unint64_t v4 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v3];
    id v5 = +[RBSProcessStateDescriptor descriptor];
    id v6 = +[RBSProcessState statesForPredicate:v4 withDescriptor:v5 error:0];
    v7 = [v6 firstObject];

    id v12 = 0;
    if ([v7 isRunning])
    {
      v8 = [v7 process];
      id v9 = [v8 pid];

      v10 = +[BSProcessHandle processHandleForPID:v9];
      id v12 = [objc_alloc((Class)SBSRemoteAlertPresentationTarget) initWithTargetProcess:v10];
    }
    id v11 = v12;
  }
  else
  {
    id v11 = 0;
  }
  id v13 = v11;
  [(ICSystemPaperControlCenterModule *)self activateAlertWithPresentationTarget:v11];
}

- (void)activateAlertWithPresentationTarget:(id)a3
{
  unint64_t v4 = [(ICSystemPaperControlCenterModule *)self remoteAlertHandle];

  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[ICSystemPaperControlCenterModule activateAlertWithPresentationTarget:]";
      __int16 v12 = 1024;
      int v13 = 118;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Not activating SystemPaperViewService because handle already exists%s:%d", buf, 0x12u);
    }
  }
  else
  {
    id v9 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SystemPaperViewService" viewControllerClassName:@"ViewController"];
    id v6 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    id v7 = +[SBSRemoteAlertHandle newHandleWithDefinition:v9 configurationContext:v6];
    id v8 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    [v7 registerObserver:self];
    [v7 activateWithContext:v8];
    [(ICSystemPaperControlCenterModule *)self setRemoteAlertHandle:v7];
  }
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  layoutMonitor = self->_layoutMonitor;
  if (!layoutMonitor)
  {
    objc_initWeak(&location, self);
    unint64_t v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_1710;
    id v11 = &unk_42A0;
    objc_copyWeak(&v12, &location);
    [v4 setTransitionHandler:&v8];
    +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4, v8, v9, v10, v11);
    id v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_layoutMonitor;
    self->_layoutMonitor = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    layoutMonitor = self->_layoutMonitor;
  }

  return layoutMonitor;
}

- (BOOL)isOnCoverSheetOrAppSwitcher
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(ICSystemPaperControlCenterModule *)self layoutMonitor];
  objc_super v3 = [v2 currentLayout];
  unint64_t v4 = [v3 elements];

  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = FBSDisplayLayoutElementLockScreenIdentifier;
    uint64_t v9 = SBSDisplayLayoutElementAppSwitcherIdentifier;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 identifier];
        if ([v12 isEqualToString:v8])
        {

LABEL_13:
          BOOL v15 = 1;
          goto LABEL_14;
        }
        int v13 = [v11 identifier];
        unsigned __int8 v14 = [v13 isEqualToString:v9];

        if (v14) {
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_14:

  return v15;
}

- (id)_primaryApplicationBundleIdentifier
{
  v2 = [(ICSystemPaperControlCenterModule *)self layoutMonitor];
  objc_super v3 = [v2 currentLayout];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v4 = objc_msgSend(v3, "elements", 0);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isUIApplicationElement]
          && [v8 layoutRole] == (char *)&dword_0 + 1)
        {
          id v5 = [v8 bundleIdentifier];
          goto LABEL_12;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)contentViewControllerForContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSystemPaperControlCenterModule;
  unint64_t v4 = [(ICSystemPaperControlCenterModule *)&v7 contentViewControllerForContext:a3];
  objc_opt_class();
  id v5 = ICDynamicCast();
  [(ICSystemPaperControlCenterModule *)self setModuleViewController:v5];

  return v4;
}

- (void)_updateIconGlyph
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B44;
  block[3] = &unk_4250;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)iconGlyph
{
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:-1 scale:30.0];
  unint64_t v4 = +[UIScreen mainScreen];
  id v5 = [v4 traitCollection];
  uint64_t v6 = [v3 configurationWithTraitCollection:v5];

  objc_super v7 = +[UIImage _systemImageNamed:@"quicknote" withConfiguration:v6];
  [v7 size];
  double v9 = v8;
  [v7 size];
  double v11 = v10;
  [v7 alignmentRectInsets];
  double v16 = v13 + 0.0;
  double v17 = v12 + 0.0;
  double v18 = v9 - (v13 + v15);
  double v19 = v11 - (v12 + v14);
  if (v13 < v15) {
    double v13 = v15;
  }
  if (v12 < v14) {
    double v12 = v14;
  }
  CGFloat v20 = -v13;
  CGFloat v21 = -v12;
  v49.origin.CGFloat x = v16;
  v49.origin.CGFloat y = v17;
  v49.size.double width = v18;
  v49.size.double height = v19;
  CGRect v50 = CGRectInset(v49, v20, v21);
  CGFloat x = v50.origin.x;
  CGFloat y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  double v26 = -CGRectGetMinX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.double width = width;
  v51.size.double height = height;
  double v27 = -CGRectGetMinY(v51);
  v28 = +[UIApplication sharedApplication];
  v29 = (char *)[v28 userInterfaceLayoutDirection];

  if (v29 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v30 = [v7 imageWithHorizontallyFlippedOrientation];

    objc_super v7 = (void *)v30;
  }
  v31 = [(ICSystemPaperControlCenterModule *)self remoteAlertHandle];
  unsigned __int8 v32 = [v31 isActive];

  id v33 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v40 = _NSConcreteStackBlock;
  uint64_t v41 = 3221225472;
  v42 = sub_1E98;
  v43 = &unk_42C8;
  unsigned __int8 v47 = v32;
  id v44 = v7;
  double v45 = v26;
  double v46 = v27;
  id v34 = v7;
  v35 = [v33 imageWithActions:&v40];
  v36 = objc_msgSend(v35, "imageWithRenderingMode:", 2, v40, v41, v42, v43);

  if (v29 == (unsigned char *)&dword_0 + 1)
  {
    id v37 = [v36 imageWithHorizontallyFlippedOrientation];
  }
  else
  {
    id v37 = v36;
  }
  v38 = v37;

  return v38;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  objc_super v3 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_2338(v3);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_237C(v5);
  }

  [(ICSystemPaperControlCenterModule *)self _cleanupRemoteAlertHandle:v4];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v6 domain];
  if ([v8 isEqualToString:SBSRemoteAlertHandleInvalidationErrorDomain])
  {
    if (![v6 code] || objc_msgSend(v6, "code") == (char *)&dword_4 + 1)
    {

      goto LABEL_11;
    }
    BOOL v9 = [v6 code] == &dword_4;
  }
  else
  {
    BOOL v9 = 0;
  }

  if (!v6 || v9)
  {
LABEL_11:
    double v10 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_23C0((uint64_t)v6, v10);
    }
    goto LABEL_13;
  }
  double v10 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_2438((uint64_t)v6, v10);
  }
LABEL_13:

  [(ICSystemPaperControlCenterModule *)self _cleanupRemoteAlertHandle:v7];
}

- (void)_cleanupRemoteAlertHandle:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2154;
  v5[3] = &unk_42F0;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)setLayoutMonitor:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (CCUIButtonModuleViewController)moduleViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moduleViewController);

  return (CCUIButtonModuleViewController *)WeakRetained;
}

- (void)setModuleViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moduleViewController);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);

  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end