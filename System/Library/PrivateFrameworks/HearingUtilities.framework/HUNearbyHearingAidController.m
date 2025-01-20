@interface HUNearbyHearingAidController
+ (id)sharedInstance;
- (AXDispatchTimer)handoffTimer;
- (AXDispatchTimer)messagesPriorityTimer;
- (AXDispatchTimer)peerTimer;
- (AXDispatchTimer)sendConnectionToCompanionTimer;
- (AXDispatchTimer)sendPropertyUpdatesLowTimer;
- (AXRemoteHearingAidDevice)localDevice;
- (BOOL)hasStarted;
- (BOOL)holdingMediaForConnection;
- (BOOL)holdingPhoneForConnection;
- (BOOL)isPeerConnectedToHearingDevice;
- (BOOL)processStateMessageFromPeer:(id)a3 state:(id)a4;
- (BOOL)relinquishConnectionForReason:(int64_t)a3 toDevice:(id)a4;
- (BOOL)representsLocalDevices;
- (BOOL)requestHandoff:(int64_t)a3 reason:(int64_t)a4;
- (BOOL)shouldConnect;
- (BOOL)shouldDisconnect;
- (BOOL)shouldRelinquishConnectionForReason:(int64_t)a3;
- (BOOL)shouldRoute:(BOOL)a3;
- (BOOL)updateStateOnDeviceQueue;
- (HUNearbyHearingAidController)init;
- (HUNearbyHearingAidControllerDelegate)delegate;
- (HUSessionManager)sessionManager;
- (NSDictionary)lastSentPropertyUpdates;
- (NSMutableDictionary)collectedPropertyUpdates;
- (NSTimer)idsMessagesTimer;
- (OS_dispatch_queue)mediaQueue;
- (id)availableDevices;
- (id)connectedPeer;
- (id)connectingPeer;
- (id)defaultDevicesFromDevices:(id)a3;
- (id)descriptionForCurrentMessagePriority;
- (id)descriptionForCurrentState;
- (id)descriptionForHandoffReason:(int64_t)a3;
- (id)descriptionForHandoffState;
- (id)descriptionForState:(int64_t)a3;
- (id)device:(id)a3 didReceiveMessage:(id)a4;
- (id)devicesFromDevices:(id)a3 withMessagePriority:(unint64_t)a4;
- (id)hearingAidForDeviceID:(id)a3;
- (id)hearingDevice;
- (id)peerWithState:(int64_t)a3;
- (id)relinquishCompleted;
- (id)timeStamp;
- (id)urgentDevicesFromDevices:(id)a3;
- (int64_t)connectionStateForDevice:(id)a3;
- (int64_t)handoffReason;
- (int64_t)processingHandoff;
- (int64_t)state;
- (unint64_t)deviceMessagePriority;
- (unint64_t)idsMessagesCount;
- (unint64_t)messagePriorityForDevice:(id)a3;
- (void)callStatusDidChange:(id)a3;
- (void)checkConnectionRequestedForMediaAfterTimeout;
- (void)checkHandoffAfterTimeout;
- (void)checkPeerStateAfterTimout;
- (void)collectPropertyUpdatesFromPayload:(id)a3;
- (void)connectedPeerWithCompletion:(id)a3;
- (void)disconnectFromPairedDevice;
- (void)finishHandoff;
- (void)logAvailableDevicesWithTitle:(id)a3;
- (void)logDevices:(id)a3 withTitle:(id)a4 fullInfo:(BOOL)a5;
- (void)mediaPlaybackDidChange:(id)a3;
- (void)mediaServerDied;
- (void)processHandoffMessageFromPeer:(id)a3 state:(id)a4;
- (void)processReadMessageFromPeerDevice:(id)a3 value:(id)a4;
- (void)processReadProperty:(id)a3 fromPeerDevice:(id)a4;
- (void)processWriteMessageWithValue:(id)a3;
- (void)registerMediaNotifications;
- (void)relinquishConnection;
- (void)relinquishConnectionWithCompletion:(id)a3;
- (void)requestConnection;
- (void)requestConnectionForMedia;
- (void)requestConnectionForReason:(int64_t)a3;
- (void)resetHandoff;
- (void)resetHandoffOnDeviceQueue;
- (void)routesDidChange:(id)a3;
- (void)sendConnectionToCompanionIfPossible;
- (void)sendConnectionUpdateToPeers;
- (void)sendMessage:(id)a3 toDevices:(id)a4;
- (void)sendMessage:(id)a3 toDevices:(id)a4 messagePriority:(unint64_t)a5;
- (void)sendMessageToAllDevices:(id)a3 messagePriority:(unint64_t)a4;
- (void)sendMessagesPriority:(unint64_t)a3;
- (void)sendMessagesPriorityDefault;
- (void)sendMessagesPriorityHigh;
- (void)sendStateMessage:(id)a3 toDevices:(id)a4 isUrgent:(BOOL)a5;
- (void)sendStateMessageToAllDevices:(id)a3 isUrgent:(BOOL)a4;
- (void)sendWrite:(id)a3 toDevices:(id)a4;
- (void)sendWriteToAllDevices:(id)a3;
- (void)setCollectedPropertyUpdates:(id)a3;
- (void)setConnectionState:(int64_t)a3 forDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceMessagePriority:(unint64_t)a3;
- (void)setHandoffReason:(int64_t)a3;
- (void)setHandoffTimer:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setHoldingMediaForConnection:(BOOL)a3;
- (void)setHoldingPhoneForConnection:(BOOL)a3;
- (void)setIdsMessagesCount:(unint64_t)a3;
- (void)setIdsMessagesTimer:(id)a3;
- (void)setLastSentPropertyUpdates:(id)a3;
- (void)setLocalDevice:(id)a3;
- (void)setMediaQueue:(id)a3;
- (void)setMessagePriority:(unint64_t)a3 forDevice:(id)a4;
- (void)setMessagesPriorityTimer:(id)a3;
- (void)setPeerTimer:(id)a3;
- (void)setProcessingHandoff:(int64_t)a3;
- (void)setRelinquishCompleted:(id)a3;
- (void)setSendConnectionToCompanionTimer:(id)a3;
- (void)setSendPropertyUpdatesLowTimer:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setState:(int64_t)a3;
- (void)shouldRequestAudioConnectionForCall:(BOOL)a3 withCompletion:(id)a4;
- (void)start;
- (void)stop;
- (void)unregisterMediaNotifications;
- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4;
- (void)updateResponse:(id)a3 withState:(int64_t)a4;
- (void)updateState;
- (void)validateResponse:(id)a3;
- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5;
- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5 toDevices:(id)a6;
@end

@implementation HUNearbyHearingAidController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_NearbyController;

  return v2;
}

uint64_t __46__HUNearbyHearingAidController_sharedInstance__block_invoke()
{
  sharedInstance_NearbyController = objc_alloc_init(HUNearbyHearingAidController);

  return MEMORY[0x270F9A758]();
}

- (HUNearbyHearingAidController)init
{
  v32.receiver = self;
  v32.super_class = (Class)HUNearbyHearingAidController;
  v2 = [(HUDeviceController *)&v32 init];
  if (v2)
  {
    v3 = +[HUHearingAidSettings sharedInstance];
    [v3 multideviceSettingsEnabled];

    v4 = +[HUHearingAidSettings sharedInstance];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __36__HUNearbyHearingAidController_init__block_invoke;
    v30[3] = &unk_2640FC960;
    v5 = v2;
    v31 = v5;
    [v4 registerUpdateBlock:v30 forRetrieveSelector:sel_multideviceSettingsEnabled withListener:v5];

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("hu_nearby_media", v6);
    [(HUNearbyHearingAidController *)v5 setMediaQueue:v7];

    v5->_deviceMessagePriority = 1;
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v5 selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E310] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v5 selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E328] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v5 selector:sel_routesDidChange_ name:@"com.apple.accessibility.hearingaid.audio.route.changed" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)UserRequestedAudioTransferNotification, @"com.apple.accessibility.hearing.audio.transfer", 0, (CFNotificationSuspensionBehavior)0);
    id v12 = objc_alloc(MEMORY[0x263F21398]);
    v13 = [(HUNearbyHearingAidController *)v5 mediaQueue];
    v14 = (void *)[v12 initWithTargetSerialQueue:v13];
    [(HUNearbyHearingAidController *)v5 setSendConnectionToCompanionTimer:v14];

    id v15 = objc_alloc(MEMORY[0x263F21398]);
    v16 = [(HUDeviceController *)v5 deviceUpdatesQueue];
    uint64_t v17 = [v15 initWithTargetSerialQueue:v16];
    handoffTimer = v5->_handoffTimer;
    v5->_handoffTimer = (AXDispatchTimer *)v17;

    [(AXDispatchTimer *)v5->_handoffTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    id v19 = objc_alloc(MEMORY[0x263F21398]);
    v20 = [(HUDeviceController *)v5 deviceUpdatesQueue];
    uint64_t v21 = [v19 initWithTargetSerialQueue:v20];
    sendPropertyUpdatesLowTimer = v5->_sendPropertyUpdatesLowTimer;
    v5->_sendPropertyUpdatesLowTimer = (AXDispatchTimer *)v21;

    [(AXDispatchTimer *)v5->_sendPropertyUpdatesLowTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v23 = objc_opt_new();
    collectedPropertyUpdates = v5->_collectedPropertyUpdates;
    v5->_collectedPropertyUpdates = (NSMutableDictionary *)v23;

    id v25 = objc_alloc(MEMORY[0x263F21398]);
    v26 = [(HUDeviceController *)v5 deviceUpdatesQueue];
    uint64_t v27 = [v25 initWithTargetSerialQueue:v26];
    messagesPriorityTimer = v5->_messagesPriorityTimer;
    v5->_messagesPriorityTimer = (AXDispatchTimer *)v27;

    [(AXDispatchTimer *)v5->_messagesPriorityTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

void __36__HUNearbyHearingAidController_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) delegate];
  [v1 availableRemoteControllersDidChange];

  HAInitializeLogging();
  v2 = [NSString stringWithFormat:@"Multidevice settings change. Updated available controllers"];
  v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController init]_block_invoke", 90, v2];
  v4 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)registerMediaNotifications
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Registering media"];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController registerMediaNotifications]", 136, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    dispatch_queue_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v9 = (uint64_t *)MEMORY[0x263F54470];
  v10 = (uint64_t *)MEMORY[0x263F543C0];
  uint64_t v11 = *MEMORY[0x263F543C0];
  v20[0] = *MEMORY[0x263F54470];
  v20[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v8 setAttribute:v12 forKey:*MEMORY[0x263F544A0] error:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v14 = *v9;
  id v15 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v13 addObserver:self selector:sel_mediaServerDied name:v14 object:v15];

  v16 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v17 = *v10;
  v18 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v16 addObserver:self selector:sel_mediaPlaybackDidChange_ name:v17 object:v18];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 addObserver:self selector:sel_mediaPlaybackDidChange_ name:*MEMORY[0x263F54B28] object:0];
}

- (void)unregisterMediaNotifications
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Unregistering media"];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController unregisterMediaNotifications]", 151, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    dispatch_queue_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *MEMORY[0x263F54470];
  v10 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v8 removeObserver:self name:v9 object:v10];

  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = *MEMORY[0x263F543C0];
  v13 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v11 removeObserver:self name:v12 object:v13];
}

- (void)mediaServerDied
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Media server died."];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController mediaServerDied]", 159, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    dispatch_queue_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUNearbyHearingAidController *)self unregisterMediaNotifications];
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  uint64_t v9 = [(HUNearbyHearingAidController *)self mediaQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HUNearbyHearingAidController_mediaServerDied__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_after(v8, v9, block);
}

uint64_t __47__HUNearbyHearingAidController_mediaServerDied__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerMediaNotifications];
}

