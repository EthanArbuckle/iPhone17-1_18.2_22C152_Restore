@interface UIAccessibilityElementMockSlider
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGPoint)_accessibilityMaxScrubberPosition;
- (CGPoint)_accessibilityMinScrubberPosition;
- (CGRect)accessibilityFrame;
- (id)setDelegate:(id *)result;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setView:(id *)a1;
@end

@implementation UIAccessibilityElementMockSlider

- (void)setView:(id *)a1
{
  v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    [location setAccessibilityContainer:0];
    objc_storeStrong(v5 + 7, location);
    id v2 = v5[7];
    id v3 = (id)[v5 accessibilityContainer];
    objc_msgSend(v2, "setAccessibilityContainer:");
  }
  objc_storeStrong(&location, 0);
}

- (CGRect)accessibilityFrame
{
  [(UIView *)self->_view accessibilityFrame];
  *(CGFloat *)&long long v14 = v16.origin.x;
  *((void *)&v14 + 1) = *(void *)&v16.origin.y;
  *(CGFloat *)&long long v15 = v16.size.width;
  *((void *)&v15 + 1) = *(void *)&v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    id v10 = (id)[(UIAccessibilityElementMockSlider *)self accessibilityContainer];
    [v10 accessibilityFrame];
    *(void *)&long long v11 = v2;
    *((void *)&v11 + 1) = v3;
    *(void *)&long long v12 = v4;
    *((void *)&v12 + 1) = v5;
    long long v14 = v11;
    long long v15 = v12;
  }
  double v7 = *((double *)&v14 + 1);
  double v6 = *(double *)&v14;
  double v9 = *((double *)&v15 + 1);
  double v8 = *(double *)&v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  double v8 = self;
  SEL v7 = a2;
  uint64_t v6 = 0;
  uint64_t v6 = *MEMORY[0x263F1CF18];
  unint64_t v5 = 0;
  uint64_t v3 = [(UIView *)self->_view accessibilityTraits];
  v4.receiver = v8;
  v4.super_class = (Class)UIAccessibilityElementMockSlider;
  unint64_t v5 = v3 | [(UIAccessibilityElementMockSlider *)&v4 accessibilityTraits];
  if ((v5 & *MEMORY[0x263F1CF20]) == *MEMORY[0x263F1CF20]) {
    v6 |= *MEMORY[0x263F1CF20];
  }
  return v6 | *MEMORY[0x263F1CED8];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v7 = objc_loadWeakRetained(&self->_delegate);
      [v7 _accessibilityDecrementMockSlider:self largeStep:1];
    }
    return 1;
  }
  else if (a3 == 4)
  {
    id v5 = objc_loadWeakRetained(&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v4 = objc_loadWeakRetained(&self->_delegate);
      [v4 _accessibilityIncrementMockSlider:self largeStep:1];
    }
    return 1;
  }
  else
  {
    return 0;
  }
}

- (void)accessibilityIncrement
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v2 = objc_loadWeakRetained(&self->_delegate);
    [v2 _accessibilityIncrementMockSlider:self largeStep:0];
  }
}

- (void)accessibilityDecrement
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v2 = objc_loadWeakRetained(&self->_delegate);
    [v2 _accessibilityDecrementMockSlider:self largeStep:0];
  }
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained _accessibilityMinScrubberPosition];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained _accessibilityMaxScrubberPosition];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 8, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end