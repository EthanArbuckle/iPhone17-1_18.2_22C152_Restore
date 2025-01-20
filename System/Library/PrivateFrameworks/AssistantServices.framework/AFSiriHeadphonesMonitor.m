@interface AFSiriHeadphonesMonitor
+ (id)sharedMonitor;
- (AFSiriAudioRoute)currentAudioRoute;
- (BOOL)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3;
- (id)_init;
- (id)_settingsConnection;
- (unint64_t)_observerID;
- (void)_audioRouteDidChange:(id)a3;
- (void)_broadcastInEarDetectionStateChangesFrom:(id)a3 to:(id)a4;
- (void)_broadcastRouteAndAuthenticationCapability;
- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)_fetchInitialState;
- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3;
- (void)_handleJSDiscoveryNotificationForDevice:(id)a3;
- (void)_postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 scheduled:(BOOL)a4;
- (void)_recomputePrivateSessionStateAndBroadcast:(BOOL)a3;
- (void)_settingsConnectionDidDisconnect;
- (void)_stopObservingInEarDetectionStateFromSource;
- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus;
- (void)_updateInEarDetectionStateAndObserve;
- (void)_updateWirelessSplitterSessionInfoAndObserve;
- (void)accesoryAACPCapabilitiesReceived:(id)a3;
- (void)addDelegate:(id)a3;
- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4;
- (void)fetchInEarDetctionStateForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)fetchPrivateSessionStateWithCompletion:(id)a3;
- (void)initializeAVSystemControllerSubscriptions:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)removeDelegate:(id)a3;
- (void)setCurrentAudioRoute:(id)a3;
- (void)startObservingBluetoothConnections;
- (void)updateAudioRouteAvailability:(id)a3;
@end

@implementation AFSiriHeadphonesMonitor

uint64_t __56__AFSiriHeadphonesMonitor_updateAudioRouteAvailability___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAudioRouteAvailabilityAndBroadcast:1];
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[33])
  {
    [v2 _updateWirelessSplitterSessionInfoAndObserve];
    v2 = *(unsigned char **)(a1 + 32);
  }
  return [v2 _updateInEarDetectionStateAndObserve];
}

- (BOOL)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = self->_currentAudioRoute;
  v6 = AFSiriHeadphonesMonitorGetCurrentlySelectedAudioRoute([(AFDeviceRingerSwitchObserver *)self->_ringerSwitchObserver state]);
  [(AFSiriHeadphonesMonitor *)self setCurrentAudioRoute:v6];
  char v7 = [v6 isEqualToRoute:v5];
  if ((v7 & 1) == 0)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      btAddress = self->_btAddress;
      routeName = self->_routeName;
      v11 = v8;
      v12 = [v6 routeName];
      v13 = [v6 btAddress];
      *(_DWORD *)buf = 136316162;
      v30 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v31 = 2112;
      v32 = routeName;
      __int16 v33 = 2112;
      v34 = btAddress;
      __int16 v35 = 2112;
      v36 = v12;
      __int16 v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s Route changed from %@(%@) to %@(%@)", buf, 0x34u);

      v8 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = v8;
      v15 = [v6 avscRouteDescription];
      *(_DWORD *)buf = 136315394;
      v30 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s Currently picked - routeDescription %@", buf, 0x16u);
    }
    v16 = [v6 btAddress];
    v17 = self->_btAddress;
    self->_btAddress = v16;

    v18 = [v6 routeName];
    v19 = self->_routeName;
    self->_routeName = v18;

    v20 = self->_btAddress;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke;
    v28[3] = &unk_1E5927F10;
    v28[4] = self;
    [(AFSiriHeadphonesMonitor *)self _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:v20 withCompletion:v28];
    v21 = (void *)[v6 copy];
    btQueue = self->_btQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_21;
    block[3] = &unk_1E592C710;
    id v23 = v21;
    id v26 = v23;
    v27 = self;
    dispatch_async(btQueue, block);
    if (v3) {
      [(AFSiriHeadphonesMonitor *)self _broadcastRouteAndAuthenticationCapability];
    }
  }
  return v7 ^ 1;
}

- (void)setCurrentAudioRoute:(id)a3
{
}

- (void)_updateInEarDetectionStateAndObserve
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void *__63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 88);
  if (result)
  {
    result = (void *)[result length];
    if (result == (void *)17)
    {
      BOOL v3 = *(void **)(a1 + 32);
      uint64_t v4 = v3[11];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_2;
      v5[3] = &unk_1E5927F10;
      v5[4] = v3;
      return (void *)[v3 _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:v4 withCompletion:v5];
    }
  }
  return result;
}