- (void)mediaPlaybackDidChange:(id)a3
{
  v4 = +[HUUtilities sharedUtilities];
  id v5 = [(HUNearbyHearingAidController *)self mediaQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke;
  v6[3] = &unk_2640FCA50;
  v6[4] = self;
  [v4 checkAudioPlayingWithQueue:v5 andCompletion:v6];
}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke(uint64_t a1, int a2)
{
  v4 = HCLogHearingHandoff();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_2(a2, v4);
  }

  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 requestConnectionForMedia];
  }
  else if ([v5 processingHandoff] == 1 && objc_msgSend(*(id *)(a1 + 32), "handoffReason") == 1)
  {
    id v6 = HCLogHearingHandoff();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setHoldingMediaForConnection:0];
    [*(id *)(a1 + 32) sendConnectionToCompanionIfPossible];
  }
}

- (void)routesDidChange:(id)a3
{
  if (hearingAidStreamSelected())
  {
    [(HUNearbyHearingAidController *)self setHoldingPhoneForConnection:0];
    if ([(HUNearbyHearingAidController *)self holdingMediaForConnection])
    {
      [(HUNearbyHearingAidController *)self setHoldingMediaForConnection:0];
      if (([MEMORY[0x263F472B0] deviceIsWatch] & 1) == 0)
      {
        v4 = HCLogHearingHandoff();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Route changed. Resuming media", v7, 2u);
        }

        id v5 = +[HUUtilities sharedUtilities];
        id v6 = [(HUNearbyHearingAidController *)self mediaQueue];
        [v5 pauseNowPlaying:0 withQueue:v6 andCompletion:0];
      }
    }
  }
}

- (void)callStatusDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "Call status changed - %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke;
  v8[3] = &unk_2640FCBD8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [(HUNearbyHearingAidController *)self shouldRequestAudioConnectionForCall:1 withCompletion:v8];
}

void __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke_2;
  v12[3] = &unk_2640FCBB0;
  v12[4] = &v25;
  v12[5] = &v21;
  v12[6] = &v17;
  v12[7] = &v13;
  getCallStatus(v12);
  id v4 = HCLogHearingHandoff();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((unsigned __int8 *)v14 + 24);
    int v6 = *((unsigned __int8 *)v22 + 24);
    int v7 = *((unsigned __int8 *)v18 + 24);
    int v8 = *((unsigned __int8 *)v26 + 24);
    int v9 = hearingAidStreamAvailable();
    uint64_t v10 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 67110658;
    int v30 = v5;
    __int16 v31 = 1024;
    int v32 = v6;
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v35 = 1024;
    int v36 = v8;
    __int16 v37 = 1024;
    int v38 = v9;
    __int16 v39 = 1024;
    int v40 = a2;
    __int16 v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Phone call [pending = %d, active = %d, avc = %d, endpoint = %d] - [connected = %d, should request = %d] - %@", buf, 0x30u);
  }
  if (!*((unsigned char *)v22 + 24) && !*((unsigned char *)v18 + 24) && !*((unsigned char *)v14 + 24))
  {
    [*(id *)(a1 + 40) setHoldingPhoneForConnection:0];
    [*(id *)(a1 + 40) sendConnectionToCompanionIfPossible];
    goto LABEL_14;
  }
  if (((hearingAidStreamAvailable() | a2 ^ 1) & 1) == 0)
  {
    if (!*((unsigned char *)v22 + 24) && !*((unsigned char *)v18 + 24))
    {
      uint64_t v11 = 2;
      if (!*((unsigned char *)v26 + 24)) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (*((unsigned char *)v26 + 24)) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 2;
    }
    if (*((unsigned char *)v26 + 24))
    {
LABEL_13:
      [*(id *)(a1 + 40) setHoldingPhoneForConnection:1];
      [*(id *)(a1 + 40) requestConnectionForReason:v11];
    }
  }
LABEL_14:
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void *__52__HUNearbyHearingAidController_callStatusDidChange___block_invoke_2(void *result, char a2, char a3, char a4, char a5)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = a4;
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = a5;
  return result;
}

- (BOOL)shouldRoute:(BOOL)a3
{
  id v4 = +[HUHearingAidSettings sharedInstance];
  int v5 = v4;
  if (a3) {
    uint64_t v6 = [v4 callAudioRoute];
  }
  else {
    uint64_t v6 = [v4 mediaAudioRoute];
  }
  uint64_t v7 = v6;

  if (v7 == 1) {
    return 0;
  }
  if (v7 != 2) {
    return 1;
  }
  int v8 = +[HUUtilities sharedUtilities];
  int v9 = [v8 currentPickableAudioRoutes];

  uint64_t v10 = [v9 valueForKey:@"AXSHARouteHeadset"];
  uint64_t v11 = [v9 valueForKey:@"AXSHARoutePicked"];
  char v12 = [v10 isEqualToDictionary:v11];

  char v13 = v12 ^ 1;
  return v13;
}

- (void)shouldRequestAudioConnectionForCall:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(HUDeviceController *)self deviceUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HUNearbyHearingAidController_shouldRequestAudioConnectionForCall_withCompletion___block_invoke;
    block[3] = &unk_2640FCC00;
    block[4] = self;
    BOOL v10 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __83__HUNearbyHearingAidController_shouldRequestAudioConnectionForCall_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v54 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) shouldRoute:*(unsigned __int8 *)(a1 + 48)];
  v3 = +[AXHearingAidDeviceController sharedController];
  if ([v3 isConnected])
  {
    int v41 = 0;
LABEL_6:

    goto LABEL_8;
  }
  id v4 = +[AXHearingAidDeviceController sharedController];
  char v5 = [v4 isPartiallyConnected];

  if ((v5 & 1) == 0 && [*(id *)(v1 + 32) isPeerConnectedToHearingDevice])
  {
    v3 = +[HUHearingAidSettings sharedInstance];
    int v41 = [v3 multideviceAudioEnabled];
    goto LABEL_6;
  }
  int v41 = 0;
LABEL_8:
  id v6 = +[AXHearingAidDeviceController sharedController];
  int v40 = [v6 isBluetoothAvailable];

  uint64_t v7 = +[AXHearingAidDeviceController sharedController];
  int v8 = [v7 pairedHearingDevice];

  id v9 = HCLogHearingHandoff();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = +[AXHearingAidDeviceController sharedController];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)uint64_t v43 = [v10 isConnected];
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = [v8 isLeftConnected];
    __int16 v44 = 1024;
    int v45 = [v8 isRightConnected];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "Connected: %d, L: %d, R: %d", buf, 0x14u);
  }
  uint64_t v11 = HCLogHearingHandoff();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = +[HUHearingAidSettings sharedInstance];
    int v13 = [v12 shouldStreamToLeftAid];
    uint64_t v14 = +[HUHearingAidSettings sharedInstance];
    int v15 = [v14 shouldStreamToRightAid];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v43 = v13;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v15;
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "Streaming L: %d, R: %d", buf, 0xEu);
  }
  uint64_t v16 = HCLogHearingHandoff();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [*(id *)(v1 + 32) connectedPeer];
    v18 = [v17 name];
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v43 = v18;
    _os_log_impl(&dword_20CC86000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "ConnectedPeer: %@", buf, 0xCu);
  }
  uint64_t v19 = HCLogHearingHandoff();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = v2;
    __int16 v37 = v8;
    char v20 = +[HUHearingAidSettings sharedInstance];
    uint64_t v21 = [v20 pairedHearingAids];
    uint64_t v16 = v21 != 0;
    uint64_t v22 = +[HUHearingAidSettings sharedInstance];
    char v23 = [v22 shouldStreamToLeftAid];
    uint64_t v38 = v1;
    if (v23)
    {
      int v24 = 1;
    }
    else
    {
      int v36 = +[HUHearingAidSettings sharedInstance];
      int v24 = [v36 shouldStreamToRightAid];
    }
    uint64_t v25 = +[HUHearingAidSettings sharedInstance];
    int v26 = [v25 isPairedWithFakeHearingAids] ^ 1;
    uint64_t v27 = +[HUHearingAidSettings sharedInstance];
    int v28 = [v27 isiCloudPaired];
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)uint64_t v43 = v39;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v21 != 0;
    __int16 v44 = 1024;
    int v45 = v41;
    __int16 v46 = 1024;
    int v47 = v24;
    __int16 v48 = 1024;
    int v49 = v26;
    __int16 v50 = 1024;
    int v51 = v28 ^ 1;
    __int16 v52 = 1024;
    int v53 = v40;
    _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "Should request connection %d, %d, %d, %d, %d, %d, %d", buf, 0x2Cu);

    if ((v23 & 1) == 0) {
    int v8 = v37;
    }
    uint64_t v1 = v38;
    int v2 = v39;
  }

  if (v2)
  {
    v29 = +[HUHearingAidSettings sharedInstance];
    int v30 = [v29 pairedHearingAids];
    if (v30) {
      int v31 = v41;
    }
    else {
      int v31 = 0;
    }
    if (v31 != 1) {
      goto LABEL_36;
    }
    int v32 = +[HUHearingAidSettings sharedInstance];
    char v33 = [v32 shouldStreamToLeftAid];
    if ((v33 & 1) != 0
      || (+[HUHearingAidSettings sharedInstance],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [(id)v16 shouldStreamToRightAid]))
    {
      int v34 = +[HUHearingAidSettings sharedInstance];
      if ([v34 isPairedWithFakeHearingAids])
      {

        if (v33) {
          goto LABEL_35;
        }
      }
      else
      {
        __int16 v35 = +[HUHearingAidSettings sharedInstance];
        [v35 isiCloudPaired];

        if (v33)
        {
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
      }
    }

    goto LABEL_35;
  }
LABEL_37:
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

- (void)requestConnectionForMedia
{
}

void __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[HUUtilities sharedUtilities];
  [v4 clearAudioRoutes];

  if (a2)
  {
    unsigned int v5 = hearingAidStreamAvailable();
    if ((v5 & 1) != 0 || *(unsigned char *)(a1 + 40))
    {
      uint64_t v6 = HCLogHearingHandoff();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        uint64_t v13 = v5;
        __int16 v14 = 2048;
        uint64_t v15 = v7;
        _os_log_impl(&dword_20CC86000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Skipping handoff, streamAvailable - %ld, holdingMedia - %ld", buf, 0x16u);
      }
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke_43;
      v11[3] = &unk_2640FCA50;
      v11[4] = *(void *)(a1 + 32);
      uint64_t v6 = MEMORY[0x2105575F0](v11);
      if ([MEMORY[0x263F472B0] deviceIsWatch])
      {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
      else
      {
        id v9 = +[HUUtilities sharedUtilities];
        BOOL v10 = [*(id *)(a1 + 32) mediaQueue];
        [v9 pauseNowPlaying:1 withQueue:v10 andCompletion:v6];
      }
    }
  }
  else
  {
    int v8 = HCLogHearingHandoff();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "sendConnectionToCompanionIfPossible", buf, 2u);
    }

    [*(id *)(a1 + 32) sendConnectionToCompanionIfPossible];
  }
}

uint64_t __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke_43(uint64_t a1)
{
  int v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "Requesting connection for media", v4, 2u);
  }

  [*(id *)(a1 + 32) setHoldingMediaForConnection:1];
  return [*(id *)(a1 + 32) requestConnectionForReason:1];
}

- (void)requestConnectionForReason:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:a3];
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "Request connection reason %@", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HUNearbyHearingAidController_requestConnectionForReason___block_invoke;
  v7[3] = &unk_2640FCC50;
  v7[4] = self;
  v7[5] = a3;
  [(HUNearbyHearingAidController *)self connectedPeerWithCompletion:v7];
}

void __59__HUNearbyHearingAidController_requestConnectionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) sendConnectionToCompanionTimer];
  [v4 cancel];

  if ([*(id *)(a1 + 32) requestHandoff:1 reason:*(void *)(a1 + 40)])
  {
    unsigned int v5 = HCLogHearingHandoff();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) descriptionForHandoffReason:*(void *)(a1 + 40)];
      uint64_t v7 = [v3 name];
      int v8 = [*(id *)(a1 + 32) timeStamp];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "HandoffState: Connecting, Sending ControllerConnectWithReason %@ to %@, time: %@", buf, 0x20u);
    }
    __int16 v14 = &unk_26C1E53F0;
    id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    uint64_t v15 = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    uint64_t v11 = *(void **)(a1 + 32);
    if (v3)
    {
      id v13 = v3;
      char v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
      [v11 sendMessage:v10 toDevices:v12 messagePriority:1];
    }
    else
    {
      [v11 sendMessageToAllDevices:v10 messagePriority:1];
    }
  }
}

