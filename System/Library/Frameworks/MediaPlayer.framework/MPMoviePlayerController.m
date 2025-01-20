@interface MPMoviePlayerController
- (AVPlayerViewController)playerViewController;
- (BOOL)allowsAirPlay;
- (BOOL)isAirPlayVideoActive;
- (BOOL)isFullscreen;
- (BOOL)isPreparedToPlay;
- (BOOL)readyForDisplay;
- (BOOL)shouldAutoplay;
- (BOOL)useApplicationAudioSession;
- (CGSize)naturalSize;
- (MPMovieAccessLog)accessLog;
- (MPMovieControlStyle)controlStyle;
- (MPMovieErrorLog)errorLog;
- (MPMovieLoadState)loadState;
- (MPMovieMediaTypeMask)movieMediaTypes;
- (MPMoviePlaybackState)playbackState;
- (MPMoviePlayerController)init;
- (MPMoviePlayerController)initWithContentURL:(NSURL *)url;
- (MPMovieRepeatMode)repeatMode;
- (MPMovieScalingMode)scalingMode;
- (MPMovieSourceType)movieSourceType;
- (NSArray)timedMetadata;
- (NSTimeInterval)duration;
- (NSTimeInterval)endPlaybackTime;
- (NSTimeInterval)initialPlaybackTime;
- (NSTimeInterval)playableDuration;
- (NSURL)contentURL;
- (UIImage)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option;
- (UIView)backgroundView;
- (UIView)view;
- (UIViewController)hostingViewController;
- (double)currentPlaybackTime;
- (float)currentPlaybackRate;
- (id)_advertisementView;
- (id)_videoViewController;
- (void)_avPlayerItemDidPlayToEndNotification:(id)a3;
- (void)beginSeekingBackward;
- (void)beginSeekingForward;
- (void)cancelAllThumbnailImageRequests;
- (void)dealloc;
- (void)endSeeking;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)prepareToPlay;
- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option;
- (void)setAllowsAirPlay:(BOOL)allowsAirPlay;
- (void)setContentURL:(NSURL *)contentURL;
- (void)setControlStyle:(MPMovieControlStyle)controlStyle;
- (void)setCurrentPlaybackRate:(float)a3;
- (void)setCurrentPlaybackTime:(double)a3;
- (void)setEndPlaybackTime:(NSTimeInterval)endPlaybackTime;
- (void)setFullscreen:(BOOL)fullscreen;
- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated;
- (void)setHostingViewController:(id)a3;
- (void)setInitialPlaybackTime:(NSTimeInterval)initialPlaybackTime;
- (void)setMovieSourceType:(MPMovieSourceType)movieSourceType;
- (void)setRepeatMode:(MPMovieRepeatMode)repeatMode;
- (void)setScalingMode:(MPMovieScalingMode)scalingMode;
- (void)setShouldAutoplay:(BOOL)shouldAutoplay;
- (void)setUseApplicationAudioSession:(BOOL)useApplicationAudioSession;
- (void)stop;
@end

@implementation MPMoviePlayerController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_generator, 0);

  objc_storeStrong((id *)&self->_proxyView, 0);
}

- (void)setHostingViewController:(id)a3
{
}

