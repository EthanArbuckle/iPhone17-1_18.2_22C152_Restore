@interface BatteryDrainController
+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4;
- (BOOL)isDeviceConnectedToRequiredAccessory;
- (BOOL)isDeviceConnectedToUnexpectedAccessory;
- (BOOL)isThermalBlocked;
- (BOOL)originalPowerModeSet;
- (BOOL)wasAutoBrightnessEnabled;
- (BOOL)wasChargingDisabledDuringTest;
- (BatteryDrainInputs)inputs;
- (BrightnessSystemClient)brightnessSystemClient;
- (DAAccessoryConnectDetector)accessoryConnectDetector;
- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector;
- (DKResponder)responder;
- (NSNumber)runNumber;
- (NSNumber)startingBatteryPercentage;
- (NSOperationQueue)drainQueue;
- (NSURL)audioFileURL;
- (NSUserDefaults)defaults;
- (UIDevice)currentDevice;
- (int64_t)originalPowerMode;
- (void)cancel;
- (void)checkStartingBatteryPercentage:(id)a3;
- (void)endBatteryDrainWithStatusCode:(id)a3;
- (void)ensureAnalyticsFreeEnvironment;
- (void)failedToExecuteWithError:(id)a3;
- (void)initOperations;
- (void)receivedInterruptNotification:(id)a3;
- (void)recievedBatteryPercentageChangedNotification:(id)a3;
- (void)recievedConnectedToChargerNotification:(id)a3;
- (void)recievedShutdownNotification;
- (void)recievedThermalStateChangedNotification;
- (void)setAccessoryConnectDetector:(id)a3;
- (void)setAccessoryDisconnectDetector:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setBrightnessSystemClient:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDrainQueue:(id)a3;
- (void)setInputs:(id)a3;
- (void)setIsThermalBlocked:(BOOL)a3;
- (void)setOriginalPowerMode:(int64_t)a3;
- (void)setOriginalPowerModeSet:(BOOL)a3;
- (void)setResponder:(id)a3;
- (void)setRunNumber:(id)a3;
- (void)setStartingBatteryPercentage:(id)a3;
- (void)setWasAutoBrightnessEnabled:(BOOL)a3;
- (void)setWasChargingDisabledDuringTest:(BOOL)a3;
- (void)setupNotifications;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)waitForSafeThermalState;
@end

@implementation BatteryDrainController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BatteryDrainController *)self setInputs:v6];
  [(BatteryDrainController *)self setResponder:v7];
  [(BatteryDrainController *)self setIsThermalBlocked:0];
  [(BatteryDrainController *)self setOriginalPowerModeSet:0];
  v8 = +[NSNumber numberWithInt:1];
  [(BatteryDrainController *)self setRunNumber:v8];

  v9 = [(BatteryDrainController *)self inputs];
  if (![v9 isAccessoryDetectorActive])
  {

LABEL_5:
    v12 = [(BatteryDrainController *)self inputs];
    if ([v12 disableUSBCharging])
    {
      unsigned int v13 = [(BatteryDrainController *)self isDeviceConnectedToUnexpectedAccessory];

      if (v13)
      {
        id v43 = 0;
        +[BatteryDrainController setCode:-3 forError:&v43];
        id v11 = v43;
        [(BatteryDrainController *)self failedToExecuteWithError:v11];
        [(BatteryDrainController *)self endBatteryDrainWithStatusCode:&off_100014DD8];
        goto LABEL_26;
      }
    }
    else
    {
    }
    v14 = [(BatteryDrainController *)self inputs];
    if ([v14 drainAudio])
    {
      v15 = [(BatteryDrainController *)self inputs];
      v16 = [v15 audioFilename];

      if (v16)
      {
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        v18 = NSTemporaryDirectory();
        v19 = +[NSURL fileURLWithPath:v18 isDirectory:1];

        v20 = +[NSUUID UUID];
        v21 = [v20 UUIDString];
        v22 = [v19 URLByAppendingPathComponent:v21];

        uint64_t v37 = 0;
        v38 = &v37;
        uint64_t v39 = 0x3032000000;
        v40 = sub_1000065CC;
        v41 = sub_1000065DC;
        id v42 = 0;
        v23 = [(BatteryDrainController *)self inputs];
        v24 = [v23 audioFilename];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000065E4;
        v34[3] = &unk_1000144B0;
        v36 = &v37;
        v25 = v17;
        v35 = v25;
        [v7 getAsset:v24 completion:v34];

        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        if (v38[5])
        {
          v26 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v22;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
          }

          v27 = (void *)v38[5];
          id v33 = 0;
          unsigned int v28 = [v27 writeToURL:v22 options:268435457 error:&v33];
          id v11 = v33;
          if (v28)
          {
            [(BatteryDrainController *)self setAudioFileURL:v22];
LABEL_24:

            _Block_object_dispose(&v37, 8);
            goto LABEL_25;
          }
          v29 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10000CC34((uint64_t)v22, (uint64_t)v11, v29);
          }
        }
        else
        {
          v29 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = [(BatteryDrainController *)self inputs];
            v31 = [v30 audioFilename];
            sub_10000CBD4(v31, buf, v29, v30);
          }
          id v11 = 0;
        }

        goto LABEL_24;
      }
    }
    else
    {
    }
    id v11 = 0;
