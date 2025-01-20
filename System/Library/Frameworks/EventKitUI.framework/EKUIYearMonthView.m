@interface EKUIYearMonthView
+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
+ (id)_defaultTextColor;
- (BOOL)_pointIntersectsMonthName:(CGPoint)a3;
- (BOOL)_shouldUseRoundedRectInsteadOfCircle;
- (BOOL)computeCircleFrameWithoutAdjustments;
- (BOOL)containsCalendarDate:(id)a3;
- (BOOL)isCurrentMonth;
- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3;
- (BOOL)shouldAddPreciseInteractivity;
- (BOOL)showMonthName;
- (BOOL)showWeekDayInitials;
- (BOOL)vibrant;
- (CGPoint)_monthNameOriginPoint;
- (CGPoint)headerOrigin;
- (CGRect)_monthNameFrame;
- (CGRect)frameForGridOfDays:(BOOL)a3;
- (CGRect)frameForTodayHighlight;
- (CGSize)roundedRectSizeForDayNumberString:(id)a3;
- (EKCalendarDate)calendarDate;
- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider;
- (EKUIYearMonthView)initWithCalendarDate:(id)a3 calendar:(id)a4;
- (NSCalendar)calendar;
- (NSString)dayColorKey;
- (NSString)description;
- (UIColor)dayColor;
- (UIFont)dayNumberFont;
- (UIFont)headerFont;
- (UIFont)todayNumberFont;
- (UIFont)weekDayInitialsFont;
- (double)circleFrameXAdjustment;
- (double)circleFrameYAdjustment;
- (double)circleSize;
- (double)circleSizeForDoubleDigit;
- (double)dayNumberKerning;
- (double)dayTextSize;
- (double)daysXAdjustLeft;
- (double)daysYAdjustTop;
- (double)headerFontKerning;
- (double)headerFontMaxSize;
- (double)headerFontMinSize;
- (double)headerXAdjust;
- (double)minHeaderFontSizeUsed;
- (double)roundedRectCornerRadius;
- (double)todayNumberKerning;
- (double)todayTextSize;
- (double)todayTextYAdjustment;
- (double)weekDayInitialsAdjustLeft;
- (double)weekDayInitialsAdjustTop;
- (double)xInset;
- (double)xSpacing;
- (double)yInset;
- (double)ySpacing;
- (id)_containerForPreview;
- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5;
- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 forPreview:(BOOL)a6;
- (id)_imageForMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5;
- (id)_imageForMonthName:(id)a3;
- (id)_todayAttributes;
- (id)_weekDayInitialsImage;
- (id)calendarDateForPoint:(CGPoint)a3;
- (id)monthNameForDate:(id)a3;
- (id)monthString;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (int64_t)_dayIndexForPoint:(CGPoint)a3;
- (int64_t)daysInWeek;
- (void)_adjustHidingViewToFrame:(CGRect)a3;
- (void)_drawDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6;
- (void)_drawMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6;
- (void)_drawMonthName:(id)a3 atPoint:(CGPoint)a4;
- (void)_drawWeekDayInitialsAtPoint:(CGPoint)a3;
- (void)_getMetricsForDayIndex:(int64_t)a3 textFrame:(CGRect *)a4 circleFrame:(CGRect *)a5;
- (void)_getTodayNumberTextFrame:(CGRect *)a3 circleFrame:(CGRect *)a4;
- (void)_reloadCachedValues;
- (void)_setUpInteraction;
- (void)_updateFirstOfMonthAndYearIndices;
- (void)_updateToday;
- (void)_warmImageCache;
- (void)drawRect:(CGRect)a3;
- (void)localeChanged;
- (void)overlaySignificantDatesChangedInRange:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)pulseTodayCircle;
- (void)setCalendarDate:(id)a3;
- (void)setOverlaySignificantDatesProvider:(id)a3;
- (void)tintColorDidChange;
- (void)updateToday;
@end

@implementation EKUIYearMonthView

