@interface PHActionSlider
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimating;
- (BOOL)isButtonLayoutEnabled;
- (BOOL)isLarge;
- (BOOL)isShowingTrackLabel;
- (BOOL)shouldHideTrackLabelForXPoint:(double)a3;
- (BOOL)shouldReverseLayoutDirection;
- (BOOL)xPointIsWithinTrack:(double)a3;
- (CGPoint)panGestureFirstTouchLocationInView;
- (CGRect)_trackFrame;
- (CGRect)knobRect;
- (CGRect)trackTextRect;
- (CGSize)_defaultTrackSize;
- (CGSize)knobImageOffset;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)trackSize;
- (NSString)knobText;
- (NSString)trackText;
- (PHActionSlider)initWithCoder:(id)a3;
- (PHActionSlider)initWithFrame:(CGRect)a3;
- (PHActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4 large:(BOOL)a5;
- (PHActionSliderDelegate)delegate;
- (UIBezierPath)knobMaskPath;
- (UIColor)knobColor;
- (UIEdgeInsets)knobInsets;
- (UIFont)trackFont;
- (UIImage)knobImage;
- (UILabel)knobLabel;
- (UILabel)trackLabel;
- (UIPanGestureRecognizer)slideGestureRecognizer;
- (UIView)_knobView;
- (UIVisualEffectView)trackSolidViewBackDropVisualEffectView;
- (_UIVibrantSettings)vibrantSettings;
- (double)_currentScreenScale;
- (double)_knobAvailableX;
- (double)_knobHorizontalPosition;
- (double)_knobLeftMostX;
- (double)_knobMaxX;
- (double)_knobMaxXInset;
- (double)_knobMinX;
- (double)_knobMinXInset;
- (double)_knobRightMostX;
- (double)_knobVerticalInset;
- (double)_stretchKnobWidth;
- (double)_stretchKnobX;
- (double)cachedTrackMaskWidth;
- (double)knobPosition;
- (double)knobWidth;
- (double)minFastSlideCompletionPercentage;
- (double)minSlideCompletionPercentage;
- (double)trackAlpha;
- (double)trackTextBaselineFromBottom;
- (double)trackTextYOffset;
- (double)trackWidthProportion;
- (id)backgroundColor;
- (id)trackMaskImage;
- (id)trackMaskPath;
- (int64_t)style;
- (int64_t)textStyle;
- (unint64_t)dragStyle;
- (void)_knobPanGesture:(id)a3;
- (void)_makeTrackLabel;
- (void)_slideCompleted:(BOOL)a3;
- (void)closeTrackAnimated:(BOOL)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)hideTrackLabel:(BOOL)a3;
- (void)hideTrackLabelIfNecessary:(BOOL)a3;
- (void)layoutSubviews;
- (void)openTrackAnimated:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCachedTrackMaskWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDragStyle:(unint64_t)a3;
- (void)setIsLarge:(BOOL)a3;
- (void)setKnobColor:(id)a3;
- (void)setKnobImage:(id)a3;
- (void)setKnobImageOffset:(CGSize)a3;
- (void)setKnobInsets:(UIEdgeInsets)a3;
- (void)setKnobPosition:(double)a3;
- (void)setKnobText:(id)a3;
- (void)setKnobWidth:(double)a3;
- (void)setMaskFromImage:(id)a3 onView:(id)a4;
- (void)setMaskPath:(CGPath *)a3 onView:(id)a4;
- (void)setMinFastSlideCompletionPercentage:(double)a3;
- (void)setMinSlideCompletionPercentage:(double)a3;
- (void)setPanGestureFirstTouchLocationInView:(CGPoint)a3;
- (void)setShowingTrackLabel:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTextStyle:(int64_t)a3;
- (void)setTrackAlpha:(double)a3;
- (void)setTrackFont:(id)a3;
- (void)setTrackLabelHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setTrackSize:(CGSize)a3;
- (void)setTrackSolidViewBackDropVisualEffectView:(id)a3;
- (void)setTrackText:(id)a3;
- (void)setTrackTextBaselineFromBottom:(double)a3;
- (void)setTrackWidthProportion:(double)a3;
- (void)setVibrantSettings:(id)a3;
- (void)showTrackLabel;
- (void)updateAllTrackMasks;
@end

@implementation PHActionSlider

- (PHActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4 large:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v78.receiver = self;
  v78.super_class = (Class)PHActionSlider;
  v13 = -[PHActionSlider initWithFrame:](&v78, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(PHActionSlider *)v13 setOpaque:0];
    v15 = +[UIColor clearColor];
    [(PHActionSlider *)v14 setBackgroundColor:v15];

    v14->_trackWidthProportion = 1.0;
    unsigned int v16 = [(PHActionSlider *)v14 isButtonLayoutEnabled];
    p_knobInsets = &v14->_knobInsets;
    double v18 = 3.5;
    if ((v16 & v5) != 0) {
      double v18 = 6.0;
    }
    v14->_knobInsets.left = v18;
    v14->_knobInsets.right = v18;
    v14->_isLarge = v5;
    v19 = +[UIDevice currentDevice];
    id v20 = [v19 userInterfaceIdiom];

    if (v20
      || (+[UIScreen mainScreen],
          v21 = objc_claimAutoreleasedReturnValue(),
          [v21 _referenceBounds],
          double v22 = CGRectGetHeight(v79),
          v21,
          v22 > 480.0))
    {
      double v23 = 65.0;
      if (v5) {
        double v23 = 82.0;
      }
      v14->_knobWidth = v23;
      if ([(PHActionSlider *)v14 isButtonLayoutEnabled] && v5)
      {
        p_knobInsets->top = 6.0;
        v14->_knobInsets.bottom = 6.0;
        v24 = +[UIScreen mainScreen];
        [v24 bounds];
        double v26 = v25;
        double v28 = v27;

        if (v26 >= v28) {
          double v29 = v28;
        }
        else {
          double v29 = v26;
        }
        float v30 = v29 * 0.1976;
        v14->_knobWidth = roundf(v30);
      }
      else
      {
        p_knobInsets->top = 5.0;
        v14->_knobInsets.bottom = 5.0;
      }
      uint64_t v31 = 0x403F800000000000;
    }
    else
    {
      v14->_knobWidth = 58.0;
      if ([(PHActionSlider *)v14 isButtonLayoutEnabled] && v5)
      {
        p_knobInsets->top = 6.0;
        v14->_knobInsets.bottom = 6.0;
        v71 = +[UIScreen mainScreen];
        [v71 bounds];
        double v73 = v72;
        double v75 = v74;

        if (v73 >= v75) {
          double v76 = v75;
        }
        else {
          double v76 = v73;
        }
        float v77 = v76 * 0.1976;
        v14->_knobWidth = roundf(v77);
      }
      else
      {
        p_knobInsets->top = 3.5;
        v14->_knobInsets.bottom = 3.5;
      }
      uint64_t v31 = 0x403A800000000000;
    }
    *(void *)&v14->_trackTextBaselineFromBottom = v31;
    [(PHActionSlider *)v14 _defaultTrackSize];
    v14->_trackSize.double width = v32;
    v14->_trackSize.double height = v33;
    v14->_minSlideCompletionPercentage = 0.6;
    v14->_minFastSlideCompletionPercentage = 0.4;
    objc_storeStrong((id *)&v14->_vibrantSettings, a4);
    [(PHActionSlider *)v14 bounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [objc_alloc((Class)UIView) initWithFrame:v34, v36, v38, v40];
    contentView = v14->_contentView;
    v14->_contentView = v42;

    [(PHActionSlider *)v14 addSubview:v14->_contentView];
    v44 = [objc_alloc((Class)UIView) initWithFrame:v35, v37, v39, v41];
    trackBackgroundView = v14->_trackBackgroundView;
    v14->_trackBackgroundView = v44;

    v46 = [(UIView *)v14->_trackBackgroundView layer];
    [v46 setAllowsGroupBlending:0];

    [(UIView *)v14->_contentView addSubview:v14->_trackBackgroundView];
    v47 = objc_alloc_init(PHActionSliderTrackComponentView);
    trackDodgeView = v14->_trackDodgeView;
    v14->_trackDodgeView = &v47->super;

    v49 = v14->_trackDodgeView;
    v50 = +[UIColor colorWithWhite:0.65 alpha:1.0];
    [(UIView *)v49 setBackgroundColor:v50];

    v51 = [(UIView *)v14->_trackDodgeView layer];
    [v51 setCompositingFilter:kCAFilterColorDodgeBlendMode];

    [(UIView *)v14->_trackBackgroundView addSubview:v14->_trackDodgeView];
    v52 = (NSString *)[&stru_1002D6110 copy];
    trackText = v14->_trackText;
    v14->_trackText = v52;

    uint64_t v54 = +[UIFont systemFontOfSize:20.0];
    trackFont = v14->_trackFont;
    v14->_trackFont = (UIFont *)v54;

    v14->_showingTrackLabel = 1;
    v56 = -[PHActionSliderKnob initWithFrame:]([PHActionSliderKnob alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    knobView = v14->_knobView;
    v14->_knobView = v56;

    v58 = [(PHActionSliderKnob *)v14->_knobView layer];
    [v58 setMasksToBounds:1];

    [(UIView *)v14->_contentView addSubview:v14->_knobView];
    v59 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    knobImageView = v14->_knobImageView;
    v14->_knobImageView = v59;

    [(PHActionSliderKnob *)v14->_knobView addSubview:v14->_knobImageView];
    v61 = (UILabel *)objc_alloc_init((Class)UILabel);
    knobLabel = v14->_knobLabel;
    v14->_knobLabel = v61;

    [(UILabel *)v14->_knobLabel setTextAlignment:1];
    v63 = v14->_knobLabel;
    v64 = +[UIFont systemFontOfSize:37.0 weight:UIFontWeightHeavy];
    [(UILabel *)v63 setFont:v64];

    v65 = v14->_knobLabel;
    v66 = +[UIColor whiteColor];
    [(UILabel *)v65 setTextColor:v66];

    [(UILabel *)v14->_knobLabel setAlpha:0.0];
    [(PHActionSliderKnob *)v14->_knobView addSubview:v14->_knobLabel];
    v67 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v14 action:"_knobPanGesture:"];
    slideGestureRecognizer = v14->_slideGestureRecognizer;
    v14->_slideGestureRecognizer = v67;

    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer _setCanPanHorizontally:1];
    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer _setCanPanVertically:0];
    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer _setHysteresis:2.0];
    [(UIPanGestureRecognizer *)v14->_slideGestureRecognizer setDelegate:v14];
    [(PHActionSlider *)v14 addGestureRecognizer:v14->_slideGestureRecognizer];
    v69 = [(PHActionSlider *)v14 layer];
    [v69 setHitTestsAsOpaque:1];
  }
  return v14;
}

