@interface BuddyNavigationFlowController
+ (void)preheat;
- (BFFFlowItem)topFlowItem;
- (BFFFlowStarter)flowStarter;
- (BFFNavigationControllerDelegate)navigationBarUpdater;
- (BOOL)_doesTapFreeSetUpAffectsClass:(Class)a3;
- (BOOL)_hasWiFiControllerInNavigationStack;
- (BOOL)_isFlowItemAllowed:(id)a3;
- (BOOL)_shouldTapFreeSetUpSkipControllerClass:(Class)a3;
- (BOOL)_stackHasOnlyCloudConfigurationItems;
- (BOOL)controllerNeedsToRunForClass:(Class)a3;
- (BOOL)currentlyShowingActivationFlow;
- (BOOL)didInsertWiFiPaneForCloudConfigurationFlow;
- (BOOL)isFlowItem:(id)a3 responsibleForViewController:(id)a4;
- (BOOL)isFlowItemOnTop:(id)a3;
- (BOOL)isStartOverAllowed;
- (BOOL)isTapFreeSetUp;
- (BYAnalyticsManager)analyticsManager;
- (BYEnvironment)environment;
- (BYPreferencesController)buddyPreferences;
- (BuddyFlowCloudConfigDelegate)flowCloudConfigurationDelegate;
- (BuddyFlowDelegate)flowDelegate;
- (BuddyFlowProducer)flowProducer;
- (BuddyLifecycleDelegate)lifecycleDelegate;
- (BuddyNavigationFlowController)initWithNavigationController:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6;
- (BuddyNavigationFlowController)initWithNavigator:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6;
- (BuddyNavigationFlowNavigator)navigator;
- (BuddyRestoreProvider)restoreProvider;
- (BuddyWiFiController)wifiController;
- (NSArray)viewControllersToRemoveOnPush;
- (NSDate)navigationStartDate;
- (NSMutableArray)buddyControllers;
- (NSMutableArray)trailingControllers;
- (NSPointerArray)weakBuddyControllersPrecedingDeviceRestoreChoiceController;
- (NSPointerArray)weakViewControllersPrecedingDeviceRestoreChoiceController;
- (OS_dispatch_queue)navigationQueue;
- (ProximitySetupController)proximitySetupController;
- (UIViewController)topViewControllerForRemoving;
- (id)_createConditionalFlowItemForClass:(Class)a3;
- (id)_createFlowItemForClass:(Class)a3;
- (id)_ensureDeviceProximitySetupControllerWithCompletion:(id)a3;
- (id)_ensureDeviceRestoreChoiceControllerWithCompletion:(id)a3;
- (id)_flowForFlowItem:(id)a3;
- (id)_flowItemFollowingClass:(Class)a3;
- (id)_injectedFlowForClass:(Class)a3;
- (id)_lastNonFlowFlowItemRelativeToFlowItem:(id)a3;
- (id)_popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5;
- (id)_savedItemForClass:(Class)a3;
- (id)_shieldColorForNewTopFlowItemPush;
- (id)_titleForViewController:(id)a3;
- (id)_viewControllerForBuddyController:(id)a3;
- (id)environmentInjector;
- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4;
- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5;
- (id)savedItemForClassBlock;
- (void)_beginEventForNavigationDuration;
- (void)_endEventForNavigationDurationFromFlowItem:(id)a3 toFlowItem:(id)a4;
- (void)_ensureControllerExistsWithTarget:(id)a3 viewControllerInsertionIndexGenerator:(id)a4 buddyControllerInsertionIndexGenerator:(id)a5 withCompletion:(id)a6;
- (void)_flowItemDone:(id)a3 flow:(id)a4 nextItemClass:(Class)a5 nextItem:(id)a6;
- (void)_hideBackButtonIfNecessaryOnFlowItem:(id)a3 withViewController:(id)a4;
- (void)_injectDependencies:(id)a3 withEnvironment:(id)a4;
- (void)_insertWiFiControllerAsFirstPane;
- (void)_performExtendedInitializationForFlowItem:(id)a3 willBegin:(id)a4 withCompletion:(id)a5;
- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6;
- (void)_pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7;
- (void)_resumeNavigationQueue;
- (void)_setupInitialFlowFromInitialFlowItem:(id)a3 debutFlowItemClass:(Class)a4 completion:(id)a5;
- (void)_startDisablingInteractionForExtendedInitialization;
- (void)_stopDisablingInteractionForExtendedInitialization;
- (void)_unmarkFlowItemAsFinished:(id)a3;
- (void)_updateNavigationBackButtonTitleForViewController:(id)a3;
- (void)beginTapFreeSetUp;
- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5;
- (void)flowItemCancelled:(id)a3;
- (void)flowItemDone:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)handleDebugGesture;
- (void)markFlowItemDone:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)presentWiFiPaneForFlow:(id)a3;
- (void)presentWiFiPaneForFlowItem:(id)a3;
- (void)proceedPastAppearancePane;
- (void)proceedPastLanguageLocalePane;
- (void)pushFlowItem:(id)a3 animated:(BOOL)a4;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7;
- (void)removeViewControllerFromNavHierarchy:(id)a3;
- (void)removeViewControllersOnNextPush:(id)a3;
- (void)restartFlow;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyControllers:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDidInsertWiFiPaneForCloudConfigurationFlow:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setFlowCloudConfigurationDelegate:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setFlowProducer:(id)a3;
- (void)setFlowStarter:(id)a3;
- (void)setLifecycleDelegate:(id)a3;
- (void)setNavigationBarUpdater:(id)a3;
- (void)setNavigationQueue:(id)a3;
- (void)setNavigationStartDate:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRestoreProvider:(id)a3;
- (void)setSavedItemForClassBlock:(id)a3;
- (void)setTapFreeSetUp:(BOOL)a3;
- (void)setTopViewControllerForRemoving:(id)a3;
- (void)setTrailingControllers:(id)a3;
- (void)setUpByComputer;
- (void)setViewControllersToRemoveOnPush:(id)a3;
- (void)setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:(id)a3;
- (void)setWeakViewControllersPrecedingDeviceRestoreChoiceController:(id)a3;
- (void)setWifiController:(id)a3;
- (void)setupInitialFlowWithCompletion:(id)a3;
@end

@implementation BuddyNavigationFlowController

+ (void)preheat
{
}

- (BuddyNavigationFlowController)initWithNavigator:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  id v25 = 0;
  objc_storeStrong(&v25, a6);
  id v9 = v29;
  id v29 = 0;
  v24.receiver = v9;
  v24.super_class = (Class)BuddyNavigationFlowController;
  v10 = [(BuddyNavigationFlowController *)&v24 init];
  id v29 = v10;
  objc_storeStrong(&v29, v10);
  if (v10)
  {
    objc_storeStrong((id *)v29 + 10, location[0]);
    [*((id *)v29 + 10) addDelegateObserver:v29];
    v11 = objc_alloc_init(BuddyNavigationBarUpdater);
    v12 = (void *)*((void *)v29 + 12);
    *((void *)v29 + 12) = v11;

    [location[0] addDelegateObserver:*((void *)v29 + 12)];
    objc_storeWeak((id *)v29 + 11, obj);
    id v13 = objc_alloc((Class)BFFFlowStarter);
    id v14 = [v13 initWithFlowDiverter:v26];
    v15 = (void *)*((void *)v29 + 13);
    *((void *)v29 + 13) = v14;

    id v16 = objc_alloc_init((Class)NSMutableArray);
    v17 = (void *)*((void *)v29 + 14);
    *((void *)v29 + 14) = v16;

    id v18 = objc_alloc_init((Class)NSMutableArray);
    v19 = (void *)*((void *)v29 + 20);
    *((void *)v29 + 20) = v18;

    objc_storeStrong((id *)v29 + 19, v25);
    dispatch_queue_t v20 = dispatch_queue_create("Navigation Queue", 0);
    v21 = (void *)*((void *)v29 + 23);
    *((void *)v29 + 23) = v20;

    dispatch_suspend(*((dispatch_object_t *)v29 + 23));
  }
  v22 = (BuddyNavigationFlowController *)v29;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v29, 0);
  return v22;
}

- (BuddyNavigationFlowController)initWithNavigationController:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v9 = [BuddyNavigationFlowNavigator alloc];
  id v13 = [(BuddyNavigationFlowNavigator *)v9 initWithNavigationController:location[0]];
  id v10 = v18;
  id v18 = 0;
  id v18 = [v10 initWithNavigator:v13 usingRestoreProvider:v16 usingFlowDiverter:v15 environment:v14];
  v11 = (BuddyNavigationFlowController *)v18;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

- (void)setupInitialFlowWithCompletion:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc_init(BuddyWiFiController);
  [(BuddyNavigationFlowController *)v23 setWifiController:v3];

  v4 = v23;
  v5 = [(BuddyNavigationFlowController *)v23 wifiController];
  [(BuddyWiFiController *)v5 setDelegate:v4];

  v6 = v23;
  v7 = [(BuddyNavigationFlowController *)v23 wifiController];
  v8 = [(BuddyNavigationFlowController *)v23 environment];
  [(BuddyNavigationFlowController *)v6 _injectDependencies:v7 withEnvironment:v8];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = oslog;
    os_log_type_t v10 = v20;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Preparing flow starter...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v11 = [(BuddyNavigationFlowController *)v23 flowStarter];
  v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = sub_100078188;
  id v16 = &unk_1002B0CD0;
  v17 = v23;
  id v18 = location[0];
  [(BFFFlowStarter *)v11 prepareWithCompletion:&v12];

  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)beginTapFreeSetUp
{
  id v9 = self;
  v8[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self navigationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000786F4;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)proceedPastLanguageLocalePane
{
  id v9 = self;
  v8[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self navigationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_100078AE4;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)proceedPastAppearancePane
{
  id v9 = self;
  v8[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self navigationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_100078D78;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)setUpByComputer
{
  id v9 = self;
  v8[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self navigationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10007900C;
  v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)handleDebugGesture
{
  v2 = [(BuddyNavigationFlowController *)self buddyControllers];
  id v3 = [(NSMutableArray *)v2 lastObject];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(BuddyNavigationFlowController *)self buddyControllers];
    id v6 = [(NSMutableArray *)v5 lastObject];
    [v6 handleDebugGesture];
  }
}

- (BOOL)currentlyShowingActivationFlow
{
  v2 = [(BuddyNavigationFlowController *)self buddyControllers];
  id v3 = [(NSMutableArray *)v2 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isStartOverAllowed
{
  id v18 = self;
  v17[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self buddyControllers];
  v17[0] = [(NSMutableArray *)v2 lastObject];

  if (objc_opt_respondsToSelector() & 1) == 0 || ([v17[0] shouldAllowStartOver])
  {
    int v5 = [(BuddyNavigationFlowController *)v18 navigator];
    id location = [(BuddyNavigationFlowNavigator *)v5 topViewController];

    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([location shouldAllowStartOver] & 1) != 0)
    {
      char v19 = 1;
      int v13 = 1;
    }
    else
    {
      os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v11;
        os_log_type_t v7 = v10;
        sub_10004B24C(v9);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Top view controller does not allow menu", (uint8_t *)v9, 2u);
      }
      objc_storeStrong((id *)&v11, 0);
      char v19 = 0;
      int v13 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = oslog;
      os_log_type_t v4 = v15;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Top flow item does not allow menu", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v19 = 0;
    int v13 = 1;
  }
  objc_storeStrong(v17, 0);
  return v19 & 1;
}

- (BFFFlowItem)topFlowItem
{
  v2 = [(BuddyNavigationFlowController *)self buddyControllers];
  id v3 = [(NSMutableArray *)v2 lastObject];

  return (BFFFlowItem *)v3;
}

- (id)_flowItemFollowingClass:(Class)a3
{
  v42 = self;
  SEL v41 = a2;
  Class v40 = a3;
  id v3 = [(BuddyNavigationFlowController *)self flowProducer];
  id v39 = [(BuddyFlowProducer *)v3 potentialNextFlowItemClassFollowingFlowItemClass:v40];

  if ([v39 conformsToProtocol:&OBJC_PROTOCOL___BFFFlowItem])
  {
    char v38 = [(BuddyNavigationFlowController *)v42 _shouldTapFreeSetUpSkipControllerClass:v39];
    if (v38
      || ((id location = [(BuddyNavigationFlowController *)v42 _createConditionalFlowItemForClass:v39]) == 0? (v36 = 0): (v43 = location, v36 = 1), objc_storeStrong(&location, 0), !v36))
    {
      char v34 = 0;
      unsigned __int8 v4 = 0;
      if (objc_opt_respondsToSelector())
      {
        id v5 = v39;
        v35 = [(BuddyNavigationFlowController *)v42 environment];
        char v34 = 1;
        unsigned __int8 v4 = [v5 isTrailingWithEnvironment:];
      }
      if (v34) {

      }
      if (v4)
      {
        id v33 = [(BuddyNavigationFlowController *)v42 _savedItemForClass:v39];
        id v6 = [(BuddyNavigationFlowController *)v42 trailingControllers];
        [(NSMutableArray *)v6 addObject:v33];

        objc_storeStrong(&v33, 0);
      }
      if ([v39 isEqual:objc_opt_class()])
      {
        os_log_type_t v7 = +[NSPointerArray weakObjectsPointerArray];
        [(BuddyNavigationFlowController *)v42 setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:v7];

        v8 = +[NSPointerArray weakObjectsPointerArray];
        [(BuddyNavigationFlowController *)v42 setWeakViewControllersPrecedingDeviceRestoreChoiceController:v8];

        memset(__b, 0, sizeof(__b));
        id v9 = [(BuddyNavigationFlowController *)v42 buddyControllers];
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:__b objects:v48 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)__b[2];
          do
          {
            for (unint64_t i = 0; i < (unint64_t)v10; ++i)
            {
              if (*(void *)__b[2] != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v32 = *(void *)(__b[1] + 8 * i);
              int v13 = [(BuddyNavigationFlowController *)v42 weakBuddyControllersPrecedingDeviceRestoreChoiceController];
              [(NSPointerArray *)v13 addPointer:v32];
            }
            id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:__b objects:v48 count:16];
          }
          while (v10);
        }

        memset(v29, 0, sizeof(v29));
        int v14 = [(BuddyNavigationFlowController *)v42 navigator];
        id v15 = [(BuddyNavigationFlowNavigator *)v14 viewControllers];

        id v16 = [v15 countByEnumeratingWithState:v29 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v29[2];
          do
          {
            for (unint64_t j = 0; j < (unint64_t)v16; ++j)
            {
              if (*(void *)v29[2] != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v30 = *(void *)(v29[1] + 8 * j);
              char v19 = [(BuddyNavigationFlowController *)v42 weakViewControllersPrecedingDeviceRestoreChoiceController];
              [(NSPointerArray *)v19 addPointer:v30];
            }
            id v16 = [v15 countByEnumeratingWithState:v29 objects:v47 count:16];
          }
          while (v16);
        }

        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          os_log_type_t v20 = [(BuddyNavigationFlowController *)v42 weakBuddyControllersPrecedingDeviceRestoreChoiceController];
          sub_10004B238((uint64_t)buf, (uint64_t)v20);
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, v27, "Skipping DeviceRestoreChoiceController but remembering buddy controllers preceding it: %@", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v21 = [(BuddyNavigationFlowController *)v42 weakViewControllersPrecedingDeviceRestoreChoiceController];
          sub_10004B238((uint64_t)v45, (uint64_t)v21);
          _os_log_debug_impl((void *)&_mh_execute_header, v26, v25, "...and view controllers preceding it: %@", v45, 0xCu);
        }
        objc_storeStrong((id *)&v26, 0);
      }
      id v43 = [(BuddyNavigationFlowController *)v42 _flowItemFollowingClass:v39];
    }
  }
  else
  {
    if (v39)
    {
      os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        sub_10004BB7C((uint64_t)v44, (uint64_t)v39);
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Received a non-flow item class: %{public}@", v44, 0xCu);
      }
      objc_storeStrong((id *)&v24, 0);
    }
    id v43 = 0;
  }
  v22 = v43;

  return v22;
}

