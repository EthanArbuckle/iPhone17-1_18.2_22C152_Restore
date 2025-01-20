@interface AFHeadphonesAnnouncementRequestCapabilityProvider
+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (id)provider;
+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (int64_t)platform;
- (AFSiriAudioRoute)currentAnnouncementRoute;
- (id)_getCurrentAnnouncementRoute;
- (id)_headphonesMonitor;
- (id)_init;
- (id)_settingsConnection;
- (id)currentlyRoutedHeadphonesBTAddress;
- (id)currentlyRoutedHeadphonesProductID;
- (unint64_t)lastKnownEligibleAnnouncementRequestTypes;
- (void)_fetchEligibleAnnouncementRequestTypesAndNotifyObservers;
- (void)_fetchInitialState;
- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3;
- (void)_notifyObserversOfEligibleAnnouncementRequestTypes:(unint64_t)a3;
- (void)_settingsConnectionDidDisconnect;
- (void)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)currentAudioRouteDidChange:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesAndNotifyObservers:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchLocalVoiceAssetAvailabilityWithCompletion:(id)a3;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)notifyObserversOfAvailableAnnouncementRequestTypes;
- (void)privateAudioSessionStateDidChange:(unint64_t)a3;
- (void)setCurrentAnnouncementRoute:(id)a3;
@end

@implementation AFHeadphonesAnnouncementRequestCapabilityProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnouncementRoute, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_forcedUpdateObserver, 0);
  objc_storeStrong((id *)&self->_pairedInfoChangeObserver, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

- (void)setCurrentAnnouncementRoute:(id)a3
{
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v2 + 40);
    v3 = *(NSObject **)(v2 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_15;
    v6[3] = &unk_1E592C6E8;
    v6[4] = v2;
    id v7 = *(id *)(a1 + 40);
    dispatch_group_notify(v3, v4, v6);
  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:]_block_invoke";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Announcements not supported on this device", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_15(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E592C6E8;
  uint64_t v2 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v2;
  v3 = (void (**)(void))MEMORY[0x19F3A50D0](v10);
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5[7])
  {
    id v7 = v5[5];
    id v6 = v5[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_17;
    block[3] = &unk_1E592C360;
    v9 = v3;
    dispatch_group_notify(v6, v7, block);
  }
  else
  {
    v3[2](v3);
  }
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _headphonesMonitor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_3;
  v4[3] = &unk_1E5926880;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchPrivateSessionStateWithCompletion:v4];
}

uint64_t __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_4;
  v9[3] = &unk_1E5926858;
  uint64_t v12 = a2;
  v9[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, v9);
}

uint64_t __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_4(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1[4] + 56);
    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = a1[7];
    id v8 = v2;
    v9 = [v6 numberWithUnsignedInteger:v7];
    int v10 = 136315650;
    id v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:]_block_invoke_4";
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Available announcement requests: %lu, private session state: %@", (uint8_t *)&v10, 0x20u);
  }
  if (a1[5] || a1[7] != 1) {
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else {
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v3();
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MGGetBoolAnswer())
  {
    uint64_t v5 = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    dispatch_group_enter(v5);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke;
    block[3] = &unk_1E5928708;
    void block[4] = self;
    p_long long buf = &buf;
    uint64_t v7 = v5;
    v18 = v7;
    dispatch_async(queue, block);
    dispatch_group_enter(v7);
    id v8 = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_4;
    v15[3] = &unk_1E592C710;
    v15[4] = self;
    uint64_t v16 = v7;
    v9 = v7;
    dispatch_async(v8, v15);
    int v10 = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_7;
    v12[3] = &unk_1E5928698;
    __int16 v14 = &buf;
    v12[4] = self;
    id v13 = v4;
    dispatch_group_notify(v9, v10, v12);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementReque"
                                      "stTypesWithCompletion:]";
      _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s Announcements not supported on device", (uint8_t *)&buf, 0xCu);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5926808;
  v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _fetchPairedBluetoothDevicesFromSourceWithCompletion:v4];
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_5;
  v2[3] = &unk_1E5926830;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 fetchLocalVoiceAssetAvailabilityWithCompletion:v2];
}