- (UIViewController)hostingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);

  return (UIViewController *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (BOOL)shouldAutoplay
{
  return self->_shouldAutoplay;
}

- (MPMovieRepeatMode)repeatMode
{
  return self->_repeatMode;
}

- (MPMovieControlStyle)controlStyle
{
  return self->_controlStyle;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setMovieSourceType:(MPMovieSourceType)movieSourceType
{
  self->_movieSourceType = movieSourceType;
}

- (MPMovieSourceType)movieSourceType
{
  return self->_movieSourceType;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = v10;
  if (a6 != &_MPMoviePlayerControllerObservationContext)
  {
    v24.receiver = self;
    v24.super_class = (Class)MPMoviePlayerController;
    [(MPMoviePlayerController *)&v24 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
    goto LABEL_21;
  }
  if ([v10 isEqualToString:@"videoGravity"])
  {
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = v12;
    v14 = @"MPMoviePlayerScalingModeDidChangeNotification";
    goto LABEL_19;
  }
  if (![v11 isEqualToString:@"playerController.status"])
  {
    if (![v11 isEqualToString:@"isReadyForDisplay"])
    {
      if ([v11 isEqualToString:@"player.currentItem"])
      {
        v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 postNotificationName:@"MPMoviePlayerNowPlayingMovieDidChangeNotification" object:self];

        v23 = (void *)MEMORY[0x1E4F28EB8];
      }
      else
      {
        if ([v11 isEqualToString:@"player.isExternalPlaybackActive"])
        {
          v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v13 = v12;
          v14 = @"MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification";
          goto LABEL_19;
        }
        if (![v11 isEqualToString:@"playerController.isPlaying"])
        {
          if ([v11 isEqualToString:@"playerController.contentDimensions"])
          {
            v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v13 = v12;
            v14 = @"MPMovieNaturalSizeAvailableNotification";
          }
          else
          {
            if (![v11 isEqualToString:@"playerController.contentDuration"]) {
              goto LABEL_21;
            }
            v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v13 = v12;
            v14 = @"MPMovieDurationAvailableNotification";
          }
          goto LABEL_19;
        }
        v23 = (void *)MEMORY[0x1E4F28EB8];
      }
      v12 = [v23 defaultCenter];
      v13 = v12;
      v14 = @"MPMoviePlayerPlaybackStateDidChangeNotification";
      goto LABEL_19;
    }
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = v12;
    v14 = @"MPMoviePlayerReadyForDisplayDidChangeNotification";
LABEL_19:
    [v12 postNotificationName:v14 object:self];
    goto LABEL_20;
  }
  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"MPMoviePlayerLoadStateDidChangeNotification" object:self];

  v16 = [(AVPlayerViewController *)self->_playerViewController playerController];
  uint64_t v17 = [v16 status];

  if (v17 == 2)
  {
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 postNotificationName:@"MPMediaPlaybackIsPreparedToPlayDidChangeNotification" object:self];
  }
  v19 = [(AVPlayerViewController *)self->_playerViewController playerController];
  uint64_t v20 = [v19 status];

  if (v20 == 3)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v25 = @"MPMoviePlayerPlaybackDidFinishReasonUserInfoKey";
    v26[0] = &unk_1EE6ECD88;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v13 postNotificationName:@"MPMoviePlayerPlaybackDidFinishNotification" object:self userInfo:v21];

LABEL_20:
  }
LABEL_21:
}

- (void)_avPlayerItemDidPlayToEndNotification:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 object];
  v5 = [(AVPlayerViewController *)self->_playerViewController player];
  v6 = [v5 currentItem];

  if (v4 == v6)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = @"MPMoviePlayerPlaybackDidFinishReasonUserInfoKey";
    v10[0] = &unk_1EE6ECD70;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v7 postNotificationName:@"MPMoviePlayerPlaybackDidFinishNotification" object:self userInfo:v8];
  }
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  v7 = [v5 defaultCenter];
  [v7 postNotificationName:@"MPMoviePlayerWillExitFullscreenNotification" object:self];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__MPMoviePlayerController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v8[3] = &unk_1E57EDC40;
  v8[4] = self;
  [v6 animateAlongsideTransition:&__block_literal_global_42 completion:v8];
}

void __102__MPMoviePlayerController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"MPMoviePlayerDidExitFullscreenNotification" object:*(void *)(a1 + 32)];
  }
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  v7 = [v5 defaultCenter];
  [v7 postNotificationName:@"MPMoviePlayerWillEnterFullscreenNotification" object:self];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__MPMoviePlayerController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v8[3] = &unk_1E57EDC40;
  v8[4] = self;
  [v6 animateAlongsideTransition:&__block_literal_global_784 completion:v8];
}

void __104__MPMoviePlayerController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"MPMoviePlayerDidEnterFullscreenNotification" object:*(void *)(a1 + 32)];
  }
}

- (id)_videoViewController
{
  return 0;
}

- (id)_advertisementView
{
  return 0;
}

- (void)setUseApplicationAudioSession:(BOOL)useApplicationAudioSession
{
  if (self->_useApplicationAudioSession != useApplicationAudioSession)
  {
    self->_useApplicationAudioSession = useApplicationAudioSession;
    id v5 = [MEMORY[0x1E4F153E0] auxiliarySession];
    v4 = [(AVPlayerViewController *)self->_playerViewController player];
    [v4 setAudioSession:v5];
  }
}

