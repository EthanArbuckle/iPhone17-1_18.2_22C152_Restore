@interface VMDetailSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityConstraintsEnabled;
- (BOOL)isScrubbing;
- (CGRect)thumbHitRect;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (MPDetailScrubController)detailScrubController;
- (UIColor)trackColor;
- (UIImageView)thumbImageView;
- (VMDetailSlider)init;
- (VMDetailSlider)initWithCoder:(id)a3;
- (VMDetailSlider)initWithFrame:(CGRect)a3;
- (VMDetailSliderDelegate)delegate;
- (double)elapsedTime;
- (double)maximumTime;
- (double)minimumTime;
- (id)createThumbView;
- (id)maxTrackColor;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)commonInit;
- (void)detailScrubController:(id)a3 didChangeValue:(float)a4;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAccessibilityConstraintsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 animated:(BOOL)a4;
- (void)setElapsedTime:(double)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)setMaximumTime:(double)a3;
- (void)setThumbImageView:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMaximumTrackImage;
- (void)updateMinimumTrackImage;
- (void)updateThumbImage;
- (void)updateTrackImages;
@end

@implementation VMDetailSlider

- (VMDetailSlider)init
{
  return -[VMDetailSlider initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (VMDetailSlider)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VMDetailSlider;
  v3 = [(VMDetailSlider *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(VMDetailSlider *)v3 commonInit];
  }
  return v4;
}

- (VMDetailSlider)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VMDetailSlider;
  v3 = -[VMDetailSlider initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VMDetailSlider *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = [(VMDetailSlider *)self traitCollection];
  self->_accessibilityConstraintsEnabled = [v3 isPreferredContentSizeCategoryAccessible];

  v4 = (MPDetailScrubController *)[objc_alloc((Class)MPDetailScrubController) initWithScrubbingControl:self];
  detailScrubController = self->_detailScrubController;
  self->_detailScrubController = v4;

  [(MPDetailScrubController *)self->_detailScrubController setDelegate:self];
  [(MPDetailScrubController *)self->_detailScrubController setDetailedScrubbingEnabled:0];
  self->_minimumTime = 0.0;
  [(VMDetailSlider *)self setDeliversTouchesForGesturesToSuperview:0];
  [(VMDetailSlider *)self updateThumbImage];

  [(VMDetailSlider *)self updateTrackImages];
}

- (void)setMaximumTime:(double)a3
{
  v5 = [(VMDetailSlider *)self detailScrubController];
  unsigned __int8 v6 = [v5 isTracking];

  if ((v6 & 1) == 0 && vabdd_f64(self->_maximumTime, a3) > 2.22044605e-16)
  {
    self->_maximumTime = a3;
    id v7 = [(VMDetailSlider *)self detailScrubController];
    [v7 setDuration:a3];
  }
}

- (void)setElapsedTime:(double)a3
{
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5
    || ([(VMDetailSlider *)self detailScrubController],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 isTracking],
        v8,
        (v9 & 1) == 0))
  {
    double v10 = a3;
    if (vabdd_f64(self->_elapsedTime, a3) > 2.22044605e-16)
    {
      [(VMDetailSlider *)self minimumTime];
      double v12 = v11;
      [(VMDetailSlider *)self maximumTime];
      if (v12 >= v10) {
        double v14 = v12;
      }
      else {
        double v14 = v10;
      }
      if (v14 >= v13) {
        double v14 = v13;
      }
      double v15 = v14 / v13;
      self->_elapsedTime = v14;
      *(float *)&double v15 = v15;
      [(VMDetailSlider *)self setValue:v5 animated:v15];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(VMDetailSlider *)self thumbHitRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v6 locationInView:self];
  v24.x = v16;
  v24.y = v17;
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  if (CGRectContainsPoint(v25, v24))
  {
    v18 = [(VMDetailSlider *)self detailScrubController];
    unsigned __int8 v19 = [v18 beginTrackingWithTouch:v6 withEvent:v7];

    v20 = [(VMDetailSlider *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(VMDetailSlider *)self delegate];
      [v22 detailSliderTrackingDidBegin:self];
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v11 = a3;
  v4 = [(VMDetailSlider *)self detailScrubController];
  unsigned int v5 = [v4 isTracking];

  if (v5)
  {
    id v6 = [(VMDetailSlider *)self detailScrubController];
    [v6 cancelTrackingWithEvent:v11];

    id v7 = [(VMDetailSlider *)self currentThumbImage];
    uint64_t v8 = [(VMDetailSlider *)self thumbImageView];
    [(id)v8 setImage:v7];

    CGFloat v9 = [(VMDetailSlider *)self delegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      double v10 = [(VMDetailSlider *)self delegate];
      [v10 detailSliderTrackingDidCancel:self];
    }
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(VMDetailSlider *)self isContinuous]) {
    [(VMDetailSlider *)self sendActionsForControlEvents:4096];
  }
  uint64_t v8 = [(VMDetailSlider *)self detailScrubController];
  unsigned __int8 v9 = [v8 continueTrackingWithTouch:v7 withEvent:v6];

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(VMDetailSlider *)self detailScrubController];
  unsigned int v8 = [v7 isTracking];

  if (v8)
  {
    unsigned __int8 v9 = [(VMDetailSlider *)self detailScrubController];
    [v9 endTrackingWithTouch:v14 withEvent:v6];

    double v10 = [(VMDetailSlider *)self currentThumbImage];
    uint64_t v11 = [(VMDetailSlider *)self thumbImageView];
    [(id)v11 setImage:v10];

    double v12 = [(VMDetailSlider *)self delegate];
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if (v11)
    {
      CGFloat v13 = [(VMDetailSlider *)self delegate];
      [v13 detailSliderTrackingDidEnd:self];
    }
  }
}

