@interface PHLivePhotoView
+ (UIImage)livePhotoBadgeImageWithOptions:(PHLivePhotoBadgeOptions)badgeOptions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime;
- ($97BACB40282BF2823C2E803DDEC6F6A6)trimmedTimeRange;
- (BOOL)_playbackRequested;
- (BOOL)_playingVitality;
- (BOOL)isDisplayingPhoto;
- (BOOL)isMuted;
- (BOOL)livePhotoViewCanBeginInteractivePlayback:(id)a3;
- (BOOL)photosAssetDebugOverlayViewHasEffectivePreferredImageDynamicRange:(id)a3;
- (BOOL)scrubbing;
- (BOOL)shouldApplyTargetReadiness;
- (BOOL)showsStatusBorder;
- (CGImage)overridePhoto;
- (CGPoint)scaleAnchorOffset;
- (CGRect)contentsRect;
- (ISLivePhotoPlayer)player;
- (ISLivePhotoUIView)playerView;
- (ISPlayerItem)_playerItem;
- (NSNumber)overrideSRLCompensationAmount;
- (PHLivePhoto)livePhoto;
- (PHLivePhotoView)initWithCoder:(id)a3;
- (PHLivePhotoView)initWithFrame:(CGRect)a3;
- (PUPhotosAssetDebugOverlayView)debugOverlayView;
- (UIGestureRecognizer)playbackGestureRecognizer;
- (UIView)photoView;
- (double)livePhotoViewExtraMinimumTouchDuration:(id)a3 touch:(id)a4;
- (id)_debugOverlayImageViewIfExists;
- (id)delegate;
- (id)generateSnapshotImage;
- (id)photosAssetDebugOverlayViewCurrentlyDisplayedImage:(id)a3;
- (int64_t)photosAssetDebugOverlayViewEffectivePreferredImageDynamicRange:(id)a3;
- (int64_t)photosAssetDebugOverlayViewPreferredImageDynamicRange:(id)a3;
- (int64_t)preferredImageDynamicRange;
- (int64_t)targetReadiness;
- (int64_t)videoFilterUpdateCounter;
- (void)_addDebugOverlayViewIfNeeded;
- (void)_applySRLCompensationAmount:(id)a3 updateCount:(int64_t)a4;
- (void)_commonPHLivePhotoViewInitialization;
- (void)_handlePlayerItemStatusChanged;
- (void)_playerDidBeginHinting;
- (void)_setPlaybackRequested:(BOOL)a3;
- (void)_setPlayerItem:(id)a3;
- (void)_setPlayingVitality:(BOOL)a3;
- (void)_setScrubbing:(BOOL)a3;
- (void)_updateCurrentPlaybackStyleAndSeeking;
- (void)_updateDebugOverlayView;
- (void)_updatePlayerAudioEnabled;
- (void)_updatePlayerTargetReadiness;
- (void)_updatePlayerViewDynamicRange;
- (void)_updatePlayingVitality;
- (void)_updateStatusBorder;
- (void)_updateVideoFilter;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4;
- (void)setContentMode:(PHLivePhotoViewContentMode)contentMode;
- (void)setContentsRect:(CGRect)contentsRect;
- (void)setDelegate:(id)delegate;
- (void)setLivePhoto:(PHLivePhoto *)livePhoto;
- (void)setMuted:(BOOL)muted;
- (void)setOverridePhoto:(CGImage *)a3;
- (void)setOverrideSRLCompensationAmount:(id)a3;
- (void)setPhotoView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setScaleAnchorOffset:(CGPoint)a3;
- (void)setSeekTime:(id *)a3;
- (void)setShouldApplyTargetReadiness:(BOOL)a3;
- (void)setShowsStatusBorder:(BOOL)a3;
- (void)setTargetReadiness:(int64_t)a3;
- (void)setTrimmedTimeRange:(id *)a3;
- (void)setVideoFilterUpdateCounter:(int64_t)a3;
- (void)startPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle;
- (void)stopPlayback;
@end

