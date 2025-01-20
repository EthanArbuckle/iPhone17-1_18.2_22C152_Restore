@interface CBStatusBarStateAggregator
+ (id)sharedInstance;
- (BCBatteryDevice)currentBatteryDevice;
- (BCBatteryDeviceController)batteryDeviceController;
- (BOOL)_isLowPowerModeActive;
- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4;
- (BOOL)lastLockState;
- (BOOL)lastLockStateSet;
- (CBStatusBarStateAggregator)init;
- (CBWiFiManager)wifiManager;
- (NSString)batteryDetailString;
- (NSString)timeItemShortTimeString;
- (NSString)timeItemTimeString;
- (NSTimer)timeItemTimer;
- (UIDevice)device;
- (id)_batteryItemPercentFormatter;
- (id)_timeItemDateFormatter;
- (id)_timeItemShortDateFormatter;
- (void)_initialStatusBarSetup;
- (void)_postStatusBarUpdates;
- (void)_registerForNotifications;
- (void)_restartTimeItemTimer;
- (void)_setupBattery;
- (void)_setupLock;
- (void)_setupTime;
- (void)_setupWiFi;
- (void)_stopTimeItemTimer;
- (void)_updateBatteryItems;
- (void)_updateDataNetworkItem;
- (void)_updateLockItem;
- (void)_updateSensorActivityItem;
- (void)_updateTimeItems;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)forceUpdateStatusBarData;
- (void)setBatteryDetailString:(id)a3;
- (void)setBatteryDeviceController:(id)a3;
- (void)setCurrentBatteryDevice:(id)a3;
- (void)setDevice:(id)a3;
- (void)setLastLockState:(BOOL)a3;
- (void)setLastLockStateSet:(BOOL)a3;
- (void)setTimeItemShortTimeString:(id)a3;
- (void)setTimeItemTimeString:(id)a3;
- (void)setTimeItemTimer:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)updateStatusBarItem:(int)a3;
@end

@implementation CBStatusBarStateAggregator

+ (id)sharedInstance
{
  if (qword_10008FD98 != -1) {
    dispatch_once(&qword_10008FD98, &stru_100079740);
  }
  v2 = (void *)qword_10008FD90;

  return v2;
}

- (CBStatusBarStateAggregator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CBStatusBarStateAggregator;
  v2 = [(CBStatusBarStateAggregator *)&v8 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up status bar aggregator…", (uint8_t *)v7, 2u);
    }

    uint64_t v4 = +[CBWiFiManager sharedInstance];
    wifiManager = v2->_wifiManager;
    v2->_wifiManager = (CBWiFiManager *)v4;

    *(_WORD *)&v2->_lastLockState = 0;
    [(CBStatusBarStateAggregator *)v2 _initialStatusBarSetup];
    [(CBStatusBarStateAggregator *)v2 _registerForNotifications];
  }
  return v2;
}

- (void)_initialStatusBarSetup
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing status bar data…", v4, 2u);
  }

  bzero(&self->_data, 0xF28uLL);
  *((unsigned char *)&self->_data + 2536) = *((unsigned char *)&self->_data + 2536) & 0xFD | (2
                                                                            * ([UIApp userInterfaceLayoutDirection] == (id)1));
}

- (void)dealloc
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  [(CBStatusBarStateAggregator *)self _stopTimeItemTimer];
  v6 = [(CBStatusBarStateAggregator *)self device];
  [v6 setBatteryMonitoringEnabled:0];

  v7 = [(CBStatusBarStateAggregator *)self batteryDeviceController];
  [v7 removeBatteryDeviceObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)CBStatusBarStateAggregator;
  [(CBStatusBarStateAggregator *)&v8 dealloc];
}

- (void)_registerForNotifications
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v4, 2u);
  }

  [(CBStatusBarStateAggregator *)self _setupLock];
  [(CBStatusBarStateAggregator *)self _setupTime];
  [(CBStatusBarStateAggregator *)self _setupBattery];
  [(CBStatusBarStateAggregator *)self _setupWiFi];
}

