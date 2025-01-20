@interface AVSampleBufferDisplayLayer(AVPictureInPictureContentSource)
- (AVPictureInPictureViewController)avkit_pictureInPictureViewController;
- (BOOL)avkit_isVisible;
- (double)avkit_videoRectInWindow;
- (id)avkit_window;
- (uint64_t)avkit_contentSourceType;
- (uint64_t)avkit_wantsManagedSecondScreenPlayback;
- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource;
- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource;
@end

@implementation AVSampleBufferDisplayLayer(AVPictureInPictureContentSource)

- (uint64_t)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (uint64_t)avkit_contentSourceType
{
  return 1;
}

- (AVPictureInPictureViewController)avkit_pictureInPictureViewController
{
  v2 = [AVPictureInPictureSampleBufferDisplayLayerView alloc];
  v3 = objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
  v4 = [(AVPictureInPictureSampleBufferDisplayLayerView *)v2 initWithSourceLayer:a1 playerController:v3];

  v5 = [[AVPictureInPictureViewController alloc] initWithPictureInPicturePlayerLayerView:v4];

  return v5;
}

- (double)avkit_videoRectInWindow
{
  v2 = objc_msgSend(a1, "avkit_window");
  [a1 bounds];
  double v4 = v3;
  [a1 bounds];
  double x = v5;
  double y = v7;
  double width = v9;
  double height = v11;
  v13 = [a1 videoGravity];
  if (![v13 isEqualToString:*MEMORY[0x1E4F15AF0]]) {
    goto LABEL_20;
  }
  v14 = objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
  [v14 contentDimensions];
  uint64_t v17 = v16;
  unint64_t v18 = v16 - 1;
  unint64_t v19 = ((v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  BOOL v22 = ((v15 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v15 >= 0
     || (unint64_t)(v15 - 1) < 0xFFFFFFFFFFFFFLL;

  BOOL v24 = (v17 < 0 || v19 > 0x3FE) && v18 > 0xFFFFFFFFFFFFELL;
  if (!v24 && v22)
  {
    v13 = objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
    [v13 contentDimensions];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [a1 bounds];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    v41.double width = v26;
    v41.double height = v28;
    v43.origin.double x = v30;
    v43.origin.double y = v32;
    v43.size.double width = v34;
    v43.size.double height = v36;
    CGRect v42 = AVMakeRectWithAspectRatioInsideRect(v41, v43);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
LABEL_20:
  }
  if (v2)
  {
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v44))
    {
      v37 = [v2 layer];
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "convertRect:fromLayer:", a1, x, y, width, height);
        objc_msgSend(a1, "avkit_visibleRectForRect:inLayer:", v38);
        double v4 = v39;
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
        double v5 = [v2 delegate];
        v6 = [v5 window];
      }
      else
      {
        v6 = 0;
      }
      double v7 = [v2 superlayer];

      if (v6) {
        break;
      }
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
    double v7 = 0;
  }

  return v6;
}

- (BOOL)avkit_isVisible
{
  [a1 bounds];
  return !CGRectIsEmpty(v2);
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v3 = [a3 pictureInPicturePlayerLayerView];
  [v3 setPIPModeEnabled:0];
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v3 = [a3 pictureInPicturePlayerLayerView];
  [v3 setPIPModeEnabled:1];
}

@end