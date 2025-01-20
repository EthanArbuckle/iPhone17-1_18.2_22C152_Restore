@interface EKDayTimeView
+ (CGRect)_timeLineExtensionFrameForTimeWidth:(double)a3 timeMarker:(id)a4 timeLabelXPosition:(double)a5 yPosition:(double)a6;
+ (CGRect)timeMarkerFrameForTotalWidth:(double)a3 timeWidth:(double)a4 timeMarker:(id)a5 hourHeight:(double)a6 topPadding:(double)a7;
+ (double)_dynamicFontSizeForOrientation:(int64_t)a3;
+ (double)_timeTextWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)_timeVerticalInsetForOrientation:(int64_t)a3 inViewHierarchy:(id)a4;
+ (double)_widthForOrientation:(int64_t)a3 sizeClass:(int64_t)a4 excludeCurrentTime:(BOOL)a5;
+ (double)defaultHeightForNumHours:(int64_t)a3 scaledHourHeight:(double)a4;
+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 withHourScale:(double)a5;
+ (double)defaultHourScale;
+ (double)heightOfHourTextForHour:(int64_t)a3 orientation:(int64_t)a4;
+ (double)hourHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)hourWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)positionOfSecond:(int64_t)a3 hourHeight:(double)a4 topPadding:(double)a5 clampToBounds:(BOOL)a6;
+ (double)timeInsetForSizeClass:(int64_t)a3 orientation:(int64_t)a4;
+ (double)timeWidthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4;
+ (double)verticalPadding;
+ (id)_hourFontForOrientation:(int64_t)a3;
+ (id)_noonFontForOrientation:(int64_t)a3;
+ (id)allDayLabelBoldFont;
+ (id)allDayLabelFont;
+ (id)unscaledAllDayLabelFont;
+ (void)_calculateWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4 excludeCurrentTime:(BOOL)a5;
+ (void)_invalidateCachedValues;
+ (void)_invalidateWidth;
+ (void)_registerForInvalidation;
+ (void)_setWidth:(double)a3 forOrientation:(int64_t)a4 sizeClass:(int64_t)a5 excludeCurrentTime:(BOOL)a6;
- (BOOL)showsLeftBorder;
- (BOOL)showsRightBorder;
- (BOOL)showsTimeMarker;
- (BOOL)showsTimeMarkerExtension;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCurrentTimeMarkerView)timeMarker;
- (EKDayTimeView)initWithFrame:(CGRect)a3;
- (EKDayTimeView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4;
- (EKDayTimeViewDelegate)delegate;
- (UIColor)timeColor;
- (UIColor)timeMarkerExtensionColor;
- (UIVisualEffect)visualEffect;
- (_NSRange)hoursToRender;
- (double)defaultHeight;
- (double)highlightedHour;
- (double)hourHeight;
- (double)hourHeightScale;
- (double)hoursToPad;
- (double)scaledHourHeight;
- (double)timeWidth;
- (double)topPadding;
- (int64_t)_sizeClass;
- (void)_flushTimeStringImageCache;
- (void)_fontSizeChanged;
- (void)_invalidateTimeWidth;
- (void)_localeChanged;
- (void)_sizeClassChanged;
- (void)dealloc;
- (void)drawRect:(CGRect)a3 forContentView:(id)a4 withHourRange:(_NSRange)a5;
- (void)layoutFrames;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightedHour:(double)a3;
- (void)setHourHeightScale:(double)a3;
- (void)setHoursToPad:(double)a3;
- (void)setHoursToRender:(_NSRange)a3;
- (void)setNeedsDisplay;
- (void)setOpaque:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setShowsRightBorder:(BOOL)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setShowsTimeMarkerExtension:(BOOL)a3;
- (void)setTimeColor:(id)a3;
- (void)setTimeMarkerExtensionColor:(id)a3;
- (void)setVisualEffect:(id)a3;
- (void)updateHourHeight;
- (void)updateMarkerPosition;
- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4;
@end

@implementation EKDayTimeView

+ (double)positionOfSecond:(int64_t)a3 hourHeight:(double)a4 topPadding:(double)a5 clampToBounds:(BOOL)a6
{
  int64_t v6 = a3 & ~(a3 >> 63);
  if ((unint64_t)v6 >= 0x15180) {
    int64_t v6 = 86400;
  }
  if (!a6) {
    int64_t v6 = a3;
  }
  CalRoundToScreenScale(a5 + a4 * 24.0 * ((double)v6 / 86400.0));
  return result;
}

+ (double)verticalPadding
{
  return 18.0;
}

uint64_t __55__EKDayTimeView_drawRect_forContentView_withHourRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", 0.0, 0.0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EKDayTimeView;
  [(EKDayTimeView *)&v3 layoutSubviews];
  [(EKDayTimeView *)self updateMarkerPosition];
}

- (void)updateMarkerPosition
{
  if (self->_timeMarker && [(EKDayTimeView *)self showsTimeMarker])
  {
    [(EKCurrentTimeMarkerView *)self->_timeMarker updateTime];
    objc_super v3 = objc_opt_class();
    [(EKDayTimeView *)self bounds];
    double v5 = v4;
    [(EKDayTimeView *)self timeWidth];
    double v7 = v6;
    timeMarker = self->_timeMarker;
    [(EKDayTimeView *)self hourHeight];
    double v10 = v9;
    [(EKDayTimeView *)self topPadding];
    [v3 timeMarkerFrameForTotalWidth:timeMarker timeWidth:v5 timeMarker:v7 hourHeight:v10 topPadding:v11];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    double MidY = CGRectGetMidY(v24);
    if (self->_showsTimeMarkerExtension)
    {
      v21 = objc_opt_class();
      [(EKDayTimeView *)self timeWidth];
      objc_msgSend(v21, "_timeLineExtensionFrameForTimeWidth:timeMarker:timeLabelXPosition:yPosition:", self->_timeMarker);
      -[UIView setFrame:](self->_timeMarkerExtension, "setFrame:");
    }
    v22 = [(EKDayTimeView *)self delegate];

    if (v22)
    {
      [(EKDayTimeView *)self setNeedsDisplay];
    }
  }
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  id v6 = a4;
  double v5 = [(EKDayTimeView *)self visualEffect];

  if (v5)
  {
    [(EKDayTimeView *)self setTimeColor:v6];
    [(EKDayTimeView *)self setNeedsDisplay];
  }
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

+ (double)timeWidthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  id v6 = a4;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
  {
    double v7 = 44.0;
    double v8 = 0.0;
    if ((((unint64_t)(a3 - 3) < 2) & EKUIIsExtended(v6)) != 0) {
      double v9 = 44.0;
    }
    else {
      double v9 = 0.0;
    }
  }
  else
  {
    double v8 = 6.0;
    double v9 = 0.0;
    if ((unint64_t)(a3 - 1) >= 2)
    {
      double v7 = 47.0;
      if (MGGetBoolAnswer())
      {
        double v10 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v10 userInterfaceIdiom])
        {
        }
        else
        {
          int v11 = [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp];

          if (v11)
          {
            double v9 = 20.0;
            if ((unint64_t)(a3 - 3) <= 1)
            {
              if (EKUICurrentWindowSizeParadigmForViewHierarchy(v6) == 0x8000000) {
                double v9 = 52.0;
              }
              else {
                double v9 = 44.0;
              }
            }
          }
        }
      }
    }
    else
    {
      double v7 = 51.0;
    }
  }
  [a1 _timeTextWidthForSizeClass:EKUIWidthSizeClassForViewHierarchy(v6) orientation:a3];
  double v13 = v8 + v12;
  if (v13 < v7) {
    double v13 = v7;
  }
  CalRoundToScreenScale(v9 + v13);
  double v15 = v14;

  return v15;
}