- (void)updateStatusBarItem:(int)a3
{
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    int v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating status bar item (%d)…", (uint8_t *)&v7, 8u);
  }

  if (a3 <= 11)
  {
    if (!a3)
    {
      [(CBStatusBarStateAggregator *)self _updateTimeItems];
      return;
    }
    if (a3 == 9)
    {
      [(CBStatusBarStateAggregator *)self _updateDataNetworkItem];
      return;
    }
  }
  else
  {
    if ((a3 - 12) < 3)
    {
      [(CBStatusBarStateAggregator *)self _updateBatteryItems];
      return;
    }
    if (a3 == 28)
    {
      [(CBStatusBarStateAggregator *)self _updateSensorActivityItem];
      return;
    }
    if (a3 == 39)
    {
      [(CBStatusBarStateAggregator *)self _updateLockItem];
      return;
    }
  }
  v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    int v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBStatusBarStateAggregator] cannot update unknown status bar item (%i)", (uint8_t *)&v7, 8u);
  }
}

- (void)forceUpdateStatusBarData
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forcing status bar data update", v4, 2u);
  }

  [(CBStatusBarStateAggregator *)self _postStatusBarUpdates];
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4
{
  int v4 = a4;
  int v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting status bar item (%d)…", (uint8_t *)&v13, 8u);
  }

  if (a3 > 0x2D) {
    return 0;
  }
  int v8 = (char *)self + a3;
  int v9 = v8[8];
  v8[8] = v4;
  [(CBStatusBarStateAggregator *)self _postStatusBarUpdates];
  if (v9 == v4) {
    return 0;
  }
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"dis";
    if (v4) {
      CFStringRef v12 = @"en";
    }
    int v13 = 138412546;
    CFStringRef v14 = v12;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@abling %d", (uint8_t *)&v13, 0x12u);
  }

  return 1;
}

- (void)_postStatusBarUpdates
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting status bar updates…", v4, 2u);
  }

  +[UIStatusBarServer postStatusBarData:&self->_data withActions:0];
}

- (void)_setupLock
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up lock notifications…", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10000CFC8, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDrop);
  [(CBStatusBarStateAggregator *)self updateStatusBarItem:39];
}

- (void)_updateLockItem
{
  unsigned int v3 = MKBGetDeviceLockState() - 1;
  int v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 < 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating lock item state %d", (uint8_t *)v6, 8u);
  }

  [(CBStatusBarStateAggregator *)self _setItem:39 enabled:v3 < 2];
  if ([(CBStatusBarStateAggregator *)self lastLockStateSet])
  {
    if (v3 < 2 != [(CBStatusBarStateAggregator *)self lastLockState])
    {
      v5 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "But I keep checking…", (uint8_t *)v6, 2u);
      }

      +[CBSystem checkoutAndReboot:1 userInitiated:0];
    }
  }
  else
  {
    [(CBStatusBarStateAggregator *)self setLastLockState:v3 < 2];
    [(CBStatusBarStateAggregator *)self setLastLockStateSet:1];
  }
}

- (id)_timeItemDateFormatter
{
  if (qword_10008FDA8 != -1) {
    dispatch_once(&qword_10008FDA8, &stru_100079760);
  }
  v2 = (void *)qword_10008FDA0;

  return v2;
}

- (id)_timeItemShortDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D2BC;
  block[3] = &unk_1000794E0;
  block[4] = self;
  if (qword_10008FDB8 != -1) {
    dispatch_once(&qword_10008FDB8, block);
  }
  return (id)qword_10008FDB0;
}

- (void)_setupTime
{
  unsigned int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up time notifications…", v5, 2u);
  }

  int v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_restartTimeItemTimer" name:@"CBDidWakeFromSleepNotification" object:0];

  [(CBStatusBarStateAggregator *)self _restartTimeItemTimer];
}

- (void)_stopTimeItemTimer
{
  unsigned int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating time item timer…", v5, 2u);
  }

  int v4 = [(CBStatusBarStateAggregator *)self timeItemTimer];
  [v4 invalidate];

  [(CBStatusBarStateAggregator *)self setTimeItemTimer:0];
}