@implementation PHLivePhotoView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_overrideSRLCompensationAmount, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (PUPhotosAssetDebugOverlayView)debugOverlayView
{
  return self->_debugOverlayView;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (NSNumber)overrideSRLCompensationAmount
{
  return self->_overrideSRLCompensationAmount;
}

- ($97BACB40282BF2823C2E803DDEC6F6A6)trimmedTimeRange
{
  long long v3 = *(_OWORD *)&self[12].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[11].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[12].var1.var0;
  return self;
}

- (BOOL)showsStatusBorder
{
  return self->_showsStatusBorder;
}

- (ISLivePhotoPlayer)player
{
  return self->_player;
}

- (void)setPlayerView:(id)a3
{
}

- (ISLivePhotoUIView)playerView
{
  return self->_playerView;
}

- (CGPoint)scaleAnchorOffset
{
  double x = self->_scaleAnchorOffset.x;
  double y = self->_scaleAnchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIView)photoView
{
  return self->_photoView;
}

- (void)setShouldApplyTargetReadiness:(BOOL)a3
{
  self->_shouldApplyTargetReadiness = a3;
}

- (BOOL)shouldApplyTargetReadiness
{
  return self->_shouldApplyTargetReadiness;
}

- (int64_t)targetReadiness
{
  return self->_targetReadiness;
}

- (void)setVideoFilterUpdateCounter:(int64_t)a3
{
  self->_videoFilterUpdateCounter = a3;
}

- (int64_t)videoFilterUpdateCounter
{
  return self->_videoFilterUpdateCounter;
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (BOOL)_playbackRequested
{
  return self->__playbackRequested;
}

- (BOOL)_playingVitality
{
  return self->__playingVitality;
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)_debugOverlayImageViewIfExists
{
  v2 = [(PHLivePhotoView *)self photoView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)photosAssetDebugOverlayViewEffectivePreferredImageDynamicRange:(id)a3
{
  return 0;
}

- (BOOL)photosAssetDebugOverlayViewHasEffectivePreferredImageDynamicRange:(id)a3
{
  return 0;
}

- (int64_t)photosAssetDebugOverlayViewPreferredImageDynamicRange:(id)a3
{
  v4 = [(PHLivePhotoView *)self _debugOverlayImageViewIfExists];
  v5 = v4;
  if (!v4) {
    v4 = self;
  }
  unint64_t v6 = [v4 preferredImageDynamicRange];
  if (v6 < 3) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4
{
  unint64_t v6 = [(PHLivePhotoView *)self _debugOverlayImageViewIfExists];
  if ((unint64_t)(a4 - 1) >= 3) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = a4 - 1;
  }
  id v8 = v6;
  if (!v6) {
    unint64_t v6 = self;
  }
  [v6 setPreferredImageDynamicRange:v7];
  [(PHLivePhotoView *)self _updateDebugOverlayView];
}

- (id)photosAssetDebugOverlayViewCurrentlyDisplayedImage:(id)a3
{
  livePhoto = [(PHLivePhotoView *)self _debugOverlayImageViewIfExists];
  v5 = livePhoto;
  if (!livePhoto) {
    livePhoto = self->_livePhoto;
  }
  unint64_t v6 = [livePhoto image];

  return v6;
}

- (double)livePhotoViewExtraMinimumTouchDuration:(id)a3 touch:(id)a4
{
  if (!self->_delegateFlags.respondsToExtraMinimumTouchDuration) {
    return 0.0;
  }
  id v5 = a4;
  unint64_t v6 = [(PHLivePhotoView *)self delegate];
  [v6 livePhotoView:self extraMinimumTouchDurationForTouch:v5 withStyle:1];
  double v8 = v7;

  return v8;
}

- (BOOL)livePhotoViewCanBeginInteractivePlayback:(id)a3
{
  if (!self->_delegateFlags.respondsToCanBeginPlayback) {
    return 1;
  }
  id v3 = self;
  v4 = [(PHLivePhotoView *)self delegate];
  LOBYTE(v3) = [v4 livePhotoView:v3 canBeginPlaybackWithStyle:1];

  return (char)v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)ISPlayerChangeObserverContext == a5)
  {
    if ((v6 & 0x10) != 0) {
      PLDispatchOnMainQueue();
    }
    if ((v6 & 0x20) != 0 && [v8 isHinting]) {
      PLDispatchOnMainQueue();
    }
    if ((v6 & 8) != 0)
    {
      PLDispatchOnMainQueue();
      [(PHLivePhotoView *)self _updateCurrentPlaybackStyleAndSeeking];
    }
  }
  else if ((v6 & 1) != 0 && (void *)ISPlayerItemChangeObserverContext == a5)
  {
    PLDispatchOnMainQueue();
  }
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlayingVitality];
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playerDidBeginHinting];
}

