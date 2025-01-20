@interface AXWaveformSelectionBarElement
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)adjustsStartTime;
- (BOOL)isWaveformOverview;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseValue:(BOOL)a3 isThreeFingerScroll:(BOOL)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setAdjustsStartTime:(BOOL)a3;
@end

@implementation AXWaveformSelectionBarElement

- (BOOL)isWaveformOverview
{
  BOOL v5 = 0;
  v2 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v3 = [v2 safeValueForKey:@"_isOverView"];
  [v3 getValue:&v5];

  return v5;
}

- (id)accessibilityLabel
{
  char v10 = 0;
  v3 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"_insertMode"];
  [v4 getValue:&v10];

  if (v10)
  {
    if ([(AXWaveformSelectionBarElement *)self adjustsStartTime]) {
      BOOL v5 = @"WAVEFORM_SELECTION_START_TIME_BAR";
    }
    else {
      BOOL v5 = @"WAVEFORM_SELECTION_END_TIME_BAR";
    }
  }
  else
  {
    unsigned int v6 = [(AXWaveformSelectionBarElement *)self isWaveformOverview];
    unsigned int v7 = [(AXWaveformSelectionBarElement *)self adjustsStartTime];
    if (v6)
    {
      if (v7) {
        BOOL v5 = @"AX_TRIM_OVERVIEW_WAVEFORM_START";
      }
      else {
        BOOL v5 = @"AX_TRIM_OVERVIEW_WAVEFORM_END";
      }
    }
    else if (v7)
    {
      BOOL v5 = @"AX_TRIM_DETAIL_WAVEFORM_START";
    }
    else
    {
      BOOL v5 = @"AX_TRIM_DETAIL_WAVEFORM_END";
    }
  }
  v8 = RCLocalizedFrameworkString(v5);

  return v8;
}

- (id)accessibilityHint
{
  return RCLocalizedFrameworkString(@"WAVEFORM_SELECTION_HINT");
}

- (id)accessibilityValue
{
  v3 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"_selectedTimeRange"];
  [v4 getValue:&v7];

  [(AXWaveformSelectionBarElement *)self adjustsStartTime];
  BOOL v5 = UIAXTimeStringForDuration();

  return v5;
}

- (CGRect)accessibilityFrame
{
  v3 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"_selectionRect"];
  [v4 CGRectValue];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v14 = [v13 safeValueForKey:@"_xAdjustmentAmount"];
  [v14 floatValue];
  float v16 = v15;

  if ([(AXWaveformSelectionBarElement *)self adjustsStartTime])
  {
    v27.origin.CGFloat x = v6;
    v27.origin.CGFloat y = v8;
    v27.size.CGFloat width = v10;
    v27.size.CGFloat height = v12;
    double MaxX = CGRectGetMinX(v27) + v16;
  }
  else
  {
    v28.origin.CGFloat x = v6;
    v28.origin.CGFloat y = v8;
    v28.size.CGFloat width = v10;
    v28.size.CGFloat height = v12;
    double MaxX = CGRectGetMaxX(v28);
  }
  v18 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v29.size.CGFloat width = 10.0;
  v29.origin.CGFloat x = MaxX;
  v29.origin.CGFloat y = v8;
  v29.size.CGFloat height = v12;
  CGRect v30 = UIAccessibilityConvertFrameToScreenCoordinates(v29, v18);
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AXWaveformSelectionBarElement;
  return UIAccessibilityTraitAdjustable | [(AXWaveformSelectionBarElement *)&v3 accessibilityTraits];
}

- (void)_accessibilityIncreaseValue:(BOOL)a3 isThreeFingerScroll:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v41 = 0.0;
  double v42 = 0.0;
  double v7 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  CGFloat v8 = [v7 safeValueForKey:@"_selectedTimeRange"];
  [v8 getValue:&v41];

  double v10 = v41;
  double v9 = v42;
  double v40 = 0.0;
  double v11 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  CGFloat v12 = [v11 safeValueForKey:@"_assetDuration"];
  [v12 getValue:&v40];

  unsigned int v13 = [(AXWaveformSelectionBarElement *)self isWaveformOverview];
  double v14 = 10.0;
  double v15 = 6.0;
  if (!v13)
  {
    double v15 = 10.0;
    double v14 = 20.0;
  }
  if (v4) {
    double v14 = v15;
  }
  double v16 = v40 / v14;
  unsigned int v17 = [(AXWaveformSelectionBarElement *)self adjustsStartTime];
  if (v5)
  {
    if (v17)
    {
      double v18 = 0.0;
      if (v10 + v16 >= 0.0)
      {
        double v18 = v10 + v16;
        if (v10 + v16 >= v9) {
          double v18 = v9;
        }
      }
LABEL_13:
      double v19 = RCTimeRangeMake(v18, v9);
      double v21 = v20;
      uint64_t v22 = 0;
      uint64_t v23 = 1;
      goto LABEL_21;
    }
    double v24 = v40;
    if (v9 + v16 <= v40) {
      double v24 = v9 + v16;
    }
  }
  else
  {
    if (v17)
    {
      double v18 = v10 - v16;
      if (v10 - v16 < 0.0) {
        double v18 = 0.0;
      }
      goto LABEL_13;
    }
    double v24 = v40;
    if (v9 - v16 <= v40)
    {
      double v24 = v9 - v16;
      if (v9 - v16 <= v10) {
        double v24 = v10;
      }
    }
  }
  double v19 = RCTimeRangeMake(v10, v24);
  double v21 = v25;
  uint64_t v23 = 0;
  uint64_t v22 = 1;
LABEL_21:
  if (!RCTimeRangeEqualToTimeRange(v41, v42, v19, v21))
  {
    double v26 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
    CGRect v27 = [v26 safeValueForKey:@"_delegate"];
    CGRect v28 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
    objc_msgSend(v27, "waveformSelectionOverlay:willChangeSelectedTimeRange:isTrackingMin:isTrackingMax:", v28, v23, v22, v19, v21);
    double v30 = v29;
    double v32 = v31;

    if (v30 >= 0.0 && v32 <= v40)
    {
      v34 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
      objc_msgSend(v34, "setSelectedTimeRange:", v30, v32);
    }
  }
  v35 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v36 = [v35 safeValueForKey:@"_delegate"];
  v37 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  [v36 waveformSelectionOverlay:v37 didFinishTrackingSelectionBeginTime:v23 endTime:v22 assetCurrentTime:0];

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  UIAccessibilityNotifications v38 = UIAccessibilityAnnouncementNotification;
  v39 = [(AXWaveformSelectionBarElement *)self accessibilityValue];
  UIAccessibilityPostNotification(v38, v39);
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = 0;
  if (a3 == 3) {
    goto LABEL_4;
  }
  if (a3 == 4)
  {
    BOOL v5 = 1;
LABEL_4:
    -[AXWaveformSelectionBarElement _accessibilityIncreaseValue:isThreeFingerScroll:](self, "_accessibilityIncreaseValue:isThreeFingerScroll:", v5, 1, v3, v4);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)adjustsStartTime
{
  return self->_adjustsStartTime;
}

- (void)setAdjustsStartTime:(BOOL)a3
{
  self->_adjustsStartTime = a3;
}

@end