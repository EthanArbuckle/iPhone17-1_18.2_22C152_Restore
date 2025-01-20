@interface HUHeadphoneLevelController
+ (id)sharedController;
- (ADAMAudioDataReceiver)receiver;
- (AXDispatchTimer)adamSuspendedTimer;
- (BOOL)isConnectedToIDS;
- (BOOL)isMeasurementEnabled;
- (BOOL)shouldStreamingDataToGizmo;
- (HUHeadphoneLevelController)init;
- (NSMutableArray)automationSampleData;
- (OS_dispatch_queue)dataQueue;
- (OS_dispatch_queue)idsQueue;
- (float)fastLeq;
- (float)slowLeq;
- (id)_pushPayload;
- (id)_sendIDSRequestToCompanion:(id)a3 messageIdentifier:(unint64_t)a4;
- (id)registerForHeadphoneLevelUpdates:(id)a3;
- (id)registerForRemoteHeadphoneLevelChangesUpdates:(id)a3;
- (id)registerForRemoteHeadphoneLevelUpdates:(id)a3;
- (unint64_t)_audioLevelFromAudioDict:(id)a3;
- (unint64_t)streamingDataToGizmoType;
- (unint64_t)streamingToGizmoAudioLevel;
- (unint64_t)thresholdLevel;
- (void)_automationPlaySampleData;
- (void)_automationStartPlayingSampleData:(id)a3;
- (void)_mediaPlaybackDidChange:(id)a3;
- (void)_publishAudioDataIDSMessage:(id)a3;
- (void)_publishRequestAudioDataIDSMessage:(id)a3;
- (void)_pushValues:(id)a3 identifier:(unint64_t)a4;
- (void)_registerMediaNotification;
- (void)_startIDSConnection;
- (void)_startRecevingADAMAudioSample:(BOOL)a3;
- (void)_stopIDSConnection;
- (void)_unregisterMediaNotification;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)didReceiveIncomingData:(id)a3;
- (void)pushValuesToLocalOrIDSListeners;
- (void)pushValuesToRemoteChangeListeners;
- (void)pushValuesToRemoteListeners;
- (void)receiveAudioSample:(id)a3;
- (void)restartADAMTimer;
- (void)serverConnectionWasInterrupted;
- (void)setAdamSuspendedTimer:(id)a3;
- (void)setAutomationSampleData:(id)a3;
- (void)setDataQueue:(id)a3;
- (void)setFastLeq:(float)a3;
- (void)setIdsQueue:(id)a3;
- (void)setIsConnectedToIDS:(BOOL)a3;
- (void)setMeasurementEnabled:(BOOL)a3;
- (void)setReceiver:(id)a3;
- (void)setShouldStreamingDataToGizmo:(BOOL)a3;
- (void)setSlowLeq:(float)a3;
- (void)setStreamingDataToGizmoType:(unint64_t)a3;
- (void)setStreamingToGizmoAudioLevel:(unint64_t)a3;
- (void)setThresholdLevel:(unint64_t)a3;
@end

@implementation HUHeadphoneLevelController

- (HUHeadphoneLevelController)init
{
  v20.receiver = self;
  v20.super_class = (Class)HUHeadphoneLevelController;
  v2 = [(HUHeadphoneLevelController *)&v20 init];
  if (v2)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v3 = (void *)getADAMAudioDataReceiverClass_softClass;
    uint64_t v25 = getADAMAudioDataReceiverClass_softClass;
    if (!getADAMAudioDataReceiverClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getADAMAudioDataReceiverClass_block_invoke;
      v21[3] = &unk_2640FC9B0;
      v21[4] = &v22;
      __getADAMAudioDataReceiverClass_block_invoke((uint64_t)v21);
      v3 = (void *)v23[3];
    }
    v4 = v3;
    _Block_object_dispose(&v22, 8);
    id v5 = [v4 alloc];
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = [v6 bundleIdentifier];
    uint64_t v8 = [v5 initWithIdentifier:v7];
    v9 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v8;

    [*((id *)v2 + 3) setDelegate:v2];
    [*((id *)v2 + 3) stopReceivingAudioSampleType:1751213428];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.HearingUtilities.HUHeadphoneLevelController.DataQueue", v10);
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:*((void *)v2 + 5)];
    v14 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v13;

    if ([MEMORY[0x263F472B0] isInternalInstall])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_automationPlayAutomationAudioSamples, (CFStringRef)*MEMORY[0x263F8B2E0], 0, (CFNotificationSuspensionBehavior)0);
    }
    *(_WORD *)(v2 + 9) = 0;
    *((void *)v2 + 8) = 0;
    *((void *)v2 + 9) = 0;
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.HearingUtilities.HUHeadphoneLevelController.IDSQueue", v16);
    v18 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v17;

    [v2 _startIDSConnection];
  }
  return (HUHeadphoneLevelController *)v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(ADAMAudioDataReceiver *)self->_receiver stopReceivingAudioSampleType:1751213428];
  [(HUHeadphoneLevelController *)self _stopIDSConnection];
  [(HUHeadphoneLevelController *)self _unregisterMediaNotification];
  v4.receiver = self;
  v4.super_class = (Class)HUHeadphoneLevelController;
  [(HUHeadphoneLevelController *)&v4 dealloc];
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedController_Controller;

  return v2;
}