- (BOOL)useApplicationAudioSession
{
  return self->_useApplicationAudioSession;
}

- (MPMovieErrorLog)errorLog
{
  id v3 = [MPMovieErrorLog alloc];
  v4 = [(AVPlayerViewController *)self->_playerViewController player];
  id v5 = [v4 currentItem];
  id v6 = [v5 errorLog];
  id v7 = [(MPMovieErrorLog *)v3 _initWithAVItemErrorLog:v6];

  return (MPMovieErrorLog *)v7;
}

- (MPMovieAccessLog)accessLog
{
  id v3 = [MPMovieAccessLog alloc];
  v4 = [(AVPlayerViewController *)self->_playerViewController player];
  id v5 = [v4 currentItem];
  id v6 = [v5 accessLog];
  id v7 = [(MPMovieAccessLog *)v3 _initWithAVItemAccessLog:v6];

  return (MPMovieAccessLog *)v7;
}

- (NSArray)timedMetadata
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(AVPlayerViewController *)self->_playerViewController player];
  id v3 = [v2 currentItem];
  v4 = [v3 timedMetadata];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [MPTimedMetadata alloc];
        id v13 = -[MPTimedMetadata _initWithMetadataItem:](v12, "_initWithMetadataItem:", v11, (void)v15);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)cancelAllThumbnailImageRequests
{
}

- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = playbackTimes;
  generator = self->_generator;
  if (!generator)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F16368];
    uint64_t v9 = [(AVPlayerViewController *)self->_playerViewController player];
    id v10 = [v9 currentItem];
    uint64_t v11 = [v10 asset];
    v12 = [v8 assetImageGeneratorWithAsset:v11];
    id v13 = self->_generator;
    self->_generator = v12;

    generator = self->_generator;
  }
  [(AVAssetImageGenerator *)generator setAppliesPreferredTrackTransform:1];
  v14 = self->_generator;
  if (option == MPMovieTimeOptionExact)
  {
    long long v43 = *MEMORY[0x1E4F1FA48];
    long long v29 = v43;
    uint64_t v44 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v15 = v44;
    [(AVAssetImageGenerator *)v14 setRequestedTimeToleranceBefore:&v43];
    long long v16 = self->_generator;
    long long v41 = v29;
    uint64_t v42 = v15;
    long long v17 = &v41;
  }
  else
  {
    long long v39 = *MEMORY[0x1E4F1FA10];
    long long v30 = v39;
    uint64_t v40 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    uint64_t v18 = v40;
    [(AVAssetImageGenerator *)v14 setRequestedTimeToleranceBefore:&v39];
    long long v16 = self->_generator;
    long long v37 = v30;
    uint64_t v38 = v18;
    long long v17 = &v37;
  }
  [(AVAssetImageGenerator *)v16 setRequestedTimeToleranceAfter:v17];
  v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v20 = v6;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v33 + 1) + 8 * v24) doubleValue];
        CMTimeMake(&v32, (uint64_t)(v26 * 1000.0), 1000);
        v27 = [v25 valueWithCMTime:&v32];
        [v19 addObject:v27];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v22);
  }

  v28 = self->_generator;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__MPMoviePlayerController_requestThumbnailImagesAtTimes_timeOption___block_invoke;
  v31[3] = &unk_1E57EDBE8;
  v31[4] = self;
  [(AVAssetImageGenerator *)v28 generateCGImagesAsynchronouslyForTimes:v19 completionHandler:v31];
}

void __68__MPMoviePlayerController_requestThumbnailImagesAtTimes_timeOption___block_invoke(uint64_t a1, CMTime *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  if (a3)
  {
    if (CGImageGetWidth((CGImageRef)a3))
    {
      if (CGImageGetHeight((CGImageRef)a3))
      {
        id v10 = [MEMORY[0x1E4FB1818] imageWithCGImage:a3];
        CFRelease(a3);
        if (v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v12 = *(void *)(a1 + 32);
          v16[1] = @"MPMoviePlayerThumbnailTimeKey";
          v17[0] = v10;
          CMTime v15 = *a2;
          v16[0] = @"MPMoviePlayerThumbnailImageKey";
          id v13 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v15)];
          v17[1] = v13;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
          [v11 postNotificationName:@"MPMoviePlayerThumbnailImageRequestDidFinishNotification" object:v12 userInfo:v14];
        }
      }
    }
  }
}