- (void)updateAudioRouteAvailability:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AFSiriHeadphonesMonitor updateAudioRouteAvailability:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Updating route availability due to: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AFSiriHeadphonesMonitor_updateAudioRouteAvailability___block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAudioRoute, 0);
  objc_storeStrong((id *)&self->_devicesAwaitingJSNotification, 0);
  objc_storeStrong((id *)&self->_devicesScheduledForJSNotification, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_btQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_ringerSwitchObserver, 0);
  objc_storeStrong((id *)&self->_wirelessGuestConnectionObserver, 0);
  objc_storeStrong((id *)&self->_wirelessSplitterSessionObserver, 0);
  objc_storeStrong((id *)&self->_inEarDetectionStateObserver, 0);
  objc_storeStrong((id *)&self->_pairedInfoChangeObserver, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_inEarDetectionState, 0);
}

- (void)_postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 scheduled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  char v7 = [v6 address];
  v8 = [(AFSiriHeadphonesMonitor *)self currentAudioRoute];
  v9 = [v8 btAddress];

  if (v4 && ([v7 isEqualToString:v9] & 1) == 0)
  {
    uint64_t v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      v15 = [v6 name];
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]";
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Scheduled JS Discovery notification for %@(%@)", buf, 0x20u);
    }
    v13 = [(NSMutableDictionary *)self->_devicesScheduledForJSNotification objectForKey:v7];

    if (!v13) {
      [(NSMutableDictionary *)self->_devicesScheduledForJSNotification setObject:v6 forKey:v7];
    }
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, 5500000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke;
    block[3] = &unk_1E592C338;
    void block[4] = self;
    id v17 = v6;
    id v18 = v7;
    dispatch_after(v10, queue, block);
  }
}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_2;
  v6[3] = &unk_1E5928050;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 postJSDiscoveryNotificationForBTDeviceWithInfo:v2 withCompletion:v6];
}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v6 = v4;
      id v7 = [v5 name];
      id v8 = [*(id *)(a1 + 40) address];
      *(_DWORD *)buf = 136315906;
      v20 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]_block_invoke_2";
      __int16 v21 = 2112;
      v22 = v7;
      __int16 v23 = 2112;
      v24 = v8;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Failed to post JS Discovery notification for %@(%@), error: %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v9 = +[AFPreferences sharedPreferences];
    [v9 setCompactVoiceTriggerDiscoveryNotificationPresented:1 forBTDeviceWithAddress:*(void *)(a1 + 32)];

    dispatch_time_t v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      v14 = v10;
      v15 = [v13 name];
      v16 = [*(id *)(a1 + 40) address];
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]_block_invoke_2";
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s JS Discovery notification for %@(%@) was posted successfully!", buf, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(NSObject **)(v11 + 112);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_50;
    v17[3] = &unk_1E592C710;
    v17[4] = v11;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v12, v17);
  }
}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_50(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 136);
  id v2 = [*(id *)(a1 + 40) address];
  [v1 removeObject:v2];
}

- (void)_handleJSDiscoveryNotificationForDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  uint64_t v5 = [v4 name];
  id v6 = [v4 address];
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
    __int16 v22 = 2112;
    __int16 v23 = v5;
    __int16 v24 = 2112;
    __int16 v25 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Received AACP capabilities for %@(%@)", buf, 0x20u);
  }
  if (([(NSMutableSet *)self->_devicesAwaitingJSNotification containsObject:v6] & 1) == 0)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%u,%u", objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
    BOOL v9 = (AFIsH2Headset(v8) & 1) != 0 || [v4 getAACPCapabilityInteger:96] != 0;
    if ([v5 isEqualToString:v6])
    {
      dispatch_time_t v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
        __int16 v22 = 2112;
        __int16 v23 = v5;
        __int16 v24 = 2112;
        __int16 v25 = v6;
        _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Unable to fetch device name for %@(%@)", buf, 0x20u);
      }
    }
    else if ((([v4 supportsHS] ^ 1 | v9) & 1) == 0)
    {
      uint64_t v11 = +[AFPreferences sharedPreferences];
      if ([v11 deviceUsesCompactVoiceTrigger])
      {
        if (([v11 hasPresentedCompactVoiceTriggerDiscoveryNotificationForBTDeviceWithAddress:v6] & 1) == 0)
        {
          uint64_t v12 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
            __int16 v22 = 2112;
            __int16 v23 = v5;
            __int16 v24 = 2112;
            __int16 v25 = v6;
            _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Trigger notification:%@(%@) doesn't support JS", buf, 0x20u);
          }
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __67__AFSiriHeadphonesMonitor__handleJSDiscoveryNotificationForDevice___block_invoke;
          v16[3] = &unk_1E5928028;
          id v17 = v5;
          id v13 = v6;
          id v18 = v13;
          id v19 = v4;
          id v14 = +[AFBluetoothDeviceInfo newWithBuilder:v16];
          [(NSMutableSet *)self->_devicesAwaitingJSNotification addObject:v13];
          [(AFSiriHeadphonesMonitor *)self _postJSDiscoveryNotificationForBTDeviceWithInfo:v14 scheduled:1];
        }
      }
      else
      {
        v15 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
          _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s deviceUsesCompactVoiceTrigger: NO", buf, 0xCu);
        }
      }
    }
  }
}

