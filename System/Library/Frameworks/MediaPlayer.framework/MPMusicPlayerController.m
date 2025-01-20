@interface MPMusicPlayerController
+ (MPMusicPlayerApplicationController)applicationQueuePlayer;
+ (MPMusicPlayerController)alloc;
+ (MPMusicPlayerController)systemMusicPlayer;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isGeniusAvailable;
- (BOOL)isGeniusAvailableForSeedItems:(id)a3;
- (BOOL)isNowPlayingItemFromGeniusMix;
- (BOOL)isPreparedToPlay;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (BOOL)prioritizeStartupOverQuality;
- (BOOL)setNowPlayingUID:(unint64_t)a3 error:(id *)a4;
- (BOOL)setQueueWithSeedItems:(id)a3;
- (BOOL)userQueueModificationsDisabled;
- (MPMediaItem)nowPlayingItem;
- (MPMusicPlaybackState)playbackState;
- (MPMusicPlayerController)initWithClientIdentifier:(id)a3;
- (MPMusicPlayerController)initWithClientIdentifier:(id)a3 queue:(id)a4;
- (MPMusicPlayerControllerNowPlaying)lastServerNowPlaying;
- (MPMusicPlayerControllerNowPlaying)serverNowPlaying;
- (MPMusicPlayerControllerNowPlayingTimeSnapshot)lastServerTimeSnapshot;
- (MPMusicPlayerControllerNowPlayingTimeSnapshot)serverTimeSnapshot;
- (MPMusicPlayerQueueDescriptor)serverQueueDescriptor;
- (MPMusicPlayerQueueDescriptor)targetQueueDescriptor;
- (MPMusicRepeatMode)repeatMode;
- (MPMusicShuffleMode)shuffleMode;
- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat;
- (MPVolumeController)volumeController;
- (NSArray)lastContentItemIDs;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSUInteger)indexOfNowPlayingItem;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (double)currentPlaybackTime;
- (float)currentPlaybackRate;
- (float)volume;
- (id)_mediaItemFromNowPlaying:(id)a3;
- (id)_nowPlaying;
- (id)_queueDescriptor;
- (id)_snapshot;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)nowPlayingAtIndex:(int64_t)a3;
- (id)nowPlayingItemAtIndex:(unint64_t)a3;
- (id)queueAsQuery;
- (id)queueAsRadioStation;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (int64_t)_serverRepeatMode;
- (int64_t)_serverShuffleMode;
- (int64_t)notificationsCounter;
- (int64_t)playbackSpeed;
- (unint64_t)currentChapterIndex;
- (unint64_t)nowPlayingUID;
- (unint64_t)nowPlayingUIDAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItems;
- (void)_clearConnection;
- (void)_establishConnectionIfNeeded;
- (void)_onQueue_applyServerStateUpdateRecord:(id)a3;
- (void)_postPrivateQueueDidChangeNotificationWithContentItemIDs:(id)a3;
- (void)_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4;
- (void)_setNowPlayingItemWithIdentifier:(id)a3;
- (void)_setServerRepeatMode:(int64_t)a3;
- (void)_setServerShuffleMode:(int64_t)a3;
- (void)_validateServer;
- (void)appendQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor;
- (void)applyServerStateUpdateRecord:(id)a3;
- (void)beginGeneratingPlaybackNotifications;
- (void)beginSeekingBackward;
- (void)beginSeekingForward;
- (void)dealloc;
- (void)endGeneratingPlaybackNotifications;
- (void)endSeeking;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)onServer:(id)a3;
- (void)onServerAsync:(id)a3 errorHandler:(id)a4;
- (void)onServerAsync:(id)a3 errorHandler:(id)a4 timeout:(double)a5 retryEnabled:(BOOL)a6;
- (void)pause;
- (void)pauseWithFadeoutDuration:(double)a3;
- (void)play;
- (void)prepareToPlay;
- (void)prepareToPlayWithCompletionHandler:(id)a3 timeout:(double)a4;
- (void)prepareToPlayWithCompletionHandler:(void *)completionHandler;
- (void)prependQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor;
- (void)serverItemDidEnd;
- (void)serverPlaybackModeDidChangeAffectingQueue:(BOOL)a3;
- (void)serverQueueDidEnd;
- (void)setCurrentPlaybackRate:(float)a3;
- (void)setCurrentPlaybackTime:(double)a3;
- (void)setNowPlayingItem:(MPMediaItem *)nowPlayingItem;
- (void)setNowPlayingUID:(unint64_t)a3;
- (void)setPrioritizeStartupOverQuality:(BOOL)a3;
- (void)setQueueWithDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor;
- (void)setQueueWithItemCollection:(MPMediaItemCollection *)itemCollection;
- (void)setQueueWithQuery:(MPMediaQuery *)query;
- (void)setQueueWithQuery:(id)a3 firstItem:(id)a4;
- (void)setQueueWithRadioStation:(id)a3;
- (void)setQueueWithStoreIDs:(NSArray *)storeIDs;
- (void)setRepeatMode:(MPMusicRepeatMode)repeatMode;
- (void)setServerNowPlaying:(id)a3;
- (void)setServerQueueDescriptor:(id)a3;
- (void)setServerTimeSnapshot:(id)a3;
- (void)setShuffleMode:(MPMusicShuffleMode)shuffleMode;
- (void)setUserQueueModificationsDisabled:(BOOL)a3;
- (void)setVolume:(float)volume;
- (void)shuffle;
- (void)skipToBeginning;
- (void)skipToBeginningOrPreviousItem;
- (void)skipToNextItem;
- (void)skipToPreviousItem;
- (void)stop;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MPMusicPlayerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_targetQueueDescriptor, 0);
  objc_storeStrong((id *)&self->_lastContentItemIDs, 0);
  objc_storeStrong((id *)&self->_lastServerNowPlaying, 0);
  objc_storeStrong((id *)&self->_lastServerTimeSnapshot, 0);
  objc_storeStrong((id *)&self->_serverQueueDescriptor, 0);
  objc_storeStrong((id *)&self->_serverTimeSnapshot, 0);
  objc_storeStrong((id *)&self->_serverNowPlaying, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setUserQueueModificationsDisabled:(BOOL)a3
{
  self->_userQueueModificationsDisabled = a3;
}

- (BOOL)userQueueModificationsDisabled
{
  return self->_userQueueModificationsDisabled;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (int64_t)notificationsCounter
{
  return self->_notificationsCounter;
}

- (MPMusicPlayerQueueDescriptor)targetQueueDescriptor
{
  return self->_targetQueueDescriptor;
}

- (NSArray)lastContentItemIDs
{
  return self->_lastContentItemIDs;
}

- (MPMusicPlayerControllerNowPlaying)lastServerNowPlaying
{
  return self->_lastServerNowPlaying;
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)lastServerTimeSnapshot
{
  return self->_lastServerTimeSnapshot;
}

- (MPMusicPlayerQueueDescriptor)serverQueueDescriptor
{
  return self->_serverQueueDescriptor;
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)serverTimeSnapshot
{
  return self->_serverTimeSnapshot;
}

- (MPMusicPlayerControllerNowPlaying)serverNowPlaying
{
  return self->_serverNowPlaying;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isPreparedToPlay
{
  return self->_isPreparedToPlay;
}

- (void)_postPrivateQueueDidChangeNotificationWithContentItemIDs:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSString *)self->_clientIdentifier isEqualToString:@"MusicKit_applicationMusicPlayer"])
  {
    v5 = self->_lastContentItemIDs;
    if (v5 == v4)
    {
    }
    else
    {
      v6 = v5;
      char v7 = [(NSArray *)v5 isEqual:v4];

      if ((v7 & 1) == 0)
      {
        v8 = (NSArray *)[(NSArray *)v4 copy];
        lastContentItemIDs = self->_lastContentItemIDs;
        self->_lastContentItemIDs = v8;

        if (v4)
        {
          v12 = @"_contentItemIDs";
          v13[0] = v4;
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        }
        else
        {
          v10 = 0;
        }
        v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 postNotificationName:@"_MPMusicPlayerControllerQueueDidChangeNotification" object:self userInfo:v10];
      }
    }
  }
}

