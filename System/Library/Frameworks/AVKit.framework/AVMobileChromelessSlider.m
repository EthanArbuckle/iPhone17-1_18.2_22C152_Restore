@interface AVMobileChromelessSlider
- (AVMobileChromelessSlider)init;
- (AVMobileChromelessSliderDelegate)delegate;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)frameForSliderMark:(id)a3;
- (CGRect)hitRect;
- (CGSize)intrinsicContentSize;
- (NSArray)sliderMarks;
- (double)barHeight;
- (float)maximumValue;
- (float)minimumValue;
- (float)totalValue;
- (float)value;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)tintState;
- (void)_frameForSliderMark:(void *)a1;
- (void)_updateAccessibilityValue;
- (void)_updateBarTintStateAlpha;
- (void)_updateBarViewFrames;
- (void)_updateSliderBarMaterials;
- (void)_updateSliderMarkViewColors;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didMoveToWindow;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)interruptActiveInteractions;
- (void)layoutSubviews;
- (void)setBarHeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaximumValue:(float)a3;
- (void)setMinimumValue:(float)a3;
- (void)setSliderMarks:(id)a3;
- (void)setTintState:(unint64_t)a3;
- (void)setTotalValue:(float)a3;
- (void)setValue:(float)maximumValue;
@end

@implementation AVMobileChromelessSlider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sliderMarks, 0);
  objc_storeStrong((id *)&self->_sliderPointerInteraction, 0);
  objc_storeStrong((id *)&self->_disabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_disabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarkViews, 0);
  objc_storeStrong((id *)&self->_unfilledBarView, 0);
  objc_storeStrong((id *)&self->_filledBarView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessSliderDelegate *)WeakRetained;
}

- (float)value
{
  return self->_value;
}

- (float)totalValue
{
  return self->_totalValue;
}

- (unint64_t)tintState
{
  return self->_tintState;
}

