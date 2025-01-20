@interface RPControlCenterMenuModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)currentSelectedExtensionIsSystemRecording;
- (BOOL)isBroadcastPicker;
- (BOOL)isDeviceLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (RPControlCenterMenuModuleViewController)initWithClient:(id)a3 forBroadcastPicker:(BOOL)a4;
- (double)_maxVisibleMenuItems;
- (double)preferredExpandedContentHeight;
- (id)leadingImageForMenuItem:(id)a3;
- (void)acquireProcessAssertionWithHandler:(id)a3;
- (void)authenticateWithCompletionHandler:(id)a3;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)cancelPreviousCountdownRequest;
- (void)cancelRecordingCountdown;
- (void)dealloc;
- (void)didChangeAvailability:(BOOL)a3;
- (void)didStartRecordingOrBroadcast;
- (void)didStopRecordingOrBroadcast;
- (void)didUpdateClientStateWithAvailableExtensions:(id)a3 completionHandler:(id)a4;
- (void)invalidateProcessAssertion;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)recordButtonTapped;
- (void)sessionDidFailToStart;
- (void)sessionIsStarting;
- (void)setAvailableExtensions:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setupLockScreenNotifications;
- (void)startBroadcast;
- (void)startRecord;
- (void)startRecordingCountdown;
- (void)startSystemSession;
- (void)stopLockScreenNotifications;
- (void)transitionToCountdownState;
- (void)updateGlyphPackageDescription;
- (void)updateGlyphState;
- (void)updateRPCCModuleMenuItems;
- (void)updateRecordButtonLabel;
- (void)updateStateAndUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RPControlCenterMenuModuleViewController

- (RPControlCenterMenuModuleViewController)initWithClient:(id)a3 forBroadcastPicker:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RPControlCenterMenuModuleViewController;
  v7 = [(RPControlCenterMenuModuleViewController *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_client, v6);
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v8->_client);
      *(_DWORD *)buf = 136447234;
      v18 = "-[RPControlCenterMenuModuleViewController initWithClient:forBroadcastPicker:]";
      __int16 v19 = 1024;
      int v20 = 75;
      __int16 v21 = 2048;
      v22 = v8;
      __int16 v23 = 2048;
      id v24 = WeakRetained;
      __int16 v25 = 1024;
      BOOL v26 = v4;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p isBroadcast=%i ", buf, 0x2Cu);
    }
    id v10 = objc_loadWeakRetained((id *)&v8->_client);
    [v10 addDegate:v8];

    v8->_isBroadcastPicker = v4;
    v8->_bpStartedFromAnotherView = 0;
    id v11 = objc_loadWeakRetained((id *)&v8->_client);
    uint64_t v12 = [v11 extensionBundleID];
    currentSelectedExtension = v8->_currentSelectedExtension;
    v8->_currentSelectedExtension = (NSString *)v12;

    [(RPControlCenterMenuModuleViewController *)v8 setGlyphState:@"Base State"];
    [(RPControlCenterMenuModuleViewController *)v8 setIndentation:3];
    [(RPControlCenterMenuModuleViewController *)v8 setUseTrailingCheckmarkLayout:1];
    id v14 = objc_loadWeakRetained((id *)&v8->_client);
    [v14 updateClientState];
  }
  return v8;
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPControlCenterMenuModuleViewController dealloc]";
    __int16 v9 = 1024;
    int v10 = 91;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained removeDelegate:self];

  [(RPControlCenterMenuModuleViewController *)self stopLockScreenNotifications];
  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  lockStateQueue = self->_lockStateQueue;
  self->_lockStateQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v6 dealloc];
}

- (void)updateGlyphPackageDescription
{
  v3 = [(RPControlCenterMenuModuleViewController *)self traitCollection];
  BOOL v4 = (char *)[v3 accessibilityContrast];
  v5 = @"replaykit-v2";
  if (v4 == (unsigned char *)&dword_0 + 1) {
    v5 = @"replaykit-v2_IC";
  }
  objc_super v6 = v5;

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = +[CCUICAPackageDescription descriptionForPackageNamed:v6 inBundle:v8];

  [(RPControlCenterMenuModuleViewController *)self setGlyphPackageDescription:v7];
}

