@interface _MPCMusicPlayerControllerServer
- (BOOL)isRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MPCPlaybackEngine)playbackEngine;
- (MPMusicPlayerControllerSystemCache)systemCache;
- (NSMutableArray)activeConnections;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (_MPCMusicPlayerControllerServer)initWithPlaybackEngine:(id)a3;
- (id)_nowPlayingWithItem:(id)a3;
- (id)_remoteCommandSenderIDForCurrentXPCConnection;
- (id)_timeSnapshotWithElapsedTime:(double)a3 rate:(float)a4;
- (void)_addContentItemIDsToUpdateRecord:(id)a3;
- (void)_appendPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5;
- (void)_applyServerStateUpdateRecord:(id)a3;
- (void)_handleCommandHandlersRegistered:(id)a3;
- (void)_handleMPAVItemTitlesDidChange:(id)a3;
- (void)_invokeServerCommandEvent:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5;
- (void)_onQueue_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 remoteCommandSenderID:(id)a5 completion:(id)a6;
- (void)_prependPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5;
- (void)_registerForCommandHandlersRegisteredNotification;
- (void)_registerForMPAVItemTitlesDidChangeNotification;
- (void)appendDescriptor:(id)a3 completion:(id)a4;
- (void)beginPlaybackAtHostTime:(id)a3;
- (void)beginSeekWithDirection:(int64_t)a3;
- (void)endSeek;
- (void)engine:(id)a3 didChangeCurrentItemVariantID:(id)a4;
- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5;
- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4;
- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4;
- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4;
- (void)engine:(id)a3 didChangeToItem:(id)a4;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4;
- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4;
- (void)engine:(id)a3 didResetQueueWithPlaybackContext:(id)a4 error:(id)a5;
- (void)getDescriptorWithReply:(id)a3;
- (void)getImageForArtworkIdentifier:(id)a3 itemIdentifier:(id)a4 atSize:(CGSize)a5 reply:(id)a6;
- (void)getNowPlayingAtIndex:(int64_t)a3 reply:(id)a4;
- (void)getNowPlayingWithReply:(id)a3;
- (void)getNowPlayingsForContentItemIDs:(id)a3 reply:(id)a4;
- (void)getRepeatModeWithReply:(id)a3;
- (void)getShuffleModeWithReply:(id)a3;
- (void)getTimeSnapshotWithReply:(id)a3;
- (void)pauseWithFadeDuration:(int64_t)a3;
- (void)performQueueModifications:(id)a3 completion:(id)a4;
- (void)play;
- (void)prependDescriptor:(id)a3 completion:(id)a4;
- (void)prerollWithCompletion:(id)a3;
- (void)reshuffle;
- (void)resumeIfNeeded;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4;
- (void)setDescriptor:(id)a3 completion:(id)a4;
- (void)setDisableAutoPlay:(BOOL)a3;
- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3;
- (void)setDisableRepeat:(BOOL)a3;
- (void)setDisableShuffle:(BOOL)a3;
- (void)setElapsedTime:(double)a3 completion:(id)a4;
- (void)setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 completion:(id)a5;
- (void)setNowPlayingUID:(unint64_t)a3 completion:(id)a4;
- (void)setPlaybackRate:(float)a3 completion:(id)a4;
- (void)setRelativeVolume:(float)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleMode:(int64_t)a3;
- (void)skipWithBehavior:(int64_t)a3;
- (void)startServer;
- (void)stop;
- (void)stopServer;
@end

@implementation _MPCMusicPlayerControllerServer