uint64_t __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_7(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 24);
    int v7 = *(unsigned __int8 *)(a1[4] + 8);
    int v8 = 136315650;
    v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesWithCompletion:]_block_invoke_7";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s Eligible Announcement Requests: %lu, Local Voice Asset Available: %d", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t v3 = a1[4];
  if (*(unsigned char *)(v3 + 8)) {
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(v3 + 64) = v4;
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_6;
  block[3] = &unk_1E5927270;
  void block[4] = v2;
  char v6 = a2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_6(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 48);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_3;
  block[3] = &unk_1E5928708;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "supportsSpokenNotification", (void)v8)) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 1uLL;
        }
        if ([v7 supportsAnnounceCall]) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 2uLL;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequests;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AFHeadphonesAnnouncementRequestCapabilityProvider_addDelegate___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __65__AFHeadphonesAnnouncementRequestCapabilityProvider_addDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)_settingsConnectionDidDisconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__AFHeadphonesAnnouncementRequestCapabilityProvider__settingsConnectionDidDisconnect__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __85__AFHeadphonesAnnouncementRequestCapabilityProvider__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _settingsConnectionDidDisconnect]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
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
      id v4 = objc_alloc_init(AFSettingsConnection);
      int v5 = self->_settingsConnection;
      self->_settingsConnection = v4;

      [(AFSettingsConnection *)self->_settingsConnection _setDelegate:self];
      settingsConnection = self->_settingsConnection;
    }
    id v6 = settingsConnection;
  }
  else
  {
    id v6 = objc_alloc_init(AFSettingsConnection);
  }
  return v6;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = (AFNotifyObserver *)a3;
  id v6 = v5;
  if (self->_forcedUpdateObserver == v5)
  {
    if (!self->_lastKnownEligibleAnnouncementRequests)
    {
      uint64_t v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long v9 = 136315138;
        *(void *)&v9[4] = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserver:didReceiveNotificationWithToken:]";
        id v8 = "%s forced update observer re-fetching eligibility";
        goto LABEL_10;
      }
LABEL_7:
      -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesAndNotifyObservers:](self, "fetchEligibleAnnouncementRequestTypesAndNotifyObservers:", 0, *(_OWORD *)v9);
    }
  }
  else if (self->_pairedInfoChangeObserver == v5)
  {
    uint64_t v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long v9 = 136315138;
      *(void *)&v9[4] = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserver:didReceiveNotificationWithToken:]";
      id v8 = "%s re-fetching eligibility after assistantd is ready";
LABEL_10:
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
}

- (void)currentAudioRouteDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v5;
    id v8 = [a3 description];
    *(_DWORD *)long long buf = 136315394;
    long long v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider currentAudioRouteDidChange:]";
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s current audio route did change: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAudioRouteDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAudioRouteAvailabilityAndBroadcast:1];
}

- (void)privateAudioSessionStateDidChange:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = v5;
    id v8 = [v6 numberWithUnsignedInteger:a3];
    *(_DWORD *)long long buf = 136315394;
    __int16 v12 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider privateAudioSessionStateDidChange:]";
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s headphonesPrivateSession: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AFHeadphonesAnnouncementRequestCapabilityProvider_privateAudioSessionStateDidChange___block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__AFHeadphonesAnnouncementRequestCapabilityProvider_privateAudioSessionStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyObserversOfAvailableAnnouncementRequestTypes];
}

- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__11472;
  uint64_t v14 = __Block_byref_object_dispose__11473;
  id v15 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self _settingsConnection];
  int v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke;
  v7[3] = &unk_1E59267E0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  long long v9 = &v10;
  [v5 getPairedBluetoothDeviceInfoArrayWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke_2;
  block[3] = &unk_1E5928698;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)_headphonesMonitor
{
  return +[AFSiriHeadphonesMonitor sharedMonitor];
}

- (void)_notifyObserversOfEligibleAnnouncementRequestTypes:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    v18 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _notifyObserversOfEligibleAnnouncementRequestTypes:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Notifying observers, eligible announcement requests changed: %lu", buf, 0x16u);
  }
  id v6 = (void *)[(NSHashTable *)self->_delegates copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "provider:eligibleAnnouncementRequestTypesChanged:", self, a3, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_fetchEligibleAnnouncementRequestTypesAndNotifyObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchEligibleAnnouncementRequestTypesAndNotifyObservers]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  unint64_t lastKnownEligibleAnnouncementRequests = self->_lastKnownEligibleAnnouncementRequests;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke;
  v5[3] = &unk_1E59267B8;
  v5[4] = self;
  v5[5] = lastKnownEligibleAnnouncementRequests;
  [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self fetchEligibleAnnouncementRequestTypesWithCompletion:v5];
}