uint64_t __46__HUHeadphoneLevelController_sharedController__block_invoke()
{
  sharedController_Controller = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)registerForHeadphoneLevelUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v8 = HCLogSoundMeter();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Local: Start receiving headphone audio updates", buf, 2u);
    }

    v10 = [v4 client];

    dispatch_queue_t v11 = v10;
    uint64_t v12 = 1;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Local: Stop receiving headphone audio updates", v14, 2u);
    }

    v10 = [v4 client];

    dispatch_queue_t v11 = v10;
    uint64_t v12 = 0;
  }
  [v11 setWantsUpdates:v12 forIdentifier:0x100000];

  [(HUHeadphoneLevelController *)self _startRecevingADAMAudioSample:v7];
  return 0;
}

- (void)_startRecevingADAMAudioSample:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[AXHeardController sharedServer];
  uint64_t v6 = [v5 countOfClientsListeningForIdentifier:0x100000];

  uint64_t v7 = +[HUHearingAidSettings sharedInstance];
  int v8 = [v7 anyGizmoLiveHeadphoneLevelEnabled];

  if (v8) {
    BOOL v9 = [(HUHeadphoneLevelController *)self shouldStreamingDataToGizmo];
  }
  else {
    BOOL v9 = 0;
  }
  if (v6) {
    int v10 = 1;
  }
  else {
    int v10 = v9;
  }
  if (v3)
  {
    if (!v10) {
      return;
    }
    dispatch_queue_t v11 = HCLogSoundMeter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_INFO, "Start receiving ADAM headphone audio data", buf, 2u);
    }

    uint64_t v12 = [(HUHeadphoneLevelController *)self receiver];
    [v12 startReceivingAudioSampleType:1751213428];
  }
  else
  {
    if (v10) {
      return;
    }
    uint64_t v13 = HCLogSoundMeter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_INFO, "Stop receiving ADAM headphone audio data", v14, 2u);
    }

    uint64_t v12 = [(HUHeadphoneLevelController *)self receiver];
    [v12 stopReceivingAudioSampleType:1751213428];
  }
}

- (void)restartADAMTimer
{
  [(AXDispatchTimer *)self->_adamSuspendedTimer cancel];
  objc_initWeak(&location, self);
  adamSuspendedTimer = self->_adamSuspendedTimer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HUHeadphoneLevelController_restartADAMTimer__block_invoke;
  v4[3] = &unk_2640FC910;
  objc_copyWeak(&v5, &location);
  [(AXDispatchTimer *)adamSuspendedTimer afterDelay:v4 processBlock:0.2];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__HUHeadphoneLevelController_restartADAMTimer__block_invoke(uint64_t a1)
{
  v2 = HCLogSoundMeter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_INFO, "Headphone level didn't receive measurements from ADAM", v9, 2u);
  }

  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setMeasurementEnabled:0];

  id v5 = objc_loadWeakRetained(v3);
  [v5 setFastLeq:0.0];

  id v6 = objc_loadWeakRetained(v3);
  [v6 setSlowLeq:0.0];

  id v7 = objc_loadWeakRetained(v3);
  [v7 pushValuesToLocalOrIDSListeners];

  id v8 = objc_loadWeakRetained(v3);
  [v8 pushValuesToRemoteListeners];
}