+ (double)_timeTextWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  [a1 _widthForOrientation:a4 sizeClass:a3 excludeCurrentTime:0];
  if (result == 0.0)
  {
    [a1 _calculateWidthForSizeClass:a3 orientation:a4 excludeCurrentTime:0];
    [a1 _widthForOrientation:a4 sizeClass:a3 excludeCurrentTime:0];
  }
  return result;
}

+ (double)_widthForOrientation:(int64_t)a3 sizeClass:(int64_t)a4 excludeCurrentTime:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = a3 - 1;
  BOOL v9 = !a5;
  BOOL v10 = (unint64_t)(a3 - 1) > 1 || !a5;
  if (v10 || a4 != 2)
  {
    if (a4 == 2) {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (v8 < 2) {
        BOOL v9 = 1;
      }
      if (v9 || a4 != 2)
      {
        if (a4 == 2) {
          BOOL v9 = 1;
        }
        if (v9)
        {
          BOOL v12 = (unint64_t)(a3 - 1) > 1 || a5;
          if ((unint64_t)(a3 - 1) > 1 || a5 || a4 != 2)
          {
            if (a4 == 2) {
              BOOL v12 = 1;
            }
            if (v12)
            {
              BOOL v13 = v8 < 2 || a5;
              if (v13 || a4 != 2)
              {
                if (a4 == 2) {
                  BOOL v13 = 1;
                }
                if (v13)
                {
                  double v14 = (void *)kEKUILogHandle;
                  uint64_t v11 = 0;
                  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
                  {
                    double v15 = v14;
                    double v16 = (objc_class *)objc_opt_class();
                    CGFloat v17 = NSStringFromClass(v16);
                    int v19 = 138413058;
                    v20 = v17;
                    __int16 v21 = 1024;
                    BOOL v22 = v5;
                    __int16 v23 = 2048;
                    int64_t v24 = a3;
                    __int16 v25 = 2048;
                    int64_t v26 = a4;
                    _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "[%@] Unhandled combination of excludeCurrentTime:%d, orientation:%ld, sizeClass:%ld when trying to get width, returning 0", (uint8_t *)&v19, 0x26u);
                  }
                }
                else
                {
                  uint64_t v11 = __HourWidthLandscapeCompact;
                }
              }
              else
              {
                uint64_t v11 = __HourWidthLandscapeRegular;
              }
            }
            else
            {
              uint64_t v11 = __HourWidthPortraitCompact;
            }
          }
          else
          {
            uint64_t v11 = __HourWidthPortraitRegular;
          }
        }
        else
        {
          uint64_t v11 = __HourWidthExcludingCurrentTimeLandscapeCompact;
        }
      }
      else
      {
        uint64_t v11 = __HourWidthExcludingCurrentTimeLandscapeRegular;
      }
    }
    else
    {
      uint64_t v11 = __HourWidthExcludingCurrentTimePortraitCompact;
    }
  }
  else
  {
    uint64_t v11 = __HourWidthExcludingCurrentTimePortraitRegular;
  }
  return *(double *)&v11;
}

+ (double)defaultHeightForNumHours:(int64_t)a3 scaledHourHeight:(double)a4
{
  CalRoundToScreenScale((double)a3 * a4 + 1.0 + 36.0);
  return result;
}

+ (double)timeInsetForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  EKUIMultiwindowAssert(a3 != 0, @"Size class not specified.", a3, a4, v4, v5, v6, v7, v10);
  if (a3 != 2) {
    return 6.0;
  }

  CalRoundToScreenScale(5.5);
  return result;
}

- (void)updateHourHeight
{
  [(EKDayTimeView *)self scaledHourHeight];
  self->_hourHeight = v3;
}

- (double)scaledHourHeight
{
  +[EKDayTimeView hourHeightForSizeClass:[(EKDayTimeView *)self _sizeClass] orientation:self->_orientation];
  return v3 * self->_hourHeightScale;
}

+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 withHourScale:(double)a5
{
  +[EKDayTimeView hourHeightForSizeClass:a3 orientation:a4];
  double v8 = v7 * a5;

  [a1 defaultHeightForNumHours:24 scaledHourHeight:v8];
  return result;
}

- (int64_t)_sizeClass
{
  double v3 = [(EKDayTimeView *)self window];

  if (!v3) {
    return self->_targetSizeClass;
  }

  return EKUIWidthSizeClassForViewHierarchy(self);
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = CalCeilToScreenScale(a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setFrame:](&v8, sel_setFrame_, x, y, width, v7);
  [(EKDayTimeView *)self layoutFrames];
  [(EKDayTimeView *)self _invalidateTimeWidth];
}

