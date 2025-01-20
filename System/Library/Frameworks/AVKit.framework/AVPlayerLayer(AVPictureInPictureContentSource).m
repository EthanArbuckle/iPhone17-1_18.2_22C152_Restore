@interface AVPlayerLayer(AVPictureInPictureContentSource)
- (AVPictureInPictureIndicatorLayer)avkit_makePictureInPicturePlatformAdapterContentPlaceholderLayer;
- (AVPlayerController)avkit_makePlayerControllerIfNeeded:()AVPictureInPictureContentSource;
- (BOOL)avkit_isVisible;
- (double)avkit_videoRectInWindow;
- (id)avkit_window;
- (uint64_t)avkit_contentSourceType;
- (uint64_t)avkit_pictureInPictureViewController;
- (uint64_t)avkit_wantsManagedSecondScreenPlayback;
- (void)avkit_beginReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:;
- (void)avkit_endReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:;
- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource;
- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource;
- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:()AVPictureInPictureContentSource;
@end

@implementation AVPlayerLayer(AVPictureInPictureContentSource)

- (uint64_t)avkit_contentSourceType
{
  return 0;
}

- (AVPictureInPictureIndicatorLayer)avkit_makePictureInPicturePlatformAdapterContentPlaceholderLayer
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = AVBundle();
  v4 = objc_msgSend(a1, "avkit_window");
  v5 = [v4 traitCollection];
  v6 = [v2 imageNamed:@"PictureInPictureIndicatorLarge" inBundle:v3 compatibleWithTraitCollection:v5];

  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
  v8 = [v6 _flatImageWithColor:v7];

  v9 = [AVPictureInPictureIndicatorLayer alloc];
  v10 = objc_msgSend(a1, "avkit_window");
  v11 = [v10 traitCollection];
  [v11 displayScale];
  double v13 = v12;
  id v14 = v8;
  uint64_t v15 = [v14 CGImage];
  objc_msgSend(a1, "avkit_videoRectInWindow");
  v20 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v9, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v15, 0, v13, v16, v17, v18, v19);

  return v20;
}

- (uint64_t)avkit_wantsManagedSecondScreenPlayback
{
  return 1;
}

- (uint64_t)avkit_pictureInPictureViewController
{
  return 0;
}

- (double)avkit_videoRectInWindow
{
  v2 = objc_msgSend(a1, "avkit_window");
  [a1 bounds];
  double v4 = v3;
  if (v2)
  {
    if ([a1 isReadyForDisplay])
    {
      [a1 videoRect];
      v12.origin.x = v5;
      v12.origin.y = v6;
      v12.size.width = v7;
      v12.size.height = v8;
      if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v12))
      {
        v9 = [v2 layer];
        if (v9)
        {
          [a1 videoRect];
          objc_msgSend(v9, "convertRect:fromLayer:", a1);
          double v4 = v10;
        }
      }
    }
  }

  return v4;
}

- (id)avkit_window
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      double v3 = [v2 delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        CGFloat v5 = [v2 delegate];
        CGFloat v6 = [v5 window];
      }
      else
      {
        CGFloat v6 = 0;
      }
      CGFloat v7 = [v2 superlayer];

      if (v6) {
        break;
      }
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    CGFloat v6 = 0;
    CGFloat v7 = 0;
  }

  return v6;
}

- (BOOL)avkit_isVisible
{
  [a1 bounds];
  return !CGRectIsEmpty(v2);
}

- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v4 = [a3 pictureInPicturePlayerLayerView];
  double v3 = [v4 playerLayer];
  [v3 setLegibleDisplayEnabled:1];
}

- (void)avkit_endReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:
{
  id v5 = a4;
  id v7 = [a3 pictureInPicturePlayerLayerView];
  CGFloat v6 = [v7 playerLayer];
  [v5 endReducingResourcesForPictureInPicturePlayerLayer:v6];
}