- (id)_pushPayload
{
  BOOL v3 = NSDictionary;
  id v4 = NSNumber;
  [(HUHeadphoneLevelController *)self slowLeq];
  id v5 = objc_msgSend(v4, "numberWithFloat:");
  id v6 = NSNumber;
  [(HUHeadphoneLevelController *)self fastLeq];
  id v7 = objc_msgSend(v6, "numberWithFloat:");
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HUHeadphoneLevelController isMeasurementEnabled](self, "isMeasurementEnabled"));
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUHeadphoneLevelController thresholdLevel](self, "thresholdLevel"));
  int v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, @"HUEDSlowLeqIdentifier", v7, @"HUEDFastLeqIdentifier", v8, @"HUEDEnabledIdentifier", v9, @"HUEDThresholdCrossedIdentifier", 0);

  return v10;
}

- (void)pushValuesToLocalOrIDSListeners
{
  BOOL v3 = [(HUHeadphoneLevelController *)self dataQueue];
  dispatch_assert_queue_V2(v3);

  id v6 = [(HUHeadphoneLevelController *)self _pushPayload];
  -[HUHeadphoneLevelController _pushValues:identifier:](self, "_pushValues:identifier:");
  id v4 = +[HUHearingAidSettings sharedInstance];
  int v5 = [v4 anyGizmoLiveHeadphoneLevelEnabled];

  if (v5) {
    [(HUHeadphoneLevelController *)self _publishAudioDataIDSMessage:v6];
  }
}

- (void)pushValuesToRemoteListeners
{
  BOOL v3 = [(HUHeadphoneLevelController *)self dataQueue];
  dispatch_assert_queue_V2(v3);

  id v6 = [(HUHeadphoneLevelController *)self _pushPayload];
  id v4 = +[HUHearingAidSettings sharedInstance];
  int v5 = [v4 anyGizmoLiveHeadphoneLevelEnabled];

  if (v5) {
    [(HUHeadphoneLevelController *)self _pushValues:v6 identifier:0x200000];
  }
}

- (void)pushValuesToRemoteChangeListeners
{
  v9[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HUHeadphoneLevelController *)self dataQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[HUHearingAidSettings sharedInstance];
  int v5 = [v4 anyGizmoLiveHeadphoneLevelEnabled];

  if (v5)
  {
    id v8 = @"HUGizmoAudioLevelIdentifier";
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUHeadphoneLevelController streamingToGizmoAudioLevel](self, "streamingToGizmoAudioLevel"));
    v9[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(HUHeadphoneLevelController *)self _pushValues:v7 identifier:0x400000];
  }
}

- (void)_pushValues:(id)a3 identifier:(unint64_t)a4
{
  id v10 = a3;
  int v5 = +[AXHeardController sharedServer];
  uint64_t v6 = [v5 countOfClientsListeningForIdentifier:a4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v10 andIdentifier:a4];
    id v8 = +[AXHeardController sharedServer];
    BOOL v9 = [MEMORY[0x263F472C0] messageWithPayload:v7];
    [v8 sendUpdateMessage:v9 forIdentifier:a4];
  }
}

- (void)receiveAudioSample:(id)a3
{
  id v4 = a3;
  int v5 = [(HUHeadphoneLevelController *)self dataQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HUHeadphoneLevelController_receiveAudioSample___block_invoke;
  v7[3] = &unk_2640FC938;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__HUHeadphoneLevelController_receiveAudioSample___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  [v2 floatValue];
  float v4 = v3;

  int v5 = [*(id *)(a1 + 32) metadata];
  id v6 = getADAFMetadataKeyHAEDataForGauge();
  id v7 = [v5 objectForKey:v6];
  int v8 = [v7 BOOLValue];

  id v10 = *(void **)(a1 + 40);
  if (v8)
  {
    *(float *)&double v9 = v4;
    [v10 setFastLeq:v9];
  }
  else
  {
    *(float *)&double v9 = v4;
    [v10 setSlowLeq:v9];
    if (v4 < 80.0) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 80;
    }
    [*(id *)(a1 + 40) setThresholdLevel:v11];
  }
  [*(id *)(a1 + 40) setMeasurementEnabled:1];
  [*(id *)(a1 + 40) pushValuesToLocalOrIDSListeners];
  uint64_t v12 = *(void **)(a1 + 40);

  return [v12 restartADAMTimer];
}

