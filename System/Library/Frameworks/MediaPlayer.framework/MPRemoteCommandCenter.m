@interface MPRemoteCommandCenter
+ (MPRemoteCommandCenter)sharedCommandCenter;
+ (id)commandCenterForPlayerID:(id)a3;
+ (id)commandCenterForPlayerPath:(id)a3;
+ (void)getPendingCommandTypesWithCompletion:(id)a3;
+ (void)updateLaunchCommandsWithConfigurationHandler:(id)a3;
- (BOOL)canBeNowPlayingApplication;
- (BOOL)commandHandlersRegistered;
- (BOOL)containsCommand:(id)a3;
- (BOOL)disableAutomaticCanBeNowPlaying;
- (BOOL)isInvalidated;
- (BOOL)wantsSerializedEventDelivery;
- (MPAdvanceRepeatModeCommand)advanceRepeatModeCommand;
- (MPAdvanceShuffleModeCommand)advanceShuffleModeCommand;
- (MPChangePlaybackPositionCommand)changePlaybackPositionCommand;
- (MPChangePlaybackRateCommand)changePlaybackRateCommand;
- (MPChangeQueueEndActionCommand)changeQueueEndActionCommand;
- (MPChangeRepeatModeCommand)changeRepeatModeCommand;
- (MPChangeShuffleModeCommand)changeShuffleModeCommand;
- (MPFeedbackCommand)addItemToLibraryCommand;
- (MPFeedbackCommand)addNowPlayingItemToLibraryCommand;
- (MPFeedbackCommand)bookmarkCommand;
- (MPFeedbackCommand)dislikeCommand;
- (MPFeedbackCommand)likeCommand;
- (MPInsertIntoPlaybackQueueCommand)insertIntoPlaybackQueueCommand;
- (MPPreloadPlaybackSessionCommand)preloadPlaybackSessionCommand;
- (MPPrepareForSetPlaybackQueueCommand)prepareForSetPlaybackQueueCommand;
- (MPRatingCommand)ratingCommand;
- (MPRemoteCommand)clearUpNextCommand;
- (MPRemoteCommand)createRadioStationCommand;
- (MPRemoteCommand)disableLanguageOptionCommand;
- (MPRemoteCommand)discardPlaybackSessionCommand;
- (MPRemoteCommand)enableLanguageOptionCommand;
- (MPRemoteCommand)leaveSharedPlaybackSessionCommand;
- (MPRemoteCommand)nextTrackCommand;
- (MPRemoteCommand)pauseCommand;
- (MPRemoteCommand)performDialogActionCommand;
- (MPRemoteCommand)playCommand;
- (MPRemoteCommand)playItemInQueueCommand;
- (MPRemoteCommand)postEventNoticeCommand;
- (MPRemoteCommand)prepareVocalsControlCommand;
- (MPRemoteCommand)previousTrackCommand;
- (MPRemoteCommand)removeFromPlaybackQueueCommand;
- (MPRemoteCommand)reshuffleCommand;
- (MPRemoteCommand)seekBackwardCommand;
- (MPRemoteCommand)seekForwardCommand;
- (MPRemoteCommand)specialSeekBackwardCommand;
- (MPRemoteCommand)specialSeekForwardCommand;
- (MPRemoteCommand)stopCommand;
- (MPRemoteCommand)togglePlayPauseCommand;
- (MPRemoteCommandCenter)initWithPlayerID:(id)a3;
- (MPRemoteCommandCenter)initWithPlayerPath:(id)a3;
- (MPRemoteCommandCenterDelegate)delegate;
- (MPReorderQueueCommand)reorderQueueCommand;
- (MPSetPlaybackQueueCommand)setPlaybackQueueCommand;
- (MPSetPlaybackSessionCommand)setPlaybackSessionCommand;
- (MPSetPriorityForPlaybackSessionCommand)setPriorityForPlaybackSessionCommand;
- (MPSetSleepTimerCommand)setSleepTimerCommand;
- (MPSkipIntervalCommand)skipBackwardCommand;
- (MPSkipIntervalCommand)skipForwardCommand;
- (MPVocalsControlCommand)vocalsControlCommand;
- (MRPlayerPath)playerPath;
- (NSString)playerID;
- (id)_activeCommands;
- (id)_createRemoteCommandWithConcreteClass:(Class)a3 mediaRemoteType:(unsigned int)a4;
- (id)_debugCommandDescriptions;
- (id)_stateDictionary;
- (void)_commandTargetsDidChangeNotification:(id)a3;
- (void)_flushEventQueue;
- (void)_locked_updateCanBeNowPlayingApplicationIfNeeded;
- (void)_pushMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completion:(id)a5;
- (void)_scheduleSupportedCommandsChanged:(BOOL)a3;
- (void)_startMediaRemoteSync;
- (void)_stopMediaRemoteSync;
- (void)dealloc;
- (void)dispatchCommandEvent:(id)a3 completion:(id)a4;
- (void)getPendingCommandTypesWithCompletion:(id)a3;
- (void)invalidate;
- (void)remoteCommandDidMutatePropagatableProperty:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3;
- (void)setWantsSerializedEventDelivery:(BOOL)a3;
@end

@implementation MPRemoteCommandCenter

- (id)_createRemoteCommandWithConcreteClass:(Class)a3 mediaRemoteType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = NSStringFromClass(a3);
    [v12 handleFailureInMethod:a2, self, @"MPRemoteCommandCenter.m", 488, @"Attempted to create remote command object of unknown class %@", v13 object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  activeCommands = self->_activeCommands;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__MPRemoteCommandCenter__createRemoteCommandWithConcreteClass_mediaRemoteType___block_invoke;
  v14[3] = &__block_descriptor_44_e32_B32__0__MPRemoteCommand_8Q16_B24lu32l8;
  v14[4] = a3;
  int v15 = v4;
  uint64_t v9 = [(NSMutableArray *)activeCommands indexOfObjectPassingTest:v14];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)[[a3 alloc] initWithMediaRemoteCommandType:v4];
    [v10 setCommandCenter:self];
    [(NSMutableArray *)self->_activeCommands addObject:v10];
  }
  else
  {
    v10 = [(NSMutableArray *)self->_activeCommands objectAtIndex:v9];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

uint64_t __70__MPRemoteCommandCenter_updateLaunchCommandsWithConfigurationHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 commandInfoRepresentations];
}

