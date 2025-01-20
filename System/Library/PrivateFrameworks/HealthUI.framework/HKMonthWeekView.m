@interface HKMonthWeekView
- (BOOL)accessoryContentsFetched;
- (BOOL)containsMonthTitle;
- (BOOL)supportsRTL;
- (CGRect)_frameForTopBorderLine;
- (Class)cellClass;
- (Class)monthTitleClass;
- (HKMonthWeekView)initWithDateCache:(id)a3 displaysMonthTitle:(BOOL)a4 displaysTopBorderLine:(BOOL)a5;
- (NSArray)accessoryViews;
- (id)cellMatchingDate:(id)a3;
- (void)clearAccessoryViews;
- (void)layoutSubviews;
- (void)selectedCalendarDay:(id)a3;
- (void)setAccessoryContentsFetched:(BOOL)a3;
- (void)setMonthWeekStart:(id)a3;
- (void)setTitleHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKMonthWeekView

- (HKMonthWeekView)initWithDateCache:(id)a3 displaysMonthTitle:(BOOL)a4 displaysTopBorderLine:(BOOL)a5
{
  BOOL v5 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMonthWeekView;
  v7 = [(HKCalendarWeekView *)&v15 initWithDateCache:a3];
  if (v7)
  {
    v7->_isRTL = HKUICalendarLocaleIsRightToLeft();
    v7->_displaysMonthTitle = a4;
    v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(HKMonthWeekView *)v7 setBackgroundColor:v8];

    v7->_displaysTopBorderLine = v5;
    if (v5)
    {
      uint64_t v9 = [MEMORY[0x1E4F39BE8] layer];
      topBorderLine = v7->_topBorderLine;
      v7->_topBorderLine = (CALayer *)v9;

      v11 = v7->_topBorderLine;
      v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v12 scale];
      -[CALayer setContentsScale:](v11, "setContentsScale:");

      v13 = [(HKMonthWeekView *)v7 layer];
      [v13 addSublayer:v7->_topBorderLine];
    }
    [(HKCalendarWeekView *)v7 setLeadingMargin:5.0];
    [(HKCalendarWeekView *)v7 setDateTopMargin:2.0];
    [(HKCalendarWeekView *)v7 setDateBottomMargin:18.0];
    [(HKCalendarWeekView *)v7 setMonthTitleTopMargin:2.0];
    [(HKCalendarWeekView *)v7 setMonthTitleBottomMargin:2.0];
    [(HKCalendarWeekView *)v7 setDateDiameter:35.0];
  }
  return v7;
}

- (NSArray)accessoryViews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  accessoryViews = self->_accessoryViews;
  if (!accessoryViews)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    BOOL v5 = [(HKCalendarWeekView *)self dayCells];
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(HKCalendarWeekView *)self dayCells];
    uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      double v10 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v16 = -[HKMonthWeekViewAccessoryView initWithFrame:]([HKMonthWeekViewAccessoryView alloc], "initWithFrame:", v10, v11, v12, v13);
          [(HKMonthWeekViewAccessoryView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(NSArray *)v6 addObject:v16];
          [(HKMonthWeekView *)self addSubview:v16];
          v17 = [(HKMonthWeekViewAccessoryView *)v16 centerXAnchor];
          v18 = [(HKMonthWeekView *)self leadingAnchor];
          [v15 frame];
          v19 = [v17 constraintEqualToAnchor:v18 constant:CGRectGetMidX(v38)];
          [v19 setActive:1];

          v20 = [(HKMonthWeekViewAccessoryView *)v16 widthAnchor];
          [v15 frame];
          v21 = [v20 constraintEqualToConstant:CGRectGetWidth(v39) * 0.5];
          [v21 setActive:1];

          v22 = [(HKMonthWeekViewAccessoryView *)v16 heightAnchor];
          v23 = [(HKMonthWeekViewAccessoryView *)v16 widthAnchor];
          v24 = [v22 constraintEqualToAnchor:v23];
          [v24 setActive:1];

          v25 = [(HKMonthWeekViewAccessoryView *)v16 topAnchor];
          v26 = [(HKMonthWeekView *)self topAnchor];
          [v15 frame];
          v27 = [v25 constraintEqualToAnchor:v26 constant:CGRectGetMaxY(v40) + -2.0];
          [v27 setActive:1];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v8);
    }

    v28 = self->_accessoryViews;
    self->_accessoryViews = v6;

    accessoryViews = self->_accessoryViews;
  }
  return accessoryViews;
}

- (void)clearAccessoryViews
{
  [(HKMonthWeekView *)self setAccessoryContentsFetched:0];
  [(NSArray *)self->_accessoryViews makeObjectsPerformSelector:sel_removeFromSuperview];
  accessoryViews = self->_accessoryViews;
  self->_accessoryViews = 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)monthTitleClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsRTL
{
  return 1;
}

- (BOOL)containsMonthTitle
{
  if (!self->_displaysMonthTitle) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)HKMonthWeekView;
  return [(HKCalendarWeekView *)&v3 containsMonthTitle];
}