- (id)registerForRemoteHeadphoneLevelUpdates:(id)a3
{
  id v4 = a3;
  int v5 = +[HUHearingAidSettings sharedInstance];
  int v6 = [v5 anyGizmoLiveHeadphoneLevelEnabled];

  if (v6) {
    id v7 = [(HUHeadphoneLevelController *)self _sendIDSRequestToCompanion:v4 messageIdentifier:0x200000];
  }

  return 0;
}

- (id)registerForRemoteHeadphoneLevelChangesUpdates:(id)a3
{
  id v4 = a3;
  int v5 = +[HUHearingAidSettings sharedInstance];
  int v6 = [v5 anyGizmoLiveHeadphoneLevelEnabled];

  if (v6) {
    id v7 = [(HUHeadphoneLevelController *)self _sendIDSRequestToCompanion:v4 messageIdentifier:0x400000];
  }

  return 0;
}

- (id)_sendIDSRequestToCompanion:(id)a3 messageIdentifier:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 payload];
  int v8 = [v7 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = [v6 client];

  [v10 setWantsUpdates:v9 forIdentifier:a4];
  if (v9)
  {
    uint64_t v11 = HCLogSoundMeter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = a4;
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_INFO, "Remote: Start requesting headphone audio updates for %llu", buf, 0xCu);
    }

    uint64_t v12 = (void *)MEMORY[0x263F472B0];
    v23 = @"HUGizmoIDSRequestDataKey";
    uint64_t v24 = MEMORY[0x263EFFA88];
    uint64_t v13 = NSDictionary;
    v14 = &v24;
    v15 = &v23;
  }
  else
  {
    BOOL v16 = [(HUHeadphoneLevelController *)self isConnectedToIDS];
    dispatch_queue_t v17 = HCLogSoundMeter();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (!v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v26 = a4;
        _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_INFO, "Remote: Don't send Stop Updates message, already stopped for %llu", buf, 0xCu);
      }
      goto LABEL_13;
    }
    if (v18)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = a4;
      _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_INFO, "Remote: Stop requesting headphone audio updates for %llu", buf, 0xCu);
    }

    uint64_t v12 = (void *)MEMORY[0x263F472B0];
    v21 = @"HUGizmoIDSRequestDataKey";
    uint64_t v22 = MEMORY[0x263EFFA80];
    uint64_t v13 = NSDictionary;
    v14 = &v22;
    v15 = &v21;
  }
  v19 = objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1, v21, v22, v23, v24);
  dispatch_queue_t v17 = [v12 messagePayloadFromDictionary:v19 andIdentifier:a4];

  if (v17)
  {
    [(HUHeadphoneLevelController *)self _publishRequestAudioDataIDSMessage:v17];
LABEL_13:
  }
  return 0;
}

- (void)_startIDSConnection
{
  float v3 = +[HUHearingAidSettings sharedInstance];
  int v4 = [v3 anyGizmoLiveHeadphoneLevelEnabled];

  if (v4)
  {
    [(HUHeadphoneLevelController *)self setIsConnectedToIDS:1];
    int v5 = [(HUHeadphoneLevelController *)self idsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HUHeadphoneLevelController__startIDSConnection__block_invoke;
    block[3] = &unk_2640FC960;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __49__HUHeadphoneLevelController__startIDSConnection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (AXIDSServicesLibraryCore())
  {
    v2 = [getAXIDSServicesClass() sharedInstance];
    char v3 = [v2 containsClient:*(void *)(a1 + 32)];

    if ((v3 & 1) == 0)
    {
      int v4 = AXLogIDS();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "_startIDSConnection %@", (uint8_t *)&v7, 0xCu);
      }

      id v6 = [getAXIDSServicesClass() sharedInstance];
      [v6 registerForIncomingData:*(void *)(a1 + 32)];
    }
  }
}

- (void)_stopIDSConnection
{
  char v3 = +[HUHearingAidSettings sharedInstance];
  int v4 = [v3 anyGizmoLiveHeadphoneLevelEnabled];

  if (v4)
  {
    [(HUHeadphoneLevelController *)self setIsConnectedToIDS:0];
    uint64_t v5 = [(HUHeadphoneLevelController *)self idsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__HUHeadphoneLevelController__stopIDSConnection__block_invoke;
    block[3] = &unk_2640FC960;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __48__HUHeadphoneLevelController__stopIDSConnection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (AXIDSServicesLibraryCore())
  {
    v2 = [getAXIDSServicesClass() sharedInstance];
    int v3 = [v2 containsClient:*(void *)(a1 + 32)];

    if (v3)
    {
      int v4 = AXLogIDS();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "_stopIDSConnection %@", (uint8_t *)&v7, 0xCu);
      }

      id v6 = [getAXIDSServicesClass() sharedInstance];
      [v6 deregisterForIncomingData:*(void *)(a1 + 32)];
    }
  }
}