- (id)_createConditionalFlowItemForClass:(Class)a3
{
  int v14 = self;
  SEL v13 = a2;
  Class v12 = a3;
  if ([(BuddyNavigationFlowController *)self _shouldTapFreeSetUpSkipControllerClass:a3])
  {
    goto LABEL_9;
  }
  id v3 = [(BuddyNavigationFlowController *)v14 flowStarter];
  unsigned __int8 v4 = [(BFFFlowStarter *)v3 controllerNeedsToRunForClass:v12];

  if ((v4 & 1) == 0) {
    goto LABEL_9;
  }
  id location = [(BuddyNavigationFlowController *)v14 _createFlowItemForClass:v12];
  [location setDelegate:v14];
  id v5 = [(BuddyNavigationFlowController *)v14 flowStarter];
  unsigned __int8 v6 = [(BFFFlowStarter *)v5 controllerNeedsToRunForFlowItem:location];

  if (v6)
  {
    id v15 = location;
    int v9 = 1;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [location controllerWillNotRun];
    }
    int v9 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v9) {
LABEL_9:
  }
    id v15 = 0;
  os_log_type_t v7 = v15;

  return v7;
}

- (id)_createFlowItemForClass:(Class)a3
{
  char v19 = self;
  SEL v18 = a2;
  Class v17 = a3;
  id location = [(BuddyNavigationFlowController *)self _savedItemForClass:a3];
  if (location)
  {
    id v20 = location;
    int v15 = 1;
  }
  else
  {
    if ([(objc_class *)v17 isSubclassOfClass:objc_opt_class()])
    {
      id v3 = [v17 alloc];
      unsigned __int8 v4 = [(BuddyNavigationFlowController *)v19 navigator];
      id v5 = [(BuddyNavigationFlowNavigator *)v4 navigationController];
      unsigned __int8 v6 = [(BuddyNavigationFlowController *)v19 flowStarter];
      id v7 = [(BuddyNavigationFlowController *)v19 environmentInjector];
      id obj = [v3 initWithNavigationController:v5 flowDelegate:v19 flowStarter:v6 dependencyInjector:v7];

      [obj setFlowItemDelegate:v19];
      objc_storeStrong(&location, obj);
      objc_storeStrong(&obj, 0);
    }
    else
    {
      id v8 = objc_alloc_init(v17);
      id v9 = location;
      id location = v8;
    }
    id v10 = [(BuddyNavigationFlowController *)v19 flowProducer];
    [(BuddyFlowProducer *)v10 configureFlowItem:location];

    uint64_t v11 = (uint64_t (**)(id, id))[(BuddyNavigationFlowController *)v19 environmentInjector];
    id v20 = (id)v11[2](v11, location);

    int v15 = 1;
  }
  objc_storeStrong(&location, 0);
  id v12 = v20;

  return v12;
}

- (id)_savedItemForClass:(Class)a3
{
  id v3 = [(BuddyNavigationFlowController *)self savedItemForClassBlock];

  if (v3)
  {
    unsigned __int8 v4 = (uint64_t (**)(id, Class))[(BuddyNavigationFlowController *)self savedItemForClassBlock];
    id v8 = (BuddyWiFiController *)(id)v4[2](v4, a3);
  }
  else if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = [(BuddyNavigationFlowController *)self wifiController];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_doesTapFreeSetUpAffectsClass:(Class)a3
{
  char v3 = objc_opt_respondsToSelector();
  unsigned __int8 v4 = 0;
  if (v3) {
    unsigned __int8 v4 = [(objc_class *)a3 controllerAffectedByTapFreeSetup];
  }
  return v4 & 1;
}

- (BOOL)_shouldTapFreeSetUpSkipControllerClass:(Class)a3
{
  unsigned __int8 v3 = [(BuddyNavigationFlowController *)self isTapFreeSetUp];
  unsigned __int8 v4 = 0;
  if (v3) {
    unsigned __int8 v4 = [(BuddyNavigationFlowController *)self _doesTapFreeSetUpAffectsClass:a3];
  }
  return v4 & 1;
}

- (void)_flowItemDone:(id)a3 flow:(id)a4 nextItemClass:(Class)a5 nextItem:(id)a6
{
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = 0;
  objc_storeStrong(&v48, a4);
  Class v47 = a5;
  id v46 = 0;
  objc_storeStrong(&v46, a6);
  char v45 = 1;
  [(BuddyNavigationFlowController *)v50 markFlowItemDone:location[0]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v46 || v47)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      SEL v13 = [(BuddyNavigationFlowController *)v50 flowCloudConfigurationDelegate];
      [(BuddyFlowCloudConfigDelegate *)v13 setNeedsConfigurationUpdate];
    }
  }
  else
  {
    id v9 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
    unsigned __int8 v10 = [(BuddyLifecycleDelegate *)v9 shouldEndLifecycleForCause:0];

    if (v10)
    {
      char v45 = 0;
      uint64_t v11 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
      [(BuddyLifecycleDelegate *)v11 willEndLifecycleDueToCause:0 allowDismissal:1];

      id v12 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
      [(BuddyLifecycleDelegate *)v12 endLifecycleDueToCause:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([location[0] cdmaSelectionActivation] & 1) != 0)
      {
        char v45 = 0;
        [(BuddyNavigationFlowController *)v50 restartFlow];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [(BuddyNavigationFlowController *)v50 proximitySetupController];
    [(ProximitySetupController *)v14 endAdvertisingProximitySetup];
  }
  if (v45)
  {
    id v44 = v46;
    if (!v44)
    {
      if (v47)
      {
        id v15 = objc_alloc_init(v47);
        id v16 = v44;
        id v44 = v15;

        if (objc_opt_respondsToSelector()) {
          [v44 setDelegate:v50];
        }
      }
      else
      {
        Class v17 = v50;
        uint64_t v18 = objc_opt_class();
        if (!v18) {
          uint64_t v18 = objc_opt_class();
        }
        id v19 = [(BuddyNavigationFlowController *)v17 _flowItemFollowingClass:v18];
        id v20 = v44;
        id v44 = v19;
      }
    }
    v21 = v50;
    v22 = [(BuddyNavigationFlowController *)v50 environment];
    [(BuddyNavigationFlowController *)v21 _injectDependencies:v44 withEnvironment:v22];

    char v42 = 0;
    unsigned __int8 v23 = 0;
    if (!v44)
    {
      id v43 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
      char v42 = 1;
      unsigned __int8 v23 = [v43 shouldEndLifecycleForCause:1];
    }
    if (v42) {

    }
    if (v23)
    {
      BOOL v41 = 0;
      char v24 = objc_opt_respondsToSelector();
      BOOL v25 = 0;
      if (v24) {
        BOOL v25 = [v48 allowedTerminationSources] != 0;
      }
      BOOL v41 = v25;
      BOOL v40 = 0;
      char v26 = objc_opt_respondsToSelector();
      BOOL v27 = 0;
      if (v26) {
        BOOL v27 = [location[0] allowedTerminationSources] != 0;
      }
      BOOL v40 = v27;
      if (!v27)
      {
        if (v41)
        {
          BOOL v39 = ((unint64_t)[v48 allowedTerminationSources] & 1) == 1;
          v28 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
          [(BuddyLifecycleDelegate *)v28 willEndLifecycleDueToCause:1 allowDismissal:v39];
        }
        else
        {
          v28 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
          [(BuddyLifecycleDelegate *)v28 willEndLifecycleDueToCause:1 allowDismissal:1];
        }
      }
      id v29 = [(BuddyNavigationFlowController *)v50 lifecycleDelegate];
      [(BuddyLifecycleDelegate *)v29 endLifecycleDueToCause:1];
    }
    if (![(BuddyNavigationFlowController *)v50 _hasWiFiControllerInNavigationStack]&& [(BuddyNavigationFlowController *)v50 _stackHasOnlyCloudConfigurationItems])
    {
      char v38 = 0;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      char v31 = 1;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        char v31 = objc_opt_isKindOfClass();
      }
      char v38 = v31 & 1;
      if (v31)
      {
        [(BuddyNavigationFlowController *)v50 setDidInsertWiFiPaneForCloudConfigurationFlow:1];
        [(BuddyNavigationFlowController *)v50 _insertWiFiControllerAsFirstPane];
      }
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = (id)objc_opt_class();
      id v34 = (id)objc_opt_class();
      sub_10004CECC((uint64_t)buf, (uint64_t)v35, (uint64_t)v34);
      _os_log_impl((void *)&_mh_execute_header, oslog, v36, "Following flow %{public}@ => %{public}@", buf, 0x16u);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    uint64_t v32 = [(BuddyNavigationFlowController *)v50 navigationStartDate];
    BOOL v33 = v32 == 0;

    if (v33) {
      [(BuddyNavigationFlowController *)v50 _beginEventForNavigationDuration];
    }
    if (v44) {
      [(BuddyNavigationFlowController *)v50 pushFlowItem:v44 inFlow:0 animated:1];
    }
    objc_storeStrong(&v44, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

- (void)_startDisablingInteractionForExtendedInitialization
{
  v49 = self;
  SEL v48 = a2;
  v2 = [(BuddyNavigationFlowController *)self navigator];
  id v3 = [(BuddyNavigationFlowNavigator *)v2 viewControllers];
  char v46 = 0;
  BOOL v4 = 0;
  if (![v3 count])
  {
    id v47 = [(BuddyNavigationFlowController *)v49 buddyControllers];
    char v46 = 1;
    BOOL v4 = [v47 count] == 0;
  }
  if (v46) {

  }
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v44;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Inserting interstitial spinner pane", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id location = [objc_alloc((Class)BFFSpinnerController) initWithSpinnerText:&stru_1002B4E18];
    id v7 = [(BuddyNavigationFlowController *)v49 buddyControllers];
    [(NSMutableArray *)v7 addObject:location];

    id v8 = [(BuddyNavigationFlowController *)v49 navigator];
    [(BuddyNavigationFlowNavigator *)v8 pushViewController:location animated:0];

    objc_storeStrong(&location, 0);
  }
  char v41 = 0;
  char v40 = 0;
  id v9 = [(BuddyNavigationFlowController *)v49 buddyControllers];
  id v10 = [(NSMutableArray *)v9 lastObject];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(BuddyNavigationFlowController *)v49 buddyControllers];
    id v13 = [(NSMutableArray *)v12 lastObject];
    char v41 = [v13 shouldSuppressExtendedInitializationActivityIndicator] & 1;
  }
  int v14 = [(BuddyNavigationFlowController *)v49 navigator];
  id v15 = [(BuddyNavigationFlowNavigator *)v14 viewControllers];
  id v16 = [v15 lastObject];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v18 = [(BuddyNavigationFlowController *)v49 navigator];
    id v19 = [(BuddyNavigationFlowNavigator *)v18 viewControllers];
    id v20 = [v19 lastObject];
    char v40 = [v20 shouldSuppressExtendedInitializationActivityIndicator] & 1;
  }
  char v39 = 0;
  char v21 = 1;
  if ((v41 & 1) == 0) {
    char v21 = v40;
  }
  char v39 = v21;
  if (v21)
  {
    os_log_t v38 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(BuddyNavigationFlowController *)v49 buddyControllers];
      id v36 = [(NSMutableArray *)v22 lastObject];
      sub_10004BB7C((uint64_t)v52, (uint64_t)v36);
      _os_log_impl((void *)&_mh_execute_header, v38, v37, "Will suppress spinner over %{public}@", v52, 0xCu);

      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong((id *)&v38, 0);
  }
  else
  {
    os_log_t v35 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v23 = [(BuddyNavigationFlowController *)v49 buddyControllers];
      id v33 = [(NSMutableArray *)v23 lastObject];
      sub_10004BB7C((uint64_t)v51, (uint64_t)v33);
      _os_log_impl((void *)&_mh_execute_header, v35, v34, "Will NOT suppress spinner over %{public}@", v51, 0xCu);

      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong((id *)&v35, 0);
  }
  if ((v39 & 1) == 0)
  {
    char v24 = [(BuddyNavigationFlowController *)v49 navigator];
    id v25 = [(BuddyNavigationFlowNavigator *)v24 topViewController];
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v25 identifier:@"BuddyNavigationFlowController"];
  }
  os_log_t v32 = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    char v26 = [(BuddyNavigationFlowController *)v49 navigator];
    id v27 = [(BuddyNavigationFlowNavigator *)v26 view];
    id v28 = [v27 window];
    sub_10007AF48((uint64_t)v50, (uint64_t)"-[BuddyNavigationFlowController _startDisablingInteractionForExtendedInitialization]", (uint64_t)v28);
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled NO %p", v50, 0x16u);
  }
  objc_storeStrong((id *)&v32, 0);
  id v29 = [(BuddyNavigationFlowController *)v49 navigator];
  id v30 = [(BuddyNavigationFlowNavigator *)v29 view];
  id v31 = [v30 window];
  [v31 setUserInteractionEnabled:0];
}