- (id)createThumbView
{
  v5.receiver = self;
  v5.super_class = (Class)VMDetailSlider;
  id v3 = [(VMDetailSlider *)&v5 createThumbView];
  [(VMDetailSlider *)self setThumbImageView:v3];

  [(VMDetailSlider *)self thumbImageView];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider setValue:animated:](&v4, "setValue:animated:", a4, *(double *)&a3, 0.0);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(VMDetailSlider *)self isAccessibilityConstraintsEnabled]) {
    double v8 = 6.0;
  }
  else {
    double v8 = 3.0;
  }
  v13.receiver = self;
  v13.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider trackRectForBounds:](&v13, "trackRectForBounds:", x, y, width, height);
  double v12 = (height - v8) * 0.5;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v12;
  result.origin.double x = v9;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  if ([(VMDetailSlider *)self isAccessibilityConstraintsEnabled]) {
    double v12 = 12.0;
  }
  else {
    double v12 = 6.0;
  }
  v20.receiver = self;
  v20.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider thumbRectForBounds:trackRect:value:](&v20, "thumbRectForBounds:trackRect:value:", v10, v9, v8, v7, x, y, width, height, LODWORD(a5));
  double v16 = (v7 - v12) * 0.5;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v16;
  result.origin.double x = v13;
  return result;
}

- (CGRect)thumbHitRect
{
  [(VMDetailSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VMDetailSlider *)self bounds];
  -[VMDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(VMDetailSlider *)self value];
  LODWORD(v24) = v19;
  -[VMDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v24);

  return CGRectInset(*(CGRect *)&v20, -15.0, -15.0);
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  [(VMDetailSlider *)self setElapsedTime:0 animated:1 force:a4];
  double v5 = [(VMDetailSlider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(VMDetailSlider *)self delegate];
    [(VMDetailSlider *)self elapsedTime];
    [v7 detailSlider:self didChangeElapsedTime:];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VMDetailSlider;
  [(VMDetailSlider *)&v10 traitCollectionDidChange:v4];
  double v5 = [(VMDetailSlider *)self traitCollection];
  char v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    id v8 = [v5 isPreferredContentSizeCategoryAccessible];
    if (v8 != [(VMDetailSlider *)self isAccessibilityConstraintsEnabled])
    {
      [(VMDetailSlider *)self setAccessibilityConstraintsEnabled:v8];
      [(VMDetailSlider *)self updateThumbImage];
      [(VMDetailSlider *)self updateTrackImages];
      [(VMDetailSlider *)self setNeedsLayout];
    }
  }
  id v9 = [v5 userInterfaceStyle];
  if (v9 != [v4 userInterfaceStyle] && objc_msgSend(v5, "userInterfaceStyle"))
  {
    [(VMDetailSlider *)self updateThumbImage];
    [(VMDetailSlider *)self updateTrackImages];
    [(VMDetailSlider *)self setNeedsLayout];
  }
}