- (void)_publishAudioDataIDSMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HUHearingAidSettings sharedInstance];
  int v6 = [v5 anyGizmoLiveHeadphoneLevelEnabled];

  if (v6)
  {
    int v7 = [(HUHeadphoneLevelController *)self idsQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__HUHeadphoneLevelController__publishAudioDataIDSMessage___block_invoke;
    v8[3] = &unk_2640FC938;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __58__HUHeadphoneLevelController__publishAudioDataIDSMessage___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) shouldStreamingDataToGizmo])
  {
    if (([*(id *)(a1 + 32) streamingDataToGizmoType] & 0x200000) != 0)
    {
      int v3 = HCLogSoundMeter();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_INFO, "Publishing audio data(HCMessageIdentifierRemoteHeadphoneLevelUpdates) to Gizmo.", v13, 2u);
      }

      v2 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:*(void *)(a1 + 40) andIdentifier:0x200000];
      if (v2 && AXIDSServicesLibraryCore())
      {
        id v4 = [getAXIDSServicesClass() sharedInstance];
        id v5 = (id)[v4 publishDirectIDSMessage:v2];
      }
    }
    else
    {
      v2 = 0;
    }
    if (([*(id *)(a1 + 32) streamingDataToGizmoType] & 0x400000) != 0
      && (uint64_t v6 = [*(id *)(a1 + 32) _audioLevelFromAudioDict:*(void *)(a1 + 40)],
          [*(id *)(a1 + 32) streamingToGizmoAudioLevel] != v6))
    {
      uint64_t v8 = HCLogSoundMeter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Publishing audio data(HCMessageIdentifierRemoteHeadphoneLevelChangesUpdates) to Gizmo.", v13, 2u);
      }

      [*(id *)(a1 + 32) setStreamingToGizmoAudioLevel:v6];
      v14 = @"HUGizmoAudioLevelIdentifier";
      id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "streamingToGizmoAudioLevel"));
      v15[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

      int v7 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v10 andIdentifier:0x400000];

      if (v7)
      {
        if (AXIDSServicesLibraryCore())
        {
          uint64_t v11 = [getAXIDSServicesClass() sharedInstance];
          id v12 = (id)[v11 publishDirectIDSMessage:v7];
        }
      }
    }
    else
    {
      int v7 = v2;
    }
  }
}

- (unint64_t)_audioLevelFromAudioDict:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"HUEDEnabledIdentifier"];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"HUEDSlowLeqIdentifier"];

  [v6 floatValue];
  float v8 = v7;

  if (!v5) {
    return 1;
  }
  if (v8 >= 0.0 && v8 < 80.0) {
    return 2;
  }
  if (v8 >= 80.0) {
    return 3;
  }
  return 0;
}

