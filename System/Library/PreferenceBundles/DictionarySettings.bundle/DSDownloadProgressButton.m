@interface DSDownloadProgressButton
+ (id)_finishedImageForLayoutSize:(CGSize)a3 traitCollection:(id)a4;
- (BOOL)_needsAddToLibraryOrDownloadImageViewForProgressType:(int64_t)a3;
- (BOOL)_needsFinishedImageViewForProgressType:(int64_t)a3;
- (BOOL)_usesDrawingForProgressType:(int64_t)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DSDownloadProgressButton)initWithFrame:(CGRect)a3;
- (DSDownloadProgressButton)initWithStyle:(int64_t)a3;
- (double)progress;
- (id)_addToLibraryOrDownloadImage;
- (int64_t)progressType;
- (int64_t)style;
- (void)_handleDisplayLinkDidFire:(id)a3;
- (void)_reloadForCurrentStateForInitialSetup:(BOOL)a3 previousProgressType:(int64_t)a4;
- (void)_stopProgressAnimation;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setProgressType:(int64_t)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DSDownloadProgressButton

- (DSDownloadProgressButton)initWithFrame:(CGRect)a3
{
  return -[DSDownloadProgressButton initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DSDownloadProgressButton)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DSDownloadProgressButton;
  v4 = -[DSDownloadProgressButton initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(DSDownloadProgressButton *)v4 setOpaque:0];
    [(DSDownloadProgressButton *)v5 setUserInteractionEnabled:v5->_style == 1];
    [(DSDownloadProgressButton *)v5 sizeToFit];
    [(DSDownloadProgressButton *)v5 _reloadForCurrentStateForInitialSetup:1 previousProgressType:0];
  }
  return v5;
}

- (void)dealloc
{
  [(DSDownloadProgressButton *)self removeTarget:self forEvents:0xFFFFFFFFLL];
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DSDownloadProgressButton;
  [(DSDownloadProgressButton *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  if (!-[DSDownloadProgressButton _usesDrawingForProgressType:](self, "_usesDrawingForProgressType:", self->_progressType, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))return; {
  CurrentContext = UIGraphicsGetCurrentContext();
  }
  CGContextSaveGState(CurrentContext);
  id v28 = [(DSDownloadProgressButton *)self tintColor];
  v5 = [(DSDownloadProgressButton *)self traitCollection];
  [v5 displayScale];
  MPUFloatGetSafeScaleForValue();

  [(DSDownloadProgressButton *)self bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  CGRectGetMidX(v30);
  MPUFloatRoundForScale();
  double v11 = v10;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRectGetMidY(v31);
  MPUFloatRoundForScale();
  double v13 = v12;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRectGetWidth(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRectGetHeight(v33);
  MPUFloatFloorForScale();
  double v15 = v14;
  int64_t progressType = self->_progressType;
  if (progressType == 3)
  {
    if (self->_isAnimatingProgress) {
      v23 = &OBJC_IVAR___DSDownloadProgressButton__currentAnimatedProgress;
    }
    else {
      v23 = &OBJC_IVAR___DSDownloadProgressButton__progress;
    }
    double v24 = *(double *)((char *)&self->super.super.super.super.isa + *v23) * 6.28318531 + -1.57079633;
    id v25 = [v28 colorWithAlphaComponent:1.0];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v25 CGColor]);

    id v19 = objc_alloc_init((Class)UIBezierPath);
    objc_msgSend(v19, "moveToPoint:", v11, v13);
    objc_msgSend(v19, "addLineToPoint:", v11, 0.0);
    objc_msgSend(v19, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v11, v13, v15, -1.57079633, v24);
    [v19 closePath];
    [v19 fill];
    id v26 = [v28 colorWithAlphaComponent:0.2];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v26 CGColor]);

    id v27 = objc_alloc_init((Class)UIBezierPath);
    objc_msgSend(v27, "moveToPoint:", v11, v13);
    objc_msgSend(v27, "addLineToPoint:", v11, 0.0);
    objc_msgSend(v27, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, v15, -1.57079633, v24);
    [v27 closePath];
    [v27 fill];

    goto LABEL_12;
  }
  if (progressType == 2)
  {
    id v17 = [v28 colorWithAlphaComponent:0.4];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v17 CGColor]);

    double v18 = v15 + -0.5;
    id v19 = objc_alloc_init((Class)UIBezierPath);
    [v19 setLineJoinStyle:1];
    [v19 setLineCapStyle:1];
    [v19 setLineWidth:1.0];
    double v20 = -1.57079633;
    uint64_t v21 = 5;
    do
    {
      __double2 v22 = __sincos_stret(v20);
      objc_msgSend(v19, "moveToPoint:", v11 + v18 * v22.__cosval, v13 + v18 * v22.__sinval);
      objc_msgSend(v19, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, v18, v20, v20 + -0.628318531);
      double v20 = v20 + -1.25663706;
      --v21;
    }
    while (v21);
    [v19 stroke];