- (EKUIYearMonthView)initWithCalendarDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKUIYearMonthView;
  v8 = [(EKUIYearMonthView *)&v16 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(EKUIYearMonthView *)v8 setBackgroundColor:v9];

    objc_storeStrong((id *)&v8->_calendar, a4);
    uint64_t v10 = [v6 calendarDateForMonth];
    calendarDate = v8->_calendarDate;
    v8->_calendarDate = (EKCalendarDate *)v10;

    uint64_t v12 = [v6 calendarDateForEndOfMonth];
    endCalendarDate = v8->_endCalendarDate;
    v8->_endCalendarDate = (EKCalendarDate *)v12;

    [(EKUIYearMonthView *)v8 _reloadCachedValues];
    [(EKUIYearMonthView *)v8 setWantsDeepColorDrawing:0];
    if ([(EKUIYearMonthView *)v8 shouldAddPreciseInteractivity]) {
      [(EKUIYearMonthView *)v8 _setUpInteraction];
    }
    v14 = [(EKUIYearMonthView *)v8 layer];
    [v14 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.enableContext"];
    [v14 setNeedsDisplay];
  }
  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EKUIYearMonthView;
  v4 = [(EKUIYearMonthView *)&v8 description];
  v5 = [(EKUIYearMonthView *)self calendarDate];
  objc_msgSend(v3, "stringWithFormat:", @"%@;\n\tcalendarDate: [%@]\n\t_endCalendarDate: [%@]",
    v4,
    v5,
  id v6 = self->_endCalendarDate);

  return (NSString *)v6;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    CGContextRef v5 = CurrentContext;
    if ([(EKUIYearMonthView *)self showMonthName])
    {
      [(EKUIYearMonthView *)self _monthNameOriginPoint];
      double v7 = v6;
      double v9 = v8;
      uint64_t v10 = [(EKUIYearMonthView *)self _imageForMonthName:self->_monthString];
      if ((CalInterfaceIsLeftToRight() & 1) == 0)
      {
        [v10 size];
        double v7 = v7 - v11;
      }
      uint64_t v12 = [(EKUIYearMonthView *)self tintColor];
      [v12 set];

      objc_msgSend(v10, "drawAtPoint:", v7, v9);
    }
    [(EKUIYearMonthView *)self bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(EKUIYearMonthView *)self xInset];
    CGFloat v22 = v21;
    [(EKUIYearMonthView *)self yInset];
    CGFloat v24 = v23;
    v104.origin.double x = v14;
    v104.origin.double y = v16;
    v104.size.width = v18;
    v104.size.height = v20;
    CGRect v105 = CGRectInset(v104, v22, v24);
    double x = v105.origin.x;
    double y = v105.origin.y;
    if ([(EKUIYearMonthView *)self showWeekDayInitials])
    {
      [(EKUIYearMonthView *)self weekDayInitialsAdjustLeft];
      double v28 = x + v27;
      [(EKUIYearMonthView *)self weekDayInitialsAdjustTop];
      double v30 = y + v29;
      v31 = [(EKUIYearMonthView *)self _weekDayInitialsImage];
      objc_msgSend(v31, "drawAtPoint:", v28, v30);
    }
    [(EKUIYearMonthView *)self daysXAdjustLeft];
    double v33 = x + v32;
    [(EKUIYearMonthView *)self daysYAdjustTop];
    double v35 = y + v34;
    [(EKUIYearMonthView *)self xSpacing];
    double v37 = v36;
    [(EKUIYearMonthView *)self ySpacing];
    double v39 = v38;
    if (CalTimeDirectionIsLeftToRight())
    {
      firstDayIndedouble x = self->_firstDayIndex;
      double v41 = v33 + v37 * (double)firstDayIndex;
      int64_t daysInWeek = self->_daysInWeek;
    }
    else
    {
      int64_t daysInWeek = self->_daysInWeek;
      firstDayIndedouble x = self->_firstDayIndex;
      double v41 = v33 + v37 * (double)(daysInWeek + ~firstDayIndex);
    }
    v43 = [(id)objc_opt_class() _defaultTextColor];
    [v43 set];

    v44 = [(EKUIYearMonthView *)self calendarDate];
    uint64_t v45 = [v44 daysInMonth];

    int64_t v46 = self->_firstDayIndex + v45;
    id v47 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
    objc_msgSend(v47, "moveToPoint:", 0.0, v35);
    [(EKUIYearMonthView *)self bounds];
    double v49 = v48 + 0.0;
    objc_msgSend(v47, "addLineToPoint:", v48 + 0.0, v35);
    uint64_t v50 = v46 / 7;
    if (CalTimeDirectionIsLeftToRight())
    {
      objc_msgSend(v47, "addLineToPoint:", v49, v35 + (double)v50 * v39);
      double v49 = v33 + (double)(v46 % 7) * v37;
      objc_msgSend(v47, "addLineToPoint:", v49, v35 + (double)v50 * v39);
    }
    double v51 = v35 + (double)(v50 + 1) * v39;
    objc_msgSend(v47, "addLineToPoint:", v49, v51);
    double v100 = v39;
    if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
    {
      objc_msgSend(v47, "addLineToPoint:", v33 + (double)(7 * v50 - v46 + 7) * v37, v35 + (double)(v50 + 1) * v39);
      double v51 = v51 - v39;
      objc_msgSend(v47, "addLineToPoint:", v33 + (double)(7 * v50 - v46 + 7) * v37, v51);
    }
    objc_msgSend(v47, "addLineToPoint:", 0.0, v51);
    [v47 closePath];
    v52 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v52);
    v99 = v47;
    [v47 addClip];
    int64_t v53 = self->_daysInWeek + ~self->_firstDayIndex;
    [(EKUIYearMonthView *)self bounds];
    double v55 = v54;
    double v57 = v56;
    [(EKUIYearMonthView *)self daysYAdjustTop];
    double v59 = v57 - v58;
    double v60 = *MEMORY[0x1E4F1DAD8];
    [(EKUIYearMonthView *)self daysYAdjustTop];
    double v62 = v61;
    v98 = -[EKUIYearMonthView _imageForMonthDays:size:underlineThickness:](self, "_imageForMonthDays:size:underlineThickness:", v53, v55, v59, 0.0);
    objc_msgSend(v98, "drawAtPoint:", v60, v62);
    v63 = UIGraphicsGetCurrentContext();
    CGContextRestoreGState(v63);
    double v64 = v100;
    if (v45)
    {
      uint64_t v65 = 0;
      int64_t v66 = daysInWeek - firstDayIndex;
      double v67 = -1.0;
      do
      {
        double v68 = 0.0;
        if (v65 != self->_todayIndex)
        {
          firstOfOverlayYearIndices = self->_firstOfOverlayYearIndices;
          v70 = [NSNumber numberWithInteger:v65 + 1];
          LODWORD(firstOfOverlayYearIndices) = [(NSSet *)firstOfOverlayYearIndices containsObject:v70];

          if (firstOfOverlayYearIndices)
          {
            if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self)) {
              double v68 = 2.0;
            }
            else {
              double v68 = 1.5;
            }
          }
          else
          {
            firstOfOverlayMonthIndices = self->_firstOfOverlayMonthIndices;
            v72 = [NSNumber numberWithInteger:v65 + 1];
            LODWORD(firstOfOverlayMonthIndices) = [(NSSet *)firstOfOverlayMonthIndices containsObject:v72];

            if (firstOfOverlayMonthIndices)
            {
              if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self)) {
                double v68 = 1.0;
              }
              else {
                double v68 = 0.5;
              }
            }
          }
        }
        v73 = [(EKUIYearMonthView *)self traitCollection];
        BOOL v74 = EKUIUsesLargeTextYearView(v73);

        if (v74) {
          double v68 = v68 + v68;
        }
        if (v68 > 0.0 && v65 != self->_todayIndex)
        {
          v75 = CUIKLocalizedStringForInteger();
          CalRoundToScreenScale(v37);
          double v77 = v76;
          CalRoundToScreenScale(v64);
          double v79 = v78;
          CalRoundToScreenScale(v68);
          double v81 = v80;
          double v82 = v77;
          double v67 = -1.0;
          double v83 = v79;
          double v64 = v100;
          v84 = -[EKUIYearMonthView _imageForDayNumber:size:underlineThickness:](self, "_imageForDayNumber:size:underlineThickness:", v75, v82, v83, v81);
          objc_msgSend(v84, "drawAtPoint:", v41, v35);
        }
        if (v66-- <= 1)
        {
          int IsLeftToRight = CalTimeDirectionIsLeftToRight();
          int64_t v66 = self->_daysInWeek;
          if (IsLeftToRight) {
            double v41 = v33;
          }
          else {
            double v41 = v33 + v37 * (double)(v66 - 1);
          }
          double v35 = v64 + v35;
        }
        else
        {
          if (CalTimeDirectionIsLeftToRight()) {
            double v88 = 1.0;
          }
          else {
            double v88 = v67;
          }
          double v41 = v41 + v37 * v88;
        }
        ++v65;
      }
      while (v45 != v65);
    }
    if ((self->_todayIndex & 0x8000000000000000) == 0)
    {
      long long v102 = 0u;
      long long v103 = 0u;
      memset(&v101, 0, sizeof(v101));
      [(EKUIYearMonthView *)self _getTodayNumberTextFrame:&v102 circleFrame:&v101];
      if ([(EKUIYearMonthView *)self vibrant])
      {
        v89 = c;
        CGContextSaveGState(c);
        v90 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.52];
      }
      else
      {
        v90 = [(EKUIYearMonthView *)self tintColor];
        v89 = c;
      }
      [v90 set];

      if ([(EKUIYearMonthView *)self _shouldUseRoundedRectInsteadOfCircle])
      {
        v91 = (void *)MEMORY[0x1E4FB14C0];
        [(EKUIYearMonthView *)self roundedRectCornerRadius];
        v93 = objc_msgSend(v91, "bezierPathWithRoundedRect:cornerRadius:", *(_OWORD *)&v101.origin, *(_OWORD *)&v101.size, v92);
        [v93 fill];
      }
      else
      {
        CGContextFillEllipseInRect(v89, v101);
      }
      if ([(EKUIYearMonthView *)self vibrant])
      {
        v94 = [MEMORY[0x1E4FB1618] whiteColor];
        [v94 set];

        CGContextSetBlendMode(v89, kCGBlendModeXOR);
      }
      v95 = CUIKLocalizedStringForInteger();
      v96 = [(EKUIYearMonthView *)self _todayAttributes];
      objc_msgSend(v95, "drawInRect:withAttributes:", v96, v102, v103);

      if ([(EKUIYearMonthView *)self vibrant]) {
        CGContextRestoreGState(v89);
      }
    }
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIYearMonthView;
  [(EKUIYearMonthView *)&v4 tintColorDidChange];
  v3 = [(EKUIYearMonthView *)self layer];
  [v3 setNeedsDisplay];
}

- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3
{
  double y = a3.y;
  [(EKUIYearMonthView *)self _monthNameOriginPoint];
  double v6 = v5;
  double v7 = [(EKUIYearMonthView *)self headerFont];
  [v7 ascender];
  double v9 = v8;

  return y <= v6 + v9;
}

- (void)updateToday
{
  self->_todayIndedouble x = -1;
  [(EKUIYearMonthView *)self _updateToday];
}

- (void)setCalendarDate:(id)a3
{
  objc_super v4 = [a3 calendarDateForMonth];
  if (self->_calendarDate != v4)
  {
    double v7 = v4;
    objc_storeStrong((id *)&self->_calendarDate, v4);
    double v5 = [(EKCalendarDate *)v7 calendarDateForEndOfMonth];
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = v5;

    [(EKUIYearMonthView *)self _reloadCachedValues];
    objc_super v4 = v7;
  }
}

- (BOOL)containsCalendarDate:(id)a3
{
  id v4 = a3;
  double v5 = [(EKUIYearMonthView *)self calendarDate];
  uint64_t v6 = [v5 compare:v4];

  BOOL v7 = v6 != 1 && [(EKCalendarDate *)self->_endCalendarDate compare:v4] != -1;
  return v7;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)headerOrigin
{
  [(EKUIYearMonthView *)self _monthNameOriginPoint];
  double v4 = v3;
  double v6 = v5 + 0.5;
  BOOL v7 = [(EKUIYearMonthView *)self traitCollection];
  BOOL v8 = EKUIUsesLargeTextYearView(v7);

  if (v8) {
    double v9 = v6 + 0.5;
  }
  else {
    double v9 = v6;
  }
  double v10 = v4;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (void)_getTodayNumberTextFrame:(CGRect *)a3 circleFrame:(CGRect *)a4
{
}

- (void)_getMetricsForDayIndex:(int64_t)a3 textFrame:(CGRect *)a4 circleFrame:(CGRect *)a5
{
  double v9 = [(EKUIYearMonthView *)self todayNumberFont];
  [v9 capHeight];
  double v11 = v10;
  uint64_t v12 = [(EKUIYearMonthView *)self dayNumberFont];
  [v12 capHeight];
  CalRoundToScreenScale((v11 - v13) * 0.5);
  double v15 = v14;

  int64_t v16 = self->_firstDayIndex + a3;
  int64_t v17 = v16 / self->_daysInWeek;
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  int64_t daysInWeek = self->_daysInWeek;
  uint64_t v20 = v16 - daysInWeek * v17;
  uint64_t v21 = daysInWeek + ~v16 + daysInWeek * v17;
  if (IsLeftToRight) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v21;
  }
  [(EKUIYearMonthView *)self xInset];
  double v24 = v23;
  [(EKUIYearMonthView *)self daysXAdjustLeft];
  double v26 = v24 + v25;
  [(EKUIYearMonthView *)self yInset];
  double v28 = v27;
  [(EKUIYearMonthView *)self daysYAdjustTop];
  double v30 = v28 + v29;
  [(EKUIYearMonthView *)self xSpacing];
  double v32 = v31;
  [(EKUIYearMonthView *)self ySpacing];
  double v33 = v26 + v32 * (double)v22;
  double v61 = v34;
  double v35 = v30 + v34 * (double)v17;
  if ([(EKUIYearMonthView *)self _shouldUseRoundedRectInsteadOfCircle])
  {
    double v36 = CUIKLocalizedStringForInteger();
    [(EKUIYearMonthView *)self roundedRectSizeForDayNumberString:v36];
    double v38 = v37;
    double v40 = v39;
  }
  else
  {
    if (a3 < 9) {
      [(EKUIYearMonthView *)self circleSize];
    }
    else {
      [(EKUIYearMonthView *)self circleSizeForDoubleDigit];
    }
    double v38 = v41;
    double v40 = v41;
  }
  double v42 = v35 - v15;
  double v43 = (v32 - v38) * 0.5;
  double v44 = v33 + v43;
  if ([(EKUIYearMonthView *)self computeCircleFrameWithoutAdjustments])
  {
    uint64_t v45 = [(EKUIYearMonthView *)self todayNumberFont];
    [v45 ascender];
    double v47 = v42 + v46;
    double v48 = [(EKUIYearMonthView *)self todayNumberFont];
    [v48 capHeight];
    double v50 = v47 - v49 * 0.5 - v40 * 0.5;

    if (!a4) {
      goto LABEL_17;
    }
LABEL_16:
    a4->origin.double x = CalRoundRectToScreenScale(v33, v42, v32, v61);
    a4->origin.double y = v55;
    a4->size.width = v56;
    a4->size.height = v57;
    goto LABEL_17;
  }
  double v51 = v42 + v43 + -0.5;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
  {
    double v51 = v51 + -4.0;
    double v42 = v42 + -1.0;
  }
  [(EKUIYearMonthView *)self circleFrameYAdjustment];
  double v50 = v51 + v52;
  [(EKUIYearMonthView *)self circleFrameXAdjustment];
  double v44 = v44 + v53;
  [(EKUIYearMonthView *)self todayTextYAdjustment];
  double v42 = v42 + v54;
  if (a4) {
    goto LABEL_16;
  }
LABEL_17:
  if (a5)
  {
    a5->origin.double x = CalRoundRectToScreenScale(v44, v50, v38, v40);
    a5->origin.double y = v58;
    a5->size.width = v59;
    a5->size.height = v60;
  }
}

