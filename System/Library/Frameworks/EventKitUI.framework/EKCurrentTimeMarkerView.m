@interface EKCurrentTimeMarkerView
+ (double)_spacingAdjustmentFontSize;
+ (id)timeMarkerFontForSizeClass:(int64_t)a3;
- (BOOL)showsLine;
- (BOOL)showsThumb;
- (CGRect)_lineFrame;
- (CGRect)currentTimeFrame;
- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3;
- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4;
- (UILabel)currentTimeLabel;
- (double)extensionLineHeight;
- (double)markerInset;
- (double)markerWidth;
- (double)todayStart;
- (double)todayWidth;
- (void)_updateTimeWithForce:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)invalidateFonts;
- (void)setCurrentTimeLabel:(id)a3;
- (void)setShowsLine:(BOOL)a3;
- (void)setShowsThumb:(BOOL)a3;
- (void)setTodayStart:(double)a3;
- (void)setTodayWidth:(double)a3;
- (void)updateTime;
@end

@implementation EKCurrentTimeMarkerView

- (void)setTodayWidth:(double)a3
{
  self->_todayWidth = a3;
}

- (void)setTodayStart:(double)a3
{
  self->_todayStart = a3;
}

- (void)updateTime
{
}

- (void)_updateTimeWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(EKCurrentTimeMarkerView *)self currentTimeLabel];
  id v14 = [v5 text];

  v6 = CUIKNowDate();
  uint64_t v7 = *MEMORY[0x1E4F57568];
  v8 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  v9 = [v6 localizedStringWithFormat:v7 timeZone:v8];

  if (!CalInterfaceIsLeftToRight()
    || ([v9 isEqualToString:v14] ? (BOOL v10 = !v3) : (BOOL v10 = 0), !v10))
  {
    v11 = [(EKCurrentTimeMarkerView *)self currentTimeLabel];
    [v11 setText:v9];

    v12 = [MEMORY[0x1E4FB1618] whiteColor];
    v13 = [(EKCurrentTimeMarkerView *)self currentTimeLabel];
    [v13 setTextColor:v12];
  }
}