- (UIImage)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option
{
  id v6 = (void *)MEMORY[0x1E4F16368];
  uint64_t v7 = [(AVPlayerViewController *)self->_playerViewController player];
  uint64_t v8 = [v7 currentItem];
  id v9 = [v8 asset];
  id v10 = [v6 assetImageGeneratorWithAsset:v9];

  [v10 setAppliesPreferredTrackTransform:1];
  if (option == MPMovieTimeOptionExact)
  {
    long long v27 = *MEMORY[0x1E4F1FA48];
    long long v18 = v27;
    uint64_t v28 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v11 = v28;
    [v10 setRequestedTimeToleranceBefore:&v27];
    long long v25 = v18;
    uint64_t v26 = v11;
    uint64_t v12 = &v25;
  }
  else
  {
    long long v23 = *MEMORY[0x1E4F1FA10];
    long long v19 = v23;
    uint64_t v24 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    uint64_t v13 = v24;
    [v10 setRequestedTimeToleranceBefore:&v23];
    long long v21 = v19;
    uint64_t v22 = v13;
    uint64_t v12 = &v21;
  }
  [v10 setRequestedTimeToleranceAfter:v12];
  CMTimeMake(&v20, (uint64_t)(playbackTime * 1000.0), 1000);
  v14 = (CGImage *)[v10 copyCGImageAtTime:&v20 actualTime:0 error:0];
  if (v14)
  {
    CMTime v15 = v14;
    if (CGImageGetWidth(v14) && CGImageGetHeight(v15))
    {
      long long v16 = [MEMORY[0x1E4FB1818] imageWithCGImage:v15];
    }
    else
    {
      long long v16 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    long long v16 = 0;
  }

  return (UIImage *)v16;
}

- (void)endSeeking
{
  id v3 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v3 endScanningBackward:self];

  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 endScanningForward:self];
}

- (void)beginSeekingBackward
{
  id v3 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v3 beginScanningBackward:self];
}

- (void)beginSeekingForward
{
  id v3 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v3 beginScanningForward:self];
}

- (void)setCurrentPlaybackRate:(float)a3
{
  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 setRate:a3];
}

- (float)currentPlaybackRate
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 seekToTime:a3];
}

- (double)currentPlaybackTime
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)stop
{
}

- (void)pause
{
  id v3 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v3 pause:self];
}

- (void)play
{
  [(MPMoviePlayerController *)self prepareToPlay];
  id v3 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v3 play:self];
}

- (BOOL)isPreparedToPlay
{
  v2 = [(AVPlayerViewController *)self->_playerViewController player];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)prepareToPlay
{
  BOOL v3 = [(AVPlayerViewController *)self->_playerViewController player];
  double v4 = [v3 currentItem];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F16608] playerWithURL:self->_contentURL];
    [(AVPlayerViewController *)self->_playerViewController setPlayer:v5];

    BOOL shouldAutoplay = self->_shouldAutoplay;
    uint64_t v7 = [(AVPlayerViewController *)self->_playerViewController player];
    [v7 setAutomaticallyWaitsToMinimizeStalling:shouldAutoplay];

    if (self->_useApplicationAudioSession)
    {
      id v9 = [MEMORY[0x1E4F153E0] auxiliarySession];
      uint64_t v8 = [(AVPlayerViewController *)self->_playerViewController player];
      [v8 setAudioSession:v9];
    }
  }
}

- (BOOL)isAirPlayVideoActive
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  char v3 = [v2 isExternalPlaybackActive];

  return v3;
}

- (void)setAllowsAirPlay:(BOOL)allowsAirPlay
{
  BOOL v3 = allowsAirPlay;
  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 setAllowsExternalPlayback:v3];
}

- (BOOL)allowsAirPlay
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  char v3 = [v2 allowsExternalPlayback];

  return v3;
}

- (void)setEndPlaybackTime:(NSTimeInterval)endPlaybackTime
{
  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 setMaxTime:endPlaybackTime];
}

- (NSTimeInterval)endPlaybackTime
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 maxTime];
  double v4 = v3;

  return v4;
}

