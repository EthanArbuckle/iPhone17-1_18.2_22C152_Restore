@interface PLUIAccessibilityMockSlider
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGRect)accessibilityFrame;
- (UIView)view;
- (id)mockSliderDelegate;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setMockSliderDelegate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PLUIAccessibilityMockSlider

- (void)setView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)v4 setAccessibilityContainer:0];
  view = self->_view;
  self->_view = v4;
  v6 = v4;

  v7 = self->_view;
  id v8 = [(PLUIAccessibilityMockSlider *)self accessibilityContainer];
  [(UIView *)v7 setAccessibilityContainer:v8];
}

- (CGRect)accessibilityFrame
{
  [(UIView *)self->_view accessibilityFrame];
  double x = v17.origin.x;
  CGFloat y = v17.origin.y;
  double width = v17.size.width;
  CGFloat height = v17.size.height;
  if (CGRectIsEmpty(v17))
  {
    v7 = [(PLUIAccessibilityMockSlider *)self accessibilityContainer];
    [v7 accessibilityFrame];
    double x = v8;
    CGFloat y = v9;
    double width = v10;
    CGFloat height = v11;
  }
  if (width >= 16.0) {
    double v12 = width;
  }
  else {
    double v12 = 16.0;
  }
  double v13 = 0.0;
  if (width < 16.0) {
    double v13 = (16.0 - width) * 0.5;
  }
  double v14 = x - v13;
  double v15 = y;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.double width = v12;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = *MEMORY[0x263F1CF18];
  uint64_t v4 = [(UIView *)self->_view accessibilityTraits];
  v9.receiver = self;
  v9.super_class = (Class)PLUIAccessibilityMockSlider;
  unint64_t v5 = [(PLUIAccessibilityMockSlider *)&v9 accessibilityTraits] | v4;
  uint64_t v6 = *MEMORY[0x263F1CF20];
  if ((*MEMORY[0x263F1CF20] & ~v5) != 0) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *MEMORY[0x263F1CF68];
  if ((*MEMORY[0x263F1CF68] & ~v5) != 0) {
    uint64_t v7 = 0;
  }
  return *MEMORY[0x263F1CED8] | v3 | v6 | v7;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 4)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v6 = objc_loadWeakRetained(&self->_mockSliderDelegate);
      [v6 _accessibilityIncrementMockSlider:self largeStep:1];
      goto LABEL_7;
    }
    return 1;
  }
  if (a3 == 3)
  {
    id v4 = objc_loadWeakRetained(&self->_mockSliderDelegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained(&self->_mockSliderDelegate);
      [v6 _accessibilityDecrementMockSlider:self largeStep:1];
LABEL_7:

      return 1;
    }
    return 1;
  }
  return 0;
}

- (void)accessibilityIncrement
{
  p_mockSliderDelegate = &self->_mockSliderDelegate;
  id WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(p_mockSliderDelegate);
    [v6 _accessibilityIncrementMockSlider:self largeStep:0];
  }
}

- (void)accessibilityDecrement
{
  p_mockSliderDelegate = &self->_mockSliderDelegate;
  id WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(p_mockSliderDelegate);
    [v6 _accessibilityDecrementMockSlider:self largeStep:0];
  }
}

- (UIView)view
{
  return self->_view;
}

- (id)mockSliderDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_mockSliderDelegate);

  return WeakRetained;
}

- (void)setMockSliderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mockSliderDelegate);

  objc_storeStrong((id *)&self->_view, 0);
}

@end