- (void)updateGlyphState
{
  if ([(RPControlCenterMenuModuleViewController *)self contentRenderingMode] == (char *)&dword_0 + 1) {
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  unsigned __int8 v4 = [WeakRetained recordingOn];

  if (v4)
  {
    CFStringRef v5 = @"recording";
    goto LABEL_9;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v7 = [v6 isCountingDown];

  if (!v7)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_client);
    [v10 isAvailableAndInitialized];

LABEL_8:
    CFStringRef v5 = @"Base State";
    goto LABEL_9;
  }
  [(RPControlCenterMenuModuleViewController *)self setGlyphState:@"countdown"];
  id v8 = +[RPFeatureFlagUtility sharedInstance];
  unsigned __int8 v9 = [v8 systemBannerEnabled];

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
  CFStringRef v5 = @"recording-static";
LABEL_9:
  [(RPControlCenterMenuModuleViewController *)self setGlyphState:v5];
LABEL_10:
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [(RPControlCenterMenuModuleViewController *)self glyphState];
    int v12 = 136446978;
    v13 = "-[RPControlCenterMenuModuleViewController updateGlyphState]";
    __int16 v14 = 1024;
    int v15 = 121;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated glyph state: %@", (uint8_t *)&v12, 0x26u);
  }
}

- (double)_maxVisibleMenuItems
{
  v2 = [(RPControlCenterMenuModuleViewController *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];

  double v4 = 2.5;
  if (UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityLarge) == NSOrderedDescending)
  {
    if (UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityExtraLarge) == NSOrderedDescending) {
      double v4 = 1.5;
    }
    else {
      double v4 = 2.0;
    }
  }

  return v4;
}

- (void)setAvailableExtensions:(id)a3
{
  double v4 = buf;
  id v5 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v78 = "-[RPControlCenterMenuModuleViewController setAvailableExtensions:]";
    __int16 v79 = 1024;
    int v80 = 136;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (![(NSMutableArray *)self->_availableExtensions isEqualToArray:self->_availableExtensions])
  {
    id v6 = &BSDispatchQueueCreateSerialWithQoS_ptr;
    unsigned int v7 = +[NSMutableArray array];
    availableExtensions = self->_availableExtensions;
    self->_availableExtensions = v7;

    if (!self->_isBroadcastPicker)
    {
      unsigned int v60 = 0;
      if (!v5) {
        goto LABEL_39;
      }
LABEL_22:
      if ([v5 count])
      {
        currentSelectedExtension = [v6[101] array];
        [v6[101] array];
        v56 = id v55 = v5;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id obj = v5;
        CFStringRef v19 = @"displayName";
        int v20 = &BSDispatchQueueCreateSerialWithQoS_ptr;
        id v61 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v61)
        {
          uint64_t v59 = *(void *)v65;
          v57 = currentSelectedExtension;
          do
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(void *)v65 != v59) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              uint64_t v23 = [v22 objectForKey:v19];
              id v24 = [v22 objectForKey:@"extBundleID"];
              uint64_t v25 = [v22 objectForKey:@"extAppImgData"];
              BOOL v26 = (void *)v25;
              v63 = (void *)v23;
              if (v25)
              {
                v74[0] = v19;
                v74[1] = @"extBundleID";
                v75[0] = v23;
                v75[1] = v24;
                v74[2] = @"extAppImgData";
                v75[2] = v25;
                v27 = v20[99];
                v28 = v75;
                v29 = v74;
                uint64_t v30 = 3;
              }
              else
              {
                v72[0] = v19;
                v72[1] = @"extBundleID";
                v73[0] = v23;
                v73[1] = v24;
                v27 = v20[99];
                v28 = v73;
                v29 = v72;
                uint64_t v30 = 2;
              }
              v31 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:v30];
              [currentSelectedExtension addObject:v31];
              if (v60)
              {
                id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
                [WeakRetained preferredExtension];
                CFStringRef v33 = v19;
                v34 = v20;
                v36 = v35 = self;
                unsigned int v37 = [v36 isEqualToString:v24];

                self = v35;
                int v20 = v34;
                CFStringRef v19 = v33;

                currentSelectedExtension = v57;
                if (v37)
                {
                  [v56 addObject:v31];
                  objc_storeStrong((id *)&self->_currentSelectedExtension, v24);
                }
              }
            }
            id v61 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
          }
          while (v61);
        }

        if (v60)
        {
          v38 = v56;
          if ([v56 count])
          {
            [(NSMutableArray *)self->_availableExtensions addObjectsFromArray:v56];
            id v5 = v55;
LABEL_48:
            [(RPControlCenterMenuModuleViewController *)self setVisibleMenuItems:0.0];
            if ((unint64_t)[(NSMutableArray *)self->_availableExtensions count] >= 3)
            {
              [(RPControlCenterMenuModuleViewController *)self _maxVisibleMenuItems];
              -[RPControlCenterMenuModuleViewController setVisibleMenuItems:](self, "setVisibleMenuItems:");
            }
            if (self->_bpStartedFromAnotherView)
            {
              id v53 = objc_loadWeakRetained((id *)&self->_client);
              v54 = [v53 preferredExtension];

              if (v54) {
                [(RPControlCenterMenuModuleViewController *)self setVisibleMenuItems:1.0];
              }
            }

            goto LABEL_54;
          }
          CFStringRef v39 = v19;
          if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v78 = "-[RPControlCenterMenuModuleViewController setAvailableExtensions:]";
            __int16 v79 = 1024;
            int v80 = 175;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferred extension was not found, using default view with all extensions instead", buf, 0x12u);
          }
          id v40 = objc_loadWeakRetained((id *)&self->_client);
          [v40 setPreferredExtension:0];

          CFStringRef v19 = v39;
        }
        CFStringRef v41 = v19;
        v42 = +[UIScreen mainScreen];
        [v42 scale];
        +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.mobileslideshow", 0);
        v43 = (UIImage *)objc_claimAutoreleasedReturnValue();

        v44 = UIImagePNGRepresentation(v43);
        uint64_t v45 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_CAMERA_ROLL_DISPLAY_NAME"];
        v46 = (void *)v45;
        if (v44)
        {
          v70[0] = v41;
          v70[1] = @"extBundleID";
          v71[0] = v45;
          v71[1] = @"com.apple.replaykit.recordToCameraRoll";
          v70[2] = @"extAppImgData";
          v71[2] = v44;
          v47 = v20[99];
          v48 = v71;
          v49 = v70;
          uint64_t v50 = 3;
        }
        else
        {
          v68[0] = v41;
          v68[1] = @"extBundleID";
          v69[0] = v45;
          v69[1] = @"com.apple.replaykit.recordToCameraRoll";
          v47 = v20[99];
          v48 = v69;
          v49 = v68;
          uint64_t v50 = 2;
        }
        v51 = [v47 dictionaryWithObjects:v48 forKeys:v49 count:v50];
        [currentSelectedExtension addObject:v51];
        v52 = [currentSelectedExtension sortedArrayUsingComparator:&stru_1C7F0];
        [(NSMutableArray *)self->_availableExtensions addObjectsFromArray:v52];

        id v5 = v55;
        v38 = v56;
        goto LABEL_48;
      }