void __67__AFSiriHeadphonesMonitor__handleJSDiscoveryNotificationForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setName:v3];
  [v4 setAddress:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setVendorID:", objc_msgSend(*(id *)(a1 + 48), "vendorId"));
  objc_msgSend(v4, "setProductID:", objc_msgSend(*(id *)(a1 + 48), "productId"));
}

- (void)accesoryAACPCapabilitiesReceived:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 object];
  id v6 = (void *)[v5 copy];

  btQueue = self->_btQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AFSiriHeadphonesMonitor_accesoryAACPCapabilitiesReceived___block_invoke;
  block[3] = &unk_1E5929FC0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(btQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__AFSiriHeadphonesMonitor_accesoryAACPCapabilitiesReceived___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[AFSiriHeadphonesMonitor accesoryAACPCapabilitiesReceived:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Bluetooth device: %@", (uint8_t *)&v5, 0x16u);
  }
  if (*(void *)(a1 + 32)) {
    objc_msgSend(WeakRetained, "_handleJSDiscoveryNotificationForDevice:");
  }
}

- (void)startObservingBluetoothConnections
{
  btQueue = self->_btQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AFSiriHeadphonesMonitor_startObservingBluetoothConnections__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(btQueue, block);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v5 = (void *)getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr;
  uint64_t v13 = getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr;
  if (!getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_block_invoke;
    v9[3] = &unk_1E592C0B0;
    v9[4] = &v10;
    __getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_block_invoke(v9);
    int v5 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v5)
  {
    [v4 addObserver:self selector:sel_accesoryAACPCapabilitiesReceived_ name:*v5 object:0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v7 = [NSString stringWithUTF8String:"NSString *getBluetoothAccessoryAACPCapabilitiesReceived(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"AFSiriHeadphonesMonitor.m", 66, @"%s", dlerror());

    __break(1u);
  }
}

void __61__AFSiriHeadphonesMonitor_startObservingBluetoothConnections__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 128))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 136))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 136);
    *(void *)(v7 + 136) = v6;
  }
}

- (void)_audioRouteDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  devicesScheduledForJSNotification = self->_devicesScheduledForJSNotification;
  if (devicesScheduledForJSNotification)
  {
    id v6 = [v4 btAddress];
    uint64_t v7 = [(NSMutableDictionary *)devicesScheduledForJSNotification objectForKey:v6];

    if (v7)
    {
      uint64_t v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = v8;
        uint64_t v10 = [v4 routeName];
        id v11 = [v4 btAddress];
        int v17 = 136315650;
        id v18 = "-[AFSiriHeadphonesMonitor _audioRouteDidChange:]";
        __int16 v19 = 2112;
        v20 = v10;
        __int16 v21 = 2112;
        __int16 v22 = v11;
        _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s %@(%@) Picked, posting notification now...", (uint8_t *)&v17, 0x20u);
      }
      uint64_t v12 = self->_devicesScheduledForJSNotification;
      uint64_t v13 = [v4 btAddress];
      id v14 = [(NSMutableDictionary *)v12 objectForKey:v13];

      v15 = self->_devicesScheduledForJSNotification;
      v16 = [v4 btAddress];
      [(NSMutableDictionary *)v15 removeObjectForKey:v16];

      [(AFSiriHeadphonesMonitor *)self _postJSDiscoveryNotificationForBTDeviceWithInfo:v14 scheduled:0];
    }
  }
}

- (unint64_t)_observerID
{
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)fetchInEarDetctionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke_2;
  v3[3] = &unk_1E5928000;
  id v4 = *(id *)(a1 + 48);
  [v1 _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:v2 withCompletion:v3];
}

void __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v7 = v9;
    if (v5)
    {
      id v7 = 0;
      id v8 = v5;
    }
    else
    {
      id v8 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v8);
  }
}

- (void)fetchPrivateSessionStateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching private session state", buf, 0xCu);
  }
  if (self->_guestConnected)
  {
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
      _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s Guest connections active", buf, 0xCu);
    }
    v4[2](v4, 2, 0);
  }
  else
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke;
    v8[3] = &unk_1E592C6E8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
}

void __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 33) && (uint64_t v3 = *(void *)(v2 + 8)) != 0)
  {
    id v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      id v7 = (void *)MEMORY[0x1E4F28ED0];
      id v8 = v4;
      id v9 = [v7 numberWithUnsignedInteger:v3];
      *(_DWORD *)buf = 136315394;
      id v13 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]_block_invoke";
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Private session state: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (AFSupportsWirelessSplitter_onceToken != -1) {
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_235);
    }
    id v5 = *(unsigned char **)(a1 + 32);
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_39;
      v10[3] = &unk_1E5927FD8;
      v10[4] = v5;
      id v11 = *(id *)(a1 + 40);
      [v5 _fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:v10];
    }
    else
    {
      v5[33] = 1;
      *(void *)(*(void *)(a1 + 32) + 8) = 1;
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v6();
    }
  }
}