void __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke_2;
  block[3] = &unk_1E5929438;
  void block[5] = *(void *)(a1 + 40);
  block[6] = a2;
  void block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke_2(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 48);
  if (v2 != v1)
  {
    uint64_t v3 = result;
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315650;
      id v6 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchEligibleAnnouncementRequestTypesAndNotifyObservers]_block_invoke_2";
      __int16 v7 = 2048;
      uint64_t v8 = v2;
      __int16 v9 = 2048;
      uint64_t v10 = v1;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s previous announcement request eligibility: %lu, now updating to %lu", (uint8_t *)&v5, 0x20u);
      uint64_t v1 = *(void *)(v3 + 48);
    }
    return [*(id *)(v3 + 32) _notifyObserversOfEligibleAnnouncementRequestTypes:v1];
  }
  return result;
}

- (void)fetchEligibleAnnouncementRequestTypesAndNotifyObservers:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesAndNotifyObservers:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesAndNotifyObservers___block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __109__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesAndNotifyObservers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchEligibleAnnouncementRequestTypesAndNotifyObservers];
}

- (void)notifyObserversOfAvailableAnnouncementRequestTypes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke;
  v2[3] = &unk_1E592B158;
  v2[4] = self;
  [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self fetchAvailableAnnouncementRequestTypesWithCompletion:v2];
}

void __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke_2;
  v4[3] = &unk_1E592B398;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v16 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserversOfAvailableAnnouncementRequestTypes]_block_invoke_2";
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s Notifying observers of available announcement requests: %lu", buf, 0x16u);
  }
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "provider:availableAnnouncementRequestTypesChanged:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self _getCurrentAnnouncementRoute];
  [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self setCurrentAnnouncementRoute:v5];
  uint64_t v6 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v6;
    uint64_t v9 = [v5 availableAnnouncementRequestTypes];
    unint64_t lastKnownAvailableAnnouncementRequests = self->_lastKnownAvailableAnnouncementRequests;
    unint64_t v11 = [v5 announcePlatformForRoute];
    if (v11 > 4) {
      long long v12 = @"(unknown)";
    }
    else {
      long long v12 = off_1E592A030[v11];
    }
    uint64_t v18 = v12;
    int v20 = 136315906;
    uint64_t v21 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    __int16 v24 = 2048;
    unint64_t v25 = lastKnownAvailableAnnouncementRequests;
    __int16 v26 = 2112;
    v27 = v18;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Available route capabilities: %lu, last known availability: %lu announcePlatformForRoute: %@", (uint8_t *)&v20, 0x2Au);
  }
  if ([v5 availableAnnouncementRequestTypes] != self->_lastKnownAvailableAnnouncementRequests)
  {
    uint64_t v7 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      long long v13 = v7;
      uint64_t v14 = [v5 availableAnnouncementRequestTypes];
      long long v15 = [v5 avscRouteDescription];
      unint64_t v16 = [v5 announcePlatformForRoute];
      if (v16 > 4) {
        __int16 v17 = @"(unknown)";
      }
      else {
        __int16 v17 = off_1E592A030[v16];
      }
      uint64_t v19 = v17;
      int v20 = 136315906;
      uint64_t v21 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)v15;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s updating available route capabilities: %lu for routeDescription: %@ announcePlatformForRoute: %@", (uint8_t *)&v20, 0x2Au);
    }
    self->_unint64_t lastKnownAvailableAnnouncementRequests = [v5 availableAnnouncementRequestTypes];
    if (v3) {
      [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self notifyObserversOfAvailableAnnouncementRequestTypes];
    }
  }
}