- (void)_publishRequestAudioDataIDSMessage:(id)a3
{
  id v4 = a3;
  int v5 = +[HUHearingAidSettings sharedInstance];
  int v6 = [v5 anyGizmoLiveHeadphoneLevelEnabled];

  if (v6)
  {
    float v7 = [(HUHeadphoneLevelController *)self idsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HUHeadphoneLevelController__publishRequestAudioDataIDSMessage___block_invoke;
    block[3] = &unk_2640FC960;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __65__HUHeadphoneLevelController__publishRequestAudioDataIDSMessage___block_invoke(uint64_t a1)
{
  v2 = HCLogSoundMeter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_INFO, "Publishing request audio data to Companion.", v5, 2u);
  }

  if (AXIDSServicesLibraryCore())
  {
    id v3 = [getAXIDSServicesClass() sharedInstance];
    id v4 = (id)[v3 publishDirectIDSMessage:*(void *)(a1 + 32)];
  }
}

- (void)didReceiveIncomingData:(id)a3
{
  id v4 = a3;
  int v5 = +[HUHearingAidSettings sharedInstance];
  int v6 = [v5 anyGizmoLiveHeadphoneLevelEnabled];

  if (!v6) {
    goto LABEL_13;
  }
  if (!AXIDSServicesLibraryCore() || !getAXIDSServiceMessageKeySymbolLoc())
  {
    float v8 = (void *)MEMORY[0x263EFFA78];
LABEL_7:
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F47268]];
    uint64_t v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F47270]];
    id v12 = [v11 objectForKeyedSubscript:@"HUGizmoIDSRequestDataKey"];

    if (v12)
    {
      uint64_t v13 = [(HUHeadphoneLevelController *)self idsQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke;
      block[3] = &unk_2640FC988;
      id v21 = v11;
      uint64_t v22 = self;
      uint64_t v23 = v10;
      dispatch_async(v13, block);

      v14 = v21;
    }
    else
    {
      if (!v11)
      {
LABEL_12:

LABEL_13:
        return;
      }
      v15 = [(HUHeadphoneLevelController *)self dataQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke_14;
      v17[3] = &unk_2640FC988;
      uint64_t v19 = v10;
      v17[4] = self;
      id v18 = v11;
      dispatch_async(v15, v17);

      v14 = v18;
    }

    goto LABEL_12;
  }
  AXIDSServiceMessageKeySymbolLoc = (void *)getAXIDSServiceMessageKeySymbolLoc();
  if (AXIDSServiceMessageKeySymbolLoc)
  {
    float v8 = [v4 objectForKeyedSubscript:*AXIDSServiceMessageKeySymbolLoc];
    goto LABEL_7;
  }
  uint64_t ADAFMetadataKeyHAEDataForGauge_cold_1 = getADAFMetadataKeyHAEDataForGauge_cold_1();
  __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke(ADAFMetadataKeyHAEDataForGauge_cold_1);
}

void __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"HUGizmoIDSRequestDataKey"];
  int v3 = [v2 BOOLValue];

  id v4 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 48) | [*(id *)(a1 + 40) streamingDataToGizmoType];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 40) streamingDataToGizmoType] & ~v6;
  }
  [v4 setStreamingDataToGizmoType:v5];
  if (*(void *)(a1 + 48) == 0x400000) {
    [*(id *)(a1 + 40) setStreamingToGizmoAudioLevel:1];
  }
  if (([*(id *)(a1 + 40) streamingDataToGizmoType] & 0x200000) != 0) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = ((unint64_t)[*(id *)(a1 + 40) streamingDataToGizmoType] >> 22) & 1;
  }
  [*(id *)(a1 + 40) setShouldStreamingDataToGizmo:v7];
  objc_msgSend(*(id *)(a1 + 40), "_startRecevingADAMAudioSample:", objc_msgSend(*(id *)(a1 + 40), "shouldStreamingDataToGizmo"));
  float v8 = HCLogSoundMeter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [*(id *)(a1 + 40) shouldStreamingDataToGizmo];
    uint64_t v10 = [*(id *)(a1 + 40) streamingDataToGizmoType];
    v11[0] = 67109376;
    v11[1] = v9;
    __int16 v12 = 2048;
    uint64_t v13 = v10;
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Receiving request audio data from Gizmo. shouldStreamingDataToGizmo: %i, streamingDataToGizmoType: %llu", (uint8_t *)v11, 0x12u);
  }
}

void __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke_14(uint64_t a1)
{
  v2 = HCLogSoundMeter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_INFO, "Receiving audio data from Companion.", v10, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 0x400000)
  {
    int v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HUGizmoAudioLevelIdentifier"];
    objc_msgSend(*(id *)(a1 + 32), "setStreamingToGizmoAudioLevel:", objc_msgSend(v9, "unsignedIntegerValue"));

    [*(id *)(a1 + 32) pushValuesToRemoteChangeListeners];
  }
  else if (v3 == 0x200000)
  {
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HUEDSlowLeqIdentifier"];
    [v4 floatValue];
    objc_msgSend(*(id *)(a1 + 32), "setSlowLeq:");

    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HUEDFastLeqIdentifier"];
    [v5 floatValue];
    objc_msgSend(*(id *)(a1 + 32), "setFastLeq:");

    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HUEDEnabledIdentifier"];
    objc_msgSend(*(id *)(a1 + 32), "setMeasurementEnabled:", objc_msgSend(v6, "BOOLValue"));

    unint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HUEDThresholdCrossedIdentifier"];
    [v7 floatValue];
    [*(id *)(a1 + 32) setThresholdLevel:(unint64_t)v8];

    [*(id *)(a1 + 32) pushValuesToRemoteListeners];
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  if (![a3 count]
    && [(HUHeadphoneLevelController *)self shouldStreamingDataToGizmo])
  {
    id v4 = HCLogSoundMeter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_INFO, "Gizmo is not connected anymore. Stop streaming to Gizmo.", v5, 2u);
    }

    [(HUHeadphoneLevelController *)self setShouldStreamingDataToGizmo:0];
    [(HUHeadphoneLevelController *)self _startRecevingADAMAudioSample:[(HUHeadphoneLevelController *)self shouldStreamingDataToGizmo]];
  }
}