- (void)requestConnection
{
  id v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Request connection", buf, 2u);
  }

  id v4 = +[AXHAController sharedController];
  [v4 setListenForAvailableDeviceUpdates:0];

  unsigned int v5 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HUNearbyHearingAidController_requestConnection__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(v5, block);

  uint64_t v6 = +[AXHAController sharedController];
  [v6 setListenForAvailableDeviceUpdates:1];
}

void __49__HUNearbyHearingAidController_requestConnection__block_invoke(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) requestHandoff:1 reason:1];
  int v2 = HCLogHearingHandoff();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      __int16 v7 = 0;
      id v4 = "Started processing connection";
      unsigned int v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else if (v3)
  {
    __int16 v6 = 0;
    id v4 = "Couldn't request connection";
    unsigned int v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }
}

- (void)checkConnectionRequestedForMediaAfterTimeout
{
  BOOL v3 = [(HUNearbyHearingAidController *)self mediaQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(v3, block);
}

void __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) holdingMediaForConnection]
    && ([MEMORY[0x263F472B0] deviceIsWatch] & 1) == 0)
  {
    int v2 = HCLogHearingHandoff();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "checkConnectionRequestedForMediaAfterTimeout, Resuming Media", buf, 2u);
    }

    BOOL v3 = +[HUUtilities sharedUtilities];
    id v4 = [*(id *)(a1 + 32) mediaQueue];
    [v3 pauseNowPlaying:0 withQueue:v4 andCompletion:0];
  }
  if ((hearingAidStreamAvailable() & 1) == 0)
  {
    unsigned int v5 = HCLogHearingHandoff();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "After timeout gave up on Media handoff, transiton connection to peer", buf, 2u);
    }

    [*(id *)(a1 + 32) relinquishConnection];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.audio.transfer.complete", 0, 0, 1u);
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  int v8 = [*(id *)(a1 + 32) mediaQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke_49;
  block[3] = &unk_2640FC960;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v7, v8, block);
}

uint64_t __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke_49(uint64_t a1)
{
  int v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "checkConnectionRequestedForMediaAfterTimeout setHoldingMediaForConnection: NO", v4, 2u);
  }

  return [*(id *)(a1 + 32) setHoldingMediaForConnection:0];
}

- (void)sendConnectionToCompanionIfPossible
{
}

- (BOOL)shouldRelinquishConnectionForReason:(int64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__HUNearbyHearingAidController_shouldRelinquishConnectionForReason___block_invoke;
  v14[3] = &unk_2640FCBB0;
  v14[4] = &v27;
  v14[5] = &v23;
  v14[6] = &v19;
  v14[7] = &v15;
  getCallStatus(v14);
  int v5 = *((unsigned char *)v28 + 24) == 0;
  if (*((unsigned char *)v28 + 24)) {
    BOOL v6 = *((unsigned char *)v24 + 24) || *((unsigned char *)v20 + 24) || *((unsigned char *)v16 + 24) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  if ((unint64_t)(a3 - 1) < 2)
  {
    if (*((unsigned char *)v28 + 24))
    {
      int v5 = !*((unsigned char *)v24 + 24) && !*((unsigned char *)v20 + 24) && *((unsigned char *)v16 + 24) == 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a3 != 3)
  {
    if (a3 == 4)
    {
      int v5 = !v6;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!*((unsigned char *)v24 + 24) && !*((unsigned char *)v20 + 24)) {
LABEL_16:
  }
    int v5 = 1;
LABEL_17:
  dispatch_time_t v7 = HCLogHearingHandoff();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:a3];
    int v9 = *((unsigned __int8 *)v16 + 24);
    int v10 = *((unsigned __int8 *)v24 + 24);
    int v11 = *((unsigned __int8 *)v20 + 24);
    int v12 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67110658;
    int v32 = v5;
    __int16 v33 = 2112;
    int v34 = v8;
    __int16 v35 = 1024;
    int v36 = v9;
    __int16 v37 = 1024;
    int v38 = v10;
    __int16 v39 = 1024;
    int v40 = v11;
    __int16 v41 = 1024;
    int v42 = v12;
    __int16 v43 = 1024;
    BOOL v44 = v6;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "Should relinquish: %d Reason: %@, Call: [pending: %d, active: %d, avc: %d, endpoint: %d], inCall: %d", buf, 0x30u);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v5;
}

void *__68__HUNearbyHearingAidController_shouldRelinquishConnectionForReason___block_invoke(void *result, char a2, char a3, char a4, char a5)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = a4;
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = a5;
  return result;
}

- (BOOL)relinquishConnectionForReason:(int64_t)a3 toDevice:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_time_t v7 = HCLogHearingHandoff();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:a3];
    int v9 = [v6 name];
    *(_DWORD *)buf = 138412546;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    char v22 = v9;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "relinquishConnectionForReason: %@ to peer: %@", buf, 0x16u);
  }
  if ([(HUNearbyHearingAidController *)self shouldRelinquishConnectionForReason:a3]&& [(HUNearbyHearingAidController *)self requestHandoff:2 reason:a3])
  {
    [(HUNearbyHearingAidController *)self setConnectionState:3 forDevice:v6];
    if (!a3)
    {
      int v10 = [NSNumber numberWithUnsignedLongLong:0x8000];
      uint64_t v17 = v10;
      int v11 = [NSNumber numberWithInteger:0];
      char v18 = v11;
      int v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

      if (v6)
      {
        id v16 = v6;
        id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
        [(HUNearbyHearingAidController *)self sendMessage:v12 toDevices:v13 messagePriority:1];
      }
      else
      {
        [(HUNearbyHearingAidController *)self sendMessageToAllDevices:v12 messagePriority:1];
      }
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)relinquishConnection
{
  BOOL v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Relinquish connection", buf, 2u);
  }

  id v4 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HUNearbyHearingAidController_relinquishConnection__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(v4, block);
}

void __52__HUNearbyHearingAidController_relinquishConnection__block_invoke(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) requestHandoff:2 reason:0];
  int v2 = HCLogHearingHandoff();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      __int16 v7 = 0;
      id v4 = "Started relinquishing connection";
      int v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else if (v3)
  {
    __int16 v6 = 0;
    id v4 = "Couldn't relinquish connection";
    int v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }
}

- (void)relinquishConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "Relinquish connection with callback", buf, 2u);
  }

  __int16 v6 = [(HUDeviceController *)self deviceUpdatesQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HUNearbyHearingAidController_relinquishConnectionWithCompletion___block_invoke;
  v8[3] = &unk_2640FCC78;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __67__HUNearbyHearingAidController_relinquishConnectionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRelinquishCompleted:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 32);

  return [v2 relinquishConnection];
}

- (BOOL)shouldConnect
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HUNearbyHearingAidController *)self state] != 2
    && [(HUNearbyHearingAidController *)self state] != 4;
  id v4 = HCLogHearingHandoff();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
    v7[0] = 67109378;
    v7[1] = v3;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Nearby controller shouldConnect: %d, state: %@", (uint8_t *)v7, 0x12u);
  }
  return v3;
}

- (BOOL)shouldDisconnect
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t v3 = [(HUNearbyHearingAidController *)self state];
  id v4 = HCLogHearingHandoff();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
    v7[0] = 67109378;
    v7[1] = v3 != 3;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Nearby controller shouldDisconnect: %d, state: %@", (uint8_t *)v7, 0x12u);
  }
  return v3 != 3;
}

- (id)timeStamp
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"HH:mm:ss:SS"];
  int64_t v3 = [MEMORY[0x263EFF910] now];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

- (void)disconnectFromPairedDevice
{
  id v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "Disconnect from paired hearing device", v7, 2u);
  }

  int64_t v3 = +[AXHearingAidDeviceController sharedController];
  id v4 = +[AXHAController sharedController];
  int v5 = [v4 pairedDeviceUUID];
  [v3 disconnectFromHearingAidWithDeviceUUID:v5];

  __int16 v6 = +[AXHearingAidDeviceController sharedController];
  [v6 cancelPendingConnections];
}

- (id)descriptionForHandoffState
{
  unint64_t v2 = [(HUNearbyHearingAidController *)self processingHandoff];
  if (v2 > 2) {
    return @"N/A";
  }
  else {
    return off_2640FCE48[v2];
  }
}

- (id)descriptionForHandoffReason:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"N/A";
  }
  else {
    return off_2640FCE60[a3];
  }
}

- (BOOL)requestHandoff:(int64_t)a3 reason:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(HUNearbyHearingAidController *)self processingHandoff] == a3
    && [(HUNearbyHearingAidController *)self handoffReason] == a4)
  {
    id v7 = HCLogHearingHandoff();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [(HUNearbyHearingAidController *)self descriptionForHandoffState];
      int v18 = 138412290;
      uint64_t v19 = v8;
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "Already processing, skip requestHandoff: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    [(HUNearbyHearingAidController *)self setProcessingHandoff:a3];
    [(HUNearbyHearingAidController *)self setHandoffReason:a4];
    id v9 = HCLogHearingHandoff();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(HUNearbyHearingAidController *)self descriptionForHandoffState];
      int v11 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:a4];
      int v18 = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "Start requestHandoff: %@, reason: %@", (uint8_t *)&v18, 0x16u);
    }
    [(HUNearbyHearingAidController *)self updateStateOnDeviceQueue];
    if ([(HUNearbyHearingAidController *)self processingHandoff])
    {
      [(HUNearbyHearingAidController *)self checkHandoffAfterTimeout];
      return 1;
    }
    id v13 = HCLogHearingHandoff();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:a4];
      int v18 = 138412290;
      uint64_t v19 = v14;
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't Start handoff for a reason: %@", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v15 = [(HUNearbyHearingAidController *)self relinquishCompleted];

    if (v15)
    {
      id v16 = HCLogHearingHandoff();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "Invoking relinquishCompleted callback", (uint8_t *)&v18, 2u);
      }

      uint64_t v17 = [(HUNearbyHearingAidController *)self relinquishCompleted];
      v17[2]();

      [(HUNearbyHearingAidController *)self setRelinquishCompleted:0];
    }
  }
  return 0;
}

- (void)checkHandoffAfterTimeout
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int64_t v3 = [(HUNearbyHearingAidController *)self processingHandoff];
  id v4 = HCLogHearingHandoff();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(HUNearbyHearingAidController *)self descriptionForHandoffState];
    __int16 v6 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:[(HUNearbyHearingAidController *)self handoffReason]];
    *(_DWORD *)buf = 138412546;
    int v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Starting check timer for handoff %@, reason: %@", buf, 0x16u);
  }
  if (v3 == 1) {
    double v7 = 7.5;
  }
  else {
    double v7 = 15.0;
  }

  __int16 v8 = [(HUNearbyHearingAidController *)self handoffTimer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke;
  v9[3] = &unk_2640FC960;
  v9[4] = self;
  [v8 afterDelay:v9 processBlock:v7];
}

void __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v3 = [*(id *)(a1 + 32) descriptionForHandoffState];
    id v4 = objc_msgSend(*(id *)(a1 + 32), "descriptionForHandoffReason:", objc_msgSend(*(id *)(a1 + 32), "handoffReason"));
    int v5 = [*(id *)(a1 + 32) connectedPeer];
    __int16 v6 = [v5 name];
    *(_DWORD *)buf = 138412802;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "Check timer fired for handoff %@, reason: %@, connectedPeer: %@", buf, 0x20u);
  }
  if ([*(id *)(a1 + 32) processingHandoff])
  {
    uint64_t v7 = [*(id *)(a1 + 32) processingHandoff];
    __int16 v8 = *(void **)(a1 + 32);
    if (v7 == 1)
    {
      if ([v8 handoffReason] == 1) {
        [*(id *)(a1 + 32) checkConnectionRequestedForMediaAfterTimeout];
      }
    }
    else
    {
      uint64_t v10 = [v8 mediaQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke_85;
      block[3] = &unk_2640FC960;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v10, block);
    }
    [*(id *)(a1 + 32) resetHandoffOnDeviceQueue];
  }
  else
  {
    id v9 = HCLogHearingHandoff();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "Handoff is completed", buf, 2u);
    }
  }
}