- (NSArray)sliderMarks
{
  return self->_sliderMarks;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (double)barHeight
{
  return self->_barHeight;
}

- (void)interruptActiveInteractions
{
}

- (void)_updateAccessibilityValue
{
  *(float *)&double v2 = (float)(self->_value - self->_minimumValue) / (float)(self->_maximumValue - self->_minimumValue);
  v4 = (void *)MEMORY[0x1E4F28EE0];
  v5 = [NSNumber numberWithFloat:v2];
  id v6 = [v4 localizedStringFromNumber:v5 numberStyle:3];

  [(AVMobileChromelessSlider *)self setAccessibilityValue:v6];
}

- (void)accessibilityDecrement
{
  [(AVMobileChromelessSlider *)self value];
  float v4 = v3;
  float v5 = self->_maximumValue - self->_minimumValue;
  [(AVMobileChromelessSlider *)self value];
  float v7 = v6 + v5 * -0.05;
  if (v4 != v7)
  {
    -[AVMobileChromelessSlider setValue:](self, "setValue:");
    [(AVMobileChromelessSlider *)self sendActionsForControlEvents:4096];
  }
}

- (void)accessibilityIncrement
{
  [(AVMobileChromelessSlider *)self value];
  float v4 = v3;
  float v5 = self->_maximumValue - self->_minimumValue;
  [(AVMobileChromelessSlider *)self value];
  float v7 = v6 + v5 * 0.05;
  if (v4 != v7)
  {
    -[AVMobileChromelessSlider setValue:](self, "setValue:");
    [(AVMobileChromelessSlider *)self sendActionsForControlEvents:4096];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVMobileChromelessSlider *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessSlider;
    [(AVMobileChromelessSlider *)&v5 setEnabled:v3];
    -[AVMobileChromelessSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.isa);
  }
}

- (void)_updateSliderBarMaterials
{
  if (a1)
  {
    id v6 = a1[64];
    id v2 = a1[65];
    if ([a1 isEnabled])
    {
      id v3 = a1[62];

      id v4 = a1[63];
      id v5 = v3;
      id v2 = v4;
    }
    else
    {
      id v5 = v6;
    }
    id v7 = v5;
    [a1[58] setEffect:v5];
    [a1[59] setEffect:v2];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessSlider;
  [(AVMobileChromelessSlider *)&v7 cancelTrackingWithEvent:a3];
  id v4 = [(AVMobileChromelessSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessSlider *)self delegate];
    [v6 sliderDidEndTracking:self];
  }
  if (self) {
    [(UIPointerInteraction *)self->_sliderPointerInteraction invalidate];
  }
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 locationInView:self];
  double v9 = v8;
  [(AVMobileChromelessSlider *)self bounds];
  float v11 = v9 / fmax(v10, 1.0);
  float v12 = v11 - self->_trackingTouchStartNormalizedX;
  uint64_t v13 = [(AVMobileChromelessSlider *)self effectiveUserInterfaceLayoutDirection];
  *(float *)&double v14 = -v12;
  if (v13 != 1) {
    *(float *)&double v14 = v12;
  }
  *(float *)&double v14 = self->_minimumValue
                 + (float)((float)(self->_trackingStartNormalizedValue + *(float *)&v14)
                         * (float)(self->_maximumValue - self->_minimumValue));
  [(AVMobileChromelessSlider *)self setValue:v14];
  [(AVMobileChromelessSlider *)self sendActionsForControlEvents:4096];
  v15 = [(AVMobileChromelessSlider *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(AVMobileChromelessSlider *)self delegate];
    [v17 sliderWillEndTracking:self];
  }
  [(UIPointerInteraction *)self->_sliderPointerInteraction invalidate];
  v18.receiver = self;
  v18.super_class = (Class)AVMobileChromelessSlider;
  [(AVMobileChromelessSlider *)&v18 endTrackingWithTouch:v7 withEvent:v6];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 locationInView:self];
  double v9 = v8;
  [(AVMobileChromelessSlider *)self bounds];
  float v11 = v9 / fmax(v10, 1.0);
  float v12 = v11 - self->_trackingTouchStartNormalizedX;
  uint64_t v13 = [(AVMobileChromelessSlider *)self effectiveUserInterfaceLayoutDirection];
  *(float *)&double v14 = -v12;
  if (v13 != 1) {
    *(float *)&double v14 = v12;
  }
  *(float *)&double v14 = self->_minimumValue
                 + (float)((float)(self->_trackingStartNormalizedValue + *(float *)&v14)
                         * (float)(self->_maximumValue - self->_minimumValue));
  [(AVMobileChromelessSlider *)self setValue:v14];
  [(AVMobileChromelessSlider *)self sendActionsForControlEvents:4096];
  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessSlider;
  BOOL v15 = [(AVMobileChromelessSlider *)&v17 continueTrackingWithTouch:v7 withEvent:v6];

  return v15;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(AVMobileChromelessSlider *)self bounds];
  double v7 = fmax(v6, 1.0);
  [v5 locationInView:self];
  double v9 = v8;

  float v10 = v9 / v7;
  self->_trackingTouchStartNormalizedX = v10;
  self->_trackingStartNormalizedValue = (float)(self->_value - self->_minimumValue)
                                      / (float)(self->_maximumValue - self->_minimumValue);
  float v11 = [(AVMobileChromelessSlider *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(AVMobileChromelessSlider *)self delegate];
    [v13 sliderDidBeginTracking:self];
  }
  [(UIPointerInteraction *)self->_sliderPointerInteraction invalidate];
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(UIView *)self->_contentView frame];
  id v5 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [v5 view];

  double v8 = (void *)[v6 initWithView:v7];
  double v9 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v8];
  float v10 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVMobileChromelessSlider *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)AVMobileChromelessSlider;
  [(AVMobileChromelessSlider *)&v25 layoutSubviews];
  uint64_t v3 = [(AVMobileChromelessSlider *)self effectiveUserInterfaceLayoutDirection];
  contentView = self->_contentView;
  [(AVMobileChromelessSlider *)self bounds];
  -[UIView avkit_setFrame:inLayoutDirection:](contentView, "avkit_setFrame:inLayoutDirection:", v3);
  -[AVMobileChromelessSlider _updateBarViewFrames](self);
  id v5 = [(UIView *)self->_contentView layer];
  [v5 setCornerRadius:self->_barHeight * 0.5];

  if ([(NSArray *)self->_sliderMarks count])
  {
    NSUInteger v6 = [(NSArray *)self->_sliderMarks count];
    if (v6 != [(NSMutableArray *)self->_sliderMarkViews count])
    {
      double v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", buf, 2u);
      }
    }
    NSUInteger v8 = [(NSArray *)self->_sliderMarks count];
    unint64_t v9 = [(NSMutableArray *)self->_sliderMarkViews count];
    if (v8 >= v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        char v12 = [(NSArray *)self->_sliderMarks objectAtIndex:i];
        uint64_t v13 = [(NSMutableArray *)self->_sliderMarkViews objectAtIndex:i];
        -[AVMobileChromelessSlider _frameForSliderMark:](self, v12);
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        objc_msgSend(v13, "setFrame:");
        v22 = [(AVMobileChromelessSlider *)self delegate];
        char v23 = objc_opt_respondsToSelector();

        if (v23)
        {
          v24 = [(AVMobileChromelessSlider *)self delegate];
          objc_msgSend(v24, "slider:didUpdateFrame:forSliderMark:", self, v12, v15, v17, v19, v21);
        }
      }
    }
  }
}

