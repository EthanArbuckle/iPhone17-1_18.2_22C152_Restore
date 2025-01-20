@interface EKDayGridView
+ (id)cachedBackgroundImageForKey:(id)a3;
+ (void)cacheBackgroundImage:(id)a3 forKey:(id)a4;
- (BOOL)_showsTimeDot;
- (BOOL)animatesTimeMarker;
- (BOOL)isSelected;
- (BOOL)rightBorderInsetsOccurrences;
- (BOOL)showsLeftBorder;
- (BOOL)showsRightBorder;
- (BOOL)showsTimeLine;
- (BOOL)showsTimeMarker;
- (BOOL)useMultiDayStyle;
- (CGRect)rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCurrentTimeMarkerView)timeMarker;
- (EKDayGridView)initWithFrame:(CGRect)a3;
- (EKDayGridView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 backgroundColor:(id)a5 opaque:(BOOL)a6 numberOfDaysToDisplay:(unint64_t)a7;
- (UIColor)lineColor;
- (UIView)occurrenceContainerView;
- (UIVisualEffect)gridVisualEffect;
- (double)_dayWidth;
- (double)bottomPadding;
- (double)eventHorizontalInset;
- (double)fixedDayWidth;
- (double)gridHeightScale;
- (double)hourHeight;
- (double)hoursToPadBottom;
- (double)hoursToPadTop;
- (double)positionOfSecond:(int64_t)a3;
- (double)timeInset;
- (double)timeWidth;
- (double)topPadding;
- (double)widthForOccurrences;
- (id)_generateGridImage;
- (id)_timeDotImage;
- (int)secondAtPosition:(double)a3;
- (int64_t)_sizeClass;
- (int64_t)highlightedDayIndex;
- (int64_t)timeMarkerTodayDay;
- (void)_layoutHighlight;
- (void)_updateTimeMarker;
- (void)didMoveToWindow;
- (void)hideNowDot:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAnimatesTimeMarker:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEventHorizontalInset:(double)a3;
- (void)setFixedDayWidth:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGridHeightScale:(double)a3;
- (void)setGridVisualEffect:(id)a3;
- (void)setHighlightedDayIndex:(int64_t)a3;
- (void)setHoursToPadBottom:(double)a3;
- (void)setHoursToPadTop:(double)a3;
- (void)setLineColor:(id)a3;
- (void)setOccurrenceContainerView:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRightBorderInsetsOccurrences:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setShowsRightBorder:(BOOL)a3;
- (void)setShowsTimeLine:(BOOL)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setTimeMarkerTodayDay:(int64_t)a3;
- (void)setUseMultiDayStyle:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateHourHeight;
- (void)updateMarkerPosition;
@end

@implementation EKDayGridView

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKDayGridView;
  -[EKDayGridView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(EKDayGridView *)self bounds];
  self->_cachedWidthForOffMainThreadWork = v4;
}

- (double)widthForOccurrences
{
  double result = self->_cachedWidthForOffMainThreadWork;
  if ((*((unsigned char *)self + 424) & 2) != 0 && self->_rightBorderInsetsOccurrences) {
    return result + -1.0;
  }
  return result;
}

- (double)positionOfSecond:(int64_t)a3
{
  [(EKDayGridView *)self hourHeight];
  double v6 = v5;
  [(EKDayGridView *)self topPadding];

  +[EKDayTimeView positionOfSecond:a3 hourHeight:0 topPadding:v6 clampToBounds:v7];
  return result;
}

- (int)secondAtPosition:(double)a3
{
  [(EKDayGridView *)self topPadding];
  if (v5 >= a3) {
    return 0;
  }
  double v6 = a3 - v5;
  [(EKDayGridView *)self hourHeight];
  return llround(v6 / (v7 * 24.0) * 86400.0);
}

- (double)topPadding
{
  +[EKDayTimeView verticalPadding];
  return v3 + self->_hoursToPadTop * self->_hourHeight;
}

- (double)hourHeight
{
  return self->_hourHeight;
}

- (double)timeWidth
{
  return self->_timeWidth;
}

- (UIView)occurrenceContainerView
{
  return self->_occurrenceContainerView;
}

- (BOOL)showsTimeLine
{
  return self->_showsTimeLine;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)EKDayGridView;
  [(EKDayGridView *)&v4 tintColorDidChange];
  [(id)__cachedTimeDotImages removeAllObjects];
  double v3 = [(EKDayGridView *)self _timeDotImage];
  [(UIImageView *)self->_timeDot setImage:v3];
}