uint64_t __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke_85(uint64_t a1)
{
  unint64_t v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "Relinquishing connection, holdingMediaForConnection: NO", v4, 2u);
  }

  return [*(id *)(a1 + 32) setHoldingMediaForConnection:0];
}

- (void)finishHandoff
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUNearbyHearingAidController *)self descriptionForHandoffState];
    int v5 = [(HUNearbyHearingAidController *)self descriptionForHandoffReason:[(HUNearbyHearingAidController *)self handoffReason]];
    __int16 v6 = [(HUNearbyHearingAidController *)self connectedPeer];
    uint64_t v7 = [v6 name];
    int v14 = 138413058;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = [(HUNearbyHearingAidController *)self holdingMediaForConnection];
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Finish handoff %@, reason: %@, connectedPeer: %@, holding media %d", (uint8_t *)&v14, 0x26u);
  }
  __int16 v8 = [(HUNearbyHearingAidController *)self handoffTimer];
  [v8 cancel];

  uint64_t v9 = [(HUNearbyHearingAidController *)self relinquishCompleted];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    int64_t v11 = [(HUNearbyHearingAidController *)self processingHandoff];

    if (v11 == 2)
    {
      __int16 v12 = HCLogHearingHandoff();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "Invoking relinquishCompleted callback", (uint8_t *)&v14, 2u);
      }

      id v13 = [(HUNearbyHearingAidController *)self relinquishCompleted];
      v13[2]();

      [(HUNearbyHearingAidController *)self setRelinquishCompleted:0];
    }
  }
  [(HUNearbyHearingAidController *)self setProcessingHandoff:0];
  [(HUNearbyHearingAidController *)self setHandoffReason:0];
}

- (void)resetHandoffOnDeviceQueue
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int64_t v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUNearbyHearingAidController *)self descriptionForHandoffState];
    int v5 = 138412290;
    __int16 v6 = v4;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Reset handoff from: %@", (uint8_t *)&v5, 0xCu);
  }
  if ([(HUNearbyHearingAidController *)self processingHandoff])
  {
    [(HUNearbyHearingAidController *)self finishHandoff];
    [(HUNearbyHearingAidController *)self updateStateOnDeviceQueue];
  }
}

- (void)resetHandoff
{
  int64_t v3 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HUNearbyHearingAidController_resetHandoff__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__HUNearbyHearingAidController_resetHandoff__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) processingHandoff])
  {
    unint64_t v2 = *(void **)(a1 + 32);
    return [v2 resetHandoffOnDeviceQueue];
  }
  else
  {
    id v4 = HCLogHearingHandoff();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "No handoff, just update state", v5, 2u);
    }

    return [*(id *)(a1 + 32) updateStateOnDeviceQueue];
  }
}

- (void)start
{
  if (![(HUNearbyHearingAidController *)self hasStarted])
  {
    [(HUNearbyHearingAidController *)self setHasStarted:1];
    int64_t v3 = HCLogHearingHandoff();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Nearby start", (uint8_t *)buf, 2u);
    }

    [(HUNearbyHearingAidController *)self registerMediaNotifications];
    objc_initWeak(buf, self);
    id v4 = +[HUNearbyController sharedInstance];
    int v5 = [(HUDeviceController *)self deviceUpdatesQueue];
    [v4 registerQueue:v5 forDomain:@"com.apple.hearing.hearingaids"];

    __int16 v6 = +[HUNearbyController sharedInstance];
    [v6 registerLoggingBlock:&__block_literal_global_92 forDomain:@"com.apple.hearing.hearingaids" withListener:self];

    uint64_t v7 = +[HUNearbyController sharedInstance];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __37__HUNearbyHearingAidController_start__block_invoke_96;
    v17[3] = &unk_2640FCCE8;
    objc_copyWeak(&v18, buf);
    v17[4] = self;
    [v7 registerDiscoveryBlock:v17 forDomain:@"com.apple.hearing.hearingaids" withListener:self];

    __int16 v8 = +[HUNearbyController sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__HUNearbyHearingAidController_start__block_invoke_110;
    v15[3] = &unk_2640FCD10;
    objc_copyWeak(&v16, buf);
    [v8 registerMessageBlock:v15 forDomain:@"com.apple.hearing.hearingaids" withListener:self];

    uint64_t v9 = +[HUNearbyController sharedInstance];
    [v9 discoverNearbyDevicesWithDomain:@"com.apple.hearing.hearingaids"];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__HUNearbyHearingAidController_start__block_invoke_3;
    v14[3] = &unk_2640FCD38;
    v14[4] = self;
    uint64_t v10 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v14 block:60.0];
    [(HUNearbyHearingAidController *)self setIdsMessagesTimer:v10];

    int64_t v11 = [(HUDeviceController *)self deviceUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__HUNearbyHearingAidController_start__block_invoke_115;
    block[3] = &unk_2640FC910;
    objc_copyWeak(&v13, buf);
    dispatch_async(v11, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __37__HUNearbyHearingAidController_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  int64_t v3 = [NSString stringWithFormat:@"%@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController start]_block_invoke", 816, v3];
  int v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [WeakRetained deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_2;
  block[3] = &unk_2640FCCC0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v11);
}

void __37__HUNearbyHearingAidController_start__block_invoke_2(id *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained updateStateOnDeviceQueue];

  id v4 = +[HUNearbyController sharedInstance];
  int v5 = [v4 nearbyDevices];

  uint64_t v6 = HCLogHearingHandoff();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = (uint64_t)v7;
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "Devices updated, available devices count: %@", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained(v2);
  id v9 = [v8 delegate];
  [v9 availableRemoteControllersDidChange];

  HAInitializeLogging();
  uint64_t v10 = [NSString stringWithFormat:@"Nearby devices changed. Updated available controllers"];
  id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController start]_block_invoke", 826, v10];
  __int16 v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    int v14 = v12;
    uint64_t v15 = [v13 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = v15;
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([a1[4] count])
  {
    id v16 = NSString;
    uint64_t v17 = [a1[5] descriptionForCurrentState];
    id v18 = [a1[5] descriptionForCurrentMessagePriority];
    int v32 = [v16 stringWithFormat:@"Peers discovered, sending CheckIn, ControllerConnected: %@ MessagesPriority: %@ to", v17, v18];

    id v19 = objc_loadWeakRetained(v2);
    [v19 logDevices:a1[4] withTitle:v32 fullInfo:0];

    v33[0] = &unk_26C1E5408;
    __int16 v20 = NSNumber;
    id v21 = objc_loadWeakRetained(v2);
    uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "state"));
    v34[0] = v22;
    v33[1] = &unk_26C1E5420;
    uint64_t v23 = NSNumber;
    id v24 = objc_loadWeakRetained(v2);
    uint64_t v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "state"));
    v34[1] = v25;
    v33[2] = &unk_26C1E5438;
    char v26 = v5;
    uint64_t v27 = NSNumber;
    id v28 = objc_loadWeakRetained(v2);
    uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "deviceMessagePriority"));
    v34[2] = v29;
    char v30 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

    int v5 = v26;
    id v31 = objc_loadWeakRetained(v2);
    [v31 sendStateMessage:v30 toDevices:a1[4] isUrgent:1];
  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_110(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v8 = [WeakRetained deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_2_111;
  block[3] = &unk_2640FCCC0;
  objc_copyWeak(&v14, a1);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
}

void __37__HUNearbyHearingAidController_start__block_invoke_2_111(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained device:*(void *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40)];

  if ([v4 count] && *(void *)(a1 + 32))
  {
    id v5 = objc_loadWeakRetained(v2);
    v7[0] = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v5 sendMessage:v4 toDevices:v6];
  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_4;
  block[3] = &unk_2640FC960;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __37__HUNearbyHearingAidController_start__block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) idsMessagesCount];
  if (result)
  {
    id v3 = HCLogHearingHandoff();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "idsMessagesCount"));
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "IDS messages count: %@", (uint8_t *)&v5, 0xCu);
    }
    return [*(id *)(a1 + 32) setIdsMessagesCount:0];
  }
  return result;
}

void __37__HUNearbyHearingAidController_start__block_invoke_115(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateStateOnDeviceQueue];
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(HUNearbyHearingAidController *)self setHasStarted:0];
  id v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "Nearby stop", buf, 2u);
  }

  id v4 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HUNearbyHearingAidController_stop__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v4, block);

  [(HUNearbyHearingAidController *)self unregisterMediaNotifications];
  int v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUNearbyHearingAidController idsMessagesCount](self, "idsMessagesCount"));
    *(_DWORD *)buf = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "IDS messages count: %@", buf, 0xCu);
  }
  uint64_t v7 = [(HUNearbyHearingAidController *)self idsMessagesTimer];
  [v7 invalidate];

  [(HUNearbyHearingAidController *)self setIdsMessagesTimer:0];
}

void __36__HUNearbyHearingAidController_stop__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendConnectionToCompanionIfPossible];
  [*(id *)(a1 + 32) relinquishConnectionForReason:0 toDevice:0];
  dispatch_time_t v2 = dispatch_time(0, 12000000000);
  id v3 = [*(id *)(a1 + 32) deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HUNearbyHearingAidController_stop__block_invoke_2;
  block[3] = &unk_2640FC960;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, v3, block);
}

void __36__HUNearbyHearingAidController_stop__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasStarted] & 1) == 0)
  {
    id v1 = +[HUNearbyController sharedInstance];
    [v1 stopDiscoveringDevicesWithDomain:@"com.apple.hearing.hearingaids"];
  }
}

- (BOOL)updateStateOnDeviceQueue
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v3 = +[HUHearingAidSettings sharedInstance];
  id v4 = [v3 pairedHearingAids];
  if (v4)
  {
    int v5 = +[HUHearingAidSettings sharedInstance];
    int v6 = [v5 isiCloudPaired] ^ 1;
  }
  else
  {
    int v6 = 0;
  }

  uint64_t v7 = +[AXHearingAidDeviceController sharedController];
  int v8 = [v7 isConnected];

  id v9 = +[AXHearingAidDeviceController sharedController];
  int v10 = [v9 isConnecting];

  uint64_t v11 = [(HUNearbyHearingAidController *)self availableDevices];
  uint64_t v12 = [v11 count];

  id v13 = +[AXHearingAidDeviceController sharedController];
  int v75 = [v13 isBluetoothAvailable];

  id v14 = [(HUNearbyHearingAidController *)self connectedPeer];
  uint64_t v15 = [(HUNearbyHearingAidController *)self connectingPeer];
  id v16 = HCLogHearingHandoff();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v79 = v75;
    *(_WORD *)&v79[4] = 1024;
    *(_DWORD *)&v79[6] = v6;
    LOWORD(v80) = 1024;
    *(_DWORD *)((char *)&v80 + 2) = v8;
    HIWORD(v80) = 1024;
    v81[0] = v10;
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "UpdateState BT: %d, Paired: %d, Connected: %d, Connecting: %d", buf, 0x1Au);
  }

  uint64_t v17 = HCLogHearingHandoff();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v14 name];
    [v15 name];
    v20 = id v19 = v15;
    *(_DWORD *)buf = 138412546;
    *(void *)v79 = v18;
    *(_WORD *)&v79[8] = 2112;
    v80 = v20;
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "connectedPeer: %@, connectingPeer: %@", buf, 0x16u);

    uint64_t v15 = v19;
  }

  id v21 = HCLogHearingHandoff();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
    [(HUNearbyHearingAidController *)self descriptionForHandoffState];
    v24 = uint64_t v23 = v15;
    *(_DWORD *)buf = 138412546;
    *(void *)v79 = v22;
    *(_WORD *)&v79[8] = 2112;
    v80 = v24;
    _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "Processing state: %@, handoff: %@", buf, 0x16u);

    uint64_t v15 = v23;
  }

  if (([(HUNearbyHearingAidController *)self hasStarted] & v6 & v75) != 1 || !v12)
  {
    if ([(HUNearbyHearingAidController *)self processingHandoff] == 1)
    {
      uint64_t v25 = HCLogHearingHandoff();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = [(HUNearbyHearingAidController *)self hasStarted];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v79 = v26;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v6;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = v75;
        HIWORD(v80) = 1024;
        v81[0] = v12 != 0;
        _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "Connection request interrupted, Nearby started: %d, isPaired: %d, BT available: %d, hasPeers: %d", buf, 0x1Au);
      }

      [(HUNearbyHearingAidController *)self finishHandoff];
    }
    if ([(HUNearbyHearingAidController *)self processingHandoff] == 2)
    {
      uint64_t v27 = HCLogHearingHandoff();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v28 = [(HUNearbyHearingAidController *)self hasStarted];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v79 = v28;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v6;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = v75;
        HIWORD(v80) = 1024;
        v81[0] = v12 != 0;
        _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "Transition request interrupted, Nearby started: %d, isPaired: %d, BT available: %d, hasPeers: %d", buf, 0x1Au);
      }

      [(HUNearbyHearingAidController *)self finishHandoff];
    }
  }
  v74 = v14;
  if (![(HUNearbyHearingAidController *)self hasStarted]) {
    goto LABEL_57;
  }
  if (!v12)
  {
LABEL_40:
    char v29 = 0;
    int v73 = 0;
    int v33 = 0;
    int v30 = 0;
    uint64_t v32 = 1;
    int v31 = 1;
    goto LABEL_59;
  }
  if (v8)
  {
    if ([(HUNearbyHearingAidController *)self processingHandoff] == 2)
    {
LABEL_24:
      LOBYTE(v12) = 0;
      char v29 = 0;
      int v30 = 0;
      int v31 = 1;
      uint64_t v32 = 4;
      int v73 = 1;
      int v33 = 1;
      goto LABEL_59;
    }
    int64_t v34 = [(HUNearbyHearingAidController *)self processingHandoff];
    if (!v14)
    {
      if (v34 == 1)
      {
        uint64_t v36 = HCLogHearingHandoff();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "Connection request has been finished", buf, 2u);
        }

        [(HUNearbyHearingAidController *)self finishHandoff];
      }
      goto LABEL_50;
    }
    if (v34 == 1)
    {
      [(HUNearbyHearingAidController *)self processingHandoff];
LABEL_50:
      char v29 = 0;
      int v33 = 0;
      int v30 = 0;
      int v31 = 1;
      uint64_t v32 = 5;
      LOBYTE(v12) = 1;
      goto LABEL_58;
    }
