@interface HUCameraTimelapseController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)chaseTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromDate:(SEL)a3;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)canSeekWithClip:(id)a3;
- (BOOL)isPlayingHLSPlayerItem;
- (BOOL)isSeekInProgress;
- (BOOL)isSeekingToTime;
- (CALayer)imageLayer;
- (HMCameraClip)currentClip;
- (HMCameraClip)highQualityClip;
- (HMCameraProfile)cameraProfile;
- (HUCameraTimelapseController)initWithCameraProfile:(id)a3;
- (NSArray)timelapseClips;
- (NSCache)cachedPlayerItems;
- (NSMutableDictionary)cachedVideos;
- (id)playerItemForURL:(id)a3;
- (int64_t)playerItemStatus;
- (unint64_t)downloadState;
- (void)_fallbackToHighQualityClip:(id)a3;
- (void)_hideAllTimelapseLayers;
- (void)_loadPlayerForTimelapseClip:(id)a3 atLocation:(id)a4;
- (void)_loadPlayerFromLocation:(id)a3;
- (void)_showOnlyImageLayer;
- (void)_showOnlyPlayerLayer;
- (void)_updateTimelapseClip:(id)a3 withHighQualityClip:(id)a4;
- (void)actuallySeekToTime;
- (void)dealloc;
- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4;
- (void)failedToDownloadVideoFileForClip:(id)a3;
- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4;
- (void)hideAllViews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseTimelapseScrubbing;
- (void)resetForNewCamera;
- (void)seekToDate:(id)a3;
- (void)setCachedPlayerItems:(id)a3;
- (void)setCachedVideos:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setChaseTime:(id *)a3;
- (void)setCurrentClip:(id)a3;
- (void)setDownloadState:(unint64_t)a3;
- (void)setHighQualityClip:(id)a3;
- (void)setPlayerItemStatus:(int64_t)a3;
- (void)setPlayingHLSPlayerItem:(BOOL)a3;
- (void)setSeekInProgress:(BOOL)a3;
- (void)setSeekingToTime:(BOOL)a3;
- (void)setTimelapseVisibility:(BOOL)a3;
- (void)trySeekToChaseTime;
- (void)updatePlaceholderContent;
- (void)updateToPlaybackPosition:(id)a3 forHighQualityClip:(id)a4;
- (void)updateVideoBounds:(CGRect)a3;
@end

@implementation HUCameraTimelapseController

- (HUCameraTimelapseController)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUCameraTimelapseController;
  v6 = [(HUCameraTimelapseController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    v8 = (AVPlayer *)objc_alloc_init(MEMORY[0x1E4F16608]);
    player = v7->_player;
    v7->_player = v8;

    [(AVPlayer *)v7->_player addObserver:v7 forKeyPath:@"status" options:0 context:HUCameraTimelapseControllerContext];
    uint64_t v10 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:v7->_player];
    playerLayer = v7->_playerLayer;
    v7->_playerLayer = (AVPlayerLayer *)v10;

    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageLayer = v7->_imageLayer;
    v7->_imageLayer = v12;

    [(HUCameraTimelapseController *)v7 _hideAllTimelapseLayers];
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedVideos = v7->_cachedVideos;
    v7->_cachedVideos = v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cachedPlayerItems = v7->_cachedPlayerItems;
    v7->_cachedPlayerItems = v16;

    [(NSCache *)v7->_cachedPlayerItems setCountLimit:6];
    v7->_downloadState = 0;
  }

  return v7;
}

- (void)resetForNewCamera
{
  v3 = [(HUCameraTimelapseController *)self imageLayer];
  [v3 setContents:0];

  v4 = [(HUCameraTimelapseController *)self cachedPlayerItems];
  [v4 removeAllObjects];

  [(HUCameraTimelapseController *)self setCurrentClip:0];
  [(HUCameraTimelapseController *)self setHighQualityClip:0];

  [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromDate:(SEL)a3
{
  id v6 = a4;
  v7 = [(HUCameraTimelapseController *)self currentClip];
  v8 = [v7 startDate];
  [v6 timeIntervalSinceDate:v8];
  Float64 v10 = v9;

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v10, 1000);
}

- (BOOL)canSeekWithClip:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCameraTimelapseController *)self currentClip];
  id v6 = [v5 uniqueIdentifier];
  v7 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v6 isEqual:v7];
  return (char)v4;
}

