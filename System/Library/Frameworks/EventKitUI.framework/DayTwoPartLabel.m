@interface DayTwoPartLabel
- (BOOL)showOverlayDate;
- (BOOL)useEmDashFormat;
- (BOOL)useSeparateFormat;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DayTwoPartLabel)initWithFrame:(CGRect)a3;
- (DayTwoPartLabel)initWithFrame:(CGRect)a3 useSeparateFormat:(BOOL)a4;
- (NSDate)date;
- (UIFont)font;
- (double)baselineOffsetFromBoundsTop;
- (id)createCopy;
- (id)dateYearString;
- (id)dayOfWeekString;
- (void)_copyLabelParametersFrom:(id)a3 to:(id)a4;
- (void)_createSubviews;
- (void)_resetUI;
- (void)_updateOverlayLabel;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateYearString:(id)a3;
- (void)setDayOfWeekString:(id)a3;
- (void)setFont:(id)a3;
- (void)setShowOverlayDate:(BOOL)a3;
- (void)setUseEmDashFormat:(BOOL)a3;
- (void)setUseSeparateFormat:(BOOL)a3;
@end

@implementation DayTwoPartLabel

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_useSeparateFormat)
  {
    [(UILabel *)self->_firstLabel setFont:v4];
    id v5 = v7;
    v6 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else
  {
    id v5 = v4;
    v6 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v6) setFont:v5];
  if (self->_showOverlayDate) {
    [(UILabel *)self->_overlayLabel setFont:v7];
  }
}

- (void)setDate:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_date, a3);
  if (self->_date)
  {
    if (self->_useSeparateFormat)
    {
      id v5 = CUIKCalendar();
      v6 = [v5 components:512 fromDate:v10];

      [v6 weekday];
      id v7 = CUIKStringForDayOfWeek();
      v8 = CUIKLongStringForDateWithCommaAndYear();
      [(DayTwoPartLabel *)self setDayOfWeekString:v7];
      [(DayTwoPartLabel *)self setDateYearString:v8];
    }
    else
    {
      if ([(DayTwoPartLabel *)self useEmDashFormat])
      {
        if (self->_showOverlayDate) {
          CUIKAbbreviatedEmDashDayStringForDate();
        }
        else {
          CUIKLongEmDashDayStringForDate();
        }
      }
      else if (self->_showOverlayDate)
      {
        CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      }
      else
      {
        CUIKLongDayStringForDate();
      uint64_t v9 = };
      v6 = (void *)v9;
      [(UILabel *)self->_entireString setText:v9];
    }

    [(DayTwoPartLabel *)self _updateOverlayLabel];
  }
}

- (BOOL)useEmDashFormat
{
  return self->_useEmDashFormat;
}

- (void)_updateOverlayLabel
{
  BOOL showOverlayDate = self->_showOverlayDate;
  overlayLabel = self->_overlayLabel;
  if (showOverlayDate)
  {
    if (!overlayLabel)
    {
      id v5 = (UILabel *)objc_opt_new();
      v6 = self->_overlayLabel;
      self->_overlayLabel = v5;

      id v7 = [(UILabel *)self->_entireString font];
      [(UILabel *)self->_overlayLabel setFont:v7];

      [(DayTwoPartLabel *)self addSubview:self->_overlayLabel];
    }
  }
  else if (overlayLabel)
  {
    [(UILabel *)overlayLabel removeFromSuperview];
    v8 = self->_overlayLabel;
    self->_overlayLabel = 0;
  }
  if (self->_showOverlayDate)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F57B68];
    date = self->_date;
    CUIKGetOverlayCalendar();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [v9 yearMonthDayStringForDate:date inCalendar:v12];
    [(UILabel *)self->_overlayLabel setText:v11];
  }
}

- (void)setShowOverlayDate:(BOOL)a3
{
  if (self->_showOverlayDate != a3)
  {
    self->_BOOL showOverlayDate = a3;
    [(DayTwoPartLabel *)self _resetUI];
  }
}

- (void)setUseEmDashFormat:(BOOL)a3
{
  self->_useEmDashFormat = a3;
}

- (DayTwoPartLabel)initWithFrame:(CGRect)a3 useSeparateFormat:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DayTwoPartLabel;
  id v5 = -[DayTwoPartLabel initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_useSeparateFormat = a4;
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(DayTwoPartLabel *)v6 setBackgroundColor:v7];

    [(DayTwoPartLabel *)v6 _createSubviews];
  }
  return v6;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DayTwoPartLabel;
  [(DayTwoPartLabel *)&v6 setBackgroundColor:v4];
  if (self->_useSeparateFormat)
  {
    [(UILabel *)self->_firstLabel setBackgroundColor:v4];
    id v5 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else
  {
    id v5 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v5) setBackgroundColor:v4];
  if (self->_showOverlayDate) {
    [(UILabel *)self->_overlayLabel setBackgroundColor:v4];
  }
}