- (id)_mediaItemFromNowPlaying:(id)a3
{
  id v4 = a3;
  v5 = [v4 item];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MPMusicPlayerController__mediaItemFromNowPlaying___block_invoke;
    v11[3] = &unk_1E57EFF20;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v6 setFallbackArtworkCatalogBlock:v11];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  char v7 = [_MPMusicPlayerMediaItemProxy alloc];
  v8 = [v4 itemIdentifier];
  v9 = [(_MPMusicPlayerMediaItemProxy *)v7 initWithItemIdentifier:v8 item:v5];

  return v9;
}

MPArtworkCatalog *__52__MPMusicPlayerController__mediaItemFromNowPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  v5 = 0;
  if (WeakRetained && v3) {
    v5 = [[MPArtworkCatalog alloc] initWithToken:v3 dataSource:WeakRetained];
  }

  return v5;
}

- (id)_snapshot
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  serverTimeSnapshot = self->_serverTimeSnapshot;
  if (!serverTimeSnapshot)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    char v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getTimeSnapshot", (const char *)&unk_1956A9243, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getTimeSnapshot ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __36__MPMusicPlayerController__snapshot__block_invoke;
    v13[3] = &unk_1E57EFC70;
    v13[4] = self;
    [(MPMusicPlayerController *)self onServer:v13];
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getTimeSnapshot", (const char *)&unk_1956A9243, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getTimeSnapshot ", buf, 0xCu);
    }

    serverTimeSnapshot = self->_serverTimeSnapshot;
  }

  return serverTimeSnapshot;
}

uint64_t __36__MPMusicPlayerController__snapshot__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__MPMusicPlayerController__snapshot__block_invoke_2;
  v3[3] = &unk_1E57EFE30;
  v3[4] = *(void *)(a1 + 32);
  return [a2 getTimeSnapshotWithReply:v3];
}

void __36__MPMusicPlayerController__snapshot__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)_nowPlaying
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  serverNowPlaying = self->_serverNowPlaying;
  if (!serverNowPlaying)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    char v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getNowPlaying", (const char *)&unk_1956A9243, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getNowPlaying ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __38__MPMusicPlayerController__nowPlaying__block_invoke;
    v13[3] = &unk_1E57EFC70;
    v13[4] = self;
    [(MPMusicPlayerController *)self onServer:v13];
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getNowPlaying", (const char *)&unk_1956A9243, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getNowPlaying ", buf, 0xCu);
    }

    serverNowPlaying = self->_serverNowPlaying;
  }

  return serverNowPlaying;
}

uint64_t __38__MPMusicPlayerController__nowPlaying__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__MPMusicPlayerController__nowPlaying__block_invoke_2;
  v3[3] = &unk_1E57EFEF8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 getNowPlayingWithReply:v3];
}

void __38__MPMusicPlayerController__nowPlaying__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v7, "msv_description");
      int v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "Failed to get server now playing error=%{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v10 + 44) && !*(void *)(v10 + 104) && *(void *)(v10 + 56))
  {
    *(unsigned char *)(v10 + 44) = 1;
    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "_nowPlaying getter marking player as prepared to play because we have a valid server now playing object.", (uint8_t *)&v13, 2u);
    }

    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPMediaPlaybackIsPreparedToPlayDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (id)_queueDescriptor
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  serverQueueDescriptor = self->_serverQueueDescriptor;
  if (!serverQueueDescriptor)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getDescriptor", (const char *)&unk_1956A9243, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getDescriptor ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __43__MPMusicPlayerController__queueDescriptor__block_invoke;
    v13[3] = &unk_1E57EFC70;
    v13[4] = self;
    [(MPMusicPlayerController *)self onServer:v13];
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    uint64_t v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getDescriptor", (const char *)&unk_1956A9243, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getDescriptor ", buf, 0xCu);
    }

    serverQueueDescriptor = self->_serverQueueDescriptor;
  }

  return serverQueueDescriptor;
}

uint64_t __43__MPMusicPlayerController__queueDescriptor__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__MPMusicPlayerController__queueDescriptor__block_invoke_2;
  v3[3] = &unk_1E57EFED0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 getDescriptorWithReply:v3];
}

void __43__MPMusicPlayerController__queueDescriptor__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "msv_description");
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to get server queue descriptor error=%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v5;
}

- (void)onServerAsync:(id)a3 errorHandler:(id)a4 timeout:(double)a5 retryEnabled:(BOOL)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(MPMusicPlayerController *)self _establishConnectionIfNeeded];
  id v12 = objc_alloc(MEMORY[0x1E4F77968]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke;
  v38[3] = &unk_1E57F3380;
  v38[4] = self;
  uint64_t v13 = (void *)[v12 initWithTimeout:v38 interruptionHandler:1.0];
  id v14 = objc_alloc(MEMORY[0x1E4F77968]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_146;
  v36[3] = &unk_1E57F0480;
  v36[4] = self;
  id v15 = v11;
  id v37 = v15;
  uint64_t v16 = (void *)[v14 initWithTimeout:v36 interruptionHandler:a5];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_150;
  v33[3] = &unk_1E57EFE58;
  id v17 = v13;
  id v34 = v17;
  id v18 = v16;
  id v35 = v18;
  v19 = (void *)MEMORY[0x19971E0F0](v33);
  connection = self->_connection;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_2;
  v28[3] = &unk_1E57EFEA8;
  v21 = v19;
  BOOL v32 = a6;
  v28[4] = self;
  id v29 = v21;
  id v22 = v10;
  id v30 = v22;
  id v23 = v15;
  id v31 = v23;
  v24 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
  if (v24 || !v21[2](v21))
  {
    (*((void (**)(id, void *, unsigned int (**)(void)))v22 + 2))(v22, v24, v21);
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28228];
    v40[0] = @"Failed to obtain remoteObject [nil server]";
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v27 = [v25 errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:10 userInfo:v26];

    (*((void (**)(id, void *))v23 + 2))(v23, v27);
  }
}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v4 = result;
    id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "ASYNC-WATCHDOG-1: Attempting to wake up the remote process", v6, 2u);
    }

    return [*(id *)(v4 + 32) _establishConnectionIfNeeded];
  }
  return result;
}

void __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_146(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "ASYNC-WATCHDOG-2: Tearing down connection", v7, 2u);
    }

    [*(id *)(a1 + 32) _clearConnection];
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28228];
    v9[0] = @"Remote call timed out";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = [v4 errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:9 userInfo:v5];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_150(uint64_t a1)
{
  [*(id *)(a1 + 32) disarm];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 disarm];
}

void __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    if (*(unsigned char *)(a1 + 64)
      && ([v3 code] == 4097 || objc_msgSend(v3, "code") == 4099)
      && ([v3 domain],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]],
          v4,
          v5))
    {
      id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection was interrupted or invalidated while obtaining remoteObject, retrying", buf, 2u);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(NSObject **)(v7 + 128);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_152;
      block[3] = &unk_1E57EFE80;
      block[4] = v7;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      dispatch_async(v8, block);
    }
    else
    {
      uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v3;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain remoteObject: %{public}@", buf, 0xCu);
      }

      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      id v17 = v3;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v12 = [v10 errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:10 userInfo:v11];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_152(uint64_t a1)
{
  return [*(id *)(a1 + 32) onServerAsync:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48) timeout:0 retryEnabled:4.0];
}

- (void)onServerAsync:(id)a3 errorHandler:(id)a4
{
}