- (id)_nowPlayingWithItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    v5 = [v4 mediaItem];
    v6 = [v4 contentItem];
    objc_opt_class();
    id v43 = v4;
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      v8 = [v7 modelObject];
      v9 = [v8 identifiers];
      v10 = [v9 contentItemID];
      uint64_t v11 = [v10 length];

      v5 = v7;
      if (!v11)
      {
        v12 = [v7 modelObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = (void *)MEMORY[0x263F11EE0];
          id v14 = v12;
          v15 = [v14 anyObject];
          v16 = [v14 identifiers];

          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke;
          v46[3] = &unk_2643C49D8;
          id v47 = v6;
          v17 = (void *)[v16 copyWithSource:@"MPMusicPlayerControllerServer" block:v46];
          v18 = v6;
          v19 = (void *)[v15 copyWithIdentifiers:v17 block:&__block_literal_global_2882];
          v20 = [v13 genericObjectWithModelObject:v19];

          v6 = v18;
        }
        else
        {
          v22 = [v12 identifiers];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke_3;
          v44[3] = &unk_2643C49D8;
          id v45 = v6;
          v23 = (void *)[v22 copyWithSource:@"MPMusicPlayerControllerServer" block:v44];
          v20 = (void *)[v12 copyWithIdentifiers:v23 block:&__block_literal_global_14];

          id v14 = v45;
        }

        v5 = (void *)[objc_alloc(MEMORY[0x263F11F80]) initWithModelObject:v20];
      }
    }
    v24 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
    v25 = [v24 queueController];

    v26 = [v6 identifier];
    uint64_t v27 = [v25 displayIndexForContentItemID:v26];

    uint64_t v28 = [v25 displayItemCount];
    v29 = [v25 behaviorImpl];
    v30 = [v6 identifier];
    v31 = [v29 componentsForContentItemID:v30];

    objc_opt_class();
    uint64_t v42 = v27;
    v32 = v5;
    uint64_t v33 = v28;
    if (objc_opt_isKindOfClass()) {
      uint64_t v34 = [v31 uid];
    }
    else {
      uint64_t v34 = 0;
    }
    v35 = (void *)MEMORY[0x263F120B8];
    v36 = [v6 identifier];
    v37 = [v6 artworkIdentifier];
    v38 = [v6 activeFormat];
    uint64_t v41 = v33;
    v39 = v32;
    v21 = [v35 nowPlayingWithItem:v32 itemIdentifier:v36 itemUID:v34 artworkIdentifier:v37 audioFormat:v38 index:v42 count:v41];

    id v4 = v43;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (_MPCMusicPlayerControllerServer)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPCMusicPlayerControllerServer;
  v5 = [(_MPCMusicPlayerControllerServer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    [v4 addEngineObserver:v6];
    [(_MPCMusicPlayerControllerServer *)v6 _registerForCommandHandlersRegisteredNotification];
  }

  return v6;
}

- (void)startServer
{
  if (+[MPCPlaybackEngine isSystemMusic])
  {
    id v3 = objc_alloc(MEMORY[0x263F08D88]);
    id v4 = (NSXPCListener *)[v3 initWithMachServiceName:*MEMORY[0x263F11B38]];
    listener = self->_listener;
    self->_listener = v4;

    v6 = [MEMORY[0x263F120C8] sharedCache];
    systemCache = self->_systemCache;
    self->_systemCache = v6;
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F08D88] anonymousListener];
    systemCache = self->_listener;
    self->_listener = v8;
  }

  [(NSXPCListener *)self->_listener setDelegate:self];
  v9 = [MEMORY[0x263EFF980] array];
  activeConnections = self->_activeConnections;
  self->_activeConnections = v9;

  self->_resumed = 0;
  [(_MPCMusicPlayerControllerServer *)self _registerForMPAVItemTitlesDidChangeNotification];

  [(_MPCMusicPlayerControllerServer *)self resumeIfNeeded];
}

- (void)_registerForMPAVItemTitlesDidChangeNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleMPAVItemTitlesDidChange_ name:*MEMORY[0x263F11150] object:0];
}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 player];
    int v24 = 138543618;
    id v25 = v7;
    __int16 v26 = 1024;
    int v27 = [v9 isReloadingPlaybackContext];
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: engine:didChangeToItem: - %{public}@ - reloading:%{BOOL}u", (uint8_t *)&v24, 0x12u);
  }
  v10 = [v6 player];
  char v11 = [v10 isReloadingPlaybackContext];

  if ((v11 & 1) == 0)
  {
    char v12 = [v7 isPlaceholder];
    v13 = 0;
    if (!v7) {
      goto LABEL_14;
    }
    if (v12) {
      goto LABEL_14;
    }
    v13 = [(_MPCMusicPlayerControllerServer *)self _nowPlayingWithItem:v7];
    if (!self->_prepareCompletionHandler) {
      goto LABEL_14;
    }
    preparingDescriptor = self->_preparingDescriptor;
    v15 = self->_queueDescriptor;
    if (preparingDescriptor == v15)
    {
    }
    else
    {
      v16 = v15;
      v17 = preparingDescriptor;
      int v18 = [(MPMusicPlayerQueueDescriptor *)v17 isEqual:v16];

      if (!v18)
      {
LABEL_14:
        [(MPMusicPlayerControllerSystemCache *)self->_systemCache setNowPlaying:v13];
        id v23 = objc_alloc_init(MEMORY[0x263F120D0]);
        [v23 setHasNowPlaying:1];
        [v23 setNowPlaying:v13];
        [v23 setQueueDidChange:0];
        [(_MPCMusicPlayerControllerServer *)self _addContentItemIDsToUpdateRecord:v23];
        [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v23];

        goto LABEL_15;
      }
    }
    if (![(MPMusicPlayerQueueDescriptor *)self->_queueDescriptor matchesStartItem:v7]
      && !self->_waitingForAdditionalPlaybackContexts)
    {
      prepareCompletionHandler = (void (**)(id, void *))self->_prepareCompletionHandler;
      v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 6, @"Prepare queue failed with unexpected start item");
      prepareCompletionHandler[2](prepareCompletionHandler, v20);

      id v21 = self->_prepareCompletionHandler;
      self->_prepareCompletionHandler = 0;

      v22 = self->_preparingDescriptor;
      self->_preparingDescriptor = 0;
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_applyServerStateUpdateRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_activeConnections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (void)v11);
        [v10 applyServerStateUpdateRecord:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_addContentItemIDsToUpdateRecord:(id)a3
{
  id v4 = a3;
  v5 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  if (!+[MPCPlaybackEngine isSystemMusic])
  {
    uint64_t v6 = [v5 queueController];
    uint64_t v7 = [v6 displayItemCount];
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = [v6 contentItemIDsFromOffset:-v7 toOffset:v7 mode:1 nowPlayingIndex:&v9];
    [v4 setHasContentItemIDs:1];
    [v4 setContentItemIDs:v8];
  }
}

- (void)_registerForCommandHandlersRegisteredNotification
{
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F11C60];
  id v4 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  v5 = [v4 mediaRemotePublisher];
  uint64_t v6 = [v5 commandCenter];
  [v7 addObserver:self selector:sel__handleCommandHandlersRegistered_ name:v3 object:v6];
}

