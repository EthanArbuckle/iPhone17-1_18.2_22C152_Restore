@interface ANAnnouncementCoordinator
+ (NSUUID)localDeviceIdentifier;
+ (id)sharedCoordinator;
- (ANAnnouncementCoordinator)init;
- (ANAnnouncementStatePublisher)playbackStatePublisher;
- (ANCompanionConnection)companionConnection;
- (ANMessenger)messenger;
- (ANParticipant)localParticipant;
- (ANRemotePlaybackStatusProvider)remotePlaybackStatusProvider;
- (BOOL)_removeAnnouncementManagerForIdentifier:(id)a3;
- (BOOL)_removePlaybackManagerForIdentifier:(id)a3;
- (NSMapTable)delegatesToQueues;
- (NSMutableDictionary)announcementManagers;
- (NSMutableDictionary)playbackManagers;
- (NSSet)scanningDeviceCandidates;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)siriRRDonation;
- (id)_createAnnouncementManagerForIdentifier:(id)a3;
- (id)_createPlaybackManagerForIdentifier:(id)a3;
- (id)_endpointIDForAnnouncementManager:(id)a3;
- (id)_endpointIDForPlaybackManager:(id)a3;
- (id)allAnnouncementsSortedByReceiptForEndpointID:(id)a3;
- (id)announcementForID:(id)a3 endpointID:(id)a4;
- (id)announcementsForGroupID:(id)a3 endpointID:(id)a4;
- (id)announcementsForIDs:(id)a3 endpointID:(id)a4;
- (id)announcementsForPlaybackManager:(id)a3;
- (id)lastPlayedAnnouncementInfoForEndpointID:(id)a3;
- (id)playbackManager:(id)a3 announcementsForIdentifiers:(id)a4;
- (id)resolveIdentifier:(id)a3;
- (unint64_t)playbackStateForEndpointID:(id)a3;
- (void)_executeBlockForDelegates:(id)a3;
- (void)_handleReceivedAnnouncement:(id)a3;
- (void)_initializeManagers;
- (void)_notifyDidReceiveAnnouncement:(id)a3 forEndpointID:(id)a4;
- (void)_removeManagersForIdentifier:(id)a3;
- (void)addAnnouncement:(id)a3 forEndpointID:(id)a4 completion:(id)a5;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)announcementManager:(id)a3 announcements:(id)a4 didChangeForGroupID:(id)a5;
- (void)cleanForExit;
- (void)cleanUpOldAnnouncementsForPlaybackManager:(id)a3;
- (void)companionDidPlayAnnouncement:(id)a3;
- (void)failedToDeliverAnnouncement:(id)a3 error:(id)a4;
- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5;
- (void)pauseAllTimersForEndpointID:(id)a3;
- (void)performPlaybackCommand:(id)a3 endpointID:(id)a4 completionHandler:(id)a5;
- (void)playbackManager:(id)a3 didFinishPlayingAnnouncement:(id)a4 withOptions:(unint64_t)a5;
- (void)playbackManager:(id)a3 didStartPlayingAnnouncement:(id)a4;
- (void)playbackManager:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4;
- (void)playbackManager:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcement:(id)a5;
- (void)playbackManagerDidFinishPlayingAnnouncements:(id)a3;
- (void)receivedAnnouncement:(id)a3;
- (void)removeOldAnnouncementsForEndpointID:(id)a3;
- (void)resetAllTimersForEndpointID:(id)a3;
- (void)resumeAllTimersForEndpointID:(id)a3;
- (void)sendRequest:(id)a3 sentHandler:(id)a4;
- (void)setCompanionConnection:(id)a3;
- (void)setPlaybackStartedForAnnouncement:(id)a3 endpointID:(id)a4;
- (void)setPlaybackStatePublisher:(id)a3;
- (void)setPlaybackStoppedForAnnouncement:(id)a3 endpointID:(id)a4;
- (void)setRemotePlaybackStatusProvider:(id)a3;
- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4 endpointID:(id)a5;
@end