LABEL_12:
  }
  CGContextRestoreGState(CurrentContext);
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)DSDownloadProgressButton;
  [(DSDownloadProgressButton *)&v18 layoutSubviews];
  objc_super v3 = [(DSDownloadProgressButton *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;
  [(DSDownloadProgressButton *)self bounds];
  double v7 = v6;
  double v9 = v8;
  addToLibraryOrDownloadImageView = self->_addToLibraryOrDownloadImageView;
  if (addToLibraryOrDownloadImageView
    && ([(UIImageView *)addToLibraryOrDownloadImageView isHidden] & 1) == 0)
  {
    double v11 = [(UIImageView *)self->_addToLibraryOrDownloadImageView image];
    [v11 size];

    UIRectCenteredXInRectScale();
    UIRectCenteredYInRectScale();
    [(UIImageView *)self->_addToLibraryOrDownloadImageView MPU_applyBoundsAndCenterForUntransformedFrame:v5];
  }
  finishedImageView = self->_finishedImageView;
  if (finishedImageView && ([(UIImageView *)finishedImageView isHidden] & 1) == 0)
  {
    if (!MPUSizeEqualToSize()
      || ([(UIImageView *)self->_finishedImageView image],
          double v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      double v14 = objc_msgSend((id)objc_opt_class(), "_finishedImageForLayoutSize:traitCollection:", v3, v7, v9);
      [(UIImageView *)self->_finishedImageView setImage:v14];
    }
    double v15 = [(UIImageView *)self->_finishedImageView image];
    [v15 size];

    UIRectCenteredXInRectScale();
    UIRectCenteredYInRectScale();
    [(UIImageView *)self->_finishedImageView MPU_applyBoundsAndCenterForUntransformedFrame:v5];
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton && ([(SUUIItemOfferButton *)itemOfferButton isHidden] & 1) == 0)
  {
    UIRectCenteredYInRectScale();
    UIRectCenteredXInRectScale();
    id v17 = self->_itemOfferButton;
    MPURectByApplyingUserInterfaceLayoutDirectionInRect();
    [(SUUIItemOfferButton *)v17 MPU_applyBoundsAndCenterForUntransformedFrame:v5];
  }
  self->_lastLayoutSize.CGFloat width = v7;
  self->_lastLayoutSize.CGFloat height = v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v17.receiver = self;
  v17.super_class = (Class)DSDownloadProgressButton;
  if (-[DSDownloadProgressButton pointInside:withEvent:](&v17, "pointInside:withEvent:", a4)) {
    return 1;
  }
  [(DSDownloadProgressButton *)self bounds];
  CGFloat v8 = v19.origin.x;
  CGFloat v9 = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double v12 = CGRectGetWidth(v19);
  if (v12 >= 44.0) {
    double v13 = 0.0;
  }
  else {
    double v13 = (44.0 - v12) * 0.5;
  }
  v20.origin.CGFloat x = v8;
  v20.origin.CGFloat y = v9;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v20);
  if (v14 >= 44.0) {
    double v15 = 0.0;
  }
  else {
    double v15 = (44.0 - v14) * 0.5;
  }
  if (v13 <= 0.0 && v15 <= 0.0) {
    return 0;
  }
  CGFloat v16 = -v15;
  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, -v13, v16);
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  return CGRectContainsPoint(v22, v18);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t style = self->_style;
  if (style == 1)
  {
    double width = 26.0;
    double height = 24.0;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    if (!style)
    {
      double height = 10.0;
      double width = 10.0;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)DSDownloadProgressButton;
  [(DSDownloadProgressButton *)&v3 tintColorDidChange];
  if ([(DSDownloadProgressButton *)self _usesDrawingForProgressType:self->_progressType])
  {
    [(DSDownloadProgressButton *)self setNeedsDisplay];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DSDownloadProgressButton;
  id v4 = a3;
  [(DSDownloadProgressButton *)&v6 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v6.receiver, v6.super_class);

  uint64_t v5 = [(DSDownloadProgressButton *)self traitCollection];
  [v5 displayScale];
  LOBYTE(v4) = MPUFloatEqualToFloat();

  if ((v4 & 1) == 0)
  {
    if ([(DSDownloadProgressButton *)self _usesDrawingForProgressType:self->_progressType])
    {
      [(DSDownloadProgressButton *)self setNeedsDisplay];
    }
    else
    {
      [(DSDownloadProgressButton *)self setNeedsLayout];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  addToLibraryOrDownloadImageView = self->_addToLibraryOrDownloadImageView;
  if (addToLibraryOrDownloadImageView
    && ![(UIImageView *)addToLibraryOrDownloadImageView isHidden])
  {
    LOBYTE(self) = 1;
  }
  else
  {
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton && ([(SUUIItemOfferButton *)itemOfferButton isHidden] & 1) == 0)
    {
      LOBYTE(self) = [(SUUIItemOfferButton *)self->_itemOfferButton beginTrackingWithTouch:v6 withEvent:v7];
    }
    else
    {
      finishedImageView = self->_finishedImageView;
      if (finishedImageView) {
        LODWORD(self) = [(UIImageView *)finishedImageView isHidden] ^ 1;
      }
      else {
        LOBYTE(self) = 0;
      }
    }
  }

  return (char)self;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
  {
    id v6 = v4;
    if (([(SUUIItemOfferButton *)itemOfferButton isHidden] & 1) == 0) {
      [(SUUIItemOfferButton *)self->_itemOfferButton cancelTrackingWithEvent:v6];
    }
  }

  _objc_release_x1();
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  addToLibraryOrDownloadImageView = self->_addToLibraryOrDownloadImageView;
  if (addToLibraryOrDownloadImageView
    && ![(UIImageView *)addToLibraryOrDownloadImageView isHidden])
  {
    LOBYTE(self) = 1;
  }
  else
  {
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton && ([(SUUIItemOfferButton *)itemOfferButton isHidden] & 1) == 0)
    {
      LOBYTE(self) = [(SUUIItemOfferButton *)self->_itemOfferButton continueTrackingWithTouch:v6 withEvent:v7];
    }
    else
    {
      finishedImageView = self->_finishedImageView;
      if (finishedImageView) {
        LODWORD(self) = [(UIImageView *)finishedImageView isHidden] ^ 1;
      }
      else {
        LOBYTE(self) = 0;
      }
    }
  }

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton && ([(SUUIItemOfferButton *)itemOfferButton isHidden] & 1) == 0) {
    [(SUUIItemOfferButton *)self->_itemOfferButton cancelTrackingWithEvent:v6];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DSDownloadProgressButton *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)DSDownloadProgressButton;
    [(DSDownloadProgressButton *)&v7 setHighlighted:v3];
    if ([(DSDownloadProgressButton *)self _needsAddToLibraryOrDownloadImageViewForProgressType:self->_progressType])
    {
      double v5 = 0.2;
      if (!v3) {
        double v5 = 1.0;
      }
      [(UIImageView *)self->_addToLibraryOrDownloadImageView setAlpha:v5];
    }
    if ([(DSDownloadProgressButton *)self _needsFinishedImageViewForProgressType:self->_progressType])
    {
      double v6 = 0.2;
      if (!v3) {
        double v6 = 1.0;
      }
      [(UIImageView *)self->_finishedImageView setAlpha:v6];
    }
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  double v6 = fmin(a3, 1.0);
  double progress = self->_progress;
  if ((MPUFloatEqualToFloat() & 1) == 0)
  {
    self->_double progress = v6;
    if ((self->_progressType & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (-[DSDownloadProgressButton _usesDrawingForProgressType:](self, "_usesDrawingForProgressType:"))
      {
        id v8 = [(DSDownloadProgressButton *)self window];
        id v18 = [v8 screen];

        if (v4 && v18)
        {
          double v9 = CACurrentMediaTime();
          self->_progressAnimationStartTime = v9;
          self->_progressAnimationEndTime = v9 + 1.2;
          if (self->_isAnimatingProgress) {
            double progress = self->_currentAnimatedProgress;
          }
          self->_initialAnimatedProgress = progress;
          self->_currentAnimatedProgress = progress;
          if (!self->_displayLink)
          {
            double v10 = [v18 displayLinkWithTarget:self selector:"_handleDisplayLinkDidFire:"];
            displayLink = self->_displayLink;
            self->_displayLink = v10;

            double v12 = self->_displayLink;
            double v13 = +[NSRunLoop mainRunLoop];
            [(CADisplayLink *)v12 addToRunLoop:v13 forMode:NSRunLoopCommonModes];
          }
          if (!self->_progressAnimationTimingFunction)
          {
            double v14 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
            self->_progressAnimationTimingFunction = v14;
          }
          self->_isAnimatingProgress = 1;
        }
        else
        {
          [(DSDownloadProgressButton *)self _stopProgressAnimation];
        }
        [(DSDownloadProgressButton *)self setNeedsDisplay];
      }
      else if (self->_style == 1)
      {
        itemOfferButton = self->_itemOfferButton;
        double v17 = self->_progress;
        [(SUUIItemOfferButton *)itemOfferButton setProgress:v4 animated:v17];
      }
    }
  }
}

- (void)setProgressType:(int64_t)a3
{
  if (self->_progressType != a3)
  {
    self->_int64_t progressType = a3;
    -[DSDownloadProgressButton _reloadForCurrentStateForInitialSetup:previousProgressType:](self, "_reloadForCurrentStateForInitialSetup:previousProgressType:", 0);
  }
}

- (void)_handleDisplayLinkDidFire:(id)a3
{
  id v8 = a3;
  if ((MPUFloatEqualToFloat() & 1) == 0)
  {
    [v8 timestamp];
    double v5 = (v4 - self->_progressAnimationStartTime)
       / (self->_progressAnimationEndTime - self->_progressAnimationStartTime);
    if (v5 >= 0.99)
    {
      [(DSDownloadProgressButton *)self _stopProgressAnimation];
    }
    else
    {
      progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
      if (progressAnimationTimingFunction)
      {
        *(float *)&double v5 = v5;
        [(CAMediaTimingFunction *)progressAnimationTimingFunction _solveForInput:v5];
        double v5 = v7;
      }
      self->_currentAnimatedProgress = self->_initialAnimatedProgress
                                     + (self->_progress - self->_initialAnimatedProgress) * v5;
    }
    [(DSDownloadProgressButton *)self setNeedsDisplay];
  }

  _objc_release_x1();
}

+ (id)_finishedImageForLayoutSize:(CGSize)a3 traitCollection:(id)a4
{
  if (a3.width <= 7.0 || a3.height <= 11.0) {
    CFStringRef v5 = @"UniversalRowOfflineAvailabilityIndicator";
  }
  else {
    CFStringRef v5 = @"UniversalAddControlDownloaded";
  }
  id v6 = a4;
  float v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = +[UIImage imageNamed:v5 inBundle:v7 compatibleWithTraitCollection:v6];

  return v8;
}

- (id)_addToLibraryOrDownloadImage
{
  if (self->_style != 1) {
    goto LABEL_5;
  }
  int64_t progressType = self->_progressType;
  if (!progressType)
  {
    CFStringRef v4 = @"UniversalAddControlAdd";
    goto LABEL_7;
  }
  if (progressType != 1)
  {
LABEL_5:
    CFStringRef v5 = 0;
    goto LABEL_8;
  }
  CFStringRef v4 = @"UniversalAddControlDownload";
LABEL_7:
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  float v7 = [(DSDownloadProgressButton *)self traitCollection];
  CFStringRef v5 = +[UIImage imageNamed:v4 inBundle:v6 compatibleWithTraitCollection:v7];

LABEL_8:

  return v5;
}

- (BOOL)_needsAddToLibraryOrDownloadImageViewForProgressType:(int64_t)a3
{
  if (-[DSDownloadProgressButton _usesDrawingForProgressType:](self, "_usesDrawingForProgressType:")) {
    return 0;
  }
  return (unint64_t)a3 < 2 && self->_style == 1;
}

- (BOOL)_needsFinishedImageViewForProgressType:(int64_t)a3
{
  return ![(DSDownloadProgressButton *)self _usesDrawingForProgressType:a3]
      && self->_progressType == 4;
}

- (void)_reloadForCurrentStateForInitialSetup:(BOOL)a3 previousProgressType:(int64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(DSDownloadProgressButton *)self _usesDrawingForProgressType:a4];
  unsigned int v8 = [(DSDownloadProgressButton *)self _usesDrawingForProgressType:self->_progressType];
  char v9 = v8;
  if (!v5 && v7 != v8) {
    [(DSDownloadProgressButton *)self setNeedsDisplay];
  }
  unsigned int v10 = [(DSDownloadProgressButton *)self _needsAddToLibraryOrDownloadImageViewForProgressType:self->_progressType];
  addToLibraryOrDownloadImageView = self->_addToLibraryOrDownloadImageView;
  if (v10)
  {
    if (!addToLibraryOrDownloadImageView)
    {
      id v12 = objc_alloc((Class)UIImageView);
      [(DSDownloadProgressButton *)self bounds];
      double v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:");
      double v14 = self->_addToLibraryOrDownloadImageView;
      self->_addToLibraryOrDownloadImageView = v13;

      [(UIImageView *)self->_addToLibraryOrDownloadImageView setUserInteractionEnabled:0];
      [(DSDownloadProgressButton *)self addSubview:self->_addToLibraryOrDownloadImageView];
      addToLibraryOrDownloadImageView = self->_addToLibraryOrDownloadImageView;
    }
    [(UIImageView *)addToLibraryOrDownloadImageView setAlpha:1.0];
    [(UIImageView *)self->_addToLibraryOrDownloadImageView setHidden:0];
    double v15 = [(DSDownloadProgressButton *)self _addToLibraryOrDownloadImage];
    if (a4 || v5 || self->_progressType != 1)
    {
      [(UIImageView *)self->_addToLibraryOrDownloadImageView setImage:v15];
    }
    else
    {
      id v16 = [(UIImageView *)self->_addToLibraryOrDownloadImageView _animatesContents];
      [(UIImageView *)self->_addToLibraryOrDownloadImageView _setAnimatesContents:1];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_7148;
      v33[3] = &unk_C648;
      v33[4] = self;
      id v34 = v15;
      +[UIView animateWithDuration:v33 animations:0.25];
      [(UIImageView *)self->_addToLibraryOrDownloadImageView _setAnimatesContents:v16];
    }
    [(DSDownloadProgressButton *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)addToLibraryOrDownloadImageView setHidden:1];
  }
  unsigned int v17 = [(DSDownloadProgressButton *)self _needsFinishedImageViewForProgressType:self->_progressType];
  finishedImageView = self->_finishedImageView;
  if (v17)
  {
    if (!finishedImageView)
    {
      CGRect v19 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      CGRect v20 = self->_finishedImageView;
      self->_finishedImageView = v19;

      [(UIImageView *)self->_finishedImageView setUserInteractionEnabled:0];
      [(DSDownloadProgressButton *)self addSubview:self->_finishedImageView];
      finishedImageView = self->_finishedImageView;
    }
    [(UIImageView *)finishedImageView setAlpha:1.0];
    [(UIImageView *)self->_finishedImageView setHidden:0];
    [(DSDownloadProgressButton *)self setNeedsLayout];
    if (v9) {
      goto LABEL_25;
    }
  }
  else
  {
    [(UIImageView *)finishedImageView setHidden:1];
    if (v9)
    {
LABEL_25:
      [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];
      return;
    }
  }
  if ((self->_progressType & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_25;
  }
  if (!self->_itemOfferButton)
  {
    CGRect v21 = (SUUIItemOfferButton *)objc_alloc_init((Class)SUUIItemOfferButton);
    itemOfferButton = self->_itemOfferButton;
    self->_itemOfferButton = v21;

    v23 = self->_itemOfferButton;
    double v24 = +[UIColor clearColor];
    [(SUUIItemOfferButton *)v23 setBackgroundColor:v24];

    [(SUUIItemOfferButton *)self->_itemOfferButton setBorderColorAlphaMultiplier:0.4];
    [(SUUIItemOfferButton *)self->_itemOfferButton setCenterImageProvider:&stru_C688];
    [(SUUIItemOfferButton *)self->_itemOfferButton setFillStyle:2];
    [(SUUIItemOfferButton *)self->_itemOfferButton setProgressType:2 animated:0];
    [(SUUIItemOfferButton *)self->_itemOfferButton setShowsConfirmationState:0];
    [(SUUIItemOfferButton *)self->_itemOfferButton setUserInteractionEnabled:0];
    [(DSDownloadProgressButton *)self addSubview:self->_itemOfferButton];
  }
  id v25 = [(DSDownloadProgressButton *)self window];

  [(SUUIItemOfferButton *)self->_itemOfferButton setProgress:0 animated:self->_progress];
  [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:0];
  id v26 = self->_itemOfferButton;
  if (v25)
  {
    CGAffineTransformMakeScale(&v32, 0.0, 0.0);
    [(SUUIItemOfferButton *)v26 setTransform:&v32];
    [(UIImageView *)self->_addToLibraryOrDownloadImageView setHidden:0];
    [(DSDownloadProgressButton *)self setNeedsLayout];
    [(DSDownloadProgressButton *)self layoutIfNeeded];
    objc_initWeak((id *)v28, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_721C;
    v31[3] = &unk_C3F8;
    v31[4] = self;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_728C;
    v29[3] = &unk_C6B0;
    objc_copyWeak(&v30, (id *)v28);
    +[UIView animateWithDuration:4 delay:v31 options:v29 animations:0.4 completion:0.0];
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)v28);
  }
  else
  {
    long long v27 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v28[1] = v27;
    v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(SUUIItemOfferButton *)v26 setTransform:v28];
    [(DSDownloadProgressButton *)self setNeedsLayout];
  }
}

- (void)_stopProgressAnimation
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_isAnimatingProgress = 0;
  self->_currentAnimatedProgress = 0.0;
  self->_initialAnimatedProgress = 0.0;
  self->_progressAnimationStartTime = 0.0;
  self->_progressAnimationEndTime = 0.0;
  progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
  self->_progressAnimationTimingFunction = 0;
}

- (BOOL)_usesDrawingForProgressType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && self->_style == 0;
}

- (int64_t)progressType
{
  return self->_progressType;
}

- (double)progress
{
  return self->_progress;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressAnimationTimingFunction, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_finishedImageView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_addToLibraryOrDownloadImageView, 0);
}

@end