- (void)resumeIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_listener && !self->_resumed)
  {
    uint64_t v3 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
    id v4 = [v3 mediaRemotePublisher];
    v5 = [v4 commandCenter];
    int v6 = [v5 commandHandlersRegistered];

    if (v6)
    {
      [(NSXPCListener *)self->_listener resume];
      self->_resumed = 1;
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 67109120;
        BOOL v10 = +[MPCPlaybackEngine isSystemMusic];
        uint64_t v8 = "MPMusicPlayerControllerServer: startServer: resummed systemMusicApplication=%{BOOL}u";
LABEL_8:
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 8u);
      }
    }
    else
    {
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 67109120;
        BOOL v10 = +[MPCPlaybackEngine isSystemMusic];
        uint64_t v8 = "MPMusicPlayerControllerServer: startServer: deferred resume waiting for canBeNowPlaying systemMusicApplication=%{BOOL}u";
        goto LABEL_8;
      }
    }
  }
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)_handleCommandHandlersRegistered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_systemCache, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_settingMultiplePlaybackContextsUUID, 0);
  objc_storeStrong(&self->_prepareCompletionHandler, 0);
  objc_storeStrong((id *)&self->_preparingDescriptor, 0);

  objc_storeStrong((id *)&self->_queueDescriptor, 0);
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (MPMusicPlayerControllerSystemCache)systemCache
{
  return self->_systemCache;
}

- (void)_handleMPAVItemTitlesDidChange:(id)a3
{
}

- (id)_remoteCommandSenderIDForCurrentXPCConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 auditToken];
    id v4 = MSVBundleIDForAuditToken();
  }
  else
  {
    id v4 = 0;
  }
  v5 = [NSString stringWithFormat:@"SenderBundleIdentifier = <%@>, SenderPID = <%i>", v4, objc_msgSend(v3, "processIdentifier")];

  return v5;
}