- (void)avkit_beginReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "avkit_window");
  if (!v7 || (CGFloat v8 = (void *)v7, v9 = dyld_program_sdk_at_least(), v8, v9))
  {
    double v10 = [v12 pictureInPicturePlayerLayerView];
    v11 = [v10 playerLayer];
    [v6 beginReducingResourcesForPictureInPicturePlayerLayer:v11];
  }
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [a1 isPIPModeEnabled];
    uint64_t v7 = "NO";
    *(_DWORD *)double v13 = 136315650;
    *(void *)&v13[4] = "-[AVPlayerLayer(AVPictureInPictureContentSource) avkit_stopRoutingVideoToPictureInPictureViewController:]";
    *(void *)&v13[14] = "self.isPIPModeEnabled";
    *(_WORD *)&v13[12] = 2080;
    if (v6) {
      uint64_t v7 = "YES";
    }
    *(_WORD *)&v13[22] = 2080;
    id v14 = v7;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v13, 0x20u);
  }

  if ([a1 isPIPModeEnabled])
  {
    CGFloat v8 = [v4 pictureInPicturePlayerLayerView];
    int v9 = [v8 playerLayer];
    [a1 stopRedirectingVideoToLayer:v9];

    if ([a1 isLegibleDisplayEnabled])
    {
      [a1 setLegibleDisplayEnabled:0];
      [a1 setLegibleDisplayEnabled:1];
    }
    double v10 = objc_msgSend(v4, "pictureInPicturePlayerLayerView", *(_OWORD *)v13, *(void *)&v13[16]);
    v11 = [v10 playerLayer];
    [v11 setLegibleDisplayEnabled:1];

    id v12 = [v4 pictureInPicturePlayerLayerView];
    [v12 detachPlayerLayer];

    [a1 setPlaceholderContentLayerDuringPIPMode:0];
  }
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [a1 isPIPModeEnabled];
    uint64_t v7 = "NO";
    int v12 = 136315650;
    double v13 = "-[AVPlayerLayer(AVPictureInPictureContentSource) avkit_startRoutingVideoToPictureInPictureViewController:]";
    uint64_t v15 = "self.isPIPModeEnabled";
    __int16 v14 = 2080;
    if (v6) {
      uint64_t v7 = "YES";
    }
    __int16 v16 = 2080;
    double v17 = v7;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v12, 0x20u);
  }

  if (([a1 isPIPModeEnabled] & 1) == 0)
  {
    CGFloat v8 = [v4 pictureInPicturePlayerLayerView];
    [v8 attachPlayerLayer];

    int v9 = [v4 pictureInPicturePlayerLayerView];
    double v10 = [v9 playerLayer];
    [a1 startRedirectingVideoToLayer:v10 forMode:0];

    v11 = objc_msgSend(a1, "avkit_makePictureInPicturePlatformAdapterContentPlaceholderLayer");
    [a1 setPlaceholderContentLayerDuringPIPMode:v11];
  }
}

- (AVPlayerController)avkit_makePlayerControllerIfNeeded:()AVPictureInPictureContentSource
{
  id v4 = a3;
  id v5 = [(AVPlayerController *)v4 player];
  int v6 = [a1 player];

  uint64_t v7 = v4;
  if (v5 != v6)
  {
    CGFloat v8 = [AVPlayerController alloc];
    int v9 = [a1 player];
    uint64_t v7 = [(AVPlayerController *)v8 initWithPlayer:v9];

    [(AVPlayerController *)v7 setHandlesAudioSessionInterruptions:1];
    [(AVPlayerController *)v7 setPlayingOnSecondScreen:[(AVPlayerController *)v4 isPlayingOnSecondScreen]];
  }
  if (v7) {
    double v10 = v7;
  }
  else {
    double v10 = [[AVPlayerController alloc] initWithPlayer:0];
  }
  v11 = v10;

  return v11;
}

@end