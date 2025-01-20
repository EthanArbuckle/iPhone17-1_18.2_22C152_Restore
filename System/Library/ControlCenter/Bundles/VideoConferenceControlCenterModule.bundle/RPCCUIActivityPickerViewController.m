@interface RPCCUIActivityPickerViewController
+ (BOOL)isOnboardingComplete;
+ (BOOL)isOnboardingEncountered;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isConfiguringEducationCard;
- (BOOL)_updateHeaderOrFooterIfNecessary;
- (BOOL)isFooterPinnedToBottom;
- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6;
- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7;
- (RPCCActivityManager)_activityManager;
- (RPCCUIActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_activityListView;
- (void)_configureActivityListViewWithAvailableActivities:(id)a3;
- (void)_configureActivityView:(id)a3 withLifetimesDescriptionsForActivity:(id)a4;
- (void)_configureEducationCardIfNecessary;
- (void)_dismissHeader;
- (void)_openEditUI:(id)a3;
- (void)_openSetupUI:(id)a3;
- (void)_openURL:(id)a3;
- (void)_setActivityManager:(id)a3;
- (void)_setConfiguringEducationCard:(BOOL)a3;
- (void)_updateAppNameView;
- (void)_updatePreferredContentSize;
- (void)_updateSelectedStateOfActivityControl:(id)a3 activeActivity:(id)a4 lifetimeOfActiveActivity:(id)a5;
- (void)_updateSelectedStateOfActivityViews;
- (void)activityManager:(id)a3 lifetimeDescriptionsDidChangeForActivity:(id)a4;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)checkLockStatus;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshSensorActivityData;
- (void)removeVideoPreview;
- (void)setContentModuleContext:(id)a3;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)startFrameReceiver;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation RPCCUIActivityPickerViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FCUIRegisterLogging();
  }
}

+ (BOOL)isOnboardingEncountered
{
  return 0;
}