LABEL_39:
      [(RPControlCenterMenuModuleViewController *)self setVisibleMenuItems:0.0];
      currentSelectedExtension = self->_currentSelectedExtension;
      self->_currentSelectedExtension = (NSString *)@"com.apple.replaykit.recordToCameraRoll";
LABEL_54:

      [(RPControlCenterMenuModuleViewController *)self updateStateAndUI];
      goto LABEL_55;
    }
    p_client = &self->_client;
    id v10 = objc_loadWeakRetained((id *)&self->_client);
    unsigned __int8 v11 = [v10 lockUIControls];
    if ((v11 & 1) != 0
      || (double v4 = objc_loadWeakRetained((id *)&self->_client),
          [v4 preferredExtension],
          (int v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v13 = objc_loadWeakRetained((id *)&self->_client);
      if ([v13 lockUIControls])
      {
        v62 = self;
        id v14 = objc_loadWeakRetained((id *)&self->_client);
        int v15 = [v14 preferredExtension];
        id v16 = objc_loadWeakRetained((id *)p_client);
        v17 = [v16 extensionBundleID];
        unsigned int v60 = [v15 isEqualToString:v17];

        if (v11)
        {
          self = v62;
          id v6 = &BSDispatchQueueCreateSerialWithQoS_ptr;
          goto LABEL_21;
        }
        int v12 = 0;
        self = v62;
        id v6 = &BSDispatchQueueCreateSerialWithQoS_ptr;
      }
      else
      {

        unsigned int v60 = 0;
        if (v11) {
          goto LABEL_21;
        }
        int v12 = 0;
      }
    }
    else
    {
      unsigned int v60 = 1;
    }

LABEL_21:
    if (!v5) {
      goto LABEL_39;
    }
    goto LABEL_22;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v78 = "-[RPControlCenterMenuModuleViewController setAvailableExtensions:]";
    __int16 v79 = 1024;
    int v80 = 139;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no change in available extensions", buf, 0x12u);
  }
LABEL_55:
}

