@interface MPMusicPlayerApplicationController
+ (BOOL)shouldUseSystemMusicAppOnMacOS;
+ (void)setShouldUseSystemMusicAppOnMacOS:(BOOL)a3;
- (BOOL)disableAutoPlay;
- (BOOL)disableAutomaticCanBeNowPlaying;
- (BOOL)disableRepeat;
- (BOOL)disableShuffle;
- (MPMusicPlayerApplicationController)initWithClientIdentifier:(id)a3 queue:(id)a4;
- (NSXPCConnection)serviceConnection;
- (double)crossFadeDuration;
- (id)_mediaItemsForContentItemIDs:(id)a3;
- (int64_t)transitionType;
- (void)_clearConnection;
- (void)_establishConnectionIfNeeded;
- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3;
- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4;
- (void)beginGeneratingPlaybackNotifications;
- (void)beginPlaybackAtHostTime:(id *)a3;
- (void)dealloc;
- (void)endGeneratingPlaybackNotifications;
- (void)onApplicationServer:(id)a3;
- (void)onApplicationServerAsync:(id)a3 errorHandler:(id)a4;
- (void)performQueueTransaction:(void *)queueTransaction completionHandler:(void *)completionHandler;
- (void)prerollWithCompletion:(id)a3;
- (void)setCrossFadeDuration:(double)a3;
- (void)setDisableAutoPlay:(BOOL)a3;
- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3;
- (void)setDisableRepeat:(BOOL)a3;
- (void)setDisableShuffle:(BOOL)a3;
- (void)setRelativeVolume:(float)a3;
- (void)setTransitionType:(int64_t)a3;
@end

@implementation MPMusicPlayerApplicationController

- (void).cxx_destruct
{
}

- (BOOL)disableAutoPlay
{
  return *(&self->_disableAutoPlay + 4);
}

- (BOOL)disableRepeat
{
  return *(&self->_disableAutoPlay + 3);
}

- (BOOL)disableShuffle
{
  return *(&self->_disableAutoPlay + 2);
}

- (void)setCrossFadeDuration:(double)a3
{
  self->_crossFadeDuration = a3;
}

- (double)crossFadeDuration
{
  return self->_crossFadeDuration;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (BOOL)disableAutomaticCanBeNowPlaying
{
  return *(&self->_disableAutoPlay + 1);
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)onApplicationServer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MPMusicPlayerApplicationController_onApplicationServer___block_invoke;
  v6[3] = &unk_1E57F3DB0;
  id v7 = v4;
  id v5 = v4;
  [(MPMusicPlayerController *)self onServer:v6];
}

uint64_t __58__MPMusicPlayerApplicationController_onApplicationServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onApplicationServerAsync:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__MPMusicPlayerApplicationController_onApplicationServerAsync_errorHandler___block_invoke;
  v8[3] = &unk_1E57F0C88;
  id v9 = v6;
  id v7 = v6;
  [(MPMusicPlayerController *)self onServerAsync:v8 errorHandler:a4];
}

