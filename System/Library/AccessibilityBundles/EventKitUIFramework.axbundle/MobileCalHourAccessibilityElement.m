@interface MobileCalHourAccessibilityElement
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)isAccessibilityElement;
- (CGRect)_frameInDayGridView;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameForScrolling;
- (NSDate)hourDate;
- (UIView)dayGridView;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (void)setDayGridView:(id)a3;
- (void)setHourDate:(id)a3;
@end

@implementation MobileCalHourAccessibilityElement

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [MEMORY[0x263EFF910] date];
  v5 = [v3 components:62 fromDate:v4];

  v6 = [(MobileCalHourAccessibilityElement *)self hourDate];
  v7 = [v6 _accessibilityTimeString];

  v8 = [(MobileCalHourAccessibilityElement *)self hourDate];

  if (!v8)
  {
    v18 = self;
    _AXAssert();
  }
  v9 = [(MobileCalHourAccessibilityElement *)self hourDate];

  if (v9)
  {
    v10 = [(MobileCalHourAccessibilityElement *)self hourDate];
    v11 = [v3 components:62 fromDate:v10];

    uint64_t v12 = [v11 year];
    if (v12 == [v5 year])
    {
      uint64_t v13 = [v11 month];
      if (v13 == [v5 month])
      {
        uint64_t v14 = [v11 day];
        if (v14 == [v5 day])
        {
          uint64_t v15 = [v11 hour];
          if (v15 == [v5 hour])
          {
            v19 = accessibilityLocalizedString(@"in.progress");
            uint64_t v16 = __UIAXStringForVariables();

            v7 = (void *)v16;
          }
        }
      }
    }
  }

  return v7;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(MobileCalHourAccessibilityElement *)self hourDate];
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [v3 components:62 fromDate:v2];

  if ([v4 hour] == 12 && !MEMORY[0x24564B910]())
  {
    uint64_t v5 = accessibilityLocalizedString(@"noon");
  }
  else
  {
    uint64_t v5 = MEMORY[0x24564B920]([v4 hour]);
  }
  v6 = (void *)v5;
  v7 = MEMORY[0x24564B970]();

  return v7;
}