- (void)onServer:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  [(MPMusicPlayerController *)self _establishConnectionIfNeeded];
  id v5 = objc_alloc(MEMORY[0x1E4F77968]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__MPMusicPlayerController_onServer___block_invoke;
  v11[3] = &unk_1E57F3380;
  void v11[4] = self;
  id v6 = (void *)[v5 initWithTimeout:v11 interruptionHandler:1.0];
  id v7 = objc_alloc(MEMORY[0x1E4F77968]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__MPMusicPlayerController_onServer___block_invoke_142;
  v10[3] = &unk_1E57F3380;
  v10[4] = self;
  uint64_t v8 = (void *)[v7 initWithTimeout:v10 interruptionHandler:4.0];
  uint64_t v9 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_145];
  v4[2](v4, v9);

  [v6 disarm];
  [v8 disarm];
}

uint64_t __36__MPMusicPlayerController_onServer___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v4 = result;
    id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "SYNC-WATCHDOG-1: Attempting to wake up the remote process", v6, 2u);
    }

    return [*(id *)(v4 + 32) _establishConnectionIfNeeded];
  }
  return result;
}

uint64_t __36__MPMusicPlayerController_onServer___block_invoke_142(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v4 = result;
    id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "SYNC-WATCHDOG-2: Tearing down connection", v6, 2u);
    }

    return [*(id *)(v4 + 32) _clearConnection];
  }
  return result;
}

void __36__MPMusicPlayerController_onServer___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain synchronousRemoteObject: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_validateServer
{
  uint64_t v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_138];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MPMusicPlayerController__validateServer__block_invoke_139;
  v4[3] = &unk_1E57EFE30;
  v4[4] = self;
  [v3 getTimeSnapshotWithReply:v4];
}

void __42__MPMusicPlayerController__validateServer__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Server validation returned with snapshot %@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
}

void __42__MPMusicPlayerController__validateServer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Server validation failed with error=%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_establishConnectionIfNeeded
{
  if (dyld_program_sdk_at_least()) {
    +[MPMediaLibrary requestAuthorization:&__block_literal_global_130];
  }
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"MPMusicPlayerController.m", 960, @"Subclass %@ must implement -%@ defined in %@.", v6, v7, @"[MPMusicPlayerController class]" object file lineNumber description];
  }
}

- (void)_clearConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MPMusicPlayerController__clearConnection__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__MPMusicPlayerController__clearConnection__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 25);
  *(unsigned char *)(v2 + 25) = 0;
  [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if (v3)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [*(id *)(a1 + 32) _postPrivateQueueDidChangeNotificationWithContentItemIDs:0];
    [v12 postNotificationName:@"MPMusicPlayerControllerQueueDidChangeNotification" object:*(void *)(a1 + 32)];
    [v12 postNotificationName:@"MPMusicPlayerControllerNowPlayingItemDidChangeNotification" object:*(void *)(a1 + 32)];
    [v12 postNotificationName:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  id v5 = [(MPMusicPlayerController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MPMusicPlayerController_volumeController_mutedStateDidChange___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __64__MPMusicPlayerController_volumeController_mutedStateDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPMusicPlayerControllerVolumeDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = [(MPMusicPlayerController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPMusicPlayerController_volumeController_volumeValueDidChange___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __65__MPMusicPlayerController_volumeController_volumeValueDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPMusicPlayerControllerVolumeDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  int v3 = [a3 token];
  uint64_t v4 = [v3 artworkIdentifier];

  return v4;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 token];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v14[3] = &unk_1E57EFDE8;
  id v15 = v8;
  id v16 = v6;
  id v17 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
  v12[3] = &unk_1E57F90A0;
  id v13 = v17;
  id v9 = v17;
  id v10 = v6;
  id v11 = v8;
  [(MPMusicPlayerController *)self onServerAsync:v14 errorHandler:v12 timeout:0 retryEnabled:4.0];
}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1[4];
  id v7 = a2;
  uint64_t v8 = [v6 artworkIdentifier];
  id v9 = [a1[4] itemIdentifier];
  [a1[5] scaledFittingSize];
  double v11 = v10;
  double v13 = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v15[3] = &unk_1E57EFDC0;
  id v17 = v5;
  id v16 = a1[5];
  id v18 = a1[6];
  id v14 = v5;
  objc_msgSend(v7, "getImageForArtworkIdentifier:itemIdentifier:atSize:reply:", v8, v9, v15, v11, v13);
}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Failed to loadRepresentationForArtworkCatalog with error: %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  id v10 = v3;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v8 = [v6 errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:500 userInfo:v7];
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);
}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    if (v10)
    {
      id v6 = [MEMORY[0x1E4FB1818] imageWithData:v10];
      id v7 = [*(id *)(a1 + 32) visualIdenticalityIdentifier];
      [*(id *)(a1 + 32) scaledFittingSize];
      uint64_t v8 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v7, v6);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_4:

      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:404 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v6);
      goto LABEL_4;
    }
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
  }
LABEL_7:
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  id v3 = [a3 token];
  uint64_t v4 = [v3 artworkIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)serverQueueDidEnd
{
  id v3 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v3 setQueueDidEnd:1];
  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v3];
}

- (void)serverItemDidEnd
{
  id v3 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v3 setItemDidEnd:1];
  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v3];
}

- (void)serverPlaybackModeDidChangeAffectingQueue:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setHasRepeatMode:1];
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setQueueDidChange:v3];
  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v5];
}

- (void)setServerTimeSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setHasTimeSnapshot:1];
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setTimeSnapshot:v4];

  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v5];
}

- (void)setServerNowPlaying:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setHasNowPlaying:1];
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setNowPlaying:v4];

  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v5];
}

- (void)setServerQueueDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setHasQueueDescriptor:1];
  [(MPMusicPlayerServerStateUpdateRecord *)v5 setQueueDescriptor:v4];

  [(MPMusicPlayerServerStateUpdateRecord *)v5 setQueueDidChange:1];
  [(MPMusicPlayerController *)self applyServerStateUpdateRecord:v5];
}

