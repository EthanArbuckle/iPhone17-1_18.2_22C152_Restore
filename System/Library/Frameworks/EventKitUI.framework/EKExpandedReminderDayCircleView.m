@interface EKExpandedReminderDayCircleView
- (EKExpandedReminderDayCircleView)initWithFrame:(CGRect)a3;
- (UIColor)circleColor;
- (void)drawRect:(CGRect)a3;
- (void)setCircleColor:(id)a3;
@end

@implementation EKExpandedReminderDayCircleView

- (EKExpandedReminderDayCircleView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKExpandedReminderDayCircleView;
  v3 = -[EKExpandedReminderDayCircleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(EKExpandedReminderDayCircleView *)v3 setBackgroundColor:v4];

    uint64_t v5 = CalendarAppCircleNonTodayBGColor();
    circleColor = v3->_circleColor;
    v3->_circleColor = (UIColor *)v5;
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(UIColor *)self->_circleColor set];
  [(EKExpandedReminderDayCircleView *)self bounds];

  CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v5);
}

- (UIColor)circleColor
{
  return self->_circleColor;
}

- (void)setCircleColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end