id __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSupported])
  {
    v3 = [v2 commandInfoRepresentations];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

id __50__MPRemoteCommandCenter__debugCommandDescriptions__block_invoke(uint64_t a1, void *a2)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v15[0] = @"commandType";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "mediaRemoteCommandType"));
  v16[0] = v4;
  v15[1] = @"supported";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isSupported"));
  v16[1] = v5;
  v15[2] = @"enabled";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isEnabled"));
  v16[2] = v6;
  v15[3] = @"options";
  uint64_t v7 = [v2 _mediaRemoteCommandInfoOptions];
  v8 = (void *)v7;
  uint64_t v9 = MEMORY[0x1E4F1CC08];
  if (v7) {
    uint64_t v9 = v7;
  }
  v16[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v11 = [v3 dictionaryWithDictionary:v10];

  if (([v2 isSupported] & 1) == 0)
  {
    v12 = [v2 unsupportedReasons];
    [v11 setObject:v12 forKeyedSubscript:@"unsupportedReasons"];
  }
  if (([v2 isEnabled] & 1) == 0)
  {
    v13 = [v2 disabledReasons];
    [v11 setObject:v13 forKeyedSubscript:@"disabledReasons"];
  }

  return v11;
}

BOOL __79__MPRemoteCommandCenter__createRemoteCommandWithConcreteClass_mediaRemoteType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_class() == *(void *)(a1 + 32)
    && [v3 mediaRemoteCommandType] == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __40__MPRemoteCommandCenter__activeCommands__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 mediaRemoteCommandType];
  unsigned int v5 = [v4 mediaRemoteCommandType];

  return a2 < v5;
}

uint64_t __73__MPRemoteCommandCenter__locked_updateCanBeNowPlayingApplicationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[5];
    v6 = [v4 _activeCommands];
    v8[0] = 67109634;
    v8[1] = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[RCC] _updateCanBeNowPlayingApplicationIfNeeded: canBeNowPlayingApplication=%{BOOL}u playerPath=%{public}@ commands=%{public}@", (uint8_t *)v8, 0x1Cu);
  }
  return MRMediaRemoteSetCanBeNowPlayingForPlayer();
}

- (id)_debugCommandDescriptions
{
  id v2 = [(MPRemoteCommandCenter *)self _activeCommands];
  int v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_72_36526);

  return v3;
}

+ (void)updateLaunchCommandsWithConfigurationHandler:(id)a3
{
  uint64_t v7 = (void (**)(id, _MPRemoteLaunchCommandCenter *))a3;
  int v3 = (void *)MEMORY[0x19971DE60]();
  id v4 = [(MPRemoteCommandCenter *)[_MPRemoteLaunchCommandCenter alloc] initWithPlayerID:@"LaunchCommandBuilder"];
  v7[2](v7, v4);
  uint64_t v5 = [(MPRemoteCommandCenter *)v4 _activeCommands];
  v6 = objc_msgSend(v5, "msv_flatMap:", &__block_literal_global_36620);
  MRMediaRemoteSetDefaultSupportedCommands();
}

void __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    id v2 = *(unsigned char **)(a1 + 32);
    if (v2[32])
    {
      int v3 = [v2 _activeCommands];
      id v4 = objc_msgSend(v3, "msv_flatMap:", &__block_literal_global_104_36507);
      uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_opt_class();
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 40);
        int v10 = 138413058;
        __int16 v11 = v6;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2114;
        v17 = v4;
        id v9 = v6;
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> [MPRemoteCommandCenter] setSupportedCommands %{public}@", (uint8_t *)&v10, 0x2Au);
      }
      MRMediaRemoteSetSupportedCommandsForPlayer();
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    }
  }
}

- (void)dealloc
{
  MEMORY[0x19971B730](self->_stateHandler, a2);
  [(MPRemoteCommandCenter *)self _stopMediaRemoteSync];
  if (![(MPRemoteCommandCenter *)self isInvalidated])
  {
    int v3 = +[MPNowPlayingInfoCenter infoCenterForPlayerPath:self->_playerPath];
    if (!v3) {
      MRMediaRemoteRemovePlayer();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MPRemoteCommandCenter;
  [(MPRemoteCommandCenter *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MPRemoteCommandCenter *)self _stopMediaRemoteSync];
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
  int v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = objc_opt_class();
    playerPath = self->_playerPath;
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = playerPath;
    id v6 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> invalidated", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v7 = objc_opt_class();
  objc_sync_enter(v7);
  [(id)__commandCenterMap removeObjectForKey:self->_playerPath];
  objc_sync_exit(v7);
}

- (MPRemoteCommandCenter)initWithPlayerID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F770A8]) initWithIdentifier:v4 displayName:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F770A8] defaultPlayer];
  }
  id v6 = (void *)v5;
  id v7 = objc_alloc(MEMORY[0x1E4F770B0]);
  int v8 = [MEMORY[0x1E4F77098] localOrigin];
  id v9 = [MEMORY[0x1E4F76FE8] localClient];
  __int16 v10 = (void *)[v7 initWithOrigin:v8 client:v9 player:v6];

  __int16 v11 = [(MPRemoteCommandCenter *)self initWithPlayerPath:v10];
  return v11;
}

- (MPRemoteCommandCenter)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPRemoteCommandCenter;
  id v6 = [(MPRemoteCommandCenter *)&v21 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke;
  block[3] = &unk_1E57F9EA8;
  int v8 = v6;
  v20 = v8;
  if (initWithPlayerPath__onceToken_36598 != -1)
  {
    dispatch_once(&initWithPlayerPath__onceToken_36598, block);
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    id v5 = [MEMORY[0x1E4F770B0] localPlayerPath];
  }
LABEL_5:
  uint64_t v9 = [v5 copy];
  playerPath = v8->_playerPath;
  v8->_playerPath = (MRPlayerPath *)v9;

  __int16 v11 = [(id)objc_opt_class() commandCenterForPlayerPath:v8->_playerPath];

  if (v11)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v8, @"MPRemoteCommandCenter.m", 121, @"Cannot have two MPRemoteCommandCenters for the same playerPath: %@", v5 object file lineNumber description];
  }
  __int16 v12 = objc_opt_class();
  objc_sync_enter(v12);
  [(id)__commandCenterMap setObject:v8 forKey:v8->_playerPath];
  objc_sync_exit(v12);

  v8->_lock._os_unfair_lock_opaque = 0;
  uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  activeCommands = v8->_activeCommands;
  v8->_activeCommands = v13;

  [(MPRemoteCommandCenter *)v8 _startMediaRemoteSync];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2;
  v17[3] = &unk_1E57F6298;
  uint64_t v18 = v8;
  v18->_stateHandler = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2((uint64_t)v17);

