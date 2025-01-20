@interface HAENotificationCenter
+ (BOOL)connectedWiredDeviceIsHeadphone;
+ (BOOL)connectedWiredDeviceIsHeadphoneWithUUID:(id)a3;
+ (void)startNotificationCenterServer;
- (HAENotificationCenter)initWithBundleIdentifier:(id)a3;
- (HAENotificationCenterUserDelegate)delegate;
- (NSString)bundleID;
- (double)liveMonitorWindowInSec;
- (double)liveThresholdInDBA;
- (id)addHAENotificationEvent:(id)a3 error:(id *)a4;
- (void)addHAENotificationEvent:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HAENotificationCenter

- (HAENotificationCenter)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HAENotificationCenter;
  v6 = [(HAENotificationCenter *)&v14 init];
  if (v6)
  {
    if (+[HAENDefaults HAENSupportedForCurrentDeviceClass])
    {
      objc_storeStrong((id *)&v6->bundleID, a3);
      v7 = +[HAENDefaults sharedInstance];
      [v7 getLiveMonitoringThreshold];
      v6->liveThresholdInDBA = v8;

      v9 = +[HAENDefaults sharedInstance];
      [v9 getLiveMonitorTimeWindowInSeconds];
      v6->liveMonitorWindowInSec = v10;

      if (+[HAENDefaults isCurrentProcessMediaserverd])
      {
        v11 = +[HAENotificationCenterServer sharedInstance];
      }
      else
      {
        v11 = [[HAENotificationCenterClient alloc] initWithBundleID:v5];
      }
      centerDelegate = v6->centerDelegate;
      v6->centerDelegate = (HAENotificationCenterDelegate *)v11;
    }
    else
    {
      centerDelegate = v6;
      v6 = 0;
    }
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "setDelegate %@", (uint8_t *)&v6, 0xCu);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)addHAENotificationEvent:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = +[HAENDefaults sharedInstance];
  int v9 = [v8 isHAENFeatureEnabled];

  if (v9)
  {
    [(HAENotificationCenterDelegate *)self->centerDelegate addHAENotificationEvent:v6];
    if ([v6 eventType] == 2003133803)
    {
      double v10 = HAENotificationsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v19 = 138412290;
        id v20 = WeakRetained;
        _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_DEFAULT, "sending weekly event to healthkit with delegate %@", (uint8_t *)&v19, 0xCu);
      }
      v12 = +[HAENHealthKitStore sharedInstance];
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_super v14 = [v12 saveNotificationEventToHealthKit:v6 withDelegate:v13];

      goto LABEL_13;
    }
    if ([v6 eventType] == 1818850917)
    {
      v18 = HAENotificationsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_21FABA000, v18, OS_LOG_TYPE_DEFAULT, "sending loud event to healthkit", (uint8_t *)&v19, 2u);
      }

      v12 = +[HAENHealthKitStore sharedInstance];
      objc_super v14 = [v12 saveNotificationEventToHealthKit:v6];
LABEL_13:

      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    uint64_t v16 = *(void *)"pyt!";
    v17 = @"event type not supported";
  }
  else
  {
    v15 = HAENotificationsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_DEFAULT, "error sending HAEN event: HAEN is disabled", (uint8_t *)&v19, 2u);
    }

    uint64_t v16 = *(void *)"bne!";
    v17 = @"HAEN is disabled";
  }
  objc_super v14 = NSErrorWithHAENErrorCode(v16, (uint64_t)v17);
  if (v7) {
LABEL_17:
  }
    v7[2](v7, v14);
LABEL_18:
}

- (id)addHAENotificationEvent:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[HAENDefaults sharedInstance];
  char v8 = [v7 isHAENFeatureEnabled];

  if ((v8 & 1) == 0)
  {
    v12 = HAENotificationsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21FABA000, v12, OS_LOG_TYPE_DEFAULT, "error sending HAEN event: HAEN is disabled", (uint8_t *)&v16, 2u);
    }

    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v13 = *(void *)"bne!";
    objc_super v14 = @"HAEN is disabled";
    goto LABEL_15;
  }
  [(HAENotificationCenterDelegate *)self->centerDelegate addHAENotificationEvent:v6];
  if ([v6 eventType] != 2003133803)
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v13 = *(void *)"pyt!";
    objc_super v14 = @"event type not supported";
LABEL_15:
    NSErrorWithHAENErrorCode(v13, (uint64_t)v14);
    double v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  uint64_t v9 = +[HAENHealthKitStore createHKCategorySampleForEvent:v6];
  if (!v9)
  {
    if (a4)
    {
      uint64_t v13 = *(void *)"skh!";
      objc_super v14 = @"failed to create hk sample";
      goto LABEL_15;
    }
LABEL_16:
    double v10 = 0;
    goto LABEL_17;
  }
  double v10 = (void *)v9;
  v11 = HAENotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_21FABA000, v11, OS_LOG_TYPE_DEFAULT, "created weekly event HKSample %@", (uint8_t *)&v16, 0xCu);
  }

LABEL_17:
  return v10;
}

+ (void)startNotificationCenterServer
{
  if (+[HAENDefaults isCurrentProcessMediaserverd]
    && +[HAENDefaults HAENSupportedForCurrentDeviceClass])
  {
    v2 = HAENotificationsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "<< Starting HAE Notification Center Server >>", v9, 2u);
    }

    id v3 = +[HAENotificationCenterServer sharedInstance];
    id v4 = +[HAENotificationCenterManager sharedInstance];
    id v5 = +[HAENDefaults sharedInstance];
    id v6 = +[HAENLocationGatingHelper sharedInstance];
    id v7 = +[HAENVolumeControl sharedInstance];
    id v8 = +[HAENStatistics sharedInstance];
  }
}

+ (BOOL)connectedWiredDeviceIsHeadphone
{
  v2 = +[HAENUnknownDeviceManager sharedInstance];
  id v3 = [v2 getDeviceName];
  BOOL v4 = +[HAENotificationCenter connectedWiredDeviceIsHeadphoneWithUUID:v3];

  return v4;
}

+ (BOOL)connectedWiredDeviceIsHeadphoneWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = +[HAENUnknownDeviceManager sharedInstance];
  if ([v4 unknownWiredHeadsetConnectedThroughB204])
  {
    char v5 = [v4 isUSBCPort];
    id v6 = +[HAENDefaults sharedInstance];
    id v7 = v6;
    if (v5) {
      uint64_t v8 = [v6 isCurrentAudioAccessoryHeadphoneWithKey:v3];
    }
    else {
      uint64_t v8 = [v6 isCurrentAudioAccessoryHeadphone];
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = 1;
  }
  double v10 = HAENotificationsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithBool:v9];
    int v13 = 138412546;
    id v14 = v3;
    __int16 v15 = 2112;
    int v16 = v11;
    _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_DEFAULT, "wired device [%@] is headphone: %@", (uint8_t *)&v13, 0x16u);
  }
  return v9;
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (double)liveThresholdInDBA
{
  return self->liveThresholdInDBA;
}

- (double)liveMonitorWindowInSec
{
  return self->liveMonitorWindowInSec;
}

- (HAENotificationCenterUserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HAENotificationCenterUserDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->centerDelegate, 0);
}

@end