- (void)_invokeServerCommandEvent:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 mediaRemoteOptions];
  long long v12 = (void *)[v11 mutableCopy];
  long long v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v15 = v14;

  uint64_t v16 = MSVNanoIDCreateTaggedPointer();
  v17 = [@"MPMusicPlayer-" stringByAppendingString:v16];

  [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x263F54C88]];
  [v15 setObject:@"MPCMusicPlayerControllerServer" forKeyedSubscript:*MEMORY[0x263F54D60]];
  [v15 setObject:v10 forKeyedSubscript:@"kMRMediaRemoteOptionSenderID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v8;
    v19 = [v18 playbackQueue];
    [v19 setMediaRemoteOptions:v15];
    id v20 = objc_alloc(MEMORY[0x263F12238]);
    id v21 = [v18 command];

    uint64_t v22 = [v20 initWithCommand:v21 playbackQueue:v19];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v8;
      v19 = [v23 playbackQueue];
      id v24 = objc_alloc(MEMORY[0x263F11DB8]);
      id v21 = [v23 command];

      uint64_t v22 = [v24 initWithCommand:v21 playbackQueue:v19 options:v15];
    }
    else
    {
      id v25 = objc_alloc((Class)objc_opt_class());
      v19 = [v8 command];
      id v21 = [v8 command];
      uint64_t v22 = objc_msgSend(v25, "initWithCommand:mediaRemoteType:options:", v19, objc_msgSend(v21, "mediaRemoteCommandType"), v15);
    }
  }
  __int16 v26 = (void *)v22;

  int v27 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v26;
    _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: _invokeServerCommandEvent:… start dispatch [] serverEvent=%{public}@", buf, 0xCu);
  }

  uint64_t v28 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  v29 = [v28 mediaRemotePublisher];
  v30 = [v29 commandCenter];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __94___MPCMusicPlayerControllerServer__invokeServerCommandEvent_remoteCommandSenderID_completion___block_invoke;
  v33[3] = &unk_2643BF258;
  id v34 = v26;
  id v35 = v9;
  id v31 = v9;
  id v32 = v26;
  [v30 dispatchCommandEvent:v32 completion:v33];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v44[2] = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2643C5EE8;
  block[4] = self;
  id v7 = v6;
  id v40 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  int v8 = [v7 processIdentifier];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  id v32 = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_2;
  uint64_t v33 = &unk_2643BF3E8;
  int v36 = v8;
  objc_copyWeak(&v34, &location);
  objc_copyWeak(&v35, &from);
  [v7 setInvalidationHandler:&v30];
  if (+[MPCPlaybackEngine isSystemMusic])
  {
    id v9 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26CC2C1A8, v28, v30, v31, v32, v33);
    [v7 setExportedInterface:v9];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26CC2C468, v28, v30, v31, v32, v33);
    [v7 setExportedInterface:v10];

    uint64_t v11 = [v7 remoteObjectInterface];
    long long v12 = (void *)MEMORY[0x263EFFA08];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    id v14 = [v12 setWithArray:v13];
    [v11 setClasses:v14 forSelector:sel_getNowPlayingsForContentItemIDs_reply_ argumentIndex:0 ofReply:1];

    id v9 = [v7 exportedInterface];
    v15 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    v17 = [v15 setWithArray:v16];
    [v9 setClasses:v17 forSelector:sel_beginPlaybackAtHostTime_ argumentIndex:0 ofReply:0];
  }
  id v18 = (void *)MEMORY[0x263F54F60];
  v19 = [v7 exportedInterface];
  id v20 = [v19 protocol];
  id v21 = [v18 proxyWithObject:self protocol:v20];
  [v7 setExportedObject:v21];

  uint64_t v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC77568];
  [v7 setRemoteObjectInterface:v22];

  if (MSVDeviceOSIsInternalInstall())
  {
    id v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v24 = [v23 integerForKey:@"DelayMusicServerConnection"];

    if (v24 >= 1)
    {
      id v25 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v42[0]) = v24;
        WORD2(v42[0]) = 2114;
        *(void *)((char *)v42 + 6) = v7;
        _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: acceptNewConnection: delaying connection [%ds] %{public}@", buf, 0x12u);
      }

      sleep(v24);
    }
  }
  [v7 resume];
  __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42[0] = v7;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: acceptNewConnection: %{public}@", buf, 0xCu);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)engine:(id)a3 didChangeCurrentItemVariantID:(id)a4
{
  v5 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v9 = [v5 queueController];

  id v6 = [v9 currentItem];
  if (([v6 isPlaceholder] & 1) == 0)
  {
    id v7 = [(_MPCMusicPlayerControllerServer *)self _nowPlayingWithItem:v6];
    id v8 = objc_alloc_init(MEMORY[0x263F120D0]);
    [v8 setHasNowPlaying:1];
    [v8 setNowPlaying:v7];
    [v8 setAudioFormatDidChange:1];
    [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v8];
  }
}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  id v10 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v10 setHasTimeSnapshot:1];
  *(float *)&double v8 = a5;
  id v9 = [(_MPCMusicPlayerControllerServer *)self _timeSnapshotWithElapsedTime:a4 rate:v8];
  [v10 setTimeSnapshot:v9];

  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v10];
}

- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v5 setItemDidEnd:1];
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v5];
}

- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v5 setQueueDidEnd:1];
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v5];
}

- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v5 setHasShuffleMode:1];
  [v5 setShuffleMode:MPMusicShuffleModeForMPShuffleType()];
  [v5 setQueueDidChange:1];
  [(_MPCMusicPlayerControllerServer *)self _addContentItemIDsToUpdateRecord:v5];
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v5];
}

- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4
{
  id v5 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v9 = [v5 queueController];

  id v6 = [v9 music];
  uint64_t v7 = [v6 autoPlayEnabled];

  id v8 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v8 setHasRepeatMode:1];
  [v8 setRepeatMode:MPMusicRepeatModeForMPRepeatType()];
  [v8 setQueueDidChange:v7];
  if (v7) {
    [(_MPCMusicPlayerControllerServer *)self _addContentItemIDsToUpdateRecord:v8];
  }
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v8];
}