- (id)_getCurrentAnnouncementRoute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self _headphonesMonitor];
  BOOL v3 = [v2 currentAudioRoute];

  if ([v3 availableAnnouncementRequestTypes])
  {
    id v4 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = v4;
      uint64_t v8 = [v3 availableAnnouncementRequestTypes];
      uint64_t v9 = [v3 avscRouteDescription];
      int v10 = 136315650;
      unint64_t v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute]";
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      long long v15 = v9;
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s capabilities: %lu for routeDescription: %@", (uint8_t *)&v10, 0x20u);
    }
    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)currentlyRoutedHeadphonesBTAddress
{
  uint64_t v2 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self currentAnnouncementRoute];
  BOOL v3 = [v2 btAddress];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)currentlyRoutedHeadphonesProductID
{
  uint64_t v2 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self currentAnnouncementRoute];
  BOOL v3 = [v2 productID];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (AFSiriAudioRoute)currentAnnouncementRoute
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__11472;
  uint64_t v16 = __Block_byref_object_dispose__11473;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke;
  block[3] = &unk_1E592C6C0;
  void block[4] = self;
  void block[5] = &v12;
  dispatch_sync(queue, block);
  id v4 = (void *)v13[5];
  if (!v4)
  {
    uint64_t v5 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)self _getCurrentAnnouncementRoute];
    uint64_t v6 = (void *)v13[5];
    v13[5] = v5;

    uint64_t v7 = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke_2;
    v10[3] = &unk_1E592C6C0;
    v10[4] = self;
    void v10[5] = &v12;
    dispatch_async(v7, v10);
    id v4 = (void *)v13[5];
  }
  id v8 = v4;
  _Block_object_dispose(&v12, 8);

  return (AFSiriAudioRoute *)v8;
}

void __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v1);
  }
}

void __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke_2(uint64_t a1)
{
}

- (void)fetchLocalVoiceAssetAvailabilityWithCompletion:(id)a3
{
}