- (void)_restartTimeItemTimer
{
  [(CBStatusBarStateAggregator *)self _updateTimeItems];
  [(CBStatusBarStateAggregator *)self _stopTimeItemTimer];
  int v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting time item timer…", v8, 2u);
  }

  BSTimeUntilNextClockMinute();
  v5 = +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, a2, 0, 0);
  [(CBStatusBarStateAggregator *)self setTimeItemTimer:v5];

  v6 = +[NSRunLoop currentRunLoop];
  int v7 = [(CBStatusBarStateAggregator *)self timeItemTimer];
  [v6 addTimer:v7 forMode:NSRunLoopCommonModes];
}

- (void)_updateTimeItems
{
  unsigned int v3 = +[NSDate date];
  int v4 = [(CBStatusBarStateAggregator *)self _timeItemDateFormatter];
  v5 = [v4 stringFromDate:v3];

  v6 = [(CBStatusBarStateAggregator *)self _timeItemShortDateFormatter];
  int v7 = [v6 stringFromDate:v3];

  int v8 = [(CBStatusBarStateAggregator *)self timeItemTimeString];
  unsigned __int8 v9 = [v5 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(CBStatusBarStateAggregator *)self timeItemTimeString];
      int v19 = 138412546;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating the standard time string from %@ to %@", (uint8_t *)&v19, 0x16u);
    }
    CFStringRef v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(CBStatusBarStateAggregator *)self timeItemShortTimeString];
      int v19 = 138412546;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating the short time string from %@ to %@", (uint8_t *)&v19, 0x16u);
    }
    [(CBStatusBarStateAggregator *)self setTimeItemTimeString:v5];
    [(CBStatusBarStateAggregator *)self setTimeItemShortTimeString:v7];
    CFStringRef v14 = [(CBStatusBarStateAggregator *)self timeItemTimeString];
    unsigned __int8 v15 = [v14 getCString:self->_data.timeString maxLength:64 encoding:4];

    int v16 = [(CBStatusBarStateAggregator *)self timeItemShortTimeString];
    unsigned int v17 = [v16 getCString:self->_data.shortTimeString maxLength:64 encoding:4];

    if ((v15 & 1) != 0 || v17)
    {
      v18 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating the time…", (uint8_t *)&v19, 2u);
      }

      [(CBStatusBarStateAggregator *)self _setItem:0 enabled:1];
    }
    else
    {
      *(_OWORD *)&self->_data.timeString[32] = 0u;
      *(_OWORD *)&self->_data.timeString[48] = 0u;
      *(_OWORD *)self->_data.timeString = 0u;
      *(_OWORD *)&self->_data.timeString[16] = 0u;
    }
  }
}

- (id)_batteryItemPercentFormatter
{
  if (qword_10008FDC8 != -1) {
    dispatch_once(&qword_10008FDC8, &stru_100079780);
  }
  v2 = (void *)qword_10008FDC0;

  return v2;
}

- (void)_setupBattery
{
  unsigned int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up battery notifications…", v9, 2u);
  }

  int v4 = +[UIDevice currentDevice];
  [(CBStatusBarStateAggregator *)self setDevice:v4];

  v5 = [(CBStatusBarStateAggregator *)self device];
  [v5 setBatteryMonitoringEnabled:1];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_updateBatteryItems" name:UIDeviceBatteryLevelDidChangeNotification object:0];

  id v7 = objc_alloc_init((Class)BCBatteryDeviceController);
  [(CBStatusBarStateAggregator *)self setBatteryDeviceController:v7];

  int v8 = [(CBStatusBarStateAggregator *)self batteryDeviceController];
  [v8 addBatteryDeviceObserver:self queue:&_dispatch_main_q];

  [(CBStatusBarStateAggregator *)self updateStatusBarItem:12];
}

- (BOOL)_isLowPowerModeActive
{
  int out_token = -1;
  uint32_t v2 = notify_register_dispatch("com.apple.system.lowpowermode", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_1000797C0);
  uint64_t v8 = 0;
  int v3 = out_token;
  if (out_token != -1 && v2 == 0)
  {
    if (notify_get_state(out_token, &v8)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v8 == 0;
    }
    BOOL v5 = !v6;
    int v3 = out_token;
  }
  else
  {
    BOOL v5 = 0;
  }
  notify_cancel(v3);
  return v5;
}