- (void)updateStateAndUI
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    unsigned int v4 = [WeakRetained recordingOn];
    id v5 = objc_loadWeakRetained((id *)&self->_client);
    unsigned int v6 = [v5 isCountingDown];
    id v7 = objc_loadWeakRetained((id *)&self->_client);
    unsigned int v8 = [v7 lockUIControls];
    id v9 = objc_loadWeakRetained((id *)&self->_client);
    int v17 = 136447746;
    __int16 v18 = "-[RPControlCenterMenuModuleViewController updateStateAndUI]";
    __int16 v19 = 1024;
    int v20 = 224;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = v4;
    __int16 v25 = 1024;
    unsigned int v26 = v6;
    __int16 v27 = 1024;
    unsigned int v28 = v8;
    __int16 v29 = 2048;
    id v30 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p recording is %i, counting down is %i, locked ui is %i, from client %p", (uint8_t *)&v17, 0x38u);
  }
  p_client = &self->_client;
  id v11 = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v12 = [v11 recordingOn];

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_client);
    id v14 = [v13 extensionBundleID];
    currentSelectedExtension = self->_currentSelectedExtension;
    self->_currentSelectedExtension = v14;
  }
  if ([(RPControlCenterMenuModuleViewController *)self isExpanded])
  {
    [(RPControlCenterMenuModuleViewController *)self setSelected:0];
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)p_client);
    -[RPControlCenterMenuModuleViewController setSelected:](self, "setSelected:", [v16 recordingOn]);
  }
  [(RPControlCenterMenuModuleViewController *)self updateGlyphState];
  [(RPControlCenterMenuModuleViewController *)self updateRecordButtonLabel];
  [(RPControlCenterMenuModuleViewController *)self updateRPCCModuleMenuItems];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v11 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_OK_BUTTON"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:0];
  [v11 addAction:v10];

  [(RPControlCenterMenuModuleViewController *)self presentViewController:v11 animated:1 completion:v8];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    __int16 v19 = "-[RPControlCenterMenuModuleViewController viewDidLoad]";
    __int16 v20 = 1024;
    int v21 = 261;
    __int16 v22 = 2048;
    __int16 v23 = self;
    __int16 v24 = 2048;
    id v25 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  v16.receiver = self;
  v16.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v16 viewDidLoad];
  [(RPControlCenterMenuModuleViewController *)self updateGlyphPackageDescription];
  unsigned int v4 = self;
  int v17 = v4;
  id v5 = +[NSArray arrayWithObjects:&v17 count:1];
  id v6 = [(RPControlCenterMenuModuleViewController *)self registerForTraitChanges:v5 withAction:"updateGlyphPackageDescription"];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  RPCCModuleBundle = self->_RPCCModuleBundle;
  self->_RPCCModuleBundle = v7;

  if (self->_isBroadcastPicker) {
    CFStringRef v9 = @"BROADCAST_PICKER_TITLE";
  }
  else {
    CFStringRef v9 = @"CONTROL_CENTER_TITLE";
  }
  id v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  [(RPControlCenterMenuModuleViewController *)self setTitle:v10];

  SerialWithQoS = (OS_dispatch_queue *)BSDispatchQueueCreateSerialWithQoS();
  lockStateQueue = self->_lockStateQueue;
  self->_lockStateQueue = SerialWithQoS;

  id v13 = self->_lockStateQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_A520;
  v15[3] = &unk_1C498;
  v15[4] = self;
  dispatch_async(v13, v15);
  [(RPControlCenterMenuModuleViewController *)self updateRecordButtonLabel];
  [(RPControlCenterMenuModuleViewController *)self setupLockScreenNotifications];
  [(RPControlCenterMenuModuleViewController *)self setValueText:0];
  id v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_SELECTED_VALUE_TEXT"];
  [(RPControlCenterMenuModuleViewController *)self setSelectedValueText:v14];
}