- (id)playerItemForURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUCameraTimelapseController *)self cachedPlayerItems];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Adding player item to cache: %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithURL:v4];
    v8 = [(HUCameraTimelapseController *)self cachedPlayerItems];
    [v8 setObject:v6 forKey:v4];
  }

  return v6;
}

- (void)updatePlaceholderContent
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F68F90] sharedManager];
  id v4 = [(HUCameraTimelapseController *)self highQualityClip];
  id v5 = [v3 firstPosterFrameImageForClip:v4];

  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(HUCameraTimelapseController *)self highQualityClip];
      v8 = [v7 uniqueIdentifier];
      double v9 = [(HUCameraTimelapseController *)self currentClip];
      int v10 = [v9 uniqueIdentifier];
      int v21 = 67109634;
      *(_DWORD *)v22 = 1;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v8;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "IMAGE: Updating camera clip with first poster frame:%{BOOL}d for Full:%@ Timelapse:%@", (uint8_t *)&v21, 0x1Cu);
    }
LABEL_8:
    v17 = v5;
    uint64_t v18 = [v17 CGImage];
    objc_super v19 = [(HUCameraTimelapseController *)self imageLayer];
    [v19 setContents:v18];
    goto LABEL_9;
  }
  id v11 = [(HUCameraTimelapseController *)self highQualityClip];
  id v5 = [v3 heroFrameImageForClip:v11];

  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(HUCameraTimelapseController *)self highQualityClip];
    v14 = [v13 uniqueIdentifier];
    v15 = [(HUCameraTimelapseController *)self currentClip];
    v16 = [v15 uniqueIdentifier];
    int v21 = 67109634;
    *(_DWORD *)v22 = v5 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = v14;
    __int16 v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "IMAGE: Updating camera clip with hero frame:%{BOOL}d for Full:%@ Timelapse:%@", (uint8_t *)&v21, 0x1Cu);
  }
  if (v5) {
    goto LABEL_8;
  }
  [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
  v17 = HFLogForCategory();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    goto LABEL_10;
  }
  objc_super v19 = [(HUCameraTimelapseController *)self currentClip];
  v20 = [v19 uniqueIdentifier];
  int v21 = 138412290;
  *(void *)v22 = v20;
  _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "IMAGE: No image available for %@. Using stale image.", (uint8_t *)&v21, 0xCu);

LABEL_9:
LABEL_10:
}

- (void)_updateTimelapseClip:(id)a3 withHighQualityClip:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [(HUCameraTimelapseController *)self currentClip];
    int v10 = [v9 uniqueIdentifier];
    id v11 = [v6 uniqueIdentifier];
    int v17 = 138412546;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Updating timelapse from %@ to %@", (uint8_t *)&v17, 0x16u);
  }
  [(HUCameraTimelapseController *)self setPlayingHLSPlayerItem:0];
  [(HUCameraTimelapseController *)self setDownloadState:0];
  [(HUCameraTimelapseController *)self setCurrentClip:v6];
  uint64_t v12 = [(HUCameraTimelapseController *)self imageLayer];
  [v12 setContents:0];

  v13 = [(HUCameraTimelapseController *)self currentClip];

  if (v13) {
    [(HUCameraTimelapseController *)self updatePlaceholderContent];
  }
  if ([v7 isComplete])
  {
    v14 = [MEMORY[0x1E4F68FF0] sharedProvider];
    [v14 getVideoForTimelapseClip:v6 taskType:0 delegate:self];
  }
  else
  {
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v6 uniqueIdentifier];
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Using HLS Playlist to play in-progress timelapse clip:%@", (uint8_t *)&v17, 0xCu);
    }
    [(HUCameraTimelapseController *)self _fallbackToHighQualityClip:v7];
  }
}

- (void)_fallbackToHighQualityClip:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(HUCameraTimelapseController *)self setPlayingHLSPlayerItem:1];
    id v5 = objc_alloc(MEMORY[0x1E4F68F80]);
    id v6 = [(HUCameraTimelapseController *)self cameraProfile];
    id v7 = [v6 clipManager];
    v8 = (void *)[v5 initWithClipManager:v7 clip:v4];

    double v9 = [(HUCameraTimelapseController *)self player];
    [v9 replaceCurrentItemWithPlayerItem:v8];
  }
  else
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Trying to fallback to high quality clip but it is nil", v11, 2u);
    }
  }
}