- (void)engine:(id)a3 didResetQueueWithPlaybackContext:(id)a4 error:(id)a5
{
  id v16 = a5;
  uint64_t v7 = [a4 queueDescriptor];
  objc_storeStrong((id *)&self->_queueDescriptor, v7);
  if (self->_prepareCompletionHandler)
  {
    id v8 = self->_preparingDescriptor;
    if (v8 == v7)
    {

      if (!v16) {
        goto LABEL_10;
      }
    }
    else
    {
      id v9 = v8;
      char v10 = [(MPMusicPlayerQueueDescriptor *)v8 isEqual:v7];

      if (!v16 || (v10 & 1) == 0)
      {
        if (v10) {
          goto LABEL_10;
        }
        prepareCompletionHandler = (void (**)(id, void *))self->_prepareCompletionHandler;
        long long v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 2, @"Queue was interrupted by another queue");
        prepareCompletionHandler[2](prepareCompletionHandler, v12);

        goto LABEL_9;
      }
    }
    (*((void (**)(void))self->_prepareCompletionHandler + 2))();
LABEL_9:
    id v13 = self->_prepareCompletionHandler;
    self->_prepareCompletionHandler = 0;

    preparingDescriptor = self->_preparingDescriptor;
    self->_preparingDescriptor = 0;
  }
LABEL_10:
  [(MPMusicPlayerControllerSystemCache *)self->_systemCache setQueueDescriptor:v7];
  id v15 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v15 setHasQueueDescriptor:1];
  [v15 setQueueDescriptor:v7];
  [v15 setQueueDidChange:1];
  [(_MPCMusicPlayerControllerServer *)self _addContentItemIDsToUpdateRecord:v15];
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v15];
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  id v5 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v6 = [v5 queueController];

  uint64_t v7 = [v6 currentItem];
  if ([v7 isPlaceholder])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(_MPCMusicPlayerControllerServer *)self _nowPlayingWithItem:v7];
  }
  id v10 = (id)v8;
  [(MPMusicPlayerControllerSystemCache *)self->_systemCache setNowPlaying:v8];
  id v9 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v9 setHasNowPlaying:1];
  [v9 setNowPlaying:v10];
  [v9 setQueueDidChange:1];
  [(_MPCMusicPlayerControllerServer *)self _addContentItemIDsToUpdateRecord:v9];
  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v9];
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v7 setHasTimeSnapshot:1];
  LODWORD(v5) = 2143289344;
  id v6 = [(_MPCMusicPlayerControllerServer *)self _timeSnapshotWithElapsedTime:NAN rate:v5];
  [v7 setTimeSnapshot:v6];

  [(_MPCMusicPlayerControllerServer *)self _applyServerStateUpdateRecord:v7];
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  id v7 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v6 = [v7 player];
  [v6 setApplicationMusicPlayerTransitionType:a3 withDuration:a4];
}

- (void)setDisableShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  [v4 setDisableShuffle:v3];
}

- (void)setDisableRepeat:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  [v4 setDisableRepeat:v3];
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  [v4 setDisableAutoPlay:v3];
}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v4 = [v6 mediaRemotePublisher];
  double v5 = [v4 commandCenter];
  [v5 setDisableAutomaticCanBeNowPlaying:v3];
}

- (void)setRelativeVolume:(float)a3
{
  id v8 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v4 = [v8 player];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [v8 player];
    *(float *)&double v7 = a3;
    [v6 setRelativeVolume:v7];
  }
}

- (void)beginPlaybackAtHostTime:(id)a3
{
  BOOL v3 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: beginPlaybackAtHostTime FAILED [not implemented]", v4, 2u);
  }
}

- (void)prerollWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: prerollWithCompletion FAILED [not implemented]", v5, 2u);
  }

  v3[2](v3, 0);
}

- (void)performQueueModifications:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  if (+[MPCPlaybackEngine isSystemMusic])
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_MPCMusicPlayerControllerServer.m" lineNumber:880 description:@"performQueueModifications is not supported for the system music application"];
  }
  id v10 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke;
  block[3] = &unk_2643C3848;
  id v17 = v9;
  id v18 = v7;
  v19 = self;
  id v20 = v10;
  id v21 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)setPlaybackRate:(float)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setPlaybackRate", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke;
  block[3] = &unk_2643BF398;
  float v18 = a3;
  void block[4] = self;
  id v15 = v7;
  id v16 = v6;
  os_signpost_id_t v17 = v9;
  id v12 = v6;
  id v13 = v7;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

- (void)setElapsedTime:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setElapsedTime", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke;
  block[3] = &unk_2643BF370;
  double v17 = a3;
  void block[4] = self;
  id v15 = v7;
  id v16 = v6;
  os_signpost_id_t v18 = v9;
  id v12 = v6;
  id v13 = v7;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

- (void)getShuffleModeWithReply:(id)a3
{
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getShuffleMode", "", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59___MPCMusicPlayerControllerServer_getShuffleModeWithReply___block_invoke;
  v12[3] = &unk_2643C55A8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v12);
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getShuffleMode", "", buf, 2u);
  }
}

- (void)setShuffleMode:(int64_t)a3
{
  char v5 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "setShuffleMode", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50___MPCMusicPlayerControllerServer_setShuffleMode___block_invoke;
  block[3] = &unk_2643C61D0;
  id v14 = v5;
  int64_t v15 = a3;
  void block[4] = self;
  id v10 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v7, "setShuffleMode", "", buf, 2u);
  }
}