- (void)setInitialPlaybackTime:(NSTimeInterval)initialPlaybackTime
{
  id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v4 setMinTime:initialPlaybackTime];
}

- (NSTimeInterval)initialPlaybackTime
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 minTime];
  double v4 = v3;

  return v4;
}

- (CGSize)naturalSize
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 contentDimensions];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSTimeInterval)playableDuration
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 contentDurationWithinEndTimes];
  double v4 = v3;

  return v4;
}

- (NSTimeInterval)duration
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  [v2 contentDuration];
  double v4 = v3;

  return v4;
}

- (MPMovieMediaTypeMask)movieMediaTypes
{
  return 0;
}

- (BOOL)readyForDisplay
{
  return [(AVPlayerViewController *)self->_playerViewController isReadyForDisplay];
}

- (void)setScalingMode:(MPMovieScalingMode)scalingMode
{
  id v5 = (id)*MEMORY[0x1E4F15AE8];
  id v6 = v5;
  if (scalingMode == MPMovieScalingModeAspectFit)
  {
    id v9 = v5;
    double v7 = (id *)MEMORY[0x1E4F15AF0];
  }
  else
  {
    if (scalingMode != MPMovieScalingModeAspectFill) {
      goto LABEL_6;
    }
    id v9 = v5;
    double v7 = (id *)MEMORY[0x1E4F15AF8];
  }
  id v8 = *v7;

  id v6 = v8;
LABEL_6:
  id v10 = v6;
  [(AVPlayerViewController *)self->_playerViewController setVideoGravity:v6];
}

- (MPMovieScalingMode)scalingMode
{
  v2 = [(AVPlayerViewController *)self->_playerViewController videoGravity];
  if (v2 == (void *)*MEMORY[0x1E4F15AE8])
  {
    MPMovieScalingMode v3 = MPMovieScalingModeFill;
  }
  else if (v2 == (void *)*MEMORY[0x1E4F15AF0])
  {
    MPMovieScalingMode v3 = MPMovieScalingModeAspectFit;
  }
  else
  {
    MPMovieScalingMode v3 = 2 * (v2 == (void *)*MEMORY[0x1E4F15AF8]);
  }

  return v3;
}

- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated
{
  playerViewController = self->_playerViewController;
  if (fullscreen) {
    -[AVPlayerViewController enterFullScreenWithCompletion:](playerViewController, "enterFullScreenWithCompletion:", 0, animated);
  }
  else {
    -[AVPlayerViewController exitFullScreenWithCompletion:](playerViewController, "exitFullScreenWithCompletion:", 0, animated);
  }
}

- (void)setFullscreen:(BOOL)fullscreen
{
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setShouldAutoplay:(BOOL)shouldAutoplay
{
  if (self->_shouldAutoplay != shouldAutoplay)
  {
    BOOL v3 = shouldAutoplay;
    self->_BOOL shouldAutoplay = shouldAutoplay;
    id v4 = [(AVPlayerViewController *)self->_playerViewController player];
    [v4 setAutomaticallyWaitsToMinimizeStalling:v3];
  }
}

- (void)setRepeatMode:(MPMovieRepeatMode)repeatMode
{
  if (self->_repeatMode != repeatMode)
  {
    self->_repeatMode = repeatMode;
    BOOL v3 = repeatMode == MPMovieRepeatModeOne;
    id v4 = [(AVPlayerViewController *)self->_playerViewController playerController];
    [v4 setLooping:v3];
  }
}

- (void)setControlStyle:(MPMovieControlStyle)controlStyle
{
  if (self->_controlStyle != controlStyle)
  {
    self->_controlStyle = controlStyle;
    if ((unint64_t)controlStyle <= MPMovieControlStyleFullscreen)
    {
      BOOL v4 = controlStyle == MPMovieControlStyleFullscreen;
      [(AVPlayerViewController *)self->_playerViewController setShowsPlaybackControls:(6u >> (controlStyle & 7)) & 1];
      playerViewController = self->_playerViewController;
      [(AVPlayerViewController *)playerViewController setAllowsEnteringFullScreen:v4];
    }
  }
}

- (MPMovieLoadState)loadState
{
  v2 = [(AVPlayerViewController *)self->_playerViewController playerController];
  uint64_t v3 = [v2 status];

  if (v3 == 2) {
    return 1;
  }
  else {
    return 4 * (v3 == 1);
  }
}

- (MPMoviePlaybackState)playbackState
{
  uint64_t v3 = [(AVPlayerViewController *)self->_playerViewController player];
  BOOL v4 = [v3 currentItem];

  if (!v4) {
    return 0;
  }
  id v5 = [(AVPlayerViewController *)self->_playerViewController playerController];
  int v6 = [v5 isPlaying];

  if (v6) {
    return 1;
  }
  else {
    return 2;
  }
}

- (UIView)backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = self->_backgroundView;
    self->_backgroundView = v4;

    backgroundView = self->_backgroundView;
  }

  return backgroundView;
}