- (void)_updateBarViewFrames
{
  if (result)
  {
    v1 = result;
    [result bounds];
    double v3 = v2
       * (float)((float)(*((float *)v1 + 137) - *((float *)v1 + 134))
               / (float)(*((float *)v1 + 135) - *((float *)v1 + 134)));
    double v4 = v2 - v3;
    double v5 = *((double *)v1 + 69);
    double v7 = (v6 - v5) * 0.5;
    double v8 = 5.0 - v3;
    if (5.0 - v3 < 0.0) {
      double v8 = 0.0;
    }
    double v9 = 5.0 - v4;
    if (5.0 - v4 < 0.0) {
      double v9 = 0.0;
    }
    double v10 = -v8;
    double v11 = v3 + v8;
    double v12 = v4 + v9;
    uint64_t v13 = [v1 effectiveUserInterfaceLayoutDirection];
    objc_msgSend(*((id *)v1 + 58), "avkit_setFrame:inLayoutDirection:", v13, v10, v7, v11, v5);
    double v14 = (void *)*((void *)v1 + 59);
    return objc_msgSend(v14, "avkit_setFrame:inLayoutDirection:", v13, v3, v7, v12, v5);
  }
  return result;
}

- (void)_frameForSliderMark:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    [a1 bounds];
    id v4 = v3;
    [a1 bounds];
    uint64_t v5 = [v4 markType];
    if (v5 == 2 || !v5)
    {
      [v4 endValue];
      [v4 startValue];
    }

    [v4 startValue];
    [v4 markType];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double barHeight = self->_barHeight;
  result.height = barHeight;
  result.width = v2;
  return result;
}

- (CGRect)hitRect
{
  v10.receiver = self;
  v10.super_class = (Class)AVMobileChromelessSlider;
  [(AVMobileChromelessSlider *)&v10 hitRect];
  double v3 = v2 + -20.0;
  double v5 = v4 + -20.0;
  double v7 = v6 + 40.0;
  double v9 = v8 + 40.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessSlider;
  [(AVMobileChromelessSlider *)&v3 didMoveToWindow];
  [(AVMobileChromelessSlider *)self _updateBarTintStateAlpha];
  -[AVMobileChromelessSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.isa);
  -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
}

- (void)_updateSliderMarkViewColors
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 560) count];
    if (v2 != [*(id *)(a1 + 488) count])
    {
      objc_super v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v17 = 0;
        _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", v17, 2u);
      }
    }
    unint64_t v4 = [*(id *)(a1 + 560) count];
    unint64_t v5 = [*(id *)(a1 + 488) count];
    if (v4 >= v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = v4;
    }
    if (v6 >= 1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        double v8 = [*(id *)(a1 + 560) objectAtIndex:i];
        double v9 = [*(id *)(a1 + 488) objectAtIndex:i];
        objc_super v10 = [v8 unfilledColor];
        float v11 = *(float *)(a1 + 548);
        [v8 startValue];
        if (v11 >= v12)
        {
          uint64_t v13 = [v8 filledColor];

          objc_super v10 = (void *)v13;
        }
        id v14 = v10;
        self;
        self;
        double v18 = 0.0;
        [v14 getRed:0 green:0 blue:0 alpha:&v18];
        double v15 = [v14 colorWithAlphaComponent:v18];

        double v16 = [v9 backgroundColor];

        if (v16 != v15) {
          [v9 setMarkColor:v15];
        }
      }
    }
  }
}