- (void)getRepeatModeWithReply:(id)a3
{
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getRepeatMode", "", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58___MPCMusicPlayerControllerServer_getRepeatModeWithReply___block_invoke;
  v12[3] = &unk_2643C55A8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v12);
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getRepeatMode", "", buf, 2u);
  }
}

- (void)setRepeatMode:(int64_t)a3
{
  char v5 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "setRepeatMode", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___MPCMusicPlayerControllerServer_setRepeatMode___block_invoke;
  block[3] = &unk_2643C61D0;
  id v14 = v5;
  int64_t v15 = a3;
  void block[4] = self;
  id v10 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v7, "setRepeatMode", "", buf, 2u);
  }
}

- (void)endSeek
{
  BOOL v3 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  os_signpost_id_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "endSeek", "", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42___MPCMusicPlayerControllerServer_endSeek__block_invoke;
  v11[3] = &unk_2643C5EE8;
  v11[4] = self;
  id v12 = v3;
  id v8 = v3;
  dispatch_sync(MEMORY[0x263EF83A0], v11);
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_END, v5, "endSeek", "", buf, 2u);
  }
}

- (void)beginSeekWithDirection:(int64_t)a3
{
  os_signpost_id_t v5 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "beginSeekWithDirection", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___MPCMusicPlayerControllerServer_beginSeekWithDirection___block_invoke;
  block[3] = &unk_2643C61D0;
  id v14 = v5;
  int64_t v15 = a3;
  void block[4] = self;
  id v10 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v7, "beginSeekWithDirection", "", buf, 2u);
  }
}

- (void)reshuffle
{
  BOOL v3 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  os_signpost_id_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "reshuffle", "", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44___MPCMusicPlayerControllerServer_reshuffle__block_invoke;
  v11[3] = &unk_2643C5EE8;
  v11[4] = self;
  id v12 = v3;
  id v8 = v3;
  dispatch_sync(MEMORY[0x263EF83A0], v11);
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_END, v5, "reshuffle", "", buf, 2u);
  }
}

- (void)skipWithBehavior:(int64_t)a3
{
  os_signpost_id_t v5 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "skipWithBehavior", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52___MPCMusicPlayerControllerServer_skipWithBehavior___block_invoke;
  block[3] = &unk_2643C61D0;
  id v14 = v5;
  int64_t v15 = a3;
  void block[4] = self;
  id v10 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v7, "skipWithBehavior", "", buf, 2u);
  }
}

- (void)stop
{
}

- (void)pauseWithFadeDuration:(int64_t)a3
{
  id v4 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  os_signpost_id_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "pauseWithFadeDuration", "", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57___MPCMusicPlayerControllerServer_pauseWithFadeDuration___block_invoke;
  v12[3] = &unk_2643C5EE8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v12);
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v6, "pauseWithFadeDuration", "", buf, 2u);
  }
}

- (void)play
{
  BOOL v3 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  os_signpost_id_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "play", "", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39___MPCMusicPlayerControllerServer_play__block_invoke;
  v11[3] = &unk_2643C5EE8;
  v11[4] = self;
  id v12 = v3;
  id v8 = v3;
  dispatch_sync(MEMORY[0x263EF83A0], v11);
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_END, v5, "play", "", buf, 2u);
  }
}

- (void)_appendPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  v27[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [v8 firstObject];
  if (v11)
  {
    id v12 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
    id v13 = [v12 mediaRemotePublisher];
    id v14 = [v13 commandCenter];

    int64_t v15 = [v14 insertIntoPlaybackQueueCommand];
    if ([v15 isSupportedAndEnabled])
    {
      [v11 setActionAfterQueueLoad:10];
      id v16 = [[MPCPlaybackContextRemotePlaybackQueue alloc] initWithPlaybackContext:v11];
      [(MPCPlaybackContextRemotePlaybackQueue *)v16 setReplaceIntent:1];
      id v17 = objc_alloc(MEMORY[0x263F11DB8]);
      v26[0] = *MEMORY[0x263F54D18];
      v26[1] = @"MPCRemoteCommandEventOptionShouldPlayInsertedContent";
      v27[0] = &unk_26CC18C78;
      v27[1] = MEMORY[0x263EFFA88];
      v26[2] = @"_MPCOverrideAllowsInsertionPositionLast";
      v27[2] = MEMORY[0x263EFFA88];
      os_signpost_id_t v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      v19 = (void *)[v17 initWithCommand:v15 playbackQueue:v16 options:v18];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke;
      v21[3] = &unk_2643C2F20;
      id v25 = v10;
      id v22 = v8;
      id v23 = self;
      id v24 = v9;
      [(_MPCMusicPlayerControllerServer *)self _invokeServerCommandEvent:v19 remoteCommandSenderID:v24 completion:v21];
    }
    else
    {
      id v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 7, @"InsertIntoPlaybackQueue is currently not enabled or the playback engine is not ready");
      (*((void (**)(id, void *))v10 + 2))(v10, v20);
    }
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 1, @"Playback context not found when appending contexts.");
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)appendDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a4;
  os_signpost_id_t v7 = [a3 playbackContexts];
  self->_waitingForAdditionalPlaybackContexts = (unint64_t)[v7 count] > 1;
  id v8 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  msv_dispatch_on_main_queue();
}

