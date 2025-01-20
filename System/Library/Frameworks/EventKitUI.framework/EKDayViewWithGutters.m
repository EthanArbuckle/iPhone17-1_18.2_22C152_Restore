@interface EKDayViewWithGutters
+ (double)defaultTopLabelContainerHeight;
+ (id)_normalWeekdayFont;
+ (id)_smallWeekdayFont;
+ (id)_weekNumberFont;
+ (id)_weekdayFont;
+ (id)_weekdayFontOfSize:(double)a3;
- (BOOL)isPointAllDay:(CGPoint)a3 requireAllDayRegionInsistence:(BOOL)a4;
- (BOOL)showDividerLine;
- (BOOL)showWeekDayLabel;
- (BOOL)showWeekNumberLabel;
- (DayTwoPartLabel)weekDayLabel;
- (EKDayView)dayView;
- (EKDayViewWithGutters)initWithFrame:(CGRect)a3 dayView:(id)a4 sizeClass:(int64_t)a5 showWeekDayLabel:(BOOL)a6 showWeekNumberLabel:(BOOL)a7;
- (NSDate)currentDate;
- (UILabel)weekNumberLabel;
- (UIView)dividerLine;
- (UIView)leftGutter;
- (UIView)rightGutter;
- (UIView)topLabelsContainer;
- (double)allDayHeight;
- (double)gutterWidth;
- (id)_createAllDayView;
- (void)_updateWeekNumberLabel;
- (void)setAllDayHeight:(double)a3;
- (void)setCurrentDate:(id)a3;
- (void)setDayView:(id)a3;
- (void)setDividerLine:(id)a3;
- (void)setGutterWidth:(double)a3;
- (void)setShowDividerLine:(BOOL)a3;
- (void)setShowWeekDayLabel:(BOOL)a3;
- (void)setShowWeekNumberLabel:(BOOL)a3;
- (void)setTopLabelsContainer:(id)a3;
- (void)setWeekDayLabel:(id)a3;
- (void)setWeekNumberLabel:(id)a3;
- (void)timeZoneChangedWithNewDate:(id)a3;
- (void)updateDividerLineVisibility;
- (void)updateLabelTexts;
@end

@implementation EKDayViewWithGutters

void __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowDividerLine:a2 == 0];
}

- (void)setShowDividerLine:(BOOL)a3
{
  self->_showDividerLine = a3;
  [(UIView *)self->_dividerLine setHidden:!a3];
}

- (void)setShowWeekNumberLabel:(BOOL)a3
{
  self->_showWeekNumberLabel = a3;
  [(UILabel *)self->_weekNumberLabel setHidden:!a3];
}

- (void)setShowWeekDayLabel:(BOOL)a3
{
  self->_showWeekDayLabel = a3;
  [(DayTwoPartLabel *)self->_weekDayLabel setHidden:!a3];
}

