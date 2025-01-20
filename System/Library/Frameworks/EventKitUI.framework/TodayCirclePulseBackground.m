@interface TodayCirclePulseBackground
- (BOOL)usesRoundedRectInsteadOfCircle;
- (TodayCirclePulseBackground)initWithFrame:(CGRect)a3;
- (double)roundedRectCornerRadius;
- (void)drawRect:(CGRect)a3;
- (void)setRoundedRectCornerRadius:(double)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
@end

@implementation TodayCirclePulseBackground

- (TodayCirclePulseBackground)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TodayCirclePulseBackground;
  result = -[TodayCirclePulseBackground initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_roundedRectCornerRadius = 8.0;
  }
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v5 = CurrentContext;
    v6 = CalendarAppTintColor();
    [v6 setFill];

    if ([(TodayCirclePulseBackground *)self usesRoundedRectInsteadOfCircle])
    {
      v7 = (void *)MEMORY[0x1E4FB14C0];
      [(TodayCirclePulseBackground *)self bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [(TodayCirclePulseBackground *)self roundedRectCornerRadius];
      v17 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16);
      [v17 fill];
    }
    else
    {
      [(TodayCirclePulseBackground *)self bounds];
      CGContextFillEllipseInRect(v5, v19);
    }
    CGContextFlush(v5);
  }
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (double)roundedRectCornerRadius
{
  return self->_roundedRectCornerRadius;
}

- (void)setRoundedRectCornerRadius:(double)a3
{
  self->_roundedRectCornerRadius = a3;
}

@end