- (id)_todayAttributes
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v3 setAlignment:1];
  if ([(EKUIYearMonthView *)self vibrant]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v13[0] = *MEMORY[0x1E4FB06F8];
  double v5 = [(EKUIYearMonthView *)self todayNumberFont];
  uint64_t v6 = *MEMORY[0x1E4FB0738];
  v14[0] = v5;
  v14[1] = v3;
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v13[1] = v6;
  v13[2] = v7;
  v14[2] = v4;
  v13[3] = *MEMORY[0x1E4FB0710];
  BOOL v8 = NSNumber;
  [(EKUIYearMonthView *)self todayNumberKerning];
  *(float *)&double v9 = v9;
  double v10 = [v8 numberWithFloat:v9];
  v14[3] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (void)pulseTodayCircle
{
  todayIndedouble x = self->_todayIndex;
  if ((todayIndex & 0x8000000000000000) == 0)
  {
    int64_t v4 = todayIndex + 1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    [(EKUIYearMonthView *)self _getTodayNumberTextFrame:&v20 circleFrame:&v18];
    IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self);
    double v6 = 1.0;
    if (IsRegularInViewHierarchy) {
      CalRoundToScreenScale(0.4);
    }
    *((double *)&v20 + 1) = v6 + *((double *)&v20 + 1);
    uint64_t v7 = [EKUITodayCirclePulseView alloc];
    BOOL v8 = -[EKUITodayCirclePulseView initWithFrame:](v7, "initWithFrame:", v20, v21);
    [(EKUITodayCirclePulseView *)v8 setDontApplyCenteringOffset:1];
    if ([(EKUIYearMonthView *)self _shouldUseRoundedRectInsteadOfCircle])
    {
      [(EKUITodayCirclePulseView *)v8 setUsesRoundedRectInsteadOfCircle:1];
      [(EKUIYearMonthView *)self roundedRectCornerRadius];
      -[EKUITodayCirclePulseView setRoundedRectCornerRadius:](v8, "setRoundedRectCornerRadius:");
      -[EKUITodayCirclePulseView setFrame:](v8, "setFrame:", v18, v19);
      [(EKUITodayCirclePulseView *)v8 setCircleShouldFillFrame:1];
    }
    else
    {
      [(EKUITodayCirclePulseView *)v8 setCircleDiameter:*(double *)&v19 + -0.5];
    }
    double v9 = [NSNumber numberWithInteger:v4];
    double v10 = [v9 stringValue];
    [(EKUITodayCirclePulseView *)v8 setString:v10];

    double v11 = [(EKUIYearMonthView *)self todayNumberFont];
    [(EKUITodayCirclePulseView *)v8 setFont:v11];

    uint64_t v12 = [(EKUIYearMonthView *)self _todayAttributes];
    [(EKUITodayCirclePulseView *)v8 setAttributes:v12];

    if ([(EKUIYearMonthView *)self _shouldUseRoundedRectInsteadOfCircle])
    {
      double v13 = *((double *)&v20 + 1) - *((double *)&v18 + 1);
    }
    else
    {
      double v14 = EKUIScaleFactor();
      double v13 = 1.0;
      if (v14 > 1.0) {
        double v13 = -0.5;
      }
    }
    -[EKUITodayCirclePulseView setTextOffsetFromCircle:](v8, "setTextOffsetFromCircle:", 0.0, v13);
    [(EKUITodayCirclePulseView *)v8 layoutIfNeeded];
    [(EKUIYearMonthView *)self addSubview:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__EKUIYearMonthView_pulseTodayCircle__block_invoke;
    v16[3] = &unk_1E6087570;
    int64_t v17 = v8;
    double v15 = v8;
    [(EKUITodayCirclePulseView *)v15 pulse:v16];
  }
}

uint64_t __37__EKUIYearMonthView_pulseTodayCircle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (CGRect)frameForTodayHighlight
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v7 = *MEMORY[0x1E4F1DB28];
  long long v8 = v2;
  if ((self->_todayIndex & 0x8000000000000000) == 0) {
    [(EKUIYearMonthView *)self _getTodayNumberTextFrame:0 circleFrame:&v7];
  }
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)daysInWeek
{
  return self->_daysInWeek;
}

- (id)monthString
{
  return self->_monthString;
}

- (BOOL)_shouldUseRoundedRectInsteadOfCircle
{
  long long v2 = [(EKUIYearMonthView *)self traitCollection];
  char v4 = EKUIUsesRoundedRectsInsteadOfCircles(v2, v3);

  return v4;
}

- (void)localeChanged
{
  uint64_t v3 = (void *)__weekDayInitialsImages;
  __weekDayInitialsImages = 0;

  [(EKUIYearMonthView *)self _reloadCachedValues];
}

- (double)dayNumberKerning
{
  return 0.0;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)roundedRectCornerRadius
{
  [(EKUIYearMonthView *)self circleSize];
  double v3 = v2 / 4.5;

  CalRoundToScreenScale(v3);
  return result;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  [(EKUIYearMonthView *)self circleSize];
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)showMonthName
{
  return 1;
}

- (BOOL)vibrant
{
  return 0;
}

- (double)circleFrameXAdjustment
{
  return 0.0;
}

- (double)circleFrameYAdjustment
{
  return 0.0;
}

- (double)todayTextYAdjustment
{
  return 0.0;
}

- (NSString)dayColorKey
{
  return 0;
}

- (UIColor)dayColor
{
  double v2 = objc_opt_class();

  return (UIColor *)[v2 _defaultTextColor];
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

- (id)calendarDateForPoint:(CGPoint)a3
{
  int64_t v4 = -[EKUIYearMonthView _dayIndexForPoint:](self, "_dayIndexForPoint:", a3.x, a3.y);
  if (v4 < 0
    || (unint64_t v5 = v4,
        [(EKUIYearMonthView *)self calendarDate],
        double v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 daysInMonth],
        v6,
        v5 >= v7))
  {
    double v10 = 0;
  }
  else
  {
    long long v8 = [(EKUIYearMonthView *)self calendarDate];
    double v9 = [v8 calendarDateForMonth];
    double v10 = [v9 calendarDateByAddingDays:v5];
  }

  return v10;
}

- (int64_t)_dayIndexForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(EKUIYearMonthView *)self xInset];
  double v7 = v6;
  [(EKUIYearMonthView *)self daysXAdjustLeft];
  double v9 = v8;
  [(EKUIYearMonthView *)self yInset];
  double v11 = v10;
  [(EKUIYearMonthView *)self daysYAdjustTop];
  double v13 = v11 + v12;
  if (y < v13) {
    return -1;
  }
  double v14 = v7 + v9;
  [(EKUIYearMonthView *)self xSpacing];
  double v16 = v15;
  [(EKUIYearMonthView *)self ySpacing];
  uint64_t v18 = (uint64_t)((y - v13) / v17);
  uint64_t v19 = (uint64_t)((x - v14) / v16);
  firstDayIndedouble x = self->_firstDayIndex;
  long long v21 = [(EKUIYearMonthView *)self calendarDate];
  int64_t v22 = (unint64_t)([v21 daysInMonth] + firstDayIndex) / self->_daysInWeek;

  if (v22 >= v18) {
    uint64_t v23 = v18;
  }
  else {
    uint64_t v23 = v22;
  }
  if (v18 < 0) {
    uint64_t v23 = 0;
  }
  int64_t daysInWeek = self->_daysInWeek;
  uint64_t v25 = daysInWeek - 1;
  if (daysInWeek > v19) {
    uint64_t v25 = (uint64_t)((x - v14) / v16);
  }
  if (v19 >= 0) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 0;
  }
  int64_t v27 = v23 * daysInWeek;
  if (CalInterfaceIsLeftToRight())
  {
    unint64_t v28 = v26 + v27 - self->_firstDayIndex;
    if ((v28 & 0x8000000000000000) != 0) {
      return -1;
    }
  }
  else
  {
    unint64_t v28 = v27 - v26 + self->_firstDayIndex;
    if ((v28 & 0x8000000000000000) != 0) {
      return -1;
    }
  }
  double v30 = [(EKUIYearMonthView *)self calendarDate];
  BOOL v31 = v28 < [v30 daysInMonth];

  if (v31) {
    return v28;
  }
  else {
    return -1;
  }
}