- (EKDayViewWithGutters)initWithFrame:(CGRect)a3 dayView:(id)a4 sizeClass:(int64_t)a5 showWeekDayLabel:(BOOL)a6 showWeekNumberLabel:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  v58.receiver = self;
  v58.super_class = (Class)EKDayViewWithGutters;
  v16 = -[EKDayViewWithGutters initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = CUIKCalendar();
    calendar = v16->_calendar;
    v16->_calendar = (NSCalendar *)v17;

    v16->_showWeekDayLabel = v8;
    v16->_showWeekNumberLabel = v7;
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    +[EKDayViewWithGutters defaultTopLabelContainerHeight];
    uint64_t v21 = objc_msgSend(v19, "initWithFrame:", 0.0, 0.0, width, v20);
    topLabelsContainer = v16->_topLabelsContainer;
    v16->_topLabelsContainer = (UIView *)v21;

    [(UIView *)v16->_topLabelsContainer setClipsToBounds:1];
    [(UIView *)v16->_topLabelsContainer setAutoresizingMask:2];
    [(UIView *)v16->_topLabelsContainer setHidden:!v8];
    [(EKDayViewWithGutters *)v16 addSubview:v16->_topLabelsContainer];
    v23 = v16->_calendar;
    v24 = [v15 displayDate];
    v25 = [(NSCalendar *)v23 dateFromComponents:v24];

    objc_storeStrong((id *)&v16->_currentDate, v25);
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 16.0, 8.0, 50.0, 20.0);
    weekNumberLabel = v16->_weekNumberLabel;
    v16->_weekNumberLabel = (UILabel *)v26;

    [(UILabel *)v16->_weekNumberLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v16->_weekNumberLabel setMinimumScaleFactor:0.75];
    [(UILabel *)v16->_weekNumberLabel setAutoresizingMask:38];
    v28 = [(id)objc_opt_class() _weekNumberFont];
    [(UILabel *)v16->_weekNumberLabel setFont:v28];

    v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v16->_weekNumberLabel setTextColor:v29];

    [(EKDayViewWithGutters *)v16 _updateWeekNumberLabel];
    [(UILabel *)v16->_weekNumberLabel setHidden:!v7];
    [(UIView *)v16->_topLabelsContainer addSubview:v16->_weekNumberLabel];
    v30 = [DayTwoPartLabel alloc];
    +[EKDayViewWithGutters defaultTopLabelContainerHeight];
    uint64_t v32 = -[DayTwoPartLabel initWithFrame:useSeparateFormat:](v30, "initWithFrame:useSeparateFormat:", 0, 0.0, 0.0, width, v31);
    weekDayLabel = v16->_weekDayLabel;
    v16->_weekDayLabel = (DayTwoPartLabel *)v32;

    [(DayTwoPartLabel *)v16->_weekDayLabel setAccessibilityIdentifier:@"current-day"];
    [(DayTwoPartLabel *)v16->_weekDayLabel setUseEmDashFormat:1];
    [(UIView *)v16->_topLabelsContainer center];
    -[DayTwoPartLabel setCenter:](v16->_weekDayLabel, "setCenter:");
    [(DayTwoPartLabel *)v16->_weekDayLabel setDate:v25];
    [(DayTwoPartLabel *)v16->_weekDayLabel sizeToFit];
    [(DayTwoPartLabel *)v16->_weekDayLabel setAutoresizingMask:5];
    v34 = [(id)objc_opt_class() _weekdayFont];
    [(DayTwoPartLabel *)v16->_weekDayLabel setFont:v34];

    [(UIView *)v16->_topLabelsContainer addSubview:v16->_weekDayLabel];
    CalRoundToScreenScale(0.5);
    double v36 = v35;
    id v37 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    +[EKDayViewWithGutters defaultTopLabelContainerHeight];
    uint64_t v39 = objc_msgSend(v37, "initWithFrame:", 0.0, v38 - v36, width, v36);
    dividerLine = v16->_dividerLine;
    v16->_dividerLine = (UIView *)v39;

    [(UIView *)v16->_dividerLine setAutoresizingMask:42];
    v41 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v16->_dividerLine setBackgroundColor:v41];

    [(UIView *)v16->_dividerLine setHidden:1];
    [(UIView *)v16->_topLabelsContainer addSubview:v16->_dividerLine];
    objc_initWeak(&location, v16);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke;
    v55[3] = &unk_1E608AF90;
    objc_copyWeak(&v56, &location);
    [v15 setDisplayDateDidChangeCallback:v55];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke_2;
    v53[3] = &unk_1E60878F0;
    objc_copyWeak(&v54, &location);
    [v15 setContentDidChangeCallback:v53];
    [v15 setAutoresizingMask:18];
    [v15 frame];
    double v42 = v59.origin.x;
    double v43 = v59.origin.y;
    CGFloat v44 = v59.size.width;
    CGFloat v45 = v59.size.height;
    double v46 = CGRectGetWidth(v59);
    v60.origin.double x = v42;
    v60.origin.double y = v43;
    v60.size.double width = v44;
    v60.size.double height = v45;
    CGFloat v47 = CGRectGetHeight(v60) - v43;
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, v43, v16->_gutterWidth, v47);
    v49 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v48 setBackgroundColor:v49];

    [v48 setClipsToBounds:0];
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v42 + v46, v43, v16->_gutterWidth, v47);
    [v50 setAutoresizingMask:1];
    v51 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v50 setBackgroundColor:v51];

    [v50 setClipsToBounds:0];
    [(EKDayViewWithGutters *)v16 setAutoresizingMask:18];
    [(EKDayViewWithGutters *)v16 addSubview:v48];
    [(EKDayViewWithGutters *)v16 addSubview:v50];
    [(EKDayViewWithGutters *)v16 addSubview:v15];
    objc_storeStrong((id *)&v16->_leftGutter, v48);
    objc_storeStrong((id *)&v16->_rightGutter, v50);
    v16->_targetSizeClass = a5;
    [(EKDayViewWithGutters *)v16 setDayView:v15];
    [(EKDayViewWithGutters *)v16 setClipsToBounds:0];

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  return v16;
}

+ (double)defaultTopLabelContainerHeight
{
  return 36.0;
}

