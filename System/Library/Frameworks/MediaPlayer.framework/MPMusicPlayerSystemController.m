@interface MPMusicPlayerSystemController
- (BOOL)_shouldAccessCache;
- (id)_nowPlaying;
- (id)_queueDescriptor;
- (int64_t)playbackState;
- (void)_establishConnectionIfNeeded;
- (void)onSystemServer:(id)a3;
- (void)openToPlayQueueDescriptor:(id)a3;
@end

@implementation MPMusicPlayerSystemController

- (void)onSystemServer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MPMusicPlayerSystemController_onSystemServer___block_invoke;
  v6[3] = &unk_1E57F3DB0;
  id v7 = v4;
  id v5 = v4;
  [(MPMusicPlayerController *)self onServer:v6];
}

uint64_t __48__MPMusicPlayerSystemController_onSystemServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldAccessCache
{
  if (self->super._connection) {
    return 0;
  }
  if (+[MPMediaLibrary authorizationStatus] != MPMediaLibraryAuthorizationStatusAuthorized) {
    return 0;
  }
  v2 = +[MPMusicPlayerControllerSystemCache sharedCache];
  int v3 = [v2 hasCachedData];

  if (!v3) {
    return 0;
  }

  return MRMediaRemoteIsMusicAppInstalled();
}

- (id)_nowPlaying
{
  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPMusicPlayerSystemController;
    int v3 = [(MPMusicPlayerController *)&v6 _nowPlaying];
  }
  else if ([(MPMusicPlayerSystemController *)self _shouldAccessCache])
  {
    id v5 = +[MPMusicPlayerControllerSystemCache sharedCache];
    int v3 = [v5 nowPlaying];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)_queueDescriptor
{
  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPMusicPlayerSystemController;
    int v3 = [(MPMusicPlayerController *)&v6 _queueDescriptor];
  }
  else if ([(MPMusicPlayerSystemController *)self _shouldAccessCache])
  {
    id v5 = +[MPMusicPlayerControllerSystemCache sharedCache];
    int v3 = [v5 queueDescriptor];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (void)_establishConnectionIfNeeded
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)MPMusicPlayerSystemController;
  [(MPMusicPlayerController *)&v30 _establishConnectionIfNeeded];
  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    connection = self->super._connection;
    if (connection)
    {
LABEL_3:
      id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      os_signpost_id_t v6 = os_signpost_id_generate(v5);

      id v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v8 = v7;
      unint64_t v9 = v6 - 1;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "systemMusicPlayer:connect", (const char *)&unk_1956A9243, (uint8_t *)&buf, 2u);
      }

      if (connection)
      {
        if ((MRMediaRemoteSystemMediaApplicationWake() & 1) == 0)
        {
          v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded timeout [ping did not pong]", (uint8_t *)&buf, 2u);
          }

          int v11 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        [(NSXPCConnection *)self->super._connection resume];
        v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
        v19 = v18;
        if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1952E8000, v19, OS_SIGNPOST_EVENT, v6, "systemMusicPlayer:connect", "resumed connection", (uint8_t *)&buf, 2u);
        }

        [(MPMusicPlayerController *)self _validateServer];
      }
      int v11 = 1;
LABEL_22:
      v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v21 = v20;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v11;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v21, OS_SIGNPOST_INTERVAL_END, v6, "systemMusicPlayer:connect", "woke=%{BOOL}u", (uint8_t *)&buf, 8u);
      }

      goto LABEL_32;
    }
    if (MRMediaRemoteIsMusicAppInstalled())
    {
      if (MRMediaRemoteSystemMediaApplicationWake())
      {
        v13 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Music.MPMusicPlayerControllerInternal" options:0];
        v14 = self->super._connection;
        self->super._connection = v13;

        objc_initWeak(&buf, self);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke;
        v28[3] = &unk_1E57F6EF0;
        objc_copyWeak(&v29, &buf);
        [(NSXPCConnection *)self->super._connection setInterruptionHandler:v28];
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        v25 = __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke_9;
        v26 = &unk_1E57F6EF0;
        objc_copyWeak(&v27, &buf);
        [(NSXPCConnection *)self->super._connection setInvalidationHandler:&v23];
        v15 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EE78DFE8, v23, v24, v25, v26);
        [(NSXPCConnection *)self->super._connection setRemoteObjectInterface:v15];

        v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE722178];
        [(NSXPCConnection *)self->super._connection setExportedInterface:v16];

        v17 = [MEMORY[0x1E4F77A40] proxyWithObject:self protocol:&unk_1EE722178];
        [(NSXPCConnection *)self->super._connection setExportedObject:v17];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&buf);
        goto LABEL_3;
      }
      v22 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded failed [application failed to launch]", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded failed [application not installed]", (uint8_t *)&buf, 2u);
      }
    }

LABEL_32:
    os_unfair_lock_unlock(p_lock);
    return;
  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "systemMusicPlayer _establishConnectionIfNeeded failed [👮‍♂️ denied due to authorization status]", (uint8_t *)&buf, 2u);
  }
}

void __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "systemMusicPlayer connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

void __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke_9(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "systemMusicPlayer connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)openToPlayQueueDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  id v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "openToPlayQueueDescriptor", (const char *)&unk_1956A9243, buf, 2u);
  }

  [(MPMusicPlayerController *)self setQueueWithDescriptor:v4];
  unint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "openToPlayQueueDescriptor:prepare", (const char *)&unk_1956A9243, buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke;
  v11[3] = &unk_1E57F3D80;
  v11[4] = self;
  v11[5] = v6;
  [(MPMusicPlayerController *)self prepareToPlayWithCompletionHandler:v11];
}

void __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "openToPlayQueueDescriptor:prepare", (const char *)&unk_1956A9243, buf, 2u);
  }

  id v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "openToPlayQueueDescriptor: failed [prepare failed] error=%{public}@", buf, 0xCu);
    }

    unint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 40);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)id buf = 138543362;
      id v16 = v3;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "openToPlayQueueDescriptor", "error=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v12 = *(void *)(a1 + 40);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "openToPlayQueueDescriptor:openURL", (const char *)&unk_1956A9243, buf, 2u);
    }

    v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"music://show-now-playing"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke_1;
    v14[3] = &unk_1E57F3D58;
    uint64_t v13 = *(void *)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    v14[5] = v13;
    MPUIApplicationOpenURL(v10, MEMORY[0x1E4F1CC08], v14);
  }
}

void __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke_1(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "openToPlayQueueDescriptor:openURL", "success=%{BOOL}u", (uint8_t *)v13, 8u);
  }

  if (a2)
  {
    [*(id *)(a1 + 32) play];
    id v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v13[0]) = 0;
      v10 = (const char *)&unk_1956A9243;
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "openToPlayQueueDescriptor", v10, (uint8_t *)v13, 2u);
    }
  }
  else
  {
    os_signpost_id_t v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "openToPlayQueueDescriptor: failed [open URL failed]", (uint8_t *)v13, 2u);
    }

    os_signpost_id_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v8 = v12;
    os_signpost_id_t v9 = *(void *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v13[0]) = 0;
      v10 = "failed to open URL";
      goto LABEL_13;
    }
  }
}

- (int64_t)playbackState
{
  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MPMusicPlayerSystemController;
    return [(MPMusicPlayerController *)&v5 playbackState];
  }
  else if ([(MPMusicPlayerSystemController *)self _shouldAccessCache])
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "systemMusicPlayer playbackState returning paused due to cached data", buf, 2u);
    }

    return 2;
  }
  else
  {
    return 0;
  }
}

@end