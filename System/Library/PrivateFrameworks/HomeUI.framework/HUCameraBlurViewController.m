@interface HUCameraBlurViewController
- (BOOL)shouldShowBlurForPlaybackEngine:(id)a3;
- (BOOL)showingBlur;
- (UIVisualEffectView)blurView;
- (void)setBlurView:(id)a3;
- (void)setShowingBlur:(BOOL)a3;
- (void)updateBlurWithPlaybackEngine:(id)a3 completionHandler:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUCameraBlurViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUCameraBlurViewController;
  [(HUCameraBlurViewController *)&v10 viewDidLoad];
  v3 = [(HUCameraBlurViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  v4 = [(HUCameraBlurViewController *)self view];
  v5 = [(HUCameraBlurViewController *)self blurView];
  [v4 addSubview:v5];

  v6 = (void *)MEMORY[0x1E4F28DC8];
  v7 = [(HUCameraBlurViewController *)self blurView];
  v8 = [(HUCameraBlurViewController *)self view];
  v9 = objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, v8);
  [v6 activateConstraints:v9];
}

- (BOOL)shouldShowBlurForPlaybackEngine:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) == 0
    && [v3 timelineState] != 2
    && [v3 timeControlStatus] == 0;

  return v4;
}

- (void)updateBlurWithPlaybackEngine:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  BOOL v8 = [(HUCameraBlurViewController *)self shouldShowBlurForPlaybackEngine:v6];
  [(HUCameraBlurViewController *)self setShowingBlur:v8];
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(HUCameraBlurViewController *)self showingBlur];
    v11 = [v6 engineModeDescription];
    v12 = [v6 timelineStateDescription];
    v13 = [v6 timeControlStatusDescription];
    v18[0] = 67110146;
    v18[1] = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Showing blur:%{BOOL}d engine:%@ engineMode:%@ timelineState:%@ timeControlStatus:%@.", (uint8_t *)v18, 0x30u);
  }
  float v14 = (float)[(HUCameraBlurViewController *)self showingBlur];
  v15 = [(HUCameraBlurViewController *)self blurView];
  v16 = [v15 layer];
  *(float *)&double v17 = v14;
  [v16 setOpacity:v17];

  if (v7) {
    v7[2](v7, v8);
  }
}

- (UIVisualEffectView)blurView
{
  blurView = self->_blurView;
  if (!blurView)
  {
    BOOL v4 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:35.0];
    v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v4];
    [(UIVisualEffectView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(UIVisualEffectView *)v5 bounds];
    v7 = objc_msgSend(v6, "initWithFrame:");
    [v7 setAutoresizingMask:18];
    BOOL v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [v7 setBackgroundColor:v8];

    [v7 setAlpha:0.5];
    v9 = [(UIVisualEffectView *)v5 contentView];
    [v9 addSubview:v7];

    [(UIVisualEffectView *)v5 setAlpha:0.0];
    BOOL v10 = self->_blurView;
    self->_blurView = v5;

    blurView = self->_blurView;
  }

  return blurView;
}

- (void)setBlurView:(id)a3
{
}

- (BOOL)showingBlur
{
  return self->_showingBlur;
}

- (void)setShowingBlur:(BOOL)a3
{
  self->_showingBlur = a3;
}

- (void).cxx_destruct
{
}

@end