- (void)_setUpInteraction
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
  [(EKUIYearMonthView *)self addInteraction:v3];
}

- (CGRect)_monthNameFrame
{
  if (self->_monthString)
  {
    [(EKUIYearMonthView *)self _monthNameOriginPoint];
    double v4 = v3;
    double v6 = v5;
    double v7 = [(EKUIYearMonthView *)self _imageForMonthName:self->_monthString];
    [v7 size];
    double v9 = v8;
    [v7 size];
    double v11 = v10;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_pointIntersectsMonthName:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(EKUIYearMonthView *)self _monthNameFrame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)_adjustHidingViewToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  hidingView = self->_hidingView;
  if (!hidingView)
  {
    CGFloat v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    CGFloat v10 = self->_hidingView;
    self->_hidingView = v9;

    double v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)self->_hidingView setBackgroundColor:v11];

    [(EKUIYearMonthView *)self addSubview:self->_hidingView];
    hidingView = self->_hidingView;
  }
  [(UIView *)hidingView setHidden:0];
  double v12 = self->_hidingView;

  -[UIView setFrame:](v12, "setFrame:", x, y, width, height);
}

- (id)_containerForPreview
{
  if (!self->_previewContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(EKUIYearMonthView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    previewContainerView = self->_previewContainerView;
    self->_previewContainerView = v4;

    double v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_previewContainerView setBackgroundColor:v6];

    [(UIView *)self->_previewContainerView setUserInteractionEnabled:0];
    [(EKUIYearMonthView *)self addSubview:self->_previewContainerView];
    [(UIView *)self->_previewContainerView setAutoresizingMask:18];
  }
  [(EKUIYearMonthView *)self bounds];
  -[UIView setFrame:](self->_previewContainerView, "setFrame:");
  [(EKUIYearMonthView *)self bringSubviewToFront:self->_previewContainerView];
  double v7 = self->_previewContainerView;

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  if ([(EKUIYearMonthView *)self shouldAddPreciseInteractivity])
  {
    [v6 location];
    int64_t v7 = -[EKUIYearMonthView _dayIndexForPoint:](self, "_dayIndexForPoint:");
    if ((v7 & 0x8000000000000000) == 0)
    {
      unint64_t v8 = v7;
      CGFloat v9 = [(EKUIYearMonthView *)self calendarDate];
      unint64_t v10 = [v9 daysInMonth];

      if (v8 < v10)
      {
        memset(v22, 0, sizeof(v22));
        long long v20 = 0u;
        long long v21 = 0u;
        [(EKUIYearMonthView *)self _getMetricsForDayIndex:v8 textFrame:v22 circleFrame:&v20];
        double v11 = (void *)MEMORY[0x1E4FB1AD8];
        double v13 = *((double *)&v20 + 1);
        double v12 = *(double *)&v20;
        double v15 = *((double *)&v21 + 1);
        double v14 = *(double *)&v21;
        double v16 = 0;
LABEL_7:
        uint64_t v18 = objc_msgSend(v11, "regionWithRect:identifier:", v16, v12, v13, v14, v15);
        goto LABEL_9;
      }
    }
    [v6 location];
    if (-[EKUIYearMonthView _pointIntersectsMonthName:](self, "_pointIntersectsMonthName:"))
    {
      double v17 = (void *)MEMORY[0x1E4FB1AD8];
      [(EKUIYearMonthView *)self _monthNameFrame];
      double v16 = @"year_month_name";
      double v11 = v17;
      goto LABEL_7;
    }
  }
  uint64_t v18 = 0;
LABEL_9:

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a4;
  if ([(EKUIYearMonthView *)self shouldAddPreciseInteractivity])
  {
    [v6 rect];
    -[EKUIYearMonthView _adjustHidingViewToFrame:](self, "_adjustHidingViewToFrame:");
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  if ([(EKUIYearMonthView *)self shouldAddPreciseInteractivity])
  {
    hidingView = self->_hidingView;
    [(UIView *)hidingView setHidden:1];
  }
}

- (CGPoint)_monthNameOriginPoint
{
  [(EKUIYearMonthView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(EKUIYearMonthView *)self xInset];
  CGFloat v12 = v11;
  [(EKUIYearMonthView *)self yInset];
  CGFloat v14 = v13;
  v25.origin.double x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  CGRect v26 = CGRectInset(v25, v12, v14);
  double x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  if (CalInterfaceIsLeftToRight())
  {
    [(EKUIYearMonthView *)self headerXAdjust];
    double v20 = x + v19;
  }
  else
  {
    v27.origin.double x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v27);
    [(EKUIYearMonthView *)self headerXAdjust];
    double v20 = MaxX - v22;
  }
  double v23 = y;
  result.CGFloat y = v23;
  result.double x = v20;
  return result;
}

- (void)_reloadCachedValues
{
  CUIKCalendar();
  double v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  self->_calendar = v3;

  double v5 = [(EKUIYearMonthView *)self calendarDate];
  id v16 = [v5 date];

  [(NSCalendar *)self->_calendar rangeOfUnit:512 inUnit:4096 forDate:v16];
  int64_t v7 = v6;
  CGFloat v8 = [(NSCalendar *)self->_calendar components:528 fromDate:v16];
  unint64_t v9 = CUIKOneIndexedWeekStart();
  unint64_t v10 = [v8 weekday];
  int64_t v11 = v7 - v9 + v10;
  if (v10 > v9) {
    int64_t v11 = v10 - v9;
  }
  if (v10 == v9) {
    int64_t v11 = 0;
  }
  self->_firstDayIndedouble x = v11;
  self->_int64_t daysInWeek = v7;
  if (CUIKCurrentLocaleRequiresUnabbrevatedMonthNames()) {
    CUIKLongStringForMonth();
  }
  else {
  CGFloat v12 = CUIKStringForMonth();
  }
  double v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  CGFloat v14 = [v12 capitalizedStringWithLocale:v13];

  monthString = self->_monthString;
  self->_monthString = v14;

  self->_todayIndedouble x = -1;
  [(EKUIYearMonthView *)self setNeedsDisplay];
  [(EKUIYearMonthView *)self _updateToday];
  [(EKUIYearMonthView *)self _updateFirstOfMonthAndYearIndices];
}

- (void)_updateFirstOfMonthAndYearIndices
{
  overlaySignificantDatesProvider = self->_overlaySignificantDatesProvider;
  CGFloat v4 = [(EKCalendarDate *)self->_calendarDate date];
  double v5 = [(EKUIOverlayCalendarSignificantDatesProvider *)overlaySignificantDatesProvider firstOfOverlayMonthsForCalendarMonth:v4];
  firstOfOverlayMonthIndices = self->_firstOfOverlayMonthIndices;
  self->_firstOfOverlayMonthIndices = v5;

  int64_t v7 = self->_overlaySignificantDatesProvider;
  CGFloat v8 = [(EKCalendarDate *)self->_calendarDate date];
  unint64_t v9 = [(EKUIOverlayCalendarSignificantDatesProvider *)v7 firstOfOverlayYearsForCalendarMonth:v8];
  firstOfOverlayYearIndices = self->_firstOfOverlayYearIndices;
  self->_firstOfOverlayYearIndices = v9;

  [(EKUIYearMonthView *)self setNeedsDisplay];
}

- (void)overlaySignificantDatesChangedInRange:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (v4)
  {
    int64_t v6 = [v4 distinctRanges];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__EKUIYearMonthView_overlaySignificantDatesChangedInRange___block_invoke;
    v7[3] = &unk_1E6088D78;
    v7[4] = self;
    v7[5] = &v8;
    [v6 enumerateObjectsUsingBlock:v7];

    if (!*((unsigned char *)v9 + 24)) {
      goto LABEL_6;
    }
  }
  else
  {
    char v11 = 1;
  }
  [(EKUIYearMonthView *)self _updateFirstOfMonthAndYearIndices];
LABEL_6:
  _Block_object_dispose(&v8, 8);
}

void __59__EKUIYearMonthView_overlaySignificantDatesChangedInRange___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 496);
  id v6 = a2;
  int64_t v7 = [v5 date];
  int v8 = [v6 containsDate:v7];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)setOverlaySignificantDatesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, a3);

  [(EKUIYearMonthView *)self _updateFirstOfMonthAndYearIndices];
}