LABEL_25:
    v32 = +[NSUserDefaults standardUserDefaults];
    [(BatteryDrainController *)self setDefaults:v32];

    goto LABEL_26;
  }
  unsigned __int8 v10 = [(BatteryDrainController *)self isDeviceConnectedToRequiredAccessory];

  if (v10) {
    goto LABEL_5;
  }
  id v44 = 0;
  +[BatteryDrainController setCode:-52 forError:&v44];
  id v11 = v44;
  [(BatteryDrainController *)self failedToExecuteWithError:v11];
  [(BatteryDrainController *)self endBatteryDrainWithStatusCode:&off_100014DC0];
LABEL_26:
}

- (void)start
{
  [(BatteryDrainController *)self ensureAnalyticsFreeEnvironment];
  v3 = (void *)MGCopyAnswer();
  [v3 floatValue];
  *(float *)&double v5 = v4 / 100.0;
  id v6 = +[NSNumber numberWithFloat:v5];
  [(BatteryDrainController *)self setStartingBatteryPercentage:v6];

  uint64_t v7 = [(BatteryDrainController *)self startingBatteryPercentage];
  [(BatteryDrainController *)self checkStartingBatteryPercentage:v7];

  [(BatteryDrainController *)self waitForSafeThermalState];
  [(BatteryDrainController *)self setupNotifications];
  LOBYTE(v7) = MGGetBoolAnswer();
  int v8 = MGGetBoolAnswer();
  if ((v7 & 1) != 0 || v8) {
    [(BatteryDrainController *)self recievedConnectedToChargerNotification:0];
  }
  v9 = [(BatteryDrainController *)self startingBatteryPercentage];
  [v9 floatValue];
  float v11 = v10;
  v12 = [(BatteryDrainController *)self inputs];
  unsigned int v13 = [v12 targetBatteryPercentage];
  [v13 floatValue];
  unint64_t v15 = llroundf((float)(v11 - v14) * 100.0);
  v16 = [(BatteryDrainController *)self progress];
  [v16 setTotalUnitCount:v15];

  [(BatteryDrainController *)self initOperations];
  dispatch_semaphore_t v17 = [(BatteryDrainController *)self inputs];
  LODWORD(v12) = [v17 autoBrightnessOff];

  if (v12)
  {
    id v18 = objc_alloc_init((Class)BrightnessSystemClient);
    [(BatteryDrainController *)self setBrightnessSystemClient:v18];

    v19 = [(BatteryDrainController *)self brightnessSystemClient];
    id v20 = [v19 copyPropertyForKey:@"DisplayAutoBrightnessActive"];
    -[BatteryDrainController setWasAutoBrightnessEnabled:](self, "setWasAutoBrightnessEnabled:", [v20 BOOLValue]);

    v21 = [(BatteryDrainController *)self brightnessSystemClient];
    [v21 setProperty:&__kCFBooleanFalse forKey:@"DisplayAutoBrightnessActive"];

    v22 = [(BatteryDrainController *)self brightnessSystemClient];
    [v22 setProperty:&__kCFBooleanFalse forKey:@"DisplayBrightnessAuto"];

    v23 = [(BatteryDrainController *)self brightnessSystemClient];
    [v23 setProperty:&__kCFBooleanFalse forKey:@"ALSTurnOn"];
  }
  v24 = [(BatteryDrainController *)self inputs];
  unsigned int v25 = [v24 lowPowerModeOff];

  if (v25)
  {
    id v26 = objc_alloc_init((Class)_PMLowPowerMode);
    -[BatteryDrainController setOriginalPowerMode:](self, "setOriginalPowerMode:", [v26 getPowerMode]);
    [(BatteryDrainController *)self setOriginalPowerModeSet:1];
    if (([v26 setPowerMode:0 fromSource:@"Diagnostics"] & 1) == 0)
    {
      v27 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to turn off the Low Power Mode", v28, 2u);
      }
    }
  }
}