- (void)layoutFrames
{
  uint64_t v2 = 408;
  if (self->_contentViews)
  {
    if (self->_hourHeight >= 0.0)
    {
      [(EKDayTimeView *)self frame];
      if (v4 > 0.0)
      {
        [(EKDayTimeView *)self frame];
        double v6 = v5;
        unint64_t v7 = 0;
        double v8 = *MEMORY[0x1E4F1DB28];
        double v9 = 0.0;
        uint64_t v10 = &OBJC_IVAR___EKUIAvailabilityViewController__topSpacer;
        unint64_t v11 = 0x1E4F29000;
        uint64_t v12 = 25;
        do
        {
          [(EKDayTimeView *)self hourHeight];
          double v14 = 1024.0 - v13;
          if (v12 == 25)
          {
            double v15 = v14 + 0.5;
            double hoursToPad = self->_hoursToPad;
            [(EKDayTimeView *)self hourHeight];
            double v14 = v15 - (hoursToPad * v17 + 18.0);
          }
          double v18 = v6 - v9;
          if (v14 >= v6 - v9) {
            double v19 = v6 - v9;
          }
          else {
            double v19 = v14;
          }
          if (v19 <= 0.0) {
            break;
          }
          [(EKDayTimeView *)self hourHeight];
          *(float *)&double v20 = v19 / v20;
          int64_t v21 = vcvtms_s32_f32(*(float *)&v20);
          if (v12 >= v21) {
            int64_t v22 = v21;
          }
          else {
            int64_t v22 = v12;
          }
          uint64_t v51 = v22;
          if (v7 >= [*(id *)((char *)&self->super.super.super.isa + v2) count])
          {
            __int16 v23 = objc_alloc_init(EKDayTimeContentView);
            [(EKDayTimeContentView *)v23 setWantsDeepColorDrawing:0];
            [(EKDayTimeContentView *)v23 setOwner:self];
            [(EKDayTimeContentView *)v23 setOpaque:[(EKDayTimeView *)self isOpaque]];
            if ([(EKDayTimeView *)self isOpaque]) {
              [MEMORY[0x1E4FB1618] systemBackgroundColor];
            }
            else {
            uint64_t v27 = [MEMORY[0x1E4FB1618] clearColor];
            }
            [(EKDayTimeContentView *)v23 setBackgroundColor:v27];

            [(EKDayTimeContentView *)v23 setNeedsDisplayOnBoundsChange:1];
            int64_t v26 = objc_alloc_init(EKUIVisualEffectView);
            [(EKUIVisualEffectView *)v26 setTintColorDelegate:self];
            v28 = [(EKUIVisualEffectView *)v26 contentView];
            [v28 addSubview:v23];

            [(EKDayTimeView *)self addSubview:v26];
            [*(id *)((char *)&self->super.super.super.isa + v2) addObject:v23];
            uint64_t v29 = v2;
            v30 = v10;
            v31 = *(Class *)((char *)&self->super.super.super.isa + v10[664]);
            __int16 v25 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v23);
            v32 = v31;
            uint64_t v10 = v30;
            uint64_t v2 = v29;
            [v32 setObject:v26 forKey:v25];
          }
          else
          {
            __int16 v23 = [*(id *)((char *)&self->super.super.super.isa + v2) objectAtIndex:v7];
            int64_t v24 = *(Class *)((char *)&self->super.super.super.isa + v10[664]);
            __int16 v25 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v23);
            int64_t v26 = [v24 objectForKey:v25];
          }

          [(EKDayTimeView *)self frame];
          double v34 = v33;
          BOOL v35 = v12 <= v21;
          unint64_t v11 = 0x1E4F29000uLL;
          if (!v35)
          {
            double v36 = (double)v51 + 0.5;
            if (v12 == 25)
            {
              double v37 = v36 + self->_hoursToPad;
              [(EKDayTimeView *)self hourHeight];
              double v39 = v37 * v38 + 18.0;
            }
            else
            {
              double v40 = v36 + 0.5;
              [(EKDayTimeView *)self hourHeight];
              double v39 = v40 * v41;
            }
            CalRoundToScreenScale(v39);
            double v18 = v42;
          }
          -[EKUIVisualEffectView setFrame:](v26, "setFrame:", v8, v9, v34, v18);
          -[EKDayTimeContentView setFrame:](v23, "setFrame:", 0.0, 0.0, v34, v18);
          -[EKDayTimeContentView setHourRange:](v23, "setHourRange:", 25 - v12, v51);
          v12 += ~v51;
          double v9 = v9 + v18;
          ++v7;
        }
        while (v12 > 0);
        while (v7 < [*(id *)((char *)&self->super.super.super.isa + v2) count])
        {
          v43 = [*(id *)((char *)&self->super.super.super.isa + v2) lastObject];
          [v43 setOwner:0];
          [*(id *)((char *)&self->super.super.super.isa + v2) removeLastObject];
          uint64_t v44 = v10[664];
          v45 = *(Class *)((char *)&self->super.super.super.isa + v44);
          v46 = objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", @"%p", v43);
          v47 = [v45 objectForKey:v46];

          [v47 removeFromSuperview];
          v48 = *(Class *)((char *)&self->super.super.super.isa + v44);
          v49 = [v43 description];
          [v48 removeObjectForKey:v49];
        }
        [(EKDayTimeView *)self bringSubviewToFront:self->_timeMarker];
        timeMarkerExtension = self->_timeMarkerExtension;
        [(EKDayTimeView *)self bringSubviewToFront:timeMarkerExtension];
      }
    }
  }
}

- (double)hourHeight
{
  return self->_hourHeight;
}

- (void)_invalidateTimeWidth
{
  self->_timeWidth = 0.0;
}

+ (double)_dynamicFontSizeForOrientation:(int64_t)a3
{
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  double v4 = [v3 fontDescriptor];
  [v4 pointSize];
  double v6 = v5;

  CalRoundToScreenScale(v6);
  return fmin(v7, 24.0);
}

+ (double)hourHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  [a1 _registerForInvalidation];
  EKUIMultiwindowAssert(a3 != 0, @"Unspecified size class", v6, v7, v8, v9, v10, v11, v19);
  double v12 = 44.0;
  if ((unint64_t)(a4 - 1) < 2) {
    double v12 = 50.0;
  }
  if (a3 == 2) {
    double v13 = 65.0;
  }
  else {
    double v13 = v12;
  }
  double v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8], v12);
  double v15 = [v14 fontDescriptor];
  [v15 pointSize];
  double v17 = v16;

  CalRoundToScreenScale(v13 * (v17 / 17.0));
  return result;
}

+ (void)_registerForInvalidation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EKDayTimeView__registerForInvalidation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForInvalidation_onceToken_0 != -1) {
    dispatch_once(&_registerForInvalidation_onceToken_0, block);
  }
}

