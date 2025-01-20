@interface HUCameraRecordingPlayerView
+ (Class)layerClass;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (HUCameraRecordingPlayerView)initWithPlayer:(id)a3 displayingProgressView:(BOOL)a4;
- (UIProgressView)progressView;
@end

@implementation HUCameraRecordingPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVPlayerLayer)playerLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HUCameraRecordingPlayerView *)self layer];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  v6 = 0;
LABEL_8:

  return (AVPlayerLayer *)v6;
}

- (HUCameraRecordingPlayerView)initWithPlayer:(id)a3 displayingProgressView:(BOOL)a4
{
  BOOL v4 = a4;
  v26[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HUCameraRecordingPlayerView;
  v8 = [(HUCameraRecordingPlayerView *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_player, a3);
    v10 = [(HUCameraRecordingPlayerView *)v9 playerLayer];
    [v10 setPlayer:v7];

    if (v4)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42D28]) initWithProgressViewStyle:0];
      progressView = v9->_progressView;
      v9->_progressView = (UIProgressView *)v11;

      v13 = [MEMORY[0x1E4F428B8] systemGrayColor];
      [(UIProgressView *)v9->_progressView setTintColor:v13];

      [(UIProgressView *)v9->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HUCameraRecordingPlayerView *)v9 addSubview:v9->_progressView];
      v24 = [(UIProgressView *)v9->_progressView leftAnchor];
      v23 = [(HUCameraRecordingPlayerView *)v9 leftAnchor];
      v14 = [v24 constraintEqualToAnchor:v23 constant:10.0];
      v26[0] = v14;
      v15 = [(UIProgressView *)v9->_progressView rightAnchor];
      v16 = [(HUCameraRecordingPlayerView *)v9 rightAnchor];
      v17 = [v15 constraintEqualToAnchor:v16 constant:-10.0];
      v26[1] = v17;
      v18 = [(UIProgressView *)v9->_progressView bottomAnchor];
      v19 = [(HUCameraRecordingPlayerView *)v9 bottomAnchor];
      v20 = [v18 constraintEqualToAnchor:v19 constant:-10.0];
      v26[2] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];

      [MEMORY[0x1E4F28DC8] activateConstraints:v21];
    }
  }

  return v9;
}

- (AVPlayer)player
{
  return self->_player;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end