- (CGRect)frameForSliderMark:(id)a3
{
  -[AVMobileChromelessSlider _frameForSliderMark:](self, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)setValue:(float)maximumValue
{
  if (maximumValue >= self->_maximumValue) {
    maximumValue = self->_maximumValue;
  }
  if (self->_minimumValue >= maximumValue) {
    maximumValue = self->_minimumValue;
  }
  if (self->_value != maximumValue)
  {
    self->_value = maximumValue;
    -[AVMobileChromelessSlider _updateBarViewFrames](self);
    -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
    [(AVMobileChromelessSlider *)self _updateAccessibilityValue];
  }
}

- (void)_updateBarTintStateAlpha
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AVMobileChromelessSlider *)self tintState];
  self;
  if (v3 >= 3)
  {
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      unint64_t v8 = v3;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Error: Unrecognized slider tint state %ld", (uint8_t *)&v7, 0xCu);
    }

    double v4 = 1.0;
  }
  else
  {
    double v4 = dbl_1B07213C0[v3];
  }
  [(UIVisualEffectView *)self->_filledBarView setAlpha:v4];
  unfilledBarView = self->_unfilledBarView;

  [(UIVisualEffectView *)unfilledBarView setAlpha:v4];
}

- (void)setTotalValue:(float)a3
{
  if (vabds_f32(self->_totalValue, a3) >= 0.00000011921)
  {
    self->_totalValue = a3;
    [(AVMobileChromelessSlider *)self setNeedsLayout];
  }
}

- (void)setTintState:(unint64_t)a3
{
  if (self->_tintState != a3)
  {
    self->_tintState = a3;
    [(AVMobileChromelessSlider *)self _updateBarTintStateAlpha];
  }
}

- (void)setSliderMarks:(id)a3
{
  double v5 = (NSArray *)a3;
  p_sliderMarks = &self->_sliderMarks;
  if (self->_sliderMarks != v5)
  {
    objc_super v25 = v5;
    objc_storeStrong((id *)&self->_sliderMarks, a3);
    uint64_t v7 = [(NSMutableArray *)self->_sliderMarkViews count];
    if (v7 != [(NSArray *)*p_sliderMarks count])
    {
      uint64_t v8 = *MEMORY[0x1E4F39EA8];
      do
      {
        unint64_t v9 = [(NSMutableArray *)self->_sliderMarkViews count];
        unint64_t v10 = [(NSArray *)*p_sliderMarks count];
        sliderMarkViews = self->_sliderMarkViews;
        if (v9 <= v10)
        {
          unint64_t v13 = [(NSMutableArray *)sliderMarkViews count];
          if (v13 >= [(NSArray *)*p_sliderMarks count]) {
            break;
          }
          float v12 = objc_alloc_init(AVMobileSliderMarkView);
          id v14 = [(NSArray *)*p_sliderMarks objectAtIndex:[(NSMutableArray *)self->_sliderMarkViews count]];
          uint64_t v15 = [v14 markType];

          double v16 = self->_barHeight + -1.0;
          if (v16 >= 1.0) {
            double v17 = v16 * 0.5;
          }
          else {
            double v17 = 0.5;
          }
          if (v15 == 1) {
            double v18 = 1.75;
          }
          else {
            double v18 = v17;
          }
          -[AVMobileSliderMarkView setAutoresizingMask:](v12, "setAutoresizingMask:", 0, v17);
          [(AVMobileSliderMarkView *)v12 setUserInteractionEnabled:0];
          double v19 = [(AVMobileSliderMarkView *)v12 layer];
          [v19 setMasksToBounds:1];

          double v20 = [(AVMobileSliderMarkView *)v12 layer];
          [v20 setCornerRadius:v18];

          double v21 = [(AVMobileSliderMarkView *)v12 layer];
          [v21 setCornerCurve:v8];

          v22 = [(NSArray *)*p_sliderMarks objectAtIndexedSubscript:[(NSMutableArray *)self->_sliderMarkViews count]];
          uint64_t v23 = [v22 markType];

          if (v23 == 2) {
            [(UIView *)self->_contentView insertSubview:v12 belowSubview:self->_filledBarView];
          }
          else {
            [(AVMobileChromelessSlider *)self addSubview:v12];
          }
          [(NSMutableArray *)self->_sliderMarkViews addObject:v12];
        }
        else
        {
          float v12 = [(NSMutableArray *)sliderMarkViews lastObject];
          [(AVMobileSliderMarkView *)v12 removeFromSuperview];
          [(NSMutableArray *)self->_sliderMarkViews removeLastObject];
        }

        uint64_t v24 = [(NSMutableArray *)self->_sliderMarkViews count];
      }
      while (v24 != [(NSArray *)*p_sliderMarks count]);
    }
    -[AVMobileChromelessSlider _updateSliderMarkViewColors]((uint64_t)self);
    [(AVMobileChromelessSlider *)self setNeedsLayout];
    double v5 = v25;
  }
}

