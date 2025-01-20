@interface AFHomeAnnouncementObserver
- (AFHomeAnnouncementObserver)init;
- (AFHomeAnnouncementObserver)initWithInstanceContext:(id)a3;
- (id)_localPlaybackSession:(BOOL)a3;
- (void)_beginGrouping;
- (void)_endGrouping;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_fetchStateAndLastPlayedAnnouncementForReason:(id)a3 completion:(id)a4;
- (void)_handleNotifyStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)_invalidateLocalPlaybackSession;
- (void)_setUp;
- (void)_tearDown;
- (void)_updateLastPlayedAnnouncement:(id)a3;
- (void)_updateSnapshot:(id)a3;
- (void)_updateState:(unint64_t)a3;
- (void)addListener:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)getSnapshotWithCompletion:(id)a3;
- (void)getStateWithCompletion:(id)a3;
- (void)invalidate;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)removeListener:(id)a3;
@end

@implementation AFHomeAnnouncementObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, 0);
  objc_storeStrong((id *)&self->_snapshotGroup, 0);
  objc_storeStrong((id *)&self->_localPlaybackSession, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_listeners;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_endGrouping
{
  int64_t groupingDepth = self->_groupingDepth;
  if (groupingDepth == 1)
  {
    v4 = [[AFHomeAnnouncementSnapshot alloc] initWithState:self->_state lastPlayedAnnouncement:self->_lastPlayedAnnouncement];
    [(AFHomeAnnouncementObserver *)self _updateSnapshot:v4];

    int64_t groupingDepth = self->_groupingDepth;
  }
  BOOL v5 = groupingDepth < 1;
  int64_t v6 = groupingDepth - 1;
  if (!v5)
  {
    self->_int64_t groupingDepth = v6;
    snapshotGroup = self->_snapshotGroup;
    dispatch_group_leave(snapshotGroup);
  }
}

- (void)_beginGrouping
{
}

- (void)_updateSnapshot:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (AFHomeAnnouncementSnapshot *)a3;
  snapshot = self->_snapshot;
  if (snapshot != v4 && ![(AFHomeAnnouncementSnapshot *)snapshot isEqual:v4])
  {
    int64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = self->_snapshot;
      *(_DWORD *)buf = 136315650;
      v18 = "-[AFHomeAnnouncementObserver _updateSnapshot:]";
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s snapshot: %@ -> %@", buf, 0x20u);
    }
    uint64_t v8 = self->_snapshot;
    uint64_t v9 = v4;
    long long v10 = (AFHomeAnnouncementSnapshot *)[(AFHomeAnnouncementSnapshot *)v9 copy];
    long long v11 = self->_snapshot;
    self->_snapshot = v10;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__AFHomeAnnouncementObserver__updateSnapshot___block_invoke;
    v14[3] = &unk_1E592B6E8;
    v14[4] = self;
    uint64_t v15 = v8;
    v16 = v9;
    long long v12 = v9;
    long long v13 = v8;
    [(AFHomeAnnouncementObserver *)self _enumerateListenersUsingBlock:v14];
  }
}

uint64_t __46__AFHomeAnnouncementObserver__updateSnapshot___block_invoke(void *a1, void *a2)
{
  return [a2 homeAnnouncementObserver:a1[4] snapshotDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)_updateLastPlayedAnnouncement:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (AFHomeAnnouncement *)a3;
  lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
  if (lastPlayedAnnouncement != v4 && ![(AFHomeAnnouncement *)lastPlayedAnnouncement isEqual:v4])
  {
    [(AFHomeAnnouncementObserver *)self _beginGrouping];
    int64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = self->_lastPlayedAnnouncement;
      int v10 = 136315650;
      long long v11 = "-[AFHomeAnnouncementObserver _updateLastPlayedAnnouncement:]";
      __int16 v12 = 2112;
      long long v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s lastPlayedAnnouncement: %@ -> %@", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v8 = (AFHomeAnnouncement *)[(AFHomeAnnouncement *)v4 copy];
    uint64_t v9 = self->_lastPlayedAnnouncement;
    self->_lastPlayedAnnouncement = v8;

    [(AFHomeAnnouncementObserver *)self _endGrouping];
  }
}

- (void)_updateState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    [(AFHomeAnnouncementObserver *)self _beginGrouping];
    BOOL v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      unint64_t state = self->_state;
      uint64_t v7 = v5;
      uint64_t v8 = AFHomeAnnouncementStateGetNames(state);
      uint64_t v9 = AFHomeAnnouncementStateGetNames(a3);
      *(_DWORD *)buf = 136315650;
      long long v13 = "-[AFHomeAnnouncementObserver _updateState:]";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s state: %@ -> %@", buf, 0x20u);
    }
    unint64_t v10 = self->_state;
    self->_unint64_t state = a3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__AFHomeAnnouncementObserver__updateState___block_invoke;
    v11[3] = &unk_1E592B6C0;
    v11[4] = self;
    v11[5] = v10;
    v11[6] = a3;
    [(AFHomeAnnouncementObserver *)self _enumerateListenersUsingBlock:v11];
    [(AFHomeAnnouncementObserver *)self _endGrouping];
  }
}