- (void)_prependPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 lastObject];
  if (v11)
  {
    id v12 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
    id v13 = [v12 mediaRemotePublisher];
    id v14 = [v13 commandCenter];

    int64_t v15 = [v14 insertIntoPlaybackQueueCommand];
    if ([v15 isSupportedAndEnabled])
    {
      [v11 setActionAfterQueueLoad:10];
      id v16 = [[MPCPlaybackContextRemotePlaybackQueue alloc] initWithPlaybackContext:v11];
      [(MPCPlaybackContextRemotePlaybackQueue *)v16 setReplaceIntent:1];
      id v17 = objc_alloc(MEMORY[0x263F11DB8]);
      uint64_t v26 = *MEMORY[0x263F54D18];
      v27[0] = &unk_26CC18C60;
      os_signpost_id_t v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v19 = (void *)[v17 initWithCommand:v15 playbackQueue:v16 options:v18];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke;
      v21[3] = &unk_2643C2F20;
      id v25 = v10;
      id v22 = v8;
      id v23 = self;
      id v24 = v9;
      [(_MPCMusicPlayerControllerServer *)self _invokeServerCommandEvent:v19 remoteCommandSenderID:v24 completion:v21];
    }
    else
    {
      id v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 7, @"InsertIntoPlaybackQueue is currently not enabled or the playback engine is not ready");
      (*((void (**)(id, void *))v10 + 2))(v10, v20);
    }
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 1, @"Playback context not found when prepending contexts.");
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)prependDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a4;
  os_signpost_id_t v7 = [a3 playbackContexts];
  self->_waitingForAdditionalPlaybackContexts = (unint64_t)[v7 count] > 1;
  id v8 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  msv_dispatch_on_main_queue();
}

- (void)getDescriptorWithReply:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58___MPCMusicPlayerControllerServer_getDescriptorWithReply___block_invoke;
  v6[3] = &unk_2643C55A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v6);
}

- (void)setDescriptor:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 playbackContexts];
  id v9 = [v8 firstObject];
  id v10 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  if ([v10 disableRepeat]) {
    [v9 setRepeatType:0];
  }
  if ([v10 disableShuffle]) {
    [v9 setShuffleType:0];
  }
  [v9 setQueueEndAction:2];
  if (v9)
  {
    id v11 = [MEMORY[0x263F08D68] currentConnection];
    id v12 = v11;
    if (v11)
    {
      [v11 auditToken];
      id v13 = MSVBundleIDForAuditToken();
    }
    else
    {
      id v13 = 0;
    }
    int64_t v15 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke;
    v18[3] = &unk_2643BF320;
    v18[4] = self;
    id v19 = v6;
    id v25 = v7;
    id v20 = v8;
    id v21 = v13;
    id v22 = v9;
    id v23 = v15;
    id v24 = v10;
    id v16 = v15;
    id v17 = v13;
    dispatch_sync(MEMORY[0x263EF83A0], v18);
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MusicKit: No playback contexts found for descriptor %{public}@", buf, 0xCu);
    }

    id v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 1, @"Playback context not found when setting descriptor.");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)getTimeSnapshotWithReply:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getTimeSnapshot", "", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60___MPCMusicPlayerControllerServer_getTimeSnapshotWithReply___block_invoke;
  v12[3] = &unk_2643C55A8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v12);
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getTimeSnapshot", "", buf, 2u);
  }
}

- (id)_timeSnapshotWithElapsedTime:(double)a3 rate:(float)a4
{
  os_signpost_id_t v6 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v7 = [v6 player];
  id v8 = [v7 currentItem];

  id v9 = [v6 player];
  uint64_t v10 = [v9 state];

  switch(v10)
  {
    case 1:
      uint64_t v11 = 2;
      break;
    case 2:
      uint64_t v11 = 1;
      break;
    case 3:
    case 4:
    case 5:
      if (a4 >= 0.0) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 5;
      }
      break;
    case 6:
      uint64_t v11 = 3;
      break;
    default:
      uint64_t v11 = 0;
      break;
  }
  if ([v8 isAlwaysLive])
  {
    *(float *)&double v12 = a4;
    [MEMORY[0x263F120C0] liveSnapshotWithRate:v11 state:v12];
  }
  else
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v14 = v13;
    int64_t v15 = (void *)MEMORY[0x263F120C0];
    [v8 durationIfAvailable];
    *(float *)&double v16 = a4;
    [v15 snapshotWithElapsedTime:v11 duration:a3 rate:v17 atTimestamp:v16 state:v14];
  os_signpost_id_t v18 = };

  return v18;
}