- (void)_stopDisablingInteractionForExtendedInitialization
{
  id v9 = self;
  oslog[1] = (os_log_t)a2;
  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"BuddyNavigationFlowController"];
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v2 = [(BuddyNavigationFlowController *)v9 navigator];
    id v3 = [(BuddyNavigationFlowNavigator *)v2 view];
    id v4 = [v3 window];
    sub_10007AF48((uint64_t)buf, (uint64_t)"-[BuddyNavigationFlowController _stopDisablingInteractionForExtendedInitialization]", (uint64_t)v4);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled YES %p", buf, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v5 = [(BuddyNavigationFlowController *)v9 navigator];
  id v6 = [(BuddyNavigationFlowNavigator *)v5 view];
  id v7 = [v6 window];
  [v7 setUserInteractionEnabled:1];
}

- (void)_performExtendedInitializationForFlowItem:(id)a3 willBegin:(id)a4 withCompletion:(id)a5
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  if (objc_opt_respondsToSelector())
  {
    if (v27) {
      (*((void (**)(void))v27 + 2))();
    }
    id v24 = (id)_BYLoggingFacility();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (id)objc_opt_class();
      sub_10004BB7C((uint64_t)buf, (uint64_t)v22);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, v23, "Running extended initialization for %{public}@", buf, 0xCu);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v24, 0);
    id v21 = +[NSDate date];
    v17[0] = 0;
    v17[1] = v17;
    int v18 = 0x20000000;
    int v19 = 32;
    char v20 = 0;
    id v7 = location[0];
    id v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    char v11 = sub_10007B484;
    id v12 = &unk_1002B16B8;
    v16[1] = v17;
    id v13 = location[0];
    id v14 = v21;
    id v15 = v29;
    v16[0] = v26;
    [v7 performExtendedInitializationWithCompletion:&v8];
    objc_storeStrong(v16, 0);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    _Block_object_dispose(v17, 8);
    objc_storeStrong(&v21, 0);
    int v25 = 0;
  }
  else
  {
    if (v26) {
      (*((void (**)(id, uint64_t))v26 + 2))(v26, 1);
    }
    int v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  v91 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v89 = 0;
  objc_storeStrong(&v89, a4);
  BOOL v88 = a5;
  BOOL v87 = a6;
  id v86 = 0;
  objc_storeStrong(&v86, a7);
  if (location[0] && ![(BuddyNavigationFlowController *)v91 _isFlowItemAllowed:location[0]])
  {
    char v11 = [(BuddyNavigationFlowController *)v91 flowProducer];
    id v85 = [(id)objc_opt_class() allowedFlowItems];

    id v12 = location[0];
    id v13 = [(BuddyNavigationFlowController *)v91 flowProducer];
    id v84 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"Attempted to push disallowed flow item (%@) from producer (%@) with %ld allowed flow items: %@", v12, v13, [v85 count], v85);

    id v83 = (id)_BYLoggingFacility();
    os_log_type_t v82 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_FAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v84);
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v83, v82, "%@", buf, 0xCu);
    }
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, 0);
    objc_storeStrong(&v85, 0);
  }
  id v14 = [(BuddyNavigationFlowController *)v91 navigationStartDate];
  BOOL v15 = v14 == 0;

  if (v15) {
    [(BuddyNavigationFlowController *)v91 _beginEventForNavigationDuration];
  }
  id v16 = v91;
  char v17 = [(BuddyNavigationFlowController *)v91 buddyControllers];
  id v18 = [(NSMutableArray *)v17 lastObject];
  id v81 = [(BuddyNavigationFlowController *)v16 _lastNonFlowFlowItemRelativeToFlowItem:v18];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v80 = location[0];
    if (v88)
    {
      int v19 = v91;
      id v20 = location[0];
      v74 = _NSConcreteStackBlock;
      int v75 = -1073741824;
      int v76 = 0;
      v77 = sub_10007C24C;
      v78 = &unk_1002B0D20;
      v79 = v91;
      v63 = _NSConcreteStackBlock;
      int v64 = -1073741824;
      int v65 = 0;
      v66 = sub_10007C278;
      v67 = &unk_1002B16E0;
      id v72 = v86;
      v68 = v91;
      id v69 = v80;
      BOOL v73 = v87;
      id v70 = v89;
      id v71 = location[0];
      [(BuddyNavigationFlowController *)v19 _performExtendedInitializationForFlowItem:v20 willBegin:&v74 withCompletion:&v63];
      objc_storeStrong(&v71, 0);
      objc_storeStrong(&v70, 0);
      objc_storeStrong(&v69, 0);
      objc_storeStrong((id *)&v68, 0);
      objc_storeStrong(&v72, 0);
      objc_storeStrong((id *)&v79, 0);
    }
    else
    {
      if (v86) {
        (*((void (**)(id, uint64_t))v86 + 2))(v86, 1);
      }
      [(BuddyNavigationFlowController *)v91 _endEventForNavigationDurationFromFlowItem:v81 toFlowItem:v80];
      id v21 = [(BuddyNavigationFlowController *)v91 buddyControllers];
      [(NSMutableArray *)v21 addObject:v80];

      [v80 startFlowAnimated:v87];
    }
    objc_storeStrong(&v80, 0);
  }
  else if (v88)
  {
    id v22 = v91;
    id v23 = location[0];
    v57 = _NSConcreteStackBlock;
    int v58 = -1073741824;
    int v59 = 0;
    v60 = sub_10007C338;
    v61 = &unk_1002B0D20;
    v62 = v91;
    id v47 = _NSConcreteStackBlock;
    int v48 = -1073741824;
    int v49 = 0;
    v50 = sub_10007C364;
    v51 = &unk_1002B1708;
    id v55 = v86;
    v52 = v91;
    id v53 = location[0];
    id v54 = v89;
    BOOL v56 = v87;
    [(BuddyNavigationFlowController *)v22 _performExtendedInitializationForFlowItem:v23 willBegin:&v57 withCompletion:&v47];
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong((id *)&v62, 0);
  }
  else
  {
    if (v86) {
      (*((void (**)(id, uint64_t))v86 + 2))(v86, 1);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
    {
      id v24 = location[0];
      int v25 = [(BuddyNavigationFlowController *)v91 navigator];
      id v26 = [(BuddyNavigationFlowNavigator *)v25 navigationController];
      [v24 setNavigationController:v26];
    }
    [(BuddyNavigationFlowController *)v91 _stopDisablingInteractionForExtendedInitialization];
    id v27 = v91;
    id v28 = location[0];
    BOOL v29 = v87;
    char v39 = _NSConcreteStackBlock;
    int v40 = -1073741824;
    int v41 = 0;
    char v42 = sub_10007C408;
    id v43 = &unk_1002B15F0;
    os_log_type_t v44 = v91;
    id v45 = v81;
    id v46 = location[0];
    id v30 = _NSConcreteStackBlock;
    int v31 = -1073741824;
    int v32 = 0;
    id v33 = sub_10007C440;
    os_log_type_t v34 = &unk_1002B1730;
    id v35 = location[0];
    id v36 = v91;
    BOOL v38 = v87;
    id v37 = v89;
    [(BuddyNavigationFlowController *)v27 _presentViewControllerForBuddyController:v28 animated:v29 willPresentViewController:&v39 completion:&v30];
    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong((id *)&v44, 0);
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6
{
  v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v111 = a4;
  id v110 = 0;
  objc_storeStrong(&v110, a5);
  id v109 = 0;
  objc_storeStrong(&v109, a6);
  id v108 = [(BuddyNavigationFlowController *)v113 _viewControllerForBuddyController:location[0]];
  if (v108)
  {
    [(BuddyNavigationFlowController *)v113 _hideBackButtonIfNecessaryOnFlowItem:location[0] withViewController:v108];
    if (v110) {
      (*((void (**)(void))v110 + 2))();
    }
    int v9 = [(BuddyNavigationFlowController *)v113 buddyControllers];
    [(NSMutableArray *)v9 addObject:location[0]];

    char v107 = 0;
    if (objc_opt_respondsToSelector()) {
      char v107 = [location[0] shouldPresentModally] & 1;
    }
    if (v107)
    {
      id v106 = [objc_alloc((Class)BFFNavigationController) initWithRootViewController:v108];
      [v106 setModalPresentationStyle:2];
      +[OBWelcomeController preferredContentSize];
      *(double *)&long long v105 = v10;
      *((double *)&v105 + 1) = v11;
      long long v104 = v105;
      [v106 setForcedPreferredContentSize:v10, v11];
      id v12 = +[BFFStyle sharedStyle];
      [v12 applyThemeToNavigationController:v106];

      id v13 = v113;
      id v14 = [(BuddyNavigationFlowController *)v113 navigator];
      BOOL v15 = [(BuddyNavigationFlowNavigator *)v14 navigationController];
      [(BuddyNavigationFlowController *)v13 navigationController:v15 willShowViewController:v108 operation:1 animated:1];

      id v16 = [(BuddyNavigationFlowController *)v113 navigator];
      id v17 = v106;
      BOOL v18 = v111;
      v96 = _NSConcreteStackBlock;
      int v97 = -1073741824;
      int v98 = 0;
      v99 = sub_10007D42C;
      v100 = &unk_1002B1758;
      v101 = v113;
      id v102 = v108;
      id v103 = v109;
      [(BuddyNavigationFlowNavigator *)v16 presentViewController:v17 animated:v18 completion:&v96];

      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v102, 0);
      objc_storeStrong((id *)&v101, 0);
      objc_storeStrong(&v106, 0);
    }
    else if (v111)
    {
      id v95 = [(BuddyNavigationFlowController *)v113 _shieldColorForNewTopFlowItemPush];
      int v19 = [(BuddyNavigationFlowController *)v113 navigator];
      if (v95)
      {
        BOOL v88 = _NSConcreteStackBlock;
        int v89 = -1073741824;
        int v90 = 0;
        v91 = sub_10007D4D8;
        v92 = &unk_1002B1780;
        id v94 = v109;
        id v93 = v108;
        [(BuddyNavigationFlowNavigator *)v19 pushViewController:v108 usingShieldColor:v95 completion:&v88];

        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
      }
      else
      {
        id v81 = _NSConcreteStackBlock;
        int v82 = -1073741824;
        int v83 = 0;
        id v84 = sub_10007D51C;
        id v85 = &unk_1002B1780;
        id v87 = v109;
        id v86 = v108;
        [(BuddyNavigationFlowNavigator *)v19 pushViewController:v108 completion:&v81];

        objc_storeStrong(&v86, 0);
        objc_storeStrong(&v87, 0);
      }
      objc_storeStrong(&v95, 0);
    }
    else
    {
      id v20 = [(BuddyNavigationFlowController *)v113 navigator];
      [(BuddyNavigationFlowNavigator *)v20 pushViewController:v108 animated:0];

      if (v109) {
        (*((void (**)(id, id))v109 + 2))(v109, v108);
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    char v80 = 0;
    id v21 = [(BuddyNavigationFlowController *)v113 buddyControllers];
    id v22 = [(NSMutableArray *)v21 lastObject];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = [(BuddyNavigationFlowController *)v113 buddyControllers];
      id v25 = [(NSMutableArray *)v24 lastObject];
      char v80 = [v25 shouldSuppressExtendedInitializationActivityIndicator] & 1;
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [(BuddyNavigationFlowController *)v113 buddyControllers];
      id v27 = [(NSMutableArray *)v26 lastObject];
      id v77 = v27;
      if (v80) {
        CFStringRef v28 = @"YEP";
      }
      else {
        CFStringRef v28 = @"NERP";
      }
      sub_10004CECC((uint64_t)buf, (uint64_t)v27, (uint64_t)v28);
      _os_log_impl((void *)&_mh_execute_header, oslog, v78, "Should suppress spinner over %{public}@: %{public}@", buf, 0x16u);

      objc_storeStrong(&v77, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    if ((v80 & 1) == 0)
    {
      BOOL v29 = [(BuddyNavigationFlowController *)v113 navigator];
      id v30 = [(BuddyNavigationFlowNavigator *)v29 topViewController];
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v30 identifier:@"BuddyNavigationFlowController"];
    }
    os_log_t v76 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v75 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      int v31 = [(BuddyNavigationFlowController *)v113 navigator];
      id v32 = [(BuddyNavigationFlowNavigator *)v31 view];
      id v33 = [v32 window];
      sub_10007AF48((uint64_t)v115, (uint64_t)"-[BuddyNavigationFlowController _presentViewControllerForBuddyController:animated:willPresentViewController:completion:]", (uint64_t)v33);
      _os_log_debug_impl((void *)&_mh_execute_header, v76, v75, "%s setUserInteractionEnabled NO %p", v115, 0x16u);
    }
    objc_storeStrong((id *)&v76, 0);
    os_log_type_t v34 = [(BuddyNavigationFlowController *)v113 navigator];
    id v35 = [(BuddyNavigationFlowNavigator *)v34 view];
    id v36 = [v35 window];
    [v36 setUserInteractionEnabled:0];

    v71[0] = 0;
    v71[1] = v71;
    int v72 = 0x20000000;
    int v73 = 32;
    char v74 = 0;
    v67[0] = 0;
    v67[1] = v67;
    int v68 = 0x20000000;
    int v69 = 32;
    char v70 = 0;
    os_log_t v66 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      id v64 = (id)objc_opt_class();
      sub_10004BB7C((uint64_t)v114, (uint64_t)v64);
      _os_log_impl((void *)&_mh_execute_header, v66, v65, "Running hosted view controller creation for %{public}@", v114, 0xCu);
      objc_storeStrong(&v64, 0);
    }
    objc_storeStrong((id *)&v66, 0);
    id v63 = dispatch_semaphore_create(0);
    id v62 = +[NSDate date];
    id v37 = location[0];
    BOOL v38 = [(BuddyNavigationFlowController *)v113 navigator];
    char v39 = [(BuddyNavigationFlowNavigator *)v38 navigationController];
    v51 = _NSConcreteStackBlock;
    int v52 = -1073741824;
    int v53 = 0;
    id v54 = sub_10007D560;
    id v55 = &unk_1002B17A8;
    BOOL v56 = v113;
    v61[1] = v71;
    v61[2] = v67;
    id v57 = v63;
    id v58 = location[0];
    id v59 = v62;
    id v60 = v110;
    v61[0] = v109;
    [v37 presentHostedViewControllerOnNavigationController:v39 completion:&v51];

    if (objc_opt_respondsToSelector())
    {
      int v40 = dispatch_get_global_queue(-2, 0);
      block = _NSConcreteStackBlock;
      int v42 = -1073741824;
      int v43 = 0;
      os_log_type_t v44 = sub_10007D978;
      id v45 = &unk_1002B17F8;
      id v46 = v63;
      id v47 = location[0];
      v50[1] = v67;
      int v48 = v113;
      v50[2] = v71;
      v50[0] = v109;
      id v49 = v108;
      dispatch_async(v40, &block);

      objc_storeStrong(&v49, 0);
      objc_storeStrong(v50, 0);
      objc_storeStrong((id *)&v48, 0);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v46, 0);
    }
    objc_storeStrong(v61, 0);
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong((id *)&v56, 0);
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v63, 0);
    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v71, 8);
  }
  else if (v109)
  {
    (*((void (**)(id, void))v109 + 2))(v109, 0);
  }
  objc_storeStrong(&v108, 0);
  objc_storeStrong(&v109, 0);
  objc_storeStrong(&v110, 0);
  objc_storeStrong(location, 0);
}

