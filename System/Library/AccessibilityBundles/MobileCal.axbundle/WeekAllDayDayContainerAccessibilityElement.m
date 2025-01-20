@interface WeekAllDayDayContainerAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSDate)date;
- (NSMutableArray)children;
- (UIView)allDayView;
- (WeekAllDayDayContainerAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)dayIndex;
- (void)dealloc;
- (void)setAllDayView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDayIndex:(unint64_t)a3;
@end

@implementation WeekAllDayDayContainerAccessibilityElement

- (WeekAllDayDayContainerAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WeekAllDayDayContainerAccessibilityElement;
  v3 = [(WeekAllDayDayContainerAccessibilityElement *)&v7 initWithAccessibilityContainer:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    children = v3->_children;
    v3->_children = v4;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(WeekAllDayDayContainerAccessibilityElement *)self children];
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
  v8.super_class = (Class)WeekAllDayDayContainerAccessibilityElement;
  [(WeekAllDayDayContainerAccessibilityElement *)&v8 dealloc];
}

- (int64_t)accessibilityContainerType
{
  v3 = [(WeekAllDayDayContainerAccessibilityElement *)self children];
  if ([v3 count] == 1)
  {
    uint64_t v4 = [(WeekAllDayDayContainerAccessibilityElement *)self children];
    uint64_t v5 = [v4 firstObject];
    NSClassFromString(&cfstr_Weekalldaylabe.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      return 0;
    }
    else {
      return 4;
    }
  }
  else
  {

    return 4;
  }
}

- (id)accessibilityLabel
{
  v2 = [(WeekAllDayDayContainerAccessibilityElement *)self date];
  v3 = _AXGetStringsForDate(v2);

  return v3;
}

- (CGRect)accessibilityFrame
{
  v3 = [(WeekAllDayDayContainerAccessibilityElement *)self allDayView];
  [v3 bounds];
  uint64_t v4 = [v3 safeValueForKey:@"_dayStarts"];
  [v4 count];

  [(WeekAllDayDayContainerAccessibilityElement *)self dayIndex];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)dayIndex
{
  return self->_dayIndex;
}

- (void)setDayIndex:(unint64_t)a3
{
  self->_dayIndex = a3;
}

- (UIView)allDayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allDayView);

  return (UIView *)WeakRetained;
}

- (void)setAllDayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allDayView);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end