uint64_t __43__AFHomeAnnouncementObserver__updateState___block_invoke(void *a1, void *a2)
{
  return [a2 homeAnnouncementObserver:a1[4] stateDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)_handleNotifyStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[AFHomeAnnouncementObserver _handleNotifyStateChangeFrom:to:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s fromState = %llu, toState = %llu", (uint8_t *)&v8, 0x20u);
  }
  [(AFHomeAnnouncementObserver *)self _updateState:a4 == 1];
}

- (void)_fetchStateAndLastPlayedAnnouncementForReason:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  uint64_t v9 = [(AFHomeAnnouncementObserver *)self _localPlaybackSession:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke;
  v11[3] = &unk_1E592B698;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 lastPlayedAnnouncementInfoWithCompletion:v11];
}

void __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s lastPlayedAnnouncementInfo = %@", buf, 0x16u);
  }
  BOOL v5 = getANAnnouncementInfoPlaybackIsActiveKey();
  id v6 = [v3 objectForKey:v5];
  char v7 = [v6 BOOLValue];

  int v8 = getANAnnouncementInfoAnnouncementIDKey();
  uint64_t v9 = [v3 objectForKey:v8];

  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_15;
    v17[3] = &unk_1E592B648;
    id v18 = v9;
    id v19 = v3;
    id v10 = +[AFHomeAnnouncement newWithBuilder:v17];
  }
  else
  {
    id v10 = 0;
  }
  unint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_2;
  block[3] = &unk_1E592B670;
  char v16 = v7;
  id v14 = v10;
  id v15 = *(id *)(a1 + 40);
  id v12 = v10;
  dispatch_async(v11, block);
}

void __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentifier:v3];
  BOOL v5 = *(void **)(a1 + 40);
  id v6 = getANAnnouncementInfoPlaybackStartMachTimeKey();
  char v7 = [v5 objectForKey:v6];
  objc_msgSend(v4, "setStartedHostTime:", objc_msgSend(v7, "unsignedLongLongValue"));

  int v8 = *(void **)(a1 + 40);
  uint64_t v9 = getANAnnouncementInfoPlaybackFinishedMachTimeKey();
  id v10 = [v8 objectForKey:v9];
  objc_msgSend(v4, "setFinishedHostTime:", objc_msgSend(v10, "unsignedLongLongValue"));

  unint64_t v11 = *(void **)(a1 + 40);
  id v12 = getANAnnouncementInfoPlaybackStartDateKey();
  unint64_t v13 = [v11 objectForKey:v12];
  [v4 setStartedDate:v13];

  id v14 = *(void **)(a1 + 40);
  getANAnnouncementInfoPlaybackFinishedDateKey();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 objectForKey:v16];
  [v4 setFinishedDate:v15];
}

uint64_t __87__AFHomeAnnouncementObserver__fetchStateAndLastPlayedAnnouncementForReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315650;
    char v7 = "-[AFHomeAnnouncementObserver _fetchStateAndLastPlayedAnnouncementForReason:completion:]_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s isPlaying = %d, lastPlayedAnnouncement = %@", (uint8_t *)&v6, 0x1Cu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_invalidateLocalPlaybackSession
{
  [(ANLocalPlaybackSession *)self->_localPlaybackSession setDelegate:0];
  localPlaybackSession = self->_localPlaybackSession;
  self->_localPlaybackSession = 0;
}

- (id)_localPlaybackSession:(BOOL)a3
{
  localPlaybackSession = self->_localPlaybackSession;
  if (localPlaybackSession) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    int v6 = (ANLocalPlaybackSession *)objc_alloc_init((Class)getANLocalPlaybackSessionClass());
    char v7 = self->_localPlaybackSession;
    self->_localPlaybackSession = v6;

    [(ANLocalPlaybackSession *)self->_localPlaybackSession setDelegate:self];
    localPlaybackSession = self->_localPlaybackSession;
  }
  return localPlaybackSession;
}

- (void)_tearDown
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[AFHomeAnnouncementObserver _tearDown]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(AFNotifyObserver *)self->_notifyObserver invalidate];
  notifyObserver = self->_notifyObserver;
  self->_notifyObserver = 0;

  [(AFHomeAnnouncementObserver *)self _invalidateLocalPlaybackSession];
}