- (void)getImageForArtworkIdentifier:(id)a3 itemIdentifier:(id)a4 atSize:(CGSize)a5 reply:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke;
  v17[3] = &unk_2643BF2D0;
  v17[4] = self;
  id v18 = v12;
  CGFloat v21 = width;
  CGFloat v22 = height;
  id v19 = v11;
  id v20 = v13;
  id v14 = v11;
  id v15 = v13;
  id v16 = v12;
  dispatch_sync(MEMORY[0x263EF83A0], v17);
}

- (void)setNowPlayingUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setNowPlayingUID", "", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke;
  v16[3] = &unk_2643C21B0;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  unint64_t v19 = a3;
  id v12 = v6;
  id v13 = v7;
  dispatch_sync(MEMORY[0x263EF83A0], v16);
  id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_END, v9, "setNowPlayingUID", "", buf, 2u);
  }
}

- (void)_onQueue_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 remoteCommandSenderID:(id)a5 completion:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v14 = [(_MPCMusicPlayerControllerServer *)self playbackEngine];
  id v15 = [v14 mediaRemotePublisher];
  id v16 = [v15 commandCenter];

  id v17 = [v16 playItemInQueueCommand];
  id v18 = v17;
  if (!(v10 | v11))
  {
    unint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F11B30];
    CGFloat v21 = @"No item provided to setNowPlayingItem";
    uint64_t v22 = 5;
LABEL_7:
    uint64_t v26 = objc_msgSend(v19, "msv_errorWithDomain:code:debugDescription:", v20, v22, v21);
    v13[2](v13, v26);

    goto LABEL_15;
  }
  if (![v17 isSupportedAndEnabled])
  {
    unint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F11B30];
    CGFloat v21 = @"PlayItemInQueue is currently not enabled or the playback engine is not ready";
    uint64_t v22 = 7;
    goto LABEL_7;
  }
  id v23 = [MEMORY[0x263EFF9A0] dictionary];
  id v24 = (id)v11;
  if (v11)
  {
    id v25 = v24;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = [(id)v10 modelObject];
      id v27 = [v30 identifiers];
      id v25 = [v27 contentItemID];
    }
    else
    {
      id v25 = 0;
    }
  }
  if ([v25 length])
  {
    [v23 setObject:v25 forKeyedSubscript:*MEMORY[0x263F54C98]];
  }
  else
  {
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)v10, "persistentID"));
    [v23 setObject:v28 forKeyedSubscript:*MEMORY[0x263F54DB0]];
  }
  v29 = (void *)[v18 newCommandEventWithCommandType:131 options:v23];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __110___MPCMusicPlayerControllerServer__onQueue_setNowPlayingItem_itemIdentifier_remoteCommandSenderID_completion___block_invoke;
  v31[3] = &unk_2643BF258;
  id v32 = (id)v10;
  uint64_t v33 = v13;
  [(_MPCMusicPlayerControllerServer *)self _invokeServerCommandEvent:v29 remoteCommandSenderID:v12 completion:v31];

LABEL_15:
}

- (void)setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(_MPCMusicPlayerControllerServer *)self _remoteCommandSenderIDForCurrentXPCConnection];
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "setNowPlayingItem", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79___MPCMusicPlayerControllerServer_setNowPlayingItem_itemIdentifier_completion___block_invoke;
  block[3] = &unk_2643C3848;
  void block[4] = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v11;
  id v26 = v10;
  id v16 = v10;
  id v17 = v11;
  id v18 = v9;
  id v19 = v8;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  CGFloat v21 = v20;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_END, v13, "setNowPlayingItem", "", buf, 2u);
  }
}

- (void)getNowPlayingAtIndex:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "getNowPlayingAtIndex", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62___MPCMusicPlayerControllerServer_getNowPlayingAtIndex_reply___block_invoke;
  block[3] = &unk_2643C6818;
  id v15 = v6;
  int64_t v16 = a3;
  void block[4] = self;
  id v11 = v6;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  os_signpost_id_t v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_END, v8, "getNowPlayingAtIndex", "", buf, 2u);
  }
}

- (void)getNowPlayingsForContentItemIDs:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "getNowPlayingsForContentItemIDs", "", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke;
  block[3] = &unk_2643C5620;
  void block[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_END, v9, "getNowPlayingsForContentItemIDs", "", buf, 2u);
  }
}

- (void)getNowPlayingWithReply:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getNowPlaying", "", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58___MPCMusicPlayerControllerServer_getNowPlayingWithReply___block_invoke;
  v12[3] = &unk_2643C55A8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v12);
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getNowPlaying", "", buf, 2u);
  }
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)stopServer
{
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;

  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: stopServer", v5, 2u);
  }
}

- (BOOL)isRunning
{
  return self->_listener != 0;
}

@end