void __48__PHLivePhotoView_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) player];
  uint64_t v2 = [v6 currentPlaybackStyle];
  id v3 = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    if (!v3[409]) {
      goto LABEL_10;
    }
    if (v2 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2 * (v2 == 2);
    }
    id v5 = [v3 delegate];
    [v5 livePhotoView:*(void *)(a1 + 32) willBeginPlaybackWithStyle:v4];
  }
  else
  {
    if (!v3[410]) {
      goto LABEL_10;
    }
    id v5 = [v3 delegate];
    [v5 livePhotoView:*(void *)(a1 + 32) didEndPlaybackWithStyle:*(void *)(*(void *)(a1 + 32) + 416)];
  }

LABEL_10:
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePlayerItemStatusChanged];
}

- (void)_handlePlayerItemStatusChanged
{
  if ([(PHLivePhotoView *)self showsStatusBorder])
  {
    [(PHLivePhotoView *)self _updateStatusBorder];
  }
}

- (void)_addDebugOverlayViewIfNeeded
{
  if (PUPhotosAssetViewShowDebugOverlayView() && !self->_debugOverlayView)
  {
    id v3 = [PUPhotosAssetDebugOverlayView alloc];
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(PUPhotosAssetDebugOverlayView *)v3 initWithClientIdentifier:v5];
    debugOverlayView = self->_debugOverlayView;
    self->_debugOverlayView = v6;

    [(PUPhotosAssetDebugOverlayView *)self->_debugOverlayView setDelegate:self];
    id v8 = self->_debugOverlayView;
    [(PHLivePhotoView *)self addSubview:v8];
  }
}

- (void)_updateDebugOverlayView
{
}

- (void)_updatePlayerViewDynamicRange
{
  int64_t v3 = [(PHLivePhotoView *)self preferredImageDynamicRange];
  id v4 = [(PHLivePhotoView *)self playerView];
  [v4 setPreferredImageDynamicRange:v3];
}

- (void)_applySRLCompensationAmount:(id)a3 updateCount:(int64_t)a4
{
  id v8 = a3;
  if ([(PHLivePhotoView *)self videoFilterUpdateCounter] == a4)
  {
    if (v8)
    {
      id v6 = [MEMORY[0x263F157C8] filterWithType:@"srl"];
      [v6 setValue:v8 forKey:@"inputAmount"];
    }
    else
    {
      id v6 = 0;
    }
    double v7 = [(PHLivePhotoView *)self playerView];
    [v7 setVideoFilter:v6];
  }
}

- (void)_updateVideoFilter
{
  [(PHLivePhotoView *)self setVideoFilterUpdateCounter:[(PHLivePhotoView *)self videoFilterUpdateCounter] + 1];
  int64_t v3 = [(PHLivePhotoView *)self videoFilterUpdateCounter];
  id v4 = [(PHLivePhotoView *)self overrideSRLCompensationAmount];
  if (v4)
  {
    [(PHLivePhotoView *)self _applySRLCompensationAmount:v4 updateCount:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = [(PHLivePhotoView *)self livePhoto];
    id v6 = dispatch_get_global_queue(25, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__PHLivePhotoView__updateVideoFilter__block_invoke;
    v8[3] = &unk_2642C50C0;
    id v9 = v5;
    id v7 = v5;
    objc_copyWeak(v10, &location);
    v10[1] = v3;
    dispatch_async(v6, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __37__PHLivePhotoView__updateVideoFilter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) srlCompensationValue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PHLivePhotoView__updateVideoFilter__block_invoke_2;
  block[3] = &unk_2642C50C0;
  objc_copyWeak(v7, (id *)(a1 + 40));
  int64_t v3 = *(void **)(a1 + 48);
  id v6 = v2;
  v7[1] = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v7);
}

void __37__PHLivePhotoView__updateVideoFilter__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _applySRLCompensationAmount:*(void *)(a1 + 32) updateCount:*(void *)(a1 + 48)];
}

