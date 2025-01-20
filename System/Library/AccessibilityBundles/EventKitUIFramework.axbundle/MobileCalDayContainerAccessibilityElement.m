@interface MobileCalDayContainerAccessibilityElement
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSDate)date;
- (NSMutableArray)children;
- (UIView)dayGrid;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (int64_t)indexInArray;
- (void)dealloc;
- (void)setChildren:(id)a3;
- (void)setDate:(id)a3;
- (void)setDayGrid:(id)a3;
- (void)setIndexInArray:(int64_t)a3;
@end

@implementation MobileCalDayContainerAccessibilityElement

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MobileCalDayContainerAccessibilityElement *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MobileCalDayContainerAccessibilityElement;
  [(MobileCalDayContainerAccessibilityElement *)&v8 dealloc];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(MobileCalDayContainerAccessibilityElement *)self dayGrid];
  uint64_t v4 = __UIAccessibilityCastAsSafeCategory();

  LODWORD(v3) = [v4 accessibilityIsPreviewGridView];
  if (v3)
  {
    uint64_t v5 = accessibilityLocalizedString(@"event.preview.area");
  }
  else
  {
    uint64_t v6 = [(MobileCalDayContainerAccessibilityElement *)self date];
    uint64_t v5 = _AXGetYearlessStringForDay();
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  v3 = [(MobileCalDayContainerAccessibilityElement *)self dayGrid];
  [v3 bounds];
  uint64_t v4 = [v3 superview];
  uint64_t v5 = [v4 safeValueForKey:@"_dayStarts"];
  [v5 count];

  [(MobileCalDayContainerAccessibilityElement *)self indexInArray];
  UIAccessibilityFrameForBounds();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [(MobileCalDayContainerAccessibilityElement *)self _accessibilityParentView];
  UIAccessibilityPointForPoint();
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v13 = [(MobileCalDayContainerAccessibilityElement *)self children];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v19 accessibilityFrame];
        v32.double x = v10;
        v32.double y = v12;
        if (CGRectContainsPoint(v33, v32))
        {
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_20;
            }
          }
          if ([v19 isAccessibilityElement])
          {
            v20 = [v19 _accessibilitySupplementaryHeaderViews];
            uint64_t v21 = -[MobileCalDayContainerAccessibilityElement _accessibilityHitTestSupplementaryViews:point:withEvent:](self, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v20, v7, x, y);

            id v16 = (id)v21;
            if (!v21)
            {
              v22 = [v19 _accessibilitySupplementaryFooterViews];
              -[MobileCalDayContainerAccessibilityElement _accessibilityHitTestSupplementaryViews:point:withEvent:](self, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v22, v7, x, y);
              id v16 = (id)objc_claimAutoreleasedReturnValue();

              if (!v16) {
                id v16 = v19;
              }
            }
          }
          else
          {
            uint64_t v23 = objc_msgSend(v19, "_accessibilityHitTest:withEvent:", v7, x, y);

            id v16 = (id)v23;
          }
        }
        else if (v16)
        {
          goto LABEL_20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }
LABEL_20:

  return v16;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)indexInArray
{
  return self->_indexInArray;
}

- (void)setIndexInArray:(int64_t)a3
{
  self->_indexInArradouble y = a3;
}

- (UIView)dayGrid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayGrid);

  return (UIView *)WeakRetained;
}

- (void)setDayGrid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dayGrid);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end