- (PHActionSlider)initWithFrame:(CGRect)a3
{
  return -[PHActionSlider initWithFrame:vibrantSettings:large:](self, "initWithFrame:vibrantSettings:large:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PHActionSlider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHActionSlider;
  return [(PHActionSlider *)&v4 initWithCoder:a3];
}

- (BOOL)isButtonLayoutEnabled
{
  v2 = +[CNKFeatures sharedInstance];
  unsigned __int8 v3 = [v2 isButtonLayoutEnabled];

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(_UIBackdropView *)self->_trackBlurView removeFromSuperview];
    [(UIView *)self->_trackSolidView removeFromSuperview];
    [(UIView *)self->_trackDodgeView removeFromSuperview];
    switch(a3)
    {
      case 3:
        if (!self->_trackSolidView)
        {
          v7 = objc_alloc_init(PHActionSliderTrackComponentView);
          trackSolidView = self->_trackSolidView;
          self->_trackSolidView = &v7->super;

          [(PHActionSlider *)self setCachedTrackMaskWidth:0.0];
          v9 = +[CNKFeatures sharedInstance];
          unsigned int v10 = [v9 isButtonLayoutEnabled];

          if (v10)
          {
            v11 = +[UIColorEffect inCallControls];
            id v12 = +[UIBlurEffect effectWithBlurRadius:40.0];
            v13 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
            trackSolidViewBackDropVisualEffectView = self->_trackSolidViewBackDropVisualEffectView;
            self->_trackSolidViewBackDropVisualEffectView = v13;

            v18[0] = v11;
            v18[1] = v12;
            v15 = +[NSArray arrayWithObjects:v18 count:2];
            [(UIVisualEffectView *)self->_trackSolidViewBackDropVisualEffectView setBackgroundEffects:v15];

            [(UIView *)self->_trackBackgroundView addSubview:self->_trackSolidViewBackDropVisualEffectView];
          }
        }
        trackBackgroundView = self->_trackBackgroundView;
        trackBlurView = self->_trackSolidView;
        break;
      case 2:
        trackBlurView = self->_trackBlurView;
        if (!trackBlurView)
        {
          unsigned int v16 = (_UIBackdropView *)[objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2020];
          v17 = self->_trackBlurView;
          self->_trackBlurView = v16;

          [(PHActionSlider *)self setCachedTrackMaskWidth:0.0];
          trackBlurView = self->_trackBlurView;
        }
        trackBackgroundView = self->_trackBackgroundView;
        break;
      case 1:
        trackBackgroundView = self->_trackBackgroundView;
        trackBlurView = self->_trackDodgeView;
        break;
      default:
LABEL_14:
        [(PHActionSlider *)self setNeedsLayout];
        return;
    }
    [(UIView *)trackBackgroundView insertSubview:trackBlurView atIndex:0];
    goto LABEL_14;
  }
}

- (void)setDragStyle:(unint64_t)a3
{
  if (self->_dragStyle != a3)
  {
    self->_dragStyle = a3;
    [(PHActionSlider *)self _defaultTrackSize];
    if (a3 == 1 || a3 == 2)
    {
      -[PHActionSlider setTrackSize:](self, "setTrackSize:");
    }
  }
}

- (UIBezierPath)knobMaskPath
{
  [(PHActionSlider *)self knobRect];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  unint64_t dragStyle = self->_dragStyle;
  if (dragStyle == 2)
  {
    [(PHActionSlider *)self _knobWidth];
    id v12 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7, v8, v9, v10, v13 * 0.5);
  }
  else if (dragStyle == 1)
  {
    id v12 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v3, v4, v5, v6);
  }
  else
  {
    id v12 = 0;
  }

  return (UIBezierPath *)v12;
}

- (UIImage)knobImage
{
  return [(UIImageView *)self->_knobImageView image];
}

- (void)setKnobImage:(id)a3
{
  [(UIImageView *)self->_knobImageView setImage:a3];

  [(PHActionSlider *)self setNeedsLayout];
}

