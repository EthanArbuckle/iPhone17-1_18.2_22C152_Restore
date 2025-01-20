@interface __AVPlayerLayerView
+ (Class)layerClass;
+ (id)keyPathsForValuesAffectingPixelBufferAttributes;
+ (id)keyPathsForValuesAffectingPlayerLayer;
+ (id)keyPathsForValuesAffectingReadyForDisplay;
+ (id)keyPathsForValuesAffectingVideoBounds;
+ (id)keyPathsForValuesAffectingVideoDisplaySize;
+ (id)keyPathsForValuesAffectingVideoGravity;
+ (id)keyPathsForValuesAffectingVideoScaled;
- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView;
- (AVPlayerController)playerController;
- (AVPlayerLayer)pictureInPicturePlayerLayer;
- (BOOL)isReadyForDisplay;
- (BOOL)isVideoScaled;
- (CGRect)videoBounds;
- (CGSize)videoDisplaySize;
- (NSDictionary)pixelBufferAttributes;
- (int64_t)videoGravity;
- (void)setPictureInPicturePlayerLayer:(id)a3;
- (void)setPixelBufferAttributes:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setVideoGravity:(int64_t)a3;
- (void)setVideoScaled:(BOOL)a3;
- (void)startRoutingVideoToPictureInPicturePlayerLayerView;
- (void)stopRoutingVideoToPictureInPicturePlayerLayerView;
@end

@implementation __AVPlayerLayerView

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  v9 = (AVPlayerController *)a3;
  if (self->_playerController != v9)
  {
    objc_storeStrong((id *)&self->_playerController, a3);
    v5 = [(__AVPlayerLayerView *)self playerLayer];
    v6 = [(AVPlayerController *)v9 player];
    [v5 setPlayer:v6];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    v8 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
    [v8 setBackgroundColor:v7];
  }
}

- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView
{
  pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  if (!pictureInPicturePlayerLayerView)
  {
    v4 = [AVPictureInPicturePlayerLayerView alloc];
    v5 = -[AVPictureInPicturePlayerLayerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_pictureInPicturePlayerLayerView;
    self->_pictureInPicturePlayerLayerView = v5;

    pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  }

  return pictureInPicturePlayerLayerView;
}

- (void)setPixelBufferAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(__AVPlayerLayerView *)self playerLayer];
  [v5 setPixelBufferAttributes:v4];
}

- (CGRect)videoBounds
{
  v3 = [(__AVPlayerLayerView *)self playerLayer];
  [v3 videoRect];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;

  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  if (CGRectIsEmpty(v38))
  {
    [(__AVPlayerLayerView *)self bounds];
    if (!CGRectIsEmpty(v39))
    {
      v12 = [(__AVPlayerLayerView *)self playerController];
      [v12 contentDimensions];
      if (v14 != *MEMORY[0x1E4F1DB30] || v13 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        v16 = [(__AVPlayerLayerView *)self playerController];
        [v16 contentDimensions];

        if ([(__AVPlayerLayerView *)self videoGravity] != 1)
        {
          [(__AVPlayerLayerView *)self bounds];
          CGFloat x = v29;
          CGFloat y = v30;
          CGFloat width = v31;
          CGFloat height = v32;
          goto LABEL_11;
        }
        v12 = [(__AVPlayerLayerView *)self playerController];
        [v12 contentDimensions];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        [(__AVPlayerLayerView *)self bounds];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        v37.CGFloat width = v18;
        v37.CGFloat height = v20;
        v42.origin.CGFloat x = v22;
        v42.origin.CGFloat y = v24;
        v42.size.CGFloat width = v26;
        v42.size.CGFloat height = v28;
        CGRect v40 = AVMakeRectWithAspectRatioInsideRect(v37, v42);
        CGFloat x = v40.origin.x;
        CGFloat y = v40.origin.y;
        CGFloat width = v40.size.width;
        CGFloat height = v40.size.height;
      }
    }
  }
LABEL_11:
  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playerLayer.videoGravity"];
}

+ (id)keyPathsForValuesAffectingReadyForDisplay
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playerLayer.readyForDisplay"];
}