uint64_t __76__MPMusicPlayerApplicationController_onApplicationServerAsync_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_establishConnectionIfNeeded
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)MPMusicPlayerApplicationController;
  [(MPMusicPlayerController *)&v42 _establishConnectionIfNeeded];
  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    os_unfair_lock_lock(&self->super._lock);
    connection = self->super._connection;
    objc_initWeak(&location, self);
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v5 = (char *)os_signpost_id_generate(v4);

    id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v7 = v6;
    unint64_t v8 = (unint64_t)(v5 - 1);
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", (const char *)&unk_1956A9243, buf, 2u);
    }

    id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v5;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationQueuePlayer:xpc:connect ", buf, 0xCu);
    }

    if (!self->_serviceConnection)
    {
      v10 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MediaPlayer.RemotePlayerService"];
      serviceConnection = self->_serviceConnection;
      self->_serviceConnection = v10;

      v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78DF88];
      [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:v12];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_155;
      v39[3] = &unk_1E57F6EF0;
      objc_copyWeak(&v40, &location);
      [(NSXPCConnection *)self->_serviceConnection setInterruptionHandler:v39];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_156;
      v37[3] = &unk_1E57F6EF0;
      objc_copyWeak(&v38, &location);
      [(NSXPCConnection *)self->_serviceConnection setInvalidationHandler:v37];
      [(NSXPCConnection *)self->_serviceConnection resume];
      v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v14 = v13;
      if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v14, OS_SIGNPOST_EVENT, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", "resumed connection", buf, 2u);
      }

      v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v44 = v5;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "EVENT [%lld]: applicationQueuePlayer:xpc:connect resumed connection", buf, 0xCu);
      }

      if ([(MPMusicPlayerController *)self notificationsCounter] >= 1)
      {
        v16 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
        [v16 setWantsReverseProcessAssertion:1];
      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v40);
    }
    v17 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v18 = v17;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect:wake", (const char *)&unk_1956A9243, buf, 2u);
    }

    v19 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v5;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationQueuePlayer:xpc:connect:wake ", buf, 0xCu);
    }

    char v20 = MRMediaRemoteNowPlayingWakePlayerServiceProcess();
    v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v22 = v21;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v22, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect:wake", (const char *)&unk_1956A9243, buf, 2u);
    }

    v23 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v5;
      _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationQueuePlayer:xpc:connect:wake ", buf, 0xCu);
    }

    if ((v20 & 1) == 0)
    {
      v24 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_ERROR, "applicationQueuePlayer _establishConnectionIfNeeded timeout [ping did not pong]", buf, 2u);
      }
    }
    if (!self->super._connection)
    {
      v25 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v26 = v25;
      if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationMusicPlayer:connect", (const char *)&unk_1956A9243, buf, 2u);
      }

      v27 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v44 = v5;
        _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationMusicPlayer:connect ", buf, 0xCu);
      }

      v28 = self->_serviceConnection;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_157;
      v36[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v36[4] = v5;
      v29 = [(NSXPCConnection *)v28 synchronousRemoteObjectProxyWithErrorHandler:v36];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_159;
      v34[3] = &unk_1E57F0C60;
      v34[4] = self;
      objc_copyWeak(v35, &location);
      v35[1] = v5;
      [v29 getServerEndpointWithReply:v34];

      objc_destroyWeak(v35);
    }
    v30 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v31 = v30;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v31, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", (const char *)&unk_1956A9243, buf, 2u);
    }

    v32 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v5;
      _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationQueuePlayer:xpc:connect ", buf, 0xCu);
    }

    if (connection)
    {
      os_unfair_lock_unlock(&self->super._lock);
    }
    else
    {
      [(MPMusicPlayerController *)self _validateServer];
      os_unfair_lock_unlock(&self->super._lock);
      if (self->super._connection)
      {
        if (*(&self->_disableAutoPlay + 1)) {
          [(MPMusicPlayerApplicationController *)self setDisableAutomaticCanBeNowPlaying:1];
        }
        if (self->_transitionType == 1) {
          -[MPMusicPlayerApplicationController _setApplicationMusicPlayerTransitionType:withDuration:](self, "_setApplicationMusicPlayerTransitionType:withDuration:", self->_crossFadeDuration);
        }
        else {
          -[MPMusicPlayerApplicationController _setApplicationMusicPlayerTransitionType:](self, "_setApplicationMusicPlayerTransitionType:");
        }
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v33 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v33, OS_LOG_TYPE_DEFAULT, "applicationMusicPlayer _establishConnectionIfNeeded failed [👮‍♂️ denied due to authorization status]", buf, 2u);
    }
  }
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_155(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "applicationController: xpc service connection interrupted", v3, 2u);
  }

  [WeakRetained _clearConnection];
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_156(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "applicationController: xpc service connection invalidated", v3, 2u);
  }

  [WeakRetained _clearConnection];
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "applicationMusicPlayer: failed to get synchronousRemoteObject %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 32);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "applicationMusicPlayer:connect", "error=%{public}@", (uint8_t *)&v10, 0xCu);
  }

  unint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 134218242;
    id v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationMusicPlayer:connect error=%{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_159(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;

  os_signpost_id_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78DF28];
  [*(id *)(*(void *)(a1 + 32) + 32) setRemoteObjectInterface:v7];

  unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectInterface];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v11 = [v9 setWithArray:v10];
  [v8 setClasses:v11 forSelector:sel_getNowPlayingsForContentItemIDs_reply_ argumentIndex:0 ofReply:1];

  __int16 v12 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectInterface];
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v15 = [v13 setWithArray:v14];
  [v12 setClasses:v15 forSelector:sel_beginPlaybackAtHostTime_ argumentIndex:0 ofReply:0];

  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE722178];
  [*(id *)(*(void *)(a1 + 32) + 32) setExportedInterface:v16];

  v17 = [MEMORY[0x1E4F77A40] proxyWithObject:*(void *)(a1 + 32) protocol:&unk_1EE722178];
  [*(id *)(*(void *)(a1 + 32) + 32) setExportedObject:v17];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_2;
  v23[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:v23];
  [*(id *)(*(void *)(a1 + 32) + 32) resume];
  v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v19 = v18;
  os_signpost_id_t v20 = *(void *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v19, OS_SIGNPOST_INTERVAL_END, v20, "applicationMusicPlayer:connect", (const char *)&unk_1956A9243, buf, 2u);
  }

  v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v22;
    _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationMusicPlayer:connect ", buf, 0xCu);
  }

  objc_destroyWeak(&v24);
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "applicationMusicPlayer: connection invalidated", v3, 2u);
  }

  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  [(MPMusicPlayerController *)&v4 _clearConnection];
}