- (void)initOperations
{
  v3 = objc_opt_new();
  [(BatteryDrainController *)self setDrainQueue:v3];

  float v4 = [(BatteryDrainController *)self drainQueue];
  [v4 setQualityOfService:25];

  double v5 = [(BatteryDrainController *)self drainQueue];
  [v5 setMaxConcurrentOperationCount:10];

  id v6 = [(BatteryDrainController *)self inputs];
  unsigned int v7 = [v6 drainAudio];

  if (v7)
  {
    int v8 = [AudioDrainOperation alloc];
    v9 = [(BatteryDrainController *)self audioFileURL];
    float v10 = [(BatteryDrainController *)self inputs];
    float v11 = [v10 audioVolume];
    [v11 floatValue];
    int v13 = v12;
    float v14 = [(BatteryDrainController *)self responder];
    LODWORD(v15) = v13;
    v16 = [(AudioDrainOperation *)v8 initWithAudioFileURL:v9 volume:v14 responder:v15];

    dispatch_semaphore_t v17 = [(BatteryDrainController *)self drainQueue];
    [v17 addOperation:v16];
  }
  id v18 = [(BatteryDrainController *)self inputs];
  unsigned int v19 = [v18 drainDisplay];

  if (v19)
  {
    id v20 = [DisplayDrainOperation alloc];
    v21 = [(BatteryDrainController *)self inputs];
    v22 = [v21 displayBrightness];
    [v22 floatValue];
    int v24 = v23;
    unsigned int v25 = [(BatteryDrainController *)self responder];
    LODWORD(v26) = v24;
    v27 = [(DisplayDrainOperation *)v20 initWithBrightness:v25 responder:v26];

    unsigned int v28 = [(BatteryDrainController *)self drainQueue];
    [v28 addOperation:v27];
  }
  v29 = [(BatteryDrainController *)self inputs];
  unsigned int v30 = [v29 drainCPU];

  if (v30)
  {
    v31 = [CPUDrainOperation alloc];
    v32 = [(BatteryDrainController *)self inputs];
    id v33 = [v32 cpuDrainMatrixLength];
    v34 = [(BatteryDrainController *)self inputs];
    v35 = [v34 cpuDrainIterationDelay];
    v36 = [(CPUDrainOperation *)v31 initWithMatrixLength:v33 iterationDelay:v35];

    uint64_t v37 = [(BatteryDrainController *)self drainQueue];
    [v37 addOperation:v36];
  }
  v38 = [(BatteryDrainController *)self inputs];
  unsigned int v39 = [v38 drainGPU];

  if (v39)
  {
    v40 = [GPUDrainOperation alloc];
    v41 = [(BatteryDrainController *)self inputs];
    id v42 = [v41 gpuDrainIterationDelay];
    id v44 = [(GPUDrainOperation *)v40 initWithIterationDelay:v42];

    id v43 = [(BatteryDrainController *)self drainQueue];
    [v43 addOperation:v44];
  }
}

- (BOOL)isDeviceConnectedToRequiredAccessory
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = +[EAAccessoryManager sharedAccessoryManager];
  float v4 = [v3 connectedAccessories];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        float v10 = [(BatteryDrainController *)self inputs];
        float v11 = [v10 accessoryDetectorModelNumbers];
        int v12 = [v9 modelNumber];
        unsigned __int8 v13 = [v11 containsObject:v12];

        if (v13)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isDeviceConnectedToUnexpectedAccessory
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = +[EAAccessoryManager sharedAccessoryManager];
  float v4 = [v3 connectedAccessories];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        float v10 = [(BatteryDrainController *)self inputs];
        float v11 = [v10 accessoryDetectorModelNumbers];
        int v12 = [v9 modelNumber];
        unsigned int v13 = [v11 containsObject:v12];

        if (!v13)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)failedToExecuteWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(BatteryDrainController *)self result];
  [v5 setData:&__NSDictionary0__struct];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
  uint64_t v7 = [(BatteryDrainController *)self result];
  [v7 setStatusCode:v6];

  [(BatteryDrainController *)self setFinished:1];
  int v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = [v4 code];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to execute with error code: %ld", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cancel
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User canceled battery drain tool", v4, 2u);
  }

  [(BatteryDrainController *)self setFinished:1];
}