- (CGRect)currentTimeFrame
{
  [(UIView *)self->_timeLabelPill frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(EKCurrentTimeMarkerView *)self superview];
  -[EKCurrentTimeMarkerView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_lineFrame
{
  [(EKCurrentTimeMarkerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  if ([(EKCurrentTimeMarkerView *)self showsThumb])
  {
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    [(EKCurrentTimeMarkerView *)self markerWidth];
    double v11 = 0.0;
    if (!IsLeftToRight) {
      double v11 = v10;
    }
    double v8 = v8 - v11;
    if (IsLeftToRight) {
      double v4 = v10;
    }
  }
  [(EKCurrentTimeMarkerView *)self extensionLineHeight];
  double v13 = v12;
  [(EKCurrentTimeMarkerView *)self bounds];
  double v14 = v6 + (CGRectGetHeight(v18) - v13) * 0.5;
  double v15 = v4;
  double v16 = v8;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (BOOL)showsThumb
{
  return self->_showsThumb;
}

- (double)markerWidth
{
  v2 = [(EKCurrentTimeMarkerView *)self currentTimeLabel];
  objc_msgSend(v2, "sizeThatFits:", 10.0, 10.0);
  double v4 = v3;

  return v4 + 10.0;
}

- (double)markerInset
{
  return 5.0;
}

- (double)extensionLineHeight
{
  v2 = [(EKCurrentTimeMarkerView *)self traitCollection];
  BOOL v3 = EKUIUsesLargeTextLayout(v2);

  double result = 2.0;
  if (v3) {
    return 3.0;
  }
  return result;
}

- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  v38[6] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)EKCurrentTimeMarkerView;
  double v5 = -[EKCurrentTimeMarkerView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    [(EKCurrentTimeMarkerView *)v5 setOpaque:0];
    double v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKCurrentTimeMarkerView *)v6 setBackgroundColor:v7];

    [(EKCurrentTimeMarkerView *)v6 setUserInteractionEnabled:0];
    [(EKCurrentTimeMarkerView *)v6 setShowsLine:1];
    [(EKCurrentTimeMarkerView *)v6 setShowsThumb:0];
    [(EKCurrentTimeMarkerView *)v6 setTodayStart:0.0];
    [(EKCurrentTimeMarkerView *)v6 setTodayWidth:0.0];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(EKCurrentTimeMarkerView *)v6 setCurrentTimeLabel:v8];

    double v9 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v10 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    [v10 setTextAlignment:1];

    double v11 = [(id)objc_opt_class() timeMarkerFontForSizeClass:a4];
    double v12 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    [v12 setFont:v11];

    double v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    timeLabelPill = v6->_timeLabelPill;
    v6->_timeLabelPill = v13;

    [(UIView *)v6->_timeLabelPill setTranslatesAutoresizingMaskIntoConstraints:0];
    double v15 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_todayTimelineColor");
    [(UIView *)v6->_timeLabelPill setBackgroundColor:v15];

    double v16 = [(UIView *)v6->_timeLabelPill layer];
    [v16 setCornerRadius:6.0];

    [(UIView *)v6->_timeLabelPill setClipsToBounds:1];
    [(UIView *)v6->_timeLabelPill setHidden:1];
    double v17 = v6->_timeLabelPill;
    CGRect v18 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    [(UIView *)v17 addSubview:v18];

    [(EKCurrentTimeMarkerView *)v6 addSubview:v6->_timeLabelPill];
    double v19 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    v35 = [v19 constraintWithItem:v36 attribute:9 relatedBy:0 toItem:v6->_timeLabelPill attribute:9 multiplier:1.0 constant:0.0];
    v38[0] = v35;
    double v20 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    double v21 = [v20 constraintWithItem:v34 attribute:10 relatedBy:0 toItem:v6->_timeLabelPill attribute:10 multiplier:1.0 constant:0.0];
    v38[1] = v21;
    double v22 = (void *)MEMORY[0x1E4F28DC8];
    double v23 = v6->_timeLabelPill;
    v24 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    v25 = [v22 constraintWithItem:v23 attribute:7 relatedBy:0 toItem:v24 attribute:7 multiplier:1.0 constant:10.0];
    v38[2] = v25;
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = v6->_timeLabelPill;
    v28 = [(EKCurrentTimeMarkerView *)v6 currentTimeLabel];
    v29 = [v26 constraintWithItem:v27 attribute:8 relatedBy:0 toItem:v28 attribute:8 multiplier:1.0 constant:2.0];
    v38[3] = v29;
    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v6->_timeLabelPill attribute:10 multiplier:1.0 constant:0.0];
    v38[4] = v30;
    v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v6->_timeLabelPill attribute:5 multiplier:1.0 constant:0.0];
    v38[5] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
    [v19 activateConstraints:v32];
  }
  return v6;
}