@implementation ANAnnouncementCoordinator

- (ANAnnouncementCoordinator)init
{
  v22.receiver = self;
  v22.super_class = (Class)ANAnnouncementCoordinator;
  v2 = [(ANAnnouncementCoordinator *)&v22 init];
  if (v2)
  {
    uint64_t v3 = ANLogWithCategory();
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = objc_opt_new();
    companionConnection = v2->_companionConnection;
    v2->_companionConnection = (ANCompanionConnection *)v5;

    [(ANCompanionConnection *)v2->_companionConnection setDelegate:v2];
    uint64_t v7 = objc_opt_new();
    playbackStatePublisher = v2->_playbackStatePublisher;
    v2->_playbackStatePublisher = (ANAnnouncementStatePublisher *)v7;

    uint64_t v9 = objc_opt_new();
    messenger = v2->_messenger;
    v2->_messenger = (ANMessenger *)v9;

    [(ANMessenger *)v2->_messenger setDelegate:v2];
    uint64_t v11 = objc_opt_new();
    announcementManagers = v2->_announcementManagers;
    v2->_announcementManagers = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    playbackManagers = v2->_playbackManagers;
    v2->_playbackManagers = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
    delegatesToQueues = v2->_delegatesToQueues;
    v2->_delegatesToQueues = (NSMapTable *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.announce.coordinatorQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_opt_new();
    siriRRDonation = v2->_siriRRDonation;
    v2->_siriRRDonation = (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation *)v19;

    [(ANAnnouncementCoordinator *)v2 _initializeManagers];
  }
  return v2;
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ANAnnouncementCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, block);
  }
  v2 = (void *)sharedCoordinator_sharedCoordinator;
  return v2;
}

uint64_t __46__ANAnnouncementCoordinator_sharedCoordinator__block_invoke()
{
  sharedCoordinator_sharedCoordinator = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (NSUUID)localDeviceIdentifier
{
  if (localDeviceIdentifier_onceToken != -1) {
    dispatch_once(&localDeviceIdentifier_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)localDeviceIdentifier_identifier;
  return (NSUUID *)v2;
}

uint64_t __50__ANAnnouncementCoordinator_localDeviceIdentifier__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F29128]);
  localDeviceIdentifier_identifier = [v0 initWithUUIDString:*MEMORY[0x1E4F4A798]];
  return MEMORY[0x1F41817F8]();
}

- (void)_initializeManagers
{
  uint64_t v3 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ANAnnouncementCoordinator__initializeManagers__block_invoke;
  block[3] = &unk_1E6BCE238;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__ANAnnouncementCoordinator__initializeManagers__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v3 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  id v18 = [v2 arrayWithObject:v3];

  v4 = +[ANAnnouncementStorageManager sharedManager];
  uint64_t v5 = (void *)[v18 copy];
  [v4 deleteAnnouncementsExcludingAnnouncementsForEndpointIDs:v5];

  v6 = [*(id *)(a1 + 32) announcementManagers];
  uint64_t v7 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = +[ANAnnouncementCoordinator localDeviceIdentifier];
    id v11 = (id)[v9 _createAnnouncementManagerForIdentifier:v10];
  }
  v12 = [*(id *)(a1 + 32) playbackManagers];
  uint64_t v13 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    v16 = +[ANAnnouncementCoordinator localDeviceIdentifier];
    id v17 = (id)[v15 _createPlaybackManagerForIdentifier:v16];
  }
}

- (id)_createAnnouncementManagerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[ANAnnouncementManager managerWithEndpointID:v4];
  [v6 setDelegate:self];
  uint64_t v7 = [(ANAnnouncementCoordinator *)self announcementManagers];
  [v7 setObject:v6 forKeyedSubscript:v4];

  return v6;
}

- (BOOL)_removeAnnouncementManagerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ANAnnouncementCoordinator *)self announcementManagers];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    [v7 setDelegate:0];
    [v7 removeAllAnnouncements];
    v8 = [(ANAnnouncementCoordinator *)self announcementManagers];
    [v8 setObject:0 forKeyedSubscript:v4];
  }
  return v7 != 0;
}