- (id)_mediaItemsForContentItemIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  unint64_t v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = [v4 count];
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_mediaItemsForContentItemIDs", "contentItemIDs.count=%llu", buf, 0xCu);
  }

  int v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v4 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: _mediaItemsForContentItemIDs contentItemIDs.count=%llu", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__17817;
  id v38 = __Block_byref_object_dispose__17818;
  id v39 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke;
  v30[3] = &unk_1E57F0C18;
  id v12 = v4;
  id v31 = v12;
  v32 = buf;
  [(MPMusicPlayerApplicationController *)self onApplicationServer:v30];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v18 itemIdentifier];
        if (v19)
        {
          os_signpost_id_t v20 = [(MPMusicPlayerController *)self _mediaItemFromNowPlaying:v18];
          if (v20) {
            [v13 setObject:v20 forKey:v19];
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v15);
  }

  v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v22 = v21;
  if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    *(_WORD *)v33 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v22, OS_SIGNPOST_INTERVAL_END, spid, "_mediaItemsForContentItemIDs", (const char *)&unk_1956A9243, v33, 2u);
  }

  v23 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v33 = 134217984;
    os_signpost_id_t v34 = spid;
    _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEBUG, "END [%lld]: _mediaItemsForContentItemIDs ", v33, 0xCu);
  }

  _Block_object_dispose(buf, 8);

  return v13;
}

void __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke_2;
  v7[3] = &unk_1E57F0BF0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [a2 getNowPlayingsForContentItemIDs:v5 reply:v7];
}

void __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      uint64_t v9 = objc_msgSend(v6, "msv_description");
      int v12 = 134218242;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed getting nowPlayings for contentItemIDs (count: %llu) error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  *(&self->_disableAutoPlay + 1) = a3;
  if (self->super._connection)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __73__MPMusicPlayerApplicationController_setDisableAutomaticCanBeNowPlaying___block_invoke;
    v3[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    BOOL v4 = a3;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v3];
  }
}

uint64_t __73__MPMusicPlayerApplicationController_setDisableAutomaticCanBeNowPlaying___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisableAutomaticCanBeNowPlaying:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setRelativeVolume:(float)a3
{
  float v3 = fminf(a3, 1.0);
  if (v3 < 0.0) {
    float v3 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MPMusicPlayerApplicationController_setRelativeVolume___block_invoke;
  v4[3] = &__block_descriptor_36_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
  float v5 = v3;
  [(MPMusicPlayerApplicationController *)self onApplicationServer:v4];
}

uint64_t __56__MPMusicPlayerApplicationController_setRelativeVolume___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setRelativeVolume:a3];
}

- (void)beginPlaybackAtHostTime:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke;
  v3[3] = &__block_descriptor_56_e61_v24__0___MPMusicPlayerControllerApplicationServer__8___B___16l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(MPMusicPlayerApplicationController *)self onApplicationServerAsync:v3 errorHandler:&__block_literal_global_17828];
}

void __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v8 = *(CMTime *)(a1 + 32);
  float v5 = a3;
  id v6 = a2;
  CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v8, v4);
  objc_msgSend(v6, "beginPlaybackAtHostTime:", v7, *(_OWORD *)&v8.value, v8.epoch);

  v5[2](v5);
}

void __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  float v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Failed to beginPlaybackAtHostTime with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)prerollWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke;
  v8[3] = &unk_1E57F0B88;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_3;
  v6[3] = &unk_1E57F90A0;
  id v7 = v9;
  id v5 = v9;
  [(MPMusicPlayerApplicationController *)self onApplicationServerAsync:v8 errorHandler:v6];
}

void __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_2;
  v7[3] = &unk_1E57F0B60;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a2 prerollWithCompletion:v7];
}

void __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to prerollWithCompletion with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
  if (a3 == 1) {
    self->_crossFadeDuration = 4.0;
  }
  if (self->super._connection)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __79__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType___block_invoke;
    v3[3] = &unk_1E57F0B38;
    void v3[4] = self;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v3];
  }
}

uint64_t __79__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setApplicationMusicPlayerTransitionType:*(void *)(*(void *)(a1 + 32) + 152) withDuration:*(double *)(*(void *)(a1 + 32) + 160)];
}

- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  if (a3)
  {
    self->_transitionType = a3;
    if (a3 == 1) {
      self->_crossFadeDuration = a4;
    }
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
    [v6 handleFailureInMethod:a2 object:self file:@"MPMusicPlayerApplicationController.m" lineNumber:177 description:@"Duration cannot be passed in with TransitionTypeNone"];

    self->_transitionType = 0;
  }
  if (self->super._connection)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType_withDuration___block_invoke;
    v7[3] = &unk_1E57F0B38;
    void v7[4] = self;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v7];
  }
}

uint64_t __92__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType_withDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setApplicationMusicPlayerTransitionType:*(void *)(*(void *)(a1 + 32) + 152) withDuration:*(double *)(*(void *)(a1 + 32) + 160)];
}

- (void)setDisableShuffle:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 2);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__MPMusicPlayerApplicationController_setDisableShuffle___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    char v5 = v3;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v4];
  }
}

uint64_t __56__MPMusicPlayerApplicationController_setDisableShuffle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisableShuffle:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisableRepeat:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 3);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__MPMusicPlayerApplicationController_setDisableRepeat___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    char v5 = v3;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v4];
  }
}

uint64_t __55__MPMusicPlayerApplicationController_setDisableRepeat___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisableRepeat:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 4);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__MPMusicPlayerApplicationController_setDisableAutoPlay___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    char v5 = v3;
    [(MPMusicPlayerApplicationController *)self onApplicationServer:v4];
  }
}

uint64_t __57__MPMusicPlayerApplicationController_setDisableAutoPlay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisableAutoPlay:*(unsigned __int8 *)(a1 + 32)];
}

- (void)performQueueTransaction:(void *)queueTransaction completionHandler:(void *)completionHandler
{
  id v6 = queueTransaction;
  uint64_t v7 = completionHandler;
  id v8 = [[MPMusicPlayerControllerMutableQueue alloc] initWithController:self];
  objc_initWeak(&location, v8);
  v6[2](v6, v8);
  id v9 = [(MPMusicPlayerControllerMutableQueue *)v8 modifications];

  id v10 = objc_loadWeakRetained(&location);
  [v10 fault];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke;
  v15[3] = &unk_1E57F0AF0;
  id v11 = v9;
  id v16 = v11;
  v17 = self;
  id v18 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_4;
  v13[3] = &unk_1E57F8500;
  v13[4] = self;
  id v12 = v18;
  id v14 = v12;
  [(MPMusicPlayerApplicationController *)self onApplicationServerAsync:v15 errorHandler:v13];

  objc_destroyWeak(&location);
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E57F0AC8;
  uint64_t v6 = a1[4];
  uint64_t v7 = (void *)a1[6];
  v9[4] = a1[5];
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [a2 performQueueModifications:v6 completion:v9];
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MPMusicPlayerControllerQueue alloc] initWithController:*(void *)(a1 + 32)];
  objc_initWeak(&location, v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v5 = objc_loadWeakRetained(&location);
  [v5 fault];

  objc_destroyWeak(&location);
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v4 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F8408;
    block[4] = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [[MPMusicPlayerControllerQueue alloc] initWithController:*(void *)(a1 + 32)];
  objc_initWeak(&location, v2);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v3 = objc_loadWeakRetained(&location);
  [v3 fault];

  objc_destroyWeak(&location);
}

- (void)endGeneratingPlaybackNotifications
{
  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  [(MPMusicPlayerController *)&v4 endGeneratingPlaybackNotifications];
  id v3 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  objc_msgSend(v3, "setWantsReverseProcessAssertion:", -[MPMusicPlayerController notificationsCounter](self, "notificationsCounter") > 0);
}

- (void)beginGeneratingPlaybackNotifications
{
  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  [(MPMusicPlayerController *)&v4 beginGeneratingPlaybackNotifications];
  id v3 = [(NSXPCConnection *)self->_serviceConnection remoteObjectProxy];
  objc_msgSend(v3, "setWantsReverseProcessAssertion:", -[MPMusicPlayerController notificationsCounter](self, "notificationsCounter") > 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerApplicationController;
  [(MPMusicPlayerController *)&v3 dealloc];
}

- (MPMusicPlayerApplicationController)initWithClientIdentifier:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerApplicationController;
  uint64_t result = [(MPMusicPlayerController *)&v5 initWithClientIdentifier:a3 queue:a4];
  if (result) {
    *(&result->_disableAutoPlay + 4) = 1;
  }
  return result;
}

+ (void)setShouldUseSystemMusicAppOnMacOS:(BOOL)a3
{
  __MPMusicPlayerApplicationController_shouldUseSystemMusicAppOnMacOS = a3;
}

+ (BOOL)shouldUseSystemMusicAppOnMacOS
{
  return __MPMusicPlayerApplicationController_shouldUseSystemMusicAppOnMacOS;
}

@end