- (id)_shieldColorForNewTopFlowItemPush
{
  id location[2] = self;
  location[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self buddyControllers];
  location[0] = [(NSMutableArray *)v2 lastObject];

  char v3 = objc_opt_respondsToSelector();
  unsigned __int8 v4 = 0;
  if (v3) {
    unsigned __int8 v4 = [location[0] hasBlackBackground];
  }
  if (v4) {
    id v8 = +[UIColor blackColor];
  }
  else {
    id v8 = 0;
  }
  objc_storeStrong(location, 0);
  id v5 = v8;

  return v5;
}

- (id)_viewControllerForBuddyController:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [location[0] viewController];
    id v4 = v7;
    id v7 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong(&v7, location[0]);
    }
  }
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)_hideBackButtonIfNecessaryOnFlowItem:(id)a3 withViewController:(id)a4
{
  CFStringRef v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  memset(__b, 0, sizeof(__b));
  id v5 = [(BuddyNavigationFlowController *)v28 buddyControllers];
  id v6 = [(NSMutableArray *)v5 reverseObjectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:__b objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)__b[2];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(v6);
      }
      id obj = *(id *)(__b[1] + 8 * v9);
      id v22 = [(BuddyNavigationFlowController *)v28 _viewControllerForBuddyController:obj];
      char v21 = 0;
      char v10 = objc_opt_respondsToSelector();
      unsigned __int8 v11 = 0;
      if (v10) {
        unsigned __int8 v11 = [obj isEphemeral];
      }
      char v21 = v11 & 1;
      char v20 = 0;
      char v18 = 0;
      unsigned __int8 v12 = 0;
      if (v22)
      {
        id v19 = [(BuddyNavigationFlowController *)v28 viewControllersToRemoveOnPush];
        char v18 = 1;
        unsigned __int8 v12 = [v19 containsObject:v22];
      }
      if (v18) {

      }
      char v20 = v12 & 1;
      if (!v22 || (v21 & 1) != 0 || (v20 & 1) != 0)
      {
        int v17 = 0;
      }
      else
      {
        objc_storeStrong(&v25, obj);
        int v17 = 2;
      }
      objc_storeStrong(&v22, 0);
      if (v17) {
        break;
      }
      if (++v9 >= (unint64_t)v7)
      {
        id v7 = [v6 countByEnumeratingWithState:__b objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    int v17 = 0;
  }

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (id)objc_opt_class();
    sub_10004BB7C((uint64_t)buf, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Considering %{public}@ for back button", buf, 0xCu);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v25
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v25 controllerAllowsNavigatingBack] & 1) == 0)
  {
    id v13 = [v26 navigationItem];
    [v13 setHidesBackButton:1];
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllerFromNavHierarchy:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v8 navigator];
  id v4 = [(BuddyNavigationFlowNavigator *)v3 viewControllers];
  id v6 = [v4 mutableCopy];

  [v6 removeObject:location[0]];
  id v5 = [(BuddyNavigationFlowController *)v8 navigator];
  [(BuddyNavigationFlowNavigator *)v5 setViewControllers:v6 animated:0];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateNavigationBackButtonTitleForViewController:(id)a3
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] navigationItem];
  [v3 setBackButtonDisplayMode:1];

  id v4 = [location[0] navigationItem];
  id v5 = [v4 backButtonTitle];

  if (v5)
  {
LABEL_13:
    int v19 = 0;
    goto LABEL_14;
  }
  id v6 = v22;
  id v7 = [(BuddyNavigationFlowController *)v22 buddyControllers];
  id v8 = [(NSMutableArray *)v7 lastObject];
  id v9 = [(BuddyNavigationFlowController *)v6 _viewControllerForBuddyController:v8];
  id v10 = location[0];

  if (v9 != v10
    || ((unsigned __int8 v11 = [(BuddyNavigationFlowController *)v22 buddyControllers],
         id v20 = [(NSMutableArray *)v11 lastObject],
         v11,
         (objc_opt_respondsToSelector() & 1) == 0)
     || ([v20 isEphemeral] & 1) == 0
      ? (int v19 = 0)
      : (int v19 = 1),
        objc_storeStrong(&v20, 0),
        !v19))
  {
    id v18 = [(BuddyNavigationFlowController *)v22 _titleForViewController:location[0]];
    if (!v18)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v12 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v12);
        sub_10004B238((uint64_t)buf, (uint64_t)v15);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v16, "Unable to determine title for view controller %@", buf, 0xCu);

        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    id v13 = v18;
    id v14 = [location[0] navigationItem];
    [v14 setBackButtonTitle:v13];

    objc_storeStrong(&v18, 0);
    goto LABEL_13;
  }
LABEL_14:
  objc_storeStrong(location, 0);
}

- (id)_titleForViewController:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] title];

  if (v3)
  {
    id v11 = [location[0] title];
    int v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = location[0];
      id v4 = [v8 headerView];
      id v11 = [v4 title];

      int v9 = 1;
      objc_storeStrong(&v8, 0);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = location[0];
        id v11 = [v7 navTitle];
        int v9 = 1;
        objc_storeStrong(&v7, 0);
      }
      else
      {
        id v11 = 0;
        int v9 = 1;
      }
    }
  }
  objc_storeStrong(location, 0);
  id v5 = v11;

  return v5;
}

- (id)_flowForFlowItem:(id)a3
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id v3 = [(BuddyNavigationFlowController *)v17 buddyControllers];
  id v4 = [(NSMutableArray *)v3 reverseObjectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:__b objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)__b[2];
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(v4);
      }
      id v15 = *(id *)(__b[1] + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v15;
        id v8 = [v13 controllers];
        unsigned __int8 v9 = [v8 containsObject:location[0]];

        if (v9)
        {
          id v18 = v13;
          int v12 = 1;
        }
        else
        {
          int v12 = 0;
        }
        objc_storeStrong(&v13, 0);
        if (v12) {
          break;
        }
      }
      if (++v7 >= (unint64_t)v5)
      {
        id v5 = [v4 countByEnumeratingWithState:__b objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    int v12 = 0;
  }

  if (!v12) {
    id v18 = 0;
  }
  objc_storeStrong(location, 0);
  id v10 = v18;

  return v10;
}

- (BOOL)_isFlowItemAllowed:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v7 flowProducer];
  id v5 = [(id)objc_opt_class() allowedFlowItems];

  LOBYTE(v3) = [v5 containsObject:objc_opt_class()];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_lastNonFlowFlowItemRelativeToFlowItem:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v15 buddyControllers];
  id v13 = [(NSMutableArray *)v3 lastObject];

  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v4 = [(BuddyNavigationFlowController *)v15 buddyControllers];
    id v5 = [(NSMutableArray *)v4 firstObject];

    if (v13 == v5)
    {
      objc_storeStrong(&v13, 0);
      break;
    }
    uint64_t v6 = [(BuddyNavigationFlowController *)v15 buddyControllers];
    uint64_t v7 = (char *)[(NSMutableArray *)v6 indexOfObject:v13] - 1;

    id v8 = [(BuddyNavigationFlowController *)v15 buddyControllers];
    id v9 = [(NSMutableArray *)v8 objectAtIndex:v7];
    id v10 = v13;
    id v13 = v9;
  }
  id v11 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)_beginEventForNavigationDuration
{
  v2 = +[NSDate date];
  [(BuddyNavigationFlowController *)self setNavigationStartDate:v2];
}

- (void)_endEventForNavigationDurationFromFlowItem:(id)a3 toFlowItem:(id)a4
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v5 = [(BuddyNavigationFlowController *)v17 navigationStartDate];
  LOBYTE(a4) = v5 == 0;

  if (a4) {
    objc_exception_throw(+[NSException exceptionWithName:@"Attempted to add event for navigation duration without navigation start date" reason:0 userInfo:0]);
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v6);
  if (!v14) {
    objc_storeStrong((id *)&v14, @"(null)");
  }
  uint64_t v7 = [(BuddyNavigationFlowController *)v17 analyticsManager];
  v18[0] = @"startClass";
  v19[0] = v14;
  v18[1] = @"endClass";
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  v19[1] = v9;
  v18[2] = @"duration";
  id v10 = [(BuddyNavigationFlowController *)v17 navigationStartDate];
  [(NSDate *)v10 timeIntervalSinceNow];
  int v12 = +[NSNumber numberWithDouble:-v11];
  v19[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  [(BYAnalyticsManager *)v7 addEvent:@"com.apple.setupassistant.ios.navigation.duration" withPayload:v13 persist:1];

  [(BuddyNavigationFlowController *)v17 setNavigationStartDate:0];
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_resumeNavigationQueue
{
  v2 = [(BuddyNavigationFlowController *)self navigationQueue];
  dispatch_resume((dispatch_object_t)v2);
}

- (void)_setupInitialFlowFromInitialFlowItem:(id)a3 debutFlowItemClass:(Class)a4 completion:(id)a5
{
  int v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v39 = a4;
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v37 = objc_alloc_init((Class)NSMutableArray);
  [v37 addObject:location[0]];
  id v7 = [v37 lastObject];
  uint64_t v36 = objc_opt_class();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = location[0];
    [v35 startFlowWithAllFlowItems];
    id v8 = [v35 controllers];
    [v37 addObjectsFromArray:v8];

    objc_storeStrong(&v35, 0);
  }
  BOOL v34 = objc_opt_class() == (void)v39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  Class v9 = v39;
  if (v9 != (Class)objc_opt_class()) {
    goto LABEL_9;
  }
  id v33 = [(BuddyNavigationFlowController *)v41 _createConditionalFlowItemForClass:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v37 addObject:v33];
    id v32 = [(BuddyNavigationFlowController *)v41 _viewControllerForBuddyController:location[0]];
    [(BuddyNavigationFlowController *)v41 setBuddyControllers:v37];
    id v10 = [(BuddyNavigationFlowController *)v41 navigator];
    id v44 = v32;
    double v11 = +[NSArray arrayWithObjects:&v44 count:1];
    [(BuddyNavigationFlowNavigator *)v10 setViewControllers:v11 animated:0];

    [v33 startFlowAnimated:0];
    (*((void (**)(void))v38 + 2))();
    int v31 = 1;
    objc_storeStrong(&v32, 0);
  }
  else
  {
    int v31 = 0;
  }
  objc_storeStrong(&v33, 0);
  if (!v31)
  {
LABEL_9:
    while (!v34)
    {
      Class v30 = 0;
      int v12 = [(BuddyNavigationFlowController *)v41 flowProducer];
      Class v30 = (Class)[(BuddyFlowProducer *)v12 potentialNextFlowItemClassFollowingFlowItemClass:v36];

      if (!v30)
      {
        BOOL v29 = +[NSString stringWithFormat:@"Unable to find debut flow item (%@)", v39];
        objc_exception_throw(+[NSException exceptionWithName:v29 reason:0 userInfo:0]);
      }
      id v28 = [(BuddyNavigationFlowController *)v41 _createConditionalFlowItemForClass:v30];
      if (v28)
      {
        [v37 addObject:v28];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v28;
          [v26 startFlowWithAllFlowItems];
          id v13 = v37;
          id v14 = [v26 controllers];
          [v13 addObjectsFromArray:v14];

          objc_storeStrong(&v26, 0);
        }
        uint64_t v36 = (uint64_t)v30;
        BOOL v34 = v30 == v39;
        int v31 = 0;
      }
      else
      {
        if (v39 == v30)
        {
          id v27 = +[NSString stringWithFormat:@"Debut flow item (%@) could not be created", v39];
          objc_exception_throw(+[NSException exceptionWithName:v27 reason:0 userInfo:0]);
        }
        uint64_t v36 = (uint64_t)v30;
        int v31 = 2;
      }
      objc_storeStrong(&v28, 0);
    }
    id v25 = objc_alloc_init((Class)NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id v15 = v37;
    id v16 = [v15 countByEnumeratingWithState:__b objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v16; ++i)
        {
          if (*(void *)__b[2] != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void *)(__b[1] + 8 * i);
          int v19 = [(BuddyNavigationFlowController *)v41 buddyControllers];
          [(NSMutableArray *)v19 addObject:v24];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v22 = [(BuddyNavigationFlowController *)v41 _viewControllerForBuddyController:v24];
            if (!v22) {
              objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", +[NSString stringWithFormat:@"No view controller found for flow item (%@) while making our debut", v24], 0, 0));
            }
            [v25 addObject:v22];
            objc_storeStrong(&v22, 0);
          }
        }
        id v16 = [v15 countByEnumeratingWithState:__b objects:v43 count:16];
      }
      while (v16);
    }

    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100051470((uint64_t)buf, (uint64_t)v39, (uint64_t)v37);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Making debut to %@ with the flow items: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BuddyNavigationFlowController *)v41 setBuddyControllers:v37];
    id v20 = [(BuddyNavigationFlowController *)v41 navigator];
    [(BuddyNavigationFlowNavigator *)v20 setViewControllers:v25 animated:0];

    if (v38) {
      (*((void (**)(void))v38 + 2))();
    }
    objc_storeStrong(&v25, 0);
    int v31 = 0;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)_insertWiFiControllerAsFirstPane
{
  id v14 = self;
  location[1] = (id)a2;
  v2 = [(BuddyNavigationFlowController *)self navigator];
  id v3 = [(BuddyNavigationFlowNavigator *)v2 viewControllers];
  location[0] = [v3 mutableCopy];

  id v4 = [(BuddyNavigationFlowController *)v14 wifiController];
  id v5 = [(BuddyWiFiController *)v4 viewController];
  [location[0] insertObject:v5 atIndex:0];

  uint64_t v6 = [(BuddyNavigationFlowController *)v14 wifiController];
  [(BuddyWiFiController *)v6 updateNextButton];

  id v7 = [(BuddyNavigationFlowController *)v14 wifiController];
  id v8 = [(BuddyNavigationFlowController *)v14 navigator];
  Class v9 = [(BuddyNavigationFlowNavigator *)v8 navigationController];
  [(BuddyWiFiController *)v7 setNavigationController:v9];

  id v10 = [(BuddyNavigationFlowController *)v14 buddyControllers];
  double v11 = [(BuddyNavigationFlowController *)v14 wifiController];
  [(NSMutableArray *)v10 insertObject:v11 atIndex:0];

  int v12 = [(BuddyNavigationFlowController *)v14 navigator];
  [(BuddyNavigationFlowNavigator *)v12 setViewControllers:location[0] animated:0];

  objc_storeStrong(location, 0);
}