- (id)_createPlaybackManagerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[ANPlaybackManager managerWithEndpointID:v4];
  [v6 setDelegate:self];
  [v6 setDataSource:self];
  uint64_t v7 = [(ANAnnouncementCoordinator *)self playbackManagers];
  [v7 setObject:v6 forKeyedSubscript:v4];

  return v6;
}

- (BOOL)_removePlaybackManagerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ANAnnouncementCoordinator *)self playbackManagers];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    [v7 setDelegate:0];
    [v7 setDataSource:0];
    v8 = [(ANAnnouncementCoordinator *)self playbackManagers];
    [v8 setObject:0 forKeyedSubscript:v4];
  }
  return v7 != 0;
}

- (void)_removeManagersForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ANAnnouncementCoordinator *)self _removeAnnouncementManagerForIdentifier:v4])
  {
    uint64_t v5 = [(ANAnnouncementCoordinator *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Removed Announcement Manager", buf, 2u);
    }
  }
  if ([(ANAnnouncementCoordinator *)self _removePlaybackManagerForIdentifier:v4])
  {
    v6 = [(ANAnnouncementCoordinator *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Removed Playback Manager", v7, 2u);
    }
  }
}

- (id)_endpointIDForAnnouncementManager:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(ANAnnouncementCoordinator *)self announcementManagers];
        id v12 = [v11 objectForKeyedSubscript:v10];

        if (v12 == v4)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)_endpointIDForPlaybackManager:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(ANAnnouncementCoordinator *)self playbackManagers];
        id v12 = [v11 objectForKeyedSubscript:v10];

        if (v12 == v4)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)_handleReceivedAnnouncement:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v4 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[ANHomeManager shared];
  v33 = [v5 currentAccessory];

  if (v33)
  {
    memset(&v52, 0, sizeof(v52));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v52, HostTimeClock);
    [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
    double v8 = v7;
    uint64_t v9 = [v37 playbackDeadline];
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    id v12 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    id v13 = [v12 numberForDefault:*MEMORY[0x1E4F4A5B0]];
    [v13 doubleValue];
    double v15 = v14;

    if (v11 < v15) {
      double v11 = v15;
    }
    CMTimeMakeWithSeconds(&rhs, v11, v52.timescale);
    CMTime lhs = v52;
    CMTimeAdd(&v53, &lhs, &rhs);
    CMTime v52 = v53;
    objc_msgSend(v37, "setMachStartTime:", objc_msgSend(MEMORY[0x1E4F4A940], "secondsToMachTime:", v8 + v11));
    CMTime v49 = v52;
    [v37 setCmStartTime:&v49];
    long long v16 = [(ANAnnouncementCoordinator *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CMTimeValue value = v52.value;
      uint64_t v18 = [v37 machStartTime];
      LODWORD(v53.value) = 134218240;
      *(CMTimeValue *)((char *)&v53.value + 4) = value;
      LOWORD(v53.flags) = 2048;
      *(void *)((char *)&v53.flags + 2) = v18;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "Did Set Announcement CM Start Time = %lld, Mach Start Time = %llu", (uint8_t *)&v53, 0x16u);
    }

    [MEMORY[0x1E4F1CA48] arrayWithObject:v33];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          CMTimeFlags v21 = objc_msgSend(v20, "an_supportsAnnounce");
          int v22 = objc_msgSend(v20, "an_isAnnounceEnabled");
          v23 = [v37 location];
          int v24 = [v23 containsAccessory:v20];

          int v25 = [v37 isAnnouncerInSameRoomAsAccessory:v20];
          v26 = [(ANAnnouncementCoordinator *)self log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [v20 name];
            LODWORD(v53.value) = 138413314;
            *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v27;
            LOWORD(v53.flags) = 1024;
            *(CMTimeFlags *)((char *)&v53.flags + 2) = v21;
            WORD1(v53.epoch) = 1024;
            HIDWORD(v53.epoch) = v22;
            __int16 v54 = 1024;
            int v55 = v24;
            __int16 v56 = 1024;
            int v57 = v25;
            _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "HomePod: %@ Supports Announce = %d, Announce Enabled = %d, In Announcement Location = %d, In Same Room as Announcer = %d", (uint8_t *)&v53, 0x24u);
          }
          if ((v21 & v22 & v24 ^ 1 | v25))
          {
            v28 = [(ANAnnouncementCoordinator *)self log];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v53.value) = 138412290;
              *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v20;
              _os_log_impl(&dword_1DA5ED000, v28, OS_LOG_TYPE_DEFAULT, "Ignoring message. Accessory does not meet criteria for receiving the announcement locally. %@", (uint8_t *)&v53, 0xCu);
            }
          }
          else
          {
            v29 = +[ANAnnouncementCoordinator localDeviceIdentifier];
            v30 = (void *)[v37 copy];
            objc_initWeak((id *)&v53, self);
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke;
            v41[3] = &unk_1E6BCE6C8;
            objc_copyWeak(&v44, (id *)&v53);
            id v31 = v30;
            id v42 = v31;
            v28 = v29;
            v43 = v28;
            [(ANAnnouncementCoordinator *)self addAnnouncement:v31 forEndpointID:v28 completion:v41];

            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)&v53);
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v36);
    }
  }
  else
  {
    objc_initWeak((id *)&v53, self);
    v32 = +[ANAnnouncementCoordinator localDeviceIdentifier];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_19;
    v38[3] = &unk_1E6BCE6F0;
    objc_copyWeak(&v40, (id *)&v53);
    id v39 = v37;
    [(ANAnnouncementCoordinator *)self addAnnouncement:v39 forEndpointID:v32 completion:v38];

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)&v53);
  }
}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke(id *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = a1 + 6;
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    uint64_t v5 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_2;
    block[3] = &unk_1E6BCE448;
    objc_copyWeak(&v9, v3);
    id v7 = a1[4];
    id v8 = a1[5];
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
  }
}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _notifyDidReceiveAnnouncement:*(void *)(a1 + 32) forEndpointID:*(void *)(a1 + 40)];
}

