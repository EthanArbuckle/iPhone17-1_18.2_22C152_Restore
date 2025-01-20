@interface LPiTunesPlayButtonControl
- (BOOL)hasMuteControl;
- (BOOL)isPlaying;
- (BOOL)matchesNowPlayingItem;
- (LPiTunesPlayButtonControl)initWithPlaybackInformation:(id)a3 style:(id)a4 theme:(id)a5;
- (_MRSystemAppPlaybackQueue)createPlaybackQueue;
- (double)desiredUpdateIntervalForMediaRemotePlaybackObserver:(id)a3;
- (id)mediaPlaybackApplicationID;
- (void)buttonPressed:(id)a3;
- (void)createPlaybackQueue;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setPlaying:(BOOL)a3;
- (void)startPlaybackForLyricExcerpt;
- (void)startPlaying;
- (void)updatePlayState;
@end

@implementation LPiTunesPlayButtonControl

- (LPiTunesPlayButtonControl)initWithPlaybackInformation:(id)a3 style:(id)a4 theme:(id)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPiTunesPlayButtonControl;
  v10 = [(LPPlayButtonControl *)&v14 initWithStyle:a4 theme:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_playbackInformation, a3);
    v12 = v11;
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_playbackDidEndNotificationToken];

  v4.receiver = self;
  v4.super_class = (Class)LPiTunesPlayButtonControl;
  [(LPiTunesPlayButtonControl *)&v4 dealloc];
}

- (void)updatePlayState
{
  v3 = [(LPiTunesPlayButtonControl *)self window];

  if (!v3) {
    return;
  }
  BOOL v4 = [(LPiTunesPlayButtonControl *)self matchesNowPlayingItem];
  if ([(LPPlayButtonControl *)self isIndeterminate])
  {
    if (v4)
    {
      id v7 = +[LPMediaRemotePlaybackObserver shared];
      int v5 = [v7 isPlaying];

      if (v5) {
        [(LPPlayButtonControl *)self endIndeterminateAnimation];
      }
    }
  }
  if (v4 || [(LPPlayButtonControl *)self isIndeterminate])
  {
    [(LPPlayButtonControl *)self setPlayButtonState:1];
    if ([(LPPlayButtonControl *)self isIndeterminate]) {
      return;
    }
    if (v4)
    {
      id v8 = +[LPMediaRemotePlaybackObserver shared];
      [v8 elapsedFractionForPlaybackInformation:self->_playbackInformation];
      *(float *)&double v6 = v6;
      [(LPPlayButtonControl *)self setProgress:1 animated:v6];

      id v9 = +[LPMediaRemotePlaybackObserver shared];
      -[LPPlayButtonControl showPlayIndicator:](self, "showPlayIndicator:", [v9 isPlaying] ^ 1);

      return;
    }
  }
  else
  {
    [(LPPlayButtonControl *)self setPlayButtonState:0];
    if ([(LPPlayButtonControl *)self isIndeterminate]) {
      return;
    }
  }
  [(LPPlayButtonControl *)self hideProgressAnimated:0];

  [(LPPlayButtonControl *)self showPlayIndicator:1];
}

- (double)desiredUpdateIntervalForMediaRemotePlaybackObserver:(id)a3
{
  v3 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation lyricExcerpt];
  if (v3) {
    double v4 = 0.1;
  }
  else {
    double v4 = 0.5;
  }

  return v4;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)LPiTunesPlayButtonControl;
  [(LPiTunesPlayButtonControl *)&v6 didMoveToWindow];
  v3 = [(LPiTunesPlayButtonControl *)self window];

  double v4 = +[LPMediaRemotePlaybackObserver shared];
  int v5 = v4;
  if (v3)
  {
    [v4 addClient:self];

    [(LPiTunesPlayButtonControl *)self updatePlayState];
  }
  else
  {
    [v4 removeClient:self];
  }
}