LABEL_8:
  return v7;
}

uint64_t __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = dispatch_get_global_queue(0, 0);
  int v3 = [*(id *)(*(void *)(a1 + 32) + 40) description];
  id v4 = [@"MPRemoteCommandCenter:" stringByAppendingString:v3];
  objc_copyWeak(&v7, &location);
  uint64_t v5 = MSVLogAddStateHandler();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v5;
}

+ (id)commandCenterForPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  uint64_t v5 = [(id)__commandCenterMap objectForKey:v3];
  objc_sync_exit(v4);

  return v5;
}

- (void)_startMediaRemoteSync
{
  if (!self->_mediaRemoteCommandHandler)
  {
    objc_initWeak(&location, self);
    id v3 = [MEMORY[0x1E4F1CA48] array];
    eventQueue = self->_eventQueue;
    self->_eventQueue = v3;

    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    __int16 v10 = __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke;
    __int16 v11 = &unk_1E57F5688;
    objc_copyWeak(&v12, &location);
    uint64_t v5 = MRMediaRemoteAddCommandHandlerForPlayer();
    id mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
    self->_id mediaRemoteCommandHandler = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v8, v9, v10, v11);
  [v7 addObserver:self selector:sel__commandTargetsDidChangeNotification_ name:@"MPRemoteCommandTargetsDidChangeNotification" object:0];
}

- (void)_commandTargetsDidChangeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(MPRemoteCommandCenter *)self isInvalidated])
  {
    [(MPRemoteCommandCenter *)self _activeCommands];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * v8) hasTargets])
          {
            int v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v9 = 0;
LABEL_12:

    os_unfair_lock_lock(&self->_lock);
    int commandHandlersRegistered = self->_commandHandlersRegistered;
    if (commandHandlersRegistered != v9)
    {
      self->_int commandHandlersRegistered = v9;
      [(MPRemoteCommandCenter *)self _locked_updateCanBeNowPlayingApplicationIfNeeded];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MPRemoteCommandCenter__commandTargetsDidChangeNotification___block_invoke;
      block[3] = &unk_1E57F9EA8;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    os_unfair_lock_unlock(&self->_lock);
    [(MPRemoteCommandCenter *)self _scheduleSupportedCommandsChanged:commandHandlersRegistered != v9];
  }
}

- (void)_scheduleSupportedCommandsChanged:(BOOL)a3
{
  if (!self->_scheduledSupportedCommandsChangedNotification || a3)
  {
    BOOL v4 = a3;
    self->_scheduledSupportedCommandsChangedNotification = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke;
    v8[3] = &unk_1E57F9EA8;
    v8[4] = self;
    uint64_t v5 = (void *)MEMORY[0x19971E0F0](v8, a2);
    if (v4)
    {
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
    else
    {
      int64_t v6 = 200000000;
      if ((MSVDeviceIsWatch() & 1) == 0 && !MSVDeviceIsAudioAccessory()) {
        int64_t v6 = 100000000;
      }
      dispatch_time_t v7 = dispatch_time(0, v6);
      dispatch_after(v7, MEMORY[0x1E4F14428], v5);
    }
  }
}

- (void)remoteCommandDidMutatePropagatableProperty:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MPRemoteCommandCenter *)self isInvalidated])
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int64_t v6 = objc_opt_class();
      playerPath = self->_playerPath;
      int v9 = 138413058;
      __int16 v10 = v6;
      __int16 v11 = 2048;
      long long v12 = self;
      __int16 v13 = 2112;
      long long v14 = playerPath;
      __int16 v15 = 2112;
      id v16 = v4;
      id v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "<%@: %p (%@)> property mutated after invalidated: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  else
  {
    [(MPRemoteCommandCenter *)self _scheduleSupportedCommandsChanged:0];
  }
}

- (BOOL)isInvalidated
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_activeCommands
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_activeCommands copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_64];

  return v5;
}

- (void)_locked_updateCanBeNowPlayingApplicationIfNeeded
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_invalidated)
  {
    BOOL commandHandlersRegistered = self->_commandHandlersRegistered;
    if (self->_commandHandlersRegistered) {
      BOOL commandHandlersRegistered = !self->_disableAutomaticCanBeNowPlaying;
    }
    if (self->_canBeNowPlayingApplication != commandHandlersRegistered)
    {
      self->_canBeNowPlayingApplication = commandHandlersRegistered;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __73__MPRemoteCommandCenter__locked_updateCanBeNowPlayingApplicationIfNeeded__block_invoke;
      v4[3] = &unk_1E57F9E08;
      BOOL v5 = commandHandlersRegistered;
      v4[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
}

- (void)setWantsSerializedEventDelivery:(BOOL)a3
{
  self->_wantsSerializedEventDelivery = a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MPRemoteCommand)specialSeekBackwardCommand
{
  specialSeekBackwardCommand = self->_specialSeekBackwardCommand;
  if (!specialSeekBackwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:110];
    BOOL v5 = self->_specialSeekBackwardCommand;
    self->_specialSeekBackwardCommand = v4;

    specialSeekBackwardCommand = self->_specialSeekBackwardCommand;
  }

  return specialSeekBackwardCommand;
}

- (MPRemoteCommand)specialSeekForwardCommand
{
  specialSeekForwardCommand = self->_specialSeekForwardCommand;
  if (!specialSeekForwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:109];
    BOOL v5 = self->_specialSeekForwardCommand;
    self->_specialSeekForwardCommand = v4;

    specialSeekForwardCommand = self->_specialSeekForwardCommand;
  }

  return specialSeekForwardCommand;
}

- (MPFeedbackCommand)dislikeCommand
{
  dislikeCommand = self->_dislikeCommand;
  if (!dislikeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:22];
    BOOL v5 = self->_dislikeCommand;
    self->_dislikeCommand = v4;

    dislikeCommand = self->_dislikeCommand;
  }

  return dislikeCommand;
}

- (MPRatingCommand)ratingCommand
{
  ratingCommand = self->_ratingCommand;
  if (!ratingCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:20];
    BOOL v5 = self->_ratingCommand;
    self->_ratingCommand = v4;

    ratingCommand = self->_ratingCommand;
  }

  return ratingCommand;
}

