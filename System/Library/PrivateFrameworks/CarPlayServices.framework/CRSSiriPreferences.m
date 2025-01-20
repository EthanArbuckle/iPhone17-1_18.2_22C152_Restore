@interface CRSSiriPreferences
- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled;
- (BOOL)autoSendInCarPlayEnabled;
- (BOOL)autoSendInHeadphonesEnabled;
- (BOOL)cachedAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (BOOL)cachedAutoSendInCarPlayEnabled;
- (BOOL)cachedAutoSendInHeadphonesEnabled;
- (BOOL)cachedMainAutoSendEnabled;
- (BOOL)cachedShowAppsBehindSiriInCarPlayEnabled;
- (BOOL)mainAutoSendEnabled;
- (BOOL)showAppsBehindSiriInCarPlayEnabled;
- (CARObserverHashTable)observers;
- (CRSSiriPreferences)init;
- (OS_dispatch_queue)queue;
- (int64_t)cachedCarPlayAnnounceEnablementType;
- (int64_t)carPlayAnnounceEnablementType;
- (void)_siriPreferencesDidChange;
- (void)_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)_updateAutoSendInCarPlayEnabled:(BOOL)a3;
- (void)_updateAutoSendInHeadphonesEnabled:(BOOL)a3;
- (void)_updateCarPlayAnnounceEnablementType:(int64_t)a3;
- (void)_updateMainAutoSendEnabled:(BOOL)a3;
- (void)_updateShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)removeObserver:(id)a3;
- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setAutoSendInCarPlayEnabled:(BOOL)a3;
- (void)setAutoSendInHeadphonesEnabled:(BOOL)a3;
- (void)setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setCachedAutoSendInCarPlayEnabled:(BOOL)a3;
- (void)setCachedAutoSendInHeadphonesEnabled:(BOOL)a3;
- (void)setCachedCarPlayAnnounceEnablementType:(int64_t)a3;
- (void)setCachedMainAutoSendEnabled:(BOOL)a3;
- (void)setCachedShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
- (void)setCarPlayAnnounceEnablementType:(int64_t)a3;
- (void)setMainAutoSendEnabled:(BOOL)a3;
- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
@end

@implementation CRSSiriPreferences

- (CRSSiriPreferences)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRSSiriPreferences;
  v2 = [(CRSSiriPreferences *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CRSSiriPreferences", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc(MEMORY[0x263F30E18]);
    v6 = [(CRSSiriPreferences *)v2 queue];
    uint64_t v7 = [v5 initWithProtocol:&unk_26CDCF9D0 callbackQueue:v6];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__siriPreferencesDidChange name:*MEMORY[0x263F28318] object:0];

    [(CRSSiriPreferences *)v2 _siriPreferencesDidChange];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSSiriPreferences *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSSiriPreferences *)self observers];
  [v5 removeObserver:v4];
}

- (int64_t)carPlayAnnounceEnablementType
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CRSSiriPreferences_carPlayAnnounceEnablementType__block_invoke;
  v6[3] = &unk_264443068;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__CRSSiriPreferences_carPlayAnnounceEnablementType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedCarPlayAnnounceEnablementType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCarPlayAnnounceEnablementType:(int64_t)a3
{
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setAnnounceNotificationsInCarPlayType:a3];
}

- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__CRSSiriPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke;
  v5[3] = &unk_264443068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __71__CRSSiriPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedAnnounceNotificationsInCarPlayTemporarilyDisabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSendInCarPlayEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__CRSSiriPreferences_autoSendInCarPlayEnabled__block_invoke;
  v5[3] = &unk_264443068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __46__CRSSiriPreferences_autoSendInCarPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedAutoSendInCarPlayEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSendInHeadphonesEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CRSSiriPreferences_autoSendInHeadphonesEnabled__block_invoke;
  v5[3] = &unk_264443068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__CRSSiriPreferences_autoSendInHeadphonesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedAutoSendInHeadphonesEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)mainAutoSendEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CRSSiriPreferences_mainAutoSendEnabled__block_invoke;
  v5[3] = &unk_264443068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__CRSSiriPreferences_mainAutoSendEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedMainAutoSendEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)showAppsBehindSiriInCarPlayEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CRSSiriPreferences *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CRSSiriPreferences_showAppsBehindSiriInCarPlayEnabled__block_invoke;
  v5[3] = &unk_264443068;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __56__CRSSiriPreferences_showAppsBehindSiriInCarPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cachedShowAppsBehindSiriInCarPlayEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setAnnounceNotificationsInCarPlayTemporarilyDisabled:v3];
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  [v2 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

- (void)_siriPreferencesDidChange
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke;
  v18[3] = &unk_264443090;
  objc_copyWeak(&v19, &location);
  [v2 getAnnounceNotificationsInCarPlayTypeWithCompletion:v18];

  BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_2;
  v16[3] = &unk_2644430B8;
  objc_copyWeak(&v17, &location);
  [v3 getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v16];

  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_3;
  v14[3] = &unk_2644430B8;
  objc_copyWeak(&v15, &location);
  [v4 getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:v14];

  id v5 = [MEMORY[0x263F285A0] sharedPreferences];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_4;
  v12[3] = &unk_2644430B8;
  objc_copyWeak(&v13, &location);
  [v5 getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:v12];

  uint64_t v6 = [MEMORY[0x263F285A0] sharedPreferences];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_5;
  v10[3] = &unk_2644430B8;
  objc_copyWeak(&v11, &location);
  [v6 getMessageWithoutConfirmationEnabledWithCompletion:v10];

  uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_6;
  v8[3] = &unk_2644430B8;
  objc_copyWeak(&v9, &location);
  [v7 getShowAppsBehindSiriInCarPlayEnabledWithCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCarPlayAnnounceEnablementType:a2];
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAnnounceNotificationsInCarPlayTemporarilyDisabled:a2];
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAutoSendInCarPlayEnabled:a2];
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAutoSendInHeadphonesEnabled:a2];
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMainAutoSendEnabled:a2];
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateShowAppsBehindSiriInCarPlayEnabled:a2];
}

