@interface MPNetworkObserver
+ (MPNetworkObserver)sharedNetworkObserver;
- (BOOL)isMusicCellularDownloadingAllowed;
- (BOOL)isMusicCellularStreamingAllowed;
- (BOOL)isStoreCellularNetworkingAllowed;
- (BOOL)isUsingNetwork;
- (BOOL)isVideoCellularStreamingAllowed;
- (MPNetworkObserver)init;
- (id)_init;
- (void)beginUsingNetwork;
- (void)dealloc;
- (void)endUsingNetwork;
- (void)setMusicCellularDownloadingAllowed:(BOOL)a3;
- (void)setMusicCellularStreamingAllowed:(BOOL)a3;
- (void)setVideoCellularStreamingAllowed:(BOOL)a3;
@end

@implementation MPNetworkObserver

- (void).cxx_destruct
{
}

- (BOOL)isUsingNetwork
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MPNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__MPNetworkObserver_isUsingNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16) > 0;
  return result;
}

- (BOOL)isStoreCellularNetworkingAllowed
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

- (void)setMusicCellularDownloadingAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    char v9 = "-[MPNetworkObserver setMusicCellularDownloadingAllowed:]";
    __int16 v10 = 2114;
    v11 = @"AllowsCellularDataDownloads";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Changing %{public}@ preference to %{BOOL}u.", (uint8_t *)&v8, 0x1Cu);
  }

  v5 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    v5 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"AllowsCellularDataDownloads", *v5, @"com.apple.Music");
  CFPreferencesAppSynchronize(@"com.apple.Music");
  uint64_t v6 = [NSString stringWithUTF8String:"com.apple.Music-AllowsCellularDataDownloads"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v6, 0, 0, 1u);
}

- (BOOL)isMusicCellularDownloadingAllowed
{
  return CFPreferencesGetAppBooleanValue(@"AllowsCellularDataDownloads", @"com.apple.Music", 0) != 0;
}

- (void)setVideoCellularStreamingAllowed:(BOOL)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MPNetworkObserver_setVideoCellularStreamingAllowed___block_invoke;
  block[3] = &unk_1E57F6FE0;
  BOOL v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MPNetworkObserverIsVideoCellularStreamingAllowedDidChangeNotification" object:self];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __54__MPNetworkObserver_setVideoCellularStreamingAllowed___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(*(void *)(result + 32) + 32) != *(unsigned __int8 *)(result + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 48);
    CFPreferencesSetAppValue(@"CellularDataMode", (CFPropertyListRef)[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(result + 32) + 32)], @"com.apple.videos-preferences");
    return CFPreferencesAppSynchronize(@"com.apple.videos-preferences");
  }
  return result;
}

- (BOOL)isVideoCellularStreamingAllowed
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MPNetworkObserver_isVideoCellularStreamingAllowed__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__MPNetworkObserver_isVideoCellularStreamingAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setMusicCellularStreamingAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[MPPlaybackUserDefaults standardUserDefaults];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 64;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setPreferredMusicLowBandwidthResolution:v5];
}

- (BOOL)isMusicCellularStreamingAllowed
{
  v2 = +[MPPlaybackUserDefaults standardUserDefaults];
  BOOL v3 = [v2 preferredMusicLowBandwidthResolution] > 0;

  return v3;
}

- (void)endUsingNetwork
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPNetworkObserver_endUsingNetwork__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __36__MPNetworkObserver_endUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 16) = v4;
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(void *)(v5 + 16))
    {
      id v6 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__MPNetworkObserver_endUsingNetwork__block_invoke_2;
      block[3] = &unk_1E57F9EA8;
      block[4] = v5;
      dispatch_async(v6, block);
    }
  }
}

void __36__MPNetworkObserver_endUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPNetworkObserverIsUsingNetworkDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)beginUsingNetwork
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MPNetworkObserver_beginUsingNetwork__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __38__MPNetworkObserver_beginUsingNetwork__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16) == 1)
  {
    id v2 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MPNetworkObserver_beginUsingNetwork__block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = v1;
    dispatch_async(v2, block);
  }
}

void __38__MPNetworkObserver_beginUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPNetworkObserverIsUsingNetworkDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  notify_cancel(self->_musicCellularNetworkingAllowedNotifyToken);
  notify_cancel(self->_videosPreferencesChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)MPNetworkObserver;
  [(MPNetworkObserver *)&v3 dealloc];
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)MPNetworkObserver;
  id v2 = [(MPNetworkObserver *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPNetworkObserver", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__MPNetworkObserver__init__block_invoke;
    handler[3] = &unk_1E57F6F90;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.mobileipod.playbackPreferencesChanged-MusicAllowsCellularData", &v2->_musicCellularNetworkingAllowedNotifyToken, v5, handler);

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __26__MPNetworkObserver__init__block_invoke_2;
    v10[3] = &unk_1E57F6F90;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.Music-AllowsCellularDataDownloads", &v2->_musicCellularNetworkingAllowedNotifyToken, v5, v10);

    v2->_videosAllowsCellularStreaming = CFPreferencesGetAppBooleanValue(@"CellularDataMode", @"com.apple.videos-preferences", 0) != 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__MPNetworkObserver__init__block_invoke_3;
    v7[3] = &unk_1E57F6FB8;
    objc_copyWeak(&v9, &location);
    uint64_t v8 = v2;
    notify_register_dispatch("com.apple.videos-preferences-changed", &v2->_videosPreferencesChangedToken, v5, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__MPNetworkObserver__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    uint64_t v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"MPNetworkObserverIsMusicCellularStreamingAllowedDidChangeNotification" object:WeakRetained];
  }
}

void __26__MPNetworkObserver__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFPreferencesAppSynchronize(@"com.apple.Music");
    uint64_t v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"MPNetworkObserverIsMusicCellularDownloadingAllowedDidChangeNotification" object:WeakRetained];
  }
}

void __26__MPNetworkObserver__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CFPreferencesAppSynchronize(@"com.apple.videos-preferences");
    int v3 = CFPreferencesGetAppBooleanValue(@"CellularDataMode", @"com.apple.videos-preferences", 0) != 0;
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned __int8 *)(v4 + 32) != v3)
    {
      uint64_t v5 = *(NSObject **)(v4 + 24);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      id v9 = __26__MPNetworkObserver__init__block_invoke_4;
      uint64_t v10 = &unk_1E57F9E08;
      id v11 = (id)v4;
      char v12 = v3;
      dispatch_sync(v5, &v7);
      id v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8, v9, v10);
      [v6 postNotificationName:@"MPNetworkObserverIsVideoCellularStreamingAllowedDidChangeNotification" object:WeakRetained];
    }
  }
}

uint64_t __26__MPNetworkObserver__init__block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (MPNetworkObserver)init
{
  return 0;
}

+ (MPNetworkObserver)sharedNetworkObserver
{
  if (sharedNetworkObserver___once != -1) {
    dispatch_once(&sharedNetworkObserver___once, &__block_literal_global_44040);
  }
  id v2 = (void *)sharedNetworkObserver___sharedNetworkObserver;

  return (MPNetworkObserver *)v2;
}

void __42__MPNetworkObserver_sharedNetworkObserver__block_invoke()
{
  id v0 = [[MPNetworkObserver alloc] _init];
  uint64_t v1 = (void *)sharedNetworkObserver___sharedNetworkObserver;
  sharedNetworkObserver___sharedNetworkObserver = (uint64_t)v0;
}

@end