- (id)_timeDotImage
{
  if (!__cachedTimeDotImages)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    objc_super v4 = (void *)__cachedTimeDotImages;
    __cachedTimeDotImages = v3;
  }
  double v5 = [(EKDayGridView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  double v7 = @"dark";
  if (v6 == 1) {
    double v7 = @"light";
  }
  v8 = v7;

  v9 = [(id)__cachedTimeDotImages objectForKey:v8];
  if (!v9)
  {
    CalRoundToScreenScale(8.0);
    uint64_t v15 = 0;
    v16 = (double *)&v15;
    uint64_t v17 = 0x4010000000;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    v18 = "";
    uint64_t v21 = v10;
    uint64_t v22 = v10;
    id v11 = objc_alloc(MEMORY[0x1E4FB17D8]);
    v12 = objc_msgSend(v11, "initWithBounds:", v16[4], v16[5], v16[6], v16[7]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __30__EKDayGridView__timeDotImage__block_invoke;
    v14[3] = &unk_1E608A8D0;
    v14[4] = &v15;
    v9 = [v12 imageWithActions:v14];
    [(id)__cachedTimeDotImages setObject:v9 forKey:v8];

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

- (void)updateMarkerPosition
{
  timeMarker = self->_timeMarker;
  if (timeMarker)
  {
    [(EKCurrentTimeMarkerView *)timeMarker updateTime];
    [(EKDayGridView *)self bounds];
    double v5 = v4;
    uint64_t v6 = self->_timeMarker;
    [(EKDayGridView *)self hourHeight];
    double v8 = v7;
    [(EKDayGridView *)self topPadding];
    double v9 = 0.0;
    +[EKDayTimeView timeMarkerFrameForTotalWidth:v6 timeWidth:v5 timeMarker:0.0 hourHeight:v8 topPadding:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;
    -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
    if ([(EKDayGridView *)self timeMarkerTodayDay] < 1)
    {
      [(EKCurrentTimeMarkerView *)self->_timeMarker setTodayStart:0.0];
    }
    else
    {
      int IsLeftToRight = CalTimeDirectionIsLeftToRight();
      double v20 = (double)([(EKDayGridView *)self timeMarkerTodayDay] - 1);
      [(EKDayGridView *)self _dayWidth];
      double v22 = v21 * v20;
      double v23 = v16 - v20 * v21;
      if (IsLeftToRight) {
        double v23 = v22;
      }
      [(EKCurrentTimeMarkerView *)self->_timeMarker setTodayStart:v23];
      [(EKDayGridView *)self _dayWidth];
      double v9 = v24;
    }
    [(EKCurrentTimeMarkerView *)self->_timeMarker setTodayWidth:v9];
    [(EKCurrentTimeMarkerView *)self->_timeMarker setNeedsDisplay];
    CalRoundToScreenScale(8.0);
    double v26 = v25 * 0.5;
    if ([(EKDayGridView *)self timeMarkerTodayDay] < 1)
    {
      double v30 = 0.0;
    }
    else
    {
      int v27 = CalTimeDirectionIsLeftToRight();
      double v28 = (double)([(EKDayGridView *)self timeMarkerTodayDay] - 1);
      [(EKDayGridView *)self _dayWidth];
      if (v27) {
        double v30 = -(v26 - v28 * v29);
      }
      else {
        double v30 = v16 - v28 * v29 - v26;
      }
    }
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    double v31 = CGRectGetMidY(v37) - v26;
    CalRoundToScreenScale(8.0);
    double v33 = v32;
    CalRoundToScreenScale(8.0);
    timeDot = self->_timeDot;
    -[UIImageView setFrame:](timeDot, "setFrame:", v30, v31, v33, v34);
  }
}

- (int64_t)timeMarkerTodayDay
{
  return self->_timeMarkerTodayDay;
}

- (void)updateHourHeight
{
  +[EKDayTimeView hourHeightForSizeClass:[(EKDayGridView *)self _sizeClass] orientation:self->_orientation];
  self->_hourHeight = v3 * self->_gridHeightScale;
}

- (int64_t)_sizeClass
{
  double v3 = [(EKDayGridView *)self window];

  if (!v3) {
    return self->_sizeClass;
  }

  return EKUIWidthSizeClassForViewHierarchy(self);
}

- (EKCurrentTimeMarkerView)timeMarker
{
  return self->_timeMarker;
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (void)layoutSubviews
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  double v3 = [(EKDayGridView *)self window];

  if (v3)
  {
    [(EKCurrentTimeMarkerView *)self->_timeMarker setNeedsDisplay];
    double v81 = EKUISeparatorLineThickness();
    [(EKDayGridView *)self bounds];
    double v5 = v4;
    [(EKDayGridView *)self topPadding];
    double v7 = v5 - v6;
    [(EKDayGridView *)self bottomPadding];
    double v9 = v7 - v8 + 1.0;
    *(float *)&double v8 = v9 * 0.0009765625;
    unint64_t v10 = vcvtps_s32_f32(*(float *)&v8);
    if ([(NSMutableArray *)self->_gridPatternViews count] < v10)
    {
      uint64_t v11 = [(NSMutableArray *)self->_gridPatternViews count];
      unint64_t v12 = v10 - v11;
      if ((uint64_t)v10 > v11)
      {
        do
        {
          double v13 = [EKUIVisualEffectView alloc];
          [(EKDayGridView *)self bounds];
          CGFloat v14 = -[EKUIVisualEffectView initWithFrame:](v13, "initWithFrame:");
          [(EKUIVisualEffectView *)v14 setTintColorDelegate:self];
          [(UIView *)self->_gridContainerView addSubview:v14];
          [(UIView *)self->_gridContainerView sendSubviewToBack:v14];
          double v15 = [(EKDayGridView *)self gridVisualEffect];
          [(EKUIVisualEffectView *)v14 setEffect:v15];

          id v16 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          [v16 setAutoresizingMask:18];
          double v17 = [(EKUIVisualEffectView *)v14 contentView];
          [v17 addSubview:v16];

          [(NSMutableArray *)self->_gridPatternViews addObject:v16];
          gridParentViews = self->_gridParentViews;
          uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v16);
          [(NSMutableDictionary *)gridParentViews setObject:v14 forKey:v19];

          --v12;
        }
        while (v12);
      }
    }
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    double v20 = self->_gridPatternViews;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v90 objects:v96 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v91 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          double v26 = (void *)MEMORY[0x1E4FB1618];
          int v27 = [(EKDayGridView *)self _generateGridImage];
          double v28 = [v26 colorWithPatternImage:v27];
          [v25 setBackgroundColor:v28];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v90 objects:v96 count:16];
      }
      while (v22);
    }

    [(EKDayGridView *)self bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    [(EKDayGridView *)self topPadding];
    double v36 = v35;
    [(EKDayGridView *)self bounds];
    double v38 = v37;
    [(EKDayGridView *)self bottomPadding];
    double v40 = v39;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = self->_gridPatternViews;
    uint64_t v41 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      BOOL v43 = 0;
      double v44 = v38 - v40 + 1.0;
      if (v9 <= 1024.0) {
        double v45 = v9;
      }
      else {
        double v45 = 1024.0;
      }
      double v46 = v36 + v32;
      uint64_t v47 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v87 != v47) {
            objc_enumerationMutation(obj);
          }
          v49 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v50 = self->_gridParentViews;
          v51 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v49);
          v52 = [(NSMutableDictionary *)v50 objectForKey:v51];

          if (v43)
          {
            [v52 removeFromSuperview];
            BOOL v43 = 1;
          }
          else
          {
            v53 = [v52 superview];

            if (!v53)
            {
              [(UIView *)self->_gridContainerView addSubview:v52];
              [(UIView *)self->_gridContainerView sendSubviewToBack:v52];
            }
            objc_msgSend(v52, "setFrame:", v30, v46, v34, v45);
            objc_msgSend(v49, "setFrame:", 0.0, 0.0, v34, v45);
            BOOL v43 = v46 + 1024.0 >= v44;
            long double hourHeight = self->_hourHeight;
            double v46 = hourHeight + v46 + v45 - fmod(1024.0, hourHeight);
            [(EKDayGridView *)self bounds];
            double v56 = v55 - v46;
            [(EKDayGridView *)self bottomPadding];
            double v58 = v81 + v56 - v57;
            if (v58 <= 1024.0) {
              double v45 = v58;
            }
            else {
              double v45 = 1024.0;
            }
          }
        }
        uint64_t v42 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v42);
    }

    [(EKDayGridView *)self bounds];
    CGFloat v63 = v59;
    CGFloat v64 = v60;
    CGFloat v65 = v61;
    CGFloat v66 = v62;
    if (self->_leftBorderView) {
      -[UIView setFrame:](self->_leftBorderView, "setFrame:", 0.0, 0.0, v81, CGRectGetHeight(*(CGRect *)&v59));
    }
    [(EKDayGridView *)self _dayWidth];
    double v68 = v67;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v69 = self->_middleBorderViews;
    uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v83;
      double v73 = v68;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v83 != v72) {
            objc_enumerationMutation(v69);
          }
          v75 = *(void **)(*((void *)&v82 + 1) + 8 * k);
          CalRoundToScreenScale(v73);
          double v77 = v76;
          v98.origin.x = v63;
          v98.origin.y = v64;
          v98.size.width = v65;
          v98.size.height = v66;
          objc_msgSend(v75, "setFrame:", v77, 0.0, v81, CGRectGetHeight(v98) + 1.0);
          double v73 = v68 + v73;
        }
        uint64_t v71 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v71);
    }

    if ((*((unsigned char *)self + 424) & 2) != 0)
    {
      [(EKDayGridView *)self widthForOccurrences];
      double v79 = v78 + (double)(char)(self->_rightBorderInsetsOccurrences - 1);
      [(EKDayGridView *)self bounds];
      -[UIView setFrame:](self->_rightBorderView, "setFrame:", v79, 0.0, v81, CGRectGetHeight(v99));
    }
  }
  else
  {
    self->_needsLayoutInWindow = 1;
  }
}