- (MPFeedbackCommand)addNowPlayingItemToLibraryCommand
{
  addNowPlayingItemToLibraryCommand = self->_addNowPlayingItemToLibraryCommand;
  if (!addNowPlayingItemToLibraryCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:127];
    BOOL v5 = self->_addNowPlayingItemToLibraryCommand;
    self->_addNowPlayingItemToLibraryCommand = v4;

    addNowPlayingItemToLibraryCommand = self->_addNowPlayingItemToLibraryCommand;
  }

  return addNowPlayingItemToLibraryCommand;
}

- (MPRemoteCommand)createRadioStationCommand
{
  createRadioStationCommand = self->_createRadioStationCommand;
  if (!createRadioStationCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:121];
    BOOL v5 = self->_createRadioStationCommand;
    self->_createRadioStationCommand = v4;

    createRadioStationCommand = self->_createRadioStationCommand;
  }

  return createRadioStationCommand;
}

- (MPRemoteCommand)prepareVocalsControlCommand
{
  prepareVocalsControlCommand = self->_prepareVocalsControlCommand;
  if (!prepareVocalsControlCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:143];
    BOOL v5 = self->_prepareVocalsControlCommand;
    self->_prepareVocalsControlCommand = v4;

    prepareVocalsControlCommand = self->_prepareVocalsControlCommand;
  }

  return prepareVocalsControlCommand;
}

- (MPAdvanceRepeatModeCommand)advanceRepeatModeCommand
{
  advanceRepeatModeCommand = self->_advanceRepeatModeCommand;
  if (!advanceRepeatModeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:7];
    BOOL v5 = self->_advanceRepeatModeCommand;
    self->_advanceRepeatModeCommand = v4;

    advanceRepeatModeCommand = self->_advanceRepeatModeCommand;
  }

  return advanceRepeatModeCommand;
}

- (MPSetSleepTimerCommand)setSleepTimerCommand
{
  setSleepTimerCommand = self->_setSleepTimerCommand;
  if (!setSleepTimerCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:124];
    BOOL v5 = self->_setSleepTimerCommand;
    self->_setSleepTimerCommand = v4;

    setSleepTimerCommand = self->_setSleepTimerCommand;
  }

  return setSleepTimerCommand;
}

- (MPChangeShuffleModeCommand)changeShuffleModeCommand
{
  changeShuffleModeCommand = self->_changeShuffleModeCommand;
  if (!changeShuffleModeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:26];
    BOOL v5 = self->_changeShuffleModeCommand;
    self->_changeShuffleModeCommand = v4;

    changeShuffleModeCommand = self->_changeShuffleModeCommand;
  }

  return changeShuffleModeCommand;
}

- (MPRemoteCommand)clearUpNextCommand
{
  clearUpNextCommand = self->_clearUpNextCommand;
  if (!clearUpNextCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:144];
    BOOL v5 = self->_clearUpNextCommand;
    self->_clearUpNextCommand = v4;

    clearUpNextCommand = self->_clearUpNextCommand;
  }

  return clearUpNextCommand;
}

- (MPFeedbackCommand)likeCommand
{
  likeCommand = self->_likeCommand;
  if (!likeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:21];
    BOOL v5 = self->_likeCommand;
    self->_likeCommand = v4;

    likeCommand = self->_likeCommand;
  }

  return likeCommand;
}

- (MPAdvanceShuffleModeCommand)advanceShuffleModeCommand
{
  advanceShuffleModeCommand = self->_advanceShuffleModeCommand;
  if (!advanceShuffleModeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:6];
    BOOL v5 = self->_advanceShuffleModeCommand;
    self->_advanceShuffleModeCommand = v4;

    advanceShuffleModeCommand = self->_advanceShuffleModeCommand;
  }

  return advanceShuffleModeCommand;
}

- (MPInsertIntoPlaybackQueueCommand)insertIntoPlaybackQueueCommand
{
  insertIntoPlaybackQueueCommand = self->_insertIntoPlaybackQueueCommand;
  if (!insertIntoPlaybackQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:125];
    BOOL v5 = self->_insertIntoPlaybackQueueCommand;
    self->_insertIntoPlaybackQueueCommand = v4;

    insertIntoPlaybackQueueCommand = self->_insertIntoPlaybackQueueCommand;
  }

  return insertIntoPlaybackQueueCommand;
}

- (MPRemoteCommand)leaveSharedPlaybackSessionCommand
{
  leaveSharedPlaybackSessionCommand = self->_leaveSharedPlaybackSessionCommand;
  if (!leaveSharedPlaybackSessionCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:139];
    BOOL v5 = self->_leaveSharedPlaybackSessionCommand;
    self->_leaveSharedPlaybackSessionCommand = v4;

    leaveSharedPlaybackSessionCommand = self->_leaveSharedPlaybackSessionCommand;
  }

  return leaveSharedPlaybackSessionCommand;
}

- (MPFeedbackCommand)addItemToLibraryCommand
{
  addItemToLibraryCommand = self->_addItemToLibraryCommand;
  if (!addItemToLibraryCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:128];
    BOOL v5 = self->_addItemToLibraryCommand;
    self->_addItemToLibraryCommand = v4;

    addItemToLibraryCommand = self->_addItemToLibraryCommand;
  }

  return addItemToLibraryCommand;
}

- (MPVocalsControlCommand)vocalsControlCommand
{
  vocalsControlCommand = self->_vocalsControlCommand;
  if (!vocalsControlCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:142];
    BOOL v5 = self->_vocalsControlCommand;
    self->_vocalsControlCommand = v4;

    vocalsControlCommand = self->_vocalsControlCommand;
  }

  return vocalsControlCommand;
}

- (MPChangeQueueEndActionCommand)changeQueueEndActionCommand
{
  changeQueueEndActionCommand = self->_changeQueueEndActionCommand;
  if (!changeQueueEndActionCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:135];
    BOOL v5 = self->_changeQueueEndActionCommand;
    self->_changeQueueEndActionCommand = v4;

    changeQueueEndActionCommand = self->_changeQueueEndActionCommand;
  }

  return changeQueueEndActionCommand;
}

- (MPReorderQueueCommand)reorderQueueCommand
{
  reorderQueueCommand = self->_reorderQueueCommand;
  if (!reorderQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:130];
    BOOL v5 = self->_reorderQueueCommand;
    self->_reorderQueueCommand = v4;

    reorderQueueCommand = self->_reorderQueueCommand;
  }

  return reorderQueueCommand;
}