void __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 104);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_2;
  v11[3] = &unk_1E592A8F8;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) state] != 1;
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v2();
  }
  else
  {
    uint64_t v4 = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 16)) {
      uint64_t v4 = 2;
    }
    *(void *)(v5 + 8) = v4;
    id v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = v6;
      id v10 = [v7 numberWithUnsignedInteger:v8];
      int v11 = 136315394;
      id v12 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s Fetched wireless splitter session, private session state: %@", (uint8_t *)&v11, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (AFSiriAudioRoute)currentAudioRoute
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__20260;
  id v10 = __Block_byref_object_dispose__20261;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke;
  v5[3] = &unk_1E592C6C0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFSiriAudioRoute *)v3;
}

void __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  if (!v3)
  {
    uint64_t v4 = AFSiriHeadphonesMonitorGetCurrentlySelectedAudioRoute([*(id *)(v2 + 80) state]);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v7, v3);
}

- (void)_recomputePrivateSessionStateAndBroadcast:(BOOL)a3
{
  if (self->_wirelessSplitterSessionActive)
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 1;
    if (self->_guestConnected) {
      unint64_t v3 = 2;
    }
  }
  self->_sessionState = v3;
  if (a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AFSiriHeadphonesMonitor__recomputePrivateSessionStateAndBroadcast___block_invoke;
    block[3] = &unk_1E592C678;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __69__AFSiriHeadphonesMonitor__recomputePrivateSessionStateAndBroadcast___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 120) copy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
    *(void *)&long long v5 = 136315650;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v11 = v8[49];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v12 = (void *)MEMORY[0x1E4F28ED0];
            uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
            id v14 = v11;
            uint64_t v15 = [v12 numberWithUnsignedInteger:v13];
            *(_DWORD *)buf = v16;
            __int16 v22 = "-[AFSiriHeadphonesMonitor _recomputePrivateSessionStateAndBroadcast:]_block_invoke";
            __int16 v23 = 2112;
            __int16 v24 = v10;
            __int16 v25 = 2112;
            uint64_t v26 = v15;
            _os_log_debug_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_DEBUG, "%s Telling %@ privateSessionState:%@", buf, 0x20u);

            uint64_t v8 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
          }
          objc_msgSend(v10, "privateAudioSessionStateDidChange:", *(void *)(*(void *)(a1 + 32) + 8), v16, (void)v17);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v6);
  }
}

- (void)_broadcastInEarDetectionStateChangesFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__broadcastInEarDetectionStateChangesFrom_to___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __71__AFSiriHeadphonesMonitor__broadcastInEarDetectionStateChangesFrom_to___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1[4] + 120) copy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 136315906;
    long long v17 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector())
        {
          id v10 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = a1[4];
            uint64_t v13 = *(void *)(v12 + 88);
            uint64_t v14 = *(void *)(v12 + 24);
            *(_DWORD *)buf = v17;
            __int16 v23 = "-[AFSiriHeadphonesMonitor _broadcastInEarDetectionStateChangesFrom:to:]_block_invoke";
            __int16 v24 = 2112;
            __int16 v25 = v9;
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            __int16 v28 = 2112;
            uint64_t v29 = v14;
            _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s Telling %@ inEarDetectionStateDidChangeForBTAddress: %@ toState:%@", buf, 0x2Au);
          }
          objc_msgSend(v9, "inEarDetectionStateDidChangeForBTAddress:toState:", *(void *)(a1[4] + 88), *(void *)(a1[4] + 24), v17, (void)v18);
        }
        if (objc_opt_respondsToSelector())
        {
          id v11 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v15 = a1[5];
            uint64_t v16 = *(void *)(a1[4] + 88);
            *(_DWORD *)buf = v17;
            __int16 v23 = "-[AFSiriHeadphonesMonitor _broadcastInEarDetectionStateChangesFrom:to:]_block_invoke";
            __int16 v24 = 2112;
            __int16 v25 = v9;
            __int16 v26 = 2112;
            uint64_t v27 = v16;
            __int16 v28 = 2112;
            uint64_t v29 = v15;
            _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s Telling %@ inEarDetectionStateDidChangeForBTAddress: %@ toState:%@", buf, 0x2Au);
          }
          objc_msgSend(v9, "inEarDetectionStateDidChangeForBTAddress:fromState:toState:", *(void *)(a1[4] + 88), a1[6], a1[5], v17);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v6);
  }
}