- (double)bottomPadding
{
  +[EKDayTimeView verticalPadding];
  return v3 + self->_hoursToPadBottom * self->_hourHeight;
}

- (id)_generateGridImage
{
  [(EKDayGridView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  double v7 = [(EKDayGridView *)self lineColor];
  double v8 = [(EKDayGridView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceLevel];

  unint64_t v10 = NSString;
  double hourHeight = self->_hourHeight;
  uint64_t selected = self->_selected;
  unsigned int v13 = [(EKDayGridView *)self isOpaque];
  CGFloat v14 = [v7 styleString];
  double v15 = [(EKDayGridView *)self traitCollection];
  id v16 = [v10 stringWithFormat:@"grid:%d:%f:%d:%@:%zd:%zd", selected, *(void *)&hourHeight, v13, v14, objc_msgSend(v15, "userInterfaceStyle"), v9];

  double v17 = +[EKDayGridView cachedBackgroundImageForKey:v16];
  CGFloat v18 = v17;
  if (v17)
  {
    id v19 = v17;
    goto LABEL_31;
  }
  CGFloat v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat rect = *MEMORY[0x1E4F1DAD8];
  v53.height = 1024.0;
  v53.width = 2.0;
  UIGraphicsBeginImageContextWithOptions(v53, 0, 0.0);
  if (self->_selected)
  {
    uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithRed:0.898039216 green:0.945098039 blue:0.988235294 alpha:1.0];
    [v21 set];

LABEL_7:
    v54.size.height = 1024.0;
    v54.size.width = 2.0;
    v54.origin.x = rect;
    v54.origin.y = v20;
    UIRectFill(v54);
    goto LABEL_8;
  }
  if ([(EKDayGridView *)self isOpaque])
  {
    [(UIColor *)self->_backgroundColor set];
    goto LABEL_7;
  }
LABEL_8:
  v49 = v16;
  v50 = v7;
  [v7 CGColor];
  v55.size.height = 1024.0;
  v55.size.width = 2.0;
  v55.origin.x = v4;
  v55.origin.y = v6;
  CGFloat MaxY = CGRectGetMaxY(v55);
  double v23 = self->_hourHeight;
  double v24 = ceil(MaxY / v23);
  if (v24 > 24.0) {
    double v24 = 24.0;
  }
  int v25 = (int)v24;
  int v26 = (int)fmax(floor(v6 / v23), 0.0);
  int v27 = [(EKDayGridView *)self traitCollection];
  BOOL v28 = EKUIUsesLargeTextLayout(v27);
  double v29 = 1.0;
  if (!v28) {
    double v29 = EKUISeparatorLineThickness();
  }
  CalRoundToScreenScale(v29);
  double v31 = v30;

  int v32 = v25 - v26;
  if (v25 >= v26)
  {
    int v33 = 0;
    do
    {
      double v34 = CalRoundRectToScreenScale(0.0, self->_hourHeight * (double)(v26 + v33) - v6, 2.0, v31);
      double v36 = v35;
      double v38 = v37;
      CGFloat v40 = v39;
      BOOL v41 = v32 == v33 || v33 == 0;
      int v42 = v41;
      if (!v41) {
        goto LABEL_23;
      }
      v56.size.width = 2.0;
      v56.origin.x = rect;
      v56.origin.y = v20;
      v56.size.height = 1024.0;
      v61.origin.x = v34;
      v61.origin.y = v36;
      v61.size.width = v38;
      v61.size.height = v40;
      if (CGRectIntersectsRect(v56, v61))
      {
LABEL_23:
        UISetColor();
        v57.origin.x = v34;
        v57.origin.y = v36;
        v57.size.width = v38;
        v57.size.height = v40;
        UIRectFill(v57);
      }
      double v43 = self->_hourHeight;
      if (v26 + v33 == 24)
      {
        v60.origin.y = v36 + v43;
        v60.origin.x = v34;
        v60.size.width = v38;
        v60.size.height = v40;
        UIRectFill(v60);
      }
      else
      {
        double v44 = v36 + v31 + floor(v43 * 0.5);
        double v45 = v34 + 1.0;
        double v46 = v38 + -1.0;
        if (!v42) {
          goto LABEL_27;
        }
        v58.size.width = 2.0;
        v58.origin.x = rect;
        v58.origin.y = v20;
        v58.size.height = 1024.0;
        v62.origin.x = v45;
        v62.origin.y = v44;
        v62.size.width = v46;
        v62.size.height = v40;
        if (CGRectIntersectsRect(v58, v62))
        {
LABEL_27:
          v59.origin.x = v45;
          v59.origin.y = v44;
          v59.size.width = v46;
          v59.size.height = v40;
          CGRectGetMaxX(v59);
        }
      }
      ++v33;
    }
    while (v32 + 1 != v33);
  }
  uint64_t v47 = UIGraphicsGetImageFromCurrentImageContext();
  objc_msgSend(v47, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  id v16 = v49;
  +[EKDayGridView cacheBackgroundImage:v19 forKey:v49];
  double v7 = v50;
LABEL_31:

  return v19;
}

- (UIColor)lineColor
{
  lineColor = self->_lineColor;
  if (lineColor)
  {
    double v3 = lineColor;
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      [MEMORY[0x1E4FB1618] lightGrayColor];
    }
    else {
    double v3 = [MEMORY[0x1E4FB1618] separatorColor];
    }
  }

  return v3;
}

+ (id)cachedBackgroundImageForKey:(id)a3
{
  return (id)[(id)__DayViewGridBackgroundCache objectForKey:a3];
}

- (UIVisualEffect)gridVisualEffect
{
  return self->_gridVisualEffect;
}

- (double)_dayWidth
{
  double result = self->_fixedDayWidth;
  if (result <= 0.0)
  {
    [(EKDayGridView *)self bounds];
    return floor(v4 / (double)self->_daysToDisplay);
  }
  return result;
}

+ (void)cacheBackgroundImage:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (!__DayViewGridBackgroundCache)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v7 = (void *)__DayViewGridBackgroundCache;
    __DayViewGridBackgroundCache = (uint64_t)v6;
  }
  if (v8) {
    [(id)__DayViewGridBackgroundCache setObject:v8 forKey:v5];
  }
  else {
    [(id)__DayViewGridBackgroundCache removeObjectForKey:v5];
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    +[EKDayTimeView timeInsetForSizeClass:[(EKDayGridView *)self _sizeClass] orientation:a3];
    self->_timeInset = v4;
    [(EKDayGridView *)self updateHourHeight];
    [(EKDayGridView *)self frame];
    double v6 = v5;
    [(EKDayGridView *)self frame];
    -[EKDayGridView setFrame:](self, "setFrame:", 0.0, 0.0, v6);
    [(EKDayGridView *)self setNeedsLayout];
  }
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  if (self->_showsTimeMarker != a3)
  {
    self->_showsTimeMarker = a3;
    [(EKDayGridView *)self _updateTimeMarker];
  }
}

