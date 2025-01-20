@interface GCAnalytics
+ (id)instance;
- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4;
- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4;
- (GCAnalytics)init;
- (id)getBundleID;
- (void)checkMultipleControllers;
- (void)dealloc;
- (void)onSiriMotionEnabled;
- (void)publishController:(id)a3;
- (void)runInputPollTimer;
- (void)sendEvent:(id)a3 withPayload:(id)a4;
- (void)sendEvent:(id)a3 withXPCPayload:(id)a4;
- (void)sendHapticsClientDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalPlayers:(int)a5 sessionTotalDuration:(int)a6 sessionActiveDuration:(int)a7 terminationReason:(id)a8;
- (void)sendHapticsEngineCreatedEventForBundleID:(id)a3 productCategory:(id)a4 hapticsLocality:(id)a5;
- (void)sendHapticsErrorRaisedEventFromSource:(id)a3 productCategory:(id)a4 errorType:(id)a5;
- (void)sendHapticsPlayerDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalEventsProcessed:(int)a5 transientEventsProcessed:(int)a6 continuousEventsProcessed:(int)a7 parameterCurvesProcessed:(int)a8 sessionTotalDuration:(int)a9 sessionActiveDuration:(int)a10;
- (void)sendInputsPressedEvent:(id *)a3;
- (void)sendRPKitInstantCaptureBufferStartedEventForBundleID:(id)a3;
- (void)sendRPKitInstantCaptureSavedEventForBundleID:(id)a3 productCategory:(id)a4;
- (void)sendRPKitManualRecordingSavedEventForBundleID:(id)a3 productCategory:(id)a4 duration:(int)a5;
- (void)sendRPKitScreenshotSavedEventForBundleID:(id)a3 productCategory:(id)a4;
- (void)sendSettingsButtonCustomizedEventForBundleID:(id)a3 productCategory:(id)a4 button:(id)a5;
- (void)sendSettingsCustomizationsResetEventForBundleID:(id)a3 productCategory:(id)a4;
- (void)sendSettingsCustomizationsToggledEventForBundleID:(id)a3 productCategory:(id)a4 toggledOn:(BOOL)a5;
- (void)sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount:(int)a3;
- (void)sendSettingsDevicesEventForTotalCustomizedControllersCount:(int)a3;
- (void)sendSettingsEnteredEvent;
- (void)sendSettingsIdentifyControllerEventForProductCategory:(id)a3;
- (void)sendSettingsRPKitGesturesCustomized:(id)a3 from:(id)a4;
- (void)unpublishController:(id)a3;
@end

@implementation GCAnalytics

+ (id)instance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__GCAnalytics_GameController__instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher != -1) {
    dispatch_once(&instance_dispatcher, block);
  }
  v2 = (void *)instance_sharedInstance;

  return v2;
}

void __39__GCAnalytics_GameController__instance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance_sharedInstance;
  instance_sharedInstance = (uint64_t)v1;
}

- (id)getBundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 bundleIdentifier];
    v6 = self->_bundleID;
    self->_bundleID = v5;

    bundleID = self->_bundleID;
    if (!bundleID)
    {
      v7 = +[NSProcessInfo processInfo];
      v8 = [v7 processName];
      v9 = self->_bundleID;
      self->_bundleID = v8;

      bundleID = self->_bundleID;
    }
  }

  return bundleID;
}

- (void)dealloc
{
  [(NSTimer *)self->_eventPollTimer invalidate];
  eventPollTimer = self->_eventPollTimer;
  self->_eventPollTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)GCAnalytics;
  [(GCAnalytics *)&v4 dealloc];
}

- (void)sendInputsPressedEvent:(id *)a3
{
}