+ (id)keyPathsForValuesAffectingPlayerLayer
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"layer"];
}

- (void)setVideoGravity:(int64_t)a3
{
  id v5 = [(__AVPlayerLayerView *)self playerLayer];
  double v4 = NSStringFromVideoGravity(a3);
  [v5 setVideoGravity:v4];
}

- (int64_t)videoGravity
{
  v2 = [(__AVPlayerLayerView *)self playerLayer];
  v3 = [v2 videoGravity];
  int64_t v4 = AVVideoGravityFromString(v3);

  return v4;
}

- (BOOL)isReadyForDisplay
{
  v2 = [(__AVPlayerLayerView *)self playerLayer];
  char v3 = [v2 isReadyForDisplay];

  return v3;
}

+ (id)keyPathsForValuesAffectingVideoBounds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playerLayer.videoRect", @"bounds", @"playerController.contentDimensions", @"videoGravity", 0);
}

+ (id)keyPathsForValuesAffectingPixelBufferAttributes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"playerLayer.pixelBufferAttributes"];
}

+ (id)keyPathsForValuesAffectingVideoScaled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"videoGravity"];
}

+ (id)keyPathsForValuesAffectingVideoDisplaySize
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"videoBounds", @"pictureInPicturePlayerLayer.videoRect", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);

  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayerView, 0);
}

- (void)setPictureInPicturePlayerLayer:(id)a3
{
}

- (AVPlayerLayer)pictureInPicturePlayerLayer
{
  return self->_pictureInPicturePlayerLayer;
}

- (void)stopRoutingVideoToPictureInPicturePlayerLayerView
{
  char v3 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
  int64_t v4 = [v3 playerLayer];

  if (v4)
  {
    id v5 = [(__AVPlayerLayerView *)self playerLayer];
    double v6 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
    v7 = [v6 playerLayer];
    [v5 stopRedirectingVideoToLayer:v7];

    double v8 = [(__AVPlayerLayerView *)self playerLayer];
    LODWORD(v6) = [v8 isLegibleDisplayEnabled];

    if (v6)
    {
      v9 = [(__AVPlayerLayerView *)self playerLayer];
      [v9 setLegibleDisplayEnabled:0];

      double v10 = [(__AVPlayerLayerView *)self playerLayer];
      [v10 setLegibleDisplayEnabled:1];
    }
    v11 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
    v12 = [v11 playerLayer];
    [v12 setLegibleDisplayEnabled:1];
  }
  [(__AVPlayerLayerView *)self setPictureInPicturePlayerLayer:0];
  double v13 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
  [v13 detachPlayerLayer];

  id v14 = [(__AVPlayerLayerView *)self playerLayer];
  [v14 setPlaceholderContentLayerDuringPIPMode:0];
}

- (void)startRoutingVideoToPictureInPicturePlayerLayerView
{
  char v3 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
  [v3 attachPlayerLayer];

  int64_t v4 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
  id v5 = [v4 playerLayer];
  [(__AVPlayerLayerView *)self setPictureInPicturePlayerLayer:v5];

  double v6 = [(__AVPlayerLayerView *)self playerLayer];
  v7 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayerView];
  double v8 = [v7 playerLayer];
  [v6 startRedirectingVideoToLayer:v8 forMode:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (NSDictionary)pixelBufferAttributes
{
  v2 = [(__AVPlayerLayerView *)self playerLayer];
  char v3 = [v2 pixelBufferAttributes];

  return (NSDictionary *)v3;
}

- (void)setVideoScaled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(__AVPlayerLayerView *)self setVideoGravity:v3];
}

- (BOOL)isVideoScaled
{
  return [(__AVPlayerLayerView *)self videoGravity] == 2;
}

- (CGSize)videoDisplaySize
{
  uint64_t v3 = [(__AVPlayerLayerView *)self pictureInPicturePlayerLayer];
  [v3 videoRect];
  double v5 = v4;
  double v7 = v6;

  if (v5 == *MEMORY[0x1E4F1DB30] && v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(__AVPlayerLayerView *)self videoBounds];
    double v5 = v9;
    double v7 = v10;
  }
  double v11 = v5;
  double v12 = v7;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

@end