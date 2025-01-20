@interface HKWeekdayHeaderPaletteView
+ (double)preferredHeight;
+ (id)weekdayFont;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3;
- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3 shouldSupportRTL:(BOOL)a4;
- (double)_xOriginForMonthViewWithIndex:(int64_t)a3 itemWidth:(double)a4 leftMargin:(double)a5;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKWeekdayHeaderPaletteView

- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3
{
  return -[HKWeekdayHeaderPaletteView initWithFrame:shouldSupportRTL:](self, "initWithFrame:shouldSupportRTL:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3 shouldSupportRTL:(BOOL)a4
{
  BOOL v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKWeekdayHeaderPaletteView;
  v5 = -[HKWeekdayHeaderPaletteView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    weekdayLabels = v5->_weekdayLabels;
    v5->_weekdayLabels = v6;

    -[HKWeekdayHeaderPaletteView setLayoutMargins:](v5, "setLayoutMargins:", 0.0, 5.0, 3.0, 5.0);
    v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v19 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v9 = [v19 veryShortStandaloneWeekdaySymbols];
    uint64_t v10 = [v8 firstWeekday];
    v20 = v8;
    v11 = objc_msgSend(v8, "hk_weekendDays");
    for (uint64_t i = -1; i != 6; ++i)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      uint64_t v14 = [v9 objectAtIndexedSubscript:(v10 + i) % 7];
      [v13 setText:v14];

      v15 = [NSNumber numberWithInteger:(v10 + i) % 7 + 1];
      LOBYTE(v14) = [v11 containsObject:v15];

      if (v14) {
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else {
      v16 = [MEMORY[0x1E4FB1618] labelColor];
      }
      [v13 setTextColor:v16];

      [v13 sizeToFit];
      v17 = v5->_weekdayLabels;
      if (v4) {
        [(NSMutableArray *)v17 insertObject:v13 atIndex:0];
      }
      else {
        [(NSMutableArray *)v17 addObject:v13];
      }
      [(HKWeekdayHeaderPaletteView *)v5 addSubview:v13];
    }
    [(HKWeekdayHeaderPaletteView *)v5 _updateFont];
  }
  return v5;
}

- (void)_updateFont
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_weekdayLabels;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        v8 = objc_msgSend((id)objc_opt_class(), "weekdayFont", (void)v9);
        [v7 setFont:v8];

        [v7 sizeToFit];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)layoutSubviews
{
  for (uint64_t i = 0; i != 7; ++i)
  {
    uint64_t v4 = [(NSMutableArray *)self->_weekdayLabels objectAtIndexedSubscript:i];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    [(HKWeekdayHeaderPaletteView *)self layoutMargins];
    -[HKWeekdayHeaderPaletteView _xOriginForMonthViewWithIndex:itemWidth:leftMargin:](self, "_xOriginForMonthViewWithIndex:itemWidth:leftMargin:", i, v6);
    double v10 = v9;
    [(HKWeekdayHeaderPaletteView *)self layoutMargins];
    double v12 = v11;
    [(HKWeekdayHeaderPaletteView *)self bounds];
    double v14 = v12 + v13 - v8;
    [(HKWeekdayHeaderPaletteView *)self layoutMargins];
    objc_msgSend(v4, "setFrame:", v10, v14 - v15, v6, v8);
  }
}

- (double)_xOriginForMonthViewWithIndex:(int64_t)a3 itemWidth:(double)a4 leftMargin:(double)a5
{
  [(HKWeekdayHeaderPaletteView *)self bounds];
  UIRoundToViewScale();
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() preferredHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

+ (id)weekdayFont
{
  uint64_t v2 = *MEMORY[0x1E4FB2790];
  BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB2790]);
  double v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  if (IsLargerThanSizeCategory)
  {
    double v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v2];
    double v7 = [v4 preferredFontForTextStyle:v5 compatibleWithTraitCollection:v6];
    [v7 _scaledValueForValue:10.0];
    double v9 = v8;
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v6 _scaledValueForValue:10.0];
    double v9 = v10;
  }

  double v11 = (void *)MEMORY[0x1E4FB08E0];
  double v12 = *MEMORY[0x1E4FB09E0];
  return (id)[v11 systemFontOfSize:v9 weight:v12];
}

+ (double)preferredHeight
{
  uint64_t v2 = [(id)objc_opt_class() weekdayFont];
  [v2 _bodyLeading];
  uint64_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  UIRoundToScale();
  double v5 = v4;

  return fmax(v5, 17.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWeekdayHeaderPaletteView;
  [(HKWeekdayHeaderPaletteView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKWeekdayHeaderPaletteView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(HKWeekdayHeaderPaletteView *)self _updateFont];
      [(HKWeekdayHeaderPaletteView *)self setNeedsLayout];
    }
  }
}

- (void).cxx_destruct
{
}

@end