- (MPChangeRepeatModeCommand)changeRepeatModeCommand
{
  changeRepeatModeCommand = self->_changeRepeatModeCommand;
  if (!changeRepeatModeCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:25];
    BOOL v5 = self->_changeRepeatModeCommand;
    self->_changeRepeatModeCommand = v4;

    changeRepeatModeCommand = self->_changeRepeatModeCommand;
  }

  return changeRepeatModeCommand;
}

- (MPRemoteCommand)reshuffleCommand
{
  reshuffleCommand = self->_reshuffleCommand;
  if (!reshuffleCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:134];
    BOOL v5 = self->_reshuffleCommand;
    self->_reshuffleCommand = v4;

    reshuffleCommand = self->_reshuffleCommand;
  }

  return reshuffleCommand;
}

- (MPRemoteCommand)removeFromPlaybackQueueCommand
{
  removeFromPlaybackQueueCommand = self->_removeFromPlaybackQueueCommand;
  if (!removeFromPlaybackQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:129];
    BOOL v5 = self->_removeFromPlaybackQueueCommand;
    self->_removeFromPlaybackQueueCommand = v4;

    removeFromPlaybackQueueCommand = self->_removeFromPlaybackQueueCommand;
  }

  return removeFromPlaybackQueueCommand;
}

- (MPChangePlaybackPositionCommand)changePlaybackPositionCommand
{
  changePlaybackPositionCommand = self->_changePlaybackPositionCommand;
  if (!changePlaybackPositionCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:24];
    BOOL v5 = self->_changePlaybackPositionCommand;
    self->_changePlaybackPositionCommand = v4;

    changePlaybackPositionCommand = self->_changePlaybackPositionCommand;
  }

  return changePlaybackPositionCommand;
}

- (MPSkipIntervalCommand)skipBackwardCommand
{
  skipBackwardCommand = self->_skipBackwardCommand;
  if (!skipBackwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:18];
    BOOL v5 = self->_skipBackwardCommand;
    self->_skipBackwardCommand = v4;

    skipBackwardCommand = self->_skipBackwardCommand;
  }

  return skipBackwardCommand;
}

- (MPRemoteCommand)playItemInQueueCommand
{
  playItemInQueueCommand = self->_playItemInQueueCommand;
  if (!playItemInQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:131];
    BOOL v5 = self->_playItemInQueueCommand;
    self->_playItemInQueueCommand = v4;

    playItemInQueueCommand = self->_playItemInQueueCommand;
  }

  return playItemInQueueCommand;
}

- (MPRemoteCommand)pauseCommand
{
  pauseCommand = self->_pauseCommand;
  if (!pauseCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:1];
    BOOL v5 = self->_pauseCommand;
    self->_pauseCommand = v4;

    pauseCommand = self->_pauseCommand;
  }

  return pauseCommand;
}

- (MPRemoteCommand)previousTrackCommand
{
  previousTrackCommand = self->_previousTrackCommand;
  if (!previousTrackCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:5];
    BOOL v5 = self->_previousTrackCommand;
    self->_previousTrackCommand = v4;

    previousTrackCommand = self->_previousTrackCommand;
  }

  return previousTrackCommand;
}

- (MPRemoteCommand)togglePlayPauseCommand
{
  togglePlayPauseCommand = self->_togglePlayPauseCommand;
  if (!togglePlayPauseCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:2];
    BOOL v5 = self->_togglePlayPauseCommand;
    self->_togglePlayPauseCommand = v4;

    togglePlayPauseCommand = self->_togglePlayPauseCommand;
  }

  return togglePlayPauseCommand;
}

- (MPChangePlaybackRateCommand)changePlaybackRateCommand
{
  changePlaybackRateCommand = self->_changePlaybackRateCommand;
  if (!changePlaybackRateCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:19];
    BOOL v5 = self->_changePlaybackRateCommand;
    self->_changePlaybackRateCommand = v4;

    changePlaybackRateCommand = self->_changePlaybackRateCommand;
  }

  return changePlaybackRateCommand;
}

- (MPRemoteCommand)seekForwardCommand
{
  seekForwardCommand = self->_seekForwardCommand;
  if (!seekForwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:8];
    BOOL v5 = self->_seekForwardCommand;
    self->_seekForwardCommand = v4;

    seekForwardCommand = self->_seekForwardCommand;
  }

  return seekForwardCommand;
}

- (MPRemoteCommand)stopCommand
{
  stopCommand = self->_stopCommand;
  if (!stopCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:3];
    BOOL v5 = self->_stopCommand;
    self->_stopCommand = v4;

    stopCommand = self->_stopCommand;
  }

  return stopCommand;
}

- (MPRemoteCommand)seekBackwardCommand
{
  seekBackwardCommand = self->_seekBackwardCommand;
  if (!seekBackwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:10];
    BOOL v5 = self->_seekBackwardCommand;
    self->_seekBackwardCommand = v4;

    seekBackwardCommand = self->_seekBackwardCommand;
  }

  return seekBackwardCommand;
}

- (MPSkipIntervalCommand)skipForwardCommand
{
  skipForwardCommand = self->_skipForwardCommand;
  if (!skipForwardCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:17];
    BOOL v5 = self->_skipForwardCommand;
    self->_skipForwardCommand = v4;

    skipForwardCommand = self->_skipForwardCommand;
  }

  return skipForwardCommand;
}

- (MPRemoteCommand)nextTrackCommand
{
  nextTrackCommand = self->_nextTrackCommand;
  if (!nextTrackCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:4];
    BOOL v5 = self->_nextTrackCommand;
    self->_nextTrackCommand = v4;

    nextTrackCommand = self->_nextTrackCommand;
  }

  return nextTrackCommand;
}

- (MPPreloadPlaybackSessionCommand)preloadPlaybackSessionCommand
{
  preloadPlaybackSessionCommand = self->_preloadPlaybackSessionCommand;
  if (!preloadPlaybackSessionCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:136];
    BOOL v5 = self->_preloadPlaybackSessionCommand;
    self->_preloadPlaybackSessionCommand = v4;

    preloadPlaybackSessionCommand = self->_preloadPlaybackSessionCommand;
  }

  return preloadPlaybackSessionCommand;
}

