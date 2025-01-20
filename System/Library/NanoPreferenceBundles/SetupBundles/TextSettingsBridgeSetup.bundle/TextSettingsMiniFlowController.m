@interface TextSettingsMiniFlowController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (AXDispatchTimer)controllerHoldTimeoutTimer;
- (BOOL)controllerIsOnHold;
- (BOOL)holdBeforeDisplaying;
- (BOOL)receivedCachedScreenshots;
- (OS_dispatch_queue)idsServicesQueue;
- (TextSettingsMiniFlowController)init;
- (TextSettingsViewController)textSettingsViewController;
- (id)viewController;
- (void)dealloc;
- (void)didReceiveIncomingData:(id)a3;
- (void)didSelectContentSizeCategory:(id)a3 boldTextEnabled:(BOOL)a4;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
- (void)setControllerHoldTimeoutTimer:(id)a3;
- (void)setControllerIsOnHold:(BOOL)a3;
- (void)setIdsServicesQueue:(id)a3;
- (void)setReceivedCachedScreenshots:(BOOL)a3;
- (void)setTextSettingsViewController:(id)a3;
@end

@implementation TextSettingsMiniFlowController

- (TextSettingsMiniFlowController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TextSettingsMiniFlowController;
  v2 = [(TextSettingsMiniFlowController *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.ids.services.queue", v3);
    [(TextSettingsMiniFlowController *)v2 setIdsServicesQueue:v4];

    id v5 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(TextSettingsMiniFlowController *)v2 setControllerHoldTimeoutTimer:v5];

    v6 = +[AXIDSServices sharedInstance];
    [v6 registerForIncomingData:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[AXIDSServices sharedInstance];
  [v3 deregisterForIncomingData:self];

  v4.receiver = self;
  v4.super_class = (Class)TextSettingsMiniFlowController;
  [(TextSettingsMiniFlowController *)&v4 dealloc];
}

+ (BOOL)controllerNeedsToRun
{
  v2 = getActiveDevice();
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B4FBD189-BF37-4C38-A2C3-A0471795086C"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = getWatchContentSize(v3);
  BOOL v5 = boldTextKeyExistsOnDevice(v3);

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)holdBeforeDisplaying
{
  unsigned __int8 v3 = [(TextSettingsMiniFlowController *)self receivedCachedScreenshots];
  if ((v3 & 1) == 0 && ![(TextSettingsMiniFlowController *)self controllerIsOnHold])
  {
    [(TextSettingsMiniFlowController *)self setControllerIsOnHold:1];
    objc_initWeak(&location, self);
    unsigned __int8 v4 = [(TextSettingsMiniFlowController *)self controllerHoldTimeoutTimer];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = __54__TextSettingsMiniFlowController_holdBeforeDisplaying__block_invoke;
    v10 = &unk_C430;
    objc_copyWeak(&v11, &location);
    [v4 afterDelay:&v7 processBlock:30.0];

    BOOL v5 = [(TextSettingsMiniFlowController *)self idsServicesQueue];
    dispatch_async(v5, &__block_literal_global);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3 ^ 1;
}

void __54__TextSettingsMiniFlowController_holdBeforeDisplaying__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  [v3 buddyControllerReleaseHoldAndSkip:v4];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setControllerIsOnHold:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setReceivedCachedScreenshots:0];
}

void __54__TextSettingsMiniFlowController_holdBeforeDisplaying__block_invoke_2(id a1)
{
  id v2 = +[AXIDSServices sharedInstance];
  id v1 = [v2 publishMessage:&off_C828 priority:2 requestingResponse:1];
}

- (id)viewController
{
  unsigned __int8 v3 = [(TextSettingsMiniFlowController *)self textSettingsViewController];

  if (!v3)
  {
    id v4 = [(TextSettingsMiniFlowController *)self delegate];
    id v5 = [v4 activePairingDevice];

    id v6 = [[TextSettingsViewController alloc] initWithDevice:v5 observer:self];
    [(TextSettingsMiniFlowController *)self setTextSettingsViewController:v6];

    v7 = [(TextSettingsMiniFlowController *)self textSettingsViewController];
    [v7 setMiniFlowDelegate:self];
  }

  return [(TextSettingsMiniFlowController *)self textSettingsViewController];
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(TextSettingsMiniFlowController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  id v5 = objc_alloc_init(a4);
  [v5 setMiniFlowDelegate:self];
  [(TextSettingsMiniFlowController *)self pushController:v5 animated:1];
}

- (void)didReceiveIncomingData:(id)a3
{
  id v4 = a3;
  id v5 = [(TextSettingsMiniFlowController *)self controllerHoldTimeoutTimer];
  [v5 cancel];

  id v6 = [(TextSettingsMiniFlowController *)self idsServicesQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __57__TextSettingsMiniFlowController_didReceiveIncomingData___block_invoke;
  v8[3] = &unk_C408;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __57__TextSettingsMiniFlowController_didReceiveIncomingData___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) objectForKeyedSubscript:AXIDSServiceDataKey];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  id v28 = 0;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v1 error:&v28];
  id v7 = v28;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v7;
    v21 = v6;
    v22 = v5;
    v23 = v1;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v14 = [v8 objectForKeyedSubscript:v13];
          v15 = [v14 objectForKeyedSubscript:&__kCFBooleanFalse];
          v16 = +[UIImage imageWithData:v15];

          v17 = [v8 objectForKeyedSubscript:v13];
          v18 = [v17 objectForKeyedSubscript:&__kCFBooleanTrue];
          v19 = +[UIImage imageWithData:v18];

          cacheTextPreviewImage(v16, v13, 0);
          cacheTextPreviewImage(v19, v13, 1);
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    AXPerformBlockOnMainThread();
    id v1 = v23;
    id v6 = v21;
    id v5 = v22;
    id v7 = v20;
  }
}