- (void)setShowsTimeLine:(BOOL)a3
{
  if (self->_showsTimeLine != a3)
  {
    self->_showsTimeLine = a3;
    [(EKDayGridView *)self _updateTimeMarker];
  }
}

- (void)setAnimatesTimeMarker:(BOOL)a3
{
  self->_animatesTimeMarker = a3;
}

- (EKDayGridView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 backgroundColor:(id)a5 opaque:(BOOL)a6 numberOfDaysToDisplay:(unint64_t)a7
{
  BOOL v8 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a5;
  v37.receiver = self;
  v37.super_class = (Class)EKDayGridView;
  double v17 = -[EKDayGridView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  CGFloat v18 = v17;
  if (v17)
  {
    id v36 = v16;
    [(EKDayGridView *)v17 setOpaque:v8];
    v18->_uint64_t selected = -1;
    [(EKDayGridView *)v18 setShowsLeftBorder:0];
    [(EKDayGridView *)v18 setSelected:0];
    v18->_rightBorderInsetsOccurrences = 1;
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    v18->_daysToDispladouble y = a7;
    v18->_animatesTimeMarker = 1;
    v18->_orientation = 1;
    +[EKDayTimeView timeInsetForSizeClass:a4 orientation:1];
    v18->_timeInset = -v19;
    +[EKDayTimeView hourHeightForSizeClass:a4 orientation:v18->_orientation];
    v18->_double hourHeight = v20;
    v18->_gridHeightScale = 1.0;
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    gridContainerView = v18->_gridContainerView;
    v18->_gridContainerView = (UIView *)v21;

    [(UIView *)v18->_gridContainerView setAutoresizingMask:18];
    [(EKDayGridView *)v18 addSubview:v18->_gridContainerView];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18->_daysToDisplay];
    middleBorderViews = v18->_middleBorderViews;
    v18->_middleBorderViews = (NSMutableArray *)v23;

    if (v18->_daysToDisplay != 1)
    {
      unint64_t v25 = 0;
      do
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        [v26 setAutoresizingMask:5];
        int v27 = [MEMORY[0x1E4FB1618] separatorColor];
        [v26 setBackgroundColor:v27];

        [(UIView *)v18->_gridContainerView addSubview:v26];
        [(NSMutableArray *)v18->_middleBorderViews addObject:v26];

        ++v25;
      }
      while (v25 < v18->_daysToDisplay - 1);
    }
    BOOL v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    gridPatternViews = v18->_gridPatternViews;
    v18->_gridPatternViews = v28;

    v18->_highlightedDayIndedouble x = -1;
    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    gridParentViews = v18->_gridParentViews;
    v18->_gridParentViews = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    occurrenceContainerView = v18->_occurrenceContainerView;
    v18->_occurrenceContainerView = (UIView *)v32;

    [(UIView *)v18->_occurrenceContainerView setAutoresizingMask:18];
    [(EKDayGridView *)v18 addSubview:v18->_occurrenceContainerView];
    [(EKDayGridView *)v18 bounds];
    v18->_cachedWidthForOffMainThreadWoruint64_t k = v34;
    v18->_sizeClass = a4;
    id v16 = v36;
  }

  return v18;
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 424);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 424) = v3 & 0xFE | a3;
    leftBorderView = self->_leftBorderView;
    if (a3)
    {
      if (!leftBorderView)
      {
        double v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        BOOL v8 = self->_leftBorderView;
        self->_leftBorderView = v7;

        [(UIView *)self->_leftBorderView setAutoresizingMask:5];
        uint64_t v9 = self->_leftBorderView;
        unint64_t v10 = [MEMORY[0x1E4FB1618] separatorColor];
        [(UIView *)v9 setBackgroundColor:v10];

        gridContainerView = self->_gridContainerView;
        unint64_t v12 = self->_leftBorderView;
        [(UIView *)gridContainerView addSubview:v12];
      }
    }
    else
    {
      [(UIView *)leftBorderView removeFromSuperview];
      double v6 = self->_leftBorderView;
      self->_leftBorderView = 0;
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_uint64_t selected = a3;
    [(EKDayGridView *)self setNeedsDisplay];
  }
}