- (MPPrepareForSetPlaybackQueueCommand)prepareForSetPlaybackQueueCommand
{
  prepareForSetPlaybackQueueCommand = self->_prepareForSetPlaybackQueueCommand;
  if (!prepareForSetPlaybackQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:132];
    BOOL v5 = self->_prepareForSetPlaybackQueueCommand;
    self->_prepareForSetPlaybackQueueCommand = v4;

    prepareForSetPlaybackQueueCommand = self->_prepareForSetPlaybackQueueCommand;
  }

  return prepareForSetPlaybackQueueCommand;
}

- (MPSetPlaybackSessionCommand)setPlaybackSessionCommand
{
  setPlaybackSessionCommand = self->_setPlaybackSessionCommand;
  if (!setPlaybackSessionCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:133];
    BOOL v5 = self->_setPlaybackSessionCommand;
    self->_setPlaybackSessionCommand = v4;

    setPlaybackSessionCommand = self->_setPlaybackSessionCommand;
  }

  return setPlaybackSessionCommand;
}

- (MPRemoteCommand)playCommand
{
  playCommand = self->_playCommand;
  if (!playCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:0];
    BOOL v5 = self->_playCommand;
    self->_playCommand = v4;

    playCommand = self->_playCommand;
  }

  return playCommand;
}

- (MPSetPlaybackQueueCommand)setPlaybackQueueCommand
{
  setPlaybackQueueCommand = self->_setPlaybackQueueCommand;
  if (!setPlaybackQueueCommand)
  {
    id v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:122];
    BOOL v5 = self->_setPlaybackQueueCommand;
    self->_setPlaybackQueueCommand = v4;

    setPlaybackQueueCommand = self->_setPlaybackQueueCommand;
  }

  return setPlaybackQueueCommand;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)commandHandlersRegistered
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_commandHandlersRegistered;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __62__MPRemoteCommandCenter__commandTargetsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPRemoteCommandCenterCommandHandlersRegisteredNotification" object:*(void *)(a1 + 32) userInfo:0];
}

+ (MPRemoteCommandCenter)sharedCommandCenter
{
  if (sharedCommandCenter___once != -1) {
    dispatch_once(&sharedCommandCenter___once, &__block_literal_global_10);
  }
  id v2 = (void *)sharedCommandCenter___sharedCommandCenter;

  return (MPRemoteCommandCenter *)v2;
}

void __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke()
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)__commandCenterMap;
  __commandCenterMap = v0;

  objc_sync_exit(obj);
}

void __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = objc_msgSend(v2, "msv_description");
      int v5 = 138543362;
      int64_t v6 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Error setting supported commands error=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __70__MPRemoteCommandCenter_updateLaunchCommandsWithConfigurationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = objc_msgSend(v2, "msv_description");
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Updated launch commands error=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Updated launch commands", (uint8_t *)&v6, 2u);
  }
}

+ (void)getPendingCommandTypesWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = (void *)MRMediaRemoteCopyPendingCommands();
  v3[2](v3, v4, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearUpNextCommand, 0);
  objc_storeStrong((id *)&self->_setSleepTimerCommand, 0);
  objc_storeStrong((id *)&self->_vocalsControlCommand, 0);
  objc_storeStrong((id *)&self->_prepareVocalsControlCommand, 0);
  objc_storeStrong((id *)&self->_postEventNoticeCommand, 0);
  objc_storeStrong((id *)&self->_leaveSharedPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_changeQueueEndActionCommand, 0);
  objc_storeStrong((id *)&self->_reshuffleCommand, 0);
  objc_storeStrong((id *)&self->_discardPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_setPriorityForPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_preloadPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_setPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_addItemToLibraryCommand, 0);
  objc_storeStrong((id *)&self->_addNowPlayingItemToLibraryCommand, 0);
  objc_storeStrong((id *)&self->_playItemInQueueCommand, 0);
  objc_storeStrong((id *)&self->_reorderQueueCommand, 0);
  objc_storeStrong((id *)&self->_removeFromPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_insertIntoPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_prepareForSetPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_setPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_createRadioStationCommand, 0);
  objc_storeStrong((id *)&self->_advanceRepeatModeCommand, 0);
  objc_storeStrong((id *)&self->_advanceShuffleModeCommand, 0);
  objc_storeStrong((id *)&self->_specialSeekBackwardCommand, 0);
  objc_storeStrong((id *)&self->_specialSeekForwardCommand, 0);
  objc_storeStrong((id *)&self->_changeShuffleModeCommand, 0);
  objc_storeStrong((id *)&self->_changeRepeatModeCommand, 0);
  objc_storeStrong((id *)&self->_changePlaybackPositionCommand, 0);
  objc_storeStrong((id *)&self->_bookmarkCommand, 0);
  objc_storeStrong((id *)&self->_dislikeCommand, 0);
  objc_storeStrong((id *)&self->_likeCommand, 0);
  objc_storeStrong((id *)&self->_changePlaybackRateCommand, 0);
  objc_storeStrong((id *)&self->_performDialogActionCommand, 0);
  objc_storeStrong((id *)&self->_ratingCommand, 0);
  objc_storeStrong((id *)&self->_seekBackwardCommand, 0);
  objc_storeStrong((id *)&self->_seekForwardCommand, 0);
  objc_storeStrong((id *)&self->_skipBackwardCommand, 0);
  objc_storeStrong((id *)&self->_skipForwardCommand, 0);
  objc_storeStrong((id *)&self->_previousTrackCommand, 0);
  objc_storeStrong((id *)&self->_nextTrackCommand, 0);
  objc_storeStrong((id *)&self->_disableLanguageOptionCommand, 0);
  objc_storeStrong((id *)&self->_enableLanguageOptionCommand, 0);
  objc_storeStrong((id *)&self->_togglePlayPauseCommand, 0);
  objc_storeStrong((id *)&self->_stopCommand, 0);
  objc_storeStrong((id *)&self->_playCommand, 0);
  objc_storeStrong((id *)&self->_pauseCommand, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong(&self->_mediaRemoteCommandHandler, 0);

  objc_storeStrong((id *)&self->_activeCommands, 0);
}

void __44__MPRemoteCommandCenter_sharedCommandCenter__block_invoke()
{
  uint64_t v0 = [[MPRemoteCommandCenter alloc] initWithPlayerID:0];
  v1 = (void *)sharedCommandCenter___sharedCommandCenter;
  sharedCommandCenter___sharedCommandCenter = (uint64_t)v0;
}

uint64_t __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  int v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      int v9 = [WeakRetained _stateDictionary];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MPRemoteCommandCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPRemoteCommandCenterDelegate *)WeakRetained;
}