- (void)setMaximumValue:(float)a3
{
  if (self->_maximumValue != a3 && self->_minimumValue < a3)
  {
    self->_maximumValue = a3;
    if (self->_value > a3) {
      -[AVMobileChromelessSlider setValue:](self, "setValue:");
    }
  }
}

- (void)setMinimumValue:(float)a3
{
  if (self->_minimumValue != a3 && self->_maximumValue > a3)
  {
    self->_minimumValue = a3;
    if (self->_value > a3) {
      -[AVMobileChromelessSlider setValue:](self, "setValue:");
    }
  }
}

- (void)setBarHeight:(double)a3
{
  if (self->_barHeight != a3)
  {
    self->_double barHeight = a3;
    [(AVMobileChromelessSlider *)self invalidateIntrinsicContentSize];
    double v4 = [(AVMobileChromelessSlider *)self superview];
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    [(AVMobileChromelessSlider *)self setNeedsLayout];
    sliderPointerInteraction = self->_sliderPointerInteraction;
    [(UIPointerInteraction *)sliderPointerInteraction invalidate];
  }
}

- (AVMobileChromelessSlider)init
{
  v23.receiver = self;
  v23.super_class = (Class)AVMobileChromelessSlider;
  uint64_t v2 = -[AVMobileChromelessSlider initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:14];
    enabledFilledBarViewEffect = v2->_enabledFilledBarViewEffect;
    v2->_enabledFilledBarViewEffect = (UIVisualEffect *)v3;

    uint64_t v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
    enabledUnfilledBarViewEffect = v2->_enabledUnfilledBarViewEffect;
    v2->_enabledUnfilledBarViewEffect = (UIVisualEffect *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
    disabledFilledBarViewEffect = v2->_disabledFilledBarViewEffect;
    v2->_disabledFilledBarViewEffect = (UIVisualEffect *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
    disabledUnfilledBarViewEffect = v2->_disabledUnfilledBarViewEffect;
    v2->_disabledUnfilledBarViewEffect = (UIVisualEffect *)v9;

    float v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v2->_contentView;
    v2->_contentView = v11;

    [(UIView *)v2->_contentView setAutoresizingMask:0];
    [(UIView *)v2->_contentView setUserInteractionEnabled:0];
    [(UIView *)v2->_contentView setClipsToBounds:1];
    [(AVMobileChromelessSlider *)v2 addSubview:v2->_contentView];
    unint64_t v13 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    filledBarView = v2->_filledBarView;
    v2->_filledBarView = v13;

    [(UIVisualEffectView *)v2->_filledBarView setAutoresizingMask:0];
    [(UIVisualEffectView *)v2->_filledBarView setUserInteractionEnabled:0];
    [(UIView *)v2->_contentView addSubview:v2->_filledBarView];
    uint64_t v15 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    unfilledBarView = v2->_unfilledBarView;
    v2->_unfilledBarView = v15;

    [(UIVisualEffectView *)v2->_unfilledBarView setAutoresizingMask:0];
    [(UIVisualEffectView *)v2->_unfilledBarView setUserInteractionEnabled:0];
    [(UIView *)v2->_contentView insertSubview:v2->_unfilledBarView belowSubview:v2->_filledBarView];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v2];
    sliderPointerInteraction = v2->_sliderPointerInteraction;
    v2->_sliderPointerInteraction = (UIPointerInteraction *)v17;

    [(AVMobileChromelessSlider *)v2 addInteraction:v2->_sliderPointerInteraction];
    v2->_double barHeight = 10.0;
    v2->_value = 0.0;
    v2->_minimumValue = 0.0;
    v2->_maximumValue = 1.0;
    v2->_totalValue = 1.0;
    sliderMarks = v2->_sliderMarks;
    v2->_sliderMarks = (NSArray *)MEMORY[0x1E4F1CBF0];

    double v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sliderMarkViews = v2->_sliderMarkViews;
    v2->_sliderMarkViews = v20;

    v2->_tintState = 1;
    [(AVMobileChromelessSlider *)v2 setIsAccessibilityElement:1];
    [(AVMobileChromelessSlider *)v2 setAccessibilityTraits:*MEMORY[0x1E4FB2530]];
    [(AVMobileChromelessSlider *)v2 _updateAccessibilityValue];
  }
  return v2;
}

@end