id __54__GCAnalytics_GameController__sendInputsPressedEvent___block_invoke(uint64_t a1)
{
  v7 = @"bundleID";
  v2 = [*(id *)(a1 + 32) getBundleID];
  v8 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  objc_super v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  v5 = convertToDict(*(unsigned int **)(a1 + 40), (void (*)(void))numberFromInt);
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

- (void)checkMultipleControllers
{
  if (checkMultipleControllers_maximumControllersConnectedForSentEvent <= 3)
  {
    id v3 = objc_alloc_init((Class)&off_26D2B4AE0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v4 = [(NSMutableDictionary *)self->_controllersData allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v10 isATVRemote] & 1) == 0)
          {
            ++v7;
            v11 = [v10 detailedProductCategory];
            [v3 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      int v7 = 0;
    }

    [v3 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
    if (v7 >= 2 && v7 > checkMultipleControllers_maximumControllersConnectedForSentEvent)
    {
      id v12 = v3;
      AnalyticsSendEventLazy();
      checkMultipleControllers_maximumControllersConnectedForSentEvent = v7;
    }
  }
}

id __55__GCAnalytics_GameController__checkMultipleControllers__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) getBundleID];
  [v2 setObject:v3 forKeyedSubscript:@"bundleID"];

  objc_super v4 = +[NSString stringWithFormat:@"%d", getpid()];
  [v2 setObject:v4 forKeyedSubscript:@"processID"];

  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    [v2 setObject:v5 forKeyedSubscript:@"controller1"];
  }
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 2)
  {
    uint64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
    [v2 setObject:v6 forKeyedSubscript:@"controller2"];
  }
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 3)
  {
    int v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2];
    [v2 setObject:v7 forKeyedSubscript:@"controller3"];
  }
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 4)
  {
    uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:3];
    [v2 setObject:v8 forKeyedSubscript:@"controller4"];
  }

  return v2;
}

- (void)runInputPollTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__GCAnalytics_GameController__runInputPollTimer__block_invoke;
  block[3] = &unk_26D22A8C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __48__GCAnalytics_GameController__runInputPollTimer__block_invoke(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__GCAnalytics_GameController__runInputPollTimer__block_invoke_2;
  v5[3] = &unk_26D22AB20;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:10.0];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

uint64_t __48__GCAnalytics_GameController__runInputPollTimer__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (result)
  {
    long long v12 = 0u;
    memset(v13, 0, 60);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          *(int32x2_t *)&double v8 = batchInputData((uint64_t)v13, *(void **)(*((void *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16, v8);
      }
      while (v5);
    }

    return [*(id *)(a1 + 32) sendInputsPressedEvent:v13];
  }
  return result;
}

- (void)publishController:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__GCAnalytics_GameController__publishController___block_invoke;
  block[3] = &unk_26D22A8C0;
  block[4] = self;
  if (publishController__dispatcher != -1) {
    dispatch_once(&publishController__dispatcher, block);
  }
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  dataFromController(v4, (uint64_t)&v10);
  controllersData = self->_controllersData;
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [v4 deviceHash]);
  [(NSMutableDictionary *)controllersData setObject:v4 forKey:v6];

  id v7 = (id)v10;
  id v8 = *((id *)&v10 + 1);
  id v9 = (id)v11;
  AnalyticsSendEventLazy();
  [(GCAnalytics *)self checkMultipleControllers];
}

uint64_t __49__GCAnalytics_GameController__publishController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runInputPollTimer];
}

id __49__GCAnalytics_GameController__publishController___block_invoke_2(uint64_t a1)
{
  v15[0] = @"productCategoryName";
  v15[1] = @"connectionCount";
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  v16[0] = *(void *)(v3 + 8);
  v16[1] = &unk_26D286498;
  v15[2] = @"bundleID";
  id v4 = [v2 getBundleID];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v16[2] = v4;
  v16[3] = v5;
  v15[3] = @"vendorName";
  v15[4] = @"profileName";
  v16[4] = v6;
  v15[5] = @"isFormFitting";
  id v7 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v16[5] = v7;
  v15[6] = @"hasClickableThumbsticks";
  id v8 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  v16[6] = v8;
  v15[7] = @"isSiriRemote";
  id v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
  v16[7] = v9;
  v15[8] = @"isPhysicalRemote";
  long long v10 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 67)];
  v16[8] = v10;
  long long v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];
  long long v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];

  long long v13 = convertToDict((unsigned int *)(a1 + 68), (void (*)(void))stringFromState);
  [v12 addEntriesFromDictionary:v13];

  return v12;
}

- (void)unpublishController:(id)a3
{
  controllersData = self->_controllersData;
  +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [a3 deviceHash]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)controllersData removeObjectForKey:v4];
}

- (void)onSiriMotionEnabled
{
}

id __50__GCAnalytics_GameController__onSiriMotionEnabled__block_invoke(uint64_t a1)
{
  id v4 = @"bundleID";
  id v1 = [*(id *)(a1 + 32) getBundleID];
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)sendSettingsEnteredEvent
{
}

void *__58__GCAnalytics_SettingsAnalytics__sendSettingsEnteredEvent__block_invoke()
{
  return &unk_26D287878;
}

- (void)sendSettingsCustomizationsToggledEventForBundleID:(id)a3 productCategory:(id)a4 toggledOn:(BOOL)a5
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  id v8 = @"N/A";
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = @"N/A";
  }
  if (v7) {
    id v8 = v7;
  }
  long long v12 = v9;
  long long v13 = v8;
  long long v10 = v8;
  long long v11 = v9;
  AnalyticsSendEventLazy();
}