+ (void)_calculateWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4 excludeCurrentTime:(BOOL)a5
{
  uint64_t v8 = a5;
  v50[1] = *MEMORY[0x1E4F143B8];
  EKUIMultiwindowAssert(a3 != 0, @"Unspecified size class", a3, a4, a5, v5, v6, v7, v42);
  double v12 = [a1 _hourFontForOrientation:a4];
  CUIKShow24Hours();
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  uint64_t v49 = *MEMORY[0x1E4FB06F8];
  v50[0] = v12;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  double v15 = CUIKStringForHour();
  [v15 sizeWithAttributes:v14];
  double v17 = v16;

  if (v8)
  {
    [a1 timeInsetForSizeClass:a3 orientation:a4];
    double v19 = v17 + v18;
    goto LABEL_24;
  }
  *(double *)&unint64_t v46 = -1.0;
  int v20 = [(id)objc_opt_class() shouldTimeBarWidthMatchAllDayTextWithResultWidth:&v46];
  unsigned int v45 = v8;
  v43 = v14;
  uint64_t v44 = v12;
  if (a3 == 2 || !v20)
  {
    if (a3 == 2)
    {
      if ((unint64_t)(a4 - 1) > 1) {
        double v23 = 31.0;
      }
      else {
        double v23 = 37.0;
      }
      double v25 = v17 + v23;
      uint64_t v24 = 2;
      goto LABEL_18;
    }
  }
  else
  {
    double v22 = *(double *)&__AllDayWidth;
    if (*(double *)&__AllDayWidth <= 0.0)
    {
      double v22 = *(double *)&v46;
      __AllDayWidth = v46;
    }
    if (v17 < v22) {
      double v17 = v22;
    }
  }
  double v23 = v17 + 3.0;
  double v21 = v17 + 4.5;
  uint64_t v24 = 1;
  if ((unint64_t)(a4 - 1) <= 1) {
    double v25 = v17 + 4.5;
  }
  else {
    double v25 = v17 + 3.0;
  }
LABEL_18:
  int64_t v26 = +[EKCurrentTimeMarkerView timeMarkerFontForSizeClass:](EKCurrentTimeMarkerView, "timeMarkerFontForSizeClass:", v24, v23, v21);
  uint64_t v27 = CUIKTodayComponents();
  [v27 setHour:22];
  [v27 setMinute:45];
  v28 = CUIKCalendar();
  uint64_t v29 = [v28 dateFromComponents:v27];

  uint64_t v30 = *MEMORY[0x1E4F57568];
  v31 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  v32 = [v29 localizedStringWithFormat:v30 timeZone:v31];

  uint64_t v47 = v13;
  v48 = v26;
  double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  [v32 sizeWithAttributes:v33];
  double v35 = v34;

  if (v25 >= v35 + 10.0 + 2.0) {
    double v19 = v25;
  }
  else {
    double v19 = v35 + 10.0 + 2.0;
  }
  double v36 = CUIKTodayComponents();
  [v36 setHour:10];
  double v37 = CUIKCalendar();
  double v38 = [v37 dateFromComponents:v36];

  double v39 = (void *)MEMORY[0x1E4F57B68];
  [a1 _dynamicFontSizeForOrientation:1];
  double v40 = objc_msgSend(v39, "stylizedTimelineHourStringForHourDate:baseFontSize:", v38);
  objc_msgSend(v40, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
  if (v19 < v41 + 8.0 + 1.0) {
    double v19 = v41 + 8.0 + 1.0;
  }

  uint64_t v8 = v45;
  double v14 = v43;
  double v12 = v44;
LABEL_24:
  [a1 _setWidth:a4 forOrientation:a3 sizeClass:v8 excludeCurrentTime:v19];
}

- (void)drawRect:(CGRect)a3 forContentView:(id)a4 withHourRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v152[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [v8 bounds];
  CGFloat v123 = v10;
  CGFloat v124 = v9;
  double v141 = v11;
  CGFloat rect = v12;
  int v128 = CUIKShow24Hours();
  uint64_t v13 = [(EKDayTimeView *)self traitCollection];
  BOOL v14 = [v13 userInterfaceStyle] == 2;

  double v15 = self;
  if (self->_cachedHoursAreDark != v14)
  {
    self->_cachedHoursAreDark = v14;
    [(EKDayTimeView *)self _flushTimeStringImageCache];
  }
  if (location) {
    double v16 = self->_hourHeight * 0.5;
  }
  else {
    double v16 = self->_hoursToPad * self->_hourHeight + 18.0;
  }
  CalRoundToScreenScale(v16);
  double v18 = v17;
  double hourHeight = self->_hourHeight;
  double v20 = ceil((CGRectGetMaxY(a3) + (double)location * hourHeight - v17) / hourHeight);
  if (v20 > (double)(length + location)) {
    double v20 = (double)(length + location);
  }
  int v21 = (int)v20;
  double v137 = v18;
  double v138 = hourHeight;
  double v22 = floor((a3.origin.y - v18) / hourHeight);
  if (v22 <= (double)location) {
    double v22 = (double)location;
  }
  int v23 = (int)v22;
  +[EKDayTimeView timeInsetForSizeClass:EKUIWidthSizeClassForViewHierarchy(v15) orientation:v15->_orientation];
  double v136 = v24;
  [(id)objc_opt_class() _timeVerticalInsetForOrientation:v15->_orientation inViewHierarchy:v15];
  double v135 = v25;
  int64_t v26 = [(EKDayTimeView *)v15 delegate];
  v125 = v8;
  [v26 currentTimeRectInView:v8];
  CGFloat v28 = v27;
  CGFloat v140 = v29;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  double v34 = *MEMORY[0x1E4F1DB30];
  double v35 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v36 = &OBJC_IVAR___EKUIAvailabilityViewController__topSpacer;
  v129 = v15;
  int v120 = location;
  if (v23 <= v21)
  {
    int v37 = location;
    uint64_t v38 = 0;
    p_hoursToRender = &v15->_hoursToRender;
    uint64_t v40 = v23;
    uint64_t v121 = *MEMORY[0x1E4FB0700];
    uint64_t v122 = *MEMORY[0x1E4FB06F8];
    int v133 = v23 - v37;
    uint64_t v134 = v21 - (uint64_t)v23;
    double v41 = (id *)(&v15->super.super.super.isa + v23);
    int v42 = ~v21 + v23;
    int v131 = v42;
    v132 = v41;
    CGFloat v144 = v31;
    CGFloat v145 = v28;
    CGFloat v143 = v33;
    int v127 = v23;
    uint64_t v126 = v23;
    do
    {
      if (p_hoursToRender->location <= v40 + v38 && v40 + v38 - p_hoursToRender->location < p_hoursToRender->length)
      {
        id v44 = v132[v38 + 61];
        [(EKDayTimeView *)v15 timeWidth];
        double v46 = v45;
        if (v44)
        {
          [v44 size];
          double v48 = v47;
          double v50 = v49;
        }
        else
        {
          uint64_t v51 = objc_opt_new();
          [v51 setHour:v40 + v38];
          v52 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
          v53 = [v52 dateFromComponents:v51];

          int v54 = v128;
          if (v40 + v38 != 12) {
            int v54 = 1;
          }
          if (v54 == 1)
          {
            v55 = (void *)MEMORY[0x1E4F57B68];
            [(id)objc_opt_class() _dynamicFontSizeForOrientation:v15->_orientation];
            v56 = objc_msgSend(v55, "stylizedTimelineHourStringForHourDate:baseFontSize:", v53);
          }
          else
          {
            v57 = EventKitUIBundle();
            v58 = [v57 localizedStringForKey:@"Noon_timeline_indicator" value:@"Noon" table:0];

            v59 = [(id)objc_opt_class() _noonFontForOrientation:v15->_orientation];
            v151[0] = v122;
            v151[1] = v121;
            v152[0] = v59;
            v60 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_timelineHourColor");
            v152[1] = v60;
            v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:2];

            v56 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v58 attributes:v61];
          }
          [v56 size];
          double v48 = v62;
          double v50 = v63;
          v64 = (void *)MEMORY[0x1E4FB1818];
          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = __55__EKDayTimeView_drawRect_forContentView_withHourRange___block_invoke;
          v147[3] = &unk_1E608A950;
          id v148 = v56;
          id v65 = v56;
          objc_msgSend(v64, "cuik_drawImageWithSize:drawBlock:", v147, v48, v50);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v41 + 61, v44);

          double v15 = v129;
          int v23 = v127;
          double v36 = &OBJC_IVAR___EKUIAvailabilityViewController__topSpacer;
          uint64_t v40 = v126;
        }
        BOOL v66 = *(double *)((char *)&v15->super.super.super.isa + v36[659]) == (double)(v23 + (int)v38);
        if (v35 < 0.001) {
          BOOL v66 = 1;
        }
        if (v66) {
          double v35 = v50;
        }
        double v142 = v35;
        if (v66) {
          double v67 = v48;
        }
        else {
          double v67 = v34;
        }
        int IsLeftToRight = CalInterfaceIsLeftToRight();
        double v69 = v46 - v136 - v48;
        if (!IsLeftToRight) {
          double v69 = v136;
        }
        CalRoundToScreenScale(v69);
        double v71 = v70;
        v153.size.CGFloat height = 1.0;
        v153.origin.CGFloat x = v46;
        v153.origin.CGFloat y = v137 + v138 * (double)(v133 + (int)v38) - v141;
        v153.size.CGFloat width = rect;
        CGFloat MaxY = CGRectGetMaxY(v153);
        CalRoundToScreenScale(v135 + MaxY + v50 * -0.5);
        double v74 = v73;
        if (v134 != v38 && v38
          || (v168.origin.CGFloat x = v71,
              v168.origin.CGFloat y = v73,
              v168.size.CGFloat width = v48,
              v168.size.CGFloat height = v50,
              CGRectIntersectsRect(a3, v168)))
        {
          v154.origin.CGFloat x = v71;
          v154.origin.CGFloat y = v74;
          v154.size.CGFloat width = v48;
          v154.size.CGFloat height = v50;
          CGRect v155 = CGRectInset(v154, 0.0, 3.5);
          CGFloat x = v155.origin.x;
          CGFloat y = v155.origin.y;
          CGFloat width = v155.size.width;
          CGFloat height = v155.size.height;
          double MinY = CGRectGetMinY(v155);
          v156.size.CGFloat width = v144;
          v156.origin.CGFloat x = v145;
          v156.origin.CGFloat y = v140;
          v156.size.CGFloat height = v143;
          if (MinY > CGRectGetMaxY(v156) + 0.0) {
            goto LABEL_38;
          }
          v157.origin.CGFloat x = x;
          v157.origin.CGFloat y = y;
          v157.size.CGFloat width = width;
          v157.size.CGFloat height = height;
          double v80 = CGRectGetMaxY(v157);
          v158.size.CGFloat width = v144;
          v158.origin.CGFloat x = v145;
          v158.origin.CGFloat y = v140;
          v158.size.CGFloat height = v143;
          if (v80 < CGRectGetMinY(v158)) {
LABEL_38:
          }
            objc_msgSend(v44, "drawAtPoint:", v71, v74);
        }

        CGFloat v31 = v144;
        CGFloat v28 = v145;
        double v34 = v67;
        double v35 = v142;
        CGFloat v33 = v143;
        int v42 = v131;
      }
      ++v38;
      ++v41;
    }
    while (v42 + v38);
  }
  uint64_t v81 = v36[659];
  if (*(double *)((char *)&v15->super.super.super.isa + v81) >= 0.0)
  {
    [(id)objc_opt_class() _dynamicFontSizeForOrientation:v15->_orientation];
    v82 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:");
    double v83 = *(double *)((char *)&v15->super.super.super.isa + v81);
    int v84 = (int)v83;
    double v85 = (v83 - (float)(int)v83) * 60.0;
    int v86 = (int)(v85 / 15.0);
    *(float *)&double v85 = v85;
    unsigned int v87 = (int)(float)(roundf(*(float *)&v85) / 5.0);
    if (v87 > 0xB || ((1 << v87) & 0x882) == 0)
    {
      if (v86 <= 0)
      {
LABEL_73:

        goto LABEL_74;
      }
      CGFloat v89 = v34;
      uint64_t v90 = CUIKLocalizedStringForInteger();
    }
    else
    {
      CGFloat v89 = v34;
      uint64_t v90 = CUIKLocalizedStringForIntegerWithMinimumTwoDigits();
    }
    v91 = (void *)v90;
    v92 = [@":" stringByAppendingString:v90];

    uint64_t v149 = *MEMORY[0x1E4FB06F8];
    v150 = v82;
    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    [v92 sizeWithAttributes:v93];
    double v95 = v94;

    double v15 = v129;
    [(EKDayTimeView *)v129 contentScaleFactor];
    if (v96 == 1.0) {
      double v97 = 1.0;
    }
    else {
      double v97 = 0.0;
    }
    if (CalInterfaceIsLeftToRight())
    {
      [(EKDayTimeView *)v129 timeWidth];
      double v99 = v98 - v136 - v95 + v97;
    }
    else
    {
      double v99 = v136 - v97;
    }
    double v100 = v138 * 0.25 + -4.0;
    if (v35 < v100) {
      double v100 = v35;
    }
    if (v87 != 1) {
      double v100 = -0.0;
    }
    double v101 = v137 - v141 + -7.0 + v138 * (double)(v84 - v120) + v138 * 0.25 * (double)v86 + v100;
    IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v129);
    double v103 = -1.5;
    if (IsRegularInViewHierarchy) {
      double v103 = 1.0;
    }
    double v104 = v101 + v103;
    if (v86 != 3) {
      double v104 = v101;
    }
    double v105 = 0.5;
    if (IsRegularInViewHierarchy) {
      double v105 = 2.0;
    }
    double v106 = v101 + v105;
    if (v86 == 1 || v87 == 1) {
      double v108 = v106;
    }
    else {
      double v108 = v104;
    }
    v159.origin.CGFloat x = v99;
    v159.origin.CGFloat y = v108;
    v159.size.CGFloat width = v89;
    CGFloat v146 = v89;
    v159.size.CGFloat height = v35;
    double v109 = v99;
    double v110 = CGRectGetMinY(v159);
    v160.origin.CGFloat x = v28;
    v160.origin.CGFloat y = v140;
    v160.size.CGFloat width = v31;
    v160.size.CGFloat height = v33;
    if (v110 > CGRectGetMaxY(v160) + 0.0) {
      goto LABEL_71;
    }
    v161.origin.CGFloat x = v109;
    v161.origin.CGFloat y = v108;
    v161.size.CGFloat width = v146;
    v161.size.CGFloat height = v35;
    double v111 = CGRectGetMaxY(v161);
    v162.origin.CGFloat x = v28;
    v162.origin.CGFloat y = v140;
    v162.size.CGFloat width = v31;
    v162.size.CGFloat height = v33;
    if (v111 < CGRectGetMinY(v162))
    {
LABEL_71:
      objc_msgSend(MEMORY[0x1E4FB1618], "cuik_timelineHourColor");
      id v112 = objc_claimAutoreleasedReturnValue();
      [v112 CGColor];
      UISetColor();

      objc_msgSend(v92, "_legacy_drawAtPoint:withFont:", v82, CalRoundPointToScreenScale(v109, v108));
    }

    goto LABEL_73;
  }
