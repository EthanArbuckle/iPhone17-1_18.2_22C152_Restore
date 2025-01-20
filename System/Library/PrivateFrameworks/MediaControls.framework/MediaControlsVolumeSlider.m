@interface MediaControlsVolumeSlider
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)maximumValueImageRectForBounds:(CGRect)a3;
- (CGRect)minimumValueImageRectForBounds:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)_thumbImageForStyle:(int64_t)a3;
- (id)createThumbView;
- (void)providedStylesDidChangeForProvider:(id)a3;
- (void)setMaximumTrackVisualProvider:(id)a3;
- (void)setMinimumTrackVisualProvider:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)tintColorDidChange;
@end

@implementation MediaControlsVolumeSlider

- (MediaControlsVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsVolumeSlider;
  v4 = -[MPVolumeSlider initWithFrame:style:](&v6, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIEdgeInsetsMakeWithEdges();
  -[MPVolumeSlider setHitRectInsets:](v4, "setHitRectInsets:");

  return v4;
}

- (id)createThumbView
{
  v20.receiver = self;
  v20.super_class = (Class)MediaControlsVolumeSlider;
  id v3 = [(MPVolumeSlider *)&v20 createThumbView];
  v4 = [(MediaControlsVolumeSlider *)self traitCollection];
  [v4 displayScale];
  double v6 = v5;

  if (v6 <= 0.00000011920929)
  {
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
  }
  [v3 setClipsToBounds:0];
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v9 = [v8 CGColor];
  v10 = [v3 layer];
  [v10 setShadowColor:v9];

  UIRoundToScale();
  double v12 = v11;
  v13 = [v3 layer];
  objc_msgSend(v13, "setShadowOffset:", 0.0, v12);

  UIRoundToScale();
  double v15 = v14;
  v16 = [v3 layer];
  [v16 setShadowRadius:v15];

  v17 = [v3 layer];
  LODWORD(v18) = 1045220557;
  [v17 setShadowOpacity:v18];

  return v3;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v26.receiver = self;
  v26.super_class = (Class)MediaControlsVolumeSlider;
  -[MediaControlsVolumeSlider thumbRectForBounds:trackRect:value:](&v26, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(MediaControlsVolumeSlider *)self traitCollection];
  [v14 displayScale];
  UIRoundToScale();
  double v16 = v9 - v15;

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, v11, v13);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 CGPath];
  v19 = [(MPVolumeSlider *)self thumbView];
  objc_super v20 = [v19 layer];
  [v20 setShadowPath:v18];

  double v21 = v7;
  double v22 = v16;
  double v23 = v11;
  double v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsVolumeSlider;
  -[MediaControlsVolumeSlider trackRectForBounds:](&v12, sel_trackRectForBounds_);
  v4 = [(MediaControlsVolumeSlider *)self traitCollection];
  [v4 displayScale];

  uint64_t v5 = [(MediaControlsVolumeSlider *)self minimumValueImage];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(MediaControlsVolumeSlider *)self maximumValueImage];

    if (v7) {
      UIRoundToScale();
    }
  }
  UIRoundToScale();
  UIRectCenteredYInRect();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  UIRectCenteredYInRect();

  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  UIRectCenteredYInRect();

  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  [(MediaControlsVolumeSlider *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MediaControlsVolumeSlider *)self bounds];
  -[MediaControlsVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(MediaControlsVolumeSlider *)self value];
  LODWORD(v43) = v21;
  -[MediaControlsVolumeSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v6, v8, v10, v12, v14, v16, v18, v20, v43);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(MPVolumeSlider *)self hitRectInsets];
  double v31 = v25 + v30;
  double v34 = v27 - (v32 + v33);
  double v36 = v29 - (v30 + v35);
  double v37 = v23 + v32;
  double v38 = v31;
  double v39 = v34;
  CGFloat y = a3.y;
  CGFloat x = a3.x;

  return CGRectContainsPoint(*(CGRect *)&v37, *(CGPoint *)&x);
}