- (void)updateLabelTexts
{
  [(EKDayViewWithGutters *)self _updateWeekNumberLabel];
  v3 = CUIKGetOverlayCalendar();
  [(DayTwoPartLabel *)self->_weekDayLabel setShowOverlayDate:v3 != 0];

  v4 = [(EKDayViewWithGutters *)self currentDate];
  [(DayTwoPartLabel *)self->_weekDayLabel setDate:v4];

  v5 = [(id)objc_opt_class() _weekdayFont];
  [(DayTwoPartLabel *)self->_weekDayLabel setFont:v5];

  [(DayTwoPartLabel *)self->_weekDayLabel sizeToFit];
  [(UIView *)self->_topLabelsContainer center];
  -[DayTwoPartLabel setCenter:](self->_weekDayLabel, "setCenter:");
  [(EKDayViewWithGutters *)self sizeToFit];

  [(EKDayViewWithGutters *)self setNeedsLayout];
}

- (void)_updateWeekNumberLabel
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v3 _scaledValueForValue:15.0];
  double v5 = v4;

  double v6 = 16.0;
  if (v5 > 18.0) {
    double v6 = 8.0;
  }
  if (v5 <= 21.0) {
    double v7 = v6;
  }
  else {
    double v7 = 1.0;
  }
  [(UILabel *)self->_weekNumberLabel bounds];
  double v9 = v8;
  [(UILabel *)self->_weekNumberLabel bounds];
  -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", v7, 8.0, v9);
  calendar = self->_calendar;
  v11 = [(EKDayViewWithGutters *)self currentDate];
  [(NSCalendar *)calendar component:0x2000 fromDate:v11];

  v12 = NSString;
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"W%@" value:&stru_1F0CC2140 table:0];
  id v15 = CUIKLocalizedStringForInteger();
  v16 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v15);
  [(UILabel *)self->_weekNumberLabel setText:v16];

  id v17 = [(id)objc_opt_class() _weekNumberFont];
  [(UILabel *)self->_weekNumberLabel setFont:v17];
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

+ (id)_weekNumberFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:14.0 shouldScaleForSmallerSizes:16.0];

  return (id)objc_msgSend(v2, "systemFontOfSize:");
}

+ (id)_weekdayFont
{
  v3 = [MEMORY[0x1E4F57C00] sharedPreferences];
  if ([v3 showWeekNumbers])
  {
    double v4 = CUIKGetOverlayCalendar();

    if (v4)
    {
      double v5 = [a1 _smallWeekdayFont];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v5 = [a1 _normalWeekdayFont];
LABEL_6:

  return v5;
}

+ (id)_weekdayFontOfSize:(double)a3
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:a3 weight:*MEMORY[0x1E4FB09E0]];
}

+ (id)_normalWeekdayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:15.0 shouldScaleForSmallerSizes:20.0];

  return (id)objc_msgSend(a1, "_weekdayFontOfSize:");
}

- (void)setDayView:(id)a3
{
  objc_storeStrong((id *)&self->_dayView, a3);
  id v5 = a3;
  calendar = self->_calendar;
  double v7 = [v5 displayDate];
  double v8 = [(NSCalendar *)calendar dateFromComponents:v7];

  [(EKDayViewWithGutters *)self setCurrentDate:v8];

  [(EKDayViewWithGutters *)self updateDividerLineVisibility];
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);

  [(EKDayViewWithGutters *)self updateLabelTexts];
}

- (void)updateDividerLineVisibility
{
  uint64_t v3 = [(EKDayView *)self->_dayView hasAllDaySection] ^ 1;

  [(EKDayViewWithGutters *)self setShowDividerLine:v3];
}

- (void)setAllDayHeight:(double)a3
{
  self->_double allDayHeight = a3;
  if (!self->_leftAllDayView)
  {
    double v4 = [(EKDayViewWithGutters *)self _createAllDayView];
    leftAllDayView = self->_leftAllDayView;
    self->_leftAllDayView = v4;

    double v6 = [(EKDayViewWithGutters *)self leftGutter];
    [v6 addSubview:self->_leftAllDayView];
  }
  if (!self->_rightAllDayView)
  {
    double v7 = [(EKDayViewWithGutters *)self _createAllDayView];
    rightAllDayView = self->_rightAllDayView;
    self->_rightAllDayView = v7;

    double v9 = [(EKDayViewWithGutters *)self rightGutter];
    [v9 addSubview:self->_rightAllDayView];
  }
  double gutterWidth = self->_gutterWidth;
  double v11 = gutterWidth + gutterWidth;
  double allDayHeight = self->_allDayHeight;
  -[EKDayAllDayView setFrame:](self->_leftAllDayView, "setFrame:", -gutterWidth, 0.0, gutterWidth + gutterWidth, allDayHeight);
  v13 = self->_rightAllDayView;

  -[EKDayAllDayView setFrame:](v13, "setFrame:", 0.0, 0.0, v11, allDayHeight);
}

