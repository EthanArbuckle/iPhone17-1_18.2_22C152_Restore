@interface ZWTVSlider
- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CALayer)defaultTickLayer;
- (CAShapeLayer)filledTrackLayer;
- (CAShapeLayer)grabberLayer;
- (CAShapeLayer)unfilledTrackLayer;
- (ZWTVSlider)initWithFrame:(CGRect)a3;
- (double)maximumValue;
- (double)minimumValue;
- (double)value;
- (unint64_t)accessibilityTraits;
- (void)_handlePan:(id)a3;
- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3;
- (void)_updateSliderPosition;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setDefaultTickLayer:(id)a3;
- (void)setFilledTrackLayer:(id)a3;
- (void)setGrabberLayer:(id)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setUnfilledTrackLayer:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation ZWTVSlider

- (ZWTVSlider)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ZWTVSlider;
  v3 = -[ZWTVSlider initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_value = 0.5;
    v3->_minimumValue = 0.0;
    v3->_maximumValue = 1.0;
    [(ZWTVSlider *)v3 setClipsToBounds:0];
    v5 = +[CAShapeLayer layer];
    [(ZWTVSlider *)v4 setUnfilledTrackLayer:v5];
    v6 = [(ZWTVSlider *)v4 layer];
    [v6 addSublayer:v5];

    [v5 setLineWidth:8.0];
    [v5 setLineCap:kCALineCapRound];
    v7 = +[CAShapeLayer layer];

    [(ZWTVSlider *)v4 setFilledTrackLayer:v7];
    v8 = [(ZWTVSlider *)v4 layer];
    [v8 addSublayer:v7];

    [v7 setLineWidth:8.0];
    [v7 setLineCap:kCALineCapRound];
    v9 = +[CAShapeLayer layer];
    [(ZWTVSlider *)v4 setGrabberLayer:v9];
    v10 = [(ZWTVSlider *)v4 layer];
    [v10 addSublayer:v9];

    v11 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 30.0, 30.0);
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    id v12 = v11;
    objc_msgSend(v9, "setPath:", objc_msgSend(v12, "CGPath"));
    id v13 = +[UIColor whiteColor];
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [v9 setShadowRadius:30.0];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 25.0);
    LODWORD(v14) = 0.25;
    [v9 setShadowOpacity:v14];
    id v15 = +[UIColor blackColor];
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v15, "CGColor"));

    v16 = [(ZWTVSlider *)v4 traitCollection];
    -[ZWTVSlider _updateColorsForUserInterfaceStyle:](v4, "_updateColorsForUserInterfaceStyle:", [v16 userInterfaceStyle]);

    [(ZWTVSlider *)v4 setUserInteractionEnabled:1];
    id v17 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v4 action:"_handlePan:"];
    [(ZWTVSlider *)v4 addGestureRecognizer:v17];
  }
  return v4;
}

- (void)layoutSubviews
{
  unsigned int v3 = [(ZWTVSlider *)self _shouldReverseLayoutDirection];
  v28.receiver = self;
  v28.super_class = (Class)ZWTVSlider;
  [(ZWTVSlider *)&v28 layoutSubviews];
  [(ZWTVSlider *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = +[UIBezierPath bezierPath];
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  if (v3)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v13);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    double MinX = CGRectGetMinX(v29);
  }
  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v13);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    double MinX = CGRectGetMaxX(v30);
  }
  double v19 = MinX;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  objc_msgSend(v12, "moveToPoint:", MaxX, CGRectGetMidY(v31));
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  objc_msgSend(v12, "addLineToPoint:", v19, CGRectGetMidY(v32));
  v20 = [(ZWTVSlider *)self unfilledTrackLayer];
  objc_msgSend(v20, "setFrame:", v5, v7, v9, v11);

  id v21 = v12;
  id v22 = [v21 CGPath];
  v23 = [(ZWTVSlider *)self unfilledTrackLayer];
  [v23 setPath:v22];

  v24 = [(ZWTVSlider *)self filledTrackLayer];
  objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);

  id v25 = v21;
  id v26 = [v25 CGPath];
  v27 = [(ZWTVSlider *)self filledTrackLayer];
  [v27 setPath:v26];

  [(ZWTVSlider *)self _updateSliderPosition];
}