- (void)serverConnectionWasInterrupted
{
  uint64_t v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_INFO, "Lost connection to AXUIServer", buf, 2u);
  }

  [(HUHeadphoneLevelController *)self setIsConnectedToIDS:0];
  if ([(HUHeadphoneLevelController *)self shouldStreamingDataToGizmo]) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else {
    [(HUHeadphoneLevelController *)self _registerMediaNotification];
  }
}

uint64_t __60__HUHeadphoneLevelController_serverConnectionWasInterrupted__block_invoke(uint64_t a1)
{
  v2 = HCLogSoundMeter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_INFO, "Restarting AXUIServer + IDS connection", v4, 2u);
  }

  return [*(id *)(a1 + 32) _startIDSConnection];
}

- (void)_registerMediaNotification
{
  uint64_t v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_INFO, "Start observing media playback", v7, 2u);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F543C0];
  uint64_t v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v4 addObserver:self selector:sel__mediaPlaybackDidChange_ name:v5 object:v6];
}

- (void)_unregisterMediaNotification
{
  uint64_t v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_INFO, "Stop observing media playback", v7, 2u);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F543C0];
  uint64_t v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v4 removeObserver:self name:v5 object:v6];
}

- (void)_mediaPlaybackDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F543C8]];
  int v6 = [v5 BOOLValue];

  unint64_t v7 = HCLogSoundMeter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 1024;
    BOOL v10 = [(HUHeadphoneLevelController *)self isConnectedToIDS];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_INFO, "Receive play back notification. isPlaying %i, isCompanionConnectedToIDS %i", (uint8_t *)v8, 0xEu);
  }

  if (v6)
  {
    if (![(HUHeadphoneLevelController *)self isConnectedToIDS])
    {
      [(HUHeadphoneLevelController *)self _startIDSConnection];
      [(HUHeadphoneLevelController *)self _unregisterMediaNotification];
    }
  }
}

- (void)_automationStartPlayingSampleData:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HCLogSoundMeter();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_INFO, "Received automation request for sample headphone level data", buf, 2u);
  }

  if ([v4 count])
  {
    int v6 = [(HUHeadphoneLevelController *)self automationSampleData];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      float v8 = HCLogSoundMeter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Waiting %fs for current automation sample to finish", buf, 0xCu);
      }

      [(HUHeadphoneLevelController *)self setAutomationSampleData:0];
      double v9 = 0.1;
    }
    else
    {
      BOOL v10 = (void *)[v4 mutableCopy];
      [(HUHeadphoneLevelController *)self setAutomationSampleData:v10];

      double v9 = 0.0;
    }
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HUHeadphoneLevelController__automationStartPlayingSampleData___block_invoke;
    block[3] = &unk_2640FC988;
    double v15 = v9;
    void block[4] = self;
    id v14 = v4;
    dispatch_after(v11, dataQueue, block);
  }
  else
  {
    [(HUHeadphoneLevelController *)self setAutomationSampleData:0];
  }
}

uint64_t __64__HUHeadphoneLevelController__automationStartPlayingSampleData___block_invoke(uint64_t a1)
{
  v2 = HCLogSoundMeter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_INFO, "Starting new automation sample", v5, 2u);
  }

  if (*(double *)(a1 + 48) != 0.0)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [*(id *)(a1 + 32) setAutomationSampleData:v3];
  }
  return [*(id *)(a1 + 32) _automationPlaySampleData];
}