- (void)setupLockScreenNotifications
{
  objc_initWeak(&location, self);
  lockStateQueue = self->_lockStateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A654;
  v4[3] = &unk_1C818;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_lockToResetToken, lockStateQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopLockScreenNotifications
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    CFStringRef v9 = "-[RPControlCenterMenuModuleViewController viewWillAppear:]";
    __int16 v10 = 1024;
    int v11 = 310;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2048;
    id v15 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  id v6 = objc_loadWeakRetained((id *)&self->_client);
  [v6 updateClientState];

  v7.receiver = self;
  v7.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v7 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    id v8 = "-[RPControlCenterMenuModuleViewController viewDidAppear:]";
    __int16 v9 = 1024;
    int v10 = 316;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2048;
    id v14 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  v6.receiver = self;
  v6.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    id v8 = "-[RPControlCenterMenuModuleViewController viewWillDisappear:]";
    __int16 v9 = 1024;
    int v10 = 321;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2048;
    id v14 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  v6.receiver = self;
  v6.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v6 viewWillDisappear:v3];
}

- (void)acquireProcessAssertionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)BKSProcessAssertion);
  uint64_t v6 = getpid();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_ABD0;
  v10[3] = &unk_1C868;
  id v11 = v4;
  id v7 = v4;
  id v8 = (BKSProcessAssertion *)[v5 initWithPID:v6 flags:1 reason:4 name:@"HomeNFCStopAssertion" withHandler:v10];
  backgroundProcessAssertion = self->_backgroundProcessAssertion;
  self->_backgroundProcessAssertion = v8;
}

- (void)invalidateProcessAssertion
{
  [(BKSProcessAssertion *)self->_backgroundProcessAssertion invalidate];
  backgroundProcessAssertion = self->_backgroundProcessAssertion;
  self->_backgroundProcessAssertion = 0;
}

- (void)authenticateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    id v11 = "-[RPControlCenterMenuModuleViewController authenticateWithCompletionHandler:]";
    __int16 v12 = 1024;
    int v13 = 352;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2048;
    id v17 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  lockStateQueue = self->_lockStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AF3C;
  block[3] = &unk_1C840;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(lockStateQueue, block);
}

- (void)transitionToCountdownState
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    uint64_t v6 = "-[RPControlCenterMenuModuleViewController transitionToCountdownState]";
    __int16 v7 = 1024;
    int v8 = 363;
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_B170;
  v4[3] = &unk_1C498;
  void v4[4] = self;
  [(RPControlCenterMenuModuleViewController *)self acquireProcessAssertionWithHandler:v4];
}

- (BOOL)currentSelectedExtensionIsSystemRecording
{
  return [(NSString *)self->_currentSelectedExtension isEqualToString:@"com.apple.replaykit.recordToCameraRoll"];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    __int16 v9 = "-[RPControlCenterMenuModuleViewController viewWillTransitionToSize:withTransitionCoordinator:]";
    __int16 v10 = 1024;
    int v11 = 401;
    __int16 v12 = 2048;
    int v13 = self;
    __int16 v14 = 2048;
    id v15 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B468;
  v7[3] = &unk_1C8B8;
  v7[4] = self;
  [v5 animateAlongsideTransition:v7 completion:&stru_1C8F8];
}

- (void)startRecord
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    __int16 v7 = "-[RPControlCenterMenuModuleViewController startRecord]";
    __int16 v8 = 1024;
    int v9 = 420;
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2048;
    id v13 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B664;
  v5[3] = &unk_1C498;
  v5[4] = self;
  [v4 startRecordingWithHandler:v5];
}

- (void)startBroadcast
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    __int16 v7 = "-[RPControlCenterMenuModuleViewController startBroadcast]";
    __int16 v8 = 1024;
    int v9 = 429;
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2048;
    id v13 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B804;
  v5[3] = &unk_1C498;
  v5[4] = self;
  [v4 startBroadcastWithHandler:v5];
}

- (void)startRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v5 = 136446978;
    uint64_t v6 = "-[RPControlCenterMenuModuleViewController startRecordingCountdown]";
    __int16 v7 = 1024;
    int v8 = 438;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v5, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  [v4 startRecordingCountdown];
}

