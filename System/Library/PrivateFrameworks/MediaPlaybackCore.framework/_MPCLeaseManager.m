@interface _MPCLeaseManager
- (MPCPlaybackEngine)playbackEngine;
- (NSMutableDictionary)prepareCompletions;
- (NSMutableSet)leaseEndIgnoreReasons;
- (_MPCLeaseManager)initWithPlaybackEngine:(id)a3;
- (void)_updateStateForPlaybackPrevention;
- (void)beginIgnoringLeaseEndEventsForReason:(id)a3;
- (void)dealloc;
- (void)endIgnoringLeaseEndEventsForReason:(id)a3;
- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5;
- (void)getHasPreparedLeaseForAccount:(id)a3 completion:(id)a4;
- (void)prepareForPlaybackWithAccount:(id)a3 completion:(id)a4;
- (void)setCanStealLeaseIfNeeded;
- (void)setLeaseEndIgnoreReasons:(id)a3;
- (void)setPrepareCompletions:(id)a3;
@end

@implementation _MPCLeaseManager

- (_MPCLeaseManager)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MPCLeaseManager;
  v5 = [(_MPCLeaseManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    prepareCompletions = v6->_prepareCompletions;
    v6->_prepareCompletions = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    leaseEndIgnoreReasons = v6->_leaseEndIgnoreReasons;
    v6->_leaseEndIgnoreReasons = (NSMutableSet *)v9;

    [v4 addEngineObserver:v6];
    v11 = +[MPCFairPlayPerformanceController sharedController];
    [v11 registerLeaseManager:v6];
  }
  return v6;
}

- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F08A00];
  id v8 = a5;
  id v9 = a4;
  id v11 = [v7 defaultCenter];
  uint64_t v10 = *MEMORY[0x263F11148];
  [v11 removeObserver:self name:*MEMORY[0x263F11148] object:v8];

  [v11 addObserver:self selector:sel__itemShouldPreventPlaybackDidChangeNotification_ name:v10 object:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareCompletions, 0);
  objc_storeStrong((id *)&self->_leaseEndIgnoreReasons, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setPrepareCompletions:(id)a3
{
}

- (NSMutableDictionary)prepareCompletions
{
  return self->_prepareCompletions;
}

- (void)setLeaseEndIgnoreReasons:(id)a3
{
}

- (NSMutableSet)leaseEndIgnoreReasons
{
  return self->_leaseEndIgnoreReasons;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)_updateStateForPlaybackPrevention
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(_MPCLeaseManager *)self playbackEngine];
  id v4 = [v3 player];

  unint64_t v5 = [v4 state];
  v6 = [v4 currentItem];
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v6;
    __int16 v19 = 1024;
    int v20 = [v6 shouldPreventPlayback];
    __int16 v21 = 2048;
    unint64_t v22 = v5;
    __int16 v23 = 1024;
    BOOL v24 = v5 > 1;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - State for lease playback prevention [evaluation] - item:%{public}@ - shouldPreventPlayback:%{BOOL}u - playbackState:%ld - isPlaying:%{BOOL}u", buf, 0x2Cu);
  }

  if (v5 >= 2 && [v6 shouldPreventPlayback])
  {
    if ([(NSMutableSet *)self->_leaseEndIgnoreReasons count])
    {
      id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(NSMutableSet *)self->_leaseEndIgnoreReasons allObjects];
        uint64_t v10 = [v9 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 134218242;
        v16 = self;
        __int16 v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Ignoring lease playback prevention [pending reasons %{public}@]", buf, 0x16u);
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53___MPCLeaseManager__updateStateForPlaybackPrevention__block_invoke;
      block[3] = &unk_2643C6660;
      v12 = v6;
      objc_super v13 = self;
      id v14 = v4;
      dispatch_async(MEMORY[0x263EF83A0], block);

      id v8 = v12;
    }
  }
}

- (void)setCanStealLeaseIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Can steal lease if needed", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x263F891E0] sharedController];
  [v4 receivedUserInteractionEvent];
}

- (void)endIgnoringLeaseEndEventsForReason:(id)a3
{
  [(NSMutableSet *)self->_leaseEndIgnoreReasons removeObject:a3];
  if (![(NSMutableSet *)self->_leaseEndIgnoreReasons count])
  {
    [(_MPCLeaseManager *)self _updateStateForPlaybackPrevention];
  }
}

- (void)beginIgnoringLeaseEndEventsForReason:(id)a3
{
}

- (void)prepareForPlaybackWithAccount:(id)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v8 = [v6 hasCatalogPlaybackCapability];
  int v9 = [v6 usesLease];
  int v10 = v9;
  if (v8 && (v9 & 1) != 0)
  {
    prepareCompletions = self->_prepareCompletions;
    v12 = [v6 hashedDSID];
    objc_super v13 = [(NSMutableDictionary *)prepareCompletions objectForKeyedSubscript:v12];

    if (v13)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke;
      aBlock[3] = &unk_2643C4AD8;
      id v38 = v13;
      id v39 = v7;
      id v14 = _Block_copy(aBlock);
      v15 = self->_prepareCompletions;
      v16 = [v6 hashedDSID];
      [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

      __int16 v17 = v38;
    }
    else
    {
      __int16 v19 = _Block_copy(v7);
      int v20 = self->_prepareCompletions;
      __int16 v21 = [v6 hashedDSID];
      [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];

      unint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v41 = self;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: preparing lease account: %@", buf, 0x16u);
      }

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_9;
      v35[3] = &unk_2643C4B00;
      v35[4] = self;
      id v23 = v6;
      id v36 = v23;
      BOOL v24 = _Block_copy(v35);
      uint64_t v25 = [v23 userIdentity];
      v26 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v25];
      v27 = [v26 _createStoreRequestContext];

      v28 = [MEMORY[0x263F891E0] sharedController];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_3;
      v31[3] = &unk_2643C4B80;
      v31[4] = self;
      id v34 = v24;
      id v32 = v23;
      id v33 = v27;
      id v29 = v27;
      id v30 = v24;
      [v28 getLeaseSessionWithRequestContext:v29 completionHandler:v31];

      __int16 v17 = v36;
    }
  }
  else
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v41 = self;
      __int16 v42 = 2112;
      id v43 = v6;
      __int16 v44 = 1024;
      int v45 = v8;
      __int16 v46 = 1024;
      int v47 = v10;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: Ignoring request to prepare lease for account: %@ hasCatalogPlayback=%{BOOL}u usesLease=%{BOOL}u", buf, 0x22u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)getHasPreparedLeaseForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [v6 userIdentity];

  int v8 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v7];
  int v9 = [v8 _createStoreRequestContext];

  int v10 = [MEMORY[0x263F891E0] sharedController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke;
  v12[3] = &unk_2643C4AB0;
  id v13 = v5;
  id v11 = v5;
  [v10 getLeaseSessionWithRequestContext:v9 completionHandler:v12];
}

- (void)dealloc
{
  v3 = +[MPCFairPlayPerformanceController sharedController];
  [v3 unregisterLeaseManager:self];

  v4.receiver = self;
  v4.super_class = (Class)_MPCLeaseManager;
  [(_MPCLeaseManager *)&v4 dealloc];
}

@end