+ (BOOL)isOnboardingComplete
{
  return 0;
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v18 = a5;
  id v19 = a7;
  [(RPCCUIActivityPickerViewController *)self loadViewIfNeeded];
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    v21 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    v22 = [v21 activityViews];
    id v20 = [v22 lastObject];
  }
  v23 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  objc_msgSend(v23, "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v20, a6, v19, v16, v15, v14, v13, x, y, width, height);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a6;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    double v16 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    v17 = [v16 activityViews];
    id v15 = [v17 lastObject];
  }
  id v18 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  objc_msgSend(v18, "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v15, a5, v14, x, y, width, height);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)refreshSensorActivityData
{
  contentModuleContext = self->_contentModuleContext;
  if (!contentModuleContext) {
    return;
  }
  v7 = [(CCUIContentModuleContext *)contentModuleContext sensorActivityDataForActiveSensorType:0];
  if (v7)
  {
    id v16 = v7;
    v8 = [v7 displayName];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v8;

    v10 = [v16 bundleIdentifier];
    unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.TelephonyUtilities"];
    if (v11)
    {
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      id v15 = @"com.apple.facetime";
    }
    else
    {
      v2 = [v16 bundleIdentifier];
      id v15 = @"com.apple.facetime";
      if ([v2 isEqualToString:@"com.apple.facetime"])
      {
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
      }
      else
      {
        v3 = [v16 bundleIdentifier];
        if ([v3 isEqualToString:@"com.apple.mediaserverd"])
        {
          int v13 = 0;
          int v14 = 0;
          int v12 = 1;
        }
        else
        {
          v4 = [v16 bundleIdentifier];
          if ([v4 isEqualToString:@"com.apple.avconferenced"])
          {
            int v14 = 0;
            int v12 = 1;
            int v13 = 1;
          }
          else
          {
            id v15 = [v16 bundleIdentifier];
            int v12 = 1;
            int v13 = 1;
            int v14 = 1;
          }
        }
      }
    }
    objc_storeStrong((id *)&self->_applicationBundleID, v15);
    if (v14)
    {

      if (!v13) {
        goto LABEL_12;
      }
    }
    else if (!v13)
    {
LABEL_12:
      if (v12) {
        goto LABEL_13;
      }
      goto LABEL_17;
    }

    if (v12)
    {
LABEL_13:

      if (v11) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_17:
    if (v11)
    {
LABEL_19:

      v7 = v16;
      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);

  [(RPCCUIActivityPickerViewController *)self refreshSensorActivityData];
}

- (RPCCUIActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCUIActivityPickerViewController;
  v4 = [(RPCCUIActivityPickerViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[RPCCActivityManager sharedActivityManager];
    activityManager = v4->_activityManager;
    v4->_activityManager = (RPCCActivityManager *)v5;

    [(RPCCActivityManager *)v4->_activityManager addObserver:v4];
    v4->_footerPinnedToBottom = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(RPCCUIActivityPickerViewController *)self unregisterForTraitChanges:self->_traitRegistration];
  v3.receiver = self;
  v3.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController loadView", v5, 2u);
  }
  v4 = objc_alloc_init(RPCCUIActivityListView);
  [(RPCCUIActivityPickerViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  objc_super v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewDidLoad", (uint8_t *)buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v15 viewDidLoad];
  v4 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  [v4 setFooterPinnedToBottom:self->_footerPinnedToBottom];

  objc_initWeak(buf, self);
  uint64_t v5 = self;
  id v16 = v5;
  v6 = +[NSArray arrayWithObjects:&v16 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_15168;
  v12[3] = &unk_69100;
  objc_copyWeak(&v13, buf);
  v7 = [(RPCCUIActivityPickerViewController *)self registerForTraitChanges:v6 withHandler:v12];
  traitRegistration = self->_traitRegistration;
  self->_traitRegistration = v7;

  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_15228;
  v10[3] = &unk_69128;
  objc_copyWeak(&v11, buf);
  dispatch_async(SerialWithQoS, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)startFrameReceiver
{
  objc_super v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1537C;
  block[3] = &unk_68F10;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)checkLockStatus
{
  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_158E0;
  v4[3] = &unk_69128;
  objc_copyWeak(&v5, &location);
  dispatch_async(SerialWithQoS, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v2 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewWillLayoutSubviews", v3, 2u);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewDidLayoutSubviews", v3, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewWillAppear", (uint8_t *)buf, 2u);
  }
  v20.receiver = self;
  v20.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v20 viewWillAppear:v3];
  v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (!v7)
  {
    objc_super v8 = [(RPCCUIActivityPickerViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    id v11 = [(RPCCUIActivityPickerViewController *)self view];
    [v11 bounds];
    BOOL v13 = v10 < v12;

    int v14 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    [v14 setScrollEnabled:v13];
  }
  [(RPCCUIActivityPickerViewController *)self checkLockStatus];
  +[CMCaptureFrameReceiver addObserver:self forKeyPath:@"availableFrameSenderEndpointsByPID" options:5 context:0];
  [(RPCCActivityManager *)self->_activityManager setLifetimeDescriptionsUpdatingEnabled:1];
  [(RPCCUIActivityPickerViewController *)self activeActivityDidChangeForManager:self->_activityManager];
  frameReceiver = self->_frameReceiver;
  self->_frameReceiver = 0;

  [(RPCCUIActivityPickerViewController *)self refreshSensorActivityData];
  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15D2C;
  block[3] = &unk_69128;
  objc_copyWeak(&v18, buf);
  dispatch_async(SerialWithQoS, block);
  [(RPCCUIActivityPickerViewController *)self startFrameReceiver];
  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)removeVideoPreview
{
  BOOL v3 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  v4 = [v3 headerView];
  [v4 setShouldCreateVideoPreview:0];

  id v5 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  [v5 removeVideoView];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController ViewDidAppear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v6 viewDidAppear:v3];
  [(id)objc_opt_class() _markOnboardingEncountered];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewDidDisappear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)RPCCUIActivityPickerViewController;
  [(RPCCUIActivityPickerViewController *)&v7 viewWillDisappear:v3];
  [(RPCCActivityManager *)self->_activityManager setLifetimeDescriptionsUpdatingEnabled:0];
  [(RPCCUIActivityPickerViewController *)self removeVideoPreview];
  +[CMCaptureFrameReceiver removeObserver:self forKeyPath:@"availableFrameSenderEndpointsByPID"];
  frameReceiver = self->_frameReceiver;
  self->_frameReceiver = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  id v4 = [a3 availableActivities];
  [(RPCCUIActivityPickerViewController *)self _configureActivityListViewWithAvailableActivities:v4];
}

- (void)activityManager:(id)a3 lifetimeDescriptionsDidChangeForActivity:(id)a4
{
  id v5 = a4;
  if (([v5 isPlaceholder] & 1) == 0)
  {
    objc_super v6 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    objc_super v7 = [v6 activityViews];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_161DC;
    v10[3] = &unk_691A0;
    id v8 = v5;
    id v11 = v8;
    double v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v10);

    [(RPCCUIActivityPickerViewController *)self _configureActivityView:v9 withLifetimesDescriptionsForActivity:v8];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a5;
  if (BSEqualStrings())
  {
    id v8 = [v7 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    double v9 = RPCCUILogSelection;
    if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "availableFrameSenderEndpointsByPID changed. endpoints dict: %@", (uint8_t *)&v10, 0xCu);
    }
    [(RPCCUIActivityPickerViewController *)self startFrameReceiver];
  }
}

- (id)_activityListView
{
  v2 = [(RPCCUIActivityPickerViewController *)self view];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_updatePreferredContentSize
{
  if ([(RPCCUIActivityPickerViewController *)self isViewLoaded])
  {
    id v6 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    uint64_t v3 = [(RPCCUIActivityPickerViewController *)self view];
    [v3 bounds];
    objc_msgSend(v6, "sizeThatFits:", v4, v5);
    -[RPCCUIActivityPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)_updateSelectedStateOfActivityControl:(id)a3 activeActivity:(id)a4 lifetimeOfActiveActivity:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    activityManager = self->_activityManager;
    int v10 = [v7 activityIdentifier];
    uint64_t v11 = [(RPCCActivityManager *)activityManager activityWithIdentifier:v10];

    double v26 = self;
    double v12 = [(RPCCActivityManager *)self->_activityManager activeActivities];
    id v13 = [v12 containsObject:v11];

    int v14 = (void *)RPCCUILogSelection;
    if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v15 = v14;
      id v16 = [v7 activityIdentifier];
      *(_DWORD *)buf = 138412802;
      double v34 = v16;
      __int16 v35 = 2112;
      uint64_t v36 = v11;
      __int16 v37 = 1024;
      int v38 = (int)v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "identifier: %@, activity %@ isControlForActiveActivity: %d", buf, 0x1Cu);
    }
    double v27 = (void *)v11;
    [v7 setSelected:v13];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v17 = [v7 menuItemElements];
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (v13)
          {
            double v23 = [v22 representedObjectIdentifier];
            double v24 = [v8 lifetimeIdentifier];
            objc_msgSend(v22, "setSelected:", objc_msgSend(v23, "isEqualToString:", v24));
          }
          else
          {
            [v22 setSelected:0];
          }
          [v22 setSlider:v13];
        }
        id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }

    if (([v7 isPlaceholder] & 1) == 0)
    {
      if (v13)
      {
        double v25 = [(RPCCActivityManager *)v26->_activityManager localizedTerminationDescriptionForActiveActivity];
        [v7 setDetailText:v25];
      }
      else
      {
        [v7 setDetailText:0];
      }
    }
  }
}

- (void)_updateSelectedStateOfActivityViews
{
  uint64_t v3 = [(RPCCActivityManager *)self->_activityManager activeActivity];
  double v4 = [(RPCCActivityManager *)self->_activityManager lifetimeOfActivity:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  id v6 = [v5 activityViews];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        uint64_t v12 = objc_opt_class();
        id v13 = v11;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            int v14 = v13;
          }
          else {
            int v14 = 0;
          }
        }
        else
        {
          int v14 = 0;
        }
        id v15 = v14;

        [(RPCCUIActivityPickerViewController *)self _updateSelectedStateOfActivityControl:v15 activeActivity:v3 lifetimeOfActiveActivity:v4];
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(RPCCUIActivityPickerViewController *)self rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation];
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  double v4 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1697C;
  block[3] = &unk_68F10;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_openEditUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 activitySettingsURL];

  [(RPCCUIActivityPickerViewController *)self _openURL:v8];
}

