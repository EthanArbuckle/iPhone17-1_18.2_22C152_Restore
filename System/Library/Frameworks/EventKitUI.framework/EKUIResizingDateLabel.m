@interface EKUIResizingDateLabel
- (CGSize)intrinsicContentSize;
- (NSDate)date;
- (double)minDateLabelWidth;
- (id)stringForDateThatFits;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
@end

@implementation EKUIResizingDateLabel

- (CGSize)intrinsicContentSize
{
  double v2 = 1000.0;
  double v3 = 1000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)stringForDateThatFits
{
  v29[1] = *MEMORY[0x1E4F143B8];
  [(EKUIResizingDateLabel *)self bounds];
  double Width = CGRectGetWidth(v31);
  v4 = [(EKUIResizingDateLabel *)self date];
  v5 = CUIKLongDayStringForDate();

  uint64_t v6 = *MEMORY[0x1E4FB06F8];
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  v7 = [(EKUIResizingDateLabel *)self font];
  v29[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  [v5 sizeWithAttributes:v8];
  double v10 = v9;

  if (v10 > Width)
  {
    v11 = [(EKUIResizingDateLabel *)self date];
    v12 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();

    uint64_t v26 = v6;
    v13 = [(EKUIResizingDateLabel *)self font];
    v27 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v12 sizeWithAttributes:v14];
    double v16 = v15;

    if (v16 > Width)
    {
      v17 = [(EKUIResizingDateLabel *)self date];
      v5 = CUIKStringForDateWithCommaAndYear();

      uint64_t v24 = v6;
      v18 = [(EKUIResizingDateLabel *)self font];
      v25 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v5 sizeWithAttributes:v19];
      double v21 = v20;

      if (v21 <= Width) {
        goto LABEL_6;
      }
      v22 = [(EKUIResizingDateLabel *)self date];
      v12 = CUIKShortStringForDay();
    }
    v5 = v12;
  }
LABEL_6:

  return v5;
}

- (double)minDateLabelWidth
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(EKUIResizingDateLabel *)self date];
  v4 = CUIKShortStringForDay();

  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  v5 = [(EKUIResizingDateLabel *)self font];
  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v4 sizeWithAttributes:v6];
  double v8 = v7;

  return v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIResizingDateLabel;
  [(EKUIResizingDateLabel *)&v4 layoutSubviews];
  double v3 = [(EKUIResizingDateLabel *)self stringForDateThatFits];
  [(EKUIResizingDateLabel *)self setText:v3];
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 800, 1);
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end