- (UIView)view
{
  proxyView = self->_proxyView;
  if (!proxyView)
  {
    BOOL v4 = [[_MPMoviePlayerProxyView alloc] initWithMoviePlayerController:self];
    id v5 = self->_proxyView;
    self->_proxyView = v4;

    proxyView = self->_proxyView;
  }

  return (UIView *)proxyView;
}

- (void)setContentURL:(NSURL *)contentURL
{
  BOOL v4 = contentURL;
  id v5 = self->_contentURL;
  if (v5 != v4)
  {
    id v9 = v4;
    char v6 = [(NSURL *)v5 isEqual:v4];
    BOOL v4 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSURL *)[(NSURL *)v9 copy];
      id v8 = self->_contentURL;
      self->_contentURL = v7;

      BOOL v4 = v9;
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"videoGravity" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"playerController.status" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"isReadyForDisplay" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"player.currentItem" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"player.isExternalPlaybackActive" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"playerController.isPlaying" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"playerController.contentDuration" context:_MPMoviePlayerControllerObservationContext];
  [(AVPlayerViewController *)self->_playerViewController removeObserver:self forKeyPath:@"playerController.contentDimensions" context:_MPMoviePlayerControllerObservationContext];
  v4.receiver = self;
  v4.super_class = (Class)MPMoviePlayerController;
  [(MPMoviePlayerController *)&v4 dealloc];
}

- (MPMoviePlayerController)initWithContentURL:(NSURL *)url
{
  objc_super v4 = url;
  v12.receiver = self;
  v12.super_class = (Class)MPMoviePlayerController;
  id v5 = [(MPMoviePlayerController *)&v12 init];
  if (v5)
  {
    uint64_t v14 = 0;
    CMTime v15 = &v14;
    uint64_t v16 = 0x2050000000;
    char v6 = (void *)getAVPlayerViewControllerClass_softClass;
    uint64_t v17 = getAVPlayerViewControllerClass_softClass;
    if (!getAVPlayerViewControllerClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getAVPlayerViewControllerClass_block_invoke;
      v13[3] = &unk_1E57FA300;
      v13[4] = &v14;
      __getAVPlayerViewControllerClass_block_invoke((uint64_t)v13);
      char v6 = (void *)v15[3];
    }
    double v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v8 = (AVPlayerViewController *)objc_alloc_init(v7);
    playerViewController = v5->_playerViewController;
    v5->_playerViewController = v8;

    [(AVPlayerViewController *)v5->_playerViewController setDelegate:v5];
    [(AVPlayerViewController *)v5->_playerViewController setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)v5->_playerViewController setUpdatesNowPlayingInfoCenter:0];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"videoGravity" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"playerController.status" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"isReadyForDisplay" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"player.currentItem" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"player.isExternalPlaybackActive" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"playerController.isPlaying" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"playerController.contentDuration" options:1 context:_MPMoviePlayerControllerObservationContext];
    [(AVPlayerViewController *)v5->_playerViewController addObserver:v5 forKeyPath:@"playerController.contentDimensions" options:1 context:_MPMoviePlayerControllerObservationContext];
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v5 selector:sel__avPlayerItemDidPlayToEndNotification_ name:*MEMORY[0x1E4F16020] object:0];

    [(MPMoviePlayerController *)v5 setContentURL:v4];
    [(MPMoviePlayerController *)v5 setControlStyle:1];
  }

  return v5;
}

- (MPMoviePlayerController)init
{
  return [(MPMoviePlayerController *)self initWithContentURL:0];
}

@end