- (void)_openSetupUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 activitySetupURL];
  }
  else {
  id v8 = +[NSURL dnd_defaultSetupURL];
  }
  [(RPCCUIActivityPickerViewController *)self _openURL:v8];
}

- (void)_dismissHeader
{
  v2 = objc_opt_class();

  _[v2 _markOnboardingComplete];
}

- (BOOL)_isConfiguringEducationCard
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isConfiguringEducationCard = v2->_isConfiguringEducationCard;
  objc_sync_exit(v2);

  return isConfiguringEducationCard;
}

- (void)_setConfiguringEducationCard:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isConfiguringEducationCard = a3;
  objc_sync_exit(obj);
}

- (void)_configureEducationCardIfNecessary
{
  id v3 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  id v4 = [v3 headerView];

  if (!v4)
  {
    [(RPCCUIActivityPickerViewController *)self _setConfiguringEducationCard:1];
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 bundleIdentifier];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v6 stringByAppendingFormat:@"%@.educationCardBaubleDescriptions", v8];
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16ED8;
    block[3] = &unk_69230;
    objc_copyWeak(&v13, &location);
    id v12 = v3;
    dispatch_async(SerialWithQoS, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_updateAppNameView
{
  if ([(RPCCUIActivityPickerViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    if (v3)
    {
      id v11 = (id)v3;
      [(RPCCUIActivityPickerViewController *)self _configureEducationCardIfNecessary];
      id v4 = [(RPCCActivityManager *)self->_activityManager getAppNameString];
      uint64_t v5 = [RPCCUIAddActivityFooterView alloc];
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:v4 value:&stru_69FF8 table:0];
      id v8 = +[UIImage systemImageNamed:@"video.cirle.fill"];
      id v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:0 handler:&stru_69250];
      int v10 = [(RPCCUIAddActivityFooterView *)v5 initWithAction:v9];
      [v11 setAppNameView:v10];
    }
  }
}

- (BOOL)_updateHeaderOrFooterIfNecessary
{
  LODWORD(v3) = [(RPCCUIActivityPickerViewController *)self isViewLoaded];
  if (v3)
  {
    uint64_t v3 = [(RPCCUIActivityPickerViewController *)self _activityListView];
    if (v3)
    {
      id v4 = (void *)v3;
      [(RPCCUIActivityPickerViewController *)self _configureEducationCardIfNecessary];
      uint64_t v5 = [(RPCCActivityManager *)self->_activityManager getUnavailableString];
      id v6 = [RPCCUIAddActivityFooterView alloc];
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:v5 value:&stru_69FF8 table:0];
      id v9 = +[UIAction actionWithTitle:v8 image:0 identifier:@"newFocus" handler:&stru_69270];
      int v10 = [(RPCCUIAddActivityFooterView *)v6 initWithAction:v9];
      [v4 setFooterView:v10];

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_configureActivityView:(id)a3 withLifetimesDescriptionsForActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (([v7 isPlaceholder] & 1) == 0)
  {
    id v8 = [v6 activityUniqueIdentifier];
    id v9 = [v7 activityUniqueIdentifier];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      {
        id v11 = objc_alloc_init((Class)NSMutableArray);
        id v12 = [v7 intensityName];
        if (v12)
        {
          objc_initWeak(&from, v6);
          id v13 = [v7 activityIdentifier];
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_17918;
          v28[3] = &unk_69298;
          objc_copyWeak(&v29, &location);
          objc_copyWeak(&v30, &from);
          int v14 = +[UIAction actionWithTitle:v12 image:0 identifier:v13 handler:v28];

          [v14 setDiscoverabilityTitle:@" \n "];
          [v11 addObject:v14];

          objc_destroyWeak(&v30);
          objc_destroyWeak(&v29);
          objc_destroyWeak(&from);
        }
        if ([v11 count])
        {
          [v6 setMenuItemActions:v11];
          objc_initWeak(&from, v6);
          double v22 = _NSConcreteStackBlock;
          uint64_t v23 = 3221225472;
          double v24 = sub_17A00;
          double v25 = &unk_69298;
          objc_copyWeak(&v26, &from);
          objc_copyWeak(&v27, &location);
          id v15 = +[UIAction actionWithHandler:&v22];
          objc_msgSend(v6, "setOptionsAction:", v15, v22, v23, v24, v25);
          long long v16 = [(RPCCActivityManager *)self->_activityManager activeActivity];
          long long v17 = [(RPCCActivityManager *)self->_activityManager lifetimeOfActivity:v16];
          [(RPCCUIActivityPickerViewController *)self _updateSelectedStateOfActivityControl:v6 activeActivity:v16 lifetimeOfActiveActivity:v17];

          objc_destroyWeak(&v27);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&from);
        }
        else
        {
          long long v18 = [v7 activityLifetimesAlternativeDescription];
          id v19 = [v18 length];

          if (v19)
          {
            uint64_t v20 = [v7 activityLifetimesAlternativeDescription];
            [v6 setMenuAlternativeDescription:v20];
          }
        }
        double v21 = [(RPCCUIActivityPickerViewController *)self view];
        [v21 setNeedsLayout];

        [(RPCCUIActivityPickerViewController *)self rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation];
      }
    }
  }
  objc_destroyWeak(&location);
}