- (void)_onQueue_applyServerStateUpdateRecord:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 hasQueueDescriptor])
  {
    BOOL v5 = [v4 queueDescriptor];
    serverQueueDescriptor = self->_serverQueueDescriptor;
    self->_serverQueueDescriptor = v5;
  }
  int v7 = [v4 hasNowPlaying];
  if (v7)
  {
    uint64_t v8 = [v4 nowPlaying];
    objc_storeStrong((id *)&self->_serverNowPlaying, v8);
    if (self->_isPreparedToPlay || self->_targetQueueDescriptor || !self->_serverNowPlaying)
    {
      int v9 = 0;
    }
    else
    {
      self->_isPreparedToPlay = 1;
      id v37 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_1952E8000, v37, OS_LOG_TYPE_DEFAULT, "applyServerStateUpdateRecord marking player as prepared to play because we have a valid server now playing object.", v38, 2u);
      }

      int v9 = 1;
    }
  }
  else
  {
    int v9 = 0;
    uint64_t v8 = 0;
  }
  if ([v4 hasTimeSnapshot])
  {
    id v10 = [v4 timeSnapshot];
    objc_storeStrong((id *)&self->_serverTimeSnapshot, v10);
    lastServerTimeSnapshot = self->_lastServerTimeSnapshot;
    if (lastServerTimeSnapshot)
    {
      uint64_t v12 = [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)lastServerTimeSnapshot state];
      if (v12 == [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10 state])
      {
        [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)self->_lastServerTimeSnapshot rate];
        float v14 = v13;
        [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10 rate];
        float v16 = v15;
        BOOL v17 = v14 != v15;
        if ([(MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10 state] != 1)
        {
          if (v14 == v16) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      if ([(MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10 state] == 1)
      {
        BOOL v17 = 1;
LABEL_16:
        [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10 rate];
        if (v18 == 0.0 || !v17) {
          goto LABEL_19;
        }
      }
    }
LABEL_18:
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:self];

LABEL_19:
    uint64_t v20 = self->_lastServerTimeSnapshot;
    self->_lastServerTimeSnapshot = v10;
  }
  if (([v4 hasRepeatMode] & 1) != 0 || objc_msgSend(v4, "hasShuffleMode"))
  {
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:self];
  }
  if ([v4 hasContentItemIDs])
  {
    id v22 = [v4 contentItemIDs];
    [(MPMusicPlayerController *)self _postPrivateQueueDidChangeNotificationWithContentItemIDs:v22];
  }
  if ([v4 queueDidChange])
  {
    id v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"MPMusicPlayerControllerQueueDidChangeNotification" object:self];
  }
  if ([v4 itemDidEnd])
  {
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 postNotificationName:@"MPMusicPlayerControllerItemPlaybackDidEndNotification" object:self];
  }
  if ([v4 queueDidEnd])
  {
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 postNotificationName:@"_MPMusicPlayerControllerQueueDidEndNotification" object:self];
  }
  if (v7)
  {
    id v26 = [(MPMusicPlayerControllerNowPlaying *)self->_lastServerNowPlaying itemIdentifier];
    id v27 = [v8 itemIdentifier];
    if (v26 == v27)
    {
    }
    else
    {
      int v28 = [v26 isEqual:v27];

      if (!v28)
      {

LABEL_37:
        id v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v30 postNotificationName:@"MPMusicPlayerControllerNowPlayingItemDidChangeNotification" object:self];

LABEL_38:
        id v31 = [(MPMusicPlayerControllerNowPlaying *)self->_lastServerNowPlaying artworkIdentifier];
        id v32 = [v8 artworkIdentifier];
        if (v31 == v32)
        {
        }
        else
        {
          v33 = v32;
          char v34 = [v31 isEqual:v32];

          if (v34)
          {
LABEL_43:
            objc_storeStrong((id *)&self->_lastServerNowPlaying, v8);
            goto LABEL_44;
          }
          id v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v31 postNotificationName:@"_MPMusicPlayerControllerArtworkDidChangeNotification" object:self];
        }

        goto LABEL_43;
      }
    }
    char v29 = [v4 hasTimeMetadata];

    if ((v29 & 1) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_44:
  if ([v4 audioFormatDidChange])
  {
    id v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 postNotificationName:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:self];
  }
  if (v9)
  {
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 postNotificationName:@"MPMediaPlaybackIsPreparedToPlayDidChangeNotification" object:self];
  }
}

- (void)applyServerStateUpdateRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MPMusicPlayerController_applyServerStateUpdateRecord___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__MPMusicPlayerController_applyServerStateUpdateRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_applyServerStateUpdateRecord:", *(void *)(a1 + 40));
}

- (BOOL)setQueueWithSeedItems:(id)a3
{
  return 0;
}

- (BOOL)isGeniusAvailableForSeedItems:(id)a3
{
  return 0;
}

- (BOOL)isGeniusAvailable
{
  return 0;
}

- (unint64_t)currentChapterIndex
{
  return 0;
}

- (BOOL)isNowPlayingItemFromGeniusMix
{
  return 0;
}

- (int64_t)playbackSpeed
{
  return 0;
}

- (void)setVolume:(float)volume
{
}

- (float)volume
{
  [(MPVolumeController *)self->_volumeController volumeValue];
  return result;
}

- (void)endSeeking
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "endSeeking", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: endSeeking ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_122];
  int v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "endSeeking", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: endSeeking ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __37__MPMusicPlayerController_endSeeking__block_invoke(uint64_t a1, void *a2)
{
  return [a2 endSeek];
}

- (void)beginSeekingBackward
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "beginSeekingBackward", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: beginSeekingBackward ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_120];
  int v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "beginSeekingBackward", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: beginSeekingBackward ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __47__MPMusicPlayerController_beginSeekingBackward__block_invoke(uint64_t a1, void *a2)
{
  return [a2 beginSeekWithDirection:-1];
}

- (void)beginSeekingForward
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "beginSeekingForward", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: beginSeekingForward ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_118];
  int v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "beginSeekingForward", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: beginSeekingForward ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __46__MPMusicPlayerController_beginSeekingForward__block_invoke(uint64_t a1, void *a2)
{
  return [a2 beginSeekWithDirection:1];
}

- (void)setCurrentPlaybackRate:(float)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  *(double *)&os_signpost_id_t v6 = COERCE_DOUBLE(os_signpost_id_generate(v5));

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = a3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setCurrentPlaybackRate", "rate=%g", buf, 0xCu);
  }

  int v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v14 = *(double *)&v6;
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setCurrentPlaybackRate rate=%g", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke;
  v11[3] = &__block_descriptor_44_e41_v16__0___MPMusicPlayerControllerServer__8l;
  float v12 = a3;
  void v11[4] = v6;
  [(MPMusicPlayerController *)self onServer:v11];
}

uint64_t __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(void *)(a1 + 32);
  return [a2 setPlaybackRate:v4 completion:a3];
}

void __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setCurrentPlaybackRate", (const char *)&unk_1956A9243, (uint8_t *)&v7, 2u);
  }

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "END [%lld]: setCurrentPlaybackRate ", (uint8_t *)&v7, 0xCu);
  }
}

- (float)currentPlaybackRate
{
  id v2 = [(MPMusicPlayerController *)self _snapshot];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    double v13 = a3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setCurrentPlaybackTime", "time=%g", buf, 0xCu);
  }

  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v13 = *(double *)&v6;
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setCurrentPlaybackTime time=%g", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke;
  v11[3] = &__block_descriptor_48_e41_v16__0___MPMusicPlayerControllerServer__8l;
  *(double *)&void v11[4] = a3;
  void v11[5] = v6;
  [(MPMusicPlayerController *)self onServer:v11];
}

uint64_t __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(void *)(a1 + 40);
  return [a2 setElapsedTime:v4 completion:v2];
}

void __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  float v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setCurrentPlaybackTime", (const char *)&unk_1956A9243, (uint8_t *)&v7, 2u);
  }

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "END [%lld]: setCurrentPlaybackTime ", (uint8_t *)&v7, 0xCu);
  }
}

- (double)currentPlaybackTime
{
  double v2 = [(MPMusicPlayerController *)self _snapshot];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "stop", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: stop ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_113];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "stop", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: stop ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __31__MPMusicPlayerController_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)pause
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "pause", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: pause ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_111];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "pause", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: pause ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __32__MPMusicPlayerController_pause__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pauseWithFadeDuration:0];
}

- (void)play
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(MPMusicPlayerController *)self isPreparedToPlay]) {
    [(MPMusicPlayerController *)self prepareToPlay];
  }
  double v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "play", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: play ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_109];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "play", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  double v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: play ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __31__MPMusicPlayerController_play__block_invoke(uint64_t a1, void *a2)
{
  return [a2 play];
}

- (void)prepareToPlay
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(MPMusicPlayerController *)self isPreparedToPlay])
  {
    double v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      os_signpost_id_t v4 = "prepareToPlay short-circuit [already prepared to play]";
      BOOL v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl(&dword_1952E8000, v5, v6, v4, buf, 2u);
    }
  }
  else
  {
    targetQueueDescriptor = self->_targetQueueDescriptor;
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    double v3 = v8;
    if (targetQueueDescriptor)
    {
      os_signpost_id_t v9 = os_signpost_id_generate(v8);

      id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      double v11 = v10;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "prepareToPlay:sync", (const char *)&unk_1956A9243, buf, 2u);
      }

      int v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v22 = v9;
        _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prepareToPlay:sync ", buf, 0xCu);
      }

      serverNowPlaying = self->_serverNowPlaying;
      self->_serverNowPlaying = 0;

      serverTimeSnapshot = self->_serverTimeSnapshot;
      self->_serverTimeSnapshot = 0;

      serverQueueDescriptor = self->_serverQueueDescriptor;
      self->_serverQueueDescriptor = 0;

      uint64_t v16 = self->_targetQueueDescriptor;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __40__MPMusicPlayerController_prepareToPlay__block_invoke;
      v17[3] = &unk_1E57EFD58;
      id v19 = self;
      os_signpost_id_t v20 = v9;
      float v18 = v16;
      double v3 = v16;
      [(MPMusicPlayerController *)self onServer:v17];
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      os_signpost_id_t v4 = "prepareToPlay failed [no target descriptor]";
      BOOL v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }
}