- (void)_updateToday
{
  calendar = self->_calendar;
  id v4 = CUIKTodayDate();
  double v5 = [(NSCalendar *)calendar components:14 fromDate:v4];

  id v6 = [(NSCalendar *)self->_calendar dateFromComponents:v5];
  int64_t v7 = [(EKUIYearMonthView *)self calendarDate];
  int v8 = [v7 date];
  int v9 = [v6 isEqualToDate:v8];

  if (v9)
  {
    CUIKTodayComponents();
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    todayIndedouble x = self->_todayIndex;
    if (todayIndex != [v11 day] - 1)
    {
      self->_todayIndedouble x = [v11 day] - 1;
      [(EKUIYearMonthView *)self setNeedsDisplay];
    }
  }
  else
  {
    id v11 = v5;
  }
}

- (BOOL)isCurrentMonth
{
  double v3 = (void *)MEMORY[0x1E4F57838];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  double v5 = [(NSCalendar *)self->_calendar timeZone];
  id v6 = [v3 calendarDateWithDate:v4 timeZone:v5];

  LOBYTE(self) = [(EKUIYearMonthView *)self containsCalendarDate:v6];
  return (char)self;
}

- (void)_drawMonthName:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(EKUIYearMonthView *)self headerFontMaxSize];
  if (vabdd_f64(v8, *(double *)&_drawMonthName_atPoint__s_desiredFontSizeForSmallestUsedFontSize) >= 2.22044605e-16) {
    _drawMonthName_atPoint__s_smallestUsedFontSize = 0x7FF0000000000000;
  }
  [(EKUIYearMonthView *)self headerFontMaxSize];
  if (v9 >= *(double *)&_drawMonthName_atPoint__s_smallestUsedFontSize) {
    double v10 = *(double *)&_drawMonthName_atPoint__s_smallestUsedFontSize;
  }
  else {
    double v10 = v9;
  }
  [(EKUIYearMonthView *)self headerFontMinSize];
  double v12 = v11;
  [(EKUIYearMonthView *)self bounds];
  double Width = CGRectGetWidth(v45);
  [(EKUIYearMonthView *)self xSpacing];
  double v15 = Width - v14;
  id v16 = [(EKUIYearMonthView *)self headerFont];
  double v17 = [v16 fontDescriptor];

  uint64_t v18 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v17 size:v10];
  if ([(EKUIYearMonthView *)self isCurrentMonth]) {
    [(EKUIYearMonthView *)self tintColor];
  }
  else {
  double v19 = [MEMORY[0x1E4FB1618] labelColor];
  }
  double v20 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v21 = *MEMORY[0x1E4FB06F8];
  uint64_t v22 = *MEMORY[0x1E4FB0700];
  double v23 = NSNumber;
  [(EKUIYearMonthView *)self headerFontKerning];
  *(float *)&double v24 = v24;
  CGRect v25 = [v23 numberWithFloat:v24];
  CGRect v26 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v18, v21, v19, v22, v25, *MEMORY[0x1E4FB0710], 0);

  [v7 sizeWithAttributes:v26];
  double v28 = v27;
  double v30 = v29;
  if (v27 <= v15)
  {
    p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL____UIBasicAnimationFactory + 16);
    unint64_t v32 = 0x1E4FB1000;
  }
  else if (v10 >= v12)
  {
    p_prots = &OBJC_PROTOCOL____UIBasicAnimationFactory.prots;
    unint64_t v32 = 0x1E4FB1000uLL;
    while (1)
    {
      double v33 = v18;
      double v10 = v10 + -1.0;
      uint64_t v18 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v17 size:v10];

      [v26 setObject:v18 forKey:v21];
      [v7 sizeWithAttributes:v26];
      double v28 = v34;
      double v30 = v35;
      if (v34 <= v15) {
        break;
      }
      if (v10 < v12) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL____UIBasicAnimationFactory + 16);
    unint64_t v32 = 0x1E4FB1000;
LABEL_16:
    id v36 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v36 setLineBreakMode:4];
    [v26 setObject:v36 forKey:*MEMORY[0x1E4FB0738]];
  }
  if (v10 < *((double *)p_prots + 371))
  {
    *((double *)p_prots + 371) = v10;
    double v37 = +[EKUISemiConstantCache sharedInstance];
    [v37 setMinYearMonthHeaderFontSizeUsed:v10];

    [(EKUIYearMonthView *)self headerFontMaxSize];
    _drawMonthName_atPoint__s_desiredFontSizeForSmallestUsedFontSize = v38;
  }
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  CTFontGetLanguageAwareOutsets();
  if (CalInterfaceIsLeftToRight()) {
    double v39 = (double *)&v43;
  }
  else {
    double v39 = (double *)&v44;
  }
  double v40 = CalCeilToScreenScale(v28 + *v39);
  CGFloat v41 = ceil(v30 + 0.0 + 0.0);
  double v42 = [*(id *)(v32 + 1560) systemBackgroundColor];
  [v42 setFill];

  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.CGFloat width = v40;
  v46.size.CGFloat height = v41;
  UIRectFill(v46);
  objc_msgSend(v7, "drawInRect:withAttributes:", v26, x, y, v40, v41);
}

- (id)_imageForMonthName:(id)a3
{
  id v4 = a3;
  if (_imageForMonthName__onceToken != -1) {
    dispatch_once(&_imageForMonthName__onceToken, &__block_literal_global_22);
  }
  double v68 = v4;
  if ((_imageForMonthName__warmingCache & 1) == 0)
  {
    double v5 = +[EKUISemiConstantCache sharedInstance];
    [v5 minYearMonthHeaderFontSizeUsed];
    double v7 = v6;

    if (v7 == 0.0)
    {
      _imageForMonthName__warmingCache = 1;
      [(EKUIYearMonthView *)self _warmImageCache];
      _imageForMonthName__warmingCache = 0;
    }
  }
  uint64_t v8 = [(EKUIYearMonthView *)self tintAdjustmentMode];
  double v9 = NSNumber;
  [(EKUIYearMonthView *)self bounds];
  *(float *)&double v11 = v10;
  double v12 = [v9 numberWithFloat:v11];
  double v13 = [NSNumber numberWithInteger:EKUICurrentWindowSizeParadigmForViewHierarchy(self)];
  double v67 = NSString;
  double v14 = (objc_class *)objc_opt_class();
  double v15 = NSStringFromClass(v14);
  id v16 = @"normal";
  if (v8 == 2) {
    double v17 = @"dimmed";
  }
  else {
    double v17 = @"normal";
  }
  uint64_t v18 = [v12 stringValue];
  double v19 = [v13 stringValue];
  if ([(EKUIYearMonthView *)self vibrant]) {
    id v16 = @"vibrant";
  }
  if ([(EKUIYearMonthView *)self isCurrentMonth]) {
    double v20 = @"current";
  }
  else {
    double v20 = @"not";
  }
  uint64_t v21 = [(EKUIYearMonthView *)self traitCollection];
  uint64_t v22 = [v21 userInterfaceStyle];
  double v23 = @"light";
  if (v22 == 2) {
    double v23 = @"dark";
  }
  double v64 = v16;
  double v24 = v68;
  CGRect v25 = [v67 stringWithFormat:@"%@:%@:%@:%@:%@:%@:%@:%@", v68, v15, v17, v18, v19, v64, v20, v23];

  CGRect v26 = [(id)_imageForMonthName__s_cache objectForKey:v25];
  if (!v26)
  {
    int64_t v66 = v12;
    [(EKUIYearMonthView *)self headerFontMaxSize];
    if (vabdd_f64(v27, *(double *)&_imageForMonthName__s_desiredFontSizeForSmallestUsedFontSize) >= 2.22044605e-16) {
      _imageForMonthName__s_smallestUsedFontSize = 0x7FF0000000000000;
    }
    [(EKUIYearMonthView *)self headerFontMaxSize];
    if (v28 >= *(double *)&_imageForMonthName__s_smallestUsedFontSize) {
      double v29 = *(double *)&_imageForMonthName__s_smallestUsedFontSize;
    }
    else {
      double v29 = v28;
    }
    [(EKUIYearMonthView *)self headerFontMinSize];
    double v31 = v30;
    [(EKUIYearMonthView *)self bounds];
    double Width = CGRectGetWidth(v79);
    [(EKUIYearMonthView *)self xSpacing];
    double v34 = Width - v33;
    double v35 = [(EKUIYearMonthView *)self headerFont];
    id v36 = [v35 fontDescriptor];

    double v37 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v36 size:v29];
    uint64_t v65 = v25;
    if ([(EKUIYearMonthView *)self isCurrentMonth]) {
      [(EKUIYearMonthView *)self tintColor];
    }
    else {
    uint64_t v38 = [MEMORY[0x1E4FB1618] labelColor];
    }
    double v39 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v40 = *MEMORY[0x1E4FB06F8];
    uint64_t v41 = *MEMORY[0x1E4FB0700];
    double v42 = NSNumber;
    [(EKUIYearMonthView *)self headerFontKerning];
    *(float *)&double v43 = v43;
    uint64_t v44 = [v42 numberWithFloat:v43];
    CGRect v45 = objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v37, v40, v38, v41, v44, *MEMORY[0x1E4FB0710], 0);

    CGRect v46 = v68;
    [v68 sizeWithAttributes:v45];
    double v48 = v47;
    double v50 = v49;
    if (v47 > v34)
    {
      if (v29 < v31)
      {
LABEL_29:
        id v54 = objc_alloc_init(MEMORY[0x1E4FB0848]);
        [v54 setLineBreakMode:4];
        [v45 setObject:v54 forKey:*MEMORY[0x1E4FB0738]];

        CGRect v46 = v68;
      }
      else
      {
        while (1)
        {
          double v51 = v37;
          double v29 = v29 + -1.0;
          double v37 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v36 size:v29];

          [v45 setObject:v37 forKey:v40];
          [v68 sizeWithAttributes:v45];
          double v48 = v52;
          double v50 = v53;
          if (v52 <= v34) {
            break;
          }
          if (v29 < v31) {
            goto LABEL_29;
          }
        }
      }
    }
    if (v29 < *(double *)&_imageForMonthName__s_smallestUsedFontSize)
    {
      _imageForMonthName__s_smallestUsedFontSize = *(void *)&v29;
      CGFloat v55 = +[EKUISemiConstantCache sharedInstance];
      [v55 setMinYearMonthHeaderFontSizeUsed:v29];

      CGRect v46 = v68;
      [(EKUIYearMonthView *)self headerFontMaxSize];
      _imageForMonthName__s_desiredFontSizeForSmallestUsedFontSize = v56;
      [(id)_imageForMonthName__s_cache removeAllObjects];
    }
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    double v75 = 0.0;
    double v74 = 0.0;
    CTFontGetLanguageAwareOutsets();
    if (CalInterfaceIsLeftToRight()) {
      CGFloat v57 = (double *)&v76;
    }
    else {
      CGFloat v57 = (double *)&v77;
    }
    double v58 = CalCeilToScreenScale(v48 + *v57);
    double v59 = ceil(v50 + v75 + v74);
    CGFloat v60 = objc_opt_new();
    [v60 setScale:EKUIScaleFactor()];
    [v60 setOpaque:1];
    [v60 setPreferredRange:2];
    double v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v60, v58, v59);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __40__EKUIYearMonthView__imageForMonthName___block_invoke_2;
    v69[3] = &unk_1E6088DA0;
    double v72 = v58;
    double v73 = v59;
    id v70 = v46;
    id v71 = v45;
    double v24 = v46;
    id v62 = v45;
    CGRect v26 = [v61 imageWithActions:v69];
    CGRect v25 = v65;
    [(id)_imageForMonthName__s_cache setObject:v26 forKey:v65];

    double v12 = v66;
  }

  return v26;
}