- (UILabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (void)setShowsThumb:(BOOL)a3
{
  if (self->_showsThumb != a3)
  {
    BOOL v5 = !a3;
    [(UIView *)self->_timeLabelPill setHidden:!a3];
    if (v5)
    {
      double v6 = [(EKCurrentTimeMarkerView *)self subviews];
      [v6 makeObjectsPerformSelector:sel_removeFromSuperview];
    }
    else
    {
      [(EKCurrentTimeMarkerView *)self updateTime];
    }
  }
  self->_showsThumb = a3;
}

- (void)setShowsLine:(BOOL)a3
{
  if (self->_showsLine != a3)
  {
    self->_showsLine = a3;
    [(EKCurrentTimeMarkerView *)self setNeedsDisplay];
  }
}

+ (id)timeMarkerFontForSizeClass:(int64_t)a3
{
  BOOL v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  double v4 = [v3 fontDescriptor];
  [v4 pointSize];
  double v6 = v5;

  CalRoundToScreenScale(v6 * 1.09090909);
  double v8 = fmin(v7, 24.0);
  double v9 = (void *)MEMORY[0x1E4FB08E0];

  return (id)[v9 boldSystemFontOfSize:v8];
}

- (void)setCurrentTimeLabel:(id)a3
{
}

- (void)drawRect:(CGRect)a3
{
  if (!self->_showsLine) {
    return;
  }
  if (self->_showsThumb)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_todayTimelineColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
LABEL_7:
    double v6 = v4;
    [v4 set];

    [(EKCurrentTimeMarkerView *)self _lineFrame];
    double v9 = v8;
    CGFloat MinY = v10;
    CGFloat v13 = v12;
    goto LABEL_8;
  }
  [(EKCurrentTimeMarkerView *)self todayWidth];
  if (v5 == 0.0)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_nonTodayTimelineColor");
    goto LABEL_7;
  }
  [(EKCurrentTimeMarkerView *)self _lineFrame];
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;
  CGFloat v13 = CGRectGetHeight(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v46);
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double v22 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_todayTimelineColor");
  [v22 set];

  [(EKCurrentTimeMarkerView *)self todayStart];
  double v24 = v23;
  [(EKCurrentTimeMarkerView *)self todayWidth];
  double v26 = v25;
  if (IsLeftToRight)
  {
    double v27 = v24;
    CGFloat v28 = MinY;
    CGFloat v29 = v13;
    UIRectFill(*(CGRect *)(&v26 - 2));
    v30 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_nonTodayTimelineColor");
    [v30 set];

    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v47);
    [(EKCurrentTimeMarkerView *)self todayStart];
    v48.size.CGFloat width = v32 - MinX;
    v48.origin.CGFloat x = MinX;
    v48.origin.CGFloat y = MinY;
    v48.size.CGFloat height = v13;
    UIRectFill(v48);
    [(EKCurrentTimeMarkerView *)self todayStart];
    double v34 = v33;
    [(EKCurrentTimeMarkerView *)self todayWidth];
    double v9 = v34 + v35;
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v49) - v9;
  }
  else
  {
    CGFloat v36 = v24 - v25;
    [(EKCurrentTimeMarkerView *)self todayWidth];
    v50.size.CGFloat width = v37;
    v50.origin.CGFloat x = v36;
    v50.origin.CGFloat y = MinY;
    v50.size.CGFloat height = v13;
    UIRectFill(v50);
    v38 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_nonTodayTimelineColor");
    [v38 set];

    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double v39 = CGRectGetMinX(v51);
    [(EKCurrentTimeMarkerView *)self todayStart];
    double v41 = v40;
    [(EKCurrentTimeMarkerView *)self todayWidth];
    v52.size.CGFloat width = v41 - v42 - v39;
    v52.origin.CGFloat x = v39;
    v52.origin.CGFloat y = MinY;
    v52.size.CGFloat height = v13;
    UIRectFill(v52);
    [(EKCurrentTimeMarkerView *)self todayStart];
    double v9 = v43;
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v53);
  }
LABEL_8:
  double v14 = v9;
  CGFloat v15 = MinY;
  CGFloat v16 = v13;

  UIRectFill(*(CGRect *)(&MaxX - 2));
}

- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3
{
  return -[EKCurrentTimeMarkerView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (double)_spacingAdjustmentFontSize
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  BOOL v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5 * 0.454545455);
  return result;
}

- (void)invalidateFonts
{
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  double v4 = [(id)objc_opt_class() timeMarkerFontForSizeClass:v3];
  double v5 = [(EKCurrentTimeMarkerView *)self currentTimeLabel];
  [v5 setFont:v4];

  [(EKCurrentTimeMarkerView *)self _updateTimeWithForce:1];
}

- (BOOL)showsLine
{
  return self->_showsLine;
}

- (double)todayStart
{
  return self->_todayStart;
}

- (double)todayWidth
{
  return self->_todayWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);

  objc_storeStrong((id *)&self->_timeLabelPill, 0);
}

@end