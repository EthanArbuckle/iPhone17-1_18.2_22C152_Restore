@interface WeekAllDayLabelAccessibilityElement
- (CGRect)accessibilityFrame;
- (UIView)allDayView;
- (unint64_t)dayIndex;
- (void)setAllDayView:(id)a3;
- (void)setDayIndex:(unint64_t)a3;
@end

@implementation WeekAllDayLabelAccessibilityElement

- (CGRect)accessibilityFrame
{
  v3 = [(WeekAllDayLabelAccessibilityElement *)self allDayView];
  v4 = [v3 safeValueForKey:@"_dayWidth"];
  [v4 doubleValue];

  v5 = [v3 safeValueForKey:@"bounds"];
  [v5 CGRectValue];

  v6 = [v3 safeValueForKey:@"firstEventYOffset"];
  [v6 doubleValue];

  [(WeekAllDayLabelAccessibilityElement *)self dayIndex];
  UIAccessibilityFrameForBounds();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)dayIndex
{
  return self->_dayIndex;
}

- (void)setDayIndex:(unint64_t)a3
{
  self->_dayIndex = a3;
}

- (UIView)allDayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allDayView);

  return (UIView *)WeakRetained;
}

- (void)setAllDayView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end