void __40__MPMusicPlayerController_prepareToPlay__block_invoke(int8x16_t *a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MPMusicPlayerController_prepareToPlay__block_invoke_2;
  v3[3] = &unk_1E57EFD30;
  uint64_t v5 = a1[3].i64[0];
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  [a2 setDescriptor:(id)v2.i64[0] completion:v3];
}

void __40__MPMusicPlayerController_prepareToPlay__block_invoke_2(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int8x16_t v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend(v3, "msv_description");
      int v15 = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay error=%{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  os_log_type_t v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int v7 = v6;
  os_signpost_id_t v8 = a1[6];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "prepareToPlay:sync", (const char *)&unk_1956A9243, (uint8_t *)&v15, 2u);
  }

  os_signpost_id_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)a1[6];
    int v15 = 134217984;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:sync ", (uint8_t *)&v15, 0xCu);
  }

  if (!v3)
  {
    uint64_t v11 = a1[4];
    if (*(void *)(v11 + 104) == a1[5])
    {
      *(unsigned char *)(v11 + 44) = 1;
      uint64_t v12 = a1[4];
      os_signpost_id_t v13 = *(void **)(v12 + 104);
      *(void *)(v12 + 104) = 0;

      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"MPMediaPlaybackIsPreparedToPlayDidChangeNotification" object:a1[4]];
    }
  }
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  int8x16_t v2 = [(MPMusicPlayerController *)self _nowPlaying];
  id v3 = [v2 audioFormat];

  return (MPNowPlayingInfoAudioFormat *)v3;
}

- (unint64_t)numberOfItems
{
  int8x16_t v2 = [(MPMusicPlayerController *)self _nowPlaying];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)skipToBeginningOrPreviousItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_log_type_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToBeginningOrPreviousItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToBeginningOrPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_107];
  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  uint64_t v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToBeginningOrPreviousItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToBeginningOrPreviousItem ", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __56__MPMusicPlayerController_skipToBeginningOrPreviousItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipWithBehavior:3];
}

- (void)pauseWithFadeoutDuration:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    float v9 = a3;
    *(_DWORD *)buf = 134217984;
    double v18 = v9;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "pauseWithFadeoutDuration", "duration=%f", buf, 0xCu);
  }

  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    float v11 = a3;
    *(_DWORD *)buf = 134218240;
    double v18 = *(double *)&v6;
    __int16 v19 = 2048;
    double v20 = v11;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: pauseWithFadeoutDuration duration=%f", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__MPMusicPlayerController_pauseWithFadeoutDuration___block_invoke;
  v16[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  *(double *)&v16[4] = a3;
  [(MPMusicPlayerController *)self onServer:v16];
  int v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v14, OS_SIGNPOST_INTERVAL_END, v6, "pauseWithFadeoutDuration", (const char *)&unk_1956A9243, buf, 2u);
  }

  uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v18 = *(double *)&v6;
    _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: pauseWithFadeoutDuration ", buf, 0xCu);
  }
}

uint64_t __52__MPMusicPlayerController_pauseWithFadeoutDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pauseWithFadeDuration:(uint64_t)*(double *)(a1 + 32)];
}

- (void)shuffle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "shuffle", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: shuffle ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_105];
  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  float v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "shuffle", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: shuffle ", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __34__MPMusicPlayerController_shuffle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reshuffle];
}

- (id)nowPlayingItemAtIndex:(unint64_t)a3
{
  os_signpost_id_t v4 = [(MPMusicPlayerController *)self nowPlayingAtIndex:a3];
  uint64_t v5 = [(MPMusicPlayerController *)self _mediaItemFromNowPlaying:v4];

  return v5;
}

- (id)nowPlayingAtIndex:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "nowPlayingAtIndex", "index=%lld", buf, 0xCu);
  }

  float v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: nowPlayingAtIndex index=%lld", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__13159;
  double v20 = __Block_byref_object_dispose__13160;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke;
  v15[3] = &unk_1E57EFC20;
  void v15[4] = buf;
  v15[5] = a3;
  [(MPMusicPlayerController *)self onServer:v15];
  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  float v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "nowPlayingAtIndex", (const char *)&unk_1956A9243, v16, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v16 = 134217984;
    os_signpost_id_t v17 = v6;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: nowPlayingAtIndex ", v16, 0xCu);
  }

  id v13 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v13;
}

uint64_t __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke_2;
  v4[3] = &unk_1E57EFD08;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  return [a2 getNowPlayingAtIndex:v2 reply:v4];
}

void __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v8 = objc_msgSend(v6, "msv_description");
      int v11 = 134218242;
      uint64_t v12 = MEMORY[0x1E4F148E0];
      __int16 v13 = 2114;
      os_signpost_id_t v14 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed getting nowPlayingAtIndex: %ld error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)queueAsRadioStation
{
  uint64_t v2 = [(MPMusicPlayerController *)self _queueDescriptor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v3 = [v2 radioStation];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_signpost_id_t v4 = [v2 playParametersQueue];
      id v5 = [v4 firstObject];

      unint64_t v3 = [[MPRadioStation alloc] initWithPlayParameters:v5];
    }
    else
    {
      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (id)queueAsQuery
{
  uint64_t v2 = [(MPMusicPlayerController *)self _queueDescriptor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v3 = [v2 query];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)setQueueWithRadioStation:(id)a3
{
  id v4 = a3;
  id v5 = [[MPMusicPlayerRadioStationQueueDescriptor alloc] initWithRadioStation:v4];

  [(MPMusicPlayerController *)self setQueueWithDescriptor:v5];
}

- (void)setQueueWithQuery:(id)a3 firstItem:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  int v7 = [[MPMusicPlayerMediaItemQueueDescriptor alloc] initWithQuery:v6];

  if (v8) {
    [(MPMusicPlayerMediaItemQueueDescriptor *)v7 setStartItem:v8];
  }
  [(MPMusicPlayerController *)self setQueueWithDescriptor:v7];
}

- (void)endGeneratingPlaybackNotifications
{
}

- (void)beginGeneratingPlaybackNotifications
{
}

- (void)skipToPreviousItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToPreviousItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_99];
  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToPreviousItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToPreviousItem ", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __45__MPMusicPlayerController_skipToPreviousItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipWithBehavior:0];
}

- (void)skipToBeginning
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToBeginning", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToBeginning ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_97_13165];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_END, v4, "skipToBeginning", (const char *)&unk_1956A9243, (uint8_t *)&v12, 2u);
  }

  int v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    os_signpost_id_t v13 = v4;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToBeginning ", (uint8_t *)&v12, 0xCu);
  }
}

uint64_t __42__MPMusicPlayerController_skipToBeginning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipWithBehavior:2];
}

- (void)skipToNextItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToNextItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToNextItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  [(MPMusicPlayerController *)self onServer:&__block_literal_global_95];
  id v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToNextItem", (const char *)&unk_1956A9243, (uint8_t *)&v13, 2u);
  }

  int v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    os_signpost_id_t v14 = v4;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToNextItem ", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t __41__MPMusicPlayerController_skipToNextItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipWithBehavior:1];
}