void __40__EKUIYearMonthView__imageForMonthName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_imageForMonthName__s_cache;
  _imageForMonthName__s_cache = (uint64_t)v0;
}

uint64_t __40__EKUIYearMonthView__imageForMonthName___block_invoke_2(double *a1)
{
  double v2 = a1[6];
  double v3 = a1[7];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setFill];

  v9.origin.double x = 0.0;
  v9.origin.double y = 0.0;
  v9.size.CGFloat width = v2;
  v9.size.CGFloat height = v3;
  UIRectFill(v9);
  double v5 = (void *)*((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);

  return objc_msgSend(v5, "drawInRect:withAttributes:", v6, 0.0, 0.0, v2, v3);
}

- (double)minHeaderFontSizeUsed
{
  double v3 = +[EKUISemiConstantCache sharedInstance];
  [v3 minYearMonthHeaderFontSizeUsed];
  double v5 = v4;

  if (v5 == 0.0) {
    [(EKUIYearMonthView *)self _warmImageCache];
  }
  uint64_t v6 = +[EKUISemiConstantCache sharedInstance];
  [v6 minYearMonthHeaderFontSizeUsed];
  double v8 = v7;

  return v8;
}

- (void)_warmImageCache
{
  double v3 = [(NSCalendar *)self->_calendar monthSymbols];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [(EKCalendarDate *)self->_calendarDate calendarDateByAddingMonths:i];
      double v7 = [v6 date];
      double v8 = [(EKUIYearMonthView *)self monthNameForDate:v7];

      id v9 = [(EKUIYearMonthView *)self _imageForMonthName:v8];
    }
  }
}

- (id)monthNameForDate:(id)a3
{
  id v3 = a3;
  if (CUIKCurrentLocaleRequiresUnabbrevatedMonthNames()) {
    CUIKLongStringForMonth();
  }
  else {
  uint64_t v4 = CUIKStringForMonth();
  }

  double v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [v4 capitalizedStringWithLocale:v5];

  return v6;
}

- (void)_drawWeekDayInitialsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v27[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = CUIKWeekdayVeryShortAbbreviations();
  [(EKUIYearMonthView *)self xSpacing];
  double v8 = v7;
  unint64_t v9 = CUIKZeroIndexedWeekStart();
  unint64_t v10 = [v6 count];
  double v11 = [(EKUIYearMonthView *)self weekDayInitialsFont];
  [v11 ascender];
  double v13 = v12;
  [v11 descender];
  CalRoundToScreenScale(v13 - v14);
  double v16 = v15;
  if (CTFontGetLanguageAwareOutsets()) {
    double v16 = CalCeilToScreenScale(v16 + 0.0 + 0.0);
  }
  double v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v17 setFill];

  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.CGFloat width = v8 * (double)v10;
  v28.size.CGFloat height = v16;
  UIRectFill(v28);
  id v18 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v18 setAlignment:1];
  double v19 = +[EKUIYearMonthView _defaultTextColor];
  if ([(EKUIYearMonthView *)self vibrant])
  {
    uint64_t v20 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.52];

    double v19 = (void *)v20;
  }
  uint64_t v21 = *MEMORY[0x1E4FB0738];
  v26[0] = *MEMORY[0x1E4FB06F8];
  v26[1] = v21;
  v27[0] = v11;
  v27[1] = v18;
  v26[2] = *MEMORY[0x1E4FB0700];
  v27[2] = v19;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  if (v10)
  {
    unint64_t v23 = v10;
    do
    {
      if (CalTimeDirectionIsLeftToRight()) {
        unint64_t v24 = v9 % v10;
      }
      else {
        unint64_t v24 = v10 + ~(v9 % v10);
      }
      CGRect v25 = [v6 objectAtIndexedSubscript:v24];
      objc_msgSend(v25, "drawInRect:withAttributes:", v22, x, y, v8, v16);
      double x = v8 + x;

      ++v9;
      --v23;
    }
    while (v23);
  }
}

- (id)_weekDayInitialsImage
{
  if (!__weekDayInitialsImages)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)__weekDayInitialsImages;
    __weekDayInitialsImages = (uint64_t)v3;
  }
  double v5 = CUIKWeekdayVeryShortAbbreviations();
  [(EKUIYearMonthView *)self xSpacing];
  double v7 = v6;
  uint64_t v8 = [v5 count] * (int)v6;
  unint64_t v9 = NSString;
  unint64_t v10 = [(EKUIYearMonthView *)self traitCollection];
  double v11 = objc_msgSend(v9, "stringWithFormat:", @"weekdayInitialImage:%d:%tu", v8, objc_msgSend(v10, "userInterfaceStyle"));

  double v12 = [(id)__weekDayInitialsImages objectForKey:v11];
  if (!v12)
  {
    uint64_t v13 = CUIKZeroIndexedWeekStart();
    unint64_t v14 = [v5 count];
    double v15 = [(EKUIYearMonthView *)self weekDayInitialsFont];
    [v15 ascender];
    double v17 = v16;
    [v15 descender];
    CalRoundToScreenScale(v17 - v18);
    double v20 = v19;
    double v35 = 0.0;
    double v34 = 0.0;
    if (CTFontGetLanguageAwareOutsets()) {
      double v20 = CalCeilToScreenScale(v20 + v35 + v34);
    }
    uint64_t v21 = objc_opt_new();
    [v21 setScale:EKUIScaleFactor()];
    [v21 setOpaque:1];
    [v21 setPreferredRange:2];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v21, v7 * (double)v14, v20);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __42__EKUIYearMonthView__weekDayInitialsImage__block_invoke;
    v25[3] = &unk_1E6088DC8;
    double v28 = v7 * (double)v14;
    double v29 = v20;
    v25[4] = self;
    id v26 = v15;
    unint64_t v30 = v14;
    uint64_t v31 = v13;
    id v27 = v5;
    double v32 = v7;
    double v33 = v20;
    id v23 = v15;
    double v12 = [v22 imageWithActions:v25];
    [(id)__weekDayInitialsImages setObject:v12 forKey:v11];
  }

  return v12;
}

void __42__EKUIYearMonthView__weekDayInitialsImage__block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  CGFloat v2 = *(double *)(a1 + 56);
  CGFloat v3 = *(double *)(a1 + 64);
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setFill];

  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.CGFloat width = v2;
  v19.size.CGFloat height = v3;
  UIRectFill(v19);
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v5 setAlignment:1];
  double v6 = +[EKUIYearMonthView _defaultTextColor];
  if ([*(id *)(a1 + 32) vibrant])
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.52];

    double v6 = (void *)v7;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v9;
  v18[0] = v8;
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E4FB0700];
  v18[2] = v6;
  unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  unint64_t v11 = *(void *)(a1 + 72);
  if (v11)
  {
    unint64_t v12 = 0;
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      unint64_t v15 = (v12 + *(void *)(a1 + 80)) % v11;
      if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
        unint64_t v15 = *(void *)(a1 + 72) + ~v15;
      }
      double v16 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v15];
      objc_msgSend(v16, "drawInRect:withAttributes:", v10, v14, v13, *(double *)(a1 + 88), *(double *)(a1 + 96));
      double v14 = v14 + *(double *)(a1 + 88);

      ++v12;
      unint64_t v11 = *(void *)(a1 + 72);
    }
    while (v12 < v11);
  }
}