- (void)selectedCalendarDay:(id)a3
{
  id v4 = a3;
  id v5 = [(HKCalendarWeekView *)self delegate];
  [v5 week:self cellSelected:v4];
}

- (id)cellMatchingDate:(id)a3
{
  id v4 = a3;
  if ([(HKCalendarWeekView *)self containsDate:v4])
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v6 = [v5 component:512 fromDate:v4];
    uint64_t v7 = [v5 firstWeekday];
    unint64_t v8 = (unint64_t)(v6 - v7 + *MEMORY[0x1E4F29998]) % *MEMORY[0x1E4F29998];
    if (HKUICalendarLocaleIsRightToLeft()) {
      unint64_t v8 = 6 - v8;
    }
    uint64_t v9 = [(HKCalendarWeekView *)self dayCells];
    double v10 = [v9 objectAtIndexedSubscript:v8];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)setTitleHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKMonthWeekView *)self containsMonthTitle])
  {
    id v5 = [(HKCalendarWeekView *)self monthTitleView];
    [v5 setHighlighted:v3];
  }
}

- (void)setMonthWeekStart:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKMonthWeekView;
  [(HKCalendarWeekView *)&v8 setMonthWeekStart:a3];
  BOOL isRTL = self->_isRTL;
  int64_t v5 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  int64_t v6 = v5;
  if (isRTL)
  {
    uint64_t v7 = [(HKCalendarWeekView *)self dayCells];
    -[CALayer setHidden:](self->_topBorderLine, "setHidden:", v6 == [v7 count] - 1);
  }
  else
  {
    [(CALayer *)self->_topBorderLine setHidden:v5 == 0];
  }
  [(HKMonthWeekView *)self clearAccessoryViews];
}

- (void)layoutSubviews
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(HKMonthWeekView *)self bounds];
  double v4 = v3;
  [(HKCalendarWeekView *)self leadingMargin];
  uint64_t v6 = *MEMORY[0x1E4F29998];
  double v7 = (v4 + v5 * -2.0) / (double)(unint64_t)*MEMORY[0x1E4F29998];
  objc_super v8 = [(HKCalendarWeekView *)self monthTitleView];
  [(HKMonthWeekView *)self bounds];
  objc_msgSend(v8, "sizeThatFits:", v9, v10);
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  if (![(HKMonthWeekView *)self containsMonthTitle]) {
    goto LABEL_17;
  }
  objc_super v15 = [(HKCalendarWeekView *)self monthTitleView];
  [v15 sizeToFit];

  v16 = [(HKCalendarWeekView *)self monthTitleView];
  [v16 frame];
  double v18 = v17;

  [(HKCalendarWeekView *)self leadingMargin];
  [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  UIRoundToViewScale();
  double v20 = v19;
  if (v19 < 0.0)
  {
    [(HKCalendarWeekView *)self leadingMargin];
    double v20 = v21;
  }
  [(HKMonthWeekView *)self bounds];
  if (v18 + v20 > v22)
  {
    [(HKMonthWeekView *)self bounds];
    double v24 = v23 - v18;
    [(HKCalendarWeekView *)self leadingMargin];
    double v20 = v24 - v25;
  }
  [(HKCalendarWeekView *)self dateTopMargin];
  double v27 = v26;
  [(HKCalendarWeekView *)self monthTitleTopMargin];
  double v29 = v27 + v28;
  BOOL isRTL = self->_isRTL;
  uint64_t v31 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  unint64_t v32 = v31;
  if (!isRTL)
  {
    if (v31 <= 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  long long v33 = [(HKCalendarWeekView *)self dayCells];
  unint64_t v34 = [v33 count] - 1;

  if (v32 < v34)
  {
LABEL_8:
    [(HKCalendarWeekView *)self dateBottomMargin];
    double v36 = v35;
    [(HKCalendarWeekView *)self dateDiameter];
    double v29 = v29 + v36 + v37;
  }
LABEL_9:
  CGRect v38 = [(HKCalendarWeekView *)self monthTitleView];
  [(HKMonthWeekView *)self bounds];
  objc_msgSend(v38, "setFrame:", v20, v29);

  CGRect v39 = [(HKCalendarWeekView *)self monthTitleView];
  CGRect v40 = v39;
  double v41 = -v20;
  if (!self->_isRTL) {
    double v41 = -17.0;
  }
  [v39 setDividerOriginX:v41];
  BOOL v42 = self->_isRTL;
  int64_t v43 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  if (v42)
  {
    double v44 = (double)(v43 + 1);
    [(HKCalendarWeekView *)self leadingMargin];
    double v46 = v45 + v7 * v44;
  }
  else
  {
    double v46 = v7 * (double)(unint64_t)(v6 - v43 + 1);
  }
  [v40 setDividerWidth:v46];

LABEL_17:
  v47 = [(HKCalendarWeekView *)self dayCells];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __33__HKMonthWeekView_layoutSubviews__block_invoke;
  v51[3] = &unk_1E6D54058;
  v51[4] = self;
  *(double *)&v51[5] = v7;
  v51[6] = v12;
  v51[7] = v14;
  [v47 enumerateObjectsUsingBlock:v51];

  topBorderLine = self->_topBorderLine;
  [(HKMonthWeekView *)self _frameForTopBorderLine];
  -[CALayer setFrame:](topBorderLine, "setFrame:");
  v49 = self->_topBorderLine;
  id v50 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
  -[CALayer setBackgroundColor:](v49, "setBackgroundColor:", [v50 CGColor]);

  [MEMORY[0x1E4F39CF8] commit];
}

void __33__HKMonthWeekView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v35 = a2;
  [*(id *)(a1 + 32) leadingMargin];
  [*(id *)(a1 + 32) dateDiameter];
  UIRoundToViewScale();
  double v6 = v5;
  [*(id *)(a1 + 32) dateTopMargin];
  double v8 = v7;
  double v9 = [v35 date];
  objc_msgSend(v35, "updateWithDate:dayOfMonth:", v9, objc_msgSend(v35, "dayOfMonth"));

  if ([*(id *)(a1 + 32) containsMonthTitle])
  {
    double v10 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) monthTitleTopMargin];
    double v12 = v10 + v11;
    [*(id *)(a1 + 32) monthTitleBottomMargin];
    double v14 = v13;
    objc_super v15 = *(unsigned __int8 **)(a1 + 32);
    int v16 = v15[530];
    uint64_t v17 = [v15 firstDayOfMonthCellIndex];
    uint64_t v18 = v17;
    if (v16)
    {
      double v19 = [*(id *)(a1 + 32) dayCells];
      BOOL v20 = v18 == [v19 count] - 1;
    }
    else
    {
      BOOL v20 = v17 == 0;
    }
    double v21 = v12 + v14;
    double v22 = *(unsigned __int8 **)(a1 + 32);
    int v23 = v22[530];
    unint64_t v24 = [v22 firstDayOfMonthCellIndex];
    if (v20)
    {
      [*(id *)(a1 + 32) dateTopMargin];
LABEL_11:
      double v8 = v8 + v21 + v25;
      goto LABEL_12;
    }
    BOOL v26 = v24 <= a3;
    if (v23) {
      BOOL v26 = v24 >= a3;
    }
    if (v26)
    {
      [v35 dayDiameter];
      double v28 = v27;
      [*(id *)(a1 + 32) dateTopMargin];
      double v30 = v28 + v29;
      [*(id *)(a1 + 32) dateBottomMargin];
      double v25 = v30 + v31;
      goto LABEL_11;
    }
  }