LABEL_45:
    LOBYTE(v12) = 0;
    char v29 = 0;
    int v33 = 0;
    int v31 = 1;
    uint64_t v32 = 2;
    int v73 = 1;
    int v30 = 1;
    goto LABEL_59;
  }
  if (v14)
  {
    if ([(HUNearbyHearingAidController *)self processingHandoff] != 1)
    {
      if ([(HUNearbyHearingAidController *)self processingHandoff] == 2)
      {
        __int16 v35 = HCLogHearingHandoff();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CC86000, v35, OS_LOG_TYPE_DEFAULT, "Connection transition has been finished", buf, 2u);
        }

        [(HUNearbyHearingAidController *)self finishHandoff];
      }
      goto LABEL_45;
    }
LABEL_27:
    LOBYTE(v12) = 0;
    int v33 = 0;
    int v30 = 0;
    int v31 = 1;
    uint64_t v32 = 3;
    char v29 = 1;
LABEL_58:
    int v73 = 1;
    goto LABEL_59;
  }
  if (!v6) {
    goto LABEL_57;
  }
  if ((v75 & 1) == 0)
  {
    uint64_t v37 = HCLogHearingHandoff();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CC86000, v37, OS_LOG_TYPE_DEFAULT, "Update state to Transitioning, BT is Off", buf, 2u);
    }

    goto LABEL_24;
  }
  if ([(HUNearbyHearingAidController *)self processingHandoff] == 1) {
    goto LABEL_27;
  }
  if ([(HUNearbyHearingAidController *)self processingHandoff] == 2) {
    goto LABEL_24;
  }
  if ([(HUNearbyHearingAidController *)self state] == 5
    || [(HUNearbyHearingAidController *)self state] == 3)
  {
    goto LABEL_27;
  }
  if (!v15 || [(HUNearbyHearingAidController *)self state] == 4)
  {
    LOBYTE(v12) = 0;
    goto LABEL_40;
  }
  if ([(HUNearbyHearingAidController *)self state] != 2) {
    goto LABEL_57;
  }
  uint64_t v32 = [(HUNearbyHearingAidController *)self peerTimer];

  if (!v32)
  {
    [(HUNearbyHearingAidController *)self checkPeerStateAfterTimout];
    int v31 = 0;
    LOBYTE(v12) = 0;
    char v29 = 0;
    int v33 = 0;
    int v30 = 0;
    goto LABEL_58;
  }
  int v38 = [(HUNearbyHearingAidController *)self peerTimer];
  char v39 = [v38 isPending];

  if (v39)
  {
LABEL_57:
    int v31 = 0;
    LOBYTE(v12) = 0;
    char v29 = 0;
    int v33 = 0;
    int v30 = 0;
    uint64_t v32 = 0;
    goto LABEL_58;
  }
  [(HUNearbyHearingAidController *)self setPeerTimer:0];
  v70 = HCLogHearingHandoff();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v70, OS_LOG_TYPE_DEFAULT, "Update state to Searching, peerTimer fired", buf, 2u);
  }

  LOBYTE(v12) = 0;
  char v29 = 0;
  int v73 = 0;
  int v33 = 0;
  int v30 = 0;
  int v31 = 1;
  uint64_t v32 = 1;
LABEL_59:
  if (v32 == [(HUNearbyHearingAidController *)self state]
    || ((v31 | v6 ^ 1) & 1) == 0 && [(HUNearbyHearingAidController *)self hasStarted])
  {
    BOOL v40 = 0;
LABEL_63:
    __int16 v41 = v74;
    goto LABEL_89;
  }
  [(HUNearbyHearingAidController *)self logAvailableDevicesWithTitle:@"Available Devices"];
  BOOL v43 = (v12 & 1) != 0
     || ([(HUNearbyHearingAidController *)self state] == 5 ? (char v42 = 1) : (char v42 = v29), (v42 & 1) != 0)
     || [(HUNearbyHearingAidController *)self state] == 3;
  BOOL v44 = HCLogHearingHandoff();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    [(HUNearbyHearingAidController *)self descriptionForState:v32];
    uint64_t v45 = v71 = v43;
    [(HUNearbyHearingAidController *)self descriptionForCurrentState];
    __int16 v46 = v72 = v30;
    [(HUNearbyHearingAidController *)self descriptionForHandoffState];
    v48 = int v47 = v15;
    *(_DWORD *)buf = 138412802;
    *(void *)v79 = v45;
    *(_WORD *)&v79[8] = 2112;
    v80 = v46;
    LOWORD(v81[0]) = 2112;
    *(void *)((char *)v81 + 2) = v48;
    _os_log_impl(&dword_20CC86000, v44, OS_LOG_TYPE_DEFAULT, "Did update state new: %@, old: %@, handoff: %@", buf, 0x20u);

    uint64_t v15 = v47;
    int v30 = v72;

    BOOL v43 = v71;
  }

  [(HUNearbyHearingAidController *)self setState:v32];
  int v49 = HCLogHearingHandoff();
  BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  if (v43)
  {
    if (v50)
    {
      int v51 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
      *(_DWORD *)buf = 138412290;
      *(void *)v79 = v51;
      _os_log_impl(&dword_20CC86000, v49, OS_LOG_TYPE_DEFAULT, "Sending ControllerConnected: %@, isUrgent: YES", buf, 0xCu);
    }
    v76 = &unk_26C1E5420;
    int v49 = objc_msgSend(NSNumber, "numberWithInteger:", -[HUNearbyHearingAidController state](self, "state"));
    v77 = v49;
    __int16 v52 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    [(HUNearbyHearingAidController *)self sendStateMessageToAllDevices:v52 isUrgent:1];
    goto LABEL_79;
  }
  if (v50)
  {
    __int16 v52 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
    *(_DWORD *)buf = 138412290;
    *(void *)v79 = v52;
    _os_log_impl(&dword_20CC86000, v49, OS_LOG_TYPE_DEFAULT, "Skipping sending ControllerConnected: %@", buf, 0xCu);
LABEL_79:
  }
  if ((v29 & 1) != 0 || ((v73 | v75 ^ 1) & 1) == 0)
  {
    v56 = +[AXHearingAidDeviceController sharedController];
    v57 = [v56 pairedHearingDevice];

    v58 = HCLogHearingHandoff();
    __int16 v41 = v74;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = [v57 name];
      v60 = [v74 name];
      v61 = [v15 name];
      *(_DWORD *)buf = 138412802;
      *(void *)v79 = v59;
      *(_WORD *)&v79[8] = 2112;
      v80 = v60;
      LOWORD(v81[0]) = 2112;
      *(void *)((char *)v81 + 2) = v61;
      _os_log_impl(&dword_20CC86000, v58, OS_LOG_TYPE_DEFAULT, "Connect to %@, Connected peer: %@, Connecting Peer: %@", buf, 0x20u);
    }
    [v57 connect];

    BOOL v40 = 1;
  }
  else
  {
    if ((v33 | v30) != 1)
    {
      BOOL v40 = 1;
      goto LABEL_63;
    }
    int v53 = HCLogHearingHandoff();
    __int16 v41 = v74;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = [v74 name];
      v55 = [v15 name];
      *(_DWORD *)buf = 138412546;
      *(void *)v79 = v54;
      *(_WORD *)&v79[8] = 2112;
      v80 = v55;
      _os_log_impl(&dword_20CC86000, v53, OS_LOG_TYPE_DEFAULT, "Disconnect, Connected peer: %@, Connecting Peer: %@", buf, 0x16u);
    }
    BOOL v40 = 1;
    [(HUNearbyHearingAidController *)self sendConnectionToCompanionIfPossible:1];
    [(HUNearbyHearingAidController *)self disconnectFromPairedDevice];
  }
LABEL_89:
  uint64_t v62 = [(HUNearbyHearingAidController *)self peerTimer];
  if (v62)
  {
    v63 = (void *)v62;
    int64_t v64 = [(HUNearbyHearingAidController *)self state];

    if (v64 != 2 || v41)
    {
      v65 = HCLogHearingHandoff();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = [(HUNearbyHearingAidController *)self peerTimer];
        int v67 = [v66 isPending];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v79 = v67;
        _os_log_impl(&dword_20CC86000, v65, OS_LOG_TYPE_DEFAULT, "Cancel and Destroy peerTimer, is pending %d", buf, 8u);
      }
      v68 = [(HUNearbyHearingAidController *)self peerTimer];
      [v68 cancel];

      [(HUNearbyHearingAidController *)self setPeerTimer:0];
    }
  }

  return v40;
}

- (void)updateState
{
  id v3 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HUNearbyHearingAidController_updateState__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__HUNearbyHearingAidController_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateOnDeviceQueue];
}

- (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"N/A";
  }
  else {
    return off_2640FCE90[a3];
  }
}

- (id)descriptionForCurrentState
{
  int64_t v3 = [(HUNearbyHearingAidController *)self state];

  return [(HUNearbyHearingAidController *)self descriptionForState:v3];
}

- (id)availableDevices
{
  dispatch_time_t v2 = +[HUNearbyController sharedInstance];
  int64_t v3 = [v2 nearbyDevices];

  return v3;
}