- (BOOL)_hasWiFiControllerInNavigationStack
{
  id v10 = self;
  __b[9] = a2;
  memset(__b, 0, 0x40uLL);
  v2 = [(BuddyNavigationFlowController *)v10 navigator];
  id v3 = [(BuddyNavigationFlowNavigator *)v2 viewControllers];

  id v4 = [v3 countByEnumeratingWithState:__b objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        void __b[8] = *(void *)(__b[1] + 8 * i);
        sub_10007FA50();
        if (objc_opt_isKindOfClass())
        {
          char v11 = 1;
          int v8 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v12 count:16];
    }
    while (v4);
  }
  int v8 = 0;
LABEL_11:

  if (!v8) {
    char v11 = 0;
  }
  return v11 & 1;
}

- (void)restartFlow
{
  id v46 = self;
  SEL v45 = a2;
  v2 = [(BuddyNavigationFlowController *)self flowDelegate];
  id v3 = [(BuddyNavigationFlowController *)v46 navigator];
  id v4 = [(BuddyNavigationFlowNavigator *)v3 viewControllers];
  id v5 = [v4 firstObject];
  int v6 = [(BuddyFlowDelegate *)v2 willRestartFlowToViewController:v5] & 1;

  if (v6)
  {
    memset(__b, 0, sizeof(__b));
    id v7 = [(BuddyNavigationFlowController *)v46 buddyControllers];
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:__b objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v8; ++i)
        {
          if (*(void *)__b[2] != v9) {
            objc_enumerationMutation(v7);
          }
          id v44 = *(id *)(__b[1] + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v44 startOver];
          }
        }
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:__b objects:v59 count:16];
      }
      while (v8);
    }

    char v11 = [(BuddyNavigationFlowController *)v46 navigator];
    id v12 = [(BuddyNavigationFlowNavigator *)v11 presentedViewController];

    if (v12)
    {
      id v13 = [(BuddyNavigationFlowController *)v46 navigator];
      [(BuddyNavigationFlowNavigator *)v13 dismissViewControllerAnimated:0 completion:0];
    }
    else
    {
      id v14 = [(BuddyNavigationFlowController *)v46 navigator];
      id v15 = [(BuddyNavigationFlowNavigator *)v14 viewControllers];
      id v16 = [v15 count];

      if ((unint64_t)v16 > 1)
      {
        uint64_t v17 = [(BuddyNavigationFlowController *)v46 buddyPreferences];
        [(BYPreferencesController *)v17 reset];
      }
    }
    id v18 = [(BuddyNavigationFlowController *)v46 navigator];
    id v19 = [(BuddyNavigationFlowNavigator *)v18 popToRootViewControllerAnimated:1];

    id v20 = [(BuddyNavigationFlowController *)v46 buddyControllers];
    id v42 = [(NSMutableArray *)v20 objectAtIndexedSubscript:0];

    [v42 setDelegate:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v21 = [(BuddyNavigationFlowController *)v46 buddyControllers];
      id v41 = [(NSMutableArray *)v21 objectAtIndexedSubscript:0];

      id v22 = [(BuddyNavigationFlowController *)v46 buddyControllers];
      id location = [(NSMutableArray *)v22 objectAtIndexedSubscript:1];

      id v23 = [v41 controllers];
      unsigned __int8 v24 = [v23 containsObject:location];

      if (v24)
      {
        [location setDelegate:v41];
        id v25 = [(BuddyNavigationFlowController *)v46 buddyControllers];
        id v26 = [(BuddyNavigationFlowController *)v46 buddyControllers];
        uint64_t v56 = 0;
        uint64_t v55 = 2;
        uint64_t v57 = 0;
        uint64_t v58 = 2;
        os_log_t oslog[2] = (os_log_t)2;
        oslog[1] = 0;
        id v27 = -[NSMutableArray subarrayWithRange:](v26, "subarrayWithRange:", 0, 2);
        [(NSMutableArray *)v25 setArray:v27];
      }
      else
      {
        oslog[0] = (os_log_t)(id)_BYLoggingFacility();
        char v38 = 17;
        if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
        {
          id v28 = oslog[0];
          os_log_type_t v29 = v38;
          sub_10004B24C(buf);
          _os_log_fault_impl((void *)&_mh_execute_header, v28, v29, "Second controller in controllers array is not a flow item belonging to a flow", buf, 2u);
        }
        objc_storeStrong((id *)oslog, 0);
        Class v30 = [(BuddyNavigationFlowController *)v46 buddyControllers];
        int v31 = [(BuddyNavigationFlowController *)v46 buddyControllers];
        uint64_t v52 = 0;
        uint64_t v51 = 1;
        uint64_t v53 = 0;
        uint64_t v54 = 1;
        id v32 = -[NSMutableArray subarrayWithRange:](v31, "subarrayWithRange:", 0, 1);
        [(NSMutableArray *)v30 setArray:v32];
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      id v33 = [(BuddyNavigationFlowController *)v46 buddyControllers];
      BOOL v34 = [(BuddyNavigationFlowController *)v46 buddyControllers];
      uint64_t v48 = 0;
      uint64_t v47 = 1;
      uint64_t v49 = 0;
      uint64_t v50 = 1;
      id v35 = -[NSMutableArray subarrayWithRange:](v34, "subarrayWithRange:", 0, 1, 0, 1);
      [(NSMutableArray *)v33 setArray:v35];
    }
    uint64_t v36 = [(BuddyNavigationFlowController *)v46 flowDelegate];
    [(BuddyFlowDelegate *)v36 didRestartFlow];

    objc_storeStrong(&v42, 0);
  }
}

- (BOOL)_stackHasOnlyCloudConfigurationItems
{
  char v11 = self;
  location[1] = (id)a2;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  location[0] = +[NSArray arrayWithObjects:v14 count:3];
  memset(__b, 0, 0x40uLL);
  v2 = [(BuddyNavigationFlowController *)v11 navigator];
  id v3 = [(BuddyNavigationFlowNavigator *)v2 viewControllers];

  id v4 = [v3 countByEnumeratingWithState:__b objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        void __b[8] = *(void *)(__b[1] + 8 * i);
        if (([location[0] containsObject:objc_opt_class()] & 1) == 0)
        {
          char v12 = 0;
          int v8 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v13 count:16];
    }
    while (v4);
  }
  int v8 = 0;
LABEL_11:

  if (!v8) {
    char v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  id v3 = [(BuddyNavigationFlowController *)self flowStarter];
  unsigned __int8 v4 = [(BFFFlowStarter *)v3 controllerNeedsToRunForClass:a3];

  return v4 & 1;
}

- (void)markFlowItemDone:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Into the pit you shall fall: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = location[0];
  id v4 = +[BuddyNavigationPit shared];
  [v3 setDelegate:v4];

  objc_storeStrong(location, 0);
}

- (void)_unmarkFlowItemAsFinished:(id)a3
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v6, "Rise again chosen flowItem: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(BuddyNavigationFlowController *)v9 _flowForFlowItem:location[0]];
  if (v5)
  {
    id v3 = (BuddyNavigationFlowController *)[v5 delegate];
    id v4 = v9;

    if (v3 != v4) {
      [v5 setDelegate:v9];
    }
    [location[0] setDelegate:v5, v5];
  }
  else
  {
    [location[0] setDelegate:v9];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v8 buddyControllers];
  id v4 = [(NSMutableArray *)v3 lastObject];
  BOOL v5 = v4 == location[0];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyNavigationFlowController *)v5 pushFlowItem:location[0] inFlow:0 animated:1];
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [(BuddyNavigationFlowController *)v9 pushFlowItem:location[0] inFlow:v7 withExtendedInitialization:1 animated:a5];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  [(BuddyNavigationFlowController *)v11 pushFlowItem:location[0] inFlow:v9 withExtendedInitialization:a5 animated:a6 willPushFlowItem:0];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  BOOL v13 = a5;
  BOOL v12 = a6;
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  [(BuddyNavigationFlowController *)v16 _pushFlowItem:location[0] inFlow:v14 withExtendedInitialization:v13 animated:v12 willPushFlowItem:v11];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v10 viewControllersToRemoveOnPush];
  NSUInteger v4 = [(NSArray *)v3 count];

  if (v4)
  {
    BOOL v5 = [(BuddyNavigationFlowController *)v10 viewControllersToRemoveOnPush];
    os_log_type_t v6 = [(NSArray *)v5 arrayByAddingObjectsFromArray:location[0]];
    [(BuddyNavigationFlowController *)v10 setViewControllersToRemoveOnPush:v6];
  }
  else
  {
    [(BuddyNavigationFlowController *)v10 setViewControllersToRemoveOnPush:location[0]];
  }
  id v7 = [(BuddyNavigationFlowController *)v10 navigator];
  id v8 = [(BuddyNavigationFlowNavigator *)v7 topViewController];
  [(BuddyNavigationFlowController *)v10 setTopViewControllerForRemoving:v8];

  objc_storeStrong(location, 0);
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  return [(BuddyNavigationFlowController *)self popToBuddyControllerWithClass:a3 withOffset:0 animated:a4];
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v48 = self;
  SEL v47 = a2;
  Class v46 = a3;
  SEL v45 = (void *)a4;
  BOOL v44 = a5;
  id v37 = _NSConcreteStackBlock;
  int v38 = -1073741824;
  int v39 = 0;
  int v40 = sub_100080F48;
  id v41 = &unk_1002B1820;
  id v42 = self;
  id v43 = objc_retainBlock(&v37);
  if (v45
    || ([(objc_class *)v46 isEqual:objc_opt_class()] & 1) == 0
    || (v36 = 0, BOOL v5 = (uint64_t (**)(id, uint64_t))v43, v6 = objc_opt_class(), (v36 = v5[2](v5, v6) & 1) != 0))
  {
    if (v45 || ([(objc_class *)v46 isEqual:objc_opt_class()] & 1) == 0) {
      goto LABEL_11;
    }
    char v27 = 0;
    id v8 = (uint64_t (**)(id, uint64_t))v43;
    uint64_t v9 = objc_opt_class();
    char v27 = v8[2](v8, v9) & 1;
    id v20 = _NSConcreteStackBlock;
    int v21 = -1073741824;
    int v22 = 0;
    id v23 = sub_1000811D4;
    unsigned __int8 v24 = &unk_1002B0D20;
    id v25 = v48;
    id location = objc_retainBlock(&v20);
    if (v27)
    {
      (*((void (**)(void))location + 2))();
      int v28 = 0;
    }
    else
    {
      id v10 = v48;
      BOOL v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_10008126C;
      id v16 = &unk_1002B1870;
      v18[0] = location;
      uint64_t v17 = v48;
      v18[1] = v46;
      v18[2] = v45;
      BOOL v19 = v44;
      id v49 = [(BuddyNavigationFlowController *)v10 _ensureDeviceProximitySetupControllerWithCompletion:&v13];
      objc_storeStrong((id *)&v17, 0);
      objc_storeStrong(v18, 0);
      int v28 = 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v25, 0);
    if (!v28)
    {
LABEL_11:
      id v49 = -[BuddyNavigationFlowController _popToBuddyControllerWithClass:withOffset:animated:](v48, "_popToBuddyControllerWithClass:withOffset:animated:", v46, v45, v44, v13, v14, v15, v16);
      int v28 = 1;
    }
  }
  else
  {
    id v7 = v48;
    os_log_type_t v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    id v32 = sub_100081180;
    id v33 = &unk_1002B1848;
    v34[0] = v48;
    v34[1] = v46;
    v34[2] = v45;
    BOOL v35 = v44;
    id v49 = [(BuddyNavigationFlowController *)v7 _ensureDeviceRestoreChoiceControllerWithCompletion:&v29];
    objc_storeStrong(v34, 0);
    int v28 = 1;
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong((id *)&v42, 0);
  id v11 = v49;

  return v11;
}

- (id)_popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v19 = self;
  SEL v18 = a2;
  Class v17 = a3;
  unint64_t v16 = a4;
  BOOL v15 = a5;
  BOOL v5 = [(BuddyNavigationFlowController *)self navigator];
  id v14 = [(BuddyNavigationFlowNavigator *)v5 viewControllers];

  for (unint64_t i = (unint64_t)[v14 count] - 1; (i & 0x8000000000000000) == 0; --i)
  {
    id v12 = [v14 objectAtIndexedSubscript:i];
    if (objc_opt_isKindOfClass())
    {
      id location = [v14 objectAtIndexedSubscript:i + v16];
      uint64_t v6 = [(BuddyNavigationFlowController *)v19 navigator];
      id v7 = [(BuddyNavigationFlowNavigator *)v6 popToViewController:location animated:v15];

      id v20 = location;
      int v10 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      int v10 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (v10) {
      goto LABEL_9;
    }
  }
  id v20 = 0;
LABEL_9:
  objc_storeStrong(&v14, 0);
  id v8 = v20;

  return v8;
}

