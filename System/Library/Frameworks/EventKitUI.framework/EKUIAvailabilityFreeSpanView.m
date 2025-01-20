@interface EKUIAvailabilityFreeSpanView
- (EKUIAvailabilityFreeSpanView)initWithFrame:(CGRect)a3 andColor:(id)a4 startDate:(id)a5 endDate:(id)a6 isFreeSpan:(BOOL)a7;
- (NSDate)endDate;
- (NSDate)startDate;
- (UIColor)borderColor;
- (void)drawRect:(CGRect)a3;
- (void)setBorderColor:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation EKUIAvailabilityFreeSpanView

- (EKUIAvailabilityFreeSpanView)initWithFrame:(CGRect)a3 andColor:(id)a4 startDate:(id)a5 endDate:(id)a6 isFreeSpan:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EKUIAvailabilityFreeSpanView;
  v18 = -[EKUIAvailabilityFreeSpanView initWithFrame:](&v32, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a5);
    objc_storeStrong((id *)&v19->_endDate, a6);
    v20 = [(EKUIAvailabilityFreeSpanView *)v19 traitCollection];
    [v20 userInterfaceStyle];
    v21 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
    v22 = v21;
    if (v7)
    {
      v23 = [v21 colorWithAlphaComponent:0.25];
      [(EKUIAvailabilityFreeSpanView *)v19 setBackgroundColor:v23];

      [(EKUIAvailabilityFreeSpanView *)v19 setBorderColor:v15];
    }
    else
    {
      [(EKUIAvailabilityFreeSpanView *)v19 setBackgroundColor:v21];

      uint64_t v24 = [v15 CGColor];
      v25 = [(EKUIAvailabilityFreeSpanView *)v19 layer];
      [v25 setBorderColor:v24];

      v26 = [(EKUIAvailabilityFreeSpanView *)v19 layer];
      [v26 setBorderWidth:1.5];
    }
  }
  +[EKUIAvailabilityRowView cornerRadius];
  double v28 = v27;
  v29 = [(EKUIAvailabilityFreeSpanView *)v19 layer];
  [v29 setCornerRadius:v28];

  v30 = [(EKUIAvailabilityFreeSpanView *)v19 layer];
  [v30 setMasksToBounds:1];

  return v19;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8 = [(EKUIAvailabilityFreeSpanView *)self borderColor];

  if (v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    long long v14 = xmmword_1B413AAD0;
    CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)&v14, 2uLL);
    id v10 = [(EKUIAvailabilityFreeSpanView *)self borderColor];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v10 CGColor]);

    CGContextBeginPath(CurrentContext);
    +[EKUIAvailabilityRowView cornerRadius];
    if (v11 + v11 <= width + -1.0) {
      double v12 = v11;
    }
    else {
      double v12 = (width + -1.0) * 0.5;
    }
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    CGContextAddPath(CurrentContext, (CGPathRef)[v13 CGPath]);

    CGContextDrawPath(CurrentContext, kCGPathStroke);
  }
}

- (UIColor)borderColor
{
  return (UIColor *)objc_getProperty(self, a2, 408, 1);
}

- (void)setBorderColor:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 416, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end