- (void)setTimelapseVisibility:(BOOL)a3
{
  if (!a3)
  {
LABEL_8:
    [(HUCameraTimelapseController *)self _hideAllTimelapseLayers];
    return;
  }
  if ([(HUCameraTimelapseController *)self isPlayingHLSPlayerItem])
  {
LABEL_3:
    [(HUCameraTimelapseController *)self _showOnlyPlayerLayer];
    return;
  }
  if ([(HUCameraTimelapseController *)self downloadState])
  {
    if ([(HUCameraTimelapseController *)self downloadState] != 2)
    {
      if ([(HUCameraTimelapseController *)self downloadState] != 1) {
        return;
      }
      goto LABEL_3;
    }
    goto LABEL_8;
  }

  [(HUCameraTimelapseController *)self _showOnlyImageLayer];
}

- (void)_hideAllTimelapseLayers
{
  v3 = [(HUCameraTimelapseController *)self playerLayer];
  [v3 setHidden:1];

  id v4 = [(HUCameraTimelapseController *)self imageLayer];
  [v4 setHidden:1];
}

- (void)_showOnlyPlayerLayer
{
  v3 = [(HUCameraTimelapseController *)self playerLayer];
  [v3 setHidden:0];

  id v4 = [(HUCameraTimelapseController *)self imageLayer];
  [v4 setHidden:1];
}

- (void)_showOnlyImageLayer
{
  v3 = [(HUCameraTimelapseController *)self playerLayer];
  [v3 setHidden:1];

  id v4 = [(HUCameraTimelapseController *)self imageLayer];
  [v4 setHidden:0];
}

- (void)updateToPlaybackPosition:(id)a3 forHighQualityClip:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F68FE8] sharedManager];
  v8 = [v17 clipPlaybackDate];
  double v9 = [v7 timelapseClipPositionForDate:v8 inHighQualityClip:v6];

  if (v9)
  {
    [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
    [(HUCameraTimelapseController *)self setHighQualityClip:v6];
    int v10 = [(HUCameraTimelapseController *)self currentClip];
    id v11 = [v10 uniqueIdentifier];
    uint64_t v12 = [v9 clip];
    v13 = [v12 uniqueIdentifier];
    char v14 = [v11 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      v15 = [v9 clip];
      [(HUCameraTimelapseController *)self _updateTimelapseClip:v15 withHighQualityClip:v6];
    }
    [(HUCameraTimelapseController *)self setTimelapseVisibility:1];
    v16 = [v17 clipPlaybackDate];
    [(HUCameraTimelapseController *)self seekToDate:v16];
  }
  else
  {
    [(HUCameraTimelapseController *)self setCurrentClip:0];
    [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
  }
}

- (void)updateVideoBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = [(HUCameraTimelapseController *)self playerLayer];
  id v7 = [v6 superlayer];
  [v7 bounds];
  double v8 = CGRectGetMidX(v24) - width * 0.5;

  double v9 = [(HUCameraTimelapseController *)self playerLayer];
  int v10 = [v9 superlayer];
  [v10 bounds];
  double v11 = CGRectGetMidY(v25) - height * 0.5;

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  uint64_t v12 = [(HUCameraTimelapseController *)self playerLayer];
  objc_msgSend(v12, "setFrame:", v8, v11, width, height);

  v13 = [(HUCameraTimelapseController *)self imageLayer];
  objc_msgSend(v13, "setFrame:", v8, v11, width, height);

  [MEMORY[0x1E4F39CF8] commit];
  char v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218752;
    double v16 = v8;
    __int16 v17 = 2048;
    double v18 = v11;
    __int16 v19 = 2048;
    double v20 = width;
    __int16 v21 = 2048;
    double v22 = height;
    _os_log_debug_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEBUG, "Updating timelapse video bounds :%.0f, %.0f, %.0f, %.0f", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)hideAllViews
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Hiding timelapse views", v4, 2u);
  }

  [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
}

- (void)pauseTimelapseScrubbing
{
}