void __30__EKDayGridView__timeDotImage__block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  double v5 = [v3 systemBackgroundColor];
  [v5 setFill];

  CGContextFillEllipseInRect((CGContextRef)[v4 CGContext], *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectInset(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), 1.0, 1.0);
  double v6 = CalendarAppTintColor();
  [v6 setFill];

  double v7 = (CGContext *)[v4 CGContext];
  BOOL v8 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = v8[4];
  uint64_t v10 = v8[5];
  uint64_t v11 = v8[6];
  uint64_t v12 = v8[7];

  CGContextFillEllipseInRect(v7, *(CGRect *)&v9);
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 528) setAlpha:1.0];
}

- (void)didMoveToWindow
{
  if (self->_needsLayoutInWindow)
  {
    [(EKDayGridView *)self setNeedsLayout];
    self->_needsLayoutInWindow = 0;
  }
}

- (void)_updateTimeMarker
{
  if (self->_showsTimeLine || self->_showsTimeMarker)
  {
    timeMarker = self->_timeMarker;
    if (timeMarker)
    {
      [(EKCurrentTimeMarkerView *)timeMarker setShowsThumb:self->_showsTimeMarker];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsLine:self->_showsTimeLine];
      [(EKDayGridView *)self updateMarkerPosition];
    }
    else
    {
      id v4 = -[EKCurrentTimeMarkerView initWithFrame:sizeClass:]([EKCurrentTimeMarkerView alloc], "initWithFrame:sizeClass:", self->_sizeClass, 0.0, 0.0, 10.0, 10.0);
      double v5 = self->_timeMarker;
      self->_timeMarker = v4;

      [(EKDayGridView *)self bounds];
      double v7 = v6;
      BOOL v8 = self->_timeMarker;
      [(EKDayGridView *)self hourHeight];
      double v10 = v9;
      [(EKDayGridView *)self topPadding];
      +[EKDayTimeView timeMarkerFrameForTotalWidth:v8 timeWidth:v7 timeMarker:0.0 hourHeight:v10 topPadding:v11];
      -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
      [(EKCurrentTimeMarkerView *)self->_timeMarker setAutoresizingMask:2];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsThumb:self->_showsTimeMarker];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsLine:self->_showsTimeLine];
      [(EKDayGridView *)self updateMarkerPosition];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setAlpha:0.0];
      [(EKDayGridView *)self addSubview:self->_timeMarker];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__EKDayGridView__updateTimeMarker__block_invoke;
      aBlock[3] = &unk_1E6087570;
      aBlock[4] = self;
      uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
      if ([(EKDayGridView *)self animatesTimeMarker]) {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.2];
      }
      else {
        v12[2](v12);
      }
    }
  }
  else
  {
    unsigned int v13 = self->_timeMarker;
    if (v13)
    {
      CGFloat v14 = v13;
      double v15 = self->_timeMarker;
      self->_timeMarker = 0;

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_2;
      v42[3] = &unk_1E6087570;
      id v16 = v14;
      double v43 = v16;
      double v17 = (void (**)(void))_Block_copy(v42);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_3;
      v40[3] = &unk_1E6087520;
      CGFloat v18 = v16;
      BOOL v41 = v18;
      double v19 = (void (**)(void *, uint64_t))_Block_copy(v40);
      if ([(EKDayGridView *)self animatesTimeMarker])
      {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v17 animations:v19 completion:0.2];
      }
      else
      {
        v17[2](v17);
        v19[2](v19, 1);
      }
    }
  }
  BOOL v20 = [(EKDayGridView *)self _showsTimeDot];
  timeDot = self->_timeDot;
  if (v20)
  {
    if (timeDot)
    {
      [(EKDayGridView *)self updateMarkerPosition];
    }
    else
    {
      BOOL v28 = [(EKDayGridView *)self _timeDotImage];
      double v29 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v28];
      uint64_t v30 = self->_timeDot;
      self->_timeDot = v29;

      [(EKDayGridView *)self updateMarkerPosition];
      [(UIImageView *)self->_timeDot setAlpha:0.0];
      [(EKDayGridView *)self addSubview:self->_timeDot];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_4;
      v39[3] = &unk_1E6087570;
      v39[4] = self;
      double v31 = (void (**)(void))_Block_copy(v39);
      if ([(EKDayGridView *)self animatesTimeMarker]) {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v31 animations:0.2];
      }
      else {
        v31[2](v31);
      }
    }
  }
  else if (timeDot)
  {
    uint64_t v22 = timeDot;
    uint64_t v23 = self->_timeDot;
    self->_timeDot = 0;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_5;
    v37[3] = &unk_1E6087570;
    double v24 = v22;
    double v38 = v24;
    unint64_t v25 = (void (**)(void))_Block_copy(v37);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    double v34 = __34__EKDayGridView__updateTimeMarker__block_invoke_6;
    double v35 = &unk_1E6087520;
    id v26 = v24;
    id v36 = v26;
    int v27 = (void (**)(void *, uint64_t))_Block_copy(&v32);
    if ([(EKDayGridView *)self animatesTimeMarker])
    {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v25 animations:v27 completion:0.2];
    }
    else
    {
      v25[2](v25);
      v27[2](v27, 1);
    }
  }
}