- (void)startPlaybackForLyricExcerpt
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v3 = [getMPMusicPlayerControllerClass() systemMusicPlayer];
  double v4 = [getMPMusicPlayerControllerClass() applicationMusicPlayer];
  self->_wasPlayingMusicWhenLyricExcerptPlaybackStarted = [v3 playbackState] == 1;
  if (!self->_playbackDidEndNotificationToken)
  {
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    objc_super v6 = (void **)getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr;
    uint64_t v43 = getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr;
    if (!getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_block_invoke;
      v38 = &unk_1E5B04EB8;
      v39 = &v40;
      id v7 = MediaPlayerLibrary_0();
      v41[3] = (uint64_t)dlsym(v7, "MPMusicPlayerControllerItemPlaybackDidEndNotification");
      getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr = *(void *)(v39[1] + 24);
      objc_super v6 = (void **)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v6)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = [NSString stringWithUTF8String:"NSString *getMPMusicPlayerControllerItemPlaybackDidEndNotification(void)"];
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"LPiTunesPlayButtonControl.m", 29, @"%s", dlerror());

      __break(1u);
    }
    id v8 = *v6;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke;
    v33[3] = &unk_1E5B05E70;
    v33[4] = self;
    id v34 = v3;
    id v9 = v8;
    v10 = [v5 addObserverForName:v9 object:0 queue:0 usingBlock:v33];
    playbackDidEndNotificationToken = self->_playbackDidEndNotificationToken;
    self->_playbackDidEndNotificationToken = v10;
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v12 = (void *)getMPMusicPlayerStoreQueueDescriptorClass_softClass;
  uint64_t v43 = getMPMusicPlayerStoreQueueDescriptorClass_softClass;
  if (!getMPMusicPlayerStoreQueueDescriptorClass_softClass)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getMPMusicPlayerStoreQueueDescriptorClass_block_invoke;
    v38 = &unk_1E5B04EB8;
    v39 = &v40;
    __getMPMusicPlayerStoreQueueDescriptorClass_block_invoke((uint64_t)&v35);
    v12 = (void *)v41[3];
  }
  v13 = v12;
  _Block_object_dispose(&v40, 8);
  id v14 = [v13 alloc];
  v15 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storeIdentifier];
  v44[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v17 = (void *)[v14 initWithStoreIDs:v16];

  v18 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation lyricExcerpt];
  v19 = [v18 startTime];
  [v19 doubleValue];
  double v21 = v20;
  v22 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storeIdentifier];
  [v17 setStartTime:v22 forItemWithStoreID:v21 + -1.0];

  v23 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation lyricExcerpt];
  v24 = [v23 endTime];
  [v24 doubleValue];
  double v26 = v25;
  v27 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storeIdentifier];
  [v17 setEndTime:v27 forItemWithStoreID:v26 + 1.0];

  [v17 setPlayActivityFeatureName:@"iMessage_LyricsShare"];
  [v4 setQueueWithDescriptor:v17];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke_2;
  v31[3] = &unk_1E5B05E98;
  id v28 = v4;
  id v32 = v28;
  [v28 prepareToPlayWithCompletionHandler:v31];
}

void __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 560))
  {
    [*(id *)(a1 + 40) play];
    *(unsigned char *)(*(void *)(a1 + 32) + 560) = 0;
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(a1 + 32) + 552)];

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 552);
  *(void *)(v4 + 552) = 0;
}