id __110__GCAnalytics_SettingsAnalytics__sendSettingsCustomizationsToggledEventForBundleID_productCategory_toggledOn___block_invoke(uint64_t a1)
{
  v5[0] = @"bundleID";
  v5[1] = @"productCategory";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = v1;
  v5[2] = @"customizationsToggledOn";
  uint64_t v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v6[2] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)sendSettingsCustomizationsResetEventForBundleID:(id)a3 productCategory:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  uint64_t v6 = (__CFString *)a4;
  id v7 = @"N/A";
  if (!v5) {
    uint64_t v5 = @"N/A";
  }
  if (v6) {
    id v7 = v6;
  }
  long long v10 = v5;
  long long v11 = v7;
  id v8 = v7;
  id v9 = v5;
  AnalyticsSendEventLazy();
}

id __98__GCAnalytics_SettingsAnalytics__sendSettingsCustomizationsResetEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  v4[0] = @"bundleID";
  v4[1] = @"productCategory";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)sendSettingsButtonCustomizedEventForBundleID:(id)a3 productCategory:(id)a4 button:(id)a5
{
  id v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  if (v9)
  {
    if (v7) {
      long long v10 = v7;
    }
    else {
      long long v10 = @"N/A";
    }
    if (!v8) {
      id v8 = @"N/A";
    }
    id v7 = v10;
    id v8 = v8;
    id v11 = v9;
    AnalyticsSendEventLazy();
  }
}

id __102__GCAnalytics_SettingsAnalytics__sendSettingsButtonCustomizedEventForBundleID_productCategory_button___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"bundleID";
  v4[1] = @"productCategory";
  long long v5 = v1;
  void v4[2] = @"buttonName";
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:3];

  return v2;
}

- (void)sendSettingsIdentifyControllerEventForProductCategory:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = @"N/A";
  if (v3) {
    id v4 = v3;
  }
  uint64_t v6 = v4;
  long long v5 = v4;
  AnalyticsSendEventLazy();
}

id __88__GCAnalytics_SettingsAnalytics__sendSettingsIdentifyControllerEventForProductCategory___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"productCategory";
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)sendSettingsDevicesEventForTotalCustomizedControllersCount:(int)a3
{
}

id __93__GCAnalytics_SettingsAnalytics__sendSettingsDevicesEventForTotalCustomizedControllersCount___block_invoke(uint64_t a1)
{
  id v4 = @"customizedControllersCount";
  uint64_t v1 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount:(int)a3
{
}

id __93__GCAnalytics_SettingsAnalytics__sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount___block_invoke(uint64_t a1)
{
  id v4 = @"customizedAppsCount";
  uint64_t v1 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)sendSettingsRPKitGesturesCustomized:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = getGCSettingsLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v5;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "sendSettingsRPKitGesturesCustomized %@, %@", buf, 0x16u);
  }

  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 controllerElementMappingKey];

      if (v8)
      {
        v23 = objc_opt_new();
        uint64_t v9 = [v5 singlePressGesture];
        if (v9 != [v6 singlePressGesture])
        {
          long long v10 = GCSystemGestureModeToString([v5 singlePressGesture]);
          [v23 setObject:v10 forKeyedSubscript:@"Single Press"];
        }
        uint64_t v11 = [v5 doublePressGesture];
        if (v11 != [v6 doublePressGesture])
        {
          long long v12 = GCSystemGestureModeToString([v5 doublePressGesture]);
          [v23 setObject:v12 forKeyedSubscript:@"Double Press"];
        }
        uint64_t v13 = [v5 longPressGesture];
        if (v13 != [v6 longPressGesture])
        {
          long long v14 = GCSystemGestureModeToString([v5 longPressGesture]);
          [v23 setObject:v14 forKeyedSubscript:@"Long Press"];
        }
        id v22 = v6;
        uint64_t v15 = getGCSettingsLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v23;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_DEFAULT, "sendSettingsRPKitGesturesCustomized changedGestures %@", buf, 0xCu);
        }

        context = (void *)MEMORY[0x223C6E130]();
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v16 = [v23 allKeys];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v16);
              }
              id v24 = v5;
              id v25 = v23;
              AnalyticsSendEventLazy();
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v18);
        }

        id v6 = v22;
      }
    }
  }
}