- (void)logAvailableDevicesWithTitle:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [MEMORY[0x263F472B0] isInternalInstall];
  HAInitializeLogging();
  int v6 = NSString;
  if (v5)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@", v4];
    int v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1158, v7];
    id v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      uint64_t v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v37 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(HUNearbyHearingAidController *)self availableDevices];
    uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v29 = v4;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          HAInitializeLogging();
          uint64_t v17 = [NSString stringWithFormat:@"nearbyDevice: %@", v16];
          id v18 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1161, v17];
          id v19 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v20 = v18;
            id v21 = v19;
            uint64_t v22 = [v20 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v37 = v22;
            _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
      id v4 = v29;
    }
  }
  else
  {
    uint64_t v23 = [(HUNearbyHearingAidController *)self availableDevices];
    uint64_t v24 = [v6 stringWithFormat:@"%@ - %@", v4, v23];

    id obj = (id)v24;
    uint64_t v25 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1166, v24];
    BOOL v26 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v25;
      BOOL v28 = v26;
      *(_DWORD *)buf = 136446210;
      uint64_t v37 = [v27 UTF8String];
      _os_log_impl(&dword_20CC86000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)logDevices:(id)a3 withTitle:(id)a4 fullInfo:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    id v9 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v9 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "name", (void)v19);
          if (v16) {
            [v15 name];
          }
          else {
          uint64_t v17 = [v15 identifier];
          }

          if (v17) {
            [v9 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v12);
    }
  }
  if (objc_msgSend(v9, "count", (void)v19))
  {
    id v18 = HCLogHearingHandoff();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      BOOL v26 = v9;
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%@ devices: %@", buf, 0x16u);
    }
  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)connectionStateForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stateForDomain:@"com.apple.hearing.hearingaids.connection"];
  if (v4)
  {
    BOOL v5 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEBUG)) {
      -[HUNearbyHearingAidController connectionStateForDevice:]((uint64_t)v4, v5);
    }
  }
  int64_t v6 = [v4 integerValue];

  return v6;
}

- (void)setConnectionState:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  int64_t v6 = [NSNumber numberWithInteger:a3];
  [v5 setState:v6 forDomain:@"com.apple.hearing.hearingaids.connection"];

  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEBUG)) {
    -[HUNearbyHearingAidController setConnectionState:forDevice:](v7, v5);
  }
}

- (unint64_t)messagePriorityForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stateForDomain:@"com.apple.hearing.hearingaids.priority"];
  if (v4)
  {
    id v5 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEBUG)) {
      -[HUNearbyHearingAidController messagePriorityForDevice:]((uint64_t)v4, v5);
    }
  }
  unint64_t v6 = [v4 integerValue];

  return v6;
}

- (void)setMessagePriority:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  HAInitializeLogging();
  unint64_t v6 = NSString;
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v5 name];
  id v9 = [v6 stringWithFormat:@"setMessagePriority: %@ for device: %@", v7, v8];

  id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController setMessagePriority:forDevice:]", 1235, v9];
  uint64_t v11 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v10;
    uint64_t v14 = v12;
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v13 UTF8String];
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setState:v15 forDomain:@"com.apple.hearing.hearingaids.priority"];

  os_log_t v16 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
    -[HUNearbyHearingAidController setMessagePriority:forDevice:](v16, v5);
  }
}

- (id)peerWithState:(int64_t)a3
{
  id v5 = [(HUNearbyHearingAidController *)self availableDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__HUNearbyHearingAidController_peerWithState___block_invoke;
  v9[3] = &unk_2640FCD60;
  v9[4] = self;
  void v9[5] = a3;
  uint64_t v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

BOOL __46__HUNearbyHearingAidController_peerWithState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connectionStateForDevice:v3];
  if (v4 == 3)
  {
    id v5 = HCLogHearingHandoff();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __46__HUNearbyHearingAidController_peerWithState___block_invoke_cold_1(v3, v5);
    }
  }
  BOOL v6 = v4 == *(void *)(a1 + 40);

  return v6;
}

- (id)connectedPeer
{
  return [(HUNearbyHearingAidController *)self peerWithState:5];
}

- (id)connectingPeer
{
  return [(HUNearbyHearingAidController *)self peerWithState:3];
}

- (BOOL)isPeerConnectedToHearingDevice
{
  dispatch_time_t v2 = self;
  id v3 = NSString;
  uint64_t v4 = [(HUNearbyHearingAidController *)self connectedPeer];
  id v5 = [v3 stringWithFormat:@"Checking connection %@", v4];
  [(HUNearbyHearingAidController *)v2 logAvailableDevicesWithTitle:v5];

  BOOL v6 = [(HUNearbyHearingAidController *)v2 connectedPeer];
  LOBYTE(v2) = v6 != 0;

  return (char)v2;
}

- (void)checkPeerStateAfterTimout
{
  id v3 = [(HUNearbyHearingAidController *)self peerTimer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F21398]);
    id v5 = [(HUDeviceController *)self deviceUpdatesQueue];
    BOOL v6 = (void *)[v4 initWithTargetSerialQueue:v5];
    [(HUNearbyHearingAidController *)self setPeerTimer:v6];

    id v7 = [(HUNearbyHearingAidController *)self peerTimer];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__HUNearbyHearingAidController_checkPeerStateAfterTimout__block_invoke;
    v10[3] = &unk_2640FC960;
    v10[4] = self;
    [v7 afterDelay:v10 processBlock:7.5];

    id v8 = HCLogHearingHandoff();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "Starting peerTimer for Peer state", v9, 2u);
    }
  }
}

uint64_t __57__HUNearbyHearingAidController_checkPeerStateAfterTimout__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "peerTimer fired, We want to check the state", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateStateOnDeviceQueue];
}

- (void)connectedPeerWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HUDeviceController *)self deviceUpdatesQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__HUNearbyHearingAidController_connectedPeerWithCompletion___block_invoke;
    v6[3] = &unk_2640FCD88;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __60__HUNearbyHearingAidController_connectedPeerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) connectedPeer];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)urgentDevicesFromDevices:(id)a3
{
  return [(HUNearbyHearingAidController *)self devicesFromDevices:a3 withMessagePriority:0];
}

- (id)defaultDevicesFromDevices:(id)a3
{
  return [(HUNearbyHearingAidController *)self devicesFromDevices:a3 withMessagePriority:1];
}

- (id)devicesFromDevices:(id)a3 withMessagePriority:(unint64_t)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HUNearbyHearingAidController_devicesFromDevices_withMessagePriority___block_invoke;
  v6[3] = &unk_2640FCD60;
  v6[4] = self;
  void v6[5] = a4;
  id v4 = objc_msgSend(a3, "ax_filteredArrayUsingBlock:", v6);

  return v4;
}

BOOL __71__HUNearbyHearingAidController_devicesFromDevices_withMessagePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) connectionStateForDevice:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4 == 5;
  }
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (v5 != 1 || v4 != 5) && [*(id *)(a1 + 32) messagePriorityForDevice:v3] == *(void *)(a1 + 40);
  }

  return v8;
}

- (id)hearingDevice
{
  id v3 = [(HUNearbyHearingAidController *)self localDevice];
  if (!v3)
  {
    uint64_t v4 = +[HUHearingAidSettings sharedInstance];
    uint64_t v5 = [v4 pairedHearingAids];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [[AXRemoteHearingAidDevice alloc] initWithPersistentRepresentation:v5];
      [(AXRemoteHearingAidDevice *)v6 setUpdateDelegate:self];
      [(HUNearbyHearingAidController *)self setLocalDevice:v6];
    }
  }

  return v3;
}

- (void)sendMessagesPriorityHigh
{
  id v3 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HUNearbyHearingAidController_sendMessagesPriorityHigh__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __56__HUNearbyHearingAidController_sendMessagesPriorityHigh__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) messagesPriorityTimer];
  [v2 cancel];

  uint64_t result = [*(id *)(a1 + 32) deviceMessagePriority];
  if (result)
  {
    HAInitializeLogging();
    uint64_t v4 = [NSString stringWithFormat:@"XPC received MessagesPriority High"];
    uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController sendMessagesPriorityHigh]_block_invoke", 1365, v4];
    BOOL v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      BOOL v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) sendMessagesPriority:0];
  }
  return result;
}

- (void)sendMessagesPriorityDefault
{
  id v3 = [(HUDeviceController *)self deviceUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) deviceMessagePriority] != 1)
  {
    HAInitializeLogging();
    id v2 = NSString;
    id v3 = NSNumber;
    uint64_t v4 = [*(id *)(a1 + 32) messagesPriorityTimer];
    uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isPending"));
    BOOL v6 = [v2 stringWithFormat:@"XPC received MessagesPriority Default, push scheduled: %@", v5];

    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController sendMessagesPriorityDefault]_block_invoke", 1376, v6];
    BOOL v8 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v11 = [*(id *)(a1 + 32) messagesPriorityTimer];
    char v12 = [v11 isPending];

    if ((v12 & 1) == 0)
    {
      id v13 = [*(id *)(a1 + 32) messagesPriorityTimer];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke_161;
      v14[3] = &unk_2640FC960;
      v14[4] = *(void *)(a1 + 32);
      [v13 afterDelay:v14 processBlock:6.0];
    }
  }
}

uint64_t __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke_161(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessagesPriority:1];
}

- (void)sendMessagesPriority:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(HUNearbyHearingAidController *)self setDeviceMessagePriority:a3];
  uint64_t v4 = +[HUHearingAidSettings sharedInstance];
  uint64_t v5 = [v4 pairedHearingAids];

  if (v5)
  {
    HAInitializeLogging();
    BOOL v6 = NSString;
    id v7 = [(HUNearbyHearingAidController *)self descriptionForCurrentMessagePriority];
    BOOL v8 = [v6 stringWithFormat:@"IDS Sending MessagesPriority %@", v7];

    id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController sendMessagesPriority:]", 1392, v8];
    uint64_t v10 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      char v12 = v10;
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = [v11 UTF8String];
      _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v15 = &unk_26C1E5438;
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUNearbyHearingAidController deviceMessagePriority](self, "deviceMessagePriority"));
    uint64_t v16 = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [(HUNearbyHearingAidController *)self sendMessageToAllDevices:v14 messagePriority:1];
  }
}

- (id)descriptionForCurrentMessagePriority
{
  if (self->_deviceMessagePriority) {
    return @"Default";
  }
  else {
    return @"High";
  }
}

- (void)sendConnectionUpdateToPeers
{
  id v3 = +[HUHearingAidSettings sharedInstance];
  uint64_t v4 = [v3 pairedHearingAids];

  if (v4)
  {
    uint64_t v5 = [(HUDeviceController *)self deviceUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HUNearbyHearingAidController_sendConnectionUpdateToPeers__block_invoke;
    block[3] = &unk_2640FC960;
    void block[4] = self;
    dispatch_async(v5, block);
  }
}

void __59__HUNearbyHearingAidController_sendConnectionUpdateToPeers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendConnectionToCompanionIfPossible];
  [*(id *)(a1 + 32) updateStateOnDeviceQueue];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 availableRemoteControllersDidChange];
}

- (void)sendStateMessageToAllDevices:(id)a3 isUrgent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(HUNearbyHearingAidController *)self setIdsMessagesCount:[(HUNearbyHearingAidController *)self idsMessagesCount] + 1];
  id v7 = +[HUNearbyController sharedInstance];
  id v9 = v7;
  if (v4) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v7 sendMessage:v6 toDevicesWithDomain:@"com.apple.hearing.hearingaids" withPriority:v8];
}

- (void)sendMessageToAllDevices:(id)a3 messagePriority:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[HUNearbyController sharedInstance];
  [v6 sendMessage:v5 toDevicesWithDomain:@"com.apple.hearing.hearingaids" withPriority:a4];
}

- (void)sendStateMessage:(id)a3 toDevices:(id)a4 isUrgent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(HUNearbyHearingAidController *)self setIdsMessagesCount:[(HUNearbyHearingAidController *)self idsMessagesCount] + 1];
  uint64_t v10 = +[HUNearbyController sharedInstance];
  id v12 = v10;
  if (v5) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [v10 sendMessage:v9 withDomain:@"com.apple.hearing.hearingaids" toDevices:v8 withPriority:v11];
}

- (void)sendMessage:(id)a3 toDevices:(id)a4 messagePriority:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[HUNearbyController sharedInstance];
  [v9 sendMessage:v8 withDomain:@"com.apple.hearing.hearingaids" toDevices:v7 withPriority:a5];
}

- (void)sendMessage:(id)a3 toDevices:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HUNearbyController sharedInstance];
  [v7 sendMessage:v6 withDomain:@"com.apple.hearing.hearingaids" toDevices:v5 withPriority:1];
}