- (BOOL)wantsSerializedEventDelivery
{
  return self->_wantsSerializedEventDelivery;
}

- (BOOL)disableAutomaticCanBeNowPlaying
{
  return self->_disableAutomaticCanBeNowPlaying;
}

- (void)_stopMediaRemoteSync
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_eventQueue mutableCopy];
  id mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
  if (mediaRemoteCommandHandler)
  {
    if (!self->_invalidated)
    {
      MRMediaRemoteRemoveCommandHandlerBlockForPlayer();
      id mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
    }
    self->_id mediaRemoteCommandHandler = 0;

    eventQueue = self->_eventQueue;
    self->_eventQueue = 0;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:@"MPRemoteCommandTargetsDidChangeNotification" object:0];
  if ([v4 count])
  {
    id v8 = v4;
    msv_dispatch_on_main_queue();
  }
}

void __45__MPRemoteCommandCenter__stopMediaRemoteSync__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) wantsSerializedEventDelivery])
  {
    id v2 = *(void **)(a1 + 40);
    _serializeBlocksOnMainQueue(v2);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_2;
    v10[3] = &unk_1E57F5660;
    id v11 = v8;
    [WeakRetained _pushMediaRemoteCommand:a2 withOptions:v7 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "msv_map:", &__block_literal_global_110);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 mediaRemoteType];
}

- (id)_stateDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9[0] = self->_activeCommands;
  v8[0] = @"activeCommands";
  v8[1] = @"canBeNowPlayingApplication";
  uint64_t v4 = [NSNumber numberWithBool:self->_canBeNowPlayingApplication];
  v9[1] = v4;
  _DWORD v8[2] = @"pendingEventsCount";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventQueue, "count"));
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (BOOL)containsCommand:(id)a3
{
  uint64_t v4 = [a3 commandCenter];
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (MPRemoteCommand)postEventNoticeCommand
{
  postEventNoticeCommand = self->_postEventNoticeCommand;
  if (!postEventNoticeCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:140];
    uint64_t v5 = self->_postEventNoticeCommand;
    self->_postEventNoticeCommand = v4;

    postEventNoticeCommand = self->_postEventNoticeCommand;
  }

  return postEventNoticeCommand;
}

- (MPRemoteCommand)discardPlaybackSessionCommand
{
  discardPlaybackSessionCommand = self->_discardPlaybackSessionCommand;
  if (!discardPlaybackSessionCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:138];
    uint64_t v5 = self->_discardPlaybackSessionCommand;
    self->_discardPlaybackSessionCommand = v4;

    discardPlaybackSessionCommand = self->_discardPlaybackSessionCommand;
  }

  return discardPlaybackSessionCommand;
}

- (MPSetPriorityForPlaybackSessionCommand)setPriorityForPlaybackSessionCommand
{
  setPriorityForPlaybackSessionCommand = self->_setPriorityForPlaybackSessionCommand;
  if (!setPriorityForPlaybackSessionCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:137];
    uint64_t v5 = self->_setPriorityForPlaybackSessionCommand;
    self->_setPriorityForPlaybackSessionCommand = v4;

    setPriorityForPlaybackSessionCommand = self->_setPriorityForPlaybackSessionCommand;
  }

  return setPriorityForPlaybackSessionCommand;
}

- (MPFeedbackCommand)bookmarkCommand
{
  bookmarkCommand = self->_bookmarkCommand;
  if (!bookmarkCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:23];
    uint64_t v5 = self->_bookmarkCommand;
    self->_bookmarkCommand = v4;

    bookmarkCommand = self->_bookmarkCommand;
  }

  return bookmarkCommand;
}

- (MPRemoteCommand)performDialogActionCommand
{
  performDialogActionCommand = self->_performDialogActionCommand;
  if (!performDialogActionCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:145];
    uint64_t v5 = self->_performDialogActionCommand;
    self->_performDialogActionCommand = v4;

    performDialogActionCommand = self->_performDialogActionCommand;
  }

  return performDialogActionCommand;
}

- (MPRemoteCommand)disableLanguageOptionCommand
{
  disableLanguageOptionCommand = self->_disableLanguageOptionCommand;
  if (!disableLanguageOptionCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:28];
    uint64_t v5 = self->_disableLanguageOptionCommand;
    self->_disableLanguageOptionCommand = v4;

    disableLanguageOptionCommand = self->_disableLanguageOptionCommand;
  }

  return disableLanguageOptionCommand;
}

- (MPRemoteCommand)enableLanguageOptionCommand
{
  enableLanguageOptionCommand = self->_enableLanguageOptionCommand;
  if (!enableLanguageOptionCommand)
  {
    uint64_t v4 = [(MPRemoteCommandCenter *)self _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:27];
    uint64_t v5 = self->_enableLanguageOptionCommand;
    self->_enableLanguageOptionCommand = v4;

    enableLanguageOptionCommand = self->_enableLanguageOptionCommand;
  }

  return enableLanguageOptionCommand;
}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_disableAutomaticCanBeNowPlaying = a3;
  [(MPRemoteCommandCenter *)self _locked_updateCanBeNowPlayingApplicationIfNeeded];

  os_unfair_lock_unlock(p_lock);
}

- (void)getPendingCommandTypesWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  MRNowPlayingPlayerPathGetPlayer();
  uint64_t v4 = (void *)MRMediaRemoteCopyPendingCommands();
  v3[2](v3, v4, 0);
}

- (void)_flushEventQueue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v3 = [(MPRemoteCommandCenter *)self wantsSerializedEventDelivery];
  os_unfair_lock_lock(&self->_lock);
  if (v3)
  {
    if (self->_processingEvent
      || ([(NSMutableArray *)self->_eventQueue firstObject],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      id v11 = (void (**)(void, void, void))v10;
      [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
      self->_processingEvent = 1;
      os_unfair_lock_unlock(&self->_lock);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_2;
      v12[3] = &unk_1E57F9EA8;
      v12[4] = self;
      ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
    }
  }
  else
  {
    uint64_t v4 = (void *)[(NSMutableArray *)self->_eventQueue copy];
    [(NSMutableArray *)self->_eventQueue removeAllObjects];
    os_unfair_lock_unlock(&self->_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))();
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_2()
{
  return msv_dispatch_on_main_queue();
}

uint64_t __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = *(void **)(a1 + 32);

  return [v2 _flushEventQueue];
}

- (void)dispatchCommandEvent:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(MPRemoteCommandCenter *)self isInvalidated])
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138413058;
      id v31 = v9;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2112;
      v35 = playerPath;
      __int16 v36 = 2048;
      id v37 = v6;
      id v11 = v9;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: ignoring [command center was invalidated] event=%p", buf, 0x2Au);
    }
