@interface CPUIPlaybackProgressView
- (BOOL)highlighted;
- (BOOL)shouldResizeCurrentProgress;
- (CPUIPlaybackProgressView)init;
- (UIView)currentProgressView;
- (UIView)overallProgressView;
- (double)playbackProgress;
- (void)layoutSubviews;
- (void)setCurrentProgressView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverallProgressView:(id)a3;
- (void)setPlaybackProgress:(double)a3;
- (void)setProgressViewHighlighted:(BOOL)a3;
- (void)setShouldResizeCurrentProgress:(BOOL)a3;
@end

@implementation CPUIPlaybackProgressView

- (CPUIPlaybackProgressView)init
{
  v10.receiver = self;
  v10.super_class = (Class)CPUIPlaybackProgressView;
  v2 = -[CPUIPlaybackProgressView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 145.0, 2.5);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    currentProgressView = v2->_currentProgressView;
    v2->_currentProgressView = (UIView *)v4;

    [(CPUIPlaybackProgressView *)v2 addSubview:v2->_currentProgressView];
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 145.0, 2.5);
    overallProgressView = v2->_overallProgressView;
    v2->_overallProgressView = (UIView *)v6;

    [(UIView *)v2->_overallProgressView setAlpha:0.200000003];
    v8 = [(UIView *)v2->_overallProgressView layer];
    [v8 setCornerRadius:1.25];

    [(CPUIPlaybackProgressView *)v2 addSubview:v2->_overallProgressView];
    [(CPUIPlaybackProgressView *)v2 setProgressViewHighlighted:0];
  }
  return v2;
}

- (void)setPlaybackProgress:(double)a3
{
  if (vabdd_f64(self->_playbackProgress, a3) > 0.00000011920929)
  {
    self->_playbackProgress = a3;
    [(CPUIPlaybackProgressView *)self setShouldResizeCurrentProgress:1];
    [(CPUIPlaybackProgressView *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CPUIPlaybackProgressView setProgressViewHighlighted:](self, "setProgressViewHighlighted:");
  }
}

- (void)setProgressViewHighlighted:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F825C8] _carSystemFocusPrimaryColor];
  }
  else {
  v5 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
  }
  uint64_t v6 = [(CPUIPlaybackProgressView *)self currentProgressView];
  [v6 setBackgroundColor:v5];

  if (a3) {
    [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  }
  else {
  id v8 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  }
  v7 = [(CPUIPlaybackProgressView *)self overallProgressView];
  [v7 setBackgroundColor:v8];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CPUIPlaybackProgressView;
  [(CPUIPlaybackProgressView *)&v26 layoutSubviews];
  if ([(CPUIPlaybackProgressView *)self shouldResizeCurrentProgress])
  {
    [(CPUIPlaybackProgressView *)self frame];
    double Width = CGRectGetWidth(v27);
    [(CPUIPlaybackProgressView *)self playbackProgress];
    double v5 = Width * v4;
    uint64_t v6 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v7 = [v6 userInterfaceLayoutDirection];

    double v8 = *(double *)(MEMORY[0x263F00148] + 8);
    if (v7 == 1)
    {
      [(CPUIPlaybackProgressView *)self frame];
      double v10 = v9 - v5;
    }
    else
    {
      double v10 = *MEMORY[0x263F00148];
    }
    [(CPUIPlaybackProgressView *)self frame];
    double v12 = v11;
    v13 = [(CPUIPlaybackProgressView *)self currentProgressView];
    objc_msgSend(v13, "setFrame:", v10, v8, v5, v12);

    v14 = (void *)MEMORY[0x263F824C0];
    v15 = [(CPUIPlaybackProgressView *)self currentProgressView];
    [v15 bounds];
    v16 = objc_msgSend(v14, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);

    v17 = [MEMORY[0x263F15880] layer];
    [(CPUIPlaybackProgressView *)self bounds];
    objc_msgSend(v17, "setFrame:");
    id v18 = v16;
    objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));
    v19 = [(CPUIPlaybackProgressView *)self currentProgressView];
    v20 = [v19 layer];
    [v20 setMask:v17];

    [(CPUIPlaybackProgressView *)self frame];
    double v22 = v21;
    [(CPUIPlaybackProgressView *)self frame];
    double v24 = v23;
    v25 = [(CPUIPlaybackProgressView *)self overallProgressView];
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, v22, v24);

    [(CPUIPlaybackProgressView *)self setShouldResizeCurrentProgress:0];
  }
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIView)overallProgressView
{
  return self->_overallProgressView;
}

- (void)setOverallProgressView:(id)a3
{
}

- (UIView)currentProgressView
{
  return self->_currentProgressView;
}

- (void)setCurrentProgressView:(id)a3
{
}

- (BOOL)shouldResizeCurrentProgress
{
  return self->_shouldResizeCurrentProgress;
}

- (void)setShouldResizeCurrentProgress:(BOOL)a3
{
  self->_shouldResizeCurrentProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProgressView, 0);
  objc_storeStrong((id *)&self->_overallProgressView, 0);
}

@end