- (void)cancelRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v5 = 136446978;
    uint64_t v6 = "-[RPControlCenterMenuModuleViewController cancelRecordingCountdown]";
    __int16 v7 = 1024;
    int v8 = 443;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v5, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  [v4 cancelRecordingCountdown];
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];
  uint64_t v6 = [v4 identifier];
  unsigned int v7 = [v6 isEqualToString:@"Current"];

  if (v7)
  {
    int v8 = self->_currentSelectedExtension;

    int v5 = v8;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  __int16 v9 = self->_availableExtensions;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    int v21 = self;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [v14 objectForKey:@"extBundleID"];
        unsigned int v16 = [v5 isEqualToString:v15];

        if (v16)
        {
          id v17 = v14;
          goto LABEL_13;
        }
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    id v17 = 0;
LABEL_13:
    self = v21;
  }
  else
  {
    id v17 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  __int16 v19 = [WeakRetained imageForBundleID:v5 extensionInfo:v17];

  return v19;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPControlCenterMenuModuleViewController;
  if ([(RPControlCenterMenuModuleViewController *)&v6 contentRenderingMode] != (id)a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RPControlCenterMenuModuleViewController;
    [(RPControlCenterMenuModuleViewController *)&v5 setContentRenderingMode:a3];
    [(RPControlCenterMenuModuleViewController *)self updateGlyphState];
  }
}

- (void)updateRecordButtonLabel
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  if ([WeakRetained lockUIControls])
  {

    goto LABEL_4;
  }
  id v5 = objc_loadWeakRetained((id *)p_client);
  unsigned int v6 = [v5 isCountingDown];

  if (v6)
  {
LABEL_4:
    if ([(NSString *)self->_currentSelectedExtension isEqualToString:@"com.apple.replaykit.recordToCameraRoll"])
    {
      CFStringRef v7 = @"CONTROL_CENTER_STOP_RECORDING";
    }
    else
    {
      CFStringRef v7 = @"CONTROL_CENTER_STOP_BROADCAST";
    }
    goto LABEL_10;
  }
  if ([(NSString *)self->_currentSelectedExtension isEqualToString:@"com.apple.replaykit.recordToCameraRoll"])
  {
    CFStringRef v7 = @"CONTROL_CENTER_START_RECORDING";
  }
  else
  {
    CFStringRef v7 = @"CONTROL_CENTER_START_BROADCAST";
  }
LABEL_10:
  +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_BE54;
  v9[3] = &unk_1C750;
  v9[4] = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v10;
  +[UIView performWithoutAnimation:v9];
}

- (void)updateRPCCModuleMenuItems
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    v36 = "-[RPControlCenterMenuModuleViewController updateRPCCModuleMenuItems]";
    __int16 v37 = 1024;
    int v38 = 503;
    __int16 v39 = 2048;
    id v40 = self;
    __int16 v41 = 2048;
    id v42 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  objc_initWeak((id *)buf, self);
  long long v23 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = self->_availableExtensions;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      id v24 = v4;
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        unsigned int v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        CFStringRef v7 = [v6 objectForKey:@"displayName"];
        id v8 = [v6 objectForKey:@"extBundleID"];
        __int16 v9 = @"Current";
        if (([v8 isEqualToString:self->_currentSelectedExtension] & 1) == 0) {
          __int16 v9 = v8;
        }
        id v10 = objc_alloc((Class)CCUIMenuModuleItem);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_C488;
        v27[3] = &unk_1C948;
        objc_copyWeak(&v29, (id *)buf);
        id v11 = v8;
        id v28 = v11;
        id v12 = [v10 initWithTitle:v7 identifier:v9 handler:v27];
        [v12 setBusy:0];
        [v12 setSelected:0];
        if ([v11 isEqualToString:self->_currentSelectedExtension])
        {
          id v13 = objc_loadWeakRetained((id *)&self->_client);
          unsigned int v14 = [v13 recordingOn];

          if (v14)
          {
            [v12 setBusy:1];
            id v15 = objc_loadWeakRetained((id *)&self->_client);
            unsigned int v16 = [v15 currentTimerString];
            [v12 setSubtitle:v16];
          }
          [v12 setSelected:1];
          [v23 insertObject:v12 atIndex:0];
        }
        else
        {
          [v23 addObject:v12];
        }

        objc_destroyWeak(&v29);
      }
      id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v4);
  }

  id v17 = objc_loadWeakRetained((id *)&self->_client);
  if (([v17 recordingOn] & 1) == 0)
  {

    goto LABEL_22;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_client);
  __int16 v19 = [v18 currentTimerString];
  unsigned __int8 v20 = [v19 isEqualToString:@"00:00"];

  if (v20)
  {
LABEL_22:
    [(RPControlCenterMenuModuleViewController *)self setMenuItems:v23];
    [(RPControlCenterMenuModuleViewController *)self scrollToTop:1];
    goto LABEL_23;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_C554;
  v25[3] = &unk_1C750;
  v25[4] = self;
  id v26 = v23;
  +[UIView performWithoutAnimation:v25];

LABEL_23:
  objc_destroyWeak((id *)buf);
}