- (void)_fetchInitialState
{
  if (MGGetBoolAnswer())
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchInitialState__block_invoke;
    block[3] = &unk_1E592C678;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __71__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchInitialState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAudioRouteAvailabilityAndBroadcast:0];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  dispatch_group_leave(v2);
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)AFHeadphonesAnnouncementRequestCapabilityProvider;
  uint64_t v2 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)&v28 init];
  if (!v2) {
    return v2;
  }
  BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("AFHeadphonesAnnouncementRequestCapabilityProvider", v3);

  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  dispatch_group_t v6 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v6;

  id v8 = [(AFHeadphonesAnnouncementRequestCapabilityProvider *)v2 _headphonesMonitor];
  [v8 addDelegate:v2];

  uint64_t v9 = [AFNotifyObserver alloc];
  int v10 = [NSString stringWithUTF8String:"AFBluetoothPairedDeviceInfoUpdated"];
  uint64_t v11 = [(AFNotifyObserver *)v9 initWithName:v10 options:0 queue:v2->_queue delegate:v2];
  pairedInfoChangeObserver = v2->_pairedInfoChangeObserver;
  v2->_pairedInfoChangeObserver = (AFNotifyObserver *)v11;

  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v14 = (void *)getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
  uint64_t v37 = getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
  if (!getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getBluetoothPairedStatusChangedNotificationSymbolLoc_block_invoke;
    v32 = &unk_1E592C0B0;
    v33 = &v34;
    long long v15 = BluetoothManagerLibrary();
    uint64_t v16 = dlsym(v15, "BluetoothPairedStatusChangedNotification");
    *(void *)(v33[1] + 24) = v16;
    getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr = *(void *)(v33[1] + 24);
    uint64_t v14 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (v14)
  {
    [v13 addObserver:v2 selector:sel_fetchEligibleAnnouncementRequestTypesAndNotifyObservers_ name:*v14 object:0];

    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v18 = (void *)getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr;
    uint64_t v37 = getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr;
    if (!getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr)
    {
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __getBluetoothFirstDeviceUnlockCompletedSymbolLoc_block_invoke;
      v32 = &unk_1E592C0B0;
      v33 = &v34;
      uint64_t v19 = BluetoothManagerLibrary();
      int v20 = dlsym(v19, "BluetoothFirstDeviceUnlockCompleted");
      *(void *)(v33[1] + 24) = v20;
      getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr = *(void *)(v33[1] + 24);
      uint64_t v18 = (void *)v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v18)
    {
      [v17 addObserver:v2 selector:sel_fetchEligibleAnnouncementRequestTypesAndNotifyObservers_ name:*v18 object:0];

      uint64_t v21 = [[AFNotifyObserver alloc] initWithName:@"AFSiriUserNotificationRequestCapabilityForceUpdate" options:0 queue:v2->_queue delegate:v2];
      forcedUpdateObserver = v2->_forcedUpdateObserver;
      v2->_forcedUpdateObserver = v21;

      uint64_t v23 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      delegates = v2->_delegates;
      v2->_delegates = (NSHashTable *)v23;

      [(AFHeadphonesAnnouncementRequestCapabilityProvider *)v2 _fetchInitialState];
      return v2;
    }
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"NSString *getBluetoothFirstDeviceUnlockCompleted(void)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 54, @"%s", dlerror());
  }
  else
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"NSString *getBluetoothPairedStatusChangedNotification(void)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 53, @"%s", dlerror());
  }

  __break(1u);
  return result;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 9)
  {
LABEL_4:
    BOOL v3 = 0;
    goto LABEL_5;
  }
  switch(a3)
  {
    case 1:
      uint64_t v5 = getINSearchForMessagesIntentIdentifier();
      v31 = v5;
      uint64_t v24 = 0;
      unint64_t v25 = &v24;
      uint64_t v26 = 0x2020000000;
      dispatch_group_t v6 = (id *)getINSendMessageIntentIdentifierSymbolLoc_ptr;
      uint64_t v27 = getINSendMessageIntentIdentifierSymbolLoc_ptr;
      if (!getINSendMessageIntentIdentifierSymbolLoc_ptr)
      {
        uint64_t v7 = IntentsLibrary();
        v25[3] = (uint64_t)dlsym(v7, "INSendMessageIntentIdentifier");
        getINSendMessageIntentIdentifierSymbolLoc_ptr = v25[3];
        dispatch_group_t v6 = (id *)v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (v6)
      {
        id v32 = *v6;
        id v8 = (void *)MEMORY[0x1E4F1C978];
        id v9 = v32;
        BOOL v3 = [v8 arrayWithObjects:&v31 count:2];

        goto LABEL_5;
      }
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"NSString *getINSendMessageIntentIdentifier(void)"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 34, @"%s", dlerror());

      goto LABEL_23;
    case 2:
    case 3:
    case 5:
    case 6:
      BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_5;
    case 4:
      int v10 = getINSearchForNotebookItemsIntentIdentifier();
      uint64_t v30 = v10;
      BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

      goto LABEL_5;
    case 7:
      uint64_t v24 = 0;
      unint64_t v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v11 = (id *)getINAnswerCallIntentIdentifierSymbolLoc_ptr;
      uint64_t v27 = getINAnswerCallIntentIdentifierSymbolLoc_ptr;
      if (!getINAnswerCallIntentIdentifierSymbolLoc_ptr)
      {
        uint64_t v12 = IntentsLibrary();
        v25[3] = (uint64_t)dlsym(v12, "INAnswerCallIntentIdentifier");
        getINAnswerCallIntentIdentifierSymbolLoc_ptr = v25[3];
        uint64_t v11 = (id *)v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (!v11)
      {
        int v20 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"NSString *getINAnswerCallIntentIdentifier(void)"];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 39, @"%s", dlerror());

        goto LABEL_23;
      }
      id v13 = *v11;
      id v28 = v13;
      uint64_t v24 = 0;
      unint64_t v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v14 = (id *)getINHangUpCallIntentIdentifierSymbolLoc_ptr;
      uint64_t v27 = getINHangUpCallIntentIdentifierSymbolLoc_ptr;
      if (!getINHangUpCallIntentIdentifierSymbolLoc_ptr)
      {
        long long v15 = IntentsLibrary();
        v25[3] = (uint64_t)dlsym(v15, "INHangUpCallIntentIdentifier");
        getINHangUpCallIntentIdentifierSymbolLoc_ptr = v25[3];
        uint64_t v14 = (id *)v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (!v14)
      {
        __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = [NSString stringWithUTF8String:"NSString *getINHangUpCallIntentIdentifier(void)"];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 40, @"%s", dlerror());

LABEL_23:
        __break(1u);
      }
      id v29 = *v14;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
      id v17 = v29;
      BOOL v3 = [v16 arrayWithObjects:&v28 count:2];

