@interface AVSecondScreenViewController
- (AVPlayerLayer)sourcePlayerLayer;
- (AVSecondScreenPlayerLayerView)playerLayerView;
- (BOOL)isPlayingOnSecondScreen;
- (CGRect)initialScreenBoundsHint;
- (CGSize)videoDisplaySize;
- (UILabel)debugLabel;
- (UIView)contentView;
- (id)debugText;
- (void)_updateContentViewIfNeeded;
- (void)_updateLayout;
- (void)dealloc;
- (void)loadPlayerLayerViewIfNeeded;
- (void)loadView;
- (void)setContentView:(id)a3;
- (void)setDebugText:(id)a3;
- (void)setInitialScreenBoundsHint:(CGRect)a3;
- (void)setPlayerLayerView:(id)a3;
- (void)setPlayingOnSecondScreen:(BOOL)a3;
- (void)setSourcePlayerLayer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AVSecondScreenViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_destroyWeak((id *)&self->_sourcePlayerLayer);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setPlayerLayerView:(id)a3
{
}

- (AVSecondScreenPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (AVPlayerLayer)sourcePlayerLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourcePlayerLayer);

  return (AVPlayerLayer *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)initialScreenBoundsHint
{
  double x = self->_initialScreenBoundsHint.origin.x;
  double y = self->_initialScreenBoundsHint.origin.y;
  double width = self->_initialScreenBoundsHint.size.width;
  double height = self->_initialScreenBoundsHint.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (void)_updateLayout
{
  v3 = [(AVSecondScreenViewController *)self playerLayerView];
  v4 = [(AVSecondScreenViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  v5 = [(AVSecondScreenViewController *)self contentView];
  v6 = [(AVSecondScreenViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  debugLabel = self->_debugLabel;
  v8 = (void *)MEMORY[0x1E4FB08E0];
  v9 = [(AVSecondScreenViewController *)self view];
  [v9 frame];
  v11 = [v8 monospacedDigitSystemFontOfSize:v10 * 0.025 weight:*MEMORY[0x1E4FB09C0]];
  [(UILabel *)debugLabel setFont:v11];

  v12 = [(AVSecondScreenViewController *)self debugLabel];
  [v12 sizeToFit];

  v13 = [(AVSecondScreenViewController *)self debugLabel];
  [v13 frame];
  double v15 = v14;

  v16 = [(AVSecondScreenViewController *)self view];
  [v16 frame];
  double v18 = v17 + -40.0;

  v19 = [(AVSecondScreenViewController *)self view];
  [v19 frame];
  double v21 = v20 + -20.0;
  v22 = [(AVSecondScreenViewController *)self debugLabel];
  [v22 frame];
  double v24 = v21 - v23;
  double v25 = 20.0;
  if (v24 >= 20.0)
  {
    v26 = [(AVSecondScreenViewController *)self view];
    [v26 frame];
    double v28 = v27 + -20.0;
    v29 = [(AVSecondScreenViewController *)self debugLabel];
    [v29 frame];
    double v25 = v28 - v30;
  }
  v31 = [(AVSecondScreenViewController *)self debugLabel];
  objc_msgSend(v31, "setFrame:", 20.0, v25, v18, v15);

  v32 = [(AVSecondScreenViewController *)self debugLabel];

  if (v32)
  {
    id v34 = [(AVSecondScreenViewController *)self view];
    v33 = [(AVSecondScreenViewController *)self debugLabel];
    [v34 bringSubviewToFront:v33];
  }
}

- (void)_updateContentViewIfNeeded
{
  if ([(AVSecondScreenViewController *)self isPlayingOnSecondScreen])
  {
    [(AVSecondScreenViewController *)self loadViewIfNeeded];
    v3 = [(AVSecondScreenViewController *)self sourcePlayerLayer];

    if (!v3)
    {
      v4 = [(AVSecondScreenViewController *)self playerLayerView];
      [v4 stopShowingContentFromActiveSourcePlayerLayer];
    }
    uint64_t v5 = [(AVSecondScreenViewController *)self contentView];
    if (v5
      && (v6 = (void *)v5,
          [(AVSecondScreenViewController *)self sourcePlayerLayer],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      double v21 = [(AVSecondScreenViewController *)self playerLayerView];
      v22 = [(AVSecondScreenViewController *)self view];
      int v23 = [v21 isDescendantOfView:v22];

      if (v23)
      {
        double v24 = [(AVSecondScreenViewController *)self playerLayerView];
        [v24 removeFromSuperview];
      }
      v11 = [(AVSecondScreenViewController *)self contentView];
      v12 = [(AVSecondScreenViewController *)self view];
      if (![v11 isDescendantOfView:v12])
      {
        double v25 = [(AVSecondScreenViewController *)self view];
        v26 = [v25 window];
        double v27 = [v26 windowScene];
        int v28 = objc_msgSend(v27, "avkit_isForeground");

        if (v28)
        {
          v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v29 removeObserver:self name:*MEMORY[0x1E4FB2E80] object:0];

          [MEMORY[0x1E4F39CF8] begin];
          [MEMORY[0x1E4F39CF8] setDisableActions:1];
          double v30 = [(AVSecondScreenViewController *)self view];
          v31 = [(AVSecondScreenViewController *)self contentView];
          [v30 insertSubview:v31 atIndex:0];

          v32 = [(AVSecondScreenViewController *)self contentView];
          v33 = [(AVSecondScreenViewController *)self view];
          [v33 bounds];
          objc_msgSend(v32, "setFrame:");

          id v34 = [(AVSecondScreenViewController *)self contentView];
          [v34 setNeedsLayout];

          v35 = [(AVSecondScreenViewController *)self contentView];
          [v35 layoutIfNeeded];

          [MEMORY[0x1E4F39CF8] commit];
        }
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v8 = [(AVSecondScreenViewController *)self sourcePlayerLayer];
      if (!v8
        || (v9 = (void *)v8,
            [(AVSecondScreenViewController *)self contentView],
            double v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            v10))
      {
LABEL_22:
        [(AVSecondScreenViewController *)self _updateLayout];
        return;
      }
      [(AVSecondScreenViewController *)self loadPlayerLayerViewIfNeeded];
      v11 = [(AVSecondScreenViewController *)self playerLayerView];
      v12 = [(AVSecondScreenViewController *)self sourcePlayerLayer];
      [v11 startShowingContentFromSourcePlayerLayer:v12];
    }

    goto LABEL_22;
  }
  v13 = [(AVSecondScreenViewController *)self contentView];
  double v14 = [(AVSecondScreenViewController *)self viewIfLoaded];
  int v15 = [v13 isDescendantOfView:v14];

  if (v15)
  {
    id v36 = [(AVSecondScreenViewController *)self contentView];
    [v36 removeFromSuperview];
  }
  else
  {
    uint64_t v16 = [(AVSecondScreenViewController *)self sourcePlayerLayer];
    if (!v16) {
      return;
    }
    double v17 = (void *)v16;
    double v18 = [(AVSecondScreenViewController *)self playerLayerView];
    v19 = [(AVSecondScreenViewController *)self viewIfLoaded];
    int v20 = [v18 isDescendantOfView:v19];

    if (!v20) {
      return;
    }
    id v36 = [(AVSecondScreenViewController *)self playerLayerView];
    [v36 stopShowingContentFromActiveSourcePlayerLayer];
  }
}

- (void)setDebugText:(id)a3
{
  id v7 = a3;
  v4 = [(AVSecondScreenViewController *)self debugText];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    v6 = [(AVSecondScreenViewController *)self debugLabel];
    [v6 setText:v7];

    [(AVSecondScreenViewController *)self _updateLayout];
  }
}

- (id)debugText
{
  [(AVSecondScreenViewController *)self loadViewIfNeeded];
  v3 = [(AVSecondScreenViewController *)self debugLabel];
  v4 = [v3 text];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVSecondScreenViewController;
  [(AVSecondScreenViewController *)&v10 viewDidAppear:a3];
  [(AVSecondScreenViewController *)self _updateContentViewIfNeeded];
  [(AVSecondScreenViewController *)self _updateLayout];
  uint64_t v4 = [(AVSecondScreenViewController *)self contentView];
  if (v4)
  {
    char v5 = (void *)v4;
    v6 = [(AVSecondScreenViewController *)self contentView];
    id v7 = [(AVSecondScreenViewController *)self view];
    char v8 = [v6 isDescendantOfView:v7];

    if ((v8 & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__updateContentViewIfNeeded name:*MEMORY[0x1E4FB2E80] object:0];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenViewController;
  [(AVSecondScreenViewController *)&v3 viewDidLayoutSubviews];
  [(AVSecondScreenViewController *)self _updateLayout];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)AVSecondScreenViewController;
  [(AVSecondScreenViewController *)&v13 viewDidLoad];
  [(AVSecondScreenViewController *)self _updateContentViewIfNeeded];
  if (AVSecondScreenDebugHUDEnabled_onceToken != -1) {
    dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_131);
  }
  if (AVSecondScreenDebugHUDEnabled__Enabled)
  {
    objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    debugLabel = self->_debugLabel;
    self->_debugLabel = v3;

    [(UILabel *)self->_debugLabel setTextAlignment:2];
    [(UILabel *)self->_debugLabel setNumberOfLines:0];
    char v5 = self->_debugLabel;
    v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(UILabel *)v5 setTextColor:v6];

    id v7 = self->_debugLabel;
    char v8 = (void *)MEMORY[0x1E4FB08E0];
    v9 = [(AVSecondScreenViewController *)self view];
    [v9 frame];
    v11 = [v8 monospacedDigitSystemFontOfSize:v10 * 0.025 weight:*MEMORY[0x1E4FB09C0]];
    [(UILabel *)v7 setFont:v11];

    v12 = [(AVSecondScreenViewController *)self view];
    [v12 addSubview:self->_debugLabel];
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(AVSecondScreenViewController *)self initialScreenBoundsHint];
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:");
  [(AVSecondScreenViewController *)self setView:v4];

  id v5 = [(AVSecondScreenViewController *)self view];
  [v5 setAutoresizingMask:18];
}

- (void)setInitialScreenBoundsHint:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_initialScreenBoundsHint = &self->_initialScreenBoundsHint;
  if (CGRectIsInfinite(a3)
    || (v9.origin.CGFloat x = x, v9.origin.y = y, v9.size.width = width, v9.size.height = height, CGRectIsNull(v9)))
  {
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    p_initialScreenBoundsHint->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    p_initialScreenBoundsHint->size = v8;
  }
  else
  {
    p_initialScreenBoundsHint->origin.CGFloat x = x;
    p_initialScreenBoundsHint->origin.CGFloat y = y;
    p_initialScreenBoundsHint->size.CGFloat width = width;
    p_initialScreenBoundsHint->size.CGFloat height = height;
  }
}

- (CGSize)videoDisplaySize
{
  v2 = [(AVSecondScreenViewController *)self playerLayerView];
  id v3 = [v2 layer];
  [v3 videoRect];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setSourcePlayerLayer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourcePlayerLayer);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_sourcePlayerLayer, obj);
    [(AVSecondScreenViewController *)self _updateContentViewIfNeeded];
    double v5 = obj;
  }
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playingOnSecondScreen != a3)
  {
    BOOL v3 = a3;
    self->_playingOnSecondScreen = a3;
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "NO";
      int v7 = 136315650;
      double v8 = "-[AVSecondScreenViewController setPlayingOnSecondScreen:]";
      double v10 = "playingOnSecondScreen";
      __int16 v9 = 2080;
      if (v3) {
        double v6 = "YES";
      }
      __int16 v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    [(AVSecondScreenViewController *)self _updateContentViewIfNeeded];
  }
}