id __75__GCAnalytics_SettingsAnalytics__sendSettingsRPKitGesturesCustomized_from___block_invoke(uint64_t a1)
{
  v8[0] = @"buttonName";
  uint64_t v2 = [*(id *)(a1 + 32) controllerElementMappingKey];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  v9[0] = v2;
  v9[1] = v4;
  v8[1] = @"gestureType";
  v8[2] = @"gestureMode";
  id v5 = objc_msgSend(v3, "objectForKeyedSubscript:");
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)sendRPKitScreenshotSavedEventForBundleID:(id)a3 productCategory:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  id v7 = @"N/A";
  if (!v5) {
    id v5 = @"N/A";
  }
  if (v6) {
    id v7 = v6;
  }
  long long v10 = v5;
  uint64_t v11 = v7;
  id v8 = v7;
  uint64_t v9 = v5;
  AnalyticsSendEventLazy();
}

id __92__GCAnalytics_ReplayKitAnalytics__sendRPKitScreenshotSavedEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  v4[0] = @"bundleID";
  v4[1] = @"productCategory";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)sendRPKitManualRecordingSavedEventForBundleID:(id)a3 productCategory:(id)a4 duration:(int)a5
{
  id v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  id v8 = @"N/A";
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = @"N/A";
  }
  if (v7) {
    id v8 = v7;
  }
  long long v12 = v9;
  uint64_t v13 = v8;
  long long v10 = v8;
  uint64_t v11 = v9;
  AnalyticsSendEventLazy();
}

id __106__GCAnalytics_ReplayKitAnalytics__sendRPKitManualRecordingSavedEventForBundleID_productCategory_duration___block_invoke(uint64_t a1)
{
  v5[0] = @"bundleID";
  v5[1] = @"productCategory";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = v1;
  void v5[2] = @"duration";
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v6[2] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)sendRPKitInstantCaptureSavedEventForBundleID:(id)a3 productCategory:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  id v7 = @"N/A";
  if (!v5) {
    id v5 = @"N/A";
  }
  if (v6) {
    id v7 = v6;
  }
  long long v10 = v5;
  uint64_t v11 = v7;
  id v8 = v7;
  uint64_t v9 = v5;
  AnalyticsSendEventLazy();
}

id __96__GCAnalytics_ReplayKitAnalytics__sendRPKitInstantCaptureSavedEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  v4[0] = @"bundleID";
  v4[1] = @"productCategory";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)sendRPKitInstantCaptureBufferStartedEventForBundleID:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  uint64_t v4 = @"N/A";
  if (v3) {
    uint64_t v4 = v3;
  }
  id v6 = v4;
  id v5 = v4;
  AnalyticsSendEventLazy();
}

id __88__GCAnalytics_ReplayKitAnalytics__sendRPKitInstantCaptureBufferStartedEventForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = @"bundleID";
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)sendHapticsEngineCreatedEventForBundleID:(id)a3 productCategory:(id)a4 hapticsLocality:(id)a5
{
  id v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = (__CFString *)a5;
  long long v10 = @"N/A";
  if (!v7) {
    id v7 = @"N/A";
  }
  if (!v8) {
    id v8 = @"N/A";
  }
  if (v9) {
    long long v10 = v9;
  }
  long long v14 = v7;
  uint64_t v15 = v8;
  long long v16 = v10;
  uint64_t v11 = v10;
  long long v12 = v8;
  uint64_t v13 = v7;
  AnalyticsSendEventLazy();
}

id __106__GCAnalytics_HapticsAnalytics__sendHapticsEngineCreatedEventForBundleID_productCategory_hapticsLocality___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"bundleID";
  v4[1] = @"productCategory";
  long long v5 = v1;
  void v4[2] = @"hapticsLocality";
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:3];

  return v2;
}

- (void)sendHapticsClientDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalPlayers:(int)a5 sessionTotalDuration:(int)a6 sessionActiveDuration:(int)a7 terminationReason:(id)a8
{
  long long v10 = (__CFString *)a3;
  uint64_t v11 = (__CFString *)a4;
  long long v12 = (__CFString *)a8;
  uint64_t v13 = @"N/A";
  if (!v10) {
    long long v10 = @"N/A";
  }
  if (!v11) {
    uint64_t v11 = @"N/A";
  }
  if (v12) {
    uint64_t v13 = v12;
  }
  uint64_t v17 = v13;
  long long v14 = v13;
  uint64_t v15 = v11;
  long long v16 = v10;
  AnalyticsSendEventLazy();
}

id __166__GCAnalytics_HapticsAnalytics__sendHapticsClientDestroyedEventForBundleID_productCategory_totalPlayers_sessionTotalDuration_sessionActiveDuration_terminationReason___block_invoke(uint64_t a1)
{
  long long v8 = *(_OWORD *)(a1 + 32);
  v7[0] = @"bundleID";
  v7[1] = @"productCategory";
  uint64_t v9 = *(void *)(a1 + 48);
  v7[2] = @"terminationReason";
  v7[3] = @"totalPlayers";
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  long long v10 = v2;
  v7[4] = @"sessionTotalDuration";
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  uint64_t v11 = v3;
  v7[5] = @"sessionActiveDuration";
  uint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  long long v12 = v4;
  long long v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:v7 count:6];

  return v5;
}