LABEL_74:
  v113 = [MEMORY[0x1E4FB1618] separatorColor];
  if (*((unsigned char *)v15 + 424))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetShouldAntialias(CurrentContext, 0);
    [v113 CGColor];
    UISetColor();
    double v115 = EKUISeparatorLineThickness();
    v163.size.CGFloat height = v123;
    v163.origin.CGFloat x = v124;
    v163.origin.CGFloat y = v141;
    v163.size.CGFloat width = rect;
    v164.size.CGFloat height = CGRectGetHeight(v163);
    v164.origin.CGFloat x = 0.0;
    v164.origin.CGFloat y = 0.0;
    v164.size.CGFloat width = v115;
    UIRectFill(v164);
  }
  if ((*((unsigned char *)v15 + 424) & 2) != 0)
  {
    v116 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v116);
    CGContextSetShouldAntialias(v116, 0);
    [v113 CGColor];
    UISetColor();
    v165.origin.CGFloat x = v124;
    v165.origin.CGFloat y = v141;
    v165.size.CGFloat width = rect;
    v165.size.CGFloat height = v123;
    double v117 = CGRectGetWidth(v165);
    CGFloat v118 = v117 - EKUISeparatorLineThickness();
    double v119 = EKUISeparatorLineThickness();
    v166.origin.CGFloat x = v124;
    v166.origin.CGFloat y = v141;
    v166.size.CGFloat width = rect;
    v166.size.CGFloat height = v123;
    v167.size.CGFloat height = CGRectGetHeight(v166);
    v167.origin.CGFloat y = 0.0;
    v167.origin.CGFloat x = v118;
    v167.size.CGFloat width = v119;
    UIRectFill(v167);
  }
}