void __57__TextSettingsMiniFlowController_didReceiveIncomingData___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setReceivedCachedScreenshots:1];
  uint64_t v2 = [*(id *)(a1 + 32) textSettingsViewController];
  [v2 updateWatchScreenImageViewAndNotifyObserver:0];

  if ([*(id *)(a1 + 32) controllerIsOnHold])
  {
    [*(id *)(a1 + 32) setControllerIsOnHold:0];
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 buddyControllerReleaseHold:*(void *)(a1 + 32)];
  }
}

- (void)didSelectContentSizeCategory:(id)a3 boldTextEnabled:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(TextSettingsMiniFlowController *)self idsServicesQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __79__TextSettingsMiniFlowController_didSelectContentSizeCategory_boldTextEnabled___block_invoke;
  v9[3] = &unk_C4C0;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __79__TextSettingsMiniFlowController_didSelectContentSizeCategory_boldTextEnabled___block_invoke(uint64_t a1)
{
  CFStringRef v9 = @"updateUI";
  uint64_t v1 = *(void *)(a1 + 32);
  v7[1] = @"boldTextEnabled";
  v8[0] = v1;
  v7[0] = @"contentSizeCategory";
  uint64_t v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v10 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v5 = +[AXIDSServices sharedInstance];
  id v6 = [v5 publishMessage:v4 priority:2 requestingResponse:0];
}

- (TextSettingsViewController)textSettingsViewController
{
  return self->_textSettingsViewController;
}

- (void)setTextSettingsViewController:(id)a3
{
}

- (AXDispatchTimer)controllerHoldTimeoutTimer
{
  return self->_controllerHoldTimeoutTimer;
}

- (void)setControllerHoldTimeoutTimer:(id)a3
{
}

- (OS_dispatch_queue)idsServicesQueue
{
  return self->_idsServicesQueue;
}

- (void)setIdsServicesQueue:(id)a3
{
}

- (BOOL)controllerIsOnHold
{
  return self->_controllerIsOnHold;
}

- (void)setControllerIsOnHold:(BOOL)a3
{
  self->_controllerIsOnHold = a3;
}

- (BOOL)receivedCachedScreenshots
{
  return self->_receivedCachedScreenshots;
}

- (void)setReceivedCachedScreenshots:(BOOL)a3
{
  self->_receivedCachedScreenshots = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsServicesQueue, 0);
  objc_storeStrong((id *)&self->_controllerHoldTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_textSettingsViewController, 0);
}

@end