- (BOOL)_showsTimeDot
{
  return !self->_hideTimeDot && (self->_showsTimeLine || self->_showsTimeMarker) && self->_timeMarkerTodayDay > 0;
}

- (BOOL)animatesTimeMarker
{
  return self->_animatesTimeMarker;
}

- (EKDayGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [MEMORY[0x1E4FB1618] whiteColor];
  double v9 = -[EKDayGridView initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:](self, "initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:", 1, v8, 1, 1, x, y, width, height);

  return v9;
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_useMultiDayStyle = a3;
  if (a3) {
    EKUIVerticalGridLineColor();
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] separatorColor];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = self->_middleBorderViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setBackgroundColor:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKDayGridView;
  -[EKDayGridView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(EKDayGridView *)self bounds];
  self->_cachedWidthForOffMainThreadWoruint64_t k = v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double fixedDayWidth = self->_fixedDayWidth;
  if (fixedDayWidth > 0.0)
  {
    CalRoundToScreenScale(fixedDayWidth * (double)self->_daysToDisplay);
    CGFloat width = v6;
  }
  double hourHeight = self->_hourHeight;
  [(EKDayGridView *)self topPadding];
  double v9 = v8 + hourHeight * 24.0;
  [(EKDayGridView *)self bottomPadding];
  CalRoundToScreenScale(v9 + v10);
  double v12 = v11;
  double v13 = width;
  result.double height = v12;
  result.CGFloat width = v13;
  return result;
}

