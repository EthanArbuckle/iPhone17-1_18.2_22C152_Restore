@interface MRUActivityTrailingAccessoryView
- (BOOL)showHaptic;
- (BOOL)showWaveform;
- (MRUActivityTrailingAccessoryView)initWithSize:(CGSize)a3;
- (MRUHapticView)hapticView;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUWaveformView)waveformView;
- (UIImage)routeImage;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setHapticView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setRouteImage:(id)a3;
- (void)setShowHaptic:(BOOL)a3;
- (void)setShowWaveform:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setWaveformView:(id)a3;
- (void)updateVisibilty;
- (void)updateVisualStyling;
@end

@implementation MRUActivityTrailingAccessoryView

- (MRUActivityTrailingAccessoryView)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v6 setContentMode:1];
  v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:16.0];
  [v6 setSymbolConfiguration:v7];

  v8 = -[MRUActivityAccessoryView initWithContentView:size:](self, "initWithContentView:size:", v6, width, height);
  [(MRUActivityTrailingAccessoryView *)v8 setImageView:v6];

  return v8;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)MRUActivityTrailingAccessoryView;
  [(MRUActivityAccessoryView *)&v27 layoutSubviews];
  [(MRUActivityTrailingAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MRUActivityAccessoryView *)self contentInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  [(MRUActivityAccessoryView *)self contentOffset];
  CGFloat v20 = v19;
  [(MRUActivityAccessoryView *)self contentOffset];
  CGFloat v22 = v21;
  v28.origin.double x = v12;
  v28.origin.double y = v14;
  v28.size.double width = v16;
  v28.size.double height = v18;
  CGRect v29 = CGRectOffset(v28, v20, v22);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
  -[MRUHapticView setFrame:](self->_hapticView, "setFrame:", x, y, width, height);
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUActivityTrailingAccessoryView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setWaveformView:(id)a3
{
  double v4 = (MRUWaveformView *)a3;
  [(MRUWaveformView *)self->_waveformView removeFromSuperview];
  waveformView = self->_waveformView;
  self->_waveformView = v4;
  double v6 = v4;

  [(MRUActivityTrailingAccessoryView *)self addSubview:v6];
  [(MRUActivityTrailingAccessoryView *)self setNeedsLayout];

  [(MRUActivityTrailingAccessoryView *)self updateVisibilty];
}

- (void)setHapticView:(id)a3
{
  double v4 = (MRUHapticView *)a3;
  [(MRUHapticView *)self->_hapticView removeFromSuperview];
  hapticView = self->_hapticView;
  self->_hapticView = v4;
  double v6 = v4;

  [(MRUActivityTrailingAccessoryView *)self addSubview:v6];
  [(MRUActivityTrailingAccessoryView *)self setNeedsLayout];

  [(MRUActivityTrailingAccessoryView *)self updateVisibilty];
}

- (void)setShowWaveform:(BOOL)a3
{
  if (self->_showWaveform != a3)
  {
    self->_showWaveform = a3;
    [(MRUActivityTrailingAccessoryView *)self setNeedsLayout];
    [(MRUActivityTrailingAccessoryView *)self updateVisibilty];
  }
}

- (void)setShowHaptic:(BOOL)a3
{
  if (self->_showHaptic != a3)
  {
    self->_showHaptic = a3;
    [(MRUActivityTrailingAccessoryView *)self setNeedsLayout];
    [(MRUActivityTrailingAccessoryView *)self updateVisibilty];
  }
}

- (UIImage)routeImage
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setRouteImage:(id)a3
{
}

- (void)updateVisualStyling
{
}

- (void)updateVisibilty
{
  BOOL v3 = self->_showWaveform || self->_showHaptic;
  [(UIImageView *)self->_imageView setHidden:v3];
  double v4 = 0.0;
  if (self->_showWaveform && !self->_showHaptic) {
    double v4 = 1.0;
  }
  [(MRUWaveformView *)self->_waveformView setAlpha:v4];
  double v5 = 1.0;
  if (!self->_showHaptic) {
    double v5 = 0.0;
  }
  hapticView = self->_hapticView;

  [(MRUHapticView *)hapticView setAlpha:v5];
}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (MRUHapticView)hapticView
{
  return self->_hapticView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showWaveform
{
  return self->_showWaveform;
}

- (BOOL)showHaptic
{
  return self->_showHaptic;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_hapticView, 0);

  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end