- (void)endBatteryDrainWithStatusCode:(id)a3
{
  id v4 = a3;
  id v5 = [(BatteryDrainController *)self result];
  [v5 setStatusCode:v4];
}

- (void)setupNotifications
{
  +[BatteryStateNotifier registerForBatteryEvents];
  v3 = [(BatteryDrainController *)self inputs];
  id v4 = [v3 targetBatteryPercentage];
  [v4 floatValue];
  float v6 = v5;

  if (v6 > 0.0)
  {
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"recievedBatteryPercentageChangedNotification:" name:@"com.apple.Diagnostics.BatteryLevelChangedNotification" object:0];
  }
  int v8 = [(BatteryDrainController *)self inputs];
  unsigned int v9 = [v8 isAccessoryDetectorActive];

  if (v9)
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"receivedInterruptNotification:" name:@"AccessoryDisconnectedNotification" object:0];

    float v11 = [DAAccessoryDisconnectDetector alloc];
    int v12 = [(BatteryDrainController *)self inputs];
    unsigned int v13 = [v12 accessoryDetectorModelNumbers];
    BOOL v14 = [(DAAccessoryDisconnectDetector *)v11 initWithModelNumbers:v13];
    [(BatteryDrainController *)self setAccessoryDisconnectDetector:v14];

    double v15 = [(BatteryDrainController *)self accessoryDisconnectDetector];
    [v15 start];
  }
  long long v16 = [(BatteryDrainController *)self inputs];
  unsigned int v17 = [v16 disableUSBCharging];

  if (v17)
  {
    long long v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:self selector:"receivedInterruptNotification:" name:@"AccessoryConnectedNotification" object:0];

    long long v19 = [DAAccessoryConnectDetector alloc];
    id v20 = [(BatteryDrainController *)self inputs];
    v21 = [v20 accessoryDetectorModelNumbers];
    v22 = [(DAAccessoryConnectDetector *)v19 initWithModelNumbers:v21];
    [(BatteryDrainController *)self setAccessoryConnectDetector:v22];

    int v23 = [(BatteryDrainController *)self accessoryConnectDetector];
    [v23 start];
  }
  int v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"recievedConnectedToChargerNotification:" name:@"com.apple.Diagnostics.BatteryConnectedToChargingNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  double v26 = +[NSString stringWithCString:kOSThermalNotificationName encoding:4];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10000748C, v26, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100007504, @"com.apple.springboard.deviceWillShutDown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)recievedThermalStateChangedNotification
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000760C;
  block[3] = &unk_1000144D8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)ensureAnalyticsFreeEnvironment
{
  int v3 = MGGetBoolAnswer();
  int v4 = DiagnosticLogSubmissionEnabled();
  float v5 = [(BatteryDrainController *)self defaults];
  float v6 = [v5 objectForKey:@"SkipAnalyticsCheck"];

  uint64_t v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NOT in";
    if (v3) {
      CFStringRef v8 = @"in";
    }
    CFStringRef v9 = @"enabled";
    if (!v4) {
      CFStringRef v9 = @"disabled";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v14 = v8;
    __int16 v15 = 2112;
    CFStringRef v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is %@ Diagnostics Mode. Analytics are %@", buf, 0x16u);
  }

  if (((v3 | v4 ^ 1) & 1) == 0 && ([v6 BOOLValue] & 1) == 0)
  {
    id v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device configuration will affect analytics. Ending test.", buf, 2u);
    }

    id v12 = 0;
    +[BatteryDrainController setCode:-4 forError:&v12];
    id v11 = v12;
    [(BatteryDrainController *)self failedToExecuteWithError:v11];
  }
}

- (void)checkStartingBatteryPercentage:(id)a3
{
  id v4 = a3;
  [v4 floatValue];
  float v6 = v5;
  uint64_t v7 = [(BatteryDrainController *)self inputs];
  CFStringRef v8 = [v7 targetBatteryPercentage];
  [v8 floatValue];
  float v10 = v9;

  if (v6 <= v10)
  {
    id v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(BatteryDrainController *)self inputs];
      unsigned int v13 = [v12 targetBatteryPercentage];
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting battery level (%@) is already at or below target battery level (%@)", (uint8_t *)&v15, 0x16u);
    }
    CFStringRef v14 = [(BatteryDrainController *)self result];
    [v14 setStatusCode:&off_100014DF0];

    [(BatteryDrainController *)self setFinished:1];
  }
}