void __57__ANAnnouncementCoordinator__handleReceivedAnnouncement___block_invoke_19(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = [WeakRetained messenger];
    [v3 forwardAnnouncementToCompanion:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDidReceiveAnnouncement:(id)a3 forEndpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self queue];
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__ANAnnouncementCoordinator__notifyDidReceiveAnnouncement_forEndpointID___block_invoke;
  v11[3] = &unk_1E6BCE718;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ANAnnouncementCoordinator *)self _executeBlockForDelegates:v11];
}

void __73__ANAnnouncementCoordinator__notifyDidReceiveAnnouncement_forEndpointID___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    id v4 = (void *)a1[5];
    uint64_t v5 = [v4 groupID];
    [v6 coordinator:v3 didReceiveAnnouncement:v4 forGroupID:v5 forEndpointID:a1[6]];
  }
}

- (void)_executeBlockForDelegates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANAnnouncementCoordinator *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke;
  v7[3] = &unk_1E6BCE168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegatesToQueues];
  uint64_t v3 = [v2 keyEnumerator];
  id v4 = [v3 allObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = [*(id *)(a1 + 32) delegatesToQueues];
        double v11 = [v10 objectForKey:v9];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke_2;
        block[3] = &unk_1E6BCE560;
        id v12 = *(id *)(a1 + 40);
        void block[4] = v9;
        id v15 = v12;
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

uint64_t __55__ANAnnouncementCoordinator__executeBlockForDelegates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)announcementManager:(id)a3 announcements:(id)a4 didChangeForGroupID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(ANAnnouncementCoordinator *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke;
  v15[3] = &unk_1E6BCDFB8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointIDForAnnouncementManager:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke_2;
    v4[3] = &unk_1E6BCE740;
    v4[4] = v3;
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    id v7 = v2;
    [v3 _executeBlockForDelegates:v4];
  }
}

