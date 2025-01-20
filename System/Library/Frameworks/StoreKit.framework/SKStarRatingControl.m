@interface SKStarRatingControl
- (BOOL)_alwaysHandleScrollerMouseEvent;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canHandleSwipes;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_foregroundImageClipBounds;
- (CGRect)hitRect;
- (NSString)explanationText;
- (SKStarRatingControl)initWithBackgroundImage:(id)a3 foregroundImage:(id)a4;
- (double)starWidth;
- (float)value;
- (id)_newExplanationLabel;
- (void)_updateValueForPoint:(CGPoint)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setExplanationText:(id)a3;
- (void)setHitPadding:(CGSize)a3;
- (void)setStarWidth:(double)a3;
- (void)setValue:(float)a3;
- (void)sizeToFit;
@end

@implementation SKStarRatingControl

- (SKStarRatingControl)initWithBackgroundImage:(id)a3 foregroundImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SKStarRatingControl;
  v8 = [(SKStarRatingControl *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    backgroundImageView = v8->_backgroundImageView;
    v8->_backgroundImageView = (UIImageView *)v9;

    v11 = v8->_backgroundImageView;
    [(SKStarRatingControl *)v8 bounds];
    -[UIImageView setFrame:](v11, "setFrame:");
    [(UIImageView *)v8->_backgroundImageView setUserInteractionEnabled:0];
    [(UIImageView *)v8->_backgroundImageView sizeToFit];
    [(SKStarRatingControl *)v8 addSubview:v8->_backgroundImageView];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    foregroundImageView = v8->_foregroundImageView;
    v8->_foregroundImageView = (UIImageView *)v12;

    [(UIImageView *)v8->_foregroundImageView setClipsToBounds:1];
    [(UIImageView *)v8->_foregroundImageView setUserInteractionEnabled:0];
    [(UIImageView *)v8->_foregroundImageView sizeToFit];
    [(SKStarRatingControl *)v8 addSubview:v8->_foregroundImageView];
  }

  return v8;
}

- (void)layoutSubviews
{
  [(SKStarRatingControl *)self bounds];
  double v4 = v3;
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:");
  if ([(SKStarRatingControl *)self effectiveUserInterfaceLayoutDirection] == 1) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 7;
  }
  [(UIImageView *)self->_foregroundImageView setContentMode:v5];
  foregroundImageView = self->_foregroundImageView;
  [(SKStarRatingControl *)self _foregroundImageClipBounds];
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  explanationLabel = self->_explanationLabel;
  if (explanationLabel)
  {
    [(UILabel *)explanationLabel frame];
    uint64_t v9 = self->_explanationLabel;
    double v10 = floor((v4 - v8) * 0.5);
    -[UILabel setFrame:](v9, "setFrame:", v10, 24.0);
  }
}

- (void)sizeToFit
{
  [(SKStarRatingControl *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_backgroundImageView bounds];

  -[SKStarRatingControl setFrame:](self, "setFrame:", v4, v6);
}

- (NSString)explanationText
{
  return [(UILabel *)self->_explanationLabel text];
}

- (void)setHitPadding:(CGSize)a3
{
  self->_hitPadding = a3;
}

- (void)setExplanationText:(id)a3
{
  id v11 = a3;
  double v4 = [(UILabel *)self->_explanationLabel text];
  char v5 = [v4 isEqualToString:v11];

  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    explanationLabel = self->_explanationLabel;
    if (v11)
    {
      if (!explanationLabel)
      {
        double v8 = [(SKStarRatingControl *)self _newExplanationLabel];
        uint64_t v9 = self->_explanationLabel;
        self->_explanationLabel = v8;

        [(SKStarRatingControl *)self addSubview:self->_explanationLabel];
        id v6 = v11;
        explanationLabel = self->_explanationLabel;
      }
      [(UILabel *)explanationLabel setText:v6];
      [(UILabel *)self->_explanationLabel sizeToFit];
    }
    else
    {
      [(UILabel *)explanationLabel removeFromSuperview];
      double v10 = self->_explanationLabel;
      self->_explanationLabel = 0;
    }
    [(SKStarRatingControl *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setValue:(float)a3
{
  self->_value = a3;
  [(SKStarRatingControl *)self setNeedsLayout];
}

- (float)value
{
  return self->_value;
}

- (BOOL)_alwaysHandleScrollerMouseEvent
{
  return 1;
}

- (BOOL)canHandleSwipes
{
  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_trackingStartPoint = &self->_trackingStartPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingStartPoint->x = v5;
  p_trackingStartPoint->y = v6;
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a3, "locationInView:", self, a4);
  double v6 = v5 - self->_trackingStartPoint.y;
  self->_trackingLastPoint.x = v7;
  self->_trackingLastPoint.y = v5;
  if (v6 <= 40.0)
  {
    -[SKStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
    [(SKStarRatingControl *)self sendActionsForControlEvents:4096];
  }
  return v6 <= 40.0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_trackingLastPoint = &self->_trackingLastPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingLastPoint->x = v6;
  p_trackingLastPoint->y = v7;
  -[SKStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
  [(SKStarRatingControl *)self sendActionsForControlEvents:4096];

  [(SKStarRatingControl *)self sendActionsForControlEvents:64];
}

- (CGRect)hitRect
{
  [(SKStarRatingControl *)self bounds];
  double v7 = -self->_hitPadding.width;
  double v8 = -self->_hitPadding.height;

  return CGRectInset(*(CGRect *)&v3, v7, v8);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SKStarRatingControl *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)_foregroundImageClipBounds
{
  [(SKStarRatingControl *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = v7 * self->_value;
  if ([(SKStarRatingControl *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v16.origin.CGFloat x = v4;
    v16.origin.CGFloat y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    double v4 = CGRectGetMaxX(v16) - v11;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v11;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)_newExplanationLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  double v4 = [MEMORY[0x1E4FB1798] systemFontOfSize:11.0];
  [v2 setFont:v4];

  double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v2 setTextColor:v5];

  return v2;
}

- (void)_updateValueForPoint:(CGPoint)a3
{
  double x = a3.x;
  [(SKStarRatingControl *)self starWidth];
  double v6 = v5;
  [(SKStarRatingControl *)self bounds];
  double v8 = ceil((v7 - v6 * 5.0) * 0.25);
  double v9 = v6 + v8;
  double v10 = -(v8 - v9 * 5.0);
  if (x <= v9 * 5.0) {
    double v10 = x;
  }
  if (v10 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = 0.0;
  }
  if ([(SKStarRatingControl *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    [(SKStarRatingControl *)self bounds];
    double v11 = CGRectGetMaxX(v14) - v11;
  }
  double v12 = v11 / v9;
  *(float *)&double v12 = (float)vcvtpd_u64_f64(v11 / v9) / 5.0;

  [(SKStarRatingControl *)self setValue:v12];
}

- (double)starWidth
{
  return self->_starWidth;
}

- (void)setStarWidth:(double)a3
{
  self->_starWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);

  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end