- (double)timeWidth
{
  double result = self->_timeWidth;
  if (result == 0.0)
  {
    +[EKDayTimeView timeWidthForOrientation:self->_orientation inViewHierarchy:self];
    self->_timeWidth = result;
  }
  return result;
}

- (EKDayTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDayTimeViewDelegate *)WeakRetained;
}

+ (CGRect)timeMarkerFrameForTotalWidth:(double)a3 timeWidth:(double)a4 timeMarker:(id)a5 hourHeight:(double)a6 topPadding:(double)a7
{
  id v12 = a5;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  int v14 = [v12 showsThumb];
  double v15 = 0.0;
  if (IsLeftToRight)
  {
    if (v14)
    {
      [v12 markerWidth];
      double v17 = a4 - v16;
      [v12 markerInset];
      double v15 = v17 - v18;
      a3 = a3 - v15;
    }
  }
  else if (v14)
  {
    [v12 markerWidth];
    double v20 = a3 - a4 + v19;
    [v12 markerInset];
    a3 = v20 + v21;
  }
  double v22 = CUIKNowComponents();
  objc_msgSend(a1, "positionOfSecond:hourHeight:topPadding:clampToBounds:", (int)((double)objc_msgSend(v22, "second")+ (double)(3600 * objc_msgSend(v22, "hour") + 60 * objc_msgSend(v22, "minute"))), 1, a6, a7);
  double v24 = v23;
  [v12 bounds];
  double v26 = v24 + v25 * -0.5;
  [v12 bounds];
  double v28 = v27;

  double v29 = v15;
  double v30 = v26;
  double v31 = a3;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

+ (double)_timeVerticalInsetForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(a4);
  double result = -3.5;
  double v7 = -3.0;
  if ((unint64_t)(a3 - 1) >= 2) {
    double v7 = -3.5;
  }
  if (!IsRegularInViewHierarchy) {
    return v7;
  }
  return result;
}

+ (void)_setWidth:(double)a3 forOrientation:(int64_t)a4 sizeClass:(int64_t)a5 excludeCurrentTime:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = a4 - 1;
  BOOL v10 = !a6;
  BOOL v11 = (unint64_t)(a4 - 1) > 1 || !a6;
  if (v11 || a5 != 2)
  {
    if (a5 == 2) {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (v9 < 2) {
        BOOL v10 = 1;
      }
      if (v10 || a5 != 2)
      {
        if (a5 == 2) {
          BOOL v10 = 1;
        }
        if (v10)
        {
          BOOL v12 = (unint64_t)(a4 - 1) > 1 || a6;
          if ((unint64_t)(a4 - 1) > 1 || a6 || a5 != 2)
          {
            if (a5 == 2) {
              BOOL v12 = 1;
            }
            if (v12)
            {
              BOOL v13 = v9 < 2 || a6;
              if (v13 || a5 != 2)
              {
                if (a5 == 2) {
                  BOOL v13 = 1;
                }
                if (v13)
                {
                  int v14 = (void *)kEKUILogHandle;
                  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
                  {
                    double v15 = v14;
                    double v16 = (objc_class *)objc_opt_class();
                    double v17 = NSStringFromClass(v16);
                    int v18 = 138413058;
                    double v19 = v17;
                    __int16 v20 = 1024;
                    BOOL v21 = v6;
                    __int16 v22 = 2048;
                    int64_t v23 = a4;
                    __int16 v24 = 2048;
                    int64_t v25 = a5;
                    _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "[%@] Unhandled combination of excludeCurrentTime:%d, orientation:%ld, sizeClass:%ld when trying to setWidth", (uint8_t *)&v18, 0x26u);
                  }
                }
                else
                {
                  __HourWidthLandscapeCompact = *(void *)&a3;
                }
              }
              else
              {
                __HourWidthLandscapeRegular = *(void *)&a3;
              }
            }
            else
            {
              __HourWidthPortraitCompact = *(void *)&a3;
            }
          }
          else
          {
            __HourWidthPortraitRegular = *(void *)&a3;
          }
        }
        else
        {
          __HourWidthExcludingCurrentTimeLandscapeCompact = *(void *)&a3;
        }
      }
      else
      {
        __HourWidthExcludingCurrentTimeLandscapeRegular = *(void *)&a3;
      }
    }
    else
    {
      __HourWidthExcludingCurrentTimePortraitCompact = *(void *)&a3;
    }
  }
  else
  {
    __HourWidthExcludingCurrentTimePortraitRegular = *(void *)&a3;
  }
}

+ (id)_noonFontForOrientation:(int64_t)a3
{
  [a1 _dynamicFontSizeForOrientation:a3];
  double v3 = (void *)MEMORY[0x1E4FB08E0];

  return (id)objc_msgSend(v3, "systemFontOfSize:weight:");
}

+ (id)_hourFontForOrientation:(int64_t)a3
{
  [a1 _dynamicFontSizeForOrientation:a3];
  double v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v3 * 1.36363636];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_createFontFromFont:withFontGrade:", v4, 2);

  return v5;
}

void __41__EKDayTimeView__registerForInvalidation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__invalidateCachedValues name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(EKDayTimeView *)self updateHourHeight];
    [(EKDayTimeView *)self _invalidateTimeWidth];
    [(EKDayTimeView *)self _flushTimeStringImageCache];
    [(EKDayTimeView *)self setNeedsDisplay];
    [(EKDayTimeView *)self setNeedsLayout];
    [(EKDayTimeView *)self layoutFrames];
  }
}

- (void)setNeedsDisplay
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_contentViews;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setNeedsDisplay", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (double)defaultHourScale
{
  return 1.0;
}