void __83__ANAnnouncementCoordinator_announcementManager_announcements_didChangeForGroupID___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coordinator:a1[4] didUpdateAnnouncements:a1[5] forGroupID:a1[6] forEndpointID:a1[7]];
  }
}

- (void)receivedAnnouncement:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ANAnnouncementCoordinator_receivedAnnouncement___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__ANAnnouncementCoordinator_receivedAnnouncement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReceivedAnnouncement:*(void *)(a1 + 40)];
}

- (void)failedToDeliverAnnouncement:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Failed to Deliver Announcement with Error %@, %@", (uint8_t *)&v10, 0x16u);
  }

  if ([v6 isRelayRequest])
  {
    id v9 = +[ANUserNotificationController sharedController];
    [v9 postSendFailureNotificationForAnnouncement:v6];
  }
}

- (void)companionDidPlayAnnouncement:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Announcement was played on remote device: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [(ANAnnouncementCoordinator *)self playbackManagers];
  id v7 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [(ANAnnouncementCoordinator *)self remotePlaybackStatusProvider];
    if (v9)
    {
      int v10 = [(ANAnnouncementCoordinator *)self remotePlaybackStatusProvider];
      id v11 = +[ANAnnouncementCoordinator localDeviceIdentifier];
      char v12 = [v10 isExternalPlaybackActiveForEndpointID:v11];
    }
    else
    {
      char v12 = 0;
    }

    uint64_t v13 = [v8 playbackState];
    if ((v12 & 1) == 0 && v13 != 1) {
      [v8 updatePlaybackForAnnouncementID:v4 options:4];
    }
  }
}

- (void)playbackManager:(id)a3 didStartPlayingAnnouncement:(id)a4
{
  id v11 = a4;
  id v6 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  if (v6)
  {
    id v7 = [(ANAnnouncementCoordinator *)self announcementForID:v11 endpointID:v6];
    if (v7) {
      [(ANAnnouncementCoordinator *)self updateAnnouncement:v7 statusFlags:4 endpointID:v6];
    }
    id v8 = [(ANAnnouncementCoordinator *)self siriRRDonation];
    [v8 makePlaybackDonationWithAnnouncementID:v11];

    id v9 = [MEMORY[0x1E4F4A8F0] getEffectiveNotificationNameFromNotificationName:*MEMORY[0x1E4F4A958] endpointID:v6];
    int v10 = [(ANAnnouncementCoordinator *)self playbackStatePublisher];
    [v10 publishState:1 name:v9];
  }
}

- (void)playbackManager:(id)a3 didFinishPlayingAnnouncement:(id)a4 withOptions:(unint64_t)a5
{
  char v5 = a5;
  id v22 = a3;
  id v8 = a4;
  id v9 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:v22];
  if (v9)
  {
    if ((v5 & 4) != 0)
    {
      int v10 = [(ANAnnouncementCoordinator *)self announcementForID:v8 endpointID:v9];
      if (v10)
      {
        if ((v5 & 2) != 0) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
        [(ANAnnouncementCoordinator *)self updateAnnouncement:v10 statusFlags:v11 endpointID:v9];
        char v12 = [v22 endpointID];
        uint64_t v13 = +[ANAnalyticsContext contextWithEndpointID:v12];

        int v14 = +[ANAnalytics shared];
        id v15 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v16 = [v10 creationTimestamp];
        [v15 timeIntervalSinceDate:v16];
        objc_msgSend(v14, "announcementFinishedPlaying:withTime:ofGroupCount:context:", v10, objc_msgSend(v22, "playbackItemCount"), v13, v17);
      }
      if ((v5 & 8) != 0 && objc_msgSend(v9, "an_isLocalDevice"))
      {
        id v18 = [(ANAnnouncementCoordinator *)self companionConnection];
        [v18 broadcastAnnouncementPlayed:v8];
      }
    }
    long long v19 = [(ANAnnouncementCoordinator *)self siriRRDonation];
    [v19 makePlaybackDonationWithAnnouncementID:v8];

    uint64_t v20 = [MEMORY[0x1E4F4A8F0] getEffectiveNotificationNameFromNotificationName:*MEMORY[0x1E4F4A958] endpointID:v9];
    uint64_t v21 = [(ANAnnouncementCoordinator *)self playbackStatePublisher];
    [v21 publishState:0 name:v20];
  }
}