- (void)_broadcastRouteAndAuthenticationCapability
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AFSiriHeadphonesMonitor__broadcastRouteAndAuthenticationCapability__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __69__AFSiriHeadphonesMonitor__broadcastRouteAndAuthenticationCapability__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 120) copy];
  uint64_t v26 = a1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 144);
  id v4 = v3;
  uint64_t v5 = [(id)_broadcastRouteAndAuthenticationCapability_previousAudioRoute hash];
  if (v5 != [v4 hash])
  {
    objc_storeStrong((id *)&_broadcastRouteAndAuthenticationCapability_previousAudioRoute, v3);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v12 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v14 = *(void **)(v26 + 32);
              __int16 v22 = (void *)v14[12];
              uint64_t v23 = v14[11];
              uint64_t v19 = v14[1];
              long long v20 = (void *)MEMORY[0x1E4F28ED0];
              uint64_t v15 = v12;
              long long v21 = [v20 numberWithUnsignedInteger:v19];
              *(_DWORD *)buf = 136316162;
              v32 = "-[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability]_block_invoke";
              __int16 v33 = 2112;
              v34 = v11;
              __int16 v35 = 2112;
              v36 = v22;
              __int16 v37 = 2112;
              uint64_t v38 = v23;
              __int16 v39 = 2112;
              v40 = v21;
              _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s Telling %@ currentAudioRouteDidChange:to %@(%@) privateSessionState:%@", buf, 0x34u);
            }
            [v11 currentAudioRouteDidChange:v4];
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v13 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              __int16 v24 = (void *)MEMORY[0x1E4F28ED0];
              uint64_t v16 = v13;
              __int16 v25 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v4, "hasAuthenticationCapability"));
              long long v17 = *(void **)(*(void *)(v26 + 32) + 88);
              uint64_t v18 = *(void *)(*(void *)(v26 + 32) + 96);
              *(_DWORD *)buf = 136316162;
              v32 = "-[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability]_block_invoke";
              __int16 v33 = 2112;
              v34 = v11;
              __int16 v35 = 2112;
              v36 = v25;
              __int16 v37 = 2112;
              uint64_t v38 = v18;
              __int16 v39 = 2112;
              v40 = v17;
              _os_log_debug_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_DEBUG, "%s Telling %@ authenticationCapabilityDidChange:%@ to %@(%@)", buf, 0x34u);
            }
            objc_msgSend(v11, "authenticationCapabilityDidChange:forBTAddress:", objc_msgSend(v4, "hasAuthenticationCapability"), *(void *)(*(void *)(v26 + 32) + 88));
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v8);
    }
  }
}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AFSiriHeadphonesMonitor_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_1E592B398;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __63__AFSiriHeadphonesMonitor_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v2;
    if (v4 > 2) {
      id v6 = @"(unknown)";
    }
    else {
      id v6 = off_1E5925DC0[v4];
    }
    uint64_t v7 = v6;
    int v8 = 136315394;
    uint64_t v9 = "-[AFSiriHeadphonesMonitor deviceRingerObserver:didChangeState:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Updating ringer switch state to: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _updateAudioRouteAvailabilityAndBroadcast:1];
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke;
  v11[3] = &unk_1E592B1A8;
  id v12 = v8;
  uint64_t v13 = self;
  unint64_t v14 = a4;
  unint64_t v15 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2 != v3[8])
  {
    if (v2 != v3[9])
    {
      if (v2 == v3[7])
      {
        uint64_t v4 = *(void *)(a1 + 56);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_27;
        v21[3] = &unk_1E5927FB0;
        v21[4] = v3;
        +[AFBluetoothHeadphoneInEarDetectionState decodeFromNotifyState:v4 withCompletion:v21];
      }
      return;
    }
    id v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      __int16 v24 = 2048;
      __int16 v25 = v11;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s wireless guest connection state changed from %llu to %llu", buf, 0x20u);
      id v10 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v14 = *(void *)(a1 + 56);
      unint64_t v15 = v10;
      uint64_t v16 = [v13 numberWithUnsignedLongLong:v14];
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      __int16 v24 = 2112;
      __int16 v25 = v16;
      _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s guestConnection: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = *(void *)(a1 + 56) != 0;
LABEL_16:
    [*(id *)(a1 + 40) _recomputePrivateSessionStateAndBroadcast:1];
    return;
  }
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
    __int16 v24 = 2048;
    __int16 v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = v7;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s wireless splitter session state changed from %llu to %llu", buf, 0x20u);
    id v3 = *(void **)(a1 + 40);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v3[2] != v8)
  {
    v3[2] = v8;
    uint64_t v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      long long v17 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 16);
      uint64_t v19 = v9;
      long long v20 = [v17 numberWithUnsignedLongLong:v18];
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      __int16 v24 = 2112;
      __int16 v25 = v20;
      _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s wireless splitter session active: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 33) = 0;
    goto LABEL_16;
  }
}