- (void)setContentView:(id)a3
{
  id v10 = a3;
  id v5 = [(AVSecondScreenViewController *)self contentView];

  if (v5 != v10)
  {
    double v6 = [(AVSecondScreenViewController *)self contentView];
    int v7 = [(AVSecondScreenViewController *)self viewIfLoaded];
    int v8 = [v6 isDescendantOfView:v7];

    if (v8)
    {
      __int16 v9 = [(AVSecondScreenViewController *)self contentView];
      [v9 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(AVSecondScreenViewController *)self _updateContentViewIfNeeded];
  }
}

- (void)loadPlayerLayerViewIfNeeded
{
  if (!self->_playerLayerView)
  {
    BOOL v3 = [AVSecondScreenPlayerLayerView alloc];
    double v4 = [(AVSecondScreenViewController *)self view];
    [v4 bounds];
    id v5 = -[AVSecondScreenPlayerLayerView initWithFrame:](v3, "initWithFrame:");
    playerLayerView = self->_playerLayerView;
    self->_playerLayerView = v5;

    id v7 = [(AVSecondScreenViewController *)self view];
    [v7 insertSubview:self->_playerLayerView atIndex:0];
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(AVSecondScreenViewController *)self setPlayingOnSecondScreen:0];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v6 = "-[AVSecondScreenViewController dealloc]";
    __int16 v7 = 1024;
    int v8 = 50;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenViewController;
  [(AVSecondScreenViewController *)&v4 dealloc];
}

@end