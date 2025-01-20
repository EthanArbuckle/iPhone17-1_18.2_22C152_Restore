@interface CKReusableVideoPlayer
- (AVPlayerViewController)playerViewController;
- (BOOL)isObservingPlayer;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPlaying;
- (BOOL)isReadyForReuse;
- (BOOL)wasPlayingBeforeDisappearing;
- (CKReusableVideoPlayer)init;
- (CKReusableVideoPlayerDelegate)delegate;
- (NSString)videoTransferGUID;
- (void)configureWithPlayerItem:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)removeCurrentPlayerItem;
- (void)removeRateObserverIfNecessary;
- (void)selectedConversationChanged;
- (void)setDelegate:(id)a3;
- (void)setObservingPlayer:(BOOL)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setVideoTransferGUID:(id)a3;
- (void)setWasPlayingBeforeDisappearing:(BOOL)a3;
- (void)willDisappear;
- (void)windowDidClose;
@end

@implementation CKReusableVideoPlayer

- (void)dealloc
{
  [(CKReusableVideoPlayer *)self removeRateObserverIfNecessary];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKReusableVideoPlayer;
  [(CKReusableVideoPlayer *)&v4 dealloc];
}

- (CKReusableVideoPlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKReusableVideoPlayer;
  v2 = [(CKReusableVideoPlayer *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_selectedConversationChanged name:@"CKConversationListSelectionDidChangeNotification" object:0];
  }
  return v2;
}

- (void)configureWithPlayerItem:(id)a3
{
  id v4 = a3;
  if ([(CKReusableVideoPlayer *)self isObservingPlayer]) {
    [(CKReusableVideoPlayer *)self removeRateObserverIfNecessary];
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:v4];

  objc_super v5 = [(CKReusableVideoPlayer *)self playerViewController];
  [v5 setPlayer:v6];

  [v6 addObserver:self forKeyPath:@"rate" options:3 context:CKReusableVideoPlayerObservationContext];
  [(CKReusableVideoPlayer *)self setObservingPlayer:1];
}

- (void)removeCurrentPlayerItem
{
  [(CKReusableVideoPlayer *)self removeRateObserverIfNecessary];
  id v3 = [(CKReusableVideoPlayer *)self playerViewController];
  [v3 setPlayer:0];
}

- (void)willDisappear
{
  BOOL v3 = [(CKReusableVideoPlayer *)self isPlaying];

  [(CKReusableVideoPlayer *)self setWasPlayingBeforeDisappearing:v3];
}

- (void)windowDidClose
{
  if (![(CKReusableVideoPlayer *)self isPictureInPictureActive])
  {
    [(CKReusableVideoPlayer *)self pause];
  }
}

- (BOOL)isReadyForReuse
{
  if ([(CKReusableVideoPlayer *)self isPictureInPictureActive]) {
    return 0;
  }
  else {
    return ![(CKReusableVideoPlayer *)self wasPlayingBeforeDisappearing];
  }
}

- (void)pause
{
  id v3 = [(CKReusableVideoPlayer *)self playerViewController];
  v2 = [v3 player];
  [v2 pause];
}

- (BOOL)isPictureInPictureActive
{
  v2 = [(CKReusableVideoPlayer *)self playerViewController];
  char v3 = [v2 isPictureInPictureActive];

  return v3;
}

- (void)selectedConversationChanged
{
  if (![(CKReusableVideoPlayer *)self isPictureInPictureActive])
  {
    [(CKReusableVideoPlayer *)self pause];
    [(CKReusableVideoPlayer *)self setWasPlayingBeforeDisappearing:0];
  }
}

- (AVPlayerViewController)playerViewController
{
  playerViewController = self->_playerViewController;
  if (!playerViewController)
  {
    id v4 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E4F16750]);
    objc_super v5 = self->_playerViewController;
    self->_playerViewController = v4;

    if ((objc_msgSend(MEMORY[0x1E4F42948], "__ck_currentDeviceIsPadOrMac") & 1) == 0) {
      [(AVPlayerViewController *)self->_playerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:1];
    }
    playerViewController = self->_playerViewController;
  }
  id v6 = playerViewController;

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)CKReusableVideoPlayerObservationContext == a6)
  {
    v7 = [(CKReusableVideoPlayer *)self playerViewController];
    v8 = [v7 player];
    [v8 rate];
    float v10 = v9;

    if (v10 == 0.0)
    {
      [(CKReusableVideoPlayer *)self setPlaying:0];
      id v11 = [(CKReusableVideoPlayer *)self delegate];
      [v11 reusablePlayerDidStop];
    }
    else
    {
      [(CKReusableVideoPlayer *)self setPlaying:1];
      id v11 = [(CKReusableVideoPlayer *)self delegate];
      [v11 reusablePlayerDidStart];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKReusableVideoPlayer;
    -[CKReusableVideoPlayer observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)removeRateObserverIfNecessary
{
  if ([(CKReusableVideoPlayer *)self isObservingPlayer])
  {
    char v3 = [(CKReusableVideoPlayer *)self playerViewController];
    id v4 = [v3 player];
    [v4 removeObserver:self forKeyPath:@"rate" context:CKReusableVideoPlayerObservationContext];

    [(CKReusableVideoPlayer *)self setObservingPlayer:0];
  }
}

- (NSString)videoTransferGUID
{
  return self->_videoTransferGUID;
}

- (void)setVideoTransferGUID:(id)a3
{
}

- (CKReusableVideoPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKReusableVideoPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setPlayerViewController:(id)a3
{
}

- (BOOL)isObservingPlayer
{
  return self->_observingPlayer;
}

- (void)setObservingPlayer:(BOOL)a3
{
  self->_observingPlayer = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (BOOL)wasPlayingBeforeDisappearing
{
  return self->_wasPlayingBeforeDisappearing;
}

- (void)setWasPlayingBeforeDisappearing:(BOOL)a3
{
  self->_wasPlayingBeforeDisappearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_videoTransferGUID, 0);
}

@end