LABEL_5:
      return v3;
    default:
      goto LABEL_4;
  }
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 9)
  {
LABEL_4:
    dispatch_queue_t v4 = 0;
    goto LABEL_5;
  }
  switch(a3)
  {
    case 1:
      BOOL v3 = getINSearchForMessagesIntentIdentifier();
      v33[0] = v3;
      dispatch_queue_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

      goto LABEL_5;
    case 2:
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2020000000;
      dispatch_group_t v6 = (id *)getINReadAnnouncementIntentIdentifierSymbolLoc_ptr;
      uint64_t v28 = getINReadAnnouncementIntentIdentifierSymbolLoc_ptr;
      if (!getINReadAnnouncementIntentIdentifierSymbolLoc_ptr)
      {
        uint64_t v7 = IntentsLibrary();
        v26[3] = (uint64_t)dlsym(v7, "INReadAnnouncementIntentIdentifier");
        getINReadAnnouncementIntentIdentifierSymbolLoc_ptr = v26[3];
        dispatch_group_t v6 = (id *)v26[3];
      }
      _Block_object_dispose(&v25, 8);
      if (v6)
      {
        id v32 = *v6;
        id v8 = (void *)MEMORY[0x1E4F1C978];
        id v9 = v32;
        dispatch_queue_t v4 = [v8 arrayWithObjects:&v32 count:1];

        goto LABEL_5;
      }
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      int v20 = [NSString stringWithUTF8String:"NSString *getINReadAnnouncementIntentIdentifier(void)"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 35, @"%s", dlerror());

      goto LABEL_25;
    case 3:
      dispatch_queue_t v4 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_5;
    case 4:
      int v10 = getINSearchForNotebookItemsIntentIdentifier();
      v31 = v10;
      dispatch_queue_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];

      goto LABEL_5;
    case 5:
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v11 = (id *)getINPlayVoicemailIntentIdentifierSymbolLoc_ptr;
      uint64_t v28 = getINPlayVoicemailIntentIdentifierSymbolLoc_ptr;
      if (!getINPlayVoicemailIntentIdentifierSymbolLoc_ptr)
      {
        uint64_t v12 = IntentsLibrary();
        v26[3] = (uint64_t)dlsym(v12, "INPlayVoicemailIntentIdentifier");
        getINPlayVoicemailIntentIdentifierSymbolLoc_ptr = v26[3];
        uint64_t v11 = (id *)v26[3];
      }
      _Block_object_dispose(&v25, 8);
      if (v11)
      {
        id v30 = *v11;
        id v13 = (void *)MEMORY[0x1E4F1C978];
        id v14 = v30;
        dispatch_queue_t v4 = [v13 arrayWithObjects:&v30 count:1];

        goto LABEL_5;
      }
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v22 = [NSString stringWithUTF8String:"NSString *getINPlayVoicemailIntentIdentifier(void)"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 37, @"%s", dlerror());

      goto LABEL_25;
    case 6:
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2020000000;
      long long v15 = (id *)getINJoinCallIntentIdentifierSymbolLoc_ptr;
      uint64_t v28 = getINJoinCallIntentIdentifierSymbolLoc_ptr;
      if (!getINJoinCallIntentIdentifierSymbolLoc_ptr)
      {
        uint64_t v16 = IntentsLibrary();
        v26[3] = (uint64_t)dlsym(v16, "INJoinCallIntentIdentifier");
        getINJoinCallIntentIdentifierSymbolLoc_ptr = v26[3];
        long long v15 = (id *)v26[3];
      }
      _Block_object_dispose(&v25, 8);
      if (!v15)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v24 = [NSString stringWithUTF8String:"NSString *getINJoinCallIntentIdentifier(void)"];
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"AFHeadphonesAnnouncementRequestCapabilityProvider.m", 38, @"%s", dlerror());

LABEL_25:
        __break(1u);
      }
      id v29 = *v15;
      id v17 = (void *)MEMORY[0x1E4F1C978];
      id v18 = v29;
      dispatch_queue_t v4 = [v17 arrayWithObjects:&v29 count:1];

LABEL_5:
      return v4;
    default:
      goto LABEL_4;
  }
}

+ (int64_t)platform
{
  return 1;
}

+ (id)provider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AFHeadphonesAnnouncementRequestCapabilityProvider_provider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (provider_onceToken != -1) {
    dispatch_once(&provider_onceToken, block);
  }
  uint64_t v2 = (void *)provider_provider;
  return v2;
}

void __61__AFHeadphonesAnnouncementRequestCapabilityProvider_provider__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  uint64_t v1 = (void *)provider_provider;
  provider_provider = v0;
}

@end