- (void)cancelPreviousCountdownRequest
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v5 = 136446978;
    unsigned int v6 = "-[RPControlCenterMenuModuleViewController cancelPreviousCountdownRequest]";
    __int16 v7 = 1024;
    int v8 = 562;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v5, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  [v4 notifyClientDelegatesStart:0];

  [(RPControlCenterMenuModuleViewController *)self cancelRecordingCountdown];
}

- (void)recordButtonTapped
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 136446978;
    __int16 v11 = "-[RPControlCenterMenuModuleViewController recordButtonTapped]";
    __int16 v12 = 1024;
    int v13 = 569;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2048;
    id v17 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", buf, 0x26u);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_client);
  [v4 setCurrentTimerString:0];

  id v5 = objc_loadWeakRetained((id *)&self->_client);
  LODWORD(v4) = [v5 isAvailableAndInitialized];

  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_C8F0;
    v9[3] = &unk_1C650;
    v9[4] = self;
    [(RPControlCenterMenuModuleViewController *)self authenticateWithCompletionHandler:v9];
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v11 = "-[RPControlCenterMenuModuleViewController recordButtonTapped]";
      __int16 v12 = 1024;
      int v13 = 603;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Recording not available due to AirPlay, Restriction, or screen mirroring active", buf, 0x12u);
    }
    unsigned int v6 = [(RPControlCenterMenuModuleViewController *)self title];
    __int16 v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v6];
    int v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_ERROR_NOT_AVAILABLE"];
    [(RPControlCenterMenuModuleViewController *)self presentAlertWithTitle:v7 message:v8 completion:&stru_1C968];
  }
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v5 = 136446978;
    unsigned int v6 = "-[RPControlCenterMenuModuleViewController shouldBeginTransitionToExpandedContentModule]";
    __int16 v7 = 1024;
    int v8 = 614;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v5, 0x26u);
  }
  self->_didStartFromLongPress = 1;
  return ![(RPControlCenterMenuModuleViewController *)self isDeviceLocked];
}

- (double)preferredExpandedContentHeight
{
  BOOL v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom])
  {
  }
  else
  {
    CCUIReferenceScreenBounds();
    double Height = CGRectGetHeight(v19);

    if (Height > 568.0)
    {
      v18.receiver = self;
      v18.super_class = (Class)RPControlCenterMenuModuleViewController;
      [(RPControlCenterMenuModuleViewController *)&v18 preferredExpandedContentHeight];
      double v6 = 349.5;
      return fmin(v5, v6);
    }
  }
  __int16 v7 = [(RPControlCenterMenuModuleViewController *)self traitCollection];
  int v8 = [v7 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (!IsAccessibilityCategory)
  {
    v16.receiver = self;
    v16.super_class = (Class)RPControlCenterMenuModuleViewController;
    [(RPControlCenterMenuModuleViewController *)&v16 preferredExpandedContentHeight];
    double v6 = 279.5;
    return fmin(v5, v6);
  }
  v17.receiver = self;
  v17.super_class = (Class)RPControlCenterMenuModuleViewController;
  [(RPControlCenterMenuModuleViewController *)&v17 preferredExpandedContentHeight];
  double v11 = v10;
  id v12 = +[UIScreen mainScreen];
  [v12 bounds];
  double v14 = v13;

  if (v11 >= v14) {
    return v14;
  }
  else {
    return v11;
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v11 = "-[RPControlCenterMenuModuleViewController buttonTapped:forEvent:]";
    __int16 v12 = 1024;
    int v13 = 634;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  currentSelectedExtension = self->_currentSelectedExtension;
  self->_currentSelectedExtension = (NSString *)@"com.apple.replaykit.recordToCameraRoll";

  if (self->_didStartFromLongPress && [(RPControlCenterMenuModuleViewController *)self isDeviceLocked])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_D1D0;
    v9[3] = &unk_1C650;
    v9[4] = self;
    [(RPControlCenterMenuModuleViewController *)self authenticateWithCompletionHandler:v9];
    self->_didStartFromLongPress = 0;
  }
  else
  {
    [(RPControlCenterMenuModuleViewController *)self recordButtonTapped];
  }
}