- (id)_ensureDeviceRestoreChoiceControllerWithCompletion:(id)a3
{
  int v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v28->_weakViewControllersPrecedingDeviceRestoreChoiceController
    || !v28->_weakBuddyControllersPrecedingDeviceRestoreChoiceController)
  {
    id v26 = (id)_BYLoggingFacility();
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      id v24 = +[NSThread callStackSymbols];
      sub_10004B238((uint64_t)buf, (uint64_t)v24);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v26, v25, "Cannot insert DeviceRestoreChoiceController. Call stack: %@", buf, 0xCu);

      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v26, 0);
    abort();
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v22;
    sub_10004B24C(v21);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Will insert DeviceRestoreChoiceController", v21, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v20 = [(BuddyNavigationFlowController *)v28 _createFlowItemForClass:objc_opt_class()];
  [v20 setDelegate:v28];
  BOOL v5 = v28;
  id v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  Class v17 = sub_100081770;
  SEL v18 = &unk_1002B1898;
  BOOL v19 = v28;
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_10008196C;
  id v12 = &unk_1002B1898;
  BOOL v13 = v28;
  [(BuddyNavigationFlowController *)v5 _ensureControllerExistsWithTarget:v20 viewControllerInsertionIndexGenerator:&v14 buddyControllerInsertionIndexGenerator:&v8 withCompletion:location[0]];
  id v6 = v20;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)_ensureDeviceProximitySetupControllerWithCompletion:(id)a3
{
  os_log_type_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = (id)_BYLoggingFacility();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v23;
    os_log_type_t v4 = v22;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Will insert ProximitySetupController", buf, 2u);
  }
  objc_storeStrong(&v23, 0);
  id v20 = [(BuddyNavigationFlowController *)v25 _createFlowItemForClass:objc_opt_class()];
  BOOL v5 = v25;
  id v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  Class v17 = sub_100081D38;
  SEL v18 = &unk_1002B1898;
  BOOL v19 = v25;
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100081E54;
  id v12 = &unk_1002B1898;
  BOOL v13 = v25;
  [(BuddyNavigationFlowController *)v5 _ensureControllerExistsWithTarget:v20 viewControllerInsertionIndexGenerator:&v14 buddyControllerInsertionIndexGenerator:&v8 withCompletion:location[0]];
  id v6 = v20;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)_ensureControllerExistsWithTarget:(id)a3 viewControllerInsertionIndexGenerator:(id)a4 buddyControllerInsertionIndexGenerator:(id)a5 withCompletion:(id)a6
{
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = 0;
  objc_storeStrong(&v29, a6);
  [location[0] setDelegate:v33];
  id v28 = objc_retainBlock(&stru_1002B1958);
  int v9 = v33;
  id v10 = location[0];
  os_log_type_t v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  os_log_type_t v25 = sub_1000823B4;
  id v26 = &unk_1002B0D20;
  char v27 = v33;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1000823E0;
  int v15 = &unk_1002B1980;
  int v16 = v33;
  id v17 = location[0];
  id v18 = v31;
  id v19 = v28;
  id v20 = v30;
  id v21 = v29;
  [(BuddyNavigationFlowController *)v9 _performExtendedInitializationForFlowItem:v10 willBegin:&v22 withCompletion:&v11];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Flow finished: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyNavigationFlowController *)v11 _flowItemDone:v9 flow:location[0] nextItemClass:0 nextItem:v8];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowController *)v5 flowDelegate];
  [(BuddyFlowDelegate *)v3 presentWiFiSettingsModally];

  objc_storeStrong(location, 0);
}

- (void)flowItemCancelled:(id)a3
{
  int v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004BB7C((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Cancelling flow item %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyNavigationFlowController *)v15 markFlowItemDone:location[0]];
  id v3 = [(BuddyNavigationFlowController *)v15 navigator];
  id v4 = [(BuddyNavigationFlowNavigator *)v3 presentedViewController];

  if (v4)
  {
    BOOL v5 = [(BuddyNavigationFlowController *)v15 navigator];
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_1000829F8;
    id v10 = &unk_1002B0D20;
    id v11 = v15;
    [(BuddyNavigationFlowNavigator *)v5 dismissViewControllerAnimated:1 completion:&v6];

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyNavigationFlowController *)v4 _flowItemDone:location[0] flow:0 nextItemClass:0 nextItem:0];
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyNavigationFlowController *)v7 _flowItemDone:location[0] flow:0 nextItemClass:0 nextItem:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyNavigationFlowController _flowItemDone:flow:nextItemClass:nextItem:](v6, "_flowItemDone:flow:nextItemClass:nextItem:", location[0], 0, a4, 0, a4);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  sub_10007FA50();
  id v4 = [(BuddyNavigationFlowController *)v3 popToBuddyControllerWithClass:objc_opt_class() animated:1];

  if (!v4)
  {
    [(BuddyNavigationFlowController *)v8 _insertWiFiControllerAsFirstPane];
    id v5 = v8;
    sub_10007FA50();
    id v6 = [(BuddyNavigationFlowController *)v5 popToBuddyControllerWithClass:objc_opt_class() animated:1];
  }
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  int64_t v27 = a5;
  BOOL v26 = a6;
  if (a5 == 1)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (id)objc_opt_class();
      sub_10004BB7C((uint64_t)buf, (uint64_t)v23);
      _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Pushing to %{public}@", buf, 0xCu);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(BuddyNavigationFlowController *)v30 navigator];
      id v10 = [(BuddyNavigationFlowNavigator *)v9 view];
      id v11 = [v10 window];
      sub_10007AF48((uint64_t)v33, (uint64_t)"-[BuddyNavigationFlowController navigationController:willShowViewController:operation:animated:]", (uint64_t)v11);
      _os_log_debug_impl((void *)&_mh_execute_header, v22, v21, "%s setUserInteractionEnabled NO %p", v33, 0x16u);
    }
    objc_storeStrong((id *)&v22, 0);
    os_log_type_t v12 = [(BuddyNavigationFlowController *)v30 navigator];
    id v13 = [(BuddyNavigationFlowNavigator *)v12 view];
    id v14 = [v13 window];
    [v14 setUserInteractionEnabled:0];
  }
  else if (v27 == 2)
  {
    os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (id)objc_opt_class();
      sub_10004BB7C((uint64_t)v32, (uint64_t)v18);
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "Popping to %{public}@", v32, 0xCu);
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong((id *)&v20, 0);
  }
  else
  {
    os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (id)objc_opt_class();
      sub_10007B97C((uint64_t)v31, (uint64_t)v15, v27);
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "Moving to %{public}@ via operation %i", v31, 0x12u);
      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  v206 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v204 = 0;
  objc_storeStrong(&v204, a4);
  int64_t v203 = a5;
  BOOL v202 = a6;
  BOOL v201 = 0;
  id v9 = [(BuddyNavigationFlowController *)v206 wifiController];
  char v199 = 0;
  char v197 = 0;
  char v195 = 0;
  char v193 = 0;
  char v191 = 0;
  char v189 = 0;
  char v187 = 0;
  BOOL v10 = 0;
  if (v9)
  {
    v200 = [(BuddyNavigationFlowController *)v206 wifiController];
    char v199 = 1;
    BOOL v10 = 0;
    if (objc_opt_respondsToSelector())
    {
      v198 = [(BuddyNavigationFlowController *)v206 navigator];
      char v197 = 1;
      id v196 = [(BuddyNavigationFlowNavigator *)v198 topViewController];
      char v195 = 1;
      v194 = [(BuddyNavigationFlowController *)v206 wifiController];
      char v193 = 1;
      id v192 = [(BuddyWiFiController *)v194 viewController];
      char v191 = 1;
      BOOL v10 = 0;
      if (v196 == v192)
      {
        v190 = [(BuddyNavigationFlowController *)v206 navigator];
        char v189 = 1;
        id v188 = [(BuddyNavigationFlowNavigator *)v190 presentedViewController];
        char v187 = 1;
        BOOL v10 = v188 == 0;
      }
    }
  }
  if (v187) {

  }
  if (v189) {
  if (v191)
  }

  if (v193) {
  if (v195)
  }

  if (v197) {
  if (v199)
  }

  BOOL v201 = v10;
  if ([(BuddyNavigationFlowController *)v206 _hasWiFiControllerInNavigationStack]
    && ![(BuddyNavigationFlowController *)v206 didInsertWiFiPaneForCloudConfigurationFlow]&& !v201)
  {
    id v11 = [(BuddyNavigationFlowController *)v206 flowDelegate];
    [(BuddyFlowDelegate *)v11 disableTapFreeSetUp];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v186 = (id)_BYLoggingFacility();
    os_log_type_t v185 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v186, OS_LOG_TYPE_DEFAULT))
    {
      id v184 = [v204 pageID];
      id v183 = [v204 navTitle];
      sub_100084C54((uint64_t)buf, (uint64_t)v184, (uint64_t)v183, (uint64_t)v204, v203);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v186, v185, "Setup showing RUIPage %{public}@ %@ (%p) via operation %i", buf, 0x26u);

      objc_storeStrong(&v183, 0);
      objc_storeStrong(&v184, 0);
    }
    objc_storeStrong(&v186, 0);
  }
  else
  {
    id v182 = (id)_BYLoggingFacility();
    os_log_type_t v181 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v182, OS_LOG_TYPE_DEFAULT))
    {
      id v180 = [(id)objc_opt_class() description];
      sub_100084C8C((uint64_t)v215, (uint64_t)v180, (uint64_t)v204, v203);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v182, v181, "Setup showing controller %{public}@ (%p) via operation %i", v215, 0x1Cu);

      objc_storeStrong(&v180, 0);
    }
    objc_storeStrong(&v182, 0);
  }
  [(BuddyNavigationFlowController *)v206 _updateNavigationBackButtonTitleForViewController:v204];
  uint64_t v179 = 0x7FFFFFFFFFFFFFFFLL;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v12 = i;
    if (v12 >= (unint64_t)[(NSMutableArray *)v206->_buddyControllers count]) {
      break;
    }
    id v177 = [(NSMutableArray *)v206->_buddyControllers objectAtIndexedSubscript:i];
    id v176 = [(BuddyNavigationFlowController *)v206 _viewControllerForBuddyController:v177];
    if (v204 == v176)
    {
      uint64_t v179 = i;
      int v175 = 2;
    }
    else
    {
      int v175 = 0;
    }
    objc_storeStrong(&v176, 0);
    objc_storeStrong(&v177, 0);
    if (v175) {
      break;
    }
  }
  if (v179 == 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v13 = j;
      if (v13 >= (unint64_t)[(NSMutableArray *)v206->_buddyControllers count]) {
        break;
      }
      id v173 = [(NSMutableArray *)v206->_buddyControllers objectAtIndexedSubscript:j];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v173 responsibleForViewController:v204] & 1) != 0)
      {
        uint64_t v179 = j;
        id v172 = (id)_BYLoggingFacility();
        os_log_type_t v171 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v172, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v172;
          os_log_type_t v15 = v171;
          id v16 = v173;
          id v17 = [(id)objc_opt_class() description];
          id v170 = v17;
          sub_100084CB8((uint64_t)v214, (uint64_t)v16, (uint64_t)v17, (uint64_t)v204);
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ claimed responsibility for %{public}@ (%p)", v214, 0x20u);

          objc_storeStrong(&v170, 0);
        }
        objc_storeStrong(&v172, 0);
        int v175 = 5;
      }
      else
      {
        int v175 = 0;
      }
      objc_storeStrong(&v173, 0);
      if (v175)
      {
        if (v175 == 5) {
          break;
        }
LABEL_184:
        __break(1u);
        return;
      }
    }
  }
  if (v203 == 2)
  {
    if (v179 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v18 = [(BuddyNavigationFlowController *)v206 buddyControllers];
      os_log_type_t v19 = (char *)[(NSMutableArray *)v18 count] - 1;

      for (k = v19; ((unint64_t)k & 0x8000000000000000) == 0; --k)
      {
        os_log_t v20 = [(BuddyNavigationFlowController *)v206 buddyControllers];
        id v168 = [(NSMutableArray *)v20 objectAtIndexedSubscript:k];

        id v167 = [(BuddyNavigationFlowController *)v206 _viewControllerForBuddyController:v168];
        os_log_type_t v21 = [(BuddyNavigationFlowController *)v206 navigator];
        id v22 = [(BuddyNavigationFlowNavigator *)v21 viewControllers];
        char v23 = [v22 containsObject:v167] ^ 1;

        if (v23)
        {
          if (objc_opt_respondsToSelector()) {
            [v168 controllerWasPopped];
          }
          os_log_type_t v24 = [(BuddyNavigationFlowController *)v206 buddyControllers];
          [(NSMutableArray *)v24 removeObjectAtIndex:k];

          int v175 = 0;
        }
        else
        {
          int v175 = 8;
        }
        objc_storeStrong(&v167, 0);
        objc_storeStrong(&v168, 0);
        if (v175)
        {
          if (v175 == 8) {
            break;
          }
          goto LABEL_184;
        }
      }
    }
    else
    {
      os_log_type_t v25 = [(BuddyNavigationFlowController *)v206 buddyControllers];
      BOOL v26 = (char *)[(NSMutableArray *)v25 count] - 1;

      for (m = v26; (uint64_t)m > v179; --m)
      {
        int64_t v27 = [(BuddyNavigationFlowController *)v206 buddyControllers];
        id v165 = [(NSMutableArray *)v27 lastObject];

        if (objc_opt_respondsToSelector()) {
          [v165 controllerWasPopped];
        }
        id v28 = [(BuddyNavigationFlowController *)v206 buddyControllers];
        [(NSMutableArray *)v28 removeLastObject];

        objc_storeStrong(&v165, 0);
      }
    }
  }
  if (v203 == 1)
  {
    id v29 = [(BuddyNavigationFlowController *)v206 navigator];
    id v30 = [(BuddyNavigationFlowNavigator *)v29 viewControllers];
    id v164 = [v30 mutableCopy];

    id v163 = (id)objc_opt_new();
    id v31 = [(BuddyNavigationFlowController *)v206 viewControllersToRemoveOnPush];
    char v161 = 0;
    char v159 = 0;
    char v157 = 0;
    unsigned __int8 v32 = 0;
    if ([(NSArray *)v31 count])
    {
      v162 = [(BuddyNavigationFlowController *)v206 navigator];
      char v161 = 1;
      id v160 = [(BuddyNavigationFlowNavigator *)v162 viewControllers];
      char v159 = 1;
      v158 = [(BuddyNavigationFlowController *)v206 topViewControllerForRemoving];
      char v157 = 1;
      unsigned __int8 v32 = [v160 containsObject:];
    }
    if (v157) {

    }
    if (v159) {
    if (v161)
    }

    if (v32)
    {
      id v33 = [(BuddyNavigationFlowController *)v206 viewControllersToRemoveOnPush];
      BOOL v34 = [(BuddyNavigationFlowController *)v206 navigator];
      id v35 = [(BuddyNavigationFlowNavigator *)v34 topViewController];
      unsigned __int8 v36 = [(NSArray *)v33 containsObject:v35];

      char v156 = v36 & 1;
      BOOL v155 = 0;
      id v37 = [(BuddyNavigationFlowController *)v206 navigator];
      id v38 = [(BuddyNavigationFlowNavigator *)v37 presentedViewController];
      objc_opt_class();
      LOBYTE(v35) = objc_opt_isKindOfClass();

      if (v35)
      {
        int v39 = [(BuddyNavigationFlowController *)v206 navigator];
        id v154 = [(BuddyNavigationFlowNavigator *)v39 presentedViewController];

        id v40 = [v154 viewControllers];
        id v41 = [v40 firstObject];
        id v42 = v206;
        id v43 = [(BuddyNavigationFlowController *)v206 buddyControllers];
        id v44 = [(NSMutableArray *)v43 lastObject];
        id v45 = [(BuddyNavigationFlowController *)v42 _viewControllerForBuddyController:v44];
        BOOL v155 = v41 == v45;

        objc_storeStrong(&v154, 0);
      }
      if ((v156 & 1) == 0 || v155)
      {
        id v46 = v163;
        SEL v47 = [(BuddyNavigationFlowController *)v206 viewControllersToRemoveOnPush];
        [v46 addObjectsFromArray:v47];

        [(BuddyNavigationFlowController *)v206 setViewControllersToRemoveOnPush:0];
      }
    }
    else
    {
      [(BuddyNavigationFlowController *)v206 setViewControllersToRemoveOnPush:0];
      [(BuddyNavigationFlowController *)v206 setTopViewControllerForRemoving:0];
    }
    memset(__b, 0, sizeof(__b));
    id v48 = v164;
    id v49 = [v48 countByEnumeratingWithState:__b objects:v213 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)__b[2];
      do
      {
        for (unint64_t n = 0; n < (unint64_t)v49; ++n)
        {
          if (*(void *)__b[2] != v50) {
            objc_enumerationMutation(v48);
          }
          id v153 = *(id *)(__b[1] + 8 * n);
          char v151 = 0;
          char v52 = objc_opt_respondsToSelector();
          unsigned __int8 v53 = 0;
          if (v52) {
            unsigned __int8 v53 = [v153 isEphemeral];
          }
          char v151 = v53 & 1;
          char v149 = 0;
          unsigned __int8 v54 = 0;
          if (v53)
          {
            unsigned __int8 v54 = 0;
            if (v153 != v204)
            {
              id v55 = v153;
              id v150 = [v164 lastObject];
              char v149 = 1;
              BOOL v56 = v55 == v150;
              unsigned __int8 v54 = 0;
              if (!v56) {
                unsigned __int8 v54 = [v164 containsObject:v153];
              }
            }
          }
          if (v149) {

          }
          if (v54) {
            [v163 addObject:v153];
          }
        }
        id v49 = [v48 countByEnumeratingWithState:__b objects:v213 count:16];
      }
      while (v49);
    }

    if ([v163 count])
    {
      id v148 = [v164 mutableCopy];
      [v148 removeObjectsInArray:v163];
      uint64_t v57 = [(BuddyNavigationFlowController *)v206 buddyControllers];
      uint64_t v58 = (char *)[(NSMutableArray *)v57 count] - 1;

      for (iunint64_t i = v58; ((unint64_t)ii & 0x8000000000000000) == 0; --ii)
      {
        id v59 = [(BuddyNavigationFlowController *)v206 buddyControllers];
        id v146 = [(NSMutableArray *)v59 objectAtIndexedSubscript:ii];

        id v145 = [(BuddyNavigationFlowController *)v206 _viewControllerForBuddyController:v146];
        char v144 = 0;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        unsigned __int8 v61 = 1;
        if ((isKindOfClass & 1) == 0) {
          unsigned __int8 v61 = [v163 containsObject:v145];
        }
        char v144 = v61 & 1;
        [(BuddyNavigationFlowController *)v206 _unmarkFlowItemAsFinished:v146];
        if (v144)
        {
          char v143 = 1;
          if (objc_opt_respondsToSelector())
          {
            memset(v141, 0, sizeof(v141));
            id v62 = v148;
            id v63 = [v62 countByEnumeratingWithState:v141 objects:v212 count:16];
            if (v63)
            {
              uint64_t v64 = *(void *)v141[2];
              do
              {
                for (junint64_t j = 0; jj < (unint64_t)v63; ++jj)
                {
                  if (*(void *)v141[2] != v64) {
                    objc_enumerationMutation(v62);
                  }
                  uint64_t v142 = *(void *)(v141[1] + 8 * jj);
                  if ([v146 responsibleForViewController:v142])
                  {
                    char v143 = 0;
                    int v175 = 19;
                    goto LABEL_120;
                  }
                }
                id v63 = [v62 countByEnumeratingWithState:v141 objects:v212 count:16];
              }
              while (v63);
            }
            int v175 = 0;
LABEL_120:

            if (v175)
            {
              if (v175 != 19) {
                goto LABEL_184;
              }
            }
          }
          if (v143)
          {
            id v140 = (id)_BYLoggingFacility();
            os_log_type_t v139 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v140, OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v66 = v140;
              v67 = [(BuddyNavigationFlowController *)v206 buddyControllers];
              id v68 = [(NSMutableArray *)v67 objectAtIndexedSubscript:ii];
              sub_10004B238((uint64_t)v211, (uint64_t)v68);
              _os_log_impl((void *)&_mh_execute_header, v66, v139, "Removing %@ from the controllers list; it is not responsible for any existing view controllers",
                v211,
                0xCu);
            }
            objc_storeStrong(&v140, 0);
            int v69 = [(BuddyNavigationFlowController *)v206 buddyControllers];
            [(NSMutableArray *)v69 removeObjectAtIndex:ii];
          }
        }
        objc_storeStrong(&v145, 0);
        objc_storeStrong(&v146, 0);
      }
      char v70 = [(BuddyNavigationFlowController *)v206 navigator];
      [(BuddyNavigationFlowNavigator *)v70 setViewControllers:v148 animated:0];

      objc_storeStrong(&v148, 0);
    }
    id v71 = v204;
    int v72 = v206;
    int v73 = [(BuddyNavigationFlowController *)v206 buddyControllers];
    id v74 = [(NSMutableArray *)v73 lastObject];
    id v75 = [(BuddyNavigationFlowController *)v72 _viewControllerForBuddyController:v74];

    if (v71 == v75)
    {
      os_log_t v76 = [(BuddyNavigationFlowController *)v206 buddyControllers];
      id v138 = [(NSMutableArray *)v76 lastObject];

      if ((objc_opt_respondsToSelector() & 1) != 0 && [v138 allowedTerminationSources])
      {
        BOOL v137 = ((unint64_t)[v138 allowedTerminationSources] & 1) == 1;
        id v77 = [(BuddyNavigationFlowController *)v206 lifecycleDelegate];
        [(BuddyLifecycleDelegate *)v77 willEndLifecycleDueToCause:1 allowDismissal:v137];
      }
      objc_storeStrong(&v138, 0);
    }
    objc_storeStrong(&v163, 0);
    objc_storeStrong(&v164, 0);
  }
  sub_10007FA50();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v206->_wifiController)
  {
    id v136 = 0;
    id v136 = [(NSMutableArray *)v206->_buddyControllers indexOfObjectPassingTest:&stru_1002B19C0];
    if (v136 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      os_log_type_t v78 = (BuddyWiFiController *)[(NSMutableArray *)v206->_buddyControllers objectAtIndexedSubscript:v136];
      wifiController = v206->_wifiController;
      v206->_wifiController = v78;
    }
  }
  char v80 = [(BuddyNavigationFlowController *)v206 trailingControllers];
  id v81 = [(NSMutableArray *)v80 count];

  if (v81)
  {
    id v135 = objc_alloc_init((Class)NSMutableArray);
    memset(v133, 0, sizeof(v133));
    id v82 = [(NSMutableArray *)v206->_buddyControllers reverseObjectEnumerator];
    id v83 = [v82 countByEnumeratingWithState:v133 objects:v210 count:16];
    if (v83)
    {
      uint64_t v84 = *(void *)v133[2];
      while (2)
      {
        for (unint64_t kk = 0; kk < (unint64_t)v83; ++kk)
        {
          if (*(void *)v133[2] != v84) {
            objc_enumerationMutation(v82);
          }
          uint64_t v134 = *(void *)(v133[1] + 8 * kk);
          if ([v135 count] == (id)1)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v135 insertObject:v134 atIndex:0];
            }
            int v175 = 21;
            goto LABEL_151;
          }
          [v135 addObject:v134];
        }
        id v83 = [v82 countByEnumeratingWithState:v133 objects:v210 count:16];
        if (v83) {
          continue;
        }
        break;
      }
    }
    int v175 = 0;