LABEL_4:

    v7[2](v7, MEMORY[0x1E4F1CBF0]);
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = objc_opt_class();
      uint64_t v17 = self->_playerPath;
      *(_DWORD *)buf = 138412802;
      id v31 = v16;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v17;
      id v18 = v16;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: received nil commandEvent", buf, 0x20u);
    }
    goto LABEL_4;
  }
  long long v12 = [v6 command];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke;
  v24[3] = &unk_1E57F55B8;
  objc_copyWeak(&v28, &location);
  id v13 = v12;
  id v25 = v13;
  id v14 = v6;
  id v26 = v14;
  v27 = v7;
  long long v15 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v24);
  if ([v13 skipSerializedEventDelivery])
  {
    ((void (**)(void, void, void *))v15)[2](v15, 0, &__block_literal_global_38_36581);
  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (id)objc_opt_class();
      objc_super v21 = [(MPRemoteCommandCenter *)self playerPath];
      *(_DWORD *)buf = 138413314;
      id v31 = v20;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v21;
      __int16 v36 = 2114;
      id v37 = v13;
      __int16 v38 = 2048;
      id v39 = v14;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: enqueue: command=%{public}@ event=%p", buf, 0x34u);
    }
    os_unfair_lock_lock(&self->_lock);
    eventQueue = self->_eventQueue;
    v23 = (void *)MEMORY[0x19971E0F0](v15);
    [(NSMutableArray *)eventQueue addObject:v23];

    os_unfair_lock_unlock(&self->_lock);
    [(MPRemoteCommandCenter *)self _flushEventQueue];
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

LABEL_15:
}

void __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (a2)
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = objc_opt_class();
      id v10 = v9;
      id v11 = [v7 playerPath];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      unint64_t v39 = (unint64_t)v9;
      __int16 v40 = 2048;
      v41 = v7;
      __int16 v42 = 2112;
      v43 = v11;
      __int16 v44 = 2114;
      uint64_t v45 = v12;
      __int16 v46 = 2048;
      uint64_t v47 = v13;
      id v14 = "<%@: %p (%@)> RCC: dispatchCommandEvent: failing [command center stopped] - command=%{public}@ event=%p";
LABEL_8:
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!WeakRetained || [WeakRetained isInvalidated])
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = objc_opt_class();
      id v10 = v15;
      id v11 = [v7 playerPath];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      unint64_t v39 = (unint64_t)v15;
      __int16 v40 = 2048;
      v41 = v7;
      __int16 v42 = 2112;
      v43 = v11;
      __int16 v44 = 2114;
      uint64_t v45 = v16;
      __int16 v46 = 2048;
      uint64_t v47 = v17;
      id v14 = "<%@: %p (%@)> RCC: dispatchCommandEvent: failing [command center was invalidated] - command=%{public}@ event=%p";
      goto LABEL_8;
    }
LABEL_9:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v5[2](v5);
    goto LABEL_10;
  }
  id v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 40));

  id v20 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v21 = objc_opt_class();
    id v22 = v21;
    v23 = [v7 playerPath];
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    unint64_t v39 = (unint64_t)v21;
    __int16 v40 = 2048;
    v41 = v7;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2114;
    uint64_t v45 = v24;
    __int16 v46 = 2048;
    uint64_t v47 = v25;
    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: command=%{public}@ event=%p", buf, 0x34u);
  }
  id v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v27 = v26;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    unsigned int v28 = [*(id *)(a1 + 32) mediaRemoteCommandType];
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = v28;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CommandDispatch", "commandType=%ld", buf, 0xCu);
  }

  v29 = *(void **)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 40);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke_33;
  v32[3] = &unk_1E57F5590;
  id v31 = *(id *)(a1 + 48);
  os_signpost_id_t v37 = v19;
  id v35 = v31;
  v32[4] = v7;
  id v33 = *(id *)(a1 + 32);
  id v34 = *(id *)(a1 + 40);
  __int16 v36 = v5;
  [v29 invokeCommandWithEvent:v30 completion:v32];

LABEL_10:
}

uint64_t __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke_33(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[7] + 16))();
  id v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  BOOL v3 = v2;
  os_signpost_id_t v4 = a1[9];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CommandDispatch", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  id v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    uint64_t v7 = (void *)a1[4];
    id v8 = v6;
    long long v9 = [v7 playerPath];
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    int v13 = 138413314;
    id v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: command finished command=%{public}@ event=%p", (uint8_t *)&v13, 0x34u);
  }
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_pushMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((v6 - 100) > 5)
  {
    if (v6 == 11)
    {
      int v10 = 10;
    }
    else
    {
      int v10 = v6;
      if (v6 == 9) {
        int v10 = 8;
      }
    }
  }
  else if (((1 << (v6 - 100)) & 0x15) != 0)
  {
    int v10 = 109;
  }
  else
  {
    int v10 = 110;
  }
  [(MPRemoteCommandCenter *)self _activeCommands];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v15, "isSupported", (void)v17)
          && v10 == [v15 mediaRemoteCommandType])
        {
          id v12 = v15;
          goto LABEL_20;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  uint64_t v16 = (void *)[v12 newCommandEventWithCommandType:v6 options:v8];
  [(MPRemoteCommandCenter *)self dispatchCommandEvent:v16 completion:v9];
}

- (BOOL)canBeNowPlayingApplication
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canBeNowPlayingApplication;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)playerID
{
  id v2 = [(MRPlayerPath *)self->_playerPath player];
  BOOL v3 = [v2 identifier];
  os_signpost_id_t v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

+ (id)commandCenterForPlayerID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F770A8]) initWithIdentifier:v3 displayName:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F770A8] defaultPlayer];
  }
  id v5 = (void *)v4;
  id v6 = objc_alloc(MEMORY[0x1E4F770B0]);
  uint64_t v7 = [MEMORY[0x1E4F77098] localOrigin];
  id v8 = [MEMORY[0x1E4F76FE8] localClient];
  id v9 = (void *)[v6 initWithOrigin:v7 client:v8 player:v5];

  int v10 = [(id)objc_opt_class() commandCenterForPlayerPath:v9];

  return v10;
}

@end