- (void)waitForSafeThermalState
{
  if ((int)OSThermalNotificationCurrentLevel() >= 11)
  {
    do
      sleep(5u);
    while ((int)OSThermalNotificationCurrentLevel() > 10);
  }
}

- (void)receivedInterruptNotification:(id)a3
{
  id v4 = a3;
  float v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:@"AccessoryDisconnectedNotification"];

  if (!v6)
  {
    CFStringRef v8 = [v4 name];
    if ([v8 isEqualToString:@"AccessoryConnectedNotification"])
    {
      float v9 = [v4 userInfo];
      float v10 = [v9 valueForKey:@"accessoryModelNumberInList"];
      unsigned __int8 v11 = [v10 BOOLValue];

      if ((v11 & 1) == 0)
      {
        unsigned int v13 = 0;
        +[BatteryDrainController setCode:-3 forError:&v13];
        uint64_t v7 = v13;
        goto LABEL_6;
      }
    }
    else
    {
    }
    id v12 = 0;
    goto LABEL_9;
  }
  CFStringRef v14 = 0;
  +[BatteryDrainController setCode:-52 forError:&v14];
  uint64_t v7 = v14;
LABEL_6:
  id v12 = v7;
LABEL_9:
  [(BatteryDrainController *)self failedToExecuteWithError:v12];
}

- (void)recievedBatteryPercentageChangedNotification:(id)a3
{
  id v4 = [a3 object];
  float v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    int v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Battery level change notification recieved: %@", (uint8_t *)&v22, 0xCu);
  }

  [v4 floatValue];
  float v7 = v6;
  CFStringRef v8 = [(BatteryDrainController *)self inputs];
  float v9 = [v8 targetBatteryPercentage];
  [v9 floatValue];
  float v11 = v10;

  if (v7 <= v11)
  {
    long long v18 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [(BatteryDrainController *)self inputs];
      id v20 = [v19 targetBatteryPercentage];
      int v22 = 138412546;
      int v23 = v4;
      __int16 v24 = 2112;
      unsigned int v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The current battery level (%@) is at or below target battery level (%@). Ending test", (uint8_t *)&v22, 0x16u);
    }
    v21 = [(BatteryDrainController *)self result];
    [v21 setStatusCode:&off_100014DF0];

    [(BatteryDrainController *)self setFinished:1];
  }
  else
  {
    id v12 = [(BatteryDrainController *)self startingBatteryPercentage];
    [v12 floatValue];
    float v14 = v13;
    [v4 floatValue];
    unint64_t v16 = llroundf((float)(v14 - v15) * 100.0);
    __int16 v17 = [(BatteryDrainController *)self progress];
    [v17 setCompletedUnitCount:v16];
  }
}

- (void)recievedConnectedToChargerNotification:(id)a3
{
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "The device is connected to charging.", buf, 2u);
  }

  if (([(BatteryDrainController *)self isCancelled] & 1) != 0
    || [(BatteryDrainController *)self isFinished])
  {
    float v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      float v6 = "Diagnostic is finished. Ignoring charge notification";
      float v7 = v12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    CFStringRef v8 = [(BatteryDrainController *)self inputs];
    unsigned int v9 = [v8 disableUSBCharging];

    if (!v9 || !+[BatteryStateNotifier disableUSBCharging])
    {
      id v10 = 0;
      +[BatteryDrainController setCode:-2 forError:&v10];
      float v5 = v10;
      [(BatteryDrainController *)self failedToExecuteWithError:v5];
      goto LABEL_13;
    }
    [(BatteryDrainController *)self setWasChargingDisabledDuringTest:1];
    float v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      float v6 = "USB Charging was successfully disabled.";
      float v7 = (uint8_t *)&v11;
      goto LABEL_7;
    }
  }
LABEL_13:
}

- (void)recievedShutdownNotification
{
  if ((int)OSThermalNotificationCurrentLevel() > 10)
  {
    id v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutdown may have been initiated by high thermals. Not sending success status.", v5, 2u);
    }
  }
  else
  {
    int v3 = [(BatteryDrainController *)self result];
    [v3 setStatusCode:&off_100014DF0];

    [(BatteryDrainController *)self setFinished:1];
  }
}