- (void)updateThumbImage
{
  double v3 = +[UIColor systemGrayColor];
  id v10 = [(VMDetailSlider *)self _accessibilityHigherContrastTintColorForColor:v3];

  if ([(VMDetailSlider *)self isAccessibilityConstraintsEnabled]) {
    double v4 = 12.0;
  }
  else {
    double v4 = 6.0;
  }
  double v5 = +[UIScreen mainScreen];
  [v5 scale];
  CGFloat v7 = v6;
  v12.double width = v4;
  v12.double height = v4;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v7);

  [v10 setFill];
  id v8 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v4, v4, v4 / 6.0 * 3.0);
  [v8 fill];

  id v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(VMDetailSlider *)self setThumbImage:v9 forState:0];
}

- (void)updateTrackImages
{
  [(VMDetailSlider *)self updateMinimumTrackImage];

  [(VMDetailSlider *)self updateMaximumTrackImage];
}

- (void)updateMaximumTrackImage
{
  id v10 = [(VMDetailSlider *)self maxTrackColor];
  if ([(VMDetailSlider *)self isAccessibilityConstraintsEnabled]) {
    double v3 = 6.0;
  }
  else {
    double v3 = 3.0;
  }
  double v4 = +[UIScreen mainScreen];
  [v4 scale];
  CGFloat v6 = v5;
  v12.double width = v3;
  v12.double height = v3;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v6);

  [v10 setFill];
  CGFloat v7 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v3, v3 / 3.0);
  [v7 fill];

  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  id v9 = [v8 resizableImageWithCapInsets:v3 / 3.0, v3 / 3.0, v3 / 3.0, v3 / 3.0];
  [(VMDetailSlider *)self setMaximumTrackImage:v9 forState:0];
}

- (void)updateMinimumTrackImage
{
  id v10 = [(VMDetailSlider *)self trackColor];
  if ([(VMDetailSlider *)self isAccessibilityConstraintsEnabled]) {
    double v3 = 6.0;
  }
  else {
    double v3 = 3.0;
  }
  double v4 = +[UIScreen mainScreen];
  [v4 scale];
  CGFloat v6 = v5;
  v12.double width = v3;
  v12.double height = v3;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v6);

  [v10 setFill];
  CGFloat v7 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v3, v3 / 3.0);
  [v7 fill];

  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  id v9 = [v8 resizableImageWithCapInsets:v3 / 3.0, v3 / 3.0, v3 / 3.0, v3 / 3.0];
  [(VMDetailSlider *)self setMinimumTrackImage:v9 forState:0];
}

- (UIColor)trackColor
{
  return +[UIColor systemGrayColor];
}

- (id)maxTrackColor
{
  v2 = [(VMDetailSlider *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];
  double v4 = 0.0;
  if (v3 == (id)2) {
    double v4 = 1.0;
  }
  double v5 = +[UIColor colorWithWhite:v4 alpha:0.1];

  return v5;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VMDetailSlider;
  [(VMDetailSlider *)&v3 tintColorDidChange];
  [(VMDetailSlider *)self updateThumbImage];
}

- (VMDetailSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMDetailSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)maximumTime
{
  return self->_maximumTime;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (BOOL)isAccessibilityConstraintsEnabled
{
  return self->_accessibilityConstraintsEnabled;
}

- (void)setAccessibilityConstraintsEnabled:(BOOL)a3
{
  self->_accessibilityConstraintsEnabled = a3;
}

- (double)minimumTime
{
  return self->_minimumTime;
}

- (UIImageView)thumbImageView
{
  return self->_thumbImageView;
}

- (void)setThumbImageView:(id)a3
{
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (MPDetailScrubController)detailScrubController
{
  return self->_detailScrubController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailScrubController, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end