- (void)_setUp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[AFHomeAnnouncementObserver _setUp]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = getkANAnnounceStateNotificationKey();
  if (v4)
  {
    int v5 = [[AFNotifyObserver alloc] initWithName:v4 options:1 queue:self->_queue delegate:self];
    notifyObserver = self->_notifyObserver;
    self->_notifyObserver = v5;
  }
  else
  {
    uint64_t v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      instanceContext = self->_instanceContext;
      int v10 = 136315394;
      uint64_t v11 = "-[AFHomeAnnouncementObserver _setUp]";
      __int16 v12 = 2112;
      unint64_t v13 = instanceContext;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get the notification name for Announce state. (instanceContext = %@)", (uint8_t *)&v10, 0x16u);
    }
  }
  id v8 = [(AFHomeAnnouncementObserver *)self _localPlaybackSession:1];
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AFHomeAnnouncementObserver_connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__AFHomeAnnouncementObserver_connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLocalPlaybackSession];
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AFHomeAnnouncementObserver_connectionInterrupted__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__AFHomeAnnouncementObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLocalPlaybackSession];
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  if (self->_notifyObserver == a3) {
    [(AFHomeAnnouncementObserver *)self _handleNotifyStateChangeFrom:a4 to:a5];
  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  if (self->_notifyObserver == a3)
  {
    [(AFHomeAnnouncementObserver *)self _beginGrouping];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__AFHomeAnnouncementObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke;
    v5[3] = &unk_1E592B620;
    v5[4] = self;
    [(AFHomeAnnouncementObserver *)self _fetchStateAndLastPlayedAnnouncementForReason:@"notification" completion:v5];
  }
}

uint64_t __77__AFHomeAnnouncementObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _updateState:a2];
  [*(id *)(a1 + 32) _updateLastPlayedAnnouncement:v6];

  uint64_t v7 = *(void **)(a1 + 32);
  return [v7 _endGrouping];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AFHomeAnnouncementObserver_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__AFHomeAnnouncementObserver_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  v2 = *(void **)(a1 + 32);
  return [v2 _tearDown];
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[10])
  {
    [v2 _beginGrouping];
    int v3 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_2;
    v9[3] = &unk_1E592B620;
    v9[4] = v3;
    [v3 _fetchStateAndLastPlayedAnnouncementForReason:@"client request without cache" completion:v9];
    v2 = *(void **)(a1 + 32);
  }
  if ((uint64_t)v2[6] < 1)
  {
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2[10]);
  }
  else
  {
    id v4 = v2[7];
    int v5 = v2[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_3;
    block[3] = &unk_1E592C6E8;
    id v6 = *(id *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v8 = v6;
    dispatch_group_notify(v4, v5, block);
  }
}

uint64_t __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _updateState:a2];
  [*(id *)(a1 + 32) _updateLastPlayedAnnouncement:v6];

  uint64_t v7 = *(void **)(a1 + 32);
  return [v7 _endGrouping];
}

uint64_t __56__AFHomeAnnouncementObserver_getSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 80));
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__AFHomeAnnouncementObserver_getStateWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __53__AFHomeAnnouncementObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64));
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__AFHomeAnnouncementObserver_removeListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __45__AFHomeAnnouncementObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__AFHomeAnnouncementObserver_addListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __42__AFHomeAnnouncementObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(AFHomeAnnouncementObserver *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)AFHomeAnnouncementObserver;
  [(AFHomeAnnouncementObserver *)&v3 dealloc];
}

- (AFHomeAnnouncementObserver)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFHomeAnnouncementObserver;
  int v5 = [(AFHomeAnnouncementObserver *)&v20 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistant.home-announcement-observer", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      int v10 = (AFInstanceContext *)v4;
    }
    else
    {
      int v10 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v12;

    v5->_int64_t groupingDepth = 0;
    dispatch_group_t v14 = dispatch_group_create();
    snapshotGroup = v5->_snapshotGroup;
    v5->_snapshotGroup = (OS_dispatch_group *)v14;

    id v16 = v5->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke;
    block[3] = &unk_1E592C678;
    id v19 = v5;
    dispatch_async(v16, block);
  }
  return v5;
}

void __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUp];
  [*(id *)(a1 + 32) _beginGrouping];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke_2;
  v3[3] = &unk_1E592B620;
  id v4 = v2;
  [v4 _fetchStateAndLastPlayedAnnouncementForReason:@"initial" completion:v3];
}

uint64_t __54__AFHomeAnnouncementObserver_initWithInstanceContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _updateState:a2];
  [*(id *)(a1 + 32) _updateLastPlayedAnnouncement:v6];

  uint64_t v7 = *(void **)(a1 + 32);
  return [v7 _endGrouping];
}

- (AFHomeAnnouncementObserver)init
{
  objc_super v3 = +[AFInstanceContext currentContext];
  id v4 = [(AFHomeAnnouncementObserver *)self initWithInstanceContext:v3];

  return v4;
}

@end