- (void)sendWriteToAllDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDeviceController *)self deviceUpdatesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke;
  v7[3] = &unk_2640FC938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastSentPropertyUpdates];
  char v3 = [v2 isEqualToDictionary:*(void *)(a1 + 40)];

  id v4 = *MEMORY[0x263F47290];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    if (v5) {
      __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_2((uint64_t *)(a1 + 40), v4);
    }
    [*(id *)(a1 + 32) setLastSentPropertyUpdates:*(void *)(a1 + 40)];
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v15 = [v14 availableDevices];
    [v14 sendWrite:v13 toDevices:v15];
  }
}

- (void)sendWrite:(id)a3 toDevices:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && [v7 count])
  {
    uint64_t v9 = NSDictionary;
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:8];
    uint64_t v11 = [v9 dictionaryWithObject:v6 forKey:v10];

    uint64_t v12 = [(HUNearbyHearingAidController *)self urgentDevicesFromDevices:v8];
    if ([v12 count])
    {
      HAInitializeLogging();
      uint64_t v13 = [NSString stringWithFormat:@"Sending Properties to urgent devices: %@", v12];
      uint64_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController sendWrite:toDevices:]", 1471, v13];
      uint64_t v15 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v14;
        uint64_t v17 = v15;
        *(_DWORD *)buf = 136446210;
        uint64_t v22 = [v16 UTF8String];
        _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(HUNearbyHearingAidController *)self sendMessage:v11 toDevices:v12];
    }
    [(HUNearbyHearingAidController *)self collectPropertyUpdatesFromPayload:v6];
    uint64_t v18 = [(HUNearbyHearingAidController *)self sendPropertyUpdatesLowTimer];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__HUNearbyHearingAidController_sendWrite_toDevices___block_invoke;
    v19[3] = &unk_2640FC938;
    v19[4] = self;
    id v20 = v8;
    [v18 afterDelay:v19 processBlock:4.0];
  }
}

void __52__HUNearbyHearingAidController_sendWrite_toDevices___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) defaultDevicesFromDevices:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    char v3 = [*(id *)(a1 + 32) collectedPropertyUpdates];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      BOOL v5 = NSDictionary;
      id v6 = [*(id *)(a1 + 32) collectedPropertyUpdates];
      id v7 = (void *)[v6 copy];
      uint64_t v8 = [NSNumber numberWithUnsignedLongLong:8];
      uint64_t v9 = [v5 dictionaryWithObject:v7 forKey:v8];

      [*(id *)(a1 + 32) sendMessage:v9 toDevices:v2 messagePriority:2];
      HAInitializeLogging();
      uint64_t v10 = [NSString stringWithFormat:@"Sending Properties:\n%@\nto default devices:\n%@", v9, v2];
      uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController sendWrite:toDevices:]_block_invoke", 1482, v10];
      uint64_t v12 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v11;
        uint64_t v14 = v12;
        *(_DWORD *)buf = 136446210;
        uint64_t v17 = [v13 UTF8String];
        _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v15 = [*(id *)(a1 + 32) collectedPropertyUpdates];
      [v15 removeAllObjects];
    }
  }
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5 toDevices:(id)a6
{
  v19[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 && [v11 length])
  {
    id v18 = v11;
    id v13 = [NSNumber numberWithUnsignedLongLong:a4];
    id v16 = v13;
    id v17 = v10;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [(HUNearbyHearingAidController *)self sendWrite:v15 toDevices:v12];
  }
}

- (void)collectPropertyUpdatesFromPayload:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__HUNearbyHearingAidController_collectPropertyUpdatesFromPayload___block_invoke;
  v3[3] = &unk_2640FCDB0;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __66__HUNearbyHearingAidController_collectPropertyUpdatesFromPayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [*(id *)(a1 + 32) collectedPropertyUpdates];
      id v7 = [v6 objectForKey:v10];
      uint64_t v8 = (void *)[v7 mutableCopy];

      if (!v8) {
        uint64_t v8 = objc_opt_new();
      }
      [v8 addEntriesFromDictionary:v5];
      uint64_t v9 = [*(id *)(a1 + 32) collectedPropertyUpdates];
      [v9 setObject:v8 forKey:v10];
    }
  }
}

- (id)device:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  HAInitializeLogging();
  uint64_t v8 = [NSString stringWithFormat:@"%ld== %@ - %@", -[HUNearbyHearingAidController state](self, "state"), v6, v7];
  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController device:didReceiveMessage:]", 1520, v8];
  id v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __57__HUNearbyHearingAidController_device_didReceiveMessage___block_invoke;
  v20[3] = &unk_2640FCDD8;
  id v14 = v6;
  id v21 = v14;
  uint64_t v22 = self;
  p_long long buf = &buf;
  id v24 = &v25;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];
  if (v14 && *(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    uint64_t v15 = objc_opt_new();
    id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUNearbyHearingAidController deviceMessagePriority](self, "deviceMessagePriority"));
    [v15 setObject:v16 forKey:&unk_26C1E5438];

    if (!*((unsigned char *)v26 + 24))
    {
      id v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HUNearbyHearingAidController state](self, "state"));
      [v15 setObject:v17 forKey:&unk_26C1E5420];
    }
    id v29 = v14;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [(HUNearbyHearingAidController *)self sendStateMessage:v15 toDevices:v18 isUrgent:1];
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __57__HUNearbyHearingAidController_device_didReceiveMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedLongLongValue];
  if (v6 < 0x8000)
  {
    if (v6 == 8)
    {
      [*(id *)(a1 + 40) processWriteMessageWithValue:v5];
      goto LABEL_20;
    }
    if (v6 == 16)
    {
      [*(id *)(a1 + 40) processReadMessageFromPeerDevice:*(void *)(a1 + 32) value:v5];
      goto LABEL_20;
    }
    if (v6 != 4096) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  switch(v6)
  {
    case 0x8000:
      [*(id *)(a1 + 40) processHandoffMessageFromPeer:*(void *)(a1 + 32) state:v5];
      break;
    case 0x20000:
      HAInitializeLogging();
      id v10 = NSString;
      id v11 = [*(id *)(a1 + 32) name];
      id v12 = [v10 stringWithFormat:@"IDS Received HCMessageIdentifierMessagesPriority: %@ from device: %@", v5, v11];

      id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController device:didReceiveMessage:]_block_invoke", 1557, v12];
      id v14 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v13;
        id v16 = v14;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v18 = [v15 UTF8String];
        _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(*(id *)(a1 + 40), "setMessagePriority:forDevice:", objc_msgSend(v5, "integerValue"), *(void *)(a1 + 32));
      }
      break;
    case 0x80000:
      id v7 = HCLogHearingHandoff();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*(id *)(a1 + 32) name];
        uint64_t v9 = [*(id *)(a1 + 40) descriptionForCurrentState];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v18 = (uint64_t)v8;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "Received CheckIn from device: %@, current state: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_12:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) processStateMessageFromPeer:*(void *)(a1 + 32) state:v5];
      break;
  }
LABEL_20:
}

- (void)updateResponse:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:&unk_26C1E5420];

  if (!v7) {
    [(HUNearbyHearingAidController *)self setIdsMessagesCount:[(HUNearbyHearingAidController *)self idsMessagesCount] + 1];
  }
  id v8 = [NSNumber numberWithInteger:a4];
  [v6 setObject:v8 forKey:&unk_26C1E5420];
}

- (void)validateResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:&unk_26C1E5420];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    if (v7 != [(HUNearbyHearingAidController *)self state]) {
      [(HUNearbyHearingAidController *)self updateResponse:v4 withState:[(HUNearbyHearingAidController *)self state]];
    }
    id v8 = HCLogHearingHandoff();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(HUNearbyHearingAidController *)self descriptionForCurrentState];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "Response ControllerConnected state: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)processHandoffMessageFromPeer:(id)a3 state:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HCLogHearingHandoff();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(HUNearbyHearingAidController *)self timeStamp];
    int v10 = [v6 name];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v26 = (uint64_t)v7;
    __int16 v27 = 2112;
    char v28 = v9;
    __int16 v29 = 2112;
    int v30 = v10;
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "Received ControllerConnectWithReason: %@, time: %@, from device: %@", buf, 0x20u);
  }
  id v11 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = 1;
    goto LABEL_8;
  }
  uint64_t v12 = [v11 integerValue];
  uint64_t v13 = v12;
  if ((unint64_t)(v12 - 1) < 5)
  {
LABEL_8:
    [(HUNearbyHearingAidController *)self relinquishConnectionForReason:v13 toDevice:v6];
    goto LABEL_9;
  }
  if (!v12)
  {
    dispatch_time_t v14 = dispatch_time(0, 1000000000);
    id v15 = [(HUDeviceController *)self deviceUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__HUNearbyHearingAidController_processHandoffMessageFromPeer_state___block_invoke;
    block[3] = &unk_2640FC960;
    void block[4] = self;
    dispatch_after(v14, v15, block);
  }
LABEL_9:
  id v16 = [(HUNearbyHearingAidController *)self delegate];

  if (v16)
  {
    id v17 = [(HUNearbyHearingAidController *)self delegate];
    [v17 availableRemoteControllersDidChange];

    HAInitializeLogging();
    uint64_t v18 = [NSString stringWithFormat:@"Handoff requested. Updated available controllers"];
    __int16 v19 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController processHandoffMessageFromPeer:state:]", 1645, v18];
    id v20 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      uint64_t v22 = v20;
      uint64_t v23 = [v21 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v26 = v23;
      _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __68__HUNearbyHearingAidController_processHandoffMessageFromPeer_state___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestConnection];
}

- (BOOL)processStateMessageFromPeer:(id)a3 state:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [a4 integerValue];
  id v8 = HCLogHearingHandoff();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 name];
    int v10 = [(HUNearbyHearingAidController *)self descriptionForState:v7];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v27 = (uint64_t)v9;
    __int16 v28 = 2112;
    __int16 v29 = v10;
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "Received ControllerConnected peer: %@, peer state: %@", buf, 0x16u);
  }
  [(HUNearbyHearingAidController *)self setConnectionState:v7 forDevice:v6];
  BOOL v11 = [(HUNearbyHearingAidController *)self updateStateOnDeviceQueue];
  uint64_t v12 = +[AXHearingAidDeviceController sharedController];
  char v13 = [v12 isConnected];

  if ((v13 & 1) == 0)
  {
    dispatch_time_t v14 = [(HUNearbyHearingAidController *)self hearingDevice];
    char v15 = [v14 didLoadRequiredPeerProperties];

    if ((v15 & 1) == 0)
    {
      id v16 = [(HUNearbyHearingAidController *)self hearingDevice];
      [v16 loadRequiredProperties];
    }
  }
  id v17 = [(HUNearbyHearingAidController *)self delegate];

  if (v17)
  {
    uint64_t v18 = [(HUNearbyHearingAidController *)self delegate];
    [v18 availableRemoteControllersDidChange];

    HAInitializeLogging();
    __int16 v19 = [NSString stringWithFormat:@"Controller state changed. Updated available controllers"];
    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController processStateMessageFromPeer:state:]", 1672, v19];
    id v21 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v20;
      uint64_t v23 = v21;
      uint64_t v24 = [v22 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = v24;
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

  return v11;
}

- (void)processReadMessageFromPeerDevice:(id)a3 value:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AXHAController sharedController];
  uint64_t v9 = [v8 pairedDeviceUUID];

  if (v6)
  {
    if ([(HUNearbyHearingAidController *)self state] == 5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __71__HUNearbyHearingAidController_processReadMessageFromPeerDevice_value___block_invoke;
        v18[3] = &unk_2640FCE00;
        v18[4] = self;
        id v19 = v6;
        [v7 enumerateKeysAndObjectsUsingBlock:v18];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(HUNearbyHearingAidController *)self processReadProperty:v7 fromPeerDevice:v6];
        }
      }
    }
    else if ([(HUNearbyHearingAidController *)self state] == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 integerValue] == 0x1000000)
      {
        char v15 = [(HUNearbyHearingAidController *)self hearingDevice];
        id v16 = [v15 valueForProperty:0x1000000];
        id v20 = v6;
        id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        [(HUNearbyHearingAidController *)self writeValue:v16 forProperty:0x1000000 andDeviceID:v9 toDevices:v17];
      }
    }
  }
  else
  {
    HAInitializeLogging();
    int v10 = [NSString stringWithFormat:@"Asking for device property read but device is nil"];
    BOOL v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController processReadMessageFromPeerDevice:value:]", 1686, v10];
    uint64_t v12 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      dispatch_time_t v14 = v12;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v22 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __71__HUNearbyHearingAidController_processReadMessageFromPeerDevice_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processReadProperty:a2 fromPeerDevice:*(void *)(a1 + 40)];
}