- (id)_thumbImageForStyle:(int64_t)a3
{
  double v3 = (void *)MEMORY[0x1E4FB1818];
  double v4 = objc_msgSend(MEMORY[0x1E4F28B50], "mediaControlsBundle", a3);
  double v5 = [v3 imageNamed:@"CC-Volume-Knob" inBundle:v4];

  return v5;
}

- (void)tintColorDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsVolumeSlider;
  [(MediaControlsVolumeSlider *)&v12 tintColorDidChange];
  if (self->_visualStylingProvider)
  {
    -[MediaControlsVolumeSlider providedStylesDidChangeForProvider:](self, "providedStylesDidChangeForProvider:");
  }
  else
  {
    double v3 = [(MediaControlsVolumeSlider *)self tintColor];
    [(MediaControlsVolumeSlider *)self setMinimumTrackTintColor:v3];

    double v4 = [(MediaControlsVolumeSlider *)self tintColor];
    double v5 = [(MediaControlsVolumeSlider *)self traitCollection];
    double v6 = objc_msgSend(v4, "secondaryColorForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

    double v7 = [(MediaControlsVolumeSlider *)self _minValueView];
    [v7 setTintColor:v6];

    double v8 = [(MediaControlsVolumeSlider *)self _maxValueView];
    [v8 setTintColor:v6];

    double v9 = [(MediaControlsVolumeSlider *)self tintColor];
    double v10 = [(MediaControlsVolumeSlider *)self traitCollection];
    double v11 = objc_msgSend(v9, "tertiaryColorForInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));

    [(MediaControlsVolumeSlider *)self setMaximumTrackTintColor:v11];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  double v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = (id *)&self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    double v16 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider _removeObserver:self];
    id v8 = *p_visualStylingProvider;
    double v9 = [(MediaControlsVolumeSlider *)self _minValueView];
    [v8 stopAutomaticallyUpdatingView:v9];

    id v10 = *p_visualStylingProvider;
    double v11 = [(MediaControlsVolumeSlider *)self _maxValueView];
    [v10 stopAutomaticallyUpdatingView:v11];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [*p_visualStylingProvider _addObserver:self];
    id v12 = *p_visualStylingProvider;
    double v13 = [(MediaControlsVolumeSlider *)self _minValueView];
    [v12 automaticallyUpdateView:v13 withStyle:1];

    id v14 = *p_visualStylingProvider;
    double v15 = [(MediaControlsVolumeSlider *)self _maxValueView];
    [v14 automaticallyUpdateView:v15 withStyle:1];

    [(MediaControlsVolumeSlider *)self providedStylesDidChangeForProvider:*p_visualStylingProvider];
    double v5 = v16;
  }
}

- (void)setMinimumTrackVisualProvider:(id)a3
{
  id v6 = [a3 _visualStylingForStyle:0];
  double v4 = [v6 color];
  [(MediaControlsVolumeSlider *)self setMinimumTrackTintColor:v4];

  double v5 = [(MediaControlsVolumeSlider *)self _minTrackView];
  objc_msgSend(v5, "mt_replaceVisualStyling:", v6);
}

- (void)setMaximumTrackVisualProvider:(id)a3
{
  id v6 = [a3 _visualStylingForStyle:1];
  double v4 = [v6 color];
  [(MediaControlsVolumeSlider *)self setMaximumTrackTintColor:v4];

  double v5 = [(MediaControlsVolumeSlider *)self _maxTrackView];
  objc_msgSend(v5, "mt_replaceVisualStyling:", v6);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsVolumeSlider;
  BOOL v4 = [(MediaControlsVolumeSlider *)&v6 gestureRecognizerShouldBegin:a3];
  if (v4) {
    LOBYTE(v4) = ![(MPVolumeSlider *)self isTracking];
  }
  return v4;
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  id v4 = a3;
  [(MediaControlsVolumeSlider *)self setMinimumTrackVisualProvider:v4];
  [(MediaControlsVolumeSlider *)self setMaximumTrackVisualProvider:v4];
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
}

@end