- (void)playbackManager:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcement:(id)a5
{
  id v8 = a5;
  id v9 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  if (v9)
  {
    if (v8)
    {
      int v10 = [(ANAnnouncementCoordinator *)self siriRRDonation];
      [v10 makePlaybackDonationWithAnnouncementID:v8];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__ANAnnouncementCoordinator_playbackManager_didUpdatePlaybackState_announcement___block_invoke;
    v11[3] = &unk_1E6BCE768;
    v11[4] = self;
    unint64_t v13 = a4;
    id v12 = v9;
    [(ANAnnouncementCoordinator *)self _executeBlockForDelegates:v11];
  }
}

void __81__ANAnnouncementCoordinator_playbackManager_didUpdatePlaybackState_announcement___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coordinator:a1[4] didUpdatePlaybackState:a1[6] forEndpointID:a1[5]];
  }
}

- (void)playbackManager:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4
{
  id v6 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __92__ANAnnouncementCoordinator_playbackManager_didStartPlayingAnnouncementsAtMachAbsoluteTime___block_invoke;
    v8[3] = &unk_1E6BCE768;
    v8[4] = self;
    unint64_t v10 = a4;
    id v9 = v6;
    [(ANAnnouncementCoordinator *)self _executeBlockForDelegates:v8];
  }
}

void __92__ANAnnouncementCoordinator_playbackManager_didStartPlayingAnnouncementsAtMachAbsoluteTime___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coordinator:a1[4] didStartPlayingAnnouncementsAtMachAbsoluteTime:a1[6] forEndpointID:a1[5]];
  }
}

- (void)playbackManagerDidFinishPlayingAnnouncements:(id)a3
{
  id v4 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  char v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__ANAnnouncementCoordinator_playbackManagerDidFinishPlayingAnnouncements___block_invoke;
    v6[3] = &unk_1E6BCE790;
    v6[4] = self;
    id v7 = v4;
    [(ANAnnouncementCoordinator *)self _executeBlockForDelegates:v6];
  }
}

void __74__ANAnnouncementCoordinator_playbackManagerDidFinishPlayingAnnouncements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 coordinator:*(void *)(a1 + 32) didFinishPlayingAnnouncementsForEndpointID:*(void *)(a1 + 40)];
  }
}

- (void)cleanUpOldAnnouncementsForPlaybackManager:(id)a3
{
  id v8 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  if (v8)
  {
    uint64_t v4 = [(ANAnnouncementCoordinator *)self remotePlaybackStatusProvider];
    if (v4)
    {
      char v5 = (void *)v4;
      id v6 = [(ANAnnouncementCoordinator *)self remotePlaybackStatusProvider];
      int v7 = [v6 isExternalPlaybackActiveForEndpointID:v8];

      if (v7) {
        [(ANAnnouncementCoordinator *)self removeOldAnnouncementsForEndpointID:v8];
      }
    }
  }
}

