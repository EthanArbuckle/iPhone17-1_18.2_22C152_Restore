@interface EKUIAvailabilityTimelineView
- (EKUIAvailabilityTimelineView)init;
- (double)minWidth;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentWidth:(double)a3;
- (void)setHorizontalScrollOffset:(double)a3;
- (void)setLabels;
@end

@implementation EKUIAvailabilityTimelineView

- (EKUIAvailabilityTimelineView)init
{
  v20.receiver = self;
  v20.super_class = (Class)EKUIAvailabilityTimelineView;
  v2 = [(EKUIAvailabilityTimelineView *)&v20 init];
  if (v2)
  {
    int v3 = 23;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:23];
    labels = v2->_labels;
    v2->_labels = (NSMutableArray *)v4;

    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = *MEMORY[0x1E4FB28E0];
    do
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v9, v8);
      v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
      [v11 setFont:v12];

      if (CalInterfaceIsLeftToRight()) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 0;
      }
      [v11 setTextAlignment:v13];
      v14 = [MEMORY[0x1E4FB1618] lightGrayColor];
      [v11 setTextColor:v14];

      [(EKUIAvailabilityTimelineView *)v2 addSubview:v11];
      [(NSMutableArray *)v2->_labels addObject:v11];

      --v3;
    }
    while (v3);
    [(EKUIAvailabilityTimelineView *)v2 setLabels];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v9, v8);
    bottomPixelBorder = v2->_bottomPixelBorder;
    v2->_bottomPixelBorder = (UIView *)v15;

    v17 = v2->_bottomPixelBorder;
    v18 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [(EKUIAvailabilityTimelineView *)v2 addSubview:v2->_bottomPixelBorder];
  }
  return v2;
}

- (void)setLabels
{
  int v3 = [(EKUIAvailabilityTimelineView *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];
  BOOL v5 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) != NSOrderedAscending;

  labels = self->_labels;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__EKUIAvailabilityTimelineView_setLabels__block_invoke;
  v7[3] = &__block_descriptor_33_e24_v32__0__UILabel_8Q16_B24l;
  BOOL v8 = v5;
  [(NSMutableArray *)labels enumerateObjectsUsingBlock:v7];
}

void __41__EKUIAvailabilityTimelineView_setLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3 == 8 || a3 == 16)
  {
    if ((CUIKShow24Hours() & 1) == 0 && !*(unsigned char *)(a1 + 32))
    {
      uint64_t v7 = CUIKStringForHour();
      goto LABEL_9;
    }
  }
  else if (a3 == 11 && !*(unsigned char *)(a1 + 32))
  {
    BOOL v5 = EventKitUIBundle();
    double v6 = [v5 localizedStringForKey:@"Noon" value:&stru_1F0CC2140 table:0];
    [v9 setText:v6];

    goto LABEL_10;
  }
  uint64_t v7 = CUIKStringForHourWithoutDesignator();
LABEL_9:
  BOOL v5 = (void *)v7;
  [v9 setText:v7];
LABEL_10:

  BOOL v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [v9 setFont:v8];
}

- (void)setContentWidth:(double)a3
{
  [(EKUIAvailabilityTimelineView *)self frame];
  double v6 = v5;
  -[EKUIAvailabilityTimelineView setContentSize:](self, "setContentSize:", a3, v5);
  self->_largestLabelWidth = 0.0;
  labels = self->_labels;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__EKUIAvailabilityTimelineView_setContentWidth___block_invoke;
  v8[3] = &unk_1E6088758;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = v6;
  v8[4] = self;
  [(NSMutableArray *)labels enumerateObjectsUsingBlock:v8];
  -[UIView setFrame:](self->_bottomPixelBorder, "setFrame:", 0.0, v6 + -1.0, a3, 0.5);
  [(EKUIAvailabilityTimelineView *)self setNeedsLayout];
}

void __48__EKUIAvailabilityTimelineView_setContentWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double v4 = (double)(unint64_t)(a3 + 1) / 24.0 * *(double *)(a1 + 40);
  id v5 = a2;
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
    double v4 = *(double *)(a1 + 40) - v4;
  }
  double v6 = [v5 text];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [v5 font];
  v15[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v6 sizeWithAttributes:v8];
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v5, "setFrame:", v4 + v10 * -0.5, *(double *)(a1 + 48) - v12 + -11.0, v10, v12);
  uint64_t v13 = *(void *)(a1 + 32);
  if (v10 > *(double *)(v13 + 2088)) {
    *(double *)(v13 + 2088) = v10;
  }
}

- (double)minWidth
{
  return (self->_largestLabelWidth + 10.0) * 24.0;
}

- (void)setHorizontalScrollOffset:(double)a3
{
}

- (void)setContentOffset:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityTimelineView;
  -[EKUIAvailabilityTimelineView setContentOffset:](&v3, sel_setContentOffset_, a3.x, a3.y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPixelBorder, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end