void __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 104);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_2;
  v15[3] = &unk_1E592C220;
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v7;
  id v19 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_2(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 24))
  {
    uint64_t v3 = result;
    uint64_t v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(v3 + 48);
      uint64_t v6 = *(void *)(v3 + 56);
      int v7 = 136315906;
      id v8 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v1;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s In-ear detection state for %@: %@ -> %@", (uint8_t *)&v7, 0x2Au);
      uint64_t v2 = *(void *)(v3 + 40);
    }
    result = [*(id *)(v3 + 48) isEqualToString:*(void *)(v2 + 88)];
    if (result)
    {
      objc_storeStrong((id *)(*(void *)(v3 + 40) + 24), *(id *)(v3 + 32));
      return [*(id *)(v3 + 40) _broadcastInEarDetectionStateChangesFrom:*(void *)(v3 + 56) to:*(void *)(v3 + 32)];
    }
  }
  return result;
}

- (void)_settingsConnectionDidDisconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[AFSiriHeadphonesMonitor _settingsConnectionDidDisconnect]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s Settings connection: disconnected!", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  *(void *)(*(void *)(a1 + 32) + 16) = 404;
  uint64_t v5 = [[AFBluetoothHeadphoneInEarDetectionState alloc] initWithBuilder:&__block_literal_global_26_20291];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  id v8 = *(id *)(*(void *)(a1 + 32) + 144);
  if (([v8 hasAuthenticationCapability] & 1) != 0
    || [v8 availableAnnouncementRequestTypes])
  {
    [*(id *)(a1 + 32) _updateWirelessSplitterSessionInfoAndObserve];
    [*(id *)(a1 + 32) _updateInEarDetectionStateAndObserve];
  }
}

void __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsEnabled:0];
  [v2 setPrimaryEarbudSide:0];
  [v2 setPrimaryInEarStatus:0];
  [v2 setSecondaryInEarStatus:0];
}

- (id)_settingsConnection
{
  if (AFSupportsWirelessSplitter_onceToken != -1) {
    dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_235);
  }
  if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
  {
    settingsConnection = self->_settingsConnection;
    if (!settingsConnection)
    {
      uint64_t v4 = objc_alloc_init(AFSettingsConnection);
      uint64_t v5 = self->_settingsConnection;
      self->_settingsConnection = v4;

      [(AFSettingsConnection *)self->_settingsConnection _setDelegate:self];
      settingsConnection = self->_settingsConnection;
    }
    uint64_t v6 = settingsConnection;
  }
  else
  {
    uint64_t v6 = objc_alloc_init(AFSettingsConnection);
  }
  return v6;
}

- (void)_stopObservingInEarDetectionStateFromSource
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v6 = v3;
    int v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
    int v8 = 136315394;
    int v9 = "-[AFSiriHeadphonesMonitor _stopObservingInEarDetectionStateFromSource]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s Stop observing IED States for observerID: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = [(AFSiriHeadphonesMonitor *)self _settingsConnection];
  objc_msgSend(v4, "stopObservingBluetoothInEarDetectionStateForObserverID:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  btAddress = self->_btAddress;
  if (btAddress && [(NSString *)btAddress length] == 17)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__20260;
    long long v20 = __Block_byref_object_dispose__20261;
    id v21 = [(AFSiriHeadphonesMonitor *)self _settingsConnection];
    int v9 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[AFSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]";
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s Start observing IED States for %@ for observerID: %@", buf, 0x20u);
    }
    objc_msgSend((id)v17[5], "startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:", v6, -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
    uint64_t v11 = (void *)v17[5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke;
    v13[3] = &unk_1E5927F88;
    v13[4] = self;
    id v14 = v7;
    uint64_t v15 = &v16;
    [v11 getInEarDetectionStateForBTAddress:v6 withCompletion:v13];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantErrorDomain" code:1803 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke_2;
  v12[3] = &unk_1E5927F38;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__20260;
  id v14 = __Block_byref_object_dispose__20261;
  id v15 = [(AFSiriHeadphonesMonitor *)self _settingsConnection];
  [(id)v11[5] startObservingWirelessSplitterSession];
  id v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke;
  v7[3] = &unk_1E5927F60;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  [v5 getBluetoothWirelessSplitterSessionInfoWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

void __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5927F38;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_2;
  block[3] = &unk_1E592C338;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_21(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Audio route changed to: %@", (uint8_t *)&v4, 0x16u);
  }
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_audioRouteDidChange:");
  }
}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315394;
      int v4 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]_block_invoke_2";
      __int16 v5 = 2112;
      uint64_t v6 = v1;
      _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v3, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 48));
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AFSiriHeadphonesMonitor_removeDelegate___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __42__AFSiriHeadphonesMonitor_removeDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeObject:*(void *)(a1 + 40)];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AFSiriHeadphonesMonitor_addDelegate___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __39__AFSiriHeadphonesMonitor_addDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) addObject:*(void *)(a1 + 40)];
}

