@interface HUCalendarScrubberCollectionViewCell
- (BOOL)isEnabled;
- (HUCalendarScrubberCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSString)dateString;
- (NSString)dayOfWeekString;
- (UILabel)dateLabel;
- (UILabel)dayMonthLabel;
- (UIView)circleView;
- (void)layoutSubviews;
- (void)setCircleView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDateString:(id)a3;
- (void)setDayMonthLabel:(id)a3;
- (void)setDayOfWeekString:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HUCalendarScrubberCollectionViewCell

- (HUCalendarScrubberCollectionViewCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  v3 = -[HUCalendarScrubberCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    circleView = v3->_circleView;
    v3->_circleView = (UIView *)v9;

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v3->_circleView setBackgroundColor:v11];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v12;

    [(UILabel *)v3->_dateLabel setTextAlignment:1];
    v14 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:14.0];
    [(UILabel *)v3->_dateLabel setFont:v14];

    [(UILabel *)v3->_dateLabel setAdjustsFontForContentSizeCategory:0];
    v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v3->_dateLabel setTextColor:v15];

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    dayMonthLabel = v3->_dayMonthLabel;
    v3->_dayMonthLabel = (UILabel *)v16;

    v18 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:14.0];
    [(UILabel *)v3->_dayMonthLabel setFont:v18];

    [(UILabel *)v3->_dayMonthLabel setAdjustsFontForContentSizeCategory:0];
    [(UILabel *)v3->_dayMonthLabel setTextAlignment:1];
    v19 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v3->_dayMonthLabel setTextColor:v19];

    [(HUCalendarScrubberCollectionViewCell *)v3 addSubview:v3->_circleView];
    [(HUCalendarScrubberCollectionViewCell *)v3 addSubview:v3->_dateLabel];
    [(HUCalendarScrubberCollectionViewCell *)v3 addSubview:v3->_dayMonthLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  [(HUCalendarScrubberCollectionViewCell *)&v17 layoutSubviews];
  v3 = [(HUCalendarScrubberCollectionViewCell *)self circleView];
  id v4 = [(HUCalendarScrubberCollectionViewCell *)self dateLabel];
  double v5 = [(HUCalendarScrubberCollectionViewCell *)self dayMonthLabel];
  [(HUCalendarScrubberCollectionViewCell *)self bounds];
  double v7 = v6;
  double v8 = v6 * 0.5;
  double v10 = v9 - v6 + -4.0;
  objc_msgSend(v3, "setFrame:", 0.0, v10, v6, v6);
  v11 = [v3 layer];
  [v11 setCornerRadius:v8];

  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7, 16.0);
  [v3 center];
  objc_msgSend(v4, "setCenter:");
  uint64_t v12 = [(HUCalendarScrubberCollectionViewCell *)self dayMonthLabel];
  [v12 intrinsicContentSize];
  double v14 = v13;

  objc_msgSend(v5, "setFrame:", 0.0, v10 + -16.0, v14, 16.0);
  [v4 center];
  double v16 = v15;
  [v5 center];
  [v5 setCenter:v16];
}

- (void)setDateString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_dateString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_dateString, a3);
    double v5 = [(HUCalendarScrubberCollectionViewCell *)self dateLabel];
    [v5 setText:v6];
  }
}

- (void)setDayOfWeekString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_dayOfWeekString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_dayOfWeekString, a3);
    double v5 = [(HUCalendarScrubberCollectionViewCell *)self dayMonthLabel];
    [v5 setText:v7];

    id v6 = [(HUCalendarScrubberCollectionViewCell *)self dayMonthLabel];
    [v6 sizeToFit];
  }
}

- (void)setSelected:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  -[HUCalendarScrubberCollectionViewCell setSelected:](&v15, sel_setSelected_);
  double v5 = [(HUCalendarScrubberCollectionViewCell *)self circleView];
  if (a3)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [v5 setBackgroundColor:v6];

    [v5 setAlpha:0.0];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v14, &v13, 0.1, 0.1);
    CGAffineTransform v12 = v14;
    [v5 setTransform:&v12];
    double v8 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__HUCalendarScrubberCollectionViewCell_setSelected___block_invoke;
    v10[3] = &unk_1E6386018;
    id v11 = v5;
    [v8 animateWithDuration:65538 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:0.35 options:0.0 animations:0.5 completion:0.7];
    double v9 = v11;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F428B8] clearColor];
    [v5 setBackgroundColor:v9];
  }
}

uint64_t __52__HUCalendarScrubberCollectionViewCell_setSelected___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  -[HUCalendarScrubberCollectionViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  if (v3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.319999993;
  }
  id v6 = [(HUCalendarScrubberCollectionViewCell *)self dateLabel];
  [v6 setAlpha:v5];

  id v7 = [(HUCalendarScrubberCollectionViewCell *)self dayMonthLabel];
  [v7 setAlpha:v5];
}

- (NSString)dayOfWeekString
{
  return self->_dayOfWeekString;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)dayMonthLabel
{
  return self->_dayMonthLabel;
}

- (void)setDayMonthLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayMonthLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_dateString, 0);

  objc_storeStrong((id *)&self->_dayOfWeekString, 0);
}

@end