@interface HUDayOfWeekButton
- (NSString)dayOfWeek;
- (void)layoutSubviews;
- (void)setDayOfWeek:(id)a3;
@end

@implementation HUDayOfWeekButton

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUDayOfWeekButton;
  [(HUDayOfWeekButton *)&v5 layoutSubviews];
  [(HUDayOfWeekButton *)self bounds];
  CGFloat v3 = CGRectGetWidth(v6) * 0.5;
  v4 = [(HUDayOfWeekButton *)self layer];
  [v4 setCornerRadius:v3];
}

- (NSString)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(id)a3
{
}

- (void).cxx_destruct
{
}

@end