- (void)sendHapticsPlayerDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalEventsProcessed:(int)a5 transientEventsProcessed:(int)a6 continuousEventsProcessed:(int)a7 parameterCurvesProcessed:(int)a8 sessionTotalDuration:(int)a9 sessionActiveDuration:(int)a10
{
  long long v12 = (__CFString *)a3;
  uint64_t v13 = (__CFString *)a4;
  uint64_t v14 = mach_absolute_time();
  if (v14 * self->_timebaseInfo.numer / self->_timebaseInfo.denom / 0x3B9ACA00
     - self->_lastHapticsEvent * self->_timebaseInfo.numer / self->_timebaseInfo.denom / 0x3B9ACA00 > 4)
  {
    self->_lastHapticsEvent = v14;
    if (v12) {
      long long v16 = v12;
    }
    else {
      long long v16 = @"N/A";
    }
    if (!v13) {
      uint64_t v13 = @"N/A";
    }
    long long v12 = v16;
    uint64_t v13 = v13;
    AnalyticsSendEventLazy();

    uint64_t v15 = v12;
    goto LABEL_11;
  }
  if (gc_isInternalBuild())
  {
    uint64_t v15 = getGCLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[GCAnalytics(HapticsAnalytics) sendHapticsPlayerDestroyedEventForBundleID:productCategory:totalEventsProcessed:transientEventsProcessed:continuousEventsProcessed:parameterCurvesProcessed:sessionTotalDuration:sessionActiveDuration:](v15);
    }
LABEL_11:
  }
}

id __232__GCAnalytics_HapticsAnalytics__sendHapticsPlayerDestroyedEventForBundleID_productCategory_totalEventsProcessed_transientEventsProcessed_continuousEventsProcessed_parameterCurvesProcessed_sessionTotalDuration_sessionActiveDuration___block_invoke(uint64_t a1)
{
  v11[0] = @"bundleID";
  v11[1] = @"productCategory";
  uint64_t v2 = *(void *)(a1 + 40);
  v12[0] = *(void *)(a1 + 32);
  v12[1] = v2;
  v11[2] = @"totalEventsProcessed";
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v12[2] = v3;
  v11[3] = @"transientEventsProcessed";
  uint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  v12[3] = v4;
  v11[4] = @"continuousEventsProcessed";
  long long v5 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v12[4] = v5;
  v11[5] = @"parameterCurvesProcessed";
  uint64_t v6 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v12[5] = v6;
  v11[6] = @"sessionTotalDuration";
  id v7 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v12[6] = v7;
  v11[7] = @"sessionActiveDuration";
  long long v8 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  v12[7] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];

  return v9;
}

- (void)sendHapticsErrorRaisedEventFromSource:(id)a3 productCategory:(id)a4 errorType:(id)a5
{
  id v7 = (__CFString *)a3;
  long long v8 = (__CFString *)a4;
  uint64_t v9 = (__CFString *)a5;
  if (v7) {
    long long v10 = v7;
  }
  else {
    long long v10 = @"N/A";
  }
  if (!v8) {
    long long v8 = @"N/A";
  }
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = @"Unknown Error";
  }
  uint64_t v15 = v11;
  long long v16 = v8;
  uint64_t v17 = v10;
  long long v12 = v10;
  uint64_t v13 = v8;
  uint64_t v14 = v11;
  AnalyticsSendEventLazy();
}

id __97__GCAnalytics_HapticsAnalytics__sendHapticsErrorRaisedEventFromSource_productCategory_errorType___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"errorType";
  v4[1] = @"productCategory";
  long long v5 = v1;
  void v4[2] = @"source";
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:3];

  return v2;
}

- (GCAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)GCAnalytics;
  uint64_t v2 = [(GCAnalytics *)&v6 init];
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
  controllersData = v2->_controllersData;
  v2->_controllersData = v3;

  mach_timebase_info(&v2->_timebaseInfo);
  return v2;
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
}

- (void)sendEvent:(id)a3 withXPCPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 UTF8String];
  analytics_send_event();
}

- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  return AnalyticsSendEventLazy();
}

- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 UTF8String];
  LOBYTE(v5) = analytics_send_event_lazy();

  return (char)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPollTimer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_controllersData, 0);
}

@end