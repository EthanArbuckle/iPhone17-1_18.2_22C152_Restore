@interface MusicKit_SoftLinking_MPMusicPlayerController
+ (MusicKit_SoftLinking_MPMusicPlayerController)applicationMusicPlayer;
+ (MusicKit_SoftLinking_MPMusicPlayerController)systemMusicPlayer;
+ (NSString)notificationUserInfoKeyContentItemIDs;
+ (NSString)nowPlayingItemDidChangeNotificationName;
+ (NSString)playbackQueueDidChangeNotificationName;
+ (NSString)playbackStateDidChangeNotificationName;
- (BOOL)isPreparedToPlay;
- (MusicKit_SoftLinking_MPMusicPlayerItem)nowPlayingItem;
- (MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat;
- (double)currentPlaybackTime;
- (float)currentPlaybackRate;
- (id)_initWithUnderlyingPlayerController:(id)a3;
- (id)itemsForContentItemIDs:(id)a3;
- (int64_t)playbackState;
- (int64_t)repeatMode;
- (int64_t)shuffleMode;
- (void)_handleNowPlayingItemDidChangeNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_handleQueueDidChangeNotification:(id)a3;
- (void)appendQueueDescriptor:(id)a3;
- (void)beginGeneratingPlaybackNotifications;
- (void)beginSeekingBackward;
- (void)beginSeekingForward;
- (void)dealloc;
- (void)endGeneratingPlaybackNotifications;
- (void)endSeeking;
- (void)pause;
- (void)performQueueTransaction:(id)a3;
- (void)play;
- (void)prepareToPlayWithCompletionHandler:(id)a3;
- (void)prependQueueDescriptor:(id)a3;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4;
- (void)setCurrentPlaybackRate:(float)a3;
- (void)setCurrentPlaybackTime:(double)a3;
- (void)setNowPlayingItemWithIdentifier:(id)a3;
- (void)setQueueWithDescriptor:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleMode:(int64_t)a3;
- (void)skipToBeginning;
- (void)skipToNextItem;
- (void)skipToPreviousItem;
- (void)stop;
@end

@implementation MusicKit_SoftLinking_MPMusicPlayerController

+ (MusicKit_SoftLinking_MPMusicPlayerController)systemMusicPlayer
{
  if (systemMusicPlayer_sSystemMusicPlayerOnceToken[0] != -1) {
    dispatch_once(systemMusicPlayer_sSystemMusicPlayerOnceToken, &__block_literal_global_8);
  }
  v2 = (void *)systemMusicPlayer_sSystemMusicPlayer;

  return (MusicKit_SoftLinking_MPMusicPlayerController *)v2;
}

+ (MusicKit_SoftLinking_MPMusicPlayerController)applicationMusicPlayer
{
  if (applicationMusicPlayer_sApplicationMusicPlayerOnceToken != -1) {
    dispatch_once(&applicationMusicPlayer_sApplicationMusicPlayerOnceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)applicationMusicPlayer_sApplicationMusicPlayer;

  return (MusicKit_SoftLinking_MPMusicPlayerController *)v2;
}

- (id)_initWithUnderlyingPlayerController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerController;
  v6 = [(MusicKit_SoftLinking_MPMusicPlayerController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingPlayerController, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    v9 = getMPMusicPlayerControllerNowPlayingItemDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleNowPlayingItemDidChangeNotification_ name:v9 object:v7->_underlyingPlayerController];

    v10 = getMPMusicPlayerControllerPlaybackStateDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handlePlaybackStateDidChangeNotification_ name:v10 object:v7->_underlyingPlayerController];

    v11 = get_MPMusicPlayerControllerQueueDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleQueueDidChangeNotification_ name:v11 object:v7->_underlyingPlayerController];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = getMPMusicPlayerControllerNowPlayingItemDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingPlayerController];

  id v5 = getMPMusicPlayerControllerPlaybackStateDidChangeNotification();
  [v3 removeObserver:self name:v5 object:self->_underlyingPlayerController];

  v6 = get_MPMusicPlayerControllerQueueDidChangeNotification();
  [v3 removeObserver:self name:v6 object:self->_underlyingPlayerController];

  v7.receiver = self;
  v7.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerController;
  [(MusicKit_SoftLinking_MPMusicPlayerController *)&v7 dealloc];
}

- (MusicKit_SoftLinking_MPMusicPlayerItem)nowPlayingItem
{
  v2 = [(MPMusicPlayerController *)self->_underlyingPlayerController nowPlayingItem];
  v3 = +[MusicKit_SoftLinking_MPMusicPlayerItem playerItemForMediaItem:v2];

  return (MusicKit_SoftLinking_MPMusicPlayerItem *)v3;
}