- (void)initializeAVSystemControllerSubscriptions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__AFSiriHeadphonesMonitor_initializeAVSystemControllerSubscriptions___block_invoke;
  v7[3] = &unk_1E592C710;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__AFSiriHeadphonesMonitor_initializeAVSystemControllerSubscriptions___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFSiriHeadphonesMonitor initializeAVSystemControllerSubscriptions:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s initializing AVSystemController's subscriptions due to: %@", buf, 0x16u);
  }
  int v3 = getAVSystemController_PickableRoutesDidChangeNotification();
  v17[0] = v3;
  id v4 = getAVSystemController_PreferredExternalRouteDidChangeNotification();
  v17[1] = v4;
  __int16 v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  id v6 = [getAVSystemControllerClass() sharedAVSystemController];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v7 = (void *)getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_ptr;
  uint64_t v16 = getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_ptr;
  if (!getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_block_invoke;
    id v19 = &unk_1E592C0B0;
    long long v20 = &v13;
    id v8 = MediaExperienceLibrary();
    id v9 = dlsym(v8, "AVSystemController_SubscribeToNotificationsAttribute");
    *(void *)(v20[1] + 24) = v9;
    getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_ptr = *(void *)(v20[1] + 24);
    uint64_t v7 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"NSString *getAVSystemController_SubscribeToNotificationsAttribute(void)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"AFSiriHeadphonesMonitor.m", 51, @"%s", dlerror());

    __break(1u);
  }
  [v6 setAttribute:v5 forKey:*v7 error:0];

  [*(id *)(a1 + 40) updateAudioRouteAvailability:*(void *)(a1 + 32)];
}

- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus
{
  id v4 = [(AFSiriHeadphonesMonitor *)self _settingsConnection];
  [v4 updateAnnounceNotificationsOnHearingAidSupportedStatus];
  [v4 barrier];
  settingsConnection = self->_settingsConnection;
  self->_settingsConnection = 0;
}

void __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_3;
  block[3] = &unk_1E592C338;
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_3(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  if (v1 != *(void **)(v2 + 24))
  {
    id v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(v2 + 88);
      uint64_t v8 = a1[6];
      int v9 = 136315906;
      id v10 = "-[AFSiriHeadphonesMonitor _updateInEarDetectionStateAndObserve]_block_invoke_3";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v1;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s In-ear detection state for %@: %@, error: %@", (uint8_t *)&v9, 0x2Au);
      uint64_t v1 = (void *)a1[4];
      uint64_t v2 = a1[5];
    }
    objc_storeStrong((id *)(v2 + 24), v1);
    id v5 = (void *)a1[5];
    id v6 = objc_opt_new();
    [v5 _broadcastInEarDetectionStateChangesFrom:v6 to:a1[4]];
  }
}

- (void)_updateWirelessSplitterSessionInfoAndObserve
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke(uint64_t a1)
{
  if (AFSupportsWirelessSplitter_onceToken != -1) {
    dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_235);
  }
  result = *(unsigned char **)(a1 + 32);
  if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_2;
    v3[3] = &unk_1E5927EE8;
    void v3[4] = result;
    return (unsigned char *)[result _fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:v3];
  }
  else
  {
    result[33] = 1;
  }
  return result;
}

void __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_3;
  block[3] = &unk_1E592C338;
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = v2;
    uint64_t v10 = [v8 state];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 136315650;
    id v13 = "-[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve]_block_invoke_3";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s Wireless splitter session state: %ld, error: %@", (uint8_t *)&v12, 0x20u);
  }
  *(void *)(*(void *)(a1 + 48) + 16) = [*(id *)(a1 + 32) state] != 1;
  int v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 16);
    id v6 = v3;
    uint64_t v7 = [v4 numberWithUnsignedLongLong:v5];
    int v12 = 136315394;
    id v13 = "-[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = (uint64_t)v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Wireless splitter session active: %@", (uint8_t *)&v12, 0x16u);
  }
  if (!*(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 33) = 1;
    [*(id *)(a1 + 48) _recomputePrivateSessionStateAndBroadcast:1];
  }
}

- (void)_fetchInitialState
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
  [(AFSiriHeadphonesMonitor *)self _updateWirelessSplitterSessionInfoAndObserve];
  [(AFSiriHeadphonesMonitor *)self _updateInEarDetectionStateAndObserve];
  if (+[AFFeatureFlags isAccessibleAnnounceEnabled])
  {
    id v4 = self->_queue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke_2;
    v5[3] = &unk_1E592C678;
    v5[4] = self;
    dispatch_async(v4, v5);
  }
}

uint64_t __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAudioRouteAvailabilityAndBroadcast:0];
}

uint64_t __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceNotificationsOnHearingAidSupportedStatus];
}