- (void)_configureActivityListViewWithAvailableActivities:(id)a3
{
  id v4 = a3;
  id v19 = [(RPCCUIActivityPickerViewController *)self _activityListView];
  [v19 setAdjustsFontForContentSizeCategory:1];
  objc_initWeak(&location, self);
  id v22 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = [v19 activityViews];
  id v6 = [v5 mutableCopy];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v8);
        uint64_t v28 = 0;
        id v29 = &v28;
        uint64_t v30 = 0x3032000000;
        long long v31 = sub_17FB0;
        double v32 = sub_17FC0;
        id v33 = 0;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_17FC8;
        v27[3] = &unk_692C0;
        v27[4] = v9;
        v27[5] = &v28;
        [v6 enumerateObjectsUsingBlock:v27];
        unsigned int v10 = (void *)v29[5];
        if (v10)
        {
          uint64_t v11 = objc_opt_class();
          id v12 = v10;
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              id v13 = v12;
            }
            else {
              id v13 = 0;
            }
          }
          else
          {
            id v13 = 0;
          }
          int v14 = v13;
        }
        else
        {
          int v14 = [[RPCCUIActivityControl alloc] initWithActivityDescription:v9 style:1];
        }
        if (v29[5])
        {
          [(RPCCUIActivityControl *)v14 setActivityDescription:v9];
          [v6 removeObject:v29[5]];
        }
        objc_initWeak(&from, v14);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_18078;
        v23[3] = &unk_692E8;
        objc_copyWeak(&v24, &from);
        objc_copyWeak(&v25, &location);
        v23[4] = v9;
        id v15 = +[UIAction actionWithHandler:v23];
        [(RPCCUIActivityControl *)v14 setDefaultAction:v15];
        if (([v9 isPlaceholder] & 1) == 0) {
          [(RPCCUIActivityPickerViewController *)self _configureActivityView:v14 withLifetimesDescriptionsForActivity:v9];
        }
        [v22 addObject:v14];
        long long v16 = [(RPCCActivityManager *)self->_activityManager activeActivities];
        unsigned int v17 = [v16 containsObject:v9];

        if (v17)
        {
          long long v18 = [(RPCCUIActivityControl *)v14 menuView];
          [v18 updateMenuItemViewWithState:1];
        }
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&from);

        _Block_object_dispose(&v28, 8);
        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }

  [v19 setActivityViews:v22];
  [(RPCCUIActivityPickerViewController *)self _updateHeaderOrFooterIfNecessary];
  [(RPCCUIActivityPickerViewController *)self _updateSelectedStateOfActivityViews];
  [(RPCCUIActivityPickerViewController *)self _updatePreferredContentSize];
  [(RPCCUIActivityPickerViewController *)self _updateAppNameView];

  objc_destroyWeak(&location);
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  self->_footerPinnedToBottom = a3;
}

- (RPCCActivityManager)_activityManager
{
  return self->_activityManager;
}

- (void)_setActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_frameReceiver, 0);
}

@end