- (id)itemsForContentItemIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = [(MPMusicPlayerController *)self->_underlyingPlayerController _mediaItemsForContentItemIDs:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_super v13 = objc_msgSend(v6, "objectForKey:", v12, (void)v16);
        v14 = +[MusicKit_SoftLinking_MPMusicPlayerItem playerItemForMediaItem:v13];
        if (v14) {
          [v5 setObject:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)setNowPlayingItemWithIdentifier:(id)a3
{
}

- (void)setQueueWithDescriptor:(id)a3
{
  id v4 = [a3 _underlyingQueueDescriptor];
  [(MPMusicPlayerController *)self->_underlyingPlayerController setQueueWithDescriptor:v4];
}

- (void)prependQueueDescriptor:(id)a3
{
  id v4 = [a3 _underlyingQueueDescriptor];
  [(MPMusicPlayerController *)self->_underlyingPlayerController prependQueueDescriptor:v4];
}

- (void)appendQueueDescriptor:(id)a3
{
  id v4 = [a3 _underlyingQueueDescriptor];
  [(MPMusicPlayerController *)self->_underlyingPlayerController appendQueueDescriptor:v4];
}

- (void)performQueueTransaction:(id)a3
{
  id v4 = a3;
  underlyingPlayerController = self->_underlyingPlayerController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__MusicKit_SoftLinking_MPMusicPlayerController_performQueueTransaction___block_invoke;
  v7[3] = &unk_2644402C0;
  id v8 = v4;
  id v6 = v4;
  [(MPMusicPlayerController *)underlyingPlayerController performQueueTransaction:v7 completionHandler:&__block_literal_global_25];
}

- (int64_t)playbackState
{
  int64_t result = [(MPMusicPlayerController *)self->_underlyingPlayerController playbackState];
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

- (int64_t)repeatMode
{
  int64_t result = [(MPMusicPlayerController *)self->_underlyingPlayerController repeatMode];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (void)setRepeatMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    a3 = 0;
  }
  [(MPMusicPlayerController *)self->_underlyingPlayerController setRepeatMode:a3];
}

- (int64_t)shuffleMode
{
  int64_t result = [(MPMusicPlayerController *)self->_underlyingPlayerController shuffleMode];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (void)setShuffleMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    a3 = 0;
  }
  [(MPMusicPlayerController *)self->_underlyingPlayerController setShuffleMode:a3];
}

- (MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return (MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat *)[(MPMusicPlayerController *)self->_underlyingPlayerController nowPlayingAudioFormat];
}

- (BOOL)isPreparedToPlay
{
  return [(MPMusicPlayerController *)self->_underlyingPlayerController isPreparedToPlay];
}

- (void)prepareToPlayWithCompletionHandler:(id)a3
{
}

- (void)play
{
}

- (void)pause
{
}

- (void)stop
{
}

- (double)currentPlaybackTime
{
  [(MPMusicPlayerController *)self->_underlyingPlayerController currentPlaybackTime];
  return result;
}

- (void)setCurrentPlaybackTime:(double)a3
{
}

- (float)currentPlaybackRate
{
  [(MPMusicPlayerController *)self->_underlyingPlayerController currentPlaybackRate];
  return result;
}

- (void)setCurrentPlaybackRate:(float)a3
{
}

- (void)beginSeekingForward
{
}

- (void)beginSeekingBackward
{
}

- (void)endSeeking
{
}

- (void)skipToNextItem
{
}

- (void)skipToBeginning
{
}

- (void)skipToPreviousItem
{
}

- (void)beginGeneratingPlaybackNotifications
{
}

- (void)endGeneratingPlaybackNotifications
{
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  id v6 = self->_underlyingPlayerController;
  if (a3 == 1)
  {
    id v7 = v6;
    [(MPMusicPlayerController *)v6 _setApplicationMusicPlayerTransitionType:1 withDuration:a4];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(MPMusicPlayerController *)v6 _setApplicationMusicPlayerTransitionType:0];
  }
  id v6 = v7;
LABEL_6:
}

+ (NSString)nowPlayingItemDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMusicPlayerControllerNowPlayingItemDidChangeNotification";
}

+ (NSString)playbackQueueDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackQueueDidChangeNotification";
}

+ (NSString)playbackStateDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackStateDidChangeNotification";
}

+ (NSString)notificationUserInfoKeyContentItemIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr;
  uint64_t v10 = get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr;
  if (!get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_9();
    v8[3] = (uint64_t)dlsym(v3, "_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDs");
    get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  id v4 = *v2;

  return (NSString *)v4;
}

- (void)_handleNowPlayingItemDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMusicPlayerControllerNowPlayingItemDidChangeNotification" object:self userInfo:v6];
}

- (void)_handleQueueDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackQueueDidChangeNotification" object:self userInfo:v6];
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
}

@end