- (void)_drawMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  [(EKUIYearMonthView *)self bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(EKUIYearMonthView *)self xInset];
  CGFloat v20 = v19;
  [(EKUIYearMonthView *)self yInset];
  CGFloat v22 = v21;
  v52.origin.double x = v12;
  v52.origin.double y = v14;
  v52.size.CGFloat width = v16;
  v52.size.CGFloat height = v18;
  CGRect v53 = CGRectInset(v52, v20, v22);
  double v23 = v53.origin.x;
  double v24 = v53.origin.y;
  [(EKUIYearMonthView *)self daysXAdjustLeft];
  double v26 = v25;
  [(EKUIYearMonthView *)self xSpacing];
  double v28 = v27;
  [(EKUIYearMonthView *)self ySpacing];
  double v30 = v29;
  int64_t daysInWeek = self->_daysInWeek;
  uint64_t v32 = 2 * daysInWeek - a3 + 29;
  uint64_t v33 = v32 % daysInWeek;
  if (CalTimeDirectionIsLeftToRight()) {
    firstDayIndedouble x = self->_firstDayIndex;
  }
  else {
    firstDayIndedouble x = self->_daysInWeek + ~self->_firstDayIndex;
  }
  double v35 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v35 setFill];

  [(EKUIYearMonthView *)self bounds];
  UIRectFill(v54);
  id v36 = [(id)objc_opt_class() _defaultTextColor];
  [v36 set];

  int64_t v37 = self->_firstDayIndex;
  uint64_t v38 = v32 - v33;
  if (v38 - v37 >= 1)
  {
    uint64_t v39 = 0;
    double v40 = v26 + x + v23;
    double v41 = y + v24;
    double v42 = v40 + v28 * (double)firstDayIndex;
    int64_t v43 = self->_daysInWeek - v37;
    do
    {
      ++v39;
      uint64_t v44 = CUIKLocalizedStringForInteger();
      CalRoundToScreenScale(v28);
      double v46 = v45;
      CalRoundToScreenScale(v30);
      -[EKUIYearMonthView _drawDayNumber:size:underlineThickness:atPoint:](self, "_drawDayNumber:size:underlineThickness:atPoint:", v44, v46, v47, a5, v42, v41);
      if (v43-- <= 1)
      {
        int IsLeftToRight = CalTimeDirectionIsLeftToRight();
        int64_t v43 = self->_daysInWeek;
        if (IsLeftToRight) {
          double v42 = v40;
        }
        else {
          double v42 = v40 + v28 * (double)(v43 - 1);
        }
        double v41 = v30 + v41;
      }
      else
      {
        int v50 = CalTimeDirectionIsLeftToRight();
        double v51 = -1.0;
        if (v50) {
          double v51 = 1.0;
        }
        double v42 = v42 + v28 * v51;
      }
    }
    while (v39 < v38 - self->_firstDayIndex);
  }
}

- (id)_imageForMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  if (_imageForMonthDays_size_underlineThickness__onceToken != -1) {
    dispatch_once(&_imageForMonthDays_size_underlineThickness__onceToken, &__block_literal_global_69);
  }
  [(EKUIYearMonthView *)self bounds];
  uint64_t v11 = (int)v10;
  uint64_t v12 = EKUICurrentWindowSizeParadigmForViewHierarchy(self);
  double v13 = [(EKUIYearMonthView *)self dayNumberFont];
  [v13 pointSize];
  uint64_t v15 = (int)v14;

  CGFloat v16 = [(EKUIYearMonthView *)self dayColorKey];
  if (v16)
  {
    double v17 = [(EKUIYearMonthView *)self dayColorKey];
  }
  else
  {
    double v17 = @"default";
  }

  id v18 = [NSString alloc];
  double v19 = [(EKUIYearMonthView *)self traitCollection];
  uint64_t v20 = [v19 userInterfaceStyle];
  double v21 = @"light";
  if (v20 == 2) {
    double v21 = @"dark";
  }
  CGFloat v22 = (void *)[v18 initWithFormat:@"%d:%d:%f:%f:%d:%d:%@:%f:%@", a3, v11, *(void *)&width, *(void *)&height, v12, v15, v17, *(void *)&a5, v21];

  double v23 = [(id)_imageForMonthDays_size_underlineThickness__cache objectForKey:v22];
  if (!v23)
  {
    [(EKUIYearMonthView *)self bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(EKUIYearMonthView *)self xInset];
    CGFloat v33 = v32;
    [(EKUIYearMonthView *)self yInset];
    CGFloat v35 = v34;
    v53.origin.double x = v25;
    v53.origin.CGFloat y = v27;
    v53.size.double width = v29;
    v53.size.CGFloat height = v31;
    CGRect v54 = CGRectInset(v53, v33, v35);
    double x = v54.origin.x;
    CGFloat y = v54.origin.y;
    [(EKUIYearMonthView *)self daysXAdjustLeft];
    double v39 = v38 + x;
    [(EKUIYearMonthView *)self xSpacing];
    uint64_t v41 = v40;
    [(EKUIYearMonthView *)self ySpacing];
    double v43 = v42;
    int64_t daysInWeek = self->_daysInWeek;
    uint64_t v45 = (2 * daysInWeek - a3 + 29) / daysInWeek;
    double v46 = v42 * (double)v45;
    uint64_t v47 = v45 * daysInWeek;
    double v48 = objc_opt_new();
    [v48 setScale:EKUIScaleFactor()];
    [v48 setOpaque:1];
    [v48 setPreferredRange:2];
    double v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v48, width, v46);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke_2;
    v51[3] = &unk_1E6088DF0;
    v51[5] = v41;
    *(double *)&v51[6] = v43;
    v51[4] = self;
    *(double *)&v51[7] = v39;
    *(CGFloat *)&v51[8] = y;
    v51[9] = v47;
    *(double *)&v51[10] = a5;
    double v23 = [v49 imageWithActions:v51];
    [(id)_imageForMonthDays_size_underlineThickness__cache setObject:v23 forKey:v22];
  }

  return v23;
}

void __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_imageForMonthDays_size_underlineThickness__cache;
  _imageForMonthDays_size_underlineThickness__cache = (uint64_t)v0;
}

void __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  uint64_t v5 = *(void *)(a1 + 32);
  if (IsLeftToRight) {
    uint64_t v6 = *(void *)(v5 + 424);
  }
  else {
    uint64_t v6 = *(void *)(v5 + 432) + ~*(void *)(v5 + 424);
  }
  double v7 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  double v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v10 setFill];

  [*(id *)(a1 + 32) bounds];
  UIRectFill(v27);
  uint64_t v11 = [(id)objc_opt_class() _defaultTextColor];
  [v11 set];

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v12 + 424);
  if (*(void *)(a1 + 72) > v13)
  {
    uint64_t v14 = 0;
    double v15 = v9 + v7 * (double)v6;
    uint64_t v16 = *(void *)(v12 + 432) - v13;
    do
    {
      ++v14;
      double v17 = CUIKLocalizedStringForInteger();
      CalRoundToScreenScale(v2);
      double v19 = v18;
      CalRoundToScreenScale(v3);
      double v21 = objc_msgSend(*(id *)(a1 + 32), "_imageForDayNumber:size:underlineThickness:", v17, v19, v20, *(double *)(a1 + 80));
      objc_msgSend(v21, "drawAtPoint:", v15, v8);
      if (v16-- <= 1)
      {
        int v23 = CalTimeDirectionIsLeftToRight();
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 432);
        if (v23) {
          double v15 = *(double *)(a1 + 56);
        }
        else {
          double v15 = *(double *)(a1 + 56) + *(double *)(a1 + 40) * (double)(v16 - 1);
        }
        double v8 = v8 + *(double *)(a1 + 48);
      }
      else
      {
        double v24 = *(double *)(a1 + 40);
        if (CalTimeDirectionIsLeftToRight()) {
          double v26 = 1.0;
        }
        else {
          double v26 = -1.0;
        }
        double v15 = v15 + v24 * v26;
      }
    }
    while (v14 < *(void *)(a1 + 72) - *(void *)(*(void *)(a1 + 32) + 424));
  }
}