- (void)_createSubviews
{
  id v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v12 objectForKey:*MEMORY[0x1E4F1C438]];
  if ([MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v3] == 2)
  {
    self->_useSeparateFormat = 0;
  }
  else if (self->_useSeparateFormat)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    firstLabel = self->_firstLabel;
    self->_firstLabel = v4;

    [(UILabel *)self->_firstLabel setTextAlignment:2];
    objc_super v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_firstLabel setTextColor:v6];

    id v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondLabel = self->_secondLabel;
    self->_secondLabel = v7;

    [(UILabel *)self->_secondLabel setTextAlignment:0];
    objc_super v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_secondLabel setTextColor:v9];

    [(DayTwoPartLabel *)self addSubview:self->_firstLabel];
    [(DayTwoPartLabel *)self addSubview:self->_secondLabel];
    self->_dayNameOnLeft = CUIKIsWeekdayNameFirst();
    goto LABEL_6;
  }
  id v10 = (UILabel *)objc_opt_new();
  entireString = self->_entireString;
  self->_entireString = v10;

  [(UILabel *)self->_entireString setAccessibilityIdentifier:@"current-day"];
  [(UILabel *)self->_entireString setTextAlignment:1];
  [(DayTwoPartLabel *)self addSubview:self->_entireString];