- (id)announcementsForPlaybackManager:(id)a3
{
  uint64_t v4 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  if (v4)
  {
    char v5 = [(ANAnnouncementCoordinator *)self allAnnouncementsSortedByReceiptForEndpointID:v4];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)playbackManager:(id)a3 announcementsForIdentifiers:(id)a4
{
  id v6 = a4;
  int v7 = [(ANAnnouncementCoordinator *)self _endpointIDForPlaybackManager:a3];
  if (v7)
  {
    id v8 = [(ANAnnouncementCoordinator *)self announcementsForIDs:v6 endpointID:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (ANRemotePlaybackStatusProvider)remotePlaybackStatusProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remotePlaybackStatusProvider);
  return (ANRemotePlaybackStatusProvider *)WeakRetained;
}

- (void)setRemotePlaybackStatusProvider:(id)a3
{
}

- (ANMessenger)messenger
{
  return self->_messenger;
}

- (NSMutableDictionary)announcementManagers
{
  return self->_announcementManagers;
}

- (NSMutableDictionary)playbackManagers
{
  return self->_playbackManagers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)delegatesToQueues
{
  return self->_delegatesToQueues;
}

- (ANCompanionConnection)companionConnection
{
  return self->_companionConnection;
}

- (void)setCompanionConnection:(id)a3
{
}

- (ANAnnouncementStatePublisher)playbackStatePublisher
{
  return self->_playbackStatePublisher;
}

- (void)setPlaybackStatePublisher:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)siriRRDonation
{
  return self->_siriRRDonation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriRRDonation, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_playbackStatePublisher, 0);
  objc_storeStrong((id *)&self->_companionConnection, 0);
  objc_storeStrong((id *)&self->_delegatesToQueues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playbackManagers, 0);
  objc_storeStrong((id *)&self->_announcementManagers, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_remotePlaybackStatusProvider);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ANAnnouncementCoordinator_ANAnnouncementCoordinatorDelegate__addDelegate_queue___block_invoke;
  block[3] = &unk_1E6BCDF90;
  id v12 = v7;
  unint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __82__ANAnnouncementCoordinator_ANAnnouncementCoordinatorDelegate__addDelegate_queue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v3;
  uint64_t v4 = [*(id *)(a1 + 40) delegatesToQueues];
  [v4 setObject:v5 forKey:*(void *)(a1 + 48)];
}

- (ANParticipant)localParticipant
{
  v2 = [(ANAnnouncementCoordinator *)self messenger];
  id v3 = [v2 localParticipant];

  return (ANParticipant *)v3;
}

- (NSSet)scanningDeviceCandidates
{
  v2 = [(ANAnnouncementCoordinator *)self messenger];
  id v3 = [v2 getScanningDeviceCandidates];

  return (NSSet *)v3;
}

- (void)sendRequest:(id)a3 sentHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F4A940];
  id v8 = a3;
  if (([v7 isHomeAppInstalled] & 1) == 0)
  {
    id v9 = [(ANAnnouncementCoordinator *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ANAnnouncementCoordinator(AnnouncementSend) sendRequest:sentHandler:](v9);
    }
  }
  id v10 = [(ANAnnouncementCoordinator *)self messenger];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ANAnnouncementCoordinator_AnnouncementSend__sendRequest_sentHandler___block_invoke;
  v12[3] = &unk_1E6BCE7B8;
  id v13 = v6;
  id v11 = v6;
  [v10 sendRequest:v8 sentHandler:v12];
}

uint64_t __71__ANAnnouncementCoordinator_AnnouncementSend__sendRequest_sentHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ANAnnouncementCoordinator *)self messenger];
  [v11 mockAnnouncement:v10 playbackDeadline:v9 sentHandler:v8];
}

- (void)addAnnouncement:(id)a3 forEndpointID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ANAnnouncementCoordinator *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__ANAnnouncementCoordinator_ANAnnouncementManagement_Internal__addAnnouncement_forEndpointID_completion___block_invoke;
  v15[3] = &unk_1E6BCE7E0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __105__ANAnnouncementCoordinator_ANAnnouncementManagement_Internal__addAnnouncement_forEndpointID_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) announcementManagers];
  id v3 = [v2 objectForKeyedSubscript:v4];

  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) _createAnnouncementManagerForIdentifier:v4];
  }
  [v3 addAnnouncement:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (id)announcementsForGroupID:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v9 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v7];

  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [v10 announcementsForGroupID:v6];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)announcementForID:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v9 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v7];

  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [v10 announcementForID:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)allAnnouncementsSortedByReceiptForEndpointID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v6 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v7 allAnnouncementsSortedByReceipt];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)announcementsForIDs:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v9 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v7];

  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [v10 announcementsForIDs:v6];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4 endpointID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v11 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v8];

  id v12 = [v10 objectForKeyedSubscript:v11];

  [v12 updateAnnouncement:v9 statusFlags:a4];
}