LABEL_151:

    id v86 = [(BuddyNavigationFlowController *)v206 trailingControllers];
    unsigned int v87 = [(NSMutableArray *)v86 count] - 1;

    for (signed int mm = v87; (mm & 0x80000000) == 0; --mm)
    {
      BOOL v88 = [(BuddyNavigationFlowController *)v206 trailingControllers];
      id v131 = [(NSMutableArray *)v88 objectAtIndexedSubscript:mm];

      if (v131
        && ([(NSMutableArray *)v206->_buddyControllers containsObject:v131] & 1) != 0)
      {
        int v89 = [(BuddyNavigationFlowController *)v206 trailingControllers];
        [(NSMutableArray *)v89 removeObjectAtIndex:mm];
      }
      objc_storeStrong(&v131, 0);
    }
    [(NSMutableArray *)v206->_buddyControllers removeObjectsInArray:v135];
    buddyControllers = v206->_buddyControllers;
    v91 = [(BuddyNavigationFlowController *)v206 trailingControllers];
    [(NSMutableArray *)buddyControllers addObjectsFromArray:v91];

    [(NSMutableArray *)v206->_buddyControllers addObjectsFromArray:v135];
    v92 = [(BuddyNavigationFlowController *)v206 navigator];
    id v93 = [(BuddyNavigationFlowNavigator *)v92 viewControllers];
    id v130 = [v93 mutableCopy];

    id v94 = [(BuddyNavigationFlowController *)v206 navigator];
    id v95 = [(BuddyNavigationFlowNavigator *)v94 viewControllers];
    id v129 = [v95 lastObject];

    [v130 removeLastObject];
    memset(v127, 0, sizeof(v127));
    v96 = [(BuddyNavigationFlowController *)v206 trailingControllers];
    id v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:v127 objects:v209 count:16];
    if (v97)
    {
      uint64_t v98 = *(void *)v127[2];
      do
      {
        for (nunint64_t n = 0; nn < (unint64_t)v97; ++nn)
        {
          if (*(void *)v127[2] != v98) {
            objc_enumerationMutation(v96);
          }
          v128 = *(void **)(v127[1] + 8 * nn);
          id v126 = [(BuddyNavigationFlowController *)v206 _viewControllerForBuddyController:v128];
          if (v126 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v100 = v128;
            v101 = [(BuddyNavigationFlowController *)v206 navigator];
            id v102 = [(BuddyNavigationFlowNavigator *)v101 navigationController];
            [v100 setNavigationController:v102];
          }
          [v130 addObject:v126];
          objc_storeStrong(&v126, 0);
        }
        id v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:v127 objects:v209 count:16];
      }
      while (v97);
    }

    [v130 addObject:v129];
    id v103 = [(BuddyNavigationFlowController *)v206 navigator];
    [(BuddyNavigationFlowNavigator *)v103 setViewControllers:v130 animated:0];

    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v124 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      long long v104 = [(BuddyNavigationFlowController *)v206 trailingControllers];
      id v105 = [(NSMutableArray *)v104 count];
      id v106 = v129;
      char v107 = [(BuddyNavigationFlowController *)v206 trailingControllers];
      sub_10006652C((uint64_t)v208, (uint64_t)v105, (uint64_t)v106, (uint64_t)v107);
      _os_log_impl((void *)&_mh_execute_header, oslog, v124, "Inserting %ld controller(s) before %@: %@", v208, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v108 = [(BuddyNavigationFlowController *)v206 trailingControllers];
    [(NSMutableArray *)v108 removeAllObjects];

    objc_storeStrong(&v129, 0);
    objc_storeStrong(&v130, 0);
    objc_storeStrong(&v135, 0);
  }
  id v109 = [(BuddyNavigationFlowController *)v206 buddyControllers];
  id v110 = [(NSMutableArray *)v109 count];

  if (v110)
  {
    BOOL v111 = [(BuddyNavigationFlowController *)v206 buddyControllers];
    id v123 = [(NSMutableArray *)v111 lastObject];

    id v112 = [(BuddyNavigationFlowController *)v206 _viewControllerForBuddyController:v123];
    id v113 = v204;

    if (v112 == v113)
    {
      v114 = [(BuddyNavigationFlowController *)v206 buddyControllers];
      id v122 = [(NSMutableArray *)v114 lastObject];

      [(BuddyNavigationFlowController *)v206 _unmarkFlowItemAsFinished:v122];
      if (objc_opt_respondsToSelector()) {
        [v122 flowItemDidAppear:v202];
      }
      objc_storeStrong(&v122, 0);
    }
    else if (v203 == 2 {
           && [(BuddyNavigationFlowController *)v206 isFlowItem:v123 responsibleForViewController:v204])
    }
    {
      [(BuddyNavigationFlowController *)v206 _unmarkFlowItemAsFinished:v123];
    }
    objc_storeStrong(&v123, 0);
  }
  if (v203 == 1)
  {
    os_log_t v121 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
    {
      v115 = [(BuddyNavigationFlowController *)v206 navigator];
      id v116 = [(BuddyNavigationFlowNavigator *)v115 view];
      id v117 = [v116 window];
      sub_10007AF48((uint64_t)v207, (uint64_t)"-[BuddyNavigationFlowController navigationController:didShowViewController:operation:animated:]", (uint64_t)v117);
      _os_log_debug_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled YES %p", v207, 0x16u);
    }
    objc_storeStrong((id *)&v121, 0);
    v118 = [(BuddyNavigationFlowController *)v206 navigator];
    id v119 = [(BuddyNavigationFlowNavigator *)v118 view];
    id v120 = [v119 window];
    [v120 setUserInteractionEnabled:1];
  }
  objc_storeStrong(&v204, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isFlowItem:(id)a3 responsibleForViewController:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_opt_class();
  unsigned __int8 v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = 0;
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v5 = [location[0] responsibleForViewController:v7];
    }
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)_injectDependencies:(id)a3 withEnvironment:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v64 = 0;
  objc_storeStrong(&v64, a4);
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BYEnvironmentDependencyReceiver])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([location[0] isViewLoaded])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v62 = OS_LOG_TYPE_FAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        unsigned __int8 v5 = (objc_class *)objc_opt_class();
        id v61 = NSStringFromClass(v5);
        sub_10004B238((uint64_t)buf, (uint64_t)v61);
        _os_log_fault_impl((void *)&_mh_execute_header, oslog, v62, "Precondition failed item cannot be injected as item:(%@)'s loadView has been called", buf, 0xCu);

        objc_storeStrong(&v61, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    id v60 = location[0];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v64 deviceProvider];
      [v60 setDeviceProvider:v6];
    }
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v64 suspendTask];
      [v60 setSuspendTask:v7];
    }
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v64 pendingRestoreState];
      [v60 setPendingRestoreState:v8];
    }
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v64 chronicle];
      [v60 setChronicle:v9];
    }
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v64 miscState];
      [v60 setMiscState:v10];
    }
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v64 proximitySetupController];
      [v60 setProximitySetupController:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v64 proximityAutomatedDeviceEnrollmentController];
      [v60 setProximityAutomatedDeviceEnrollmentController:v12];
    }
    if (objc_opt_respondsToSelector())
    {
      id v13 = [v64 backupDeviceController];
      [v60 setBackupDeviceController:v13];
    }
    if (objc_opt_respondsToSelector())
    {
      id v14 = [v64 systemTimeUpdateManager];
      [v60 setSystemTimeUpdateManager:v14];
    }
    if (objc_opt_respondsToSelector())
    {
      id v15 = [v64 enrollmentCoordinator];
      [v60 setEnrollmentCoordinator:v15];
    }
    if (objc_opt_respondsToSelector())
    {
      id v16 = [v64 menuButtonPressedBlock];
      [v60 setMenuButtonPressedBlock:v16];
    }
    if (objc_opt_respondsToSelector())
    {
      id v17 = [v64 showModalWiFiSettingsBlock];
      [v60 setShowModalWiFiSettingsBlock:v17];
    }
    if (objc_opt_respondsToSelector())
    {
      id v18 = [v64 writeGreenInformedDefaultPlistIfNecessaryBlock];
      [v60 setWriteGreenInformedDefaultPlistIfNecessaryBlock:v18];
    }
    if (objc_opt_respondsToSelector())
    {
      id v19 = [v64 doesRestartFlowCauseEraseBlock];
      [v60 setDoesRestartFlowCauseEraseBlock:v19];
    }
    if (objc_opt_respondsToSelector())
    {
      id v20 = [v64 prepareForCloudRestoreRebootBlock];
      [v60 setPrepareForCloudRestoreRebootBlock:v20];
    }
    if (objc_opt_respondsToSelector())
    {
      id v21 = [v64 exitBuddyForDemoSetUpBlock];
      [v60 setExitBuddyForDemoSetUpBlock:v21];
    }
    if (objc_opt_respondsToSelector())
    {
      id v22 = [v64 prepareForDeviceMigrationBlock];
      [v60 setPrepareForDeviceMigrationBlock:v22];
    }
    if (objc_opt_respondsToSelector())
    {
      id v23 = [v64 startDeviceMigrationBlock];
      [v60 setStartDeviceMigrationBlock:v23];
    }
    if (objc_opt_respondsToSelector())
    {
      id v24 = [v64 existingSettings];
      [v60 setExistingSettings:v24];
    }
    if (objc_opt_respondsToSelector())
    {
      id v25 = [v64 displayZoomExecutor];
      [v60 setDisplayZoomExecutor:v25];
    }
    if (objc_opt_respondsToSelector())
    {
      id v26 = [v64 seedProgramManager];
      [v60 setSeedProgramManager:v26];
    }
    if (objc_opt_respondsToSelector())
    {
      id v27 = [v64 networkProvider];
      [v60 setNetworkProvider:v27];
    }
    if (objc_opt_respondsToSelector())
    {
      id v28 = [v64 buddyPreferences];
      [v60 setBuddyPreferences:v28];
    }
    if (objc_opt_respondsToSelector())
    {
      id v29 = [v64 buddyPreferencesExcludedFromBackup];
      [v60 setBuddyPreferencesExcludedFromBackup:v29];
    }
    if (objc_opt_respondsToSelector())
    {
      id v30 = [v64 setupMethod];
      [v60 setSetupMethod:v30];
    }
    if (objc_opt_respondsToSelector())
    {
      id v31 = [v64 willPerformSoftwareUpdateBlock];
      [v60 setWillPerformSoftwareUpdateBlock:v31];
    }
    if (objc_opt_respondsToSelector())
    {
      id v32 = [v64 betaEnrollmentStateManager];
      [v60 setBetaEnrollmentStateManager:v32];
    }
    if (objc_opt_respondsToSelector())
    {
      id v33 = [v64 capabilities];
      [v60 setCapabilities:v33];
    }
    if (objc_opt_respondsToSelector())
    {
      id v34 = [v64 softwareUpdateCache];
      [v60 setSoftwareUpdateCache:v34];
    }
    if (objc_opt_respondsToSelector())
    {
      id v35 = [v64 settingsManager];
      [v60 setSettingsManager:v35];
    }
    if (objc_opt_respondsToSelector())
    {
      id v36 = [v64 passcodeCacheManager];
      [v60 setPasscodeCacheManager:v36];
    }
    if (objc_opt_respondsToSelector())
    {
      id v37 = [v64 runState];
      [v60 setRunState:v37];
    }
    if (objc_opt_respondsToSelector())
    {
      id v38 = [v64 analyticsManager];
      [v60 setAnalyticsManager:v38];
    }
    if (objc_opt_respondsToSelector())
    {
      id v39 = [v64 paneFeatureAnalyticsManager];
      [v60 setPaneFeatureAnalyticsManager:v39];
    }
    if (objc_opt_respondsToSelector())
    {
      id v40 = [v64 managedConfiguration];
      [v60 setManagedConfiguration:v40];
    }
    if (objc_opt_respondsToSelector())
    {
      id v41 = [v64 activationRecord];
      [v60 setActivationRecord:v41];
    }
    if (objc_opt_respondsToSelector())
    {
      id v42 = [v64 combinedTermsProvider];
      [v60 setCombinedTermsProvider:v42];
    }
    if (objc_opt_respondsToSelector())
    {
      id v43 = [v64 featureFlags];
      [v60 setFeatureFlags:v43];
    }
    if (objc_opt_respondsToSelector())
    {
      id v44 = [v64 buttonMonitor];
      [v60 setButtonMonitor:v44];
    }
    if (objc_opt_respondsToSelector())
    {
      id v45 = [v64 emergencyExecutor];
      [v60 setEmergencyExecutor:v45];
    }
    if (objc_opt_respondsToSelector())
    {
      id v46 = [v64 activationState];
      [v60 setActivationState:v46];
    }
    if (objc_opt_respondsToSelector())
    {
      id v47 = [v64 flowSkipController];
      [v60 setFlowSkipController:v47];
    }
    if (objc_opt_respondsToSelector())
    {
      id v48 = [v64 mdmReturnToServiceController];
      [v60 setMdmReturnToServiceController:v48];
    }
    if (objc_opt_respondsToSelector())
    {
      id v49 = [v64 appearanceModeProvider];
      [v60 setAppearanceModeProvider:v49];
    }
    if (objc_opt_respondsToSelector())
    {
      id v50 = [v64 userDispositionProvider];
      [v60 setUserDispositionProvider:v50];
    }
    if (objc_opt_respondsToSelector())
    {
      id v51 = [v64 deviceConfiguration];
      [v60 setDeviceConfiguration:v51];
    }
    if (objc_opt_respondsToSelector())
    {
      id v52 = [v64 flowItemDispositionProvider];
      [v60 setFlowItemDispositionProvider:v52];
    }
    if (objc_opt_respondsToSelector())
    {
      id v53 = [v64 lockdownModeProvider];
      [v60 setLockdownModeProvider:v53];
    }
    if (objc_opt_respondsToSelector())
    {
      id v54 = [v64 analyticsEventAppearance];
      [v60 setAnalyticsEventAppearance:v54];
    }
    if (objc_opt_respondsToSelector())
    {
      id v55 = [v64 childSetupPresenter];
      [v60 setChildSetupPresenter:v55];
    }
    if (objc_opt_respondsToSelector())
    {
      id v56 = [v64 buddyBackgroundViewController];
      [v60 setBuddyBackgroundViewController:v56];
    }
    if (objc_opt_respondsToSelector())
    {
      id v57 = [v64 intelligenceProvider];
      [v60 setIntelligenceProvider:v57];
    }
    if (objc_opt_respondsToSelector())
    {
      id v58 = [v64 multilingualFlowManager];
      [v60 setMultilingualFlowManager:v58];
    }
    if (objc_opt_respondsToSelector())
    {
      id v59 = [v64 expressSettingsCache];
      [v60 setExpressSettingsCache:v59];
    }
    objc_storeStrong(&v60, 0);
  }
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
}