- (void)_updateBatteryItems
{
  int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating battery items…", v32, 2u);
  }

  unsigned int batteryState = self->_data.batteryState;
  BOOL v5 = [(CBStatusBarStateAggregator *)self device];
  [v5 batteryLevel];
  float v7 = v6;

  unsigned int v8 = [(CBStatusBarStateAggregator *)self _isLowPowerModeActive];
  unsigned __int8 v9 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];

  if (v9)
  {
    v10 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];
    int v11 = [v10 percentCharge];

    CFStringRef v12 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];
    if ([v12 powerSourceState] == (id)2)
    {
      int v13 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];
      id v14 = [v13 percentCharge];

      if (v14 == (id)100)
      {
        unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          int v16 = "Device is plugged into power and the battery is fully charged";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v32, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {
    }
    int v19 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];
    unsigned int v20 = [v19 isCharging];

    unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
    BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        *(_WORD *)v32 = 0;
        int v16 = "Device is plugged into power and the battery is charging";
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if (v21)
    {
      *(_WORD *)v32 = 0;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device is not plugged into power; the battery is discharging",
        v32,
        2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  int v11 = (int)(v7 * 100.0);
  unsigned int v17 = [(CBStatusBarStateAggregator *)self device];
  id v18 = [v17 batteryState];

  if (v18 == (id)1)
  {
    unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      goto LABEL_21;
    }
LABEL_22:
    unsigned int batteryState = 0;
    goto LABEL_27;
  }
  if (v18 == (id)2)
  {
    unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      int v16 = "Device is plugged into power and the battery is charging";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (v18 == (id)3)
  {
    unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      int v16 = "Device is plugged into power and the battery is fully charged";
      goto LABEL_25;
    }
LABEL_26:
    unsigned int batteryState = 1;
    goto LABEL_27;
  }
  unsigned __int8 v15 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device is not connected to power", v32, 2u);
  }
LABEL_27:

  if (v11 <= 0)
  {
    v22 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Battery percentage is less than 0", v32, 2u);
    }

    int v11 = 1;
  }
  v23 = [(CBStatusBarStateAggregator *)self _batteryItemPercentFormatter];
  double v24 = (double)v11 / 100.0;
  *(float *)&double v24 = v24;
  v25 = +[NSNumber numberWithFloat:v24];
  v26 = [v23 stringFromNumber:v25];

  v27 = [(CBStatusBarStateAggregator *)self batteryDetailString];
  unsigned __int8 v28 = [v26 isEqualToString:v27];

  if ((v28 & 1) == 0)
  {
    v29 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updating battery detail string…", v32, 2u);
    }

    [(CBStatusBarStateAggregator *)self setBatteryDetailString:v26];
    v30 = [(CBStatusBarStateAggregator *)self batteryDetailString];
    [v30 getCString:self->_data.batteryDetailString maxLength:150 encoding:4];
  }
  if (v11 == self->_data.batteryCapacity
    && batteryState == self->_data.batteryState
    && ((v8 ^ ((*((unsigned char *)&self->_data + 2536) & 1) == 0)) & 1) != 0)
  {
    if (v28) {
      goto LABEL_44;
    }
  }
  else
  {
    v31 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating battery info…", v32, 2u);
    }

    self->_data.batteryCapacity = v11;
    self->_data.unsigned int batteryState = batteryState;
    *((unsigned char *)&self->_data + 2536) = *((unsigned char *)&self->_data + 2536) & 0xFE | v8;
  }
  [(CBStatusBarStateAggregator *)self _setItem:12 enabled:1];
  [(CBStatusBarStateAggregator *)self _setItem:13 enabled:1];
LABEL_44:
}

- (void)_setupWiFi
{
  int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up Wi-Fi notifications…", v5, 2u);
  }

  int v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_updateDataNetworkItem" name:@"CBWiFiSignalStrengthChangedNotification" object:0];

  [(CBStatusBarStateAggregator *)self updateStatusBarItem:9];
}