- (void)seekToDate:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  [(HUCameraTimelapseController *)self cmTimeFromDate:a3];
  [(HUCameraTimelapseController *)self chaseTime];
  CMTime time1 = v7;
  if (CMTimeCompare(&time1, &time2))
  {
    CMTime v4 = v7;
    [(HUCameraTimelapseController *)self setChaseTime:&v4];
    if (![(HUCameraTimelapseController *)self isSeekInProgress]) {
      [(HUCameraTimelapseController *)self trySeekToChaseTime];
    }
  }
}

- (void)trySeekToChaseTime
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(HUCameraTimelapseController *)self playerItemStatus])
  {
    id v6 = HFLogForCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v26) = 0;
    uint64_t v12 = "Not seeking because status is unknown.";
LABEL_10:
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v26, 2u);
    goto LABEL_18;
  }
  if ([(HUCameraTimelapseController *)self playerItemStatus] != 1)
  {
    id v6 = HFLogForCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v26) = 0;
    uint64_t v12 = "Not seeking because status is failed";
    goto LABEL_10;
  }
  v3 = [(HUCameraTimelapseController *)self player];
  CMTime v4 = [v3 currentItem];
  id v5 = [v4 asset];
  id v6 = [v5 URL];

  CMTime v7 = [(HUCameraTimelapseController *)self currentClip];

  if (!v7) {
    goto LABEL_18;
  }
  double v8 = [v6 path];
  double v9 = [(HUCameraTimelapseController *)self currentClip];
  int v10 = [v9 uniqueIdentifier];
  double v11 = [v10 UUIDString];
  if ([v8 containsString:v11])
  {

LABEL_12:
    char v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(HUCameraTimelapseController *)self player];
      double v16 = [v15 currentItem];
      __int16 v17 = [v16 asset];
      double v18 = [(HUCameraTimelapseController *)self currentClip];
      __int16 v19 = [v18 uniqueIdentifier];
      int v26 = 138412546;
      v27 = v17;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Seeking with current item:%@ for clip:%@", (uint8_t *)&v26, 0x16u);
    }
    [(HUCameraTimelapseController *)self actuallySeekToTime];
    goto LABEL_18;
  }
  BOOL v13 = [(HUCameraTimelapseController *)self isPlayingHLSPlayerItem];

  if (v13) {
    goto LABEL_12;
  }
  double v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = [(HUCameraTimelapseController *)self player];
    double v22 = [v21 currentItem];
    uint64_t v23 = [v22 asset];
    CGRect v24 = [(HUCameraTimelapseController *)self currentClip];
    CGRect v25 = [v24 uniqueIdentifier];
    int v26 = 138412546;
    v27 = v23;
    __int16 v28 = 2112;
    v29 = v25;
    _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "Unable to seek due to mismatched item:%@ for clip:%@", (uint8_t *)&v26, 0x16u);
  }
LABEL_18:
}

- (void)actuallySeekToTime
{
  [(HUCameraTimelapseController *)self setSeekInProgress:1];
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  [(HUCameraTimelapseController *)self chaseTime];
  v3 = [(HUCameraTimelapseController *)self player];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HUCameraTimelapseController_actuallySeekToTime__block_invoke;
  v10[3] = &unk_1E6391CF8;
  long long v11 = v13;
  v10[4] = self;
  uint64_t v12 = v14;
  long long v8 = v13;
  uint64_t v9 = v14;
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v4 = v6;
  uint64_t v5 = v7;
  [v3 seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:v10];
}