- (void)_automationPlaySampleData
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HUHeadphoneLevelController *)self automationSampleData];
  unint64_t v4 = [v3 count];

  if (v4
    && [MEMORY[0x263F472B0] isInternalInstall]
    && _AXSAutomationEnabled())
  {
    uint64_t v5 = [(HUHeadphoneLevelController *)self automationSampleData];
    int v6 = [v5 lastObject];
    [v6 floatValue];
    int v8 = v7;

    double v9 = [(HUHeadphoneLevelController *)self automationSampleData];
    [v9 removeLastObject];

    double v10 = fmod((double)v4, 10.0);
    id v11 = objc_alloc(MEMORY[0x263F08798]);
    __int16 v12 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = [v11 initWithStartDate:v12 duration:0.100000001];

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    id v14 = (void *)getADAMAudioDataAnalysisSampleClass_softClass;
    uint64_t v30 = getADAMAudioDataAnalysisSampleClass_softClass;
    if (!getADAMAudioDataAnalysisSampleClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v34 = __getADAMAudioDataAnalysisSampleClass_block_invoke;
      v35 = &unk_2640FC9B0;
      v36 = &v27;
      __getADAMAudioDataAnalysisSampleClass_block_invoke((uint64_t)&buf);
      id v14 = (void *)v28[3];
    }
    double v15 = v14;
    _Block_object_dispose(&v27, 8);
    id v16 = [v15 alloc];
    LODWORD(v17) = v8;
    uint64_t v18 = [NSNumber numberWithFloat:v17];
    uint64_t v19 = getADAFMetadataKeyHAEDataForGauge();
    v31 = v19;
    objc_super v20 = [NSNumber numberWithBool:v10 != 0.0];
    v32 = v20;
    id v21 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v22 = (void *)[v16 initAudioSampleWithType:1751213428 data:v18 dateInterval:v13 metadata:v21];

    uint64_t v23 = HCLogSoundMeter();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_INFO, "Processing automation request for sample %@", (uint8_t *)&buf, 0xCu);
    }

    [(HUHeadphoneLevelController *)self receiveAudioSample:v22];
    dispatch_time_t v24 = dispatch_time(0, 100000001);
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HUHeadphoneLevelController__automationPlaySampleData__block_invoke;
    block[3] = &unk_2640FC960;
    void block[4] = self;
    dispatch_after(v24, dataQueue, block);
  }
  else
  {
    uint64_t v13 = HCLogSoundMeter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_INFO, "No automation sample data left", (uint8_t *)&buf, 2u);
    }
  }
}

uint64_t __55__HUHeadphoneLevelController__automationPlaySampleData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _automationPlaySampleData];
}

- (BOOL)isMeasurementEnabled
{
  return self->_measurementEnabled;
}

- (void)setMeasurementEnabled:(BOOL)a3
{
  self->_measurementEnabled = a3;
}

- (ADAMAudioDataReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (AXDispatchTimer)adamSuspendedTimer
{
  return self->_adamSuspendedTimer;
}

- (void)setAdamSuspendedTimer:(id)a3
{
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
}

- (float)slowLeq
{
  return self->_slowLeq;
}

- (void)setSlowLeq:(float)a3
{
  self->_slowLeq = a3;
}

- (float)fastLeq
{
  return self->_fastLeq;
}

- (void)setFastLeq:(float)a3
{
  self->_fastLeq = a3;
}

- (unint64_t)thresholdLevel
{
  return self->_thresholdLevel;
}

- (void)setThresholdLevel:(unint64_t)a3
{
  self->_thresholdLevel = a3;
}

- (BOOL)isConnectedToIDS
{
  return self->_isConnectedToIDS;
}

- (void)setIsConnectedToIDS:(BOOL)a3
{
  self->_isConnectedToIDS = a3;
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
}

- (BOOL)shouldStreamingDataToGizmo
{
  return self->_shouldStreamingDataToGizmo;
}

- (void)setShouldStreamingDataToGizmo:(BOOL)a3
{
  self->_shouldStreamingDataToGizmo = a3;
}

- (unint64_t)streamingDataToGizmoType
{
  return self->_streamingDataToGizmoType;
}

- (void)setStreamingDataToGizmoType:(unint64_t)a3
{
  self->_streamingDataToGizmoType = a3;
}

- (unint64_t)streamingToGizmoAudioLevel
{
  return self->_streamingToGizmoAudioLevel;
}

- (void)setStreamingToGizmoAudioLevel:(unint64_t)a3
{
  self->_streamingToGizmoAudioLevel = a3;
}

- (NSMutableArray)automationSampleData
{
  return self->_automationSampleData;
}

- (void)setAutomationSampleData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSampleData, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_adamSuspendedTimer, 0);

  objc_storeStrong((id *)&self->_receiver, 0);
}

@end