- (void)prepareToPlayWithCompletionHandler:(void *)completionHandler
{
}

- (void)prepareToPlayWithCompletionHandler:(id)a3 timeout:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a3;
  if ([(MPMusicPlayerController *)self isPreparedToPlay])
  {
    int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "prepareToPlay short-circuit [already prepared to play]", buf, 2u);
    }

    v6[2](v6, 0);
  }
  else
  {
    targetQueueDescriptor = self->_targetQueueDescriptor;
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v10 = v9;
    if (targetQueueDescriptor)
    {
      os_signpost_id_t v11 = os_signpost_id_generate(v9);

      int v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      int v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1952E8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "prepareToPlay:async", (const char *)&unk_1956A9243, buf, 2u);
      }

      os_signpost_id_t v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v29 = v11;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prepareToPlay:async ", buf, 0xCu);
      }

      serverNowPlaying = self->_serverNowPlaying;
      self->_serverNowPlaying = 0;

      serverQueueDescriptor = self->_serverQueueDescriptor;
      self->_serverQueueDescriptor = 0;

      os_signpost_id_t v17 = self->_targetQueueDescriptor;
      [(MPMusicPlayerQueueDescriptor *)v17 setDisableQueueModifications:self->_userQueueModificationsDisabled];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke;
      v23[3] = &unk_1E57EFCC0;
      os_signpost_id_t v27 = v11;
      v24 = v17;
      v25 = self;
      id v26 = v6;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_89;
      v20[3] = &unk_1E57F5158;
      os_signpost_id_t v22 = v11;
      v20[4] = self;
      id v21 = v26;
      double v18 = v17;
      [(MPMusicPlayerController *)self onServerAsync:v23 errorHandler:v20 timeout:1 retryEnabled:a4];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "prepareToPlay failed [no target descriptor]", buf, 2u);
      }

      __int16 v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPMusicPlayerControllerErrorDomain" code:1 userInfo:0];
      ((void (**)(id, void *))v6)[2](v6, v19);
    }
  }
}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  int v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "prepareToPlay connected to server, setting queue descriptor", buf, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_85;
  v12[3] = &unk_1E57EFC98;
  uint64_t v16 = *(void *)(a1 + 56);
  id v14 = v5;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v15 = *(id *)(a1 + 48);
  id v10 = v5;
  [v6 setDescriptor:v8 completion:v12];
}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay with error: %{public}@", buf, 0xCu);
  }

  id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "prepareToPlay:async", "nil server", buf, 2u);
  }

  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    id v17 = v9;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:async nil server", buf, 0xCu);
  }

  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_90;
  v13[3] = &unk_1E57F9140;
  id v11 = *(id *)(a1 + 40);
  id v14 = v3;
  id v15 = v11;
  id v12 = v3;
  dispatch_async(v10, v13);
}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPMusicPlayerControllerErrorDomain", 6, *(void *)(a1 + 32), @"Prepare to play failed");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_signpost_id_t v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543362;
      id v21 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay error=%{public}@", buf, 0xCu);
    }
  }
  id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "prepareToPlay:async", (const char *)&unk_1956A9243, buf, 2u);
  }

  id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    id v21 = v10;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:async ", buf, 0xCu);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 128);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_86;
    v15[3] = &unk_1E57F4E70;
    id v12 = v3;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = v14;
    id v19 = *(id *)(a1 + 56);
    dispatch_async(v11, v15);
  }
}

uint64_t __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_86(void *a1)
{
  if (!a1[4])
  {
    uint64_t v2 = a1[5];
    if (*(void *)(v2 + 104) == a1[6])
    {
      *(unsigned char *)(v2 + 44) = 1;
      uint64_t v6 = a1[5];
      os_signpost_id_t v7 = *(void **)(v6 + 104);
      *(void *)(v6 + 104) = 0;

      os_signpost_id_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"MPMediaPlaybackIsPreparedToPlayDidChangeNotification" object:a1[5]];

      id v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        os_signpost_id_t v4 = "prepareToPlay completed with current target queue descriptor";
        id v5 = buf;
        goto LABEL_7;
      }
    }
    else
    {
      id v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        os_signpost_id_t v4 = "prepareToPlay completed with past queue descriptor";
        id v5 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))(a1[7]);
}

- (void)appendQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = descriptor;
  BOOL userQueueModificationsDisabled = self->_userQueueModificationsDisabled;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  p_super = v6;
  if (userQueueModificationsDisabled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = self;
      _os_log_impl(&dword_1952E8000, p_super, OS_LOG_TYPE_ERROR, "[MPMusicPlayerController:%p] appendQueueDescriptor | ignoring append [userQueueModificationsDisabled]", buf, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v6, v4);

    id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    __int16 v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = (MPMusicPlayerController *)v4;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appendQueueDescriptor", "descriptor=%{public}@", buf, 0xCu);
    }

    id v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = (MPMusicPlayerController *)v8;
      __int16 v20 = 2114;
      id v21 = v4;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: appendQueueDescriptor descriptor=%{public}@", buf, 0x16u);
    }

    serverNowPlaying = self->_serverNowPlaying;
    self->_serverNowPlaying = 0;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke;
    v16[3] = &unk_1E57EFC70;
    uint64_t v17 = v4;
    [(MPMusicPlayerController *)self onServer:v16];
    uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v14, OS_SIGNPOST_INTERVAL_END, v8, "appendQueueDescriptor", (const char *)&unk_1956A9243, buf, 2u);
    }

    id v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = (MPMusicPlayerController *)v8;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: appendQueueDescriptor ", buf, 0xCu);
    }

    p_super = &v17->super;
  }
}

uint64_t __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendDescriptor:*(void *)(a1 + 32) completion:&__block_literal_global_83];
}

void __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v4 = objc_msgSend(v2, "msv_description");
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "appendQueueDescriptor failed error=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)prependQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = descriptor;
  BOOL userQueueModificationsDisabled = self->_userQueueModificationsDisabled;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  p_super = v6;
  if (userQueueModificationsDisabled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = self;
      _os_log_impl(&dword_1952E8000, p_super, OS_LOG_TYPE_ERROR, "[MPMusicPlayerController:%p] prependQueueDescriptor | ignoring prepend [userQueueModificationsDisabled]", buf, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v6, v4);

    id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    __int16 v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = (MPMusicPlayerController *)v4;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "prependQueueDescriptor", "descriptor=%{public}@", buf, 0xCu);
    }

    id v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = (MPMusicPlayerController *)v8;
      __int16 v20 = 2114;
      id v21 = v4;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prependQueueDescriptor descriptor=%{public}@", buf, 0x16u);
    }

    serverNowPlaying = self->_serverNowPlaying;
    self->_serverNowPlaying = 0;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke;
    v16[3] = &unk_1E57EFC70;
    uint64_t v17 = v4;
    [(MPMusicPlayerController *)self onServer:v16];
    uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    id v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v14, OS_SIGNPOST_INTERVAL_END, v8, "prependQueueDescriptor", (const char *)&unk_1956A9243, buf, 2u);
    }

    id v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = (MPMusicPlayerController *)v8;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: prependQueueDescriptor ", buf, 0xCu);
    }

    p_super = &v17->super;
  }
}

uint64_t __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prependDescriptor:*(void *)(a1 + 32) completion:&__block_literal_global_81_13170];
}