- (double)timeInset
{
  return self->_timeInset;
}

- (void)setGridHeightScale:(double)a3
{
  self->_gridHeightScale = a3;
  [(EKDayGridView *)self updateHourHeight];

  [(EKDayGridView *)self setNeedsLayout];
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setAlpha:1.0];
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)hideNowDot:(BOOL)a3
{
  if (self->_hideTimeDot != a3)
  {
    self->_hideTimeDot = a3;
    [(EKDayGridView *)self _updateTimeMarker];
  }
}

- (void)setTimeMarkerTodayDay:(int64_t)a3
{
  if (self->_timeMarkerTodayDay != a3)
  {
    self->_timeMarkerTodayDadouble y = a3;
    [(EKDayGridView *)self _updateTimeMarker];
  }
}

- (BOOL)showsLeftBorder
{
  return *((unsigned char *)self + 424) & 1;
}

- (void)setShowsRightBorder:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 424);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 424) = v3 & 0xFD | v5;
    rightBorderView = self->_rightBorderView;
    if (a3)
    {
      if (!rightBorderView)
      {
        double v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        double v9 = self->_rightBorderView;
        self->_rightBorderView = v8;

        double v10 = self->_rightBorderView;
        double v11 = [MEMORY[0x1E4FB1618] separatorColor];
        [(UIView *)v10 setBackgroundColor:v11];

        gridContainerView = self->_gridContainerView;
        double v13 = self->_rightBorderView;
        [(UIView *)gridContainerView addSubview:v13];
      }
    }
    else
    {
      [(UIView *)rightBorderView removeFromSuperview];
      uint64_t v7 = self->_rightBorderView;
      self->_rightBorderView = 0;
    }
  }
}

- (BOOL)showsRightBorder
{
  return (*((unsigned __int8 *)self + 424) >> 1) & 1;
}

- (CGRect)rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4
{
  uint64_t v6 = MEMORY[0x1E4F1DB28];
  unint64_t v7 = a4 - a3 - 1679;
  if ((double)a3 / 86400.0 >= 0.0) {
    double v8 = (double)a3 / 86400.0;
  }
  else {
    double v8 = 0.0;
  }
  if ((double)a4 / 86400.0 <= 1.0) {
    double v9 = (double)a4 / 86400.0;
  }
  else {
    double v9 = 1.0;
  }
  [(EKDayGridView *)self hourHeight];
  double v11 = v10;
  double v12 = v10 * 24.0;
  [(EKDayGridView *)self topPadding];
  double v14 = v13;
  CalRoundToScreenScale(v8 * v12);
  double v16 = v14 + v15;
  CalRoundToScreenScale(v9 * v12);
  double v18 = v14 + v17 - v16;
  CalRoundToScreenScale(v11 * 0.75);
  if (v18 < v19)
  {
    CalRoundToScreenScale(v11 * 0.51);
    if (v18 > v20)
    {
      CalRoundToScreenScale(v11 * 0.75);
      double v18 = v21;
    }
  }
  double v22 = *(double *)(v6 + 16);
  if (v7 <= 0xF2)
  {
    double v18 = v18 - EKUISeparatorLineThickness();
    if ((a4 + 100) % 3600 <= 199) {
      double v18 = v18 - EKUISeparatorLineThickness();
    }
  }
  double v23 = 0.0;
  double v24 = v16;
  double v25 = v22;
  double v26 = v18;
  result.size.double height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected != 0;
}