LABEL_6:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_useSeparateFormat)
  {
    firstLabel = self->_firstLabel;
    [(UILabel *)firstLabel frame];
    -[UILabel sizeThatFits:](firstLabel, "sizeThatFits:", v5, v6);
    double v8 = v7;
    double v10 = v9;
    secondLabel = self->_secondLabel;
    [(UILabel *)secondLabel frame];
    -[UILabel sizeThatFits:](secondLabel, "sizeThatFits:", v12, v13);
    double v15 = fmax(v10, v14);
    double v17 = v8 + v16 + 10.0;
  }
  else
  {
    entireString = self->_entireString;
    [(UILabel *)entireString frame];
    -[UILabel sizeThatFits:](entireString, "sizeThatFits:", v19, v20);
    double v17 = v21;
    double v15 = v22;
  }
  if (self->_showOverlayDate)
  {
    [(UILabel *)self->_overlayLabel sizeToFit];
    [(UILabel *)self->_overlayLabel frame];
    double v17 = v17 + CGRectGetWidth(v26) + 10.0;
    [(UILabel *)self->_overlayLabel frame];
    double v15 = fmax(v15, CGRectGetHeight(v27));
  }
  double v23 = v17;
  double v24 = v15;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)DayTwoPartLabel;
  [(DayTwoPartLabel *)&v34 layoutSubviews];
  BOOL useSeparateFormat = self->_useSeparateFormat;
  [(DayTwoPartLabel *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (useSeparateFormat)
  {
    firstLabel = self->_firstLabel;
    [(UILabel *)firstLabel frame];
    -[UILabel sizeThatFits:](firstLabel, "sizeThatFits:", v11, v12);
    CGFloat v14 = v13;
    -[UILabel setFrame:](self->_firstLabel, "setFrame:", v5, v7, v13, v9);
    [(DayTwoPartLabel *)self bounds];
    double v16 = v15;
    double v18 = v17;
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v14;
    v35.size.height = v9;
    double v5 = CGRectGetMaxX(v35) + 10.0;
    secondLabel = self->_secondLabel;
    [(UILabel *)secondLabel frame];
    -[UILabel sizeThatFits:](secondLabel, "sizeThatFits:", v20, v21);
    CGFloat v23 = v22;
    -[UILabel setFrame:](self->_secondLabel, "setFrame:", v5, v16, v22, v18);
  }
  else
  {
    entireString = self->_entireString;
    [(UILabel *)entireString frame];
    -[UILabel sizeThatFits:](entireString, "sizeThatFits:", v25, v26);
    CGFloat v23 = v27;
    -[UILabel setFrame:](self->_entireString, "setFrame:", v5, v7, v27, v9);
    double v16 = v7;
    double v18 = v9;
  }
  v36.origin.x = v5;
  v36.origin.y = v16;
  v36.size.width = v23;
  v36.size.height = v18;
  double MaxX = CGRectGetMaxX(v36);
  if (self->_showOverlayDate)
  {
    double v29 = MaxX;
    [(DayTwoPartLabel *)self bounds];
    double v31 = v30;
    double v33 = v32;
    [(UILabel *)self->_overlayLabel frame];
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", v29 + 10.0, v31, CGRectGetWidth(v37), v33);
  }
}

- (DayTwoPartLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = CUIKIsWeekdayNameFirst();

  return -[DayTwoPartLabel initWithFrame:useSeparateFormat:](self, "initWithFrame:useSeparateFormat:", v8, x, y, width, height);
}

- (void)_resetUI
{
  id v8 = [(DayTwoPartLabel *)self backgroundColor];
  if (self->_useSeparateFormat) {
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  else {
    v3 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  double v4 = [*(id *)((char *)&self->super.super.super.isa + *v3) font];
  if (self->_useSeparateFormat)
  {
    [(UILabel *)self->_firstLabel removeFromSuperview];
    p_secondLabel = &self->_secondLabel;
    [(UILabel *)self->_secondLabel removeFromSuperview];
    firstLabel = self->_firstLabel;
    self->_firstLabel = 0;
  }
  else
  {
    p_secondLabel = &self->_entireString;
    [(UILabel *)self->_entireString removeFromSuperview];
  }
  double v7 = *p_secondLabel;
  *p_secondLabel = 0;

  [(DayTwoPartLabel *)self _createSubviews];
  [(DayTwoPartLabel *)self _updateOverlayLabel];
  [(DayTwoPartLabel *)self setBackgroundColor:v8];
  [(DayTwoPartLabel *)self setFont:v4];
  [(DayTwoPartLabel *)self setDate:self->_date];
  [(DayTwoPartLabel *)self setNeedsLayout];
}

- (id)dayOfWeekString
{
  if (self->_dayNameOnLeft) {
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  else {
    v2 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  v3 = [*(id *)((char *)&self->super.super.super.isa + *v2) text];

  return v3;
}

- (void)setDayOfWeekString:(id)a3
{
  if (self->_dayNameOnLeft) {
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  else {
    v3 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v3) setText:a3];
}

- (id)dateYearString
{
  if (self->_dayNameOnLeft) {
    v2 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else {
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  v3 = [*(id *)((char *)&self->super.super.super.isa + *v2) text];

  return v3;
}

- (void)setDateYearString:(id)a3
{
  if (self->_dayNameOnLeft) {
    v3 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else {
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v3) setText:a3];
}

- (UIFont)font
{
  if (self->_useSeparateFormat) {
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  else {
    v2 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  v3 = [*(id *)((char *)&self->super.super.super.isa + *v2) font];

  return (UIFont *)v3;
}

- (id)createCopy
{
  v3 = objc_alloc_init(DayTwoPartLabel);
  [(DayTwoPartLabel *)self frame];
  -[DayTwoPartLabel setFrame:](v3, "setFrame:");
  double v4 = [(DayTwoPartLabel *)self backgroundColor];
  [(DayTwoPartLabel *)v3 setBackgroundColor:v4];

  v3->_BOOL showOverlayDate = self->_showOverlayDate;
  objc_storeStrong((id *)&v3->_date, self->_date);
  v3->_BOOL useSeparateFormat = self->_useSeparateFormat;
  v3->_dayNameOnLeft = self->_dayNameOnLeft;
  [(DayTwoPartLabel *)v3 _resetUI];
  [(DayTwoPartLabel *)self _copyLabelParametersFrom:self->_firstLabel to:v3->_firstLabel];
  [(DayTwoPartLabel *)self _copyLabelParametersFrom:self->_secondLabel to:v3->_secondLabel];
  [(DayTwoPartLabel *)self _copyLabelParametersFrom:self->_entireString to:v3->_entireString];
  [(DayTwoPartLabel *)self _copyLabelParametersFrom:self->_overlayLabel to:v3->_overlayLabel];
  [(DayTwoPartLabel *)v3 sizeToFit];

  return v3;
}

- (void)_copyLabelParametersFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 frame];
  objc_msgSend(v5, "setFrame:");
  double v7 = [v6 font];
  [v5 setFont:v7];

  id v8 = [v6 text];
  [v5 setText:v8];

  id v9 = [v6 backgroundColor];

  [v5 setBackgroundColor:v9];
}

- (double)baselineOffsetFromBoundsTop
{
  if (self->_useSeparateFormat) {
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  }
  else {
    v2 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  id v3 = *(id *)((char *)&self->super.super.super.isa + *v2);
  [v3 frame];
  double MinY = CGRectGetMinY(v8);
  [v3 _firstLineBaselineOffsetFromBoundsTop];
  double v6 = v5;

  return MinY + v6;
}

- (BOOL)showOverlayDate
{
  return self->_showOverlayDate;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)useSeparateFormat
{
  return self->_useSeparateFormat;
}

- (void)setUseSeparateFormat:(BOOL)a3
{
  self->_BOOL useSeparateFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_entireString, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);

  objc_storeStrong((id *)&self->_firstLabel, 0);
}

@end