LABEL_12:
  [v35 dayDiameter];
  double v33 = v32;
  [v35 dayDiameter];
  objc_msgSend(v35, "setFrame:", v6, v8, v33, v34);
  [v35 layoutSublayers];
}

- (CGRect)_frameForTopBorderLine
{
  [(HKCalendarWeekView *)self leadingMargin];
  double v4 = v3;
  [(HKMonthWeekView *)self bounds];
  double v6 = v5;
  [(HKCalendarWeekView *)self leadingMargin];
  double v8 = v7;
  double v9 = 0.0;
  if (![(HKMonthWeekView *)self containsMonthTitle]) {
    goto LABEL_4;
  }
  uint64_t v10 = *MEMORY[0x1E4F29998];
  double v11 = (v6 + v8 * -2.0) / (double)(unint64_t)*MEMORY[0x1E4F29998];
  BOOL isRTL = self->_isRTL;
  int64_t v13 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  int64_t v14 = v13;
  if (isRTL)
  {
    int64_t v15 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex] + 1;
    [(HKCalendarWeekView *)self leadingMargin];
    double v9 = v16 + v11 * (double)v15;
    if (v14 == v10 - 1)
    {
LABEL_4:
      [(HKMonthWeekView *)self bounds];
      double v18 = v17;
      goto LABEL_9;
    }
  }
  else if (v13 != 1)
  {
    goto LABEL_4;
  }
  BOOL v19 = self->_isRTL;
  int64_t v20 = [(HKCalendarWeekView *)self firstDayOfMonthCellIndex];
  uint64_t v21 = v10 + ~v20;
  if (!v19) {
    uint64_t v21 = v20;
  }
  double v18 = v4 + v11 * (double)v21;
LABEL_9:
  double v22 = HKUIOnePixel();
  double v23 = 0.0;
  double v24 = v9;
  double v25 = v18;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMonthWeekView;
  [(HKMonthWeekView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKMonthWeekView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      +[HKCalendarDayCell clearImageCache];
      [(HKMonthWeekView *)self setNeedsLayout];
    }
  }
}

- (BOOL)accessoryContentsFetched
{
  return self->_accessoryContentsFetched;
}

- (void)setAccessoryContentsFetched:(BOOL)a3
{
  self->_accessoryContentsFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_topBorderLine, 0);
}

@end