- (void)setOverrideSRLCompensationAmount:(id)a3
{
  id v5 = (NSNumber *)a3;
  if (self->_overrideSRLCompensationAmount != v5 && (-[NSNumber isEqual:](v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideSRLCompensationAmount, a3);
    [(PHLivePhotoView *)self _updateVideoFilter];
  }

  MEMORY[0x270F9A758]();
}

- (void)_updatePlayerTargetReadiness
{
  if (self->_shouldApplyTargetReadiness)
  {
    if (self->__playbackRequested)
    {
      uint64_t v2 = 2;
    }
    else
    {
      int64_t targetReadiness = self->_targetReadiness;
      if (targetReadiness == 2) {
        uint64_t v2 = 2;
      }
      else {
        uint64_t v2 = targetReadiness == 1;
      }
    }
    id v4 = [(PHLivePhotoView *)self player];
    [v4 setTargetReadiness:v2];
  }
}

- (void)_playerDidBeginHinting
{
  if (self->_delegatePrivateFlags.respondsToDidBeginHinting)
  {
    id v3 = [(PHLivePhotoView *)self delegate];
    [v3 livePhotoViewDidBeginHinting:self];
  }
}

- (void)_updateCurrentPlaybackStyleAndSeeking
{
  id v3 = [(PHLivePhotoView *)self player];
  uint64_t v4 = [v3 currentPlaybackStyle];

  int64_t v5 = 2 * (v4 == 2);
  if (v4 == 1) {
    int64_t v5 = 1;
  }
  self->_currentPlaybackStyle = v5;

  [(PHLivePhotoView *)self _setScrubbing:v4 == 3];
}

- (void)_updateStatusBorder
{
  if ([(PHLivePhotoView *)self showsStatusBorder])
  {
    id v10 = [(PHLivePhotoView *)self _playerItem];
    if ([v10 status] == 3)
    {
      id v3 = [MEMORY[0x263F825C8] greenColor];
      uint64_t v4 = [v10 videoComposition];

      if (v4)
      {
        uint64_t v5 = [MEMORY[0x263F825C8] purpleColor];

        id v3 = (void *)v5;
      }
    }
    else
    {
      id v3 = [MEMORY[0x263F825C8] redColor];
    }
    id v7 = [(PHLivePhotoView *)self layer];
    id v8 = v3;
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    id v9 = [(PHLivePhotoView *)self layer];
    [v9 setBorderWidth:2.0];
  }
  else
  {
    id v6 = [(PHLivePhotoView *)self layer];
    [v6 setBorderWidth:0.0];

    id v10 = [(PHLivePhotoView *)self layer];
    [v10 setBorderColor:0];
  }
}

- (void)_setPlayingVitality:(BOOL)a3
{
  if (self->__playingVitality != a3)
  {
    self->__playingVitalitdouble y = a3;
    if (!a3 && self->_delegatePrivateFlags.respondsToDidEndPlayingVitality)
    {
      id v4 = [(PHLivePhotoView *)self delegate];
      [v4 livePhotoViewDidEndPlayingVitality:self];
    }
  }
}

- (void)_updatePlayingVitality
{
  id v3 = [(PHLivePhotoView *)self player];
  -[PHLivePhotoView _setPlayingVitality:](self, "_setPlayingVitality:", [v3 isPlayingVitality]);
}

- (void)_updatePlayerAudioEnabled
{
  BOOL v3 = [(PHLivePhotoView *)self isMuted];
  id v4 = [(PHLivePhotoView *)self player];
  [v4 setAudioEnabled:!v3];
}

- (void)_setPlayerItem:(id)a3
{
  uint64_t v5 = (ISPlayerItem *)a3;
  playerItem = self->__playerItem;
  id v8 = v5;
  if (playerItem != v5)
  {
    [(ISPlayerItem *)playerItem unregisterChangeObserver:self context:ISPlayerItemChangeObserverContext];
    objc_storeStrong((id *)&self->__playerItem, a3);
    [(ISPlayerItem *)self->__playerItem registerChangeObserver:self context:ISPlayerItemChangeObserverContext];
    [(PHLivePhotoView *)self _updateStatusBorder];
    id v7 = [(PHLivePhotoView *)self player];
    [v7 setPlayerItem:v8];

    [(PHLivePhotoView *)self _updatePlayerAudioEnabled];
  }
}

- (void)_setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    if (a3)
    {
      if (!self->_delegatePrivateFlags.respondsToDidBeginScrubbing) {
        return;
      }
      id v4 = [(PHLivePhotoView *)self delegate];
      [v4 livePhotoViewDidBeginScrubbing:self];
    }
    else
    {
      if (!self->_delegatePrivateFlags.respondsToDidEndScrubbing) {
        return;
      }
      id v4 = [(PHLivePhotoView *)self delegate];
      [v4 livePhotoViewDidEndScrubbing:self];
    }
  }
}