- (void)processReadProperty:(id)a3 fromPeerDevice:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AXHAController sharedController];
  uint64_t v9 = [v8 pairedDeviceUUID];

  uint64_t v10 = [v7 unsignedLongLongValue];
  BOOL v11 = +[AXHearingAidDeviceController sharedController];
  uint64_t v12 = [v11 valueForProperty:v10 forDeviceID:v9];

  v14[0] = v6;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  [(HUNearbyHearingAidController *)self writeValue:v12 forProperty:v10 andDeviceID:v9 toDevices:v13];
}

- (void)processWriteMessageWithValue:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[AXHAController sharedController];
  id v6 = [v5 pairedDeviceUUID];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count] == 1)
  {
    if ([(HUNearbyHearingAidController *)self state] == 5)
    {
      id v7 = +[AXHearingAidDeviceController sharedController];
      id v8 = [v7 hearingAidForDeviceID:v6];

      uint64_t v9 = +[AXHearingAidDeviceController sharedController];
    }
    else
    {
      id v8 = [(HUNearbyHearingAidController *)self hearingDevice];
      uint64_t v9 = self;
      if ([(HUNearbyHearingAidController *)v9 isPeerConnectedToHearingDevice]) {
        uint64_t v10 = &unk_26C1E5468;
      }
      else {
        uint64_t v10 = &unk_26C1E5450;
      }
      [v8 setValue:v10 forProperty:0x200000];
    }
    id v11 = v4;
    uint64_t v12 = [v11 allKeys];
    id v13 = [v12 lastObject];
    dispatch_time_t v14 = [v8 deviceUUID];
    int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v16 = [v8 deviceUUID];
      uint64_t v17 = [v11 objectForKey:v16];

      id v11 = (id)v17;
    }
    else
    {
      HAInitializeLogging();
      uint64_t v18 = [NSString stringWithFormat:@"Unknown device ID %@ - %@", v8, v11];
      id v19 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController processWriteMessageWithValue:]", 1750, v18];
      id v20 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v19;
        uint64_t v22 = v20;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v29 = [v21 UTF8String];
        _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__HUNearbyHearingAidController_processWriteMessageWithValue___block_invoke;
    v25[3] = &unk_2640FCE00;
    uint64_t v26 = v9;
    id v27 = v8;
    id v23 = v8;
    uint64_t v24 = v9;
    [v11 enumerateKeysAndObjectsUsingBlock:v25];
  }
}

void __61__HUNearbyHearingAidController_processWriteMessageWithValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedLongLongValue];
  if (v6 != 0x200000)
  {
    uint64_t v7 = v6;
    id v8 = v5;
    if (propertyContainsProperty(v7, 0x200000))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];

        [v9 removeObjectForKey:&unk_26C1E5480];
        id v8 = v9;
      }
    }
    HAInitializeLogging();
    uint64_t v10 = [NSString stringWithFormat:@"Updating controller %@", *(void *)(a1 + 32)];
    id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController processWriteMessageWithValue:]_block_invoke", 1765, v10];
    uint64_t v12 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      dispatch_time_t v14 = v12;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v16 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [*(id *)(a1 + 40) setValue:v8 forProperty:v7];
    [*(id *)(a1 + 32) device:*(void *)(a1 + 40) didUpdateProperty:v7];
  }
}

- (id)hearingAidForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(HUNearbyHearingAidController *)self hearingDevice];
  uint64_t v6 = [v5 deviceUUID];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    id v8 = [(HUNearbyHearingAidController *)self hearingDevice];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = +[HUHearingAidSettings sharedInstance];
  char v8 = [v7 isiCloudPaired];

  if (v8)
  {
    HAInitializeLogging();
    uint64_t v9 = [NSString stringWithFormat:@"Don't request properties, iCloudPaired"];
    uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController updateProperty:forDeviceID:]", 1801, v9];
    id v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__HUNearbyHearingAidController_updateProperty_forDeviceID___block_invoke;
    v15[3] = &unk_2640FCC50;
    void v15[4] = self;
    v15[5] = a3;
    [(HUNearbyHearingAidController *)self connectedPeerWithCompletion:v15];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUNearbyHearingAidController;
  [(HUDeviceController *)&v14 updateProperty:a3 forDeviceID:v6];
}

void __59__HUNearbyHearingAidController_updateProperty_forDeviceID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3 && *(void *)(a1 + 40) != 0x1000000)
  {
    HAInitializeLogging();
    id v4 = NSString;
    id v5 = hearingPropertyDescription(*(void *)(a1 + 40));
    id v6 = [v3 name];
    int v7 = [v4 stringWithFormat:@"IDS Requesting property %@ from device %@", v5, v6];

    char v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController updateProperty:forDeviceID:]_block_invoke", 1794, v7];
    uint64_t v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      id v11 = v9;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v22 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = [NSNumber numberWithUnsignedLongLong:16];
    id v19 = v13;
    objc_super v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    id v20 = v14;
    int v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v18 = v3;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    if ([*(id *)(a1 + 32) deviceMessagePriority]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [v12 sendMessage:v15 toDevices:v16 messagePriority:v17];
  }
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HUNearbyHearingAidController *)self hearingAidForDeviceID:v9];
  id v11 = [v10 valueForProperty:a4];
  char v12 = [v11 isEqual:v8];

  HAInitializeLogging();
  id v13 = NSString;
  if (v12)
  {
    objc_super v14 = [NSString stringWithFormat:@"Skipping write because value didn't change"];
    int v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:]", 1821, v14];
    uint64_t v16 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      id v18 = v16;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v32 = [v17 UTF8String];
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    id v19 = [v10 valueForProperty:a4];
    id v20 = [v13 stringWithFormat:@"Writing %@ = %@", v19, v8];

    id v21 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:]", 1813, v20];
    uint64_t v22 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      uint64_t v24 = v22;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v32 = [v23 UTF8String];
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v30.receiver = self;
    v30.super_class = (Class)HUNearbyHearingAidController;
    [(HUDeviceController *)&v30 writeValue:v8 forProperty:a4 andDeviceID:v9];
    uint64_t v25 = [(HUDeviceController *)self deviceUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HUNearbyHearingAidController_writeValue_forProperty_andDeviceID___block_invoke;
    block[3] = &unk_2640FCE28;
    void block[4] = self;
    id v27 = v8;
    unint64_t v29 = a4;
    id v28 = v9;
    dispatch_async(v25, block);
  }
}

void __67__HUNearbyHearingAidController_writeValue_forProperty_andDeviceID___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v3 = a1[7];
  id v5 = [v1 availableDevices];
  [v1 writeValue:v2 forProperty:v3 andDeviceID:v4 toDevices:v5];
}

- (BOOL)representsLocalDevices
{
  return 0;
}

- (int64_t)state
{
  return self->_state;
}

- (HUNearbyHearingAidControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUNearbyHearingAidControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (AXRemoteHearingAidDevice)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
}

- (OS_dispatch_queue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(id)a3
{
}

- (AXDispatchTimer)sendConnectionToCompanionTimer
{
  return self->_sendConnectionToCompanionTimer;
}

- (void)setSendConnectionToCompanionTimer:(id)a3
{
}

- (BOOL)holdingMediaForConnection
{
  return self->_holdingMediaForConnection;
}

- (void)setHoldingMediaForConnection:(BOOL)a3
{
  self->_holdingMediaForConnection = a3;
}

- (BOOL)holdingPhoneForConnection
{
  return self->_holdingPhoneForConnection;
}

- (void)setHoldingPhoneForConnection:(BOOL)a3
{
  self->_holdingPhoneForConnection = a3;
}

- (unint64_t)idsMessagesCount
{
  return self->_idsMessagesCount;
}

- (void)setIdsMessagesCount:(unint64_t)a3
{
  self->_idsMessagesCount = a3;
}

- (NSTimer)idsMessagesTimer
{
  return self->_idsMessagesTimer;
}

- (void)setIdsMessagesTimer:(id)a3
{
}

- (int64_t)processingHandoff
{
  return self->_processingHandoff;
}

- (void)setProcessingHandoff:(int64_t)a3
{
  self->_processingHandoff = a3;
}

- (int64_t)handoffReason
{
  return self->_handoffReason;
}

- (void)setHandoffReason:(int64_t)a3
{
  self->_handoffReason = a3;
}

- (AXDispatchTimer)handoffTimer
{
  return self->_handoffTimer;
}

- (void)setHandoffTimer:(id)a3
{
}

- (id)relinquishCompleted
{
  return self->_relinquishCompleted;
}

- (void)setRelinquishCompleted:(id)a3
{
}

- (AXDispatchTimer)peerTimer
{
  return self->_peerTimer;
}

- (void)setPeerTimer:(id)a3
{
}

- (unint64_t)deviceMessagePriority
{
  return self->_deviceMessagePriority;
}

- (void)setDeviceMessagePriority:(unint64_t)a3
{
  self->_deviceMessagePriority = a3;
}

- (HUSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (NSDictionary)lastSentPropertyUpdates
{
  return self->_lastSentPropertyUpdates;
}

- (void)setLastSentPropertyUpdates:(id)a3
{
}

- (AXDispatchTimer)sendPropertyUpdatesLowTimer
{
  return self->_sendPropertyUpdatesLowTimer;
}

- (void)setSendPropertyUpdatesLowTimer:(id)a3
{
}

- (NSMutableDictionary)collectedPropertyUpdates
{
  return self->_collectedPropertyUpdates;
}

- (void)setCollectedPropertyUpdates:(id)a3
{
}

- (AXDispatchTimer)messagesPriorityTimer
{
  return self->_messagesPriorityTimer;
}

- (void)setMessagesPriorityTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesPriorityTimer, 0);
  objc_storeStrong((id *)&self->_collectedPropertyUpdates, 0);
  objc_storeStrong((id *)&self->_sendPropertyUpdatesLowTimer, 0);
  objc_storeStrong((id *)&self->_lastSentPropertyUpdates, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_peerTimer, 0);
  objc_storeStrong(&self->_relinquishCompleted, 0);
  objc_storeStrong((id *)&self->_handoffTimer, 0);
  objc_storeStrong((id *)&self->_idsMessagesTimer, 0);
  objc_storeStrong((id *)&self->_sendConnectionToCompanionTimer, 0);
  objc_storeStrong((id *)&self->_mediaQueue, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "mediaPlaybackDidChange isPlaying %d", (uint8_t *)v2, 8u);
}

- (void)connectionStateForDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [(id)OUTLINED_FUNCTION_2() name];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_20CC86000, v2, v6, "connectionStateForDevice %@ %@", (uint8_t *)&v7);
}

- (void)setConnectionState:(void *)a1 forDevice:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a1;
  [a2 stateForDomain:@"com.apple.hearing.hearingaids.connection"];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_2() name];
  int v7 = 138412546;
  uint64_t v8 = v2;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_20CC86000, v4, v6, "setConnectionState %@ %@", (uint8_t *)&v7);
}

- (void)messagePriorityForDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [(id)OUTLINED_FUNCTION_2() name];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_20CC86000, v2, v6, "messagePriorityForDevice %@ %@", (uint8_t *)&v7);
}

- (void)setMessagePriority:(void *)a1 forDevice:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a1;
  [a2 stateForDomain:@"com.apple.hearing.hearingaids.priority"];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_2() name];
  int v7 = 138412546;
  uint64_t v8 = v2;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_20CC86000, v4, v6, "setMessagePriority %@ %@", (uint8_t *)&v7);
}

void __46__HUNearbyHearingAidController_peerWithState___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "PeerConnecting: %@", (uint8_t *)&v4, 0xCu);
}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "sendWriteToAllDevices payload:\n%@", (uint8_t *)&v3, 0xCu);
}

@end