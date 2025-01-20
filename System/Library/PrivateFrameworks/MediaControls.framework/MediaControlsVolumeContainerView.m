@interface MediaControlsVolumeContainerView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isOnScreen;
- (BOOL)isTransitioning;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsRelativeVolumeStepper)volumeStepper;
- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3;
- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3 slider:(id)a4;
- (MediaControlsVolumeSlider)volumeSlider;
- (int64_t)style;
- (unsigned)volumeCapabilities;
- (void)_updateVolumeCapabilities;
- (void)_updateVolumeStyle;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setOnScreen:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)setVolumeCapabilities:(unsigned int)a3;
- (void)setVolumeSlider:(id)a3;
- (void)setVolumeStepper:(id)a3;
@end

@implementation MediaControlsVolumeContainerView

- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = -[MPVolumeSlider initWithFrame:]([MediaControlsVolumeSlider alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = -[MediaControlsVolumeContainerView initWithFrame:slider:](self, "initWithFrame:slider:", v8, x, y, width, height);

  return v9;
}

- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3 slider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MediaControlsVolumeContainerView;
  v10 = -[MediaControlsVolumeContainerView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(MediaControlsVolumeContainerView *)v10 setVolumeSlider:v9];
    [(MediaControlsVolumeContainerView *)v11 addSubview:v11->_volumeSlider];
    v12 = -[MediaControlsRelativeVolumeStepper initWithFrame:]([MediaControlsRelativeVolumeStepper alloc], "initWithFrame:", x, y, width, height);
    volumeStepper = v11->_volumeStepper;
    v11->_volumeStepper = v12;

    v14 = [v9 volumeController];
    [(MediaControlsRelativeVolumeStepper *)v11->_volumeStepper setVolumeController:v14];

    [(MediaControlsRelativeVolumeStepper *)v11->_volumeStepper setHidden:1];
    [(MediaControlsVolumeContainerView *)v11 addSubview:v11->_volumeStepper];
    [(MediaControlsVolumeSlider *)v11->_volumeSlider layoutIfNeeded];
    [(MediaControlsVolumeContainerView *)v11 _updateVolumeStyle];
    [(MediaControlsVolumeContainerView *)v11 _updateVolumeCapabilities];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F31808] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsVolumeContainerView;
  [(MediaControlsVolumeContainerView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)MediaControlsVolumeContainerView;
  [(MediaControlsVolumeContainerView *)&v15 layoutSubviews];
  [(MediaControlsVolumeContainerView *)self bounds];
  -[MediaControlsRelativeVolumeStepper setFrame:](self->_volumeStepper, "setFrame:");
  v3 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  [(MediaControlsVolumeContainerView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);

  [(MediaControlsVolumeContainerView *)self bounds];
  UIRectCenteredIntegralRect();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (void)setVolumeSlider:(id)a3
{
  double v4 = (MediaControlsVolumeSlider *)a3;
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F31808];
  [v5 removeObserver:self name:*MEMORY[0x1E4F31808] object:0];

  volumeSlider = self->_volumeSlider;
  self->_volumeSlider = v4;
  double v8 = v4;

  double v9 = [(MPVolumeSlider *)v8 volumeController];
  [(MediaControlsRelativeVolumeStepper *)self->_volumeStepper setVolumeController:v9];

  [(MediaControlsVolumeSlider *)self->_volumeSlider setVisualStylingProvider:self->_visualStylingProvider];
  double v10 = +[MediaControlsTheme volumeMinImage];
  [(MediaControlsVolumeSlider *)self->_volumeSlider setMinimumValueImage:v10];

  double v11 = +[MediaControlsTheme volumeMaxImage];
  [(MediaControlsVolumeSlider *)self->_volumeSlider setMaximumValueImage:v11];

  double v12 = [(MediaControlsVolumeSlider *)self->_volumeSlider _minValueView];
  [v12 setContentMode:4];

  double v13 = [(MediaControlsVolumeSlider *)self->_volumeSlider _maxValueView];
  [v13 setContentMode:4];

  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__updateVolumeCapabilities name:v6 object:v8];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MediaControlsVolumeContainerView *)self _updateVolumeStyle];
    [(MediaControlsVolumeContainerView *)self setNeedsLayout];
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsVolumeContainerView;
  [(MediaControlsVolumeContainerView *)&v3 didMoveToSuperview];
  [(MediaControlsVolumeContainerView *)self _updateVolumeStyle];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsVolumeContainerView;
  [(MediaControlsVolumeContainerView *)&v3 didMoveToWindow];
  [(MediaControlsVolumeContainerView *)self _updateVolumeStyle];
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (a3)
    {
      objc_super v3 = [(MediaControlsVolumeContainerView *)self volumeSlider];
      id v5 = v3;
      uint64_t v4 = 0;
    }
    else
    {
      if (self->_style != 1) {
        return;
      }
      objc_super v3 = [(MediaControlsVolumeContainerView *)self volumeSlider];
      id v5 = v3;
      uint64_t v4 = 1;
    }
    [v3 setHidden:v4];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    BOOL v3 = !a3;
    id v4 = [(MediaControlsVolumeContainerView *)self volumeSlider];
    [v4 _setIsOffScreen:v3];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;

  double v9 = [(MediaControlsVolumeContainerView *)self traitCollection];
  [v9 displayScale];
  UIRoundToScale();
  double v11 = v10;

  double v12 = v8;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  id v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  if (self->_visualStylingProvider != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    double v7 = *p_visualStylingProvider;
    double v8 = [(MediaControlsVolumeContainerView *)self volumeStepper];
    [v8 setVisualStylingProvider:v7];

    double v9 = *p_visualStylingProvider;
    double v10 = [(MediaControlsVolumeContainerView *)self volumeSlider];
    [v10 setVisualStylingProvider:v9];

    id v5 = v11;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  [v6 hitRectInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_super v15 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  objc_super v16 = [v15 thumbView];
  [v16 frame];
  double v18 = v10 + v17;
  double v20 = v8 + v19;
  double v22 = v21 - (v10 + v14);
  double v24 = v23 - (v8 + v12);

  [v5 locationInView:self];
  uint64_t v26 = v25;
  uint64_t v28 = v27;

  double v29 = v18;
  double v30 = v20;
  double v31 = v22;
  double v32 = v24;
  uint64_t v33 = v26;
  uint64_t v34 = v28;

  return CGRectContainsPoint(*(CGRect *)&v29, *(CGPoint *)&v33);
}

- (void)_updateVolumeStyle
{
  int64_t style = self->_style;
  id v4 = [(MediaControlsVolumeContainerView *)self volumeSlider];
  id v5 = v4;
  if (style == 1)
  {
    [v4 setAlpha:0.0];

    uint64_t v6 = [(MediaControlsVolumeContainerView *)self volumeStepper];
    double v7 = v6;
    double v8 = 0.0;
  }
  else
  {
    [v4 setAlpha:1.0];

    uint64_t v6 = [(MediaControlsVolumeContainerView *)self volumeStepper];
    double v7 = v6;
    double v8 = 1.0;
  }
  [v6 setAlpha:v8];

  [(MediaControlsVolumeContainerView *)self _updateVolumeCapabilities];
}

- (void)_updateVolumeCapabilities
{
  BOOL v3 = [(MPVolumeSlider *)self->_volumeSlider volumeController];
  unsigned int v4 = [v3 volumeCapabilities];

  if (self->_volumeCapabilities == v4) {
    return;
  }
  self->_volumeCapabilities = v4;
  if ((v4 & 2) != 0)
  {
    volumeSlider = self->_volumeSlider;
    goto LABEL_6;
  }
  volumeSlider = self->_volumeSlider;
  if ((v4 & 1) == 0)
  {
LABEL_6:
    [(MPVolumeSlider *)volumeSlider setHidden:0];
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  [(MPVolumeSlider *)volumeSlider setHidden:1];
  uint64_t v6 = 0;
LABEL_7:
  [(MediaControlsRelativeVolumeStepper *)self->_volumeStepper setHidden:v6];

  [(MediaControlsVolumeContainerView *)self setNeedsLayout];
}

- (MediaControlsVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (int64_t)style
{
  return self->_style;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MediaControlsRelativeVolumeStepper)volumeStepper
{
  return self->_volumeStepper;
}

- (void)setVolumeStepper:(id)a3
{
}

- (unsigned)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (void)setVolumeCapabilities:(unsigned int)a3
{
  self->_volumeCapabilities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeStepper, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);

  objc_storeStrong((id *)&self->_volumeSlider, 0);
}

@end