- (void)removeOldAnnouncementsForEndpointID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v6 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 removeOldAnnouncements];
}

- (void)cleanForExit
{
  id v3 = [(ANAnnouncementCoordinator *)self messenger];
  [v3 cleanForExit];

  id v4 = [(ANAnnouncementCoordinator *)self announcementManagers];
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_205];
}

uint64_t __67__ANAnnouncementCoordinator_ANAnnouncementManagement__cleanForExit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cleanForExit];
}

- (void)performPlaybackCommand:(id)a3 endpointID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ANAnnouncementCoordinator *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__ANAnnouncementCoordinator_Playback__performPlaybackCommand_endpointID_completionHandler___block_invoke;
  v15[3] = &unk_1E6BCE7E0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __91__ANAnnouncementCoordinator_Playback__performPlaybackCommand_endpointID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "Performing Playback Command. Endpoint ID = %@, Command = %@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) playbackManagers];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v7 = [*(id *)(a1 + 32) _createPlaybackManagerForIdentifier:v5];
  }
  [v7 performPlaybackCommand:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (id)lastPlayedAnnouncementInfoForEndpointID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  id v5 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ANAnnouncementCoordinator_Playback__lastPlayedAnnouncementInfoForEndpointID___block_invoke;
  block[3] = &unk_1E6BCDF68;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __79__ANAnnouncementCoordinator_Playback__lastPlayedAnnouncementInfoForEndpointID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackManagers];
  uint64_t v3 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  id v6 = [v2 objectForKeyedSubscript:v3];

  if (v6)
  {
    id v4 = [v6 lastPlayedAnnouncementInfo];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  id v5 = v6;
  if (v6)
  {

    id v5 = v6;
  }
}

- (unint64_t)playbackStateForEndpointID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ANAnnouncementCoordinator_Playback__playbackStateForEndpointID___block_invoke;
  block[3] = &unk_1E6BCDF68;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __66__ANAnnouncementCoordinator_Playback__playbackStateForEndpointID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackManagers];
  uint64_t v3 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  id v6 = [v2 objectForKeyedSubscript:v3];

  if (v6) {
    uint64_t v4 = [v6 playbackState];
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  return MEMORY[0x1F41817F8]();
}

- (void)setPlaybackStartedForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ANAnnouncementCoordinator_Playback__setPlaybackStartedForAnnouncement_endpointID___block_invoke;
  block[3] = &unk_1E6BCDF90;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __84__ANAnnouncementCoordinator_Playback__setPlaybackStartedForAnnouncement_endpointID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackManagers];
  uint64_t v3 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  [v4 updatePlaybackForAnnouncementID:*(void *)(a1 + 48) options:1];
}

- (void)setPlaybackStoppedForAnnouncement:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ANAnnouncementCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ANAnnouncementCoordinator_Playback__setPlaybackStoppedForAnnouncement_endpointID___block_invoke;
  block[3] = &unk_1E6BCDF90;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __84__ANAnnouncementCoordinator_Playback__setPlaybackStoppedForAnnouncement_endpointID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackManagers];
  uint64_t v3 = [*(id *)(a1 + 32) resolveIdentifier:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  [v4 updatePlaybackForAnnouncementID:*(void *)(a1 + 48) options:12];
}

- (void)pauseAllTimersForEndpointID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v6 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 pauseAllTimers];
}

- (void)resumeAllTimersForEndpointID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v6 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 resumeAllTimers];
}

- (void)resetAllTimersForEndpointID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementCoordinator *)self announcementManagers];
  id v6 = [(ANAnnouncementCoordinator *)self resolveIdentifier:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 resetAllTimers];
}

- (id)resolveIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  }
  id v6 = v5;

  return v6;
}

@end