+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  uint64_t v6 = objc_opt_class();

  [v6 defaultHeightForSizeClass:a3 orientation:a4 withHourScale:1.0];
  return result;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  if (self->_showsTimeMarker != a3)
  {
    timeMarker = self->_timeMarker;
    if (a3)
    {
      if (timeMarker) {
        [(EKCurrentTimeMarkerView *)timeMarker removeFromSuperview];
      }
      uint64_t v6 = -[EKCurrentTimeMarkerView initWithFrame:sizeClass:]([EKCurrentTimeMarkerView alloc], "initWithFrame:sizeClass:", [(EKDayTimeView *)self _sizeClass], 0.0, 0.0, 10.0, 10.0);
      long long v7 = self->_timeMarker;
      self->_timeMarker = v6;

      [(EKCurrentTimeMarkerView *)self->_timeMarker setAutoresizingMask:2];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsThumb:self->_showsTimeMarkerExtension];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsLine:0];
      [(EKDayTimeView *)self bounds];
      double v9 = v8;
      [(EKDayTimeView *)self timeWidth];
      double v11 = v10;
      uint64_t v12 = self->_timeMarker;
      [(EKDayTimeView *)self hourHeight];
      double v14 = v13;
      [(EKDayTimeView *)self topPadding];
      +[EKDayTimeView timeMarkerFrameForTotalWidth:v12 timeWidth:v9 timeMarker:v11 hourHeight:v14 topPadding:v15];
      -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
      [(EKDayTimeView *)self addSubview:self->_timeMarker];
      [(EKDayTimeView *)self setNeedsLayout];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setAlpha:0.0];
      [(UIView *)self->_timeMarkerExtension setAlpha:0.0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __36__EKDayTimeView_setShowsTimeMarker___block_invoke;
      v29[3] = &unk_1E6087570;
      v29[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v29 animations:0.2];
    }
    else
    {
      [(EKCurrentTimeMarkerView *)timeMarker setShowsThumb:0];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setShowsLine:0];
      [(EKCurrentTimeMarkerView *)self->_timeMarker setAlpha:1.0];
      [(UIView *)self->_timeMarkerExtension setAlpha:1.0];
      double v16 = self->_timeMarker;
      double v17 = self->_timeMarker;
      self->_timeMarker = 0;

      int v18 = (void *)MEMORY[0x1E4FB1EB0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __36__EKDayTimeView_setShowsTimeMarker___block_invoke_2;
      v26[3] = &unk_1E6087D68;
      double v27 = v16;
      double v28 = self;
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      int64_t v23 = __36__EKDayTimeView_setShowsTimeMarker___block_invoke_3;
      __int16 v24 = &unk_1E6087520;
      int64_t v25 = v27;
      double v19 = v27;
      [v18 animateWithDuration:v26 animations:&v21 completion:0.2];
    }
    self->_showsTimeMarker = a3;
    __int16 v20 = [(EKDayTimeView *)self delegate];

    if (v20) {
      [(EKDayTimeView *)self setNeedsDisplay];
    }
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setOpaque:](&v16, sel_setOpaque_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_contentViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "setOpaque:", v3, (void)v12);
        if (v3) {
          [MEMORY[0x1E4FB1618] systemBackgroundColor];
        }
        else {
        double v11 = [MEMORY[0x1E4FB1618] clearColor];
        }
        [v10 setBackgroundColor:v11];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)setDelegate:(id)a3
{
}

- (EKDayTimeView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  v20.receiver = self;
  v20.super_class = (Class)EKDayTimeView;
  uint64_t v5 = -[EKDayTimeView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_highlightedHour = -1.0;
    v5->_double hourHeight = -1.0;
    [(id)objc_opt_class() defaultHourScale];
    v6->_hourHeightScale = v7;
    v6->_targetSizeClass = a4;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_todayTimelineColor");
    timeMarkerExtensionColor = v6->_timeMarkerExtensionColor;
    v6->_timeMarkerExtensionColor = (UIColor *)v8;

    double v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKDayTimeView *)v6 setBackgroundColor:v10];

    double v11 = CalendarAppTintColor();
    [(EKDayTimeView *)v6 setTintColor:v11];

    v6->_hoursToRender = (_NSRange)xmmword_1B413AD50;
    long long v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contentViews = v6->_contentViews;
    v6->_contentViews = v12;

    long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visualEffectViews = v6->_visualEffectViews;
    v6->_visualEffectViews = v14;

    [(EKDayTimeView *)v6 layoutFrames];
    objc_super v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel__localeChanged name:*MEMORY[0x1E4F57AB0] object:0];

    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v6 selector:sel__fontSizeChanged name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel__sizeClassChanged name:*MEMORY[0x1E4F57B00] object:0];
  }
  return v6;
}

- (void)_flushTimeStringImageCache
{
  uint64_t v2 = 0;
  cachedHours = self->_cachedHours;
  do
  {
    uint64_t v4 = cachedHours[v2];
    cachedHours[v2] = 0;

    ++v2;
  }
  while (v2 != 25);
}

- (double)topPadding
{
  +[EKDayTimeView verticalPadding];
  return v3 + self->_hoursToPad * self->_hourHeight;
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 464);

  return [v2 setAlpha:1.0];
}

+ (void)_invalidateCachedValues
{
  __AllDayWidth = 0xBFF0000000000000;
}

+ (void)_invalidateWidth
{
  __HourWidthPortraitRegular = 0;
  __HourWidthPortraitCompact = 0;
  __HourWidthLandscapeRegular = 0;
  __HourWidthLandscapeCompact = 0;
  __HourWidthExcludingCurrentTimePortraitRegular = 0;
  __HourWidthExcludingCurrentTimePortraitCompact = 0;
  __HourWidthExcludingCurrentTimeLandscapeRegular = 0;
  __HourWidthExcludingCurrentTimeLandscapeCompact = 0;
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"EKDayTimeViewHourWidthChangedNotification" object:0];
}

+ (double)hourWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  [a1 _widthForOrientation:a4 sizeClass:a3 excludeCurrentTime:1];
  if (result == 0.0)
  {
    [a1 _calculateWidthForSizeClass:a3 orientation:a4 excludeCurrentTime:1];
    [a1 _widthForOrientation:a4 sizeClass:a3 excludeCurrentTime:1];
  }
  return result;
}

- (double)defaultHeight
{
  +[EKDayTimeView defaultHeightForSizeClass:[(EKDayTimeView *)self _sizeClass] orientation:self->_orientation withHourScale:self->_hourHeightScale];
  double hoursToPad = self->_hoursToPad;
  if (hoursToPad > 0.0) {
    return result + hoursToPad * self->_hourHeight * 2.0;
  }
  return result;
}

+ (id)unscaledAllDayLabelFont
{
  return +[EKDayAllDayView unscaledAllDayFont];
}

+ (id)allDayLabelFont
{
  return +[EKDayAllDayView allDayLabelFont];
}

+ (id)allDayLabelBoldFont
{
  return +[EKDayAllDayView allDayLabelBoldFont];
}

+ (double)heightOfHourTextForHour:(int64_t)a3 orientation:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 _hourFontForOrientation:a4];
  uint64_t v5 = CUIKStringForHour();
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  v11[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 sizeWithAttributes:v6];
  double v8 = v7;

  return v8;
}

- (EKDayTimeView)initWithFrame:(CGRect)a3
{
  return -[EKDayTimeView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = self->_contentViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setOwner:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)EKDayTimeView;
  [(EKDayTimeView *)&v8 dealloc];
}