void __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v4 = objc_msgSend(v2, "msv_description");
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "prependQueueDescriptor failed error=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setQueueWithDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = descriptor;
  int v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 138543362;
    os_signpost_id_t v18 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setQueue", "descriptor=%{public}@", (uint8_t *)&v17, 0xCu);
  }

  id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218242;
    os_signpost_id_t v18 = v6;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setQueue descriptor=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  self->_isPreparedToPlay = 0;
  __int16 v10 = (MPMusicPlayerQueueDescriptor *)[(MPMusicPlayerQueueDescriptor *)v4 copy];
  targetQueueDescriptor = self->_targetQueueDescriptor;
  self->_targetQueueDescriptor = v10;

  if ((unint64_t)(self->_repeatMode - 1) >= 3) {
    int64_t v12 = 3;
  }
  else {
    int64_t v12 = self->_repeatMode - 1;
  }
  [(MPMusicPlayerQueueDescriptor *)self->_targetQueueDescriptor setRepeatType:v12];
  if ((unint64_t)(self->_shuffleMode - 1) >= 3) {
    int64_t v13 = 1000;
  }
  else {
    int64_t v13 = self->_shuffleMode - 1;
  }
  [(MPMusicPlayerQueueDescriptor *)self->_targetQueueDescriptor setShuffleType:v13];
  [(MPMusicPlayerQueueDescriptor *)self->_targetQueueDescriptor setPrioritizeStartupOverQuality:[(MPMusicPlayerController *)self prioritizeStartupOverQuality]];
  id v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v15, OS_SIGNPOST_INTERVAL_END, v6, "setQueue", (const char *)&unk_1956A9243, (uint8_t *)&v17, 2u);
  }

  id v16 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134217984;
    os_signpost_id_t v18 = v6;
    _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEBUG, "END [%lld]: setQueue ", (uint8_t *)&v17, 0xCu);
  }
}

- (void)setQueueWithStoreIDs:(NSArray *)storeIDs
{
  os_signpost_id_t v4 = storeIDs;
  int v5 = [[MPMusicPlayerStoreQueueDescriptor alloc] initWithStoreIDs:v4];

  [(MPMusicPlayerController *)self setQueueWithDescriptor:v5];
}

- (void)setQueueWithItemCollection:(MPMediaItemCollection *)itemCollection
{
  os_signpost_id_t v4 = itemCollection;
  int v5 = [[MPMusicPlayerMediaItemQueueDescriptor alloc] initWithItemCollection:v4];

  [(MPMusicPlayerController *)self setQueueWithDescriptor:v5];
}

- (void)setQueueWithQuery:(MPMediaQuery *)query
{
}

- (NSUInteger)indexOfNowPlayingItem
{
  id v2 = [(MPMusicPlayerController *)self _nowPlaying];
  NSUInteger v3 = [v2 index];

  return v3;
}

- (void)_setNowPlayingItemWithIdentifier:(id)a3
{
}

- (void)_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = v7;
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = v7;
  }
  id v10 = v9;
  id v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v10);

  int64_t v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "setNowPlayingItem", (const char *)&unk_1956A9243, buf, 2u);
  }

  id v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v25 = v12;
    _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setNowPlayingItem ", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke;
  v21[3] = &unk_1E57EFC48;
  id v22 = v6;
  id v23 = v8;
  id v16 = v8;
  id v17 = v6;
  [(MPMusicPlayerController *)self onServer:v21];
  os_signpost_id_t v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  __int16 v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v19, OS_SIGNPOST_INTERVAL_END, v12, "setNowPlayingItem", (const char *)&unk_1956A9243, buf, 2u);
  }

  __int16 v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v25 = v12;
    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEBUG, "END [%lld]: setNowPlayingItem ", buf, 0xCu);
  }
}

uint64_t __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNowPlayingItem:*(void *)(a1 + 32) itemIdentifier:*(void *)(a1 + 40) completion:&__block_literal_global_78_13178];
}

void __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    NSUInteger v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v4 = objc_msgSend(v2, "msv_description");
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Failed to set now playing item error=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (unint64_t)nowPlayingUIDAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(MPMusicPlayerController *)self nowPlayingAtIndex:a3];
  unint64_t v4 = [v3 itemUID];

  return v4;
}

- (BOOL)setNowPlayingUID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "setNowPlayingUID", (const char *)&unk_1956A9243, (uint8_t *)&buf, 2u);
  }

  id v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setNowPlayingUID ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__13159;
  id v23 = __Block_byref_object_dispose__13160;
  id v24 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke;
  v17[3] = &unk_1E57EFC20;
  void v17[4] = &buf;
  v17[5] = a3;
  [(MPMusicPlayerController *)self onServer:v17];
  os_signpost_id_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int64_t v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)os_signpost_id_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v13, OS_SIGNPOST_INTERVAL_END, v8, "setNowPlayingUID", (const char *)&unk_1956A9243, v18, 2u);
  }

  id v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)os_signpost_id_t v18 = 134217984;
    os_signpost_id_t v19 = v8;
    _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEBUG, "END [%lld]: setNowPlayingUID ", v18, 0xCu);
  }

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v15 = *(void *)(*((void *)&buf + 1) + 40) != 0;
  _Block_object_dispose(&buf, 8);

  return v15;
}

uint64_t __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke_2;
  v4[3] = &unk_1E57EFBF8;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  return [a2 setNowPlayingUID:v2 completion:v4];
}

void __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = objc_msgSend(v3, "msv_description");
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to set now playing UID error=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (void)setNowPlayingUID:(unint64_t)a3
{
}

- (unint64_t)nowPlayingUID
{
  uint64_t v2 = [(MPMusicPlayerController *)self _nowPlaying];
  unint64_t v3 = [v2 itemUID];

  return v3;
}

- (void)setNowPlayingItem:(MPMediaItem *)nowPlayingItem
{
  int v8 = nowPlayingItem;
  if ([(MPMusicPlayerController *)self isPreparedToPlay]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v4 = v8;
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = v4;
      uint64_t v6 = [(MPMediaItem *)v7 itemIdentifier];
      unint64_t v4 = [(MPMediaItem *)v7 item];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(MPMusicPlayerController *)self _setNowPlayingItem:v4 itemIdentifier:v6];
  }
  else
  {
    [(MPMusicPlayerQueueDescriptor *)self->_targetQueueDescriptor setStartItem:v8];
  }
}

- (MPMediaItem)nowPlayingItem
{
  unint64_t v3 = [(MPMusicPlayerController *)self _nowPlaying];
  unint64_t v4 = [(MPMusicPlayerController *)self _mediaItemFromNowPlaying:v3];

  return (MPMediaItem *)v4;
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  BOOL v3 = a3;
  self->_prioritizeStartupOverQuality = a3;
  uint64_t v5 = [(MPMusicPlayerController *)self targetQueueDescriptor];

  if (v5)
  {
    id v6 = [(MPMusicPlayerController *)self targetQueueDescriptor];
    [v6 setPrioritizeStartupOverQuality:v3];
  }
}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (void)_setServerShuffleMode:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v15 = a3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setShuffleMode", "shuffleMode=%ld", buf, 0xCu);
  }

  id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218240;
    int64_t v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a3;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setShuffleMode shuffleMode=%ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __49__MPMusicPlayerController__setServerShuffleMode___block_invoke;
  v13[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  void v13[4] = a3;
  [(MPMusicPlayerController *)self onServer:v13];
  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "setShuffleMode", (const char *)&unk_1956A9243, buf, 2u);
  }

  os_signpost_id_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v15 = v6;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: setShuffleMode ", buf, 0xCu);
  }
}

uint64_t __49__MPMusicPlayerController__setServerShuffleMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShuffleMode:*(void *)(a1 + 32)];
}

- (int64_t)_serverShuffleMode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "getShuffleMode", (const char *)&unk_1956A9243, (uint8_t *)&buf, 2u);
  }

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getShuffleMode ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __45__MPMusicPlayerController__serverShuffleMode__block_invoke;
  v13[3] = &unk_1E57EFBB0;
  void v13[4] = &buf;
  [(MPMusicPlayerController *)self onServer:v13];
  int v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v9, OS_SIGNPOST_INTERVAL_END, v4, "getShuffleMode", (const char *)&unk_1956A9243, v14, 2u);
  }

  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v14 = 134217984;
    os_signpost_id_t v15 = v4;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEBUG, "END [%lld]: getShuffleMode ", v14, 0xCu);
  }

  int64_t v11 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v11;
}