- (BOOL)isDisplayingPhoto
{
  uint64_t v2 = [(PHLivePhotoView *)self playerView];
  char v3 = [v2 isDisplayingPhoto];

  return v3;
}

- (id)generateSnapshotImage
{
  uint64_t v2 = [(PHLivePhotoView *)self playerView];
  char v3 = [v2 generateSnapshotImage];

  return v3;
}

- (CGImage)overridePhoto
{
  uint64_t v2 = [(PHLivePhotoView *)self playerView];
  id v3 = [v2 overrideImage];
  id v4 = (CGImage *)[v3 CGImage];

  return v4;
}

- (void)setOverridePhoto:(CGImage *)a3
{
  id v5 = [MEMORY[0x263F827E8] imageWithCGImage:a3];
  id v4 = [(PHLivePhotoView *)self playerView];
  [v4 setOverrideImage:v5];
}

- (void)setContentMode:(PHLivePhotoViewContentMode)contentMode
{
  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  -[PHLivePhotoView setContentMode:](&v6, sel_setContentMode_);
  id v5 = [(PHLivePhotoView *)self playerView];
  [v5 setContentMode:contentMode];
}

- (void)stopPlayback
{
  id v2 = [(PHLivePhotoView *)self player];
  [v2 stopPlayback];
}

- (void)startPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle
{
  BOOL v4 = playbackStyle == PHLivePhotoViewPlaybackStyleHint;
  id v5 = [(PHLivePhotoView *)self player];
  id v7 = v5;
  if (playbackStyle == PHLivePhotoViewPlaybackStyleFull) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * v4;
  }
  [v5 startPlaybackWithStyleWhenReady:v6 settleAutomatically:1];
}

- (void)setTrimmedTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimmedTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_trimmedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_trimmedTimeRange.duration.timescale = v3;
  id v5 = [(PHLivePhotoView *)self player];
  [v5 setTrimTimeRange:&v6];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  long long v4 = [(PHLivePhotoView *)self player];
  if (v4)
  {
    long long v6 = v4;
    [v4 seekTime];
    long long v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setSeekTime:(id *)a3
{
  long long v4 = [(PHLivePhotoView *)self player];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [v4 setSeekTime:&v5 completion:0];
}

- (void)setMuted:(BOOL)muted
{
  if (self->_muted != muted)
  {
    self->_muted = muted;
    [(PHLivePhotoView *)self _updatePlayerAudioEnabled];
  }
}

- (void)_setPlaybackRequested:(BOOL)a3
{
  if (self->__playbackRequested != a3)
  {
    self->__playbackRequested = a3;
    [(PHLivePhotoView *)self _updatePlayerTargetReadiness];
  }
}

- (void)setTargetReadiness:(int64_t)a3
{
  if (self->_targetReadiness != a3)
  {
    self->_int64_t targetReadiness = a3;
    [(PHLivePhotoView *)self _updatePlayerTargetReadiness];
  }
}

- (void)setLivePhoto:(PHLivePhoto *)livePhoto
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = livePhoto;
  if (self->_livePhoto != v5)
  {
    objc_storeStrong((id *)&self->_livePhoto, livePhoto);
    if (v5)
    {
      long long v6 = [(PHLivePhoto *)v5 image];
      id v7 = [(PHLivePhoto *)v5 videoAsset];
      [(PHLivePhoto *)v5 photoTime];
      double Seconds = CMTimeGetSeconds(&time);
      [v6 imageOrientation];
      uint64_t v9 = PLExifOrientationFromImageOrientation();
      [(PHLivePhoto *)v5 targetSize];
      double v12 = v11;
      double v13 = v10;
      if (v11 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8))
      {
        v15 = [(PHLivePhotoView *)self window];
        v16 = [v15 screen];

        if (!v16)
        {
          v16 = [MEMORY[0x263F82B60] mainScreen];
        }
        [v16 bounds];
        double v18 = v17;
        double v20 = v19;
        [v16 scale];
        double v22 = v21 * v18;
        double v23 = v21 * v20;
        if (v22 >= v23) {
          double v13 = v22;
        }
        else {
          double v13 = v23;
        }

        double v12 = v13;
      }
      uint64_t v24 = [(PHLivePhoto *)v5 hasPhotoColorAdjustments];
      v25 = (void *)[objc_alloc(MEMORY[0x263F5E110]) initWithVideoAsset:v7 UIImage:v6 photoTime:v9 photoEXIFOrientation:v24 options:Seconds];
      [(PHLivePhoto *)v5 size];
      v28 = 0;
      if (v26 != 0.0 && v27 != 0.0)
      {
        double v30 = *MEMORY[0x263F5D550];
        double v29 = *(double *)(MEMORY[0x263F5D550] + 8);
        if (v26 == *MEMORY[0x263F5D550] && v27 == v29)
        {
          v28 = 0;
        }
        else
        {
          v32 = NSNumber;
          [(PHLivePhoto *)v5 size];
          double v35 = v33;
          double v36 = v34;
          if (v33 == 0.0 || v34 == 0.0 || v33 == v30 && v34 == v29)
          {
            double v37 = 1.0;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218496;
              double v45 = v35;
              __int16 v46 = 2048;
              double v47 = v36;
              __int16 v48 = 2048;
              uint64_t v49 = 0x3FF0000000000000;
              _os_log_fault_impl(&dword_217C33000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
            }
          }
          else
          {
            double v37 = fabs(v33 / v34);
          }
          v28 = [v32 numberWithDouble:v37];
        }
      }
      v31 = objc_msgSend(MEMORY[0x263F5E120], "playerItemWithAsset:targetSize:contentAspectRatio:", v25, v28, v12, v13);
      v38 = [(PHLivePhoto *)v5 videoComposition];
      [v31 setVideoComposition:v38];
      [(PHLivePhoto *)v5 audioVolume];
      int v40 = v39;
      v41 = [(ISLivePhotoUIView *)self->_playerView player];
      LODWORD(v42) = v40;
      [v41 setAudioVolume:v42];
    }
    else
    {
      v31 = 0;
    }
    [(PHLivePhotoView *)self _updateVideoFilter];
    [(PHLivePhotoView *)self _setPlayerItem:v31];
    [(PHLivePhotoView *)self _updateDebugOverlayView];
  }
}