- (id)_injectedFlowForClass:(Class)a3
{
  id v9 = self;
  SEL v8 = a2;
  Class v7 = a3;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id location = [(BuddyNavigationFlowController *)v9 _createFlowItemForClass:v7];
    id v3 = [(BuddyNavigationFlowController *)v9 environment];
    [(BuddyNavigationFlowController *)v9 _injectDependencies:location withEnvironment:v3];

    id v10 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v10 = 0;
  }
  id v4 = v10;

  return v4;
}

- (id)environmentInjector
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  Class v7 = sub_100085FE0;
  SEL v8 = &unk_1002B19E8;
  objc_copyWeak(&v9, location);
  id v10 = objc_retainBlock(&v4);
  id v2 = objc_retainBlock(v10);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);

  return v2;
}

- (BuddyFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (BuddyFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (BuddyLifecycleDelegate)lifecycleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lifecycleDelegate);

  return (BuddyLifecycleDelegate *)WeakRetained;
}

- (void)setLifecycleDelegate:(id)a3
{
}

- (BuddyFlowCloudConfigDelegate)flowCloudConfigurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowCloudConfigurationDelegate);

  return (BuddyFlowCloudConfigDelegate *)WeakRetained;
}

- (void)setFlowCloudConfigurationDelegate:(id)a3
{
}

- (BuddyFlowProducer)flowProducer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowProducer);

  return (BuddyFlowProducer *)WeakRetained;
}

- (void)setFlowProducer:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyWiFiController)wifiController
{
  return (BuddyWiFiController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiController:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyNavigationFlowNavigator)navigator
{
  return (BuddyNavigationFlowNavigator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigator:(id)a3
{
}

- (BuddyRestoreProvider)restoreProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restoreProvider);

  return (BuddyRestoreProvider *)WeakRetained;
}

- (void)setRestoreProvider:(id)a3
{
}

- (BFFNavigationControllerDelegate)navigationBarUpdater
{
  return self->_navigationBarUpdater;
}

- (void)setNavigationBarUpdater:(id)a3
{
}

- (BFFFlowStarter)flowStarter
{
  return self->_flowStarter;
}

- (void)setFlowStarter:(id)a3
{
}

- (NSMutableArray)buddyControllers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBuddyControllers:(id)a3
{
}

- (NSArray)viewControllersToRemoveOnPush
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setViewControllersToRemoveOnPush:(id)a3
{
}

- (NSPointerArray)weakBuddyControllersPrecedingDeviceRestoreChoiceController
{
  return self->_weakBuddyControllersPrecedingDeviceRestoreChoiceController;
}

- (void)setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:(id)a3
{
}

- (NSPointerArray)weakViewControllersPrecedingDeviceRestoreChoiceController
{
  return self->_weakViewControllersPrecedingDeviceRestoreChoiceController;
}

- (void)setWeakViewControllersPrecedingDeviceRestoreChoiceController:(id)a3
{
}

- (UIViewController)topViewControllerForRemoving
{
  return (UIViewController *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTopViewControllerForRemoving:(id)a3
{
}

- (BOOL)isTapFreeSetUp
{
  return self->_tapFreeSetUp;
}

- (void)setTapFreeSetUp:(BOOL)a3
{
  self->_tapFreeSetUp = a3;
}

- (BOOL)didInsertWiFiPaneForCloudConfigurationFlow
{
  return self->_didInsertWiFiPaneForCloudConfigurationFlow;
}

- (void)setDidInsertWiFiPaneForCloudConfigurationFlow:(BOOL)a3
{
  self->_didInsertWiFiPaneForCloudConfigurationFlow = a3;
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableArray)trailingControllers
{
  return self->_trailingControllers;
}

- (void)setTrailingControllers:(id)a3
{
}

- (id)savedItemForClassBlock
{
  return self->_savedItemForClassBlock;
}

- (void)setSavedItemForClassBlock:(id)a3
{
}

- (NSDate)navigationStartDate
{
  return self->_navigationStartDate;
}

- (void)setNavigationStartDate:(id)a3
{
}

- (OS_dispatch_queue)navigationQueue
{
  return self->_navigationQueue;
}

- (void)setNavigationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end