- (void)_updateDataNetworkItem
{
  int v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating data network item…", buf, 2u);
  }

  unsigned int dataNetworkType = self->_data.dataNetworkType;
  BOOL v5 = [(CBStatusBarStateAggregator *)self wifiManager];
  id v6 = [v5 isAssociatedToNetwork];

  if (v6)
  {
    float v7 = [(CBStatusBarStateAggregator *)self wifiManager];
    int v8 = [v7 signalStrengthBars];

    unsigned __int8 v9 = [(CBStatusBarStateAggregator *)self wifiManager];
    int v10 = [v9 signalStrengthRSSI];

    unsigned int dataNetworkType = 5;
  }
  else
  {
    int v8 = 0;
    int v10 = 0;
  }
  unsigned int v11 = self->_data.dataNetworkType;
  if (dataNetworkType != v11) {
    self->_data.unsigned int dataNetworkType = dataNetworkType;
  }
  if (v8 == self->_data.wifiSignalStrengthBars)
  {
    if (v10 == self->_data.wifiSignalStrengthRaw)
    {
      if (dataNetworkType == v11) {
        return;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_data.wifiSignalStrengthBars = v8;
  if (v10 != self->_data.wifiSignalStrengthRaw) {
LABEL_13:
  }
    self->_data.wifiSignalStrengthRaw = v10;
LABEL_14:
  CFStringRef v12 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating data network info…", v13, 2u);
  }

  [(CBStatusBarStateAggregator *)self _setItem:9 enabled:v6];
}

- (void)_updateSensorActivityItem
{
  uint32_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating status bar sensor activity item", buf, 2u);
  }

  int v3 = +[CBSceneManager sharedInstance];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v4 = [v3 windowDict];
  BOOL v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        CFStringRef v12 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Status bar is checking recording indicator for window %@", buf, 0xCu);
        }

        int v13 = [v11 recordingIndicatorManager];
        id v14 = v13;
        if (v13)
        {
          [v13 updateRecordingIndicatorForStatusBarChanges];
          v8 |= [v14 isIndicatorVisibleAtStatusBarLocation];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  unsigned __int8 v15 = +[CBWindowManager sharedInstance];
  int v16 = [v15 rootWindowRecordingIndicatorManager];
  unsigned int v17 = v16;
  if (v16)
  {
    [v16 updateRecordingIndicatorForStatusBarChanges];
    LOBYTE(v8) = v8 | [v17 isIndicatorVisibleAtStatusBarLocation];
  }
  id v18 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v8 & 1;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating status bar sensor activity item to enabled: %d", buf, 8u);
  }

  [(CBStatusBarStateAggregator *)self _setItem:28 enabled:v8 & 1];
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4 = a3;
  [(CBStatusBarStateAggregator *)self setCurrentBatteryDevice:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isInternal", (void)v13))
        {
          [(CBStatusBarStateAggregator *)self setCurrentBatteryDevice:v10];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  unsigned int v11 = [(CBStatusBarStateAggregator *)self currentBatteryDevice];

  if (!v11)
  {
    CFStringRef v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100048B98(v12);
    }
  }
  [(CBStatusBarStateAggregator *)self _updateBatteryItems];
}

- (NSTimer)timeItemTimer
{
  return self->_timeItemTimer;
}

- (void)setTimeItemTimer:(id)a3
{
}

- (NSString)timeItemTimeString
{
  return self->_timeItemTimeString;
}

- (void)setTimeItemTimeString:(id)a3
{
}

- (NSString)timeItemShortTimeString
{
  return self->_timeItemShortTimeString;
}

- (void)setTimeItemShortTimeString:(id)a3
{
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (void)setBatteryDeviceController:(id)a3
{
}

- (BCBatteryDevice)currentBatteryDevice
{
  return self->_currentBatteryDevice;
}

- (void)setCurrentBatteryDevice:(id)a3
{
}

- (NSString)batteryDetailString
{
  return self->_batteryDetailString;
}

- (void)setBatteryDetailString:(id)a3
{
}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (BOOL)lastLockState
{
  return self->_lastLockState;
}

- (void)setLastLockState:(BOOL)a3
{
  self->_lastLockState = a3;
}

- (BOOL)lastLockStateSet
{
  return self->_lastLockStateSet;
}

- (void)setLastLockStateSet:(BOOL)a3
{
  self->_lastLockStateSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_batteryDetailString, 0);
  objc_storeStrong((id *)&self->_currentBatteryDevice, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_timeItemShortTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemTimeString, 0);

  objc_storeStrong((id *)&self->_timeItemTimer, 0);
}

@end