- (void)_drawDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.height;
  double width = a4.width;
  v37[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v13 setAlignment:1];
  uint64_t v14 = [(EKUIYearMonthView *)self dayNumberFont];
  double v15 = +[EKUIYearMonthView _defaultTextColor];
  uint64_t v16 = [(EKUIYearMonthView *)self dayColorKey];
  if (v16)
  {
    double v17 = (void *)v16;
    double v18 = [(EKUIYearMonthView *)self dayColor];

    if (v18)
    {
      uint64_t v19 = [(EKUIYearMonthView *)self dayColor];

      double v15 = (void *)v19;
    }
  }
  uint64_t v20 = *MEMORY[0x1E4FB0738];
  v36[0] = *MEMORY[0x1E4FB06F8];
  v36[1] = v20;
  v37[0] = v14;
  v37[1] = v13;
  uint64_t v21 = *MEMORY[0x1E4FB0700];
  v37[2] = v15;
  uint64_t v22 = *MEMORY[0x1E4FB0710];
  v36[2] = v21;
  v36[3] = v22;
  int v23 = NSNumber;
  [(EKUIYearMonthView *)self dayNumberKerning];
  *(float *)&double v24 = v24;
  CGFloat v25 = [v23 numberWithFloat:v24];
  v37[3] = v25;
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];

  CGRect v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v27 setFill];

  v38.origin.double x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  UIRectFill(v38);
  objc_msgSend(v12, "drawInRect:withAttributes:", v26, x, y, width, height);
  if (a5 > 0.0)
  {
    double v28 = CalendarAppTintColor();
    [v28 set];

    objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    CGFloat v30 = v29;
    CalRoundToScreenScale(x + (width - v29) * 0.5);
    CGFloat v32 = v31;
    IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self);
    double v34 = 3.0;
    if (IsRegularInViewHierarchy) {
      double v34 = 6.5;
    }
    CalRoundToScreenScale(y + height - v34);
    v39.origin.double y = v35;
    v39.origin.double x = v32;
    v39.size.double width = v30;
    v39.size.double height = a5;
    UIRectFill(v39);
  }
}

- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5
{
  return -[EKUIYearMonthView _imageForDayNumber:size:underlineThickness:forPreview:](self, "_imageForDayNumber:size:underlineThickness:forPreview:", a3, 0, a4.width, a4.height, a5);
}

- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 forPreview:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  v66[4] = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  if (_imageForDayNumber_size_underlineThickness_forPreview__onceToken != -1) {
    dispatch_once(&_imageForDayNumber_size_underlineThickness_forPreview__onceToken, &__block_literal_global_78);
  }
  BOOL v48 = v6;
  BOOL v50 = !v6;
  [(EKUIYearMonthView *)self bounds];
  uint64_t v12 = (int)v11;
  uint64_t v13 = EKUICurrentWindowSizeParadigmForViewHierarchy(self);
  uint64_t v14 = [(EKUIYearMonthView *)self dayColorKey];
  if (v14)
  {
    double v15 = [(EKUIYearMonthView *)self dayColorKey];
  }
  else
  {
    double v15 = @"default";
  }

  id v16 = [NSString alloc];
  double v17 = (objc_class *)objc_opt_class();
  double v18 = NSStringFromClass(v17);
  uint64_t v19 = [(EKUIYearMonthView *)self traitCollection];
  uint64_t v20 = [v19 preferredContentSizeCategory];
  uint64_t v21 = [(EKUIYearMonthView *)self dayNumberFont];
  [v21 pointSize];
  uint64_t v23 = v22;
  double v24 = [(EKUIYearMonthView *)self traitCollection];
  if ([v24 userInterfaceStyle] == 2) {
    CGFloat v25 = @"dark";
  }
  else {
    CGFloat v25 = @"light";
  }
  double v26 = (void *)[v16 initWithFormat:@"%@:%@:%@:%d:%d:%f:%@:%f%i:%@", v49, v18, v20, v12, v13, v23, v15, *(void *)&a5, v50, v25];

  CGRect v27 = [(id)_imageForDayNumber_size_underlineThickness_forPreview__cache objectForKey:v26];
  if (!v27)
  {
    uint64_t v47 = v15;
    id v28 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v28 setAlignment:1];
    double v29 = [(EKUIYearMonthView *)self dayNumberFont];
    CGFloat v30 = +[EKUIYearMonthView _defaultTextColor];
    uint64_t v31 = [(EKUIYearMonthView *)self dayColorKey];
    if (v31)
    {
      CGFloat v32 = (void *)v31;
      CGFloat v33 = [(EKUIYearMonthView *)self dayColor];

      if (v33)
      {
        uint64_t v34 = [(EKUIYearMonthView *)self dayColor];

        CGFloat v30 = (void *)v34;
      }
    }
    uint64_t v35 = *MEMORY[0x1E4FB0738];
    v65[0] = *MEMORY[0x1E4FB06F8];
    v65[1] = v35;
    v66[0] = v29;
    v66[1] = v28;
    uint64_t v36 = *MEMORY[0x1E4FB0700];
    v66[2] = v30;
    uint64_t v37 = *MEMORY[0x1E4FB0710];
    v65[2] = v36;
    v65[3] = v37;
    CGRect v38 = NSNumber;
    [(EKUIYearMonthView *)self dayNumberKerning];
    *(float *)&double v39 = v39;
    uint64_t v40 = [v38 numberWithFloat:v39];
    v66[3] = v40;
    uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];

    double v42 = objc_opt_new();
    [v42 setScale:EKUIScaleFactor()];
    [v42 setOpaque:v50];
    [v42 setPreferredRange:2];
    double v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v42, width, height);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke_2;
    v51[3] = &unk_1E6088E18;
    BOOL v63 = v50;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    double v58 = width;
    double v59 = height;
    BOOL v64 = v48;
    double v60 = width;
    double v61 = height;
    id v52 = v29;
    id v53 = v49;
    id v54 = v41;
    double v62 = a5;
    CGFloat v55 = self;
    id v44 = v41;
    id v45 = v29;
    CGRect v27 = [v43 imageWithActions:v51];
    [(id)_imageForDayNumber_size_underlineThickness_forPreview__cache setObject:v27 forKey:v26];

    double v15 = v47;
  }

  return v27;
}

void __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_imageForDayNumber_size_underlineThickness_forPreview__cache;
  _imageForDayNumber_size_underlineThickness_forPreview__cache = (uint64_t)v0;
}

void __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = a2;
  if (*(unsigned char *)(a1 + 120))
  {
    double v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v3 setFill];

    UIRectFill(*(CGRect *)(a1 + 64));
  }
  if (*(unsigned char *)(a1 + 121))
  {
    double v4 = *(double *)(a1 + 104) * 0.5;
    [*(id *)(a1 + 32) lineHeight];
    double v6 = v4 - v5 * 0.5;
    double v7 = *(double *)(a1 + 80);
    double v8 = *(double *)(a1 + 88);
    double v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = 0.0;
  }
  else
  {
    double v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 72);
    double v7 = *(double *)(a1 + 80);
    double v8 = *(double *)(a1 + 88);
  }
  objc_msgSend(v9, "drawInRect:withAttributes:", v10, v11, v6, v7, v8);
  if (*(double *)(a1 + 112) > 0.0)
  {
    uint64_t v12 = CalendarAppTintColor();
    [v12 set];

    objc_msgSend(*(id *)(a1 + 40), "boundingRectWithSize:options:attributes:context:", 0, *(void *)(a1 + 48), 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    CGFloat v14 = v13;
    CalRoundToScreenScale((*(double *)(a1 + 96) - v13) * 0.5);
    CGFloat v16 = v15;
    double v17 = *(double *)(a1 + 104);
    IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(*(void **)(a1 + 56));
    double v19 = 3.0;
    if (IsRegularInViewHierarchy) {
      double v19 = 6.5;
    }
    CalRoundToScreenScale(v17 - v19);
    v23.origin.double y = v20;
    v23.size.double height = *(CGFloat *)(a1 + 112);
    v23.origin.double x = v16;
    v23.size.double width = v14;
    UIRectFill(v23);
  }
}

+ (id)_defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider
{
  return self->_overlaySignificantDatesProvider;
}

- (double)circleSizeForDoubleDigit
{
  return self->_circleSizeForDoubleDigit;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return self->_computeCircleFrameWithoutAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_previewContainerView, 0);
  objc_storeStrong((id *)&self->_hidingView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_firstOfOverlayYearIndices, 0);
  objc_storeStrong((id *)&self->_firstOfOverlayMonthIndices, 0);
  objc_storeStrong((id *)&self->_monthString, 0);

  objc_storeStrong((id *)&self->_endCalendarDate, 0);
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  return 0.0;
}

- (double)xInset
{
  return 0.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return 0.0;
}

- (double)headerFontMaxSize
{
  return 0.0;
}

- (double)headerFontMinSize
{
  return 0.0;
}

- (UIFont)headerFont
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];

  return (UIFont *)objc_msgSend(v2, "systemFontOfSize:");
}

- (double)headerFontKerning
{
  return 0.0;
}

- (UIFont)dayNumberFont
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];

  return (UIFont *)objc_msgSend(v2, "systemFontOfSize:");
}

- (UIFont)todayNumberFont
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];

  return (UIFont *)objc_msgSend(v2, "systemFontOfSize:");
}

- (double)dayTextSize
{
  return 0.0;
}

- (double)todayTextSize
{
  return 0.0;
}

- (double)circleSize
{
  return 0.0;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  return 0.0;
}

- (double)xSpacing
{
  return 0.0;
}

- (double)ySpacing
{
  return 0.0;
}

- (BOOL)showWeekDayInitials
{
  return 0;
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  return 0.0;
}

- (UIFont)weekDayInitialsFont
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];

  return (UIFont *)objc_msgSend(v2, "systemFontOfSize:");
}

@end