- (void)_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__CRSSiriPreferences__updateAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke;
  v6[3] = &unk_2644430E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __79__CRSSiriPreferences__updateAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cachedAnnounceNotificationsInCarPlayTemporarilyDisabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:v3 != 0];
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 preferences:*(void *)(a1 + 32) announceNotificationsInCarPlayTemporarilyDisabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_updateCarPlayAnnounceEnablementType:(int64_t)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__CRSSiriPreferences__updateCarPlayAnnounceEnablementType___block_invoke;
  v6[3] = &unk_264443108;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __59__CRSSiriPreferences__updateCarPlayAnnounceEnablementType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) cachedCarPlayAnnounceEnablementType] != *(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedCarPlayAnnounceEnablementType:");
    id v2 = [*(id *)(a1 + 32) observers];
    [v2 preferences:*(void *)(a1 + 32) carPlayAnnounceEnablementTypeChanged:*(void *)(a1 + 40)];
  }
}

- (void)_updateAutoSendInCarPlayEnabled:(BOOL)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CRSSiriPreferences__updateAutoSendInCarPlayEnabled___block_invoke;
  v6[3] = &unk_2644430E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __54__CRSSiriPreferences__updateAutoSendInCarPlayEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cachedAutoSendInCarPlayEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setCachedAutoSendInCarPlayEnabled:v3 != 0];
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 preferences:*(void *)(a1 + 32) autoSendInCarPlayEnabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_updateAutoSendInHeadphonesEnabled:(BOOL)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CRSSiriPreferences__updateAutoSendInHeadphonesEnabled___block_invoke;
  v6[3] = &unk_2644430E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __57__CRSSiriPreferences__updateAutoSendInHeadphonesEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cachedAutoSendInHeadphonesEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setCachedAutoSendInHeadphonesEnabled:v3 != 0];
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 preferences:*(void *)(a1 + 32) autoSendInHeadphonesEnabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_updateMainAutoSendEnabled:(BOOL)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CRSSiriPreferences__updateMainAutoSendEnabled___block_invoke;
  v6[3] = &unk_2644430E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __49__CRSSiriPreferences__updateMainAutoSendEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cachedMainAutoSendEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setCachedMainAutoSendEnabled:v3 != 0];
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 preferences:*(void *)(a1 + 32) mainAutoSendEnabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_updateShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  id v5 = [(CRSSiriPreferences *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CRSSiriPreferences__updateShowAppsBehindSiriInCarPlayEnabled___block_invoke;
  v6[3] = &unk_2644430E0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __64__CRSSiriPreferences__updateShowAppsBehindSiriInCarPlayEnabled___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cachedShowAppsBehindSiriInCarPlayEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setCachedShowAppsBehindSiriInCarPlayEnabled:v3 != 0];
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 preferences:*(void *)(a1 + 32) showAppsBehindSiriInCarPlayEnabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setAutoSendInCarPlayEnabled:(BOOL)a3
{
  self->_autoSendInCarPlayEnabled = a3;
}

- (void)setAutoSendInHeadphonesEnabled:(BOOL)a3
{
  self->_autoSendInHeadphonesEnabled = a3;
}

- (void)setMainAutoSendEnabled:(BOOL)a3
{
  self->_mainAutoSendEnabled = a3;
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  self->_showAppsBehindSiriInCarPlayEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)cachedCarPlayAnnounceEnablementType
{
  return self->_cachedCarPlayAnnounceEnablementType;
}

- (void)setCachedCarPlayAnnounceEnablementType:(int64_t)a3
{
  self->_cachedCarPlayAnnounceEnablementType = a3;
}

- (BOOL)cachedAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  return self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled;
}

- (void)setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled = a3;
}

- (BOOL)cachedAutoSendInCarPlayEnabled
{
  return self->_cachedAutoSendInCarPlayEnabled;
}

- (void)setCachedAutoSendInCarPlayEnabled:(BOOL)a3
{
  self->_cachedAutoSendInCarPlayEnabled = a3;
}

- (BOOL)cachedAutoSendInHeadphonesEnabled
{
  return self->_cachedAutoSendInHeadphonesEnabled;
}

- (void)setCachedAutoSendInHeadphonesEnabled:(BOOL)a3
{
  self->_cachedAutoSendInHeadphonesEnabled = a3;
}

- (BOOL)cachedMainAutoSendEnabled
{
  return self->_cachedMainAutoSendEnabled;
}

- (void)setCachedMainAutoSendEnabled:(BOOL)a3
{
  self->_cachedMainAutoSendEnabled = a3;
}

- (BOOL)cachedShowAppsBehindSiriInCarPlayEnabled
{
  return self->_cachedShowAppsBehindSiriInCarPlayEnabled;
}

- (void)setCachedShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  self->_cachedShowAppsBehindSiriInCarPlayEnabled = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end