uint64_t __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (_MRSystemAppPlaybackQueue)createPlaybackQueue
{
  v17[1] = *MEMORY[0x1E4F143B8];
  p_playbackInformation = (uint64_t *)&self->_playbackInformation;
  v3 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storeIdentifier];

  if (!v3)
  {
    id v14 = LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(LPiTunesPlayButtonControl *)p_playbackInformation createPlaybackQueue];
    }
    abort();
  }
  switch([(id)*p_playbackInformation type])
  {
    case 0:
    case 1:
    case 5:
      uint64_t v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      int v5 = [(id)*p_playbackInformation storeIdentifier];
      v17[0] = v5;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      MRSystemAppPlaybackQueueSetFeatureName();
      break;
    case 2:
      uint64_t v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      MRSystemAppPlaybackQueueSetRadioStationIDType();
      id v6 = [(id)*p_playbackInformation storeIdentifier];
      MRSystemAppPlaybackQueueSetRadioStationStringIdentifier();
      goto LABEL_8;
    case 3:
      v10 = NSString;
      v11 = [(id)*p_playbackInformation storeIdentifier];
      v12 = [v10 stringWithFormat:@"podcasts://playPodcast?storeCollectionId=%@", v11];

      uint64_t v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      v15 = v12;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      break;
    case 4:
      id v7 = NSString;
      id v8 = [(id)*p_playbackInformation storeIdentifier];
      id v9 = [v7 stringWithFormat:@"podcasts://playPodcast?storeTrackId=%@", v8];

      uint64_t v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      v16 = v9;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      break;
    case 6:
      uint64_t v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      id v6 = [(id)*p_playbackInformation persistentIdentifier];
      [v6 longLongValue];
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
LABEL_8:

      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

- (id)mediaPlaybackApplicationID
{
  unint64_t v2 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation type];
  if (v2 > 6)
  {
    v3 = 0;
  }
  else if (((1 << v2) & 0x27) != 0)
  {
    v3 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  }
  else if (((1 << v2) & 0x18) != 0)
  {
    v3 = @"com.apple.podcasts";
  }
  else
  {
    v3 = @"com.apple.iBooks";
  }

  return v3;
}

- (void)startPlaying
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__LPiTunesPlayButtonControl_startPlaying__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v3 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation lyricExcerpt];

  if (v3)
  {
    [(LPiTunesPlayButtonControl *)self startPlaybackForLyricExcerpt];
  }
  else
  {
    [(LPiTunesPlayButtonControl *)self createPlaybackQueue];
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
    uint64_t v4 = [(LPiTunesPlayButtonControl *)self mediaPlaybackApplicationID];
    MRMediaRemoteSetAppPlaybackQueue();
  }
}

uint64_t __41__LPiTunesPlayButtonControl_startPlaying__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginIndeterminateAnimation];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 updatePlayState];
}

- (void)buttonPressed:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(LPiTunesPlayButtonControl *)self matchesNowPlayingItem])
  {
    uint64_t v4 = *MEMORY[0x1E4F77770];
    v5[0] = @"com.apple.LinkPresentation";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    MRMediaRemoteSendCommand();
  }
  else
  {
    [(LPiTunesPlayButtonControl *)self startPlaying];
  }
}

- (BOOL)matchesNowPlayingItem
{
  v3 = +[LPMediaRemotePlaybackObserver shared];
  LOBYTE(self) = [v3 playbackInformationMatchesPlayingItem:self->_playbackInformation];

  return (char)self;
}

- (BOOL)isPlaying
{
  if (![(LPiTunesPlayButtonControl *)self matchesNowPlayingItem]) {
    return 0;
  }
  unint64_t v2 = +[LPMediaRemotePlaybackObserver shared];
  char v3 = [v2 isPlaying];

  return v3;
}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void)setPlaying:(BOOL)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(LPiTunesPlayButtonControl *)self matchesNowPlayingItem])
  {
    uint64_t v4 = *MEMORY[0x1E4F77770];
    v5[0] = @"com.apple.LinkPresentation";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    MRMediaRemoteSendCommand();
  }
  else
  {
    [(LPiTunesPlayButtonControl *)self startPlaying];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackDidEndNotificationToken, 0);

  objc_storeStrong((id *)&self->_playbackInformation, 0);
}

- (void)createPlaybackQueue
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "store identifier for playback information %@ is nil", (uint8_t *)&v3, 0xCu);
}

@end