- (id)_init
{
  v44.receiver = self;
  v44.super_class = (Class)AFSiriHeadphonesMonitor;
  uint64_t v2 = [(AFSiriHeadphonesMonitor *)&v44 init];
  id v3 = v2;
  if (!v2) {
    return v3;
  }
  *(_OWORD *)(v2 + 8) = xmmword_19D0E24F0;
  id v4 = [[AFBluetoothHeadphoneInEarDetectionState alloc] initWithBuilder:&__block_literal_global_20314];
  uint64_t v5 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v4;

  dispatch_queue_t v6 = dispatch_queue_create("AFSiriHeadphonesMonitor", 0);
  uint64_t v7 = (void *)*((void *)v3 + 13);
  *((void *)v3 + 13) = v6;

  dispatch_queue_t v8 = dispatch_queue_create("AFSiriHeadphonesMonitor.BTQueue", 0);
  id v9 = (void *)*((void *)v3 + 14);
  *((void *)v3 + 14) = v8;

  uint64_t v10 = [AFNotifyObserver alloc];
  uint64_t v11 = [NSString stringWithUTF8String:"AFBluetoothPairedDeviceInfoUpdated"];
  uint64_t v12 = [(AFNotifyObserver *)v10 initWithName:v11 options:0 queue:*((void *)v3 + 13) delegate:v3];
  id v13 = (void *)*((void *)v3 + 6);
  *((void *)v3 + 6) = v12;

  __int16 v14 = [AFNotifyObserver alloc];
  uint64_t v15 = [NSString stringWithUTF8String:"AFBluetoothWirelessSplitterSessionStateChanged"];
  uint64_t v16 = [(AFNotifyObserver *)v14 initWithName:v15 options:1 queue:*((void *)v3 + 13) delegate:v3];
  uint64_t v17 = (void *)*((void *)v3 + 8);
  *((void *)v3 + 8) = v16;

  uint64_t v18 = [[AFNotifyObserver alloc] initWithName:@"com.apple.bluetooth.GuestConnected" options:1 queue:*((void *)v3 + 13) delegate:v3];
  id v19 = (void *)*((void *)v3 + 9);
  *((void *)v3 + 9) = v18;

  long long v20 = [AFNotifyObserver alloc];
  uint64_t v21 = [NSString stringWithUTF8String:"AFBluetoothInEarDetectionStateChanged"];
  uint64_t v22 = [(AFNotifyObserver *)v20 initWithName:v21 options:1 queue:*((void *)v3 + 13) delegate:v3];
  uint64_t v23 = (void *)*((void *)v3 + 7);
  *((void *)v3 + 7) = v22;

  uint64_t v24 = +[AFDeviceRingerSwitchObserver sharedObserver];
  id v25 = (void *)*((void *)v3 + 10);
  *((void *)v3 + 10) = v24;

  [*((id *)v3 + 10) addListener:v3];
  __int16 v26 = *((void *)v3 + 13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AFSiriHeadphonesMonitor__init__block_invoke_2;
  block[3] = &unk_1E592C678;
  uint64_t v27 = v3;
  id v43 = v27;
  dispatch_async(v26, block);
  uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  long long v29 = (void *)getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr;
  uint64_t v53 = getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr;
  if (!getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr)
  {
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_block_invoke;
    v48 = &unk_1E592C0B0;
    v49 = &v50;
    long long v30 = MediaExperienceLibrary();
    uint64_t v31 = dlsym(v30, "AVSystemController_ServerConnectionDiedNotification");
    *(void *)(v49[1] + 24) = v31;
    getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr = *(void *)(v49[1] + 24);
    long long v29 = (void *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (v29)
  {
    [v28 addObserver:v27 selector:sel_initializeAVSystemControllerSubscriptions_ name:*v29 object:0];

    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v33 = getAVSystemController_PickableRoutesDidChangeNotification();
    [v32 addObserver:v27 selector:sel_updateAudioRouteAvailability_ name:v33 object:0];

    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v35 = getAVSystemController_PreferredExternalRouteDidChangeNotification();
    [v34 addObserver:v27 selector:sel_updateAudioRouteAvailability_ name:v35 object:0];

    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v27 selector:sel_updateAudioRouteAvailability_ name:@"AFPreferencesDidChangeNotification" object:0];

    uint64_t v37 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v38 = (void *)v27[15];
    v27[15] = v37;

    [v27 _fetchInitialState];
    return v3;
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  v41 = [NSString stringWithUTF8String:"NSString *getAVSystemController_ServerConnectionDiedNotification(void)"];
  objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"AFSiriHeadphonesMonitor.m", 48, @"%s", dlerror());

  __break(1u);
  return result;
}

uint64_t __32__AFSiriHeadphonesMonitor__init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeAVSystemControllerSubscriptions:0];
}

void __32__AFSiriHeadphonesMonitor__init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsEnabled:0];
  [v2 setPrimaryEarbudSide:0];
  [v2 setPrimaryInEarStatus:0];
  [v2 setSecondaryInEarStatus:0];
}

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AFSiriHeadphonesMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedMonitor_onceToken_20330 != -1) {
    dispatch_once(&sharedMonitor_onceToken_20330, block);
  }
  id v2 = (void *)sharedMonitor_monitor;
  return v2;
}

void __40__AFSiriHeadphonesMonitor_sharedMonitor__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  uint64_t v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = v0;
}

@end