- (void)_updateSliderPosition
{
  unsigned int v3 = [(ZWTVSlider *)self _shouldReverseLayoutDirection];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(ZWTVSlider *)self value];
  double v5 = (v4 - self->_minimumValue) / (self->_maximumValue - self->_minimumValue);
  double v6 = [(ZWTVSlider *)self filledTrackLayer];
  [v6 setStrokeEnd:v5];

  double v7 = [(ZWTVSlider *)self unfilledTrackLayer];
  [v7 setStrokeStart:v5];

  [(ZWTVSlider *)self bounds];
  if (v3) {
    double v12 = v10 - v10 * v5;
  }
  else {
    double v12 = v5 * v10;
  }
  double MidY = CGRectGetMidY(*(CGRect *)&v8);
  double v14 = [(ZWTVSlider *)self grabberLayer];
  objc_msgSend(v14, "setPosition:", v12, MidY);

  +[CATransaction commit];
}

- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    id v4 = +[UIColor systemGrayColor];
    id v5 = [v4 CGColor];
    double v6 = [(ZWTVSlider *)self unfilledTrackLayer];
    [v6 setStrokeColor:v5];

    id v7 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    id v8 = [v7 CGColor];
    double v9 = [(ZWTVSlider *)self defaultTickLayer];
    [v9 setBackgroundColor:v8];

    id v12 = +[UIColor whiteColor];
    id v10 = [v12 CGColor];
    double v11 = [(ZWTVSlider *)self filledTrackLayer];
    [v11 setStrokeColor:v10];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setValue:(double)a3
{
  [(ZWTVSlider *)self minimumValue];
  if (v5 > a3) {
    a3 = v5;
  }
  [(ZWTVSlider *)self maximumValue];
  if (a3 < v6) {
    double v6 = a3;
  }
  self->_value = v6;

  [(ZWTVSlider *)self _updateSliderPosition];
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
}

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  [(ZWTVSlider *)self setValue:self->_value + 1.0];

  [(ZWTVSlider *)self sendActionsForControlEvents:4096];
}

- (void)accessibilityDecrement
{
  [(ZWTVSlider *)self setValue:self->_value + -1.0];

  [(ZWTVSlider *)self sendActionsForControlEvents:4096];
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  return 1;
}

- (void)_handlePan:(id)a3
{
  id v14 = a3;
  unsigned int v4 = [(ZWTVSlider *)self _shouldReverseLayoutDirection];
  double v5 = (char *)[v14 state];
  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    id v7 = self;
    uint64_t v8 = 0x40000;
  }
  else if (v5 == (unsigned char *)&dword_0 + 2)
  {
    [(ZWTVSlider *)self bounds];
    double v10 = v9;
    [v14 translationInView:self];
    double v12 = v11 / v10;
    double v13 = self->_maximumValue - self->_minimumValue;
    if (v4) {
      double v13 = -v13;
    }
    [(ZWTVSlider *)self setValue:self->_gestureBeganValue + v13 * v12];
    id v7 = self;
    uint64_t v8 = 4096;
  }
  else
  {
    if (v5 != (unsigned char *)&dword_0 + 1) {
      goto LABEL_10;
    }
    [(ZWTVSlider *)self value];
    self->_gestureBeganValue = v6;
    id v7 = self;
    uint64_t v8 = 0x10000;
  }
  [(ZWTVSlider *)v7 sendActionsForControlEvents:v8];
LABEL_10:
}

- (double)value
{
  return self->_value;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (CAShapeLayer)filledTrackLayer
{
  return self->_filledTrackLayer;
}

- (void)setFilledTrackLayer:(id)a3
{
}

- (CAShapeLayer)unfilledTrackLayer
{
  return self->_unfilledTrackLayer;
}

- (void)setUnfilledTrackLayer:(id)a3
{
}

- (CAShapeLayer)grabberLayer
{
  return self->_grabberLayer;
}

- (void)setGrabberLayer:(id)a3
{
}

- (CALayer)defaultTickLayer
{
  return self->_defaultTickLayer;
}

- (void)setDefaultTickLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTickLayer, 0);
  objc_storeStrong((id *)&self->_grabberLayer, 0);
  objc_storeStrong((id *)&self->_unfilledTrackLayer, 0);

  objc_storeStrong((id *)&self->_filledTrackLayer, 0);
}

@end