- (void)setScaleAnchorOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_scaleAnchorOffset.x != a3.x || self->_scaleAnchorOffset.y != a3.y)
  {
    self->_scaleAnchorOffset = a3;
    id v6 = [(PHLivePhotoView *)self playerView];
    objc_msgSend(v6, "setScaleAnchorOffset:", x, y);
  }
}

- (void)setContentsRect:(CGRect)contentsRect
{
  double height = contentsRect.size.height;
  double width = contentsRect.size.width;
  double y = contentsRect.origin.y;
  double x = contentsRect.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(contentsRect, self->_contentsRect))
  {
    p_contentsRect->origin.double x = x;
    p_contentsRect->origin.double y = y;
    p_contentsRect->size.double width = width;
    p_contentsRect->size.double height = height;
    id v9 = [(PHLivePhotoView *)self playerView];
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);
  }
}

- (void)setPhotoView:(id)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (UIView *)a3;
  if (self->_photoView != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_photoView, a3);
    id v6 = [(PHLivePhotoView *)self playerView];
    [v6 setCustomPhotoView:self->_photoView];

    [(PHLivePhotoView *)self _updateDebugOverlayView];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v7;
  }
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanBeginPlayback = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillBeginPlaybackWithStyle = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndPlayback = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToExtraMinimumTouchDuration = objc_opt_respondsToSelector() & 1;
    id v5 = obj;
    p_delegatePrivateFlags = &self->_delegatePrivateFlags;
    self->_delegatePrivateFlags.respondsToDidEndPlayingVitalitdouble y = objc_opt_respondsToSelector() & 1;
    self->_delegatePrivateFlags.respondsToDidBeginHinting = objc_opt_respondsToSelector() & 1;
    self->_delegatePrivateFlags.respondsToDidBeginScrubbing = objc_opt_respondsToSelector() & 1;
    char v7 = objc_opt_respondsToSelector();

    p_delegatePrivateFlags->respondsToDidEndScrubbing = v7 & 1;
  }
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  id v2 = [(PHLivePhotoView *)self playerView];
  long long v3 = [v2 playbackGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (void)setShowsStatusBorder:(BOOL)a3
{
  if (self->_showsStatusBorder != a3)
  {
    self->_showsStatusBorder = a3;
    [(PHLivePhotoView *)self _updateStatusBorder];
  }
}

- (void)setPlayer:(id)a3
{
  p_player = &self->_player;
  id v9 = (ISLivePhotoPlayer *)a3;
  if (*p_player != v9)
  {
    id v6 = [(PHLivePhotoView *)self playerView];
    [(ISLivePhotoPlayer *)*p_player unregisterChangeObserver:self context:ISPlayerChangeObserverContext];
    objc_storeStrong((id *)&self->_player, a3);
    [(ISLivePhotoPlayer *)*p_player registerChangeObserver:self context:ISPlayerChangeObserverContext];
    [v6 setPlayer:*p_player];
    char v7 = [(ISLivePhotoPlayer *)v9 playerItem];
    playerItem = self->__playerItem;
    self->__playerItem = v7;
  }
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    [(PHLivePhotoView *)self _updatePlayerViewDynamicRange];
    [(PHLivePhotoView *)self _updateDebugOverlayView];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHLivePhotoView;
  [(PHLivePhotoView *)&v3 layoutSubviews];
  [(PHLivePhotoView *)self bounds];
  -[PUPhotosAssetDebugOverlayView setFrame:](self->_debugOverlayView, "setFrame:");
}

- (void)_commonPHLivePhotoViewInitialization
{
  self->_int64_t targetReadiness = 2;
  self->_shouldApplyTargetReadiness = 1;
  [(PHLivePhotoView *)self setContentMode:2];
  objc_super v3 = (ISLivePhotoUIView *)objc_alloc_init(MEMORY[0x263F5E118]);
  playerView = self->_playerView;
  self->_playerView = v3;

  id v5 = self->_playerView;
  [(PHLivePhotoView *)self bounds];
  -[ISLivePhotoUIView setFrame:](v5, "setFrame:");
  [(ISLivePhotoUIView *)self->_playerView setAutoresizingMask:18];
  [(ISLivePhotoUIView *)self->_playerView setDelegate:self];
  [(PHLivePhotoView *)self addSubview:self->_playerView];
  id v6 = [(ISLivePhotoUIView *)self->_playerView player];
  player = self->_player;
  self->_player = v6;

  [(ISLivePhotoPlayer *)self->_player registerChangeObserver:self context:ISPlayerChangeObserverContext];
  self->_contentsRect.origin.double x = 0.0;
  self->_contentsRect.origin.double y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  self->_contentsRect.size = _Q0;
  [(PHLivePhotoView *)self _updatePlayerAudioEnabled];
  [(PHLivePhotoView *)self _updateCurrentPlaybackStyleAndSeeking];
  [(PHLivePhotoView *)self _updatePlayerViewDynamicRange];

  [(PHLivePhotoView *)self _addDebugOverlayViewIfNeeded];
}

- (PHLivePhotoView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  objc_super v3 = [(PHLivePhotoView *)&v6 initWithCoder:a3];
  long long v4 = v3;
  if (v3) {
    [(PHLivePhotoView *)v3 _commonPHLivePhotoViewInitialization];
  }
  return v4;
}

- (PHLivePhotoView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  objc_super v3 = -[PHLivePhotoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v4 = v3;
  if (v3) {
    [(PHLivePhotoView *)v3 _commonPHLivePhotoViewInitialization];
  }
  return v4;
}

+ (UIImage)livePhotoBadgeImageWithOptions:(PHLivePhotoBadgeOptions)badgeOptions
{
  objc_super v3 = @"PhotoIrisShadowBadge-OFF";
  if ((badgeOptions & 2) != 0)
  {
    long long v4 = @"PhotoIrisBadge-OFF";
  }
  else
  {
    objc_super v3 = @"PhotoIrisShadowBadge-ON";
    long long v4 = @"PhotoIrisBadge-ON";
  }
  if (badgeOptions) {
    id v5 = v3;
  }
  else {
    id v5 = v4;
  }
  objc_super v6 = (void *)MEMORY[0x263F827E8];
  char v7 = PLPhotoLibraryFrameworkBundle();
  id v8 = [v6 imageNamed:v5 inBundle:v7];

  return (UIImage *)v8;
}

@end