- (void)setKnobImageOffset:(CGSize)a3
{
  if (self->_knobImageOffset.width != a3.width || self->_knobImageOffset.height != a3.height)
  {
    self->_knobImageOffset = a3;
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (NSString)knobText
{
  return [(UILabel *)self->_knobLabel text];
}

- (void)setKnobText:(id)a3
{
  [(UILabel *)self->_knobLabel setText:a3];

  [(PHActionSlider *)self setNeedsLayout];
}

- (UILabel)knobLabel
{
  return self->_knobLabel;
}

- (UIVisualEffectView)trackSolidViewBackDropVisualEffectView
{
  return self->_trackSolidViewBackDropVisualEffectView;
}

- (UIColor)knobColor
{
  return [(PHActionSliderKnob *)self->_knobView knobColor];
}

- (void)setKnobColor:(id)a3
{
}

- (void)setTrackText:(id)a3
{
  if (self->_trackText != a3)
  {
    double v4 = (NSString *)[a3 copy];
    trackText = self->_trackText;
    self->_trackText = v4;

    [(PHActionSliderLabel *)self->_trackLabel setText:self->_trackText];
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (void)setTrackFont:(id)a3
{
  double v5 = (UIFont *)a3;
  if (self->_trackFont != v5)
  {
    objc_storeStrong((id *)&self->_trackFont, a3);
    [(PHActionSliderLabel *)self->_trackLabel setFont:v5];
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (void)setTrackSize:(CGSize)a3
{
  if (a3.width != self->_trackSize.width || a3.height != self->_trackSize.height)
  {
    self->_trackSize = a3;
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (double)trackAlpha
{
  [(UIView *)self->_trackBackgroundView alpha];
  return result;
}

- (void)setTrackAlpha:(double)a3
{
  [(UIView *)self->_trackBackgroundView alpha];
  if (v5 - a3 >= 0.00000011920929
    || ([(UIView *)self->_trackBackgroundView alpha], a3 - v6 >= 0.00000011920929))
  {
    [(UIView *)self->_trackBackgroundView setAlpha:a3];
    trackLabel = self->_trackLabel;
    [(PHActionSliderLabel *)trackLabel setAlpha:a3];
  }
}

- (UILabel)trackLabel
{
  if ((id)[(PHActionSlider *)self textStyle] != (id)2)
  {
    id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Can't call -trackLabel when -textStyle is not PHActionSliderTextStyleSolid" userInfo:0];
    objc_exception_throw(v5);
  }
  trackLabel = self->_trackLabel;
  if (!trackLabel)
  {
    [(PHActionSlider *)self _makeTrackLabel];
    trackLabel = self->_trackLabel;
  }

  return (UILabel *)trackLabel;
}

- (void)setKnobPosition:(double)a3
{
  if (self->_knobPosition != a3)
  {
    self->_knobPosition = a3;
    [(PHActionSlider *)self setNeedsLayout];
    [(PHActionSlider *)self layoutIfNeeded];
  }
}

- (void)setKnobWidth:(double)a3
{
  if (self->_knobWidth != a3)
  {
    self->_knobWidth = a3;
    id v5 = [(PHActionSliderKnob *)self->_knobView layer];
    [v5 setCornerRadius:a3 * 0.5];

    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (void)setKnobInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_knobInsets.left
    || a3.top != self->_knobInsets.top
    || a3.right != self->_knobInsets.right
    || a3.bottom != self->_knobInsets.bottom)
  {
    self->_knobInsets = a3;
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (CGRect)knobRect
{
  [(PHActionSlider *)self _knobWidth];
  CGFloat height = v3;
  unint64_t dragStyle = self->_dragStyle;
  if (dragStyle == 2)
  {
    [(PHActionSlider *)self _stretchKnobX];
    CGFloat x = v11;
    [(PHActionSlider *)self _knobVerticalInset];
    double y = v12 + -1.5;
    [(PHActionSlider *)self _stretchKnobWidth];
    double width = v13;
  }
  else if (dragStyle == 1)
  {
    [(PHActionSlider *)self _knobHorizontalPosition];
    CGFloat x = v6;
    [(PHActionSlider *)self _knobVerticalInset];
    double y = v8;
    double width = height;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.double width = width;
  result.origin.double y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)trackTextRect
{
  unsigned int v3 = [(PHActionSlider *)self shouldReverseLayoutDirection];
  [(PHActionSlider *)self _trackFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(PHActionSlider *)self _knobWidth];
  double v13 = v12;
  [(PHActionSlider *)self _knobMinXInset];
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  if (v3) {
    CGRectEdge v15 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v15 = CGRectMinXEdge;
  }
  if (v3) {
    CGRectEdge v16 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v16 = CGRectMaxXEdge;
  }
  double v17 = v13 + v14;
  double v18 = 86.0;
  if (v3) {
    double v18 = 14.0;
  }
  double v69 = v18;
  v74.origin.CGFloat x = v5;
  v74.origin.CGFloat y = v7;
  v74.size.CGFloat width = v9;
  v74.size.double height = v11;
  CGRectDivide(v74, &slice, &remainder, v17, v15);
  CGRectDivide(remainder, &slice, &remainder, 13.0, v16);
  -[PHActionSliderLabel sizeThatFits:](self->_trackLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  [(PHActionSlider *)self _currentScreenScale];
  uint64_t v64 = v19;
  UIRectCenteredXInRectScale();
  CGFloat width = v75.size.width;
  CGFloat x = v75.origin.x;
  double height = v75.size.height;
  CGFloat y = v75.origin.y;
  double MinX = CGRectGetMinX(v75);
  CGFloat v22 = v5;
  v76.origin.CGFloat x = v5;
  CGFloat v23 = v7;
  v76.origin.CGFloat y = v7;
  CGFloat v24 = v9;
  v76.size.CGFloat width = v9;
  CGFloat v25 = v11;
  v76.size.double height = v11;
  double rect = width;
  if (MinX - CGRectGetMinX(v76) >= v69)
  {
    double v26 = x;
  }
  else
  {
    v77.origin.CGFloat x = v22;
    v77.origin.CGFloat y = v23;
    v77.size.CGFloat width = v9;
    v77.size.double height = v11;
    double v26 = v69 + CGRectGetMinX(v77);
  }
  CGFloat v27 = v22;
  if (v3) {
    double v28 = 86.0;
  }
  else {
    double v28 = 14.0;
  }
  v78.origin.CGFloat x = v22;
  v78.origin.CGFloat y = v23;
  v78.size.CGFloat width = v24;
  v78.size.double height = v25;
  CGFloat v29 = v23;
  double MaxX = CGRectGetMaxX(v78);
  v79.origin.CGFloat x = v26;
  v79.origin.CGFloat y = y;
  v79.size.CGFloat width = rect;
  v79.size.double height = height;
  if (MaxX - CGRectGetMaxX(v79) < v28)
  {
    v80.origin.CGFloat x = v27;
    v80.origin.CGFloat y = v23;
    v80.size.CGFloat width = v24;
    v80.size.double height = v25;
    CGFloat v31 = CGRectGetMaxX(v80) - v28;
    v81.origin.CGFloat x = v26;
    v81.origin.CGFloat y = y;
    v81.size.CGFloat width = rect;
    v81.size.double height = height;
    double v26 = v31 - CGRectGetWidth(v81);
  }
  v82.origin.CGFloat x = v26;
  v82.origin.CGFloat y = y;
  v82.size.CGFloat width = rect;
  v82.size.double height = height;
  double v32 = CGRectGetMinX(v82);
  v83.origin.CGFloat x = v27;
  v83.origin.CGFloat y = v23;
  v83.size.CGFloat width = v24;
  v83.size.double height = v25;
  double v33 = v26;
  if (v32 - CGRectGetMinX(v83) < v69)
  {
    v84.origin.CGFloat x = v27;
    v84.origin.CGFloat y = v29;
    v84.size.CGFloat width = v24;
    v84.size.double height = v25;
    CGFloat v34 = CGRectGetMaxX(v84) - (v28 + -4.0);
    v85.origin.CGFloat x = v26;
    v85.origin.CGFloat y = y;
    v85.size.CGFloat width = rect;
    v85.size.double height = height;
    double v33 = v34 - CGRectGetWidth(v85);
  }
  double v35 = [(PHActionSlider *)self trackText];
  int64_t v36 = [(PHActionSlider *)self textStyle];
  [(UIView *)self->_trackBackgroundView bounds];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  [(PHActionSlider *)self trackTextYOffset];
  double v46 = v45;
  if (v36 == 2
    && ((uint64_t)[(PHActionSliderLabel *)self->_trackLabel numberOfLines] > 1
     || ![(PHActionSliderLabel *)self->_trackLabel numberOfLines])
    && [v35 containsString:@"\n"])
  {
    v86.origin.CGFloat x = v38;
    v86.origin.CGFloat y = v40;
    v86.size.CGFloat width = v42;
    v86.size.double height = v44;
    double v47 = CGRectGetHeight(v86);
    v87.origin.CGFloat x = v33;
    v87.origin.CGFloat y = y;
    double v48 = rect;
    v87.size.CGFloat width = rect;
    v87.size.double height = height;
    double v49 = (v47 - CGRectGetHeight(v87)) * 0.5 + 0.0;
  }
  else
  {
    v50 = +[CNKFeatures sharedInstance];
    unsigned int v51 = [v50 isButtonLayoutEnabled];

    if (v51)
    {
      v88.origin.CGFloat x = v38;
      v88.origin.CGFloat y = v40;
      v88.size.CGFloat width = v42;
      v88.size.double height = v44;
      double v52 = CGRectGetHeight(v88);
      v89.origin.CGFloat x = v33;
      v89.origin.CGFloat y = y;
      double v48 = rect;
      v89.size.CGFloat width = rect;
      v89.size.double height = height;
      double v49 = (v52 - CGRectGetHeight(v89)) * 0.5;
    }
    else
    {
      double v70 = v46;
      char v53 = objc_opt_respondsToSelector();
      trackLabel = self->_trackLabel;
      double v48 = rect;
      CGFloat v55 = v44;
      if (v53) {
        -[PHActionSliderLabel baselineOffsetFromBottomWithSize:](trackLabel, "baselineOffsetFromBottomWithSize:", rect, height);
      }
      else {
        [(PHActionSliderLabel *)trackLabel _baselineOffsetFromBottom];
      }
      double v68 = v56;
      [(PHActionSlider *)self trackTextBaselineFromBottom];
      double v58 = v57;
      v90.origin.CGFloat x = v38;
      v90.origin.CGFloat y = v40;
      v90.size.CGFloat width = v42;
      v90.size.double height = v55;
      double v59 = CGRectGetHeight(v90);
      v91.origin.CGFloat x = v33;
      v91.origin.CGFloat y = y;
      v91.size.CGFloat width = rect;
      v91.size.double height = height;
      double v49 = v70 + v59 - (CGRectGetHeight(v91) - v68) - v58;
    }
  }

  double v60 = v33;
  double v61 = v49;
  double v62 = v48;
  double v63 = height;
  result.size.double height = v63;
  result.size.CGFloat width = v62;
  result.origin.CGFloat y = v61;
  result.origin.CGFloat x = v60;
  return result;
}

- (double)trackTextYOffset
{
  unsigned int v2 = [(PHActionSlider *)self isLarge];
  double result = 0.0;
  if (v2) {
    return -10.0;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  CGFloat v5 = [(PHActionSlider *)self superview];
  double v6 = v5;
  if (v5)
  {
    [v5 bounds];
    double v7 = CGRectGetWidth(v15);
  }
  else
  {
    double v8 = +[UIScreen mainScreen];
    [v8 bounds];
    double v7 = CGRectGetWidth(v16);
  }
  if (width >= v7 || width <= 0.0) {
    double width = v7;
  }
  [(PHActionSlider *)self trackSize];
  double v11 = v10 + 0.0;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)openTrackAnimated:(BOOL)a3
{
  if (a3)
  {
    [(PHActionSlider *)self hideTrackLabel:1];
    [(PHActionSlider *)self setAnimating:1];
    double v4 = [(UIView *)self->_trackBackgroundView layer];
    [v4 removeAllAnimations];

    CGFloat v5 = [(UIView *)self->_trackDodgeView layer];
    [v5 removeAllAnimations];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009BE74;
    v10[3] = &unk_1002CDD38;
    v10[4] = self;
    v10[5] = 0x3FD3333333333333;
    +[UIView performWithoutAnimation:v10];
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009BEBC;
    v9[3] = &unk_1002CD518;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009BF04;
    v8[3] = &unk_1002CD540;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v9 options:v8 animations:0.05 completion:0.0];
    dispatch_time_t v6 = dispatch_time(0, 150000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009BF50;
    block[3] = &unk_1002CD518;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(PHActionSlider *)self setTrackWidthProportion:1.0];
    [(PHActionSlider *)self showTrackLabel];
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (void)closeTrackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[PHActionSlider hideTrackLabel:](self, "hideTrackLabel:");
  if (v3)
  {
    CGFloat v5 = [(UIView *)self->_trackBackgroundView layer];
    [v5 removeAllAnimations];

    dispatch_time_t v6 = [(UIView *)self->_trackDodgeView layer];
    [v6 removeAllAnimations];

    [(PHActionSlider *)self setAnimating:1];
    [(PHActionSlider *)self updateAllTrackMasks];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009C0B0;
    v8[3] = &unk_1002CD518;
    v8[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009C0F8;
    v7[3] = &unk_1002CD540;
    v7[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v8 completion:v7];
  }
  else
  {
    [(PHActionSlider *)self setTrackWidthProportion:0.0];
    [(PHActionSlider *)self setNeedsLayout];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  double v4 = +[CNKFeatures sharedInstance];
  unsigned __int8 v5 = [v4 isButtonLayoutEnabled];

  if ((v5 & 1) == 0) {
    [(UIView *)self->_trackSolidView setBackgroundColor:v6];
  }
}

- (id)backgroundColor
{
  return [(UIView *)self->_trackSolidView backgroundColor];
}

- (CGSize)_defaultTrackSize
{
  if ([(PHActionSlider *)self isButtonLayoutEnabled] && self->_isLarge)
  {
    BOOL v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    if (v5 >= v7) {
      double v8 = v7;
    }
    else {
      double v8 = v5;
    }
    float v9 = v8 * 0.1976;
    double v10 = roundf(v9);
    double v11 = (v8 + v8 * -0.102 * 2.0 - v10 * 3.0) * 0.5;
    double v12 = v11 + v11 + v10 * 3.0 + 12.0;
    double v13 = v10 + 12.0;
  }
  else
  {
    double v14 = +[UIDevice currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    if (v15
      || (+[UIScreen mainScreen],
          CGRect v16 = objc_claimAutoreleasedReturnValue(),
          [v16 _referenceBounds],
          double Height = CGRectGetHeight(v20),
          v16,
          Height > 480.0))
    {
      unsigned int v18 = [(PHActionSlider *)self isLarge];
      double v13 = 92.0;
      if (!v18) {
        double v13 = 75.0;
      }
      double v12 = 266.0;
    }
    else
    {
      double v12 = 266.0;
      double v13 = 65.0;
    }
  }
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGRect)_trackFrame
{
  [(PHActionSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PHActionSlider *)self trackSize];
  double v12 = v11;
  v17.origin.CGFloat x = v4;
  v17.origin.CGFloat y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  if (CGRectGetWidth(v17) > v12)
  {
    v18.origin.CGFloat x = v4;
    v18.origin.CGFloat y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double v4 = v4 + (CGRectGetWidth(v18) - v12) * 0.5;
    CGFloat v8 = v12;
  }
  double v13 = v6 + 0.0;
  double v14 = v4;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v14;
  return result;
}

- (double)_knobMinXInset
{
  [(PHActionSlider *)self knobInsets];
  return v2;
}

- (double)_knobMaxXInset
{
  [(PHActionSlider *)self knobInsets];
  return v2;
}

- (double)_knobVerticalInset
{
  [(PHActionSlider *)self knobInsets];
  return v2 + 0.0;
}

- (double)_knobHorizontalPosition
{
  [(PHActionSlider *)self _knobAvailableX];
  double v4 = v3;
  double knobPosition = self->_knobPosition;
  double v6 = v3 * knobPosition;
  if ([(PHActionSlider *)self shouldReverseLayoutDirection]) {
    double v7 = -(v4 * knobPosition);
  }
  else {
    double v7 = v6;
  }
  [(PHActionSlider *)self _knobMinX];
  return v8 + v7;
}

- (double)_stretchKnobX
{
  if ([(PHActionSlider *)self shouldReverseLayoutDirection])
  {
    [(PHActionSlider *)self _trackFrame];
    double MaxX = CGRectGetMaxX(v9);
    [(PHActionSlider *)self _knobMaxXInset];
    double v5 = MaxX - v4;
    [(PHActionSlider *)self _stretchKnobWidth];
    return v5 - v6;
  }
  else
  {
    [(PHActionSlider *)self _knobLeftMostX];
  }
  return result;
}

- (double)_stretchKnobWidth
{
  [(PHActionSlider *)self _knobAvailableX];
  double v4 = v3;
  [(PHActionSlider *)self _knobMaxXInset];
  double v6 = v4 - v5;
  [(PHActionSlider *)self _knobMinXInset];
  double v8 = v6 - v7;
  double knobPosition = self->_knobPosition;
  [(PHActionSlider *)self _knobWidth];
  return v10 + v8 * knobPosition;
}

- (double)_knobMinX
{
  if ([(PHActionSlider *)self shouldReverseLayoutDirection])
  {
    [(PHActionSlider *)self _knobRightMostX];
  }
  else
  {
    [(PHActionSlider *)self _knobLeftMostX];
  }
  return result;
}

- (double)_knobMaxX
{
  if ([(PHActionSlider *)self shouldReverseLayoutDirection])
  {
    [(PHActionSlider *)self _knobLeftMostX];
  }
  else
  {
    [(PHActionSlider *)self _knobRightMostX];
  }
  return result;
}

- (double)_knobLeftMostX
{
  [(PHActionSlider *)self _trackFrame];
  double MinX = CGRectGetMinX(v6);
  [(PHActionSlider *)self _knobMinXInset];
  return MinX + v4;
}

- (double)_knobRightMostX
{
  if (self->_dragStyle == 2)
  {
    [(PHActionSlider *)self _knobMinXInset];
    double v4 = -v3;
  }
  else
  {
    [(PHActionSlider *)self _knobMaxXInset];
    double v4 = v5;
  }
  [(PHActionSlider *)self _trackFrame];
  CGFloat v6 = CGRectGetMaxX(v9) - v4;
  [(PHActionSlider *)self _knobWidth];
  return v6 - v7;
}

- (double)_knobAvailableX
{
  [(PHActionSlider *)self _knobMaxX];
  double v4 = v3;
  [(PHActionSlider *)self _knobMinX];
  return vabdd_f64(v4, v5);
}

- (BOOL)xPointIsWithinTrack:(double)a3
{
  unsigned int v5 = [(PHActionSlider *)self shouldReverseLayoutDirection];
  [(PHActionSlider *)self _knobMinX];
  if (v5) {
    return v6 >= a3;
  }
  else {
    return v6 <= a3;
  }
}

- (BOOL)shouldHideTrackLabelForXPoint:(double)a3
{
  unsigned int v5 = [(PHActionSlider *)self shouldReverseLayoutDirection];
  [(PHActionSlider *)self _knobMinX];
  if (v5) {
    return v6 > a3;
  }
  else {
    return v6 < a3;
  }
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)PHActionSlider;
  [(PHActionSlider *)&v5 didMoveToSuperview];
  if ((id)[(PHActionSlider *)self textStyle] == (id)1)
  {
    [(PHActionSlider *)self trackWidthProportion];
    if (v3 >= 1.0)
    {
      trackLabel = self->_trackLabel;
      if (!trackLabel)
      {
        [(PHActionSlider *)self _makeTrackLabel];
        trackLabel = self->_trackLabel;
      }
      [(PHActionSliderLabel *)trackLabel startAnimating];
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PHActionSlider;
  [(PHActionSlider *)&v3 didMoveToWindow];
  [(PHActionSlider *)self setCachedTrackMaskWidth:0.0];
  [(PHActionSlider *)self setNeedsLayout];
  if ([(PHActionSlider *)self isShowingTrackLabel] && self->_trackLabel)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PHActionSliderLabel *)self->_trackLabel show];
    }
  }
}

- (void)_makeTrackLabel
{
  objc_super v3 = [(PHActionSlider *)self trackText];
  double v4 = [(PHActionSlider *)self trackFont];
  int64_t v5 = [(PHActionSlider *)self textStyle];
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      id v7 = 0;
      goto LABEL_8;
    }
    double v6 = [(PHActionSlider *)self vibrantSettings];
    id v7 = [objc_alloc((Class)_UIGlintyStringView) initWithText:v3 andFont:v4];
    [v7 setAllowsLuminanceAdjustments:0];
    [v7 setUsesBackgroundDimming:1];
    [v7 setVibrantSettings:v6];
    double v8 = [v6 legibilitySettings];
    [v7 setLegibilitySettings:v8];

    [v7 setChevronStyle:0];
    [v7 setAdjustsFontSizeToFitWidth:1];
    [v7 updateText];
    goto LABEL_6;
  }
  id v7 = objc_alloc_init((Class)UILabel);
  CGRect v9 = +[UIColor colorWithWhite:1.0 alpha:0.9];
  [v7 setTextColor:v9];

  [v7 setText:v3];
  [v7 setFont:v4];
  double v10 = +[CNKFeatures sharedInstance];
  unsigned int v11 = [v10 isButtonLayoutEnabled];

  if (v11)
  {
    double v6 = +[CAFilter filterWithType:kCAFilterColorMatrix];
    v17[2] = xmmword_100284FB8;
    v17[3] = *(_OWORD *)"Zd;@";
    v17[4] = xmmword_100284FD8;
    v17[0] = xmmword_100284F98;
    v17[1] = unk_100284FA8;
    double v12 = +[NSValue valueWithCAColorMatrix:v17];
    [v6 setValue:v12 forKey:@"inputColorMatrix"];

    CGRect v18 = v6;
    double v13 = +[NSArray arrayWithObjects:&v18 count:1];
    double v14 = [v7 layer];
    [v14 setFilters:v13];

LABEL_6:
  }
LABEL_8:
  [(PHActionSliderLabel *)self->_trackLabel removeFromSuperview];
  trackLabel = self->_trackLabel;
  self->_trackLabel = (PHActionSliderLabel *)v7;
  id v16 = v7;

  [(UIView *)self->_contentView insertSubview:self->_trackLabel below:self->_knobView];
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)PHActionSlider;
  [(PHActionSlider *)&v67 layoutSubviews];
  [(PHActionSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PHActionSlider *)self _currentScreenScale];
  double v12 = v11;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  [(PHActionSlider *)self _knobWidth];
  UIRoundToViewScale();
  double v14 = v13;
  [(PHActionSlider *)self _knobMinXInset];
  UIRoundToViewScale();
  double v16 = v15;
  [(PHActionSlider *)self _knobMaxXInset];
  UIRoundToViewScale();
  double v18 = v17;
  [(PHActionSlider *)self _trackFrame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  if (self->_trackWidthProportion >= 1.0)
  {
    if (self->_knobPosition > 0.0)
    {
      double v29 = 0.0;
      if (self->_dragStyle != 2)
      {
        [(PHActionSlider *)self _knobAvailableX];
        double v29 = v30 * self->_knobPosition;
      }
      v70.origin.CGFloat x = v20;
      v70.origin.CGFloat y = v22;
      v70.size.double width = v24;
      v70.size.double height = v26;
      CGFloat v31 = CGRectGetWidth(v70) - v29;
      v71.origin.CGFloat x = v20;
      v71.origin.CGFloat y = v22;
      v71.size.double width = v24;
      v71.size.double height = v26;
      double v32 = CGRectGetHeight(v71) - v31;
      double v26 = v26 - fmax(v32, 0.0);
      if (v32 <= 0.0) {
        double v33 = -0.0;
      }
      else {
        double v33 = v32 * 0.5;
      }
      double v22 = v22 + v33;
      if ([(PHActionSlider *)self shouldReverseLayoutDirection]) {
        double v34 = -0.0;
      }
      else {
        double v34 = v29;
      }
      double v20 = v20 + v34;
      double v24 = v24 - v29;
    }
  }
  else
  {
    double v27 = v14 + v16 + v18;
    double v28 = v19;
    if ([(PHActionSlider *)self shouldReverseLayoutDirection])
    {
      v68.origin.CGFloat x = v20;
      v68.origin.CGFloat y = v22;
      v68.size.double width = v24;
      v68.size.double height = v26;
      double v28 = (CGRectGetMaxX(v68) - v27) * (1.0 - self->_trackWidthProportion);
    }
    v69.origin.CGFloat x = v20;
    v69.origin.CGFloat y = v22;
    v69.size.double width = v24;
    v69.size.double height = v26;
    double v24 = v27 + (CGRectGetWidth(v69) - v27) * self->_trackWidthProportion;
    double v20 = v28;
  }
  -[UIView setFrame:](self->_trackBackgroundView, "setFrame:", v20, v22, v24, v26);
  [(UIView *)self->_trackBackgroundView bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  -[UIView setFrame:](self->_trackDodgeView, "setFrame:");
  -[_UIBackdropView setFrame:](self->_trackBlurView, "setFrame:", v36, v38, v40, v42);
  -[UIView setFrame:](self->_trackSolidView, "setFrame:", v36, v38, v40, v42);
  -[UIVisualEffectView setFrame:](self->_trackSolidViewBackDropVisualEffectView, "setFrame:", v36, v38, v40, v42);
  [(PHActionSlider *)self cachedTrackMaskWidth];
  double v44 = v43;
  v72.origin.CGFloat x = v36;
  v72.origin.CGFloat y = v38;
  v72.size.double width = v40;
  v72.size.double height = v42;
  if (v44 != CGRectGetWidth(v72))
  {
    v73.origin.CGFloat x = v36;
    v73.origin.CGFloat y = v38;
    v73.size.double width = v40;
    v73.size.double height = v42;
    if (CGRectGetWidth(v73) > 0.0) {
      [(PHActionSlider *)self updateAllTrackMasks];
    }
  }
  [(PHActionSlider *)self knobRect];
  UIRectIntegralWithScale();
  double v46 = v45;
  double v48 = v47;
  -[PHActionSliderKnob setFrame:](self->_knobView, "setFrame:");
  knobImageView = self->_knobImageView;
  if (knobImageView)
  {
    -[UIImageView sizeThatFits:](knobImageView, "sizeThatFits:", v46, v48);
    UIRectCenteredIntegralRectScale();
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    if ((id)[(PHActionSlider *)self dragStyle] == (id)2) {
      double v58 = v46 + (v48 - v55) * -0.5 - v55 - self->_knobImageOffset.width;
    }
    else {
      double v58 = v51 + self->_knobImageOffset.width;
    }
    -[UIImageView setFrame:](self->_knobImageView, "setFrame:", floor(v12 * v58) / v12, floor(v12 * (v53 + self->_knobImageOffset.height)) / v12, v55, v57);
  }
  if (self->_knobLabel)
  {
    unsigned int v59 = [(PHActionSlider *)self _shouldReverseLayoutDirection];
    double v60 = v46 - v48;
    if (v59) {
      double v60 = 0.0;
    }
    -[UILabel setFrame:](self->_knobLabel, "setFrame:", v60, 0.0, v48, v48);
  }
  uint64_t v61 = [(PHActionSlider *)self knobText];
  if (!v61)
  {
    v65 = self->_knobImageView;
    goto LABEL_31;
  }
  double v62 = (void *)v61;
  double v63 = [(PHActionSlider *)self knobText];
  unsigned __int8 v64 = [v63 isEqualToString:&stru_1002D6110];

  v65 = self->_knobImageView;
  if (v64)
  {
LABEL_31:
    [(UIImageView *)v65 setAlpha:1.0];
    double v66 = 0.0;
    goto LABEL_32;
  }
  [(UIImageView *)v65 setAlpha:0.0];
  double v66 = 1.0;
LABEL_32:
  [(UILabel *)self->_knobLabel setAlpha:v66];
  if (self->_trackLabel || ([(PHActionSlider *)self _makeTrackLabel], self->_trackLabel))
  {
    [(PHActionSlider *)self trackTextRect];
    UIRectIntegralWithScale();
    -[PHActionSliderLabel setFrame:](self->_trackLabel, "setFrame:");
  }
}

- (id)trackMaskImage
{
  double v3 = [(PHActionSlider *)self _screen];
  [(UIView *)self->_trackBackgroundView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 scale];
  double v13 = v12;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  size_t v15 = vcvtpd_u64_f64(v13 * CGRectGetWidth(v25));
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  CGFloat Height = CGRectGetHeight(v26);
  double v17 = CGBitmapContextCreate(0, v15, vcvtpd_u64_f64(v13 * Height), 8uLL, 4 * v15, DeviceRGB, 2u);
  CGContextScaleCTM(v17, v13, v13);
  v27.origin.CGFloat x = 0.0;
  v27.origin.CGFloat y = 0.0;
  v27.size.double width = v9;
  v27.size.double height = v11;
  CGContextClearRect(v17, v27);
  v23[0] = xmmword_100284FE8;
  v23[1] = unk_100284FF8;
  double v18 = CGColorCreate(DeviceRGB, (const CGFloat *)v23);
  CGContextSetFillColorWithColor(v17, v18);
  CGColorRelease(v18);
  sub_10009D2D8(v5, v7, v9, v11);
  id v19 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v17, (CGPathRef)[v19 CGPath]);
  CGContextFillPath(v17);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  double v21 = +[UIImage imageWithCGImage:Image scale:0 orientation:v13];
  CGImageRelease(Image);

  return v21;
}

- (id)trackMaskPath
{
  [(UIView *)self->_trackBackgroundView bounds];

  return sub_10009D2D8(v2, v3, v4, v5);
}

- (void)updateAllTrackMasks
{
  if ([(PHActionSlider *)self isAnimating])
  {
    id v3 = [(PHActionSlider *)self trackMaskPath];
    CopCGFloat y = CGPathCreateCopy((CGPathRef)[v3 CGPath]);
    [(PHActionSlider *)self setMaskPath:Copy onView:self->_trackDodgeView];
    if (self->_trackSolidView)
    {
      -[PHActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", Copy);
      [(PHActionSlider *)self setMaskPath:Copy onView:self->_trackSolidViewBackDropVisualEffectView];
    }
    CGPathRelease(Copy);

    p_trackBlurView = &self->_trackBlurView;
    if (!self->_trackBlurView)
    {
      id v9 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v9 = [(PHActionSlider *)self trackMaskImage];
  -[PHActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:");
  if (self->_trackSolidView)
  {
    -[PHActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:", v9);
    [(PHActionSlider *)self setMaskFromImage:v9 onView:self->_trackSolidViewBackDropVisualEffectView];
  }
  uint64_t v6 = (uint64_t)v9;
  p_trackBlurView = &self->_trackBlurView;
  trackBlurView = self->_trackBlurView;
  if (trackBlurView)
  {
    if (v9)
    {
LABEL_11:
      id v9 = (id)v6;
      double v8 = [(_UIBackdropView *)trackBlurView inputSettings];
      [v8 setFilterMaskImage:v9];
      [v8 setGrayscaleTintMaskImage:v9];
      [v8 setColorTintMaskImage:v9];

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v6 = [(PHActionSlider *)self trackMaskImage];
    trackBlurView = *p_trackBlurView;
    goto LABEL_11;
  }
LABEL_12:
  [(UIView *)self->_trackBackgroundView bounds];
  [(PHActionSlider *)self setCachedTrackMaskWidth:CGRectGetWidth(v11)];
}

- (void)setMaskPath:(CGPath *)a3 onView:(id)a4
{
  id v10 = a4;
  CGFloat v5 = [v10 layer];
  uint64_t v6 = [v5 mask];
  CGFloat v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = +[CAShapeLayer layer];

    [v9 setAnchorPoint:CGPointZero.x, CGPointZero.y];
    [v9 setDelegate:v10];
    [v5 setMask:v9];
    uint64_t v6 = v9;
  }
  [v10 bounds];
  [v6 setBounds:];
  [v6 setPath:a3];
}

- (void)setMaskFromImage:(id)a3 onView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = [v7 CGImage];
  id v22 = +[CALayer layer];
  [v6 bounds];
  [v22 setBounds:];
  [v22 setAnchorPoint:CGPointZero.x, CGPointZero.y];
  [v7 scale];
  [v22 setContentsScale:];
  [v22 setDelegate:v6];
  [v7 size];
  double v10 = v9;
  double v12 = v11;
  [v7 capInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [v22 setContentsCenter:v16 / v10, v14 / v12, (v10 - v20 - v16) / v10, (v12 - v14 - v18) / v12];
  [v22 setContents:v8];
  double v21 = [v6 layer];

  [v21 setMask:v22];
}

- (void)setTrackLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(PHActionSlider *)self isShowingTrackLabel];
  if (v5)
  {
    if (!v7) {
      return;
    }
    if (!self->_trackLabel) {
      [(PHActionSlider *)self _makeTrackLabel];
    }
    if ((id)[(PHActionSlider *)self textStyle] == (id)1)
    {
      trackLabel = self->_trackLabel;
      if (v4) {
        [(PHActionSliderLabel *)trackLabel fadeOutWithDuration:0.15];
      }
      else {
        [(PHActionSliderLabel *)trackLabel hide];
      }
      goto LABEL_19;
    }
    double v9 = 0.15;
    if (!v4) {
      double v9 = 0.0;
    }
    double v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    double v18 = sub_10009D97C;
    double v19 = &unk_1002CD518;
    double v20 = self;
    double v10 = &v16;
    goto LABEL_17;
  }
  if (v7) {
    return;
  }
  if (!self->_trackLabel) {
    [(PHActionSlider *)self _makeTrackLabel];
  }
  if ((id)[(PHActionSlider *)self textStyle] != (id)1)
  {
    double v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    double v13 = sub_10009D994;
    double v14 = &unk_1002CD518;
    double v15 = self;
    double v9 = 0.15;
    double v10 = &v11;
LABEL_17:
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_19;
  }
  [(PHActionSliderLabel *)self->_trackLabel fadeInWithDuration:0.15];
LABEL_19:
  [(PHActionSlider *)self setShowingTrackLabel:!v5];
}

- (void)showTrackLabel
{
}

- (void)hideTrackLabel:(BOOL)a3
{
}

- (void)_slideCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  [(PHActionSlider *)self setAnimating:1];
  [(PHActionSlider *)self updateAllTrackMasks];
  self->_slideGestureInitialPoint = CGPointZero;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009DB88;
  v9[3] = &unk_1002CD918;
  BOOL v10 = v3;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009DC24;
  v8[3] = &unk_1002CD540;
  v8[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v9 completion:v8];
  if (v3)
  {
    BOOL v5 = [(PHActionSlider *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 actionSliderDidCompleteSlide:self];
    }
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 150000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009DC70;
    v7[3] = &unk_1002CD518;
    v7[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
    BOOL v5 = [(PHActionSlider *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 actionSliderDidCancelSlide:self];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  if (self->_slideGestureRecognizer == a3 && ![a3 state])
  {
    [v6 locationInView:self->_knobView];
    -[PHActionSlider setPanGestureFirstTouchLocationInView:](self, "setPanGestureFirstTouchLocationInView:");
    unsigned int v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHActionSlider -shouldReceiveTouch: storing touch %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UIPanGestureRecognizer *)a3;
  BOOL v5 = v4;
  if (self->_slideGestureRecognizer != v4)
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
LABEL_4:
    BOOL v10 = 1;
    goto LABEL_5;
  }
  [(UIPanGestureRecognizer *)v4 locationInView:self->_knobView];
  CGFloat x = v8;
  CGFloat y = v9;
  [(PHActionSliderKnob *)self->_knobView bounds];
  v35.CGFloat x = x;
  v35.CGFloat y = y;
  if (CGRectContainsPoint(v37, v35)) {
    goto LABEL_4;
  }
  [(PHActionSliderKnob *)self->_knobView bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(PHActionSlider *)self panGestureFirstTouchLocationInView];
  v36.CGFloat x = v24;
  v36.CGFloat y = v25;
  v39.origin.CGFloat x = v17;
  v39.origin.CGFloat y = v19;
  v39.size.double width = v21;
  v39.size.double height = v23;
  BOOL v10 = CGRectContainsPoint(v39, v36);
LABEL_5:
  double v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v33.CGFloat x = x;
    v33.CGFloat y = y;
    uint64_t v12 = NSStringFromCGPoint(v33);
    [(PHActionSlider *)self panGestureFirstTouchLocationInView];
    double v13 = NSStringFromCGPoint(v34);
    [(PHActionSliderKnob *)self->_knobView bounds];
    double v14 = NSStringFromCGRect(v38);
    v26[0] = 67109890;
    v26[1] = v10;
    __int16 v27 = 2112;
    double v28 = v12;
    __int16 v29 = 2112;
    double v30 = v13;
    __int16 v31 = 2112;
    double v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHActionSlider shouldBegin: %d touchLocationInKnob: %@ firstTouchLocationInKnob: %@ knobViewBounds: %@", (uint8_t *)v26, 0x26u);
  }
  return v10;
}

- (void)_knobPanGesture:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHActionSlider *)self _shouldReverseLayoutDirection];
  [(PHActionSlider *)self _knobMinX];
  double v7 = v6;
  [(PHActionSlider *)self _knobAvailableX];
  double v9 = v8;
  [v4 locationInView:self];
  double v11 = v10;
  CGFloat v13 = v12;
  p_slideGestureInitialPoint = &self->_slideGestureInitialPoint;
  double x = self->_slideGestureInitialPoint.x;
  [v4 velocityInView:self];
  double v17 = v16;
  double v18 = self->_slideGestureInitialPoint.x;
  if (!v5)
  {
    double v19 = v11 - x;
    if (v18 < 0.0)
    {
      [(PHActionSlider *)self _knobMaxX];
      goto LABEL_6;
    }
LABEL_7:
    double v21 = v9;
    goto LABEL_8;
  }
  double v19 = x - v11;
  if (v18 >= 0.0) {
    goto LABEL_7;
  }
  [(PHActionSlider *)self _knobMinX];
LABEL_6:
  double v21 = v20;
LABEL_8:
  double v22 = v19 / v21;
  [(PHActionSlider *)self minSlideCompletionPercentage];
  double v24 = v19 / (v21 * v23);
  BOOL v25 = v17 >= 150.0 && v19 / v21 >= 0.4;
  uint64_t v26 = v24 >= 0.999000013 || v25;
  __int16 v27 = [(PHActionSlider *)self delegate];
  switch((unint64_t)[v4 state])
  {
    case 1uLL:
      __int16 v31 = sub_1000D5130();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 138412290;
        v35[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Began slide with gesture recognizer: %@", (uint8_t *)&v34, 0xCu);
      }

      p_slideGestureInitialPoint->double x = v11;
      self->_slideGestureInitialPoint.CGFloat y = v13;
      if ([(PHActionSlider *)self shouldHideTrackLabelForXPoint:v11]) {
        [(PHActionSlider *)self hideTrackLabel:1];
      }
      if (objc_opt_respondsToSelector()) {
        [v27 actionSliderDidBeginSlide:self];
      }
      goto LABEL_37;
    case 2uLL:
      if (![(PHActionSlider *)self xPointIsWithinTrack:v11])
      {
        p_double knobPosition = &self->_knobPosition;
        self->_double knobPosition = 0.0;
LABEL_39:
        *p_double knobPosition = 0.0;
        [(PHActionSlider *)self showTrackLabel];
        goto LABEL_40;
      }
      if (![(PHActionSlider *)self xPointIsWithinTrack:p_slideGestureInitialPoint->x])
      {
        if ([(PHActionSlider *)self xPointIsWithinTrack:p_slideGestureInitialPoint->x]) {
          double v7 = p_slideGestureInitialPoint->x;
        }
        double v22 = vabdd_f64(v11, v7) / v9;
      }
      p_double knobPosition = &self->_knobPosition;
      self->_double knobPosition = v22;
      if (v22 <= 0.0) {
        goto LABEL_39;
      }
      if (v22 > 1.0) {
        *p_double knobPosition = 1.0;
      }
      [(PHActionSlider *)self hideTrackLabelIfNecessary:1];
LABEL_40:
      [(PHActionSlider *)self setNeedsLayout];
      [(PHActionSlider *)self setNeedsDisplay];
      if (objc_opt_respondsToSelector()) {
        [v27 actionSlider:self didUpdateSlideWithValue:*p_knobPosition];
      }
LABEL_37:

      return;
    case 3uLL:
      CGPoint v33 = sub_1000D5130();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 67109378;
        LODWORD(v35[0]) = v26;
        WORD2(v35[0]) = 2112;
        *(void *)((char *)v35 + 6) = v4;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Recognized slide with with success=%d for gesture recognizer: %@", (uint8_t *)&v34, 0x12u);
      }

      __int16 v29 = self;
      uint64_t v30 = v26;
      goto LABEL_36;
    case 4uLL:
    case 5uLL:
      double v28 = sub_1000D5130();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 138412290;
        v35[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed slide with gesture recognizer: %@", (uint8_t *)&v34, 0xCu);
      }

      __int16 v29 = self;
      uint64_t v30 = 0;
LABEL_36:
      [(PHActionSlider *)v29 _slideCompleted:v30];
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

- (void)hideTrackLabelIfNecessary:(BOOL)a3
{
  if (self->_dragStyle != 2) {
    [(PHActionSlider *)self hideTrackLabel:a3];
  }
}

- (BOOL)shouldReverseLayoutDirection
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(PHActionSlider *)self semanticContentAttribute]] == (id)1;
}

- (double)_currentScreenScale
{
  return 2.0;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (unint64_t)dragStyle
{
  return self->_dragStyle;
}

- (void)setTrackSolidViewBackDropVisualEffectView:(id)a3
{
}

- (CGSize)knobImageOffset
{
  double width = self->_knobImageOffset.width;
  double height = self->_knobImageOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)trackText
{
  return self->_trackText;
}

- (UIFont)trackFont
{
  return self->_trackFont;
}

- (CGSize)trackSize
{
  double width = self->_trackSize.width;
  double height = self->_trackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)minSlideCompletionPercentage
{
  return self->_minSlideCompletionPercentage;
}

- (void)setMinSlideCompletionPercentage:(double)a3
{
  self->_minSlideCompletionPercentage = a3;
}

- (double)minFastSlideCompletionPercentage
{
  return self->_minFastSlideCompletionPercentage;
}

- (void)setMinFastSlideCompletionPercentage:(double)a3
{
  self->_minFastSlideCompletionPercentage = a3;
}

- (double)trackTextBaselineFromBottom
{
  return self->_trackTextBaselineFromBottom;
}

- (void)setTrackTextBaselineFromBottom:(double)a3
{
  self->_trackTextBaselineFromBottom = a3;
}

- (UIPanGestureRecognizer)slideGestureRecognizer
{
  return self->_slideGestureRecognizer;
}

- (PHActionSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHActionSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)knobPosition
{
  return self->_knobPosition;
}

- (double)knobWidth
{
  return self->_knobWidth;
}

- (UIEdgeInsets)knobInsets
{
  double top = self->_knobInsets.top;
  double left = self->_knobInsets.left;
  double bottom = self->_knobInsets.bottom;
  double right = self->_knobInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)trackWidthProportion
{
  return self->_trackWidthProportion;
}

- (void)setTrackWidthProportion:(double)a3
{
  self->_trackWidthProportion = a3;
}

- (BOOL)isShowingTrackLabel
{
  return self->_showingTrackLabel;
}

- (void)setShowingTrackLabel:(BOOL)a3
{
  self->_showingTrackLabel = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)cachedTrackMaskWidth
{
  return self->_cachedTrackMaskWidth;
}

- (void)setCachedTrackMaskWidth:(double)a3
{
  self->_cachedTrackMaskWidth = a3;
}

- (UIView)_knobView
{
  return &self->_knobView->super;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (void)setVibrantSettings:(id)a3
{
}

- (BOOL)isLarge
{
  return self->_isLarge;
}

- (void)setIsLarge:(BOOL)a3
{
  self->_isLarge = a3;
}

- (CGPoint)panGestureFirstTouchLocationInView
{
  double x = self->_panGestureFirstTouchLocationInView.x;
  double y = self->_panGestureFirstTouchLocationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPanGestureFirstTouchLocationInView:(CGPoint)a3
{
  self->_panGestureFirstTouchLocationInView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackFont, 0);
  objc_storeStrong((id *)&self->_trackText, 0);
  objc_storeStrong((id *)&self->_trackSolidViewBackDropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_slideGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
  objc_storeStrong((id *)&self->_knobLabel, 0);
  objc_storeStrong((id *)&self->_knobImageView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_trackSolidView, 0);
  objc_storeStrong((id *)&self->_trackBlurView, 0);
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);
  objc_storeStrong((id *)&self->_trackDodgeView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end