- (void)setHighlightedDayIndex:(int64_t)a3
{
  if (self->_highlightedDayIndex != a3)
  {
    self->_highlightedDayIndedouble x = a3;
    [(EKDayGridView *)self _layoutHighlight];
  }
}

- (void)setFixedDayWidth:(double)a3
{
  if (self->_fixedDayWidth != a3)
  {
    self->_double fixedDayWidth = a3;
    [(EKDayGridView *)self setNeedsLayout];
    [(EKDayGridView *)self _updateTimeMarker];
  }
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (void)setLineColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    [(EKDayGridView *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (void)setGridVisualEffect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_gridVisualEffect, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_gridParentViews allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setEffect:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_layoutHighlight
{
  highlightedDayIndedouble x = self->_highlightedDayIndex;
  highlightedDayBackground = self->_highlightedDayBackground;
  if (highlightedDayIndex < 0)
  {
    [(UIView *)highlightedDayBackground setHidden:1];
  }
  else
  {
    if (![(UIView *)highlightedDayBackground isHidden])
    {
      [(UIView *)self->_highlightedDayBackground alpha];
      if (v5 >= 0.999)
      {
        uint64_t v6 = self->_fadingHighlightedDayBackground;
        objc_storeStrong((id *)&self->_fadingHighlightedDayBackground, self->_highlightedDayBackground);
        uint64_t v7 = self->_highlightedDayBackground;
        self->_highlightedDayBackground = v6;
        uint64_t v8 = v6;

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __33__EKDayGridView__layoutHighlight__block_invoke;
        v20[3] = &unk_1E6087570;
        v20[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:196608 delay:v20 options:0 animations:0.2 completion:0.0];
      }
    }
    if (!self->_highlightedDayBackground)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v10 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      long long v11 = self->_highlightedDayBackground;
      self->_highlightedDayBackground = v10;

      long long v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
      [(UIView *)self->_highlightedDayBackground setBackgroundColor:v12];

      [(UIView *)self->_gridContainerView addSubview:self->_highlightedDayBackground];
      [(UIView *)self->_gridContainerView sendSubviewToBack:self->_highlightedDayBackground];
    }
    int64_t v13 = self->_highlightedDayIndex - 1;
    [(EKDayGridView *)self _dayWidth];
    double v15 = v14;
    CalRoundToScreenScale(v14 * (double)v13);
    double v17 = v16;
    double v18 = CalCeilToScreenScale(v15);
    [(EKDayGridView *)self frame];
    -[UIView setFrame:](self->_highlightedDayBackground, "setFrame:", v17, 0.0, v18);
    [(UIView *)self->_highlightedDayBackground setAlpha:0.0];
    [(UIView *)self->_highlightedDayBackground setHidden:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __33__EKDayGridView__layoutHighlight__block_invoke_2;
    v19[3] = &unk_1E6087570;
    v19[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:196608 delay:v19 options:0 animations:0.1 completion:0.0];
  }
}

uint64_t __33__EKDayGridView__layoutHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:0.0];
}

uint64_t __33__EKDayGridView__layoutHighlight__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:1.0];
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (BOOL)rightBorderInsetsOccurrences
{
  return self->_rightBorderInsetsOccurrences;
}

- (void)setRightBorderInsetsOccurrences:(BOOL)a3
{
  self->_rightBorderInsetsOccurrences = a3;
}

- (double)eventHorizontalInset
{
  return self->_eventHorizontalInset;
}

- (void)setEventHorizontalInset:(double)a3
{
  self->_eventHorizontalInset = a3;
}

- (double)hoursToPadTop
{
  return self->_hoursToPadTop;
}

- (void)setHoursToPadTop:(double)a3
{
  self->_hoursToPadTop = a3;
}

- (double)hoursToPadBottom
{
  return self->_hoursToPadBottom;
}

- (void)setHoursToPadBottom:(double)a3
{
  self->_hoursToPadBottom = a3;
}

- (int64_t)highlightedDayIndex
{
  return self->_highlightedDayIndex;
}

- (void)setOccurrenceContainerView:(id)a3
{
}

- (double)gridHeightScale
{
  return self->_gridHeightScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceContainerView, 0);
  objc_storeStrong((id *)&self->_gridVisualEffect, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_gridParentViews, 0);
  objc_storeStrong((id *)&self->_gridContainerView, 0);
  objc_storeStrong((id *)&self->_fadingHighlightedDayBackground, 0);
  objc_storeStrong((id *)&self->_highlightedDayBackground, 0);
  objc_storeStrong((id *)&self->_timeDot, 0);
  objc_storeStrong((id *)&self->_timeMarker, 0);
  objc_storeStrong((id *)&self->_gridPatternViews, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_middleBorderViews, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end