- (void)teardown
{
  int v3 = [(BatteryDrainController *)self drainQueue];
  [v3 cancelAllOperations];

  id v4 = [(BatteryDrainController *)self inputs];
  unsigned int v5 = [v4 autoBrightnessOff];

  if (v5 && [(BatteryDrainController *)self wasAutoBrightnessEnabled])
  {
    float v6 = [(BatteryDrainController *)self brightnessSystemClient];
    [v6 setProperty:&__kCFBooleanTrue forKey:@"DisplayAutoBrightnessActive"];

    float v7 = [(BatteryDrainController *)self brightnessSystemClient];
    [v7 setProperty:&__kCFBooleanTrue forKey:@"DisplayBrightnessAuto"];

    CFStringRef v8 = [(BatteryDrainController *)self brightnessSystemClient];
    [v8 setProperty:&__kCFBooleanTrue forKey:@"ALSTurnOn"];
  }
  id v9 = [(BatteryDrainController *)self inputs];
  if ([v9 lowPowerModeOff])
  {
    unsigned int v10 = [(BatteryDrainController *)self originalPowerModeSet];

    if (!v10) {
      goto LABEL_11;
    }
    id v9 = objc_alloc_init((Class)_PMLowPowerMode);
    if ((objc_msgSend(v9, "setPowerMode:fromSource:", -[BatteryDrainController originalPowerMode](self, "originalPowerMode"), @"Diagnostics") & 1) == 0)
    {
      __int16 v11 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = +[NSNumber numberWithInteger:[(BatteryDrainController *)self originalPowerMode]];
        int v21 = 138412290;
        int v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to restore original power mode %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }

LABEL_11:
  float v13 = [(BatteryDrainController *)self inputs];
  unsigned int v14 = [v13 isAccessoryDetectorActive];

  if (v14)
  {
    float v15 = [(BatteryDrainController *)self accessoryDisconnectDetector];
    [v15 stop];
  }
  +[BatteryStateNotifier unregisterForBatteryEvents];
  unint64_t v16 = +[NSNotificationCenter defaultCenter];
  [v16 removeObserver:self];

  if ([(BatteryDrainController *)self wasChargingDisabledDuringTest])
  {
    unsigned int v17 = +[BatteryStateNotifier enableUSBCharging];
    long long v18 = DiagnosticLogHandleForCategory();
    long long v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "USB Charging was successfully restored.", (uint8_t *)&v21, 2u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_10000CCBC(v19);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"DABatteryDrainTestErrorDomain" code:a3 userInfo:0];
  }
  return a4 != 0;
}

- (BatteryDrainInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (DKResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
}

- (NSOperationQueue)drainQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDrainQueue:(id)a3
{
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (NSNumber)runNumber
{
  return self->_runNumber;
}

- (void)setRunNumber:(id)a3
{
}

- (NSNumber)startingBatteryPercentage
{
  return self->_startingBatteryPercentage;
}

- (void)setStartingBatteryPercentage:(id)a3
{
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
}

- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector
{
  return self->_accessoryDisconnectDetector;
}

- (void)setAccessoryDisconnectDetector:(id)a3
{
}

- (DAAccessoryConnectDetector)accessoryConnectDetector
{
  return self->_accessoryConnectDetector;
}

- (void)setAccessoryConnectDetector:(id)a3
{
}

- (UIDevice)currentDevice
{
  return (UIDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentDevice:(id)a3
{
}

- (BOOL)isThermalBlocked
{
  return self->_isThermalBlocked;
}

- (void)setIsThermalBlocked:(BOOL)a3
{
  self->_isThermalBlocked = a3;
}

- (BOOL)wasAutoBrightnessEnabled
{
  return self->_wasAutoBrightnessEnabled;
}

- (void)setWasAutoBrightnessEnabled:(BOOL)a3
{
  self->_wasAutoBrightnessEnabled = a3;
}

- (BOOL)originalPowerModeSet
{
  return self->_originalPowerModeSet;
}

- (void)setOriginalPowerModeSet:(BOOL)a3
{
  self->_originalPowerModeSet = a3;
}

- (int64_t)originalPowerMode
{
  return self->_originalPowerMode;
}

- (void)setOriginalPowerMode:(int64_t)a3
{
  self->_originalPowerMode = a3;
}

- (BOOL)wasChargingDisabledDuringTest
{
  return self->_wasChargingDisabledDuringTest;
}

- (void)setWasChargingDisabledDuringTest:(BOOL)a3
{
  self->_wasChargingDisabledDuringTest = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_accessoryConnectDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_startingBatteryPercentage, 0);
  objc_storeStrong((id *)&self->_runNumber, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_drainQueue, 0);
  objc_storeStrong((id *)&self->_responder, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end