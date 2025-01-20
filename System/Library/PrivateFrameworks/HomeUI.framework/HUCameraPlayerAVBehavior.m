@interface HUCameraPlayerAVBehavior
- (HUCameraPlayerAVBehavior)init;
- (HUCameraPlayerAVBehavior)initWithDelegate:(id)a3;
- (HUCameraPlayerAVBehaviorDelegate)delegate;
- (void)beginScrubbing;
- (void)endScrubbingWithTargetTime:(double)a3;
- (void)pictureInPictureActionButtonTapped;
- (void)playbackControlsDidChangePlayerVolume:(float)a3;
- (void)playbackControlsDidToggleMuted:(BOOL)a3;
- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3;
- (void)scrubToTime:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HUCameraPlayerAVBehavior

- (HUCameraPlayerAVBehavior)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithDelegate_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraPlayerAVBehavior.m", 15, @"%s is unavailable; use %@ instead",
    "-[HUCameraPlayerAVBehavior init]",
    v5);

  return 0;
}

- (HUCameraPlayerAVBehavior)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  v5 = [(HUCameraPlayerAVBehavior *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidToggleMuted:](&v8, sel_playbackControlsDidToggleMuted_);
  v5 = [(HUCameraPlayerAVBehavior *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(HUCameraPlayerAVBehavior *)self delegate];
    [v7 playbackControlsDidToggleMuted:v3];
  }
}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidUpdateVisibilityOfLoadingIndicator:](&v8, sel_playbackControlsDidUpdateVisibilityOfLoadingIndicator_);
  v5 = [(HUCameraPlayerAVBehavior *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(HUCameraPlayerAVBehavior *)self delegate];
    [v7 playbackControlsDidUpdateVisibilityOfLoadingIndicator:v3];
  }
}

- (void)pictureInPictureActionButtonTapped
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ pictureInPictureActionButtonTapped.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)HUCameraPlayerAVBehavior;
  [(AVHomeIPCameraBehavior *)&v7 pictureInPictureActionButtonTapped];
  id v4 = [(HUCameraPlayerAVBehavior *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(HUCameraPlayerAVBehavior *)self delegate];
    [v6 pictureInPictureDidToggleMicrophone];
  }
}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAVBehavior;
  -[AVHomeIPCameraBehavior playbackControlsDidChangePlayerVolume:](&v8, sel_playbackControlsDidChangePlayerVolume_);
  char v5 = [(HUCameraPlayerAVBehavior *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [MEMORY[0x1E4F69758] isAMac];

    if (!v6) {
      return;
    }
    char v5 = [(HUCameraPlayerAVBehavior *)self delegate];
    *(float *)&double v7 = a3;
    [v5 playbackControlsDidChangePlayerVolume:v7];
  }
}

- (void)beginScrubbing
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_debug_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEBUG, "%@ beginScrubbing", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(AVHomeIPCameraBehavior *)self behaviorContext];
  [v4 beginScrubbing];
}

- (void)endScrubbingWithTargetTime:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "%@ endScrubbingWithTargetTime: %.3f", (uint8_t *)&v8, 0x16u);
  }

  int v6 = [(AVHomeIPCameraBehavior *)self behaviorContext];
  [v6 scrubToTime:a3 resolution:0.0];

  uint64_t v7 = [(AVHomeIPCameraBehavior *)self behaviorContext];
  [v7 endScrubbing];
}

- (void)scrubToTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = [(HUCameraPlayerAVBehavior *)self delegate];
  [v5 currentScrubberResolutionForBehavior:self];
  double v7 = v6;

  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412802;
    double v11 = self;
    __int16 v12 = 2048;
    double v13 = a3;
    __int16 v14 = 2048;
    double v15 = v7;
    _os_log_debug_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEBUG, "%@ scrubToTime: %.3f (resolution: %f)", (uint8_t *)&v10, 0x20u);
  }

  v9 = [(AVHomeIPCameraBehavior *)self behaviorContext];
  [v9 scrubToTime:a3 resolution:v7];
}

- (HUCameraPlayerAVBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCameraPlayerAVBehaviorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end