void __49__HUCameraTimelapseController_actuallySeekToTime__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setSeekInProgress:0];
  long long v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 chaseTime];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = *(CMTime *)(a1 + 40);
  int32_t v5 = CMTimeCompare(&time1, &time2);
  long long v6 = HFLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LODWORD(time1.value) = 67109120;
      HIDWORD(time1.value) = a2;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Finished seeking. Previous seek request to complete. Completed current seek:%{BOOL}d", (uint8_t *)&time1, 8u);
    }

    [*(id *)(a1 + 32) trySeekToChaseTime];
  }
  else
  {
    if (v7)
    {
      LODWORD(time1.value) = 67109120;
      HIDWORD(time1.value) = a2;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Finished seeking. Completed current seek:%{BOOL}d", (uint8_t *)&time1, 8u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((void *)HUCameraTimelapseControllerContext == a6)
  {
    if (objc_msgSend(a3, "isEqual:", @"status", a4, a5))
    {
      BOOL v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        long long v8 = NSNumber;
        uint64_t v9 = [(HUCameraTimelapseController *)self player];
        uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "status"));
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = self;
        __int16 v15 = 2112;
        double v16 = v10;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Player:%@ status changed:%@", buf, 0x16u);
      }
      long long v11 = [(HUCameraTimelapseController *)self player];
      -[HUCameraTimelapseController setPlayerItemStatus:](self, "setPlayerItemStatus:", [v11 status]);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUCameraTimelapseController;
    -[HUCameraTimelapseController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  v3 = [(HUCameraTimelapseController *)self player];
  [v3 removeObserver:self forKeyPath:@"status"];

  long long v4 = [MEMORY[0x1E4F68FE8] sharedManager];
  [v4 setClipManager:0];

  v5.receiver = self;
  v5.super_class = (Class)HUCameraTimelapseController;
  [(HUCameraTimelapseController *)&v5 dealloc];
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HUCameraTimelapseController_didDownloadVideoFileForClip_toURL___block_invoke;
  block[3] = &unk_1E6386340;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__HUCameraTimelapseController_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadPlayerForTimelapseClip:*(void *)(a1 + 40) atLocation:*(void *)(a1 + 48)];
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HUCameraTimelapseController_foundVideoFileForClip_atURL___block_invoke;
  block[3] = &unk_1E6386340;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__HUCameraTimelapseController_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadPlayerForTimelapseClip:*(void *)(a1 + 40) atLocation:*(void *)(a1 + 48)];
}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error fetching clip: %@", (uint8_t *)&v6, 0xCu);
  }

  [(HUCameraTimelapseController *)self setDownloadState:2];
  [(HUCameraTimelapseController *)self setTimelapseVisibility:0];
}

- (void)_loadPlayerForTimelapseClip:(id)a3 atLocation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUCameraTimelapseController *)self currentClip];
  id v9 = [v8 uniqueIdentifier];
  uint64_t v10 = [v6 uniqueIdentifier];
  char v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
    [(HUCameraTimelapseController *)self _loadPlayerFromLocation:v7];
  }
  else
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "No longer need timelapse for clip: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_loadPlayerFromLocation:(id)a3
{
  id v4 = a3;
  [(HUCameraTimelapseController *)self setDownloadState:1];
  [(HUCameraTimelapseController *)self setTimelapseVisibility:1];
  id v6 = [(HUCameraTimelapseController *)self playerItemForURL:v4];

  objc_super v5 = [(HUCameraTimelapseController *)self player];
  [v5 replaceCurrentItemWithPlayerItem:v6];
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (NSArray)timelapseClips
{
  return self->_timelapseClips;
}

- (HMCameraClip)currentClip
{
  return self->_currentClip;
}

- (void)setCurrentClip:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (BOOL)isSeekingToTime
{
  return self->_seekingToTime;
}

- (void)setSeekingToTime:(BOOL)a3
{
  self->_seekingToTime = a3;
}

- (NSMutableDictionary)cachedVideos
{
  return self->_cachedVideos;
}

- (void)setCachedVideos:(id)a3
{
}

- (NSCache)cachedPlayerItems
{
  return self->_cachedPlayerItems;
}

- (void)setCachedPlayerItems:(id)a3
{
}

- (HMCameraClip)highQualityClip
{
  return self->_highQualityClip;
}

- (void)setHighQualityClip:(id)a3
{
}

- (BOOL)isSeekInProgress
{
  return self->_seekInProgress;
}

- (void)setSeekInProgress:(BOOL)a3
{
  self->_seekInProgress = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)chaseTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (void)setChaseTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_chaseTime.epoch = a3->var3;
  *(_OWORD *)&self->_chaseTime.value = v3;
}

- (int64_t)playerItemStatus
{
  return self->_playerItemStatus;
}

- (void)setPlayerItemStatus:(int64_t)a3
{
  self->_playerItemStatus = a3;
}

- (BOOL)isPlayingHLSPlayerItem
{
  return self->_playingHLSPlayerItem;
}

- (void)setPlayingHLSPlayerItem:(BOOL)a3
{
  self->_playingHLSPlayerItem = a3;
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unint64_t)a3
{
  self->_downloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highQualityClip, 0);
  objc_storeStrong((id *)&self->_cachedPlayerItems, 0);
  objc_storeStrong((id *)&self->_cachedVideos, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_currentClip, 0);
  objc_storeStrong((id *)&self->_timelapseClips, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end