uint64_t __45__MPMusicPlayerController__serverShuffleMode__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__MPMusicPlayerController__serverShuffleMode__block_invoke_2;
  v3[3] = &unk_1E57EFB88;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 getShuffleModeWithReply:v3];
}

uint64_t __45__MPMusicPlayerController__serverShuffleMode__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_setServerRepeatMode:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v15 = a3;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setRepeatMode", "repeatMode=%ld", buf, 0xCu);
  }

  id v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218240;
    int64_t v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a3;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setRepeatMode repeatMode=%ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __48__MPMusicPlayerController__setServerRepeatMode___block_invoke;
  v13[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  void v13[4] = a3;
  [(MPMusicPlayerController *)self onServer:v13];
  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  int64_t v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "setRepeatMode", (const char *)&unk_1956A9243, buf, 2u);
  }

  os_signpost_id_t v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v15 = v6;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: setRepeatMode ", buf, 0xCu);
  }
}

uint64_t __48__MPMusicPlayerController__setServerRepeatMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRepeatMode:*(void *)(a1 + 32)];
}

- (int64_t)_serverRepeatMode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "getRepeatMode", (const char *)&unk_1956A9243, (uint8_t *)&buf, 2u);
  }

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getRepeatMode ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __44__MPMusicPlayerController__serverRepeatMode__block_invoke;
  v13[3] = &unk_1E57EFBB0;
  void v13[4] = &buf;
  [(MPMusicPlayerController *)self onServer:v13];
  int v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  id v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v9, OS_SIGNPOST_INTERVAL_END, v4, "getRepeatMode", (const char *)&unk_1956A9243, v14, 2u);
  }

  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v14 = 134217984;
    os_signpost_id_t v15 = v4;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEBUG, "END [%lld]: getRepeatMode ", v14, 0xCu);
  }

  int64_t v11 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v11;
}

uint64_t __44__MPMusicPlayerController__serverRepeatMode__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MPMusicPlayerController__serverRepeatMode__block_invoke_2;
  v3[3] = &unk_1E57EFB88;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 getRepeatModeWithReply:v3];
}

uint64_t __44__MPMusicPlayerController__serverRepeatMode__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setShuffleMode:(MPMusicShuffleMode)shuffleMode
{
  self->_shuffleMode = shuffleMode;
  uint64_t v5 = [(MPMusicPlayerController *)self targetQueueDescriptor];

  if (v5)
  {
    if ((unint64_t)(self->_shuffleMode - 1) >= 3) {
      int64_t v6 = 1000;
    }
    else {
      int64_t v6 = self->_shuffleMode - 1;
    }
    uint64_t v7 = [(MPMusicPlayerController *)self targetQueueDescriptor];
    [v7 setShuffleType:v6];
  }
  if ([(MPMusicPlayerController *)self isPreparedToPlay])
  {
    [(MPMusicPlayerController *)self _setServerShuffleMode:shuffleMode];
  }
}

- (MPMusicShuffleMode)shuffleMode
{
  if (![(MPMusicPlayerController *)self isPreparedToPlay]) {
    return self->_shuffleMode;
  }

  return [(MPMusicPlayerController *)self _serverShuffleMode];
}

- (void)setRepeatMode:(MPMusicRepeatMode)repeatMode
{
  self->_repeatMode = repeatMode;
  uint64_t v5 = [(MPMusicPlayerController *)self targetQueueDescriptor];

  if (v5)
  {
    if ((unint64_t)(self->_repeatMode - 1) >= 3) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = self->_repeatMode - 1;
    }
    uint64_t v7 = [(MPMusicPlayerController *)self targetQueueDescriptor];
    [v7 setRepeatType:v6];
  }
  if ([(MPMusicPlayerController *)self isPreparedToPlay])
  {
    [(MPMusicPlayerController *)self _setServerRepeatMode:repeatMode];
  }
}

- (MPMusicRepeatMode)repeatMode
{
  if (![(MPMusicPlayerController *)self isPreparedToPlay]) {
    return self->_repeatMode;
  }

  return [(MPMusicPlayerController *)self _serverRepeatMode];
}

- (MPMusicPlaybackState)playbackState
{
  uint64_t v2 = [(MPMusicPlayerController *)self _snapshot];
  MPMusicPlaybackState v3 = [v2 state];

  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p client=%@>", objc_opt_class(), self, self->_clientIdentifier];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerController;
  [(MPMusicPlayerController *)&v3 dealloc];
}

- (MPMusicPlayerController)initWithClientIdentifier:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(MPMusicPlayerController *)self isMemberOfClass:objc_opt_class()])
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MPMusicPlayerController.m" lineNumber:101 description:@"Must initialize a concrete instance of MPMusicPlayerController."];
  }
  v23.receiver = self;
  v23.super_class = (Class)MPMusicPlayerController;
  id v9 = [(MPMusicPlayerController *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_serverValidated = 0;
    if (v8)
    {
      int64_t v11 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v11;
    }
    else
    {
      int64_t v13 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v14 = MEMORY[0x1E4F14428];
      queue = v10->_queue;
      v10->_queue = v13;
    }

    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [v7 copy];
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = (NSString *)v15;

    uint64_t v17 = [MPVolumeController alloc];
    uint64_t v18 = objc_alloc_init(MPVolumeControllerSystemDataSource);
    uint64_t v19 = [(MPVolumeController *)v17 initWithDataSource:v18];
    volumeController = v10->_volumeController;
    v10->_volumeController = (MPVolumeController *)v19;

    [(MPVolumeController *)v10->_volumeController setDelegate:v10];
    *(int64x2_t *)&v10->_shuffleMode = vdupq_n_s64(1uLL);
  }

  return v10;
}

- (MPMusicPlayerController)initWithClientIdentifier:(id)a3
{
  return [(MPMusicPlayerController *)self initWithClientIdentifier:a3 queue:0];
}

+ (MPMusicPlayerController)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    return (MPMusicPlayerController *)[MPMusicPlayerSystemController alloc];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___MPMusicPlayerController;
    return (MPMusicPlayerController *)objc_msgSendSuper2(&v4, sel_alloc);
  }
}

+ (MPMusicPlayerApplicationController)applicationQueuePlayer
{
  if (applicationQueuePlayer_onceToken != -1) {
    dispatch_once(&applicationQueuePlayer_onceToken, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)applicationQueuePlayer___applicationMusicPlayer;

  return (MPMusicPlayerApplicationController *)v2;
}

void __49__MPMusicPlayerController_applicationQueuePlayer__block_invoke()
{
  v0 = [[MPMusicPlayerApplicationController alloc] initWithClientIdentifier:@"applicationQueuePlayer" queue:0];
  uint64_t v1 = (void *)applicationQueuePlayer___applicationMusicPlayer;
  applicationQueuePlayer___applicationMusicPlayer = (uint64_t)v0;
}

+ (MPMusicPlayerController)systemMusicPlayer
{
  if (systemMusicPlayer_onceToken != -1) {
    dispatch_once(&systemMusicPlayer_onceToken, &__block_literal_global_13244);
  }
  uint64_t v2 = (void *)systemMusicPlayer___systemMusicPlayer;

  return (MPMusicPlayerController *)v2;
}

void __44__MPMusicPlayerController_systemMusicPlayer__block_invoke()
{
  v0 = [(MPMusicPlayerController *)[MPMusicPlayerSystemController alloc] initWithClientIdentifier:@"systemMusicPlayer" queue:0];
  uint64_t v1 = (void *)systemMusicPlayer___systemMusicPlayer;
  systemMusicPlayer___systemMusicPlayer = (uint64_t)v0;
}

@end