- (void)_localeChanged
{
  [(EKDayTimeView *)self _flushTimeStringImageCache];
  +[EKDayTimeView _invalidateWidth];
  [(EKDayTimeView *)self _invalidateTimeWidth];

  [(EKDayTimeView *)self setNeedsDisplay];
}

- (void)_fontSizeChanged
{
  [(EKDayTimeView *)self _flushTimeStringImageCache];
  +[EKDayTimeView _invalidateWidth];
  [(EKDayTimeView *)self _invalidateTimeWidth];

  [(EKDayTimeView *)self setNeedsDisplay];
}

- (void)_sizeClassChanged
{
  [(EKDayTimeView *)self _flushTimeStringImageCache];
  +[EKDayTimeView _invalidateWidth];
  [(EKDayTimeView *)self _invalidateTimeWidth];

  [(EKDayTimeView *)self setNeedsDisplay];
}

- (void)setHoursToRender:(_NSRange)a3
{
  if (self->_hoursToRender.location != a3.location || self->_hoursToRender.length != a3.length)
  {
    self->_hoursToRender = a3;
    [(EKDayTimeView *)self setNeedsDisplay];
  }
}

- (void)setHourHeightScale:(double)a3
{
  self->_hourHeightScale = a3;
  [(EKDayTimeView *)self updateHourHeight];
  [(EKDayTimeView *)self layoutFrames];

  [(EKDayTimeView *)self setNeedsDisplay];
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 424);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 424) = v3 & 0xFE | a3;
    uint64_t v5 = [(EKDayTimeView *)self superview];
    [v5 setNeedsLayout];

    [(EKDayTimeView *)self setNeedsLayout];
    [(EKDayTimeView *)self setNeedsDisplay];
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
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 424) = v3 & 0xFD | v4;
    [(EKDayTimeView *)self setNeedsDisplay];
  }
}

- (BOOL)showsRightBorder
{
  return (*((unsigned __int8 *)self + 424) >> 1) & 1;
}

- (void)setHighlightedHour:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_highlightedHour != a3)
  {
    [(EKDayTimeView *)self scaledHourHeight];
    double v6 = v5;
    double hoursToPad = self->_hoursToPad;
    double v8 = 18.0;
    if (hoursToPad > 0.0) {
      double v8 = hoursToPad * self->_hourHeight + 18.0;
    }
    [(EKDayTimeView *)self bounds];
    double v10 = v9;
    [(EKDayTimeView *)self bounds];
    double v12 = v11;
    [(EKDayTimeView *)self bounds];
    double v14 = v13;
    double highlightedHour = self->_highlightedHour;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v16 = self->_contentViews;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      double v19 = v8 - (v10 + 5.0);
      double v20 = v19 + v6 * (double)(int)a3;
      double v21 = v19 + v6 * (double)(int)highlightedHour;
      double v22 = v6 + 10.0;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v16);
          }
          int64_t v25 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_msgSend(v25, "convertRect:fromView:", self, v12, v21, v14, v22, (void)v26);
          objc_msgSend(v25, "setNeedsDisplayInRect:");
          objc_msgSend(v25, "convertRect:fromView:", self, v12, v20, v14, v22);
          objc_msgSend(v25, "setNeedsDisplayInRect:");
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    self->_double highlightedHour = a3;
  }
}

- (double)highlightedHour
{
  return self->_highlightedHour;
}

- (void)setTimeColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_timeColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_timeColor, a3);
    [(EKDayTimeView *)self setNeedsDisplay];
    double v5 = v6;
  }
}

- (UIColor)timeColor
{
  timeColor = self->_timeColor;
  if (!timeColor)
  {
    char v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v5 = self->_timeColor;
    self->_timeColor = v4;

    timeColor = self->_timeColor;
  }

  return timeColor;
}

- (EKCurrentTimeMarkerView)timeMarker
{
  return self->_timeMarker;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(EKDayTimeView *)self timeWidth];
  double v5 = v4;
  [(EKDayTimeView *)self defaultHeight];
  double v7 = v6;
  double v8 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(EKCurrentTimeMarkerView *)self->_timeMarker setSemanticContentAttribute:a3];
}

- (void)setVisualEffect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (UIVisualEffect *)a3;
  if (self->_visualEffect != v5)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v6 = [(NSMutableDictionary *)self->_visualEffectViews allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setEffect:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 40) + 464);

  return [v2 setAlpha:0.0];
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setShowsTimeMarkerExtension:(BOOL)a3
{
  if (self->_showsTimeMarkerExtension != a3)
  {
    self->_showsTimeMarkerExtension = a3;
    if (a3)
    {
      double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      timeMarkerExtension = self->_timeMarkerExtension;
      self->_timeMarkerExtension = v4;

      [(UIView *)self->_timeMarkerExtension setBackgroundColor:self->_timeMarkerExtensionColor];
      [(EKDayTimeView *)self addSubview:self->_timeMarkerExtension];
    }
    else
    {
      [(UIView *)self->_timeMarkerExtension removeFromSuperview];
      double v6 = self->_timeMarkerExtension;
      self->_timeMarkerExtension = 0;
    }
    [(EKDayTimeView *)self setNeedsLayout];
  }
}

- (void)setTimeMarkerExtensionColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_timeMarkerExtensionColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeMarkerExtensionColor, a3);
    [(UIView *)self->_timeMarkerExtension setBackgroundColor:v5];
  }
}

+ (CGRect)_timeLineExtensionFrameForTimeWidth:(double)a3 timeMarker:(id)a4 timeLabelXPosition:(double)a5 yPosition:(double)a6
{
  id v8 = a4;
  double v9 = 0.0;
  if (CalInterfaceIsLeftToRight())
  {
    [v8 markerWidth];
    double v9 = v10 + a5;
  }
  [v8 extensionLineHeight];
  double v12 = v11;
  double v13 = a6 + v11 * -0.5;
  [v8 markerInset];
  double v15 = v14;

  double v16 = v9;
  double v17 = v13;
  double v18 = v15;
  double v19 = v12;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)showsTimeMarkerExtension
{
  return self->_showsTimeMarkerExtension;
}

- (UIColor)timeMarkerExtensionColor
{
  return self->_timeMarkerExtensionColor;
}

- (double)hoursToPad
{
  return self->_hoursToPad;
}

- (void)setHoursToPad:(double)a3
{
  self->_double hoursToPad = a3;
}

- (_NSRange)hoursToRender
{
  p_hoursToRender = &self->_hoursToRender;
  NSUInteger location = self->_hoursToRender.location;
  NSUInteger length = p_hoursToRender->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)hourHeightScale
{
  return self->_hourHeightScale;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_timeMarkerExtensionColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  for (uint64_t i = 24; i != -1; --i)
    objc_storeStrong((id *)&self->_cachedHours[i], 0);
  objc_storeStrong((id *)&self->_timeMarkerExtension, 0);
  objc_storeStrong((id *)&self->_timeMarker, 0);
  objc_storeStrong((id *)&self->_visualEffectViews, 0);

  objc_storeStrong((id *)&self->_contentViews, 0);
}

@end