- (void)didChangeAvailability:(BOOL)a3
{
  if (__RPLogLevel <= 1u)
  {
    BOOL v4 = a3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
      int v6 = 136447234;
      id v7 = "-[RPControlCenterMenuModuleViewController didChangeAvailability:]";
      __int16 v8 = 1024;
      int v9 = 654;
      __int16 v10 = 2048;
      double v11 = self;
      __int16 v12 = 2048;
      id v13 = WeakRetained;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p isAvailable:%i", (uint8_t *)&v6, 0x2Cu);
    }
  }
  [(RPControlCenterMenuModuleViewController *)self updateGlyphState];
}

- (void)sessionIsStarting
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v4 = 136446978;
    double v5 = "-[RPControlCenterMenuModuleViewController sessionIsStarting]";
    __int16 v6 = 1024;
    int v7 = 660;
    __int16 v8 = 2048;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v4, 0x26u);
  }
  [(RPControlCenterMenuModuleViewController *)self updateGlyphState];
  [(RPControlCenterMenuModuleViewController *)self updateRecordButtonLabel];
}

- (void)sessionDidFailToStart
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v4 = 136446978;
    double v5 = "-[RPControlCenterMenuModuleViewController sessionDidFailToStart]";
    __int16 v6 = 1024;
    int v7 = 667;
    __int16 v8 = 2048;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v4, 0x26u);
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"startBroadcast" object:self];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"startRecord" object:self];
  [(RPControlCenterMenuModuleViewController *)self invalidateProcessAssertion];
  [(RPControlCenterMenuModuleViewController *)self updateStateAndUI];
}

- (void)didStopRecordingOrBroadcast
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v4 = 136446978;
    double v5 = "-[RPControlCenterMenuModuleViewController didStopRecordingOrBroadcast]";
    __int16 v6 = 1024;
    int v7 = 680;
    __int16 v8 = 2048;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v4, 0x26u);
  }
  [(RPControlCenterMenuModuleViewController *)self updateStateAndUI];
}

- (void)didStartRecordingOrBroadcast
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v7 = 136446978;
    __int16 v8 = "-[RPControlCenterMenuModuleViewController didStartRecordingOrBroadcast]";
    __int16 v9 = 1024;
    int v10 = 691;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2048;
    id v14 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v7, 0x26u);
  }
  [(RPControlCenterMenuModuleViewController *)self updateStateAndUI];
  int v4 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v5 = [v4 systemBannerEnabled];

  if (v5) {
    [(RPControlCenterMenuModuleViewController *)self invalidateProcessAssertion];
  }
  if ([(RPControlCenterMenuModuleViewController *)self currentSelectedExtensionIsSystemRecording])
  {
    id v6 = objc_loadWeakRetained((id *)&self->_client);
    [v6 showRecordingBanner];
  }
}

- (void)didUpdateClientStateWithAvailableExtensions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    int v9 = 136446978;
    int v10 = "-[RPControlCenterMenuModuleViewController didUpdateClientStateWithAvailableExtensions:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 703;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2048;
    id v16 = WeakRetained;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p client=%p", (uint8_t *)&v9, 0x26u);
  }
  [(RPControlCenterMenuModuleViewController *)self setAvailableExtensions:v6];
  [(RPControlCenterMenuModuleViewController *)self updateStateAndUI];
  v7[2](v7);
}

- (void)startSystemSession
{
}

- (void)setContentModuleContext:(id)a3
{
  int v4 = (CCUIContentModuleContext *)a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPControlCenterMenuModuleViewController setContentModuleContext:]";
    __int16 v8 = 1024;
    int v9 = 719;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v6, 0x1Cu);
  }
  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = v4;
}

- (BOOL)isBroadcastPicker
{
  return self->_isBroadcastPicker;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateQueue, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, 0);
  objc_storeStrong((id *)&self->_currentSelectedExtension, 0);
  objc_storeStrong((id *)&self->_availableExtensions, 0);

  objc_storeStrong((id *)&self->_RPCCModuleBundle, 0);
}

@end