- (CGRect)_frameInDayGridView
{
  v3 = [(MobileCalHourAccessibilityElement *)self accessibilityContainer];
  [v3 accessibilityFrame];

  v4 = [(MobileCalHourAccessibilityElement *)self dayGridView];
  UIAccessibilityFrameToBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(MobileCalHourAccessibilityElement *)self hourDate];
  uint64_t v14 = [(MobileCalHourAccessibilityElement *)self hourDate];

  if (!v14)
  {
    v27 = self;
    _AXAssert();
  }
  uint64_t v15 = [(MobileCalHourAccessibilityElement *)self hourDate];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x263EFF8F0] currentCalendar];
    v17 = [v16 components:62 fromDate:v13];

    v18 = [v4 safeValueForKey:@"topPadding"];
    [v18 doubleValue];
    double v20 = v19;

    v21 = [v4 safeValueForKey:@"hourHeight"];
    [v21 doubleValue];
    double v12 = v22;

    double v8 = v8 + v20 + v12 * (double)[v17 hour];
  }

  double v23 = v6;
  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)accessibilityFrame
{
  v3 = [(MobileCalHourAccessibilityElement *)self dayGridView];
  [(MobileCalHourAccessibilityElement *)self _frameInDayGridView];
  UIAccessibilityFrameForBounds();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  v8.receiver = self;
  v8.super_class = (Class)MobileCalHourAccessibilityElement;
  unsigned int v3 = [(MobileCalHourAccessibilityElement *)&v8 isAccessibilityElement];
  objc_opt_class();
  double v4 = [(MobileCalHourAccessibilityElement *)self dayGridView];
  double v5 = __UIAccessibilityCastAsSafeCategory();

  if (v3)
  {
    if ([v5 accessibilityIsPreviewGridView])
    {
      [(MobileCalHourAccessibilityElement *)self accessibilityFrameForScrolling];
      BOOL v6 = !CGRectIsNull(v9);
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)accessibilityFrameForScrolling
{
  v33.receiver = self;
  v33.super_class = (Class)MobileCalHourAccessibilityElement;
  [(MobileCalHourAccessibilityElement *)&v33 accessibilityFrameForScrolling];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  char v32 = 0;
  objc_opt_class();
  double v11 = [(MobileCalHourAccessibilityElement *)self dayGridView];
  double v12 = __UIAccessibilityCastAsSafeCategory();

  if ([v12 accessibilityIsPreviewGridView])
  {
    double v13 = [(MobileCalHourAccessibilityElement *)self dayGridView];
    double v14 = [v13 _accessibilityViewAncestorIsKindOf:objc_opt_class()];

    v31.receiver = self;
    v31.super_class = (Class)MobileCalHourAccessibilityElement;
    [(MobileCalHourAccessibilityElement *)&v31 accessibilityFrameForScrolling];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [v14 accessibilityFrame];
    v37.origin.CGFloat x = v23;
    v37.origin.CGFloat y = v24;
    v37.size.CGFloat width = v25;
    v37.size.CGFloat height = v26;
    v34.origin.CGFloat x = v16;
    v34.origin.CGFloat y = v18;
    v34.size.CGFloat width = v20;
    v34.size.CGFloat height = v22;
    CGRect v35 = CGRectIntersection(v34, v37);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat width = v35.size.width;
    CGFloat height = v35.size.height;
  }
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (id)accessibilityDropPointDescriptors
{
  v2 = self;
  double v3 = [(MobileCalHourAccessibilityElement *)self dayGridView];
  id v31 = 0;
  double v4 = [v3 _accessibilityDragAndDropTargetViewForDrop:1 eventGestureController:&v31];
  id v5 = v31;

  if (v4)
  {
    BOOL v6 = [(MobileCalHourAccessibilityElement *)v2 dayGridView];
    [(MobileCalHourAccessibilityElement *)v2 _frameInDayGridView];
    objc_msgSend(v6, "convertRect:toView:", v4);

    uint64_t v7 = *MEMORY[0x263F04C98];
    unint64_t v8 = 0x3CuLL / *MEMORY[0x263F04C98];
    double v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v8];
    if ((unint64_t)v7 <= 0x3C)
    {
      unint64_t v10 = 0;
      double v11 = (double)v7;
      if (v8 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v8;
      }
      uint64_t v29 = v12;
      do
      {
        double v13 = [(MobileCalHourAccessibilityElement *)v2 hourDate];
        double v14 = [v13 dateByAddingTimeInterval:v11 * (double)v10 * 60.0];

        [v5 touchOffset];
        CalRoundPointToScreenScale();
        double v16 = v15;
        double v18 = v17;
        id v19 = objc_alloc(MEMORY[0x263F1C3B8]);
        CGFloat v20 = v9;
        double v21 = v2;
        id v22 = v5;
        CGFloat v23 = NSString;
        CGFloat v24 = accessibilityLocalizedString(@"drop.event.time");
        CGFloat v25 = [v14 _accessibilityTimeString];
        CGFloat v26 = objc_msgSend(v23, "stringWithFormat:", v24, v25);
        double v27 = objc_msgSend(v19, "initWithName:point:inView:", v26, v4, v16, v18);

        id v5 = v22;
        v2 = v21;
        double v9 = v20;

        [v20 addObject:v27];
        ++v10;
      }
      while (v29 != v10);
    }
  }
  else
  {
    v30.receiver = v2;
    v30.super_class = (Class)MobileCalHourAccessibilityElement;
    double v9 = [(MobileCalHourAccessibilityElement *)&v30 accessibilityDropPointDescriptors];
  }

  return v9;
}

- (NSDate)hourDate
{
  return self->hourDate;
}

- (void)setHourDate:(id)a3
{
}

- (UIView)dayGridView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayGridView);

  return (UIView *)WeakRetained;
}

- (void)setDayGridView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dayGridView);

  objc_storeStrong((id *)&self->hourDate, 0);
}

@end