- (id)_createAllDayView
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(EKDayViewWithGutters *)self gutterWidth];
  double v6 = -[EKDayAllDayView initWithFrame:sizeClass:]([EKDayAllDayView alloc], "initWithFrame:sizeClass:", self->_targetSizeClass, v3, v4, v5 + v5, self->_allDayHeight);
  [(EKDayAllDayView *)v6 setShowsLabel:0];
  [(EKDayAllDayView *)v6 setShowsBorderLines:1];
  [(EKDayAllDayView *)v6 setAutoresizingMask:32];

  return v6;
}

- (double)gutterWidth
{
  return self->_gutterWidth;
}

- (void)setGutterWidth:(double)a3
{
  self->_double gutterWidth = a3;
  double v5 = [(EKDayViewWithGutters *)self leftGutter];
  [v5 frame];
  double v27 = v6;
  double v28 = v7;
  double v9 = v8;

  v10 = [(EKDayViewWithGutters *)self dayView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  id v15 = [(EKDayViewWithGutters *)self rightGutter];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  [(EKDayViewWithGutters *)self bounds];
  double v21 = v20 + a3 * -2.0;
  v22 = [(EKDayViewWithGutters *)self dayView];
  objc_msgSend(v22, "setFrame:", a3, v12, v21, v14);

  v23 = [(EKDayViewWithGutters *)self leftGutter];
  objc_msgSend(v23, "setFrame:", v27, v9, a3, v28);

  v24 = [(EKDayViewWithGutters *)self rightGutter];
  objc_msgSend(v24, "setFrame:", v21 + a3, v17, a3, v19);

  v25 = [(EKDayViewWithGutters *)self dayView];
  [v25 setNeedsLayout];

  double allDayHeight = self->_allDayHeight;

  [(EKDayViewWithGutters *)self setAllDayHeight:allDayHeight];
}

- (EKDayView)dayView
{
  return self->_dayView;
}

- (UIView)rightGutter
{
  return self->_rightGutter;
}

- (UIView)leftGutter
{
  return self->_leftGutter;
}

+ (id)_smallWeekdayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:13.0 shouldScaleForSmallerSizes:18.0];

  return (id)objc_msgSend(a1, "_weekdayFontOfSize:");
}

void __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  double v4 = [WeakRetained[51] dateFromComponents:v3];

  [WeakRetained setCurrentDate:v4];
}

- (void)timeZoneChangedWithNewDate:(id)a3
{
  double v4 = (NSDate *)a3;
  CUIKCalendar();
  double v5 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  self->_calendar = v5;

  currentDate = self->_currentDate;
  self->_currentDate = v4;

  [(EKDayViewWithGutters *)self updateLabelTexts];
}

- (BOOL)isPointAllDay:(CGPoint)a3 requireAllDayRegionInsistence:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self->_topLabelsContainer frame];
  v11.double x = x;
  v11.double y = y;
  if (CGRectContainsPoint(v12, v11)) {
    return 1;
  }
  char v10 = 0;
  dayView = self->_dayView;
  -[EKDayView convertPoint:fromView:](dayView, "convertPoint:fromView:", self, x, y);
  -[EKDayView dateAtPoint:isAllDay:requireAllDayRegionInsistence:](dayView, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", &v10, v4);
  return v10 != 0;
}

- (UIView)topLabelsContainer
{
  return self->_topLabelsContainer;
}

- (void)setTopLabelsContainer:(id)a3
{
}

- (DayTwoPartLabel)weekDayLabel
{
  return self->_weekDayLabel;
}

- (void)setWeekDayLabel:(id)a3
{
}

- (UILabel)weekNumberLabel
{
  return self->_weekNumberLabel;
}

- (void)setWeekNumberLabel:(id)a3
{
}

- (UIView)dividerLine
{
  return self->_dividerLine;
}

- (void)setDividerLine:(id)a3
{
}

- (BOOL)showWeekDayLabel
{
  return self->_showWeekDayLabel;
}

- (BOOL)showWeekNumberLabel
{
  return self->_showWeekNumberLabel;
}

- (BOOL)showDividerLine
{
  return self->_showDividerLine;
}

- (double)allDayHeight
{
  return self->_allDayHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayView, 0);
  objc_storeStrong((id *)&self->_rightGutter, 0);
  objc_storeStrong((id *)&self->_leftGutter, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_weekDayLabel, 0);
  objc_storeStrong((id *)&self->_topLabelsContainer, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_rightAllDayView, 0);
  objc_storeStrong((id *)&self->_leftAllDayView, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end