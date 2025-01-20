@interface HUIStepSlider
- (BOOL)drawsEndTicks;
- (BOOL)restrictsValuesToTicks;
- (BOOL)supportsVibrancy;
- (HUIStepSlider)initWithFrame:(CGRect)a3;
- (NSMutableArray)ticks;
- (UIColor)tickColor;
- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3;
- (unint64_t)numberOfTicks;
- (unint64_t)segmentCount;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setDrawsEndTicks:(BOOL)a3;
- (void)setRestrictsValuesToTicks:(BOOL)a3;
- (void)setSegmentCount:(unint64_t)a3;
- (void)setSupportsVibrancy:(BOOL)a3;
- (void)setTickColor:(id)a3;
- (void)setTicks:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)sliderTapped:(id)a3;
@end

@implementation HUIStepSlider

- (HUIStepSlider)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUIStepSlider;
  v3 = -[HUIStepSlider initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemLightGrayColor];
    [(HUIStepSlider *)v3 setTickColor:v4];

    [(HUIStepSlider *)v3 setRestrictsValuesToTicks:1];
    [(HUIStepSlider *)v3 setSupportsVibrancy:0];
    [(HUIStepSlider *)v3 setDrawsEndTicks:1];
    v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel_sliderTapped_];
    [(HUIStepSlider *)v3 addGestureRecognizer:v5];
  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(HUIStepSlider *)self bounds];
  -[HUIStepSlider trackRectForBounds:](self, "trackRectForBounds:");
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v10 = v5 - CGRectGetMinX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v11 = v10 / CGRectGetWidth(v21);
  if (v11 > 1.0) {
    double v11 = 1.0;
  }
  double v12 = fmax(v11, 0.0);
  [(HUIStepSlider *)self maximumValue];
  float v14 = v13;
  [(HUIStepSlider *)self minimumValue];
  double v16 = (float)(v14 - v15);
  [(HUIStepSlider *)self minimumValue];
  double v18 = v17 + v12 * v16;
  *(float *)&double v18 = v18;
  [(HUIStepSlider *)self setValue:1 animated:v18];
  [(HUIStepSlider *)self sendActionsForControlEvents:4096];
}

- (unint64_t)numberOfTicks
{
  unint64_t segmentCount = self->_segmentCount;
  if (segmentCount)
  {
    return (unint64_t)(float)(segmentCount + 1);
  }
  else
  {
    [(HUIStepSlider *)self maximumValue];
    float v6 = v5;
    [(HUIStepSlider *)self minimumValue];
    return (unint64_t)(float)((float)(v6 - v7) + 1.0);
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  [(HUIStepSlider *)self maximumValue];
  float v6 = v5;
  [(HUIStepSlider *)self minimumValue];
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(HUIStepSlider *)self restrictsValuesToTicks])
  {
    if (self->_segmentCount >= 2)
    {
      [(HUIStepSlider *)self maximumValue];
      if (v7 != a3)
      {
        [(HUIStepSlider *)self offsetBetweenTicksForNumberOfTicks:[(HUIStepSlider *)self numberOfTicks]];
        float v9 = v8;
        [(HUIStepSlider *)self minimumValue];
        float v11 = roundf((float)(a3 - v10) / v9);
        [(HUIStepSlider *)self minimumValue];
        a3 = v12 + (float)(v9 * (float)(int)v11);
      }
    }
  }
  [(HUIStepSlider *)self value];
  if (a3 != *(float *)&v13)
  {
    v14.receiver = self;
    v14.super_class = (Class)HUIStepSlider;
    *(float *)&double v13 = a3;
    [(HUIStepSlider *)&v14 setValue:v4 animated:v13];
  }
}

- (void)setRestrictsValuesToTicks:(BOOL)a3
{
  if (self->_restrictsValuesToTicks != a3)
  {
    self->_restrictsValuesToTicks = a3;
    if (!a3)
    {
      id v4 = [MEMORY[0x263F825C8] systemLightGrayColor];
      [(HUIStepSlider *)self setMinimumTrackTintColor:v4];
      [(HUIStepSlider *)self setMaximumTrackTintColor:v4];
    }
  }
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)HUIStepSlider;
  [(HUIStepSlider *)&v30 layoutSubviews];
  [(HUIStepSlider *)self bounds];
  -[HUIStepSlider trackRectForBounds:](self, "trackRectForBounds:");
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = [(HUIStepSlider *)self numberOfTicks];
  [(HUIStepSlider *)self offsetBetweenTicksForNumberOfTicks:v11];
  int v13 = v12;
  [(HUIStepSlider *)self bounds];
  double v15 = v14 * 0.5;
  double v16 = [(HUIStepSlider *)self ticks];
  uint64_t v17 = [v16 count];

  if (v17 != v11)
  {
    double v18 = [(HUIStepSlider *)self ticks];
    [v18 enumerateObjectsUsingBlock:&__block_literal_global];

    for (i = [MEMORY[0x263EFF980] array];
    {
      id v20 = objc_alloc_init(MEMORY[0x263F15880]);
      id v21 = [(HUIStepSlider *)self tickColor];
      objc_msgSend(v20, "setFillColor:", objc_msgSend(v21, "CGColor"));

      v22 = [(HUIStepSlider *)self layer];
      [v22 insertSublayer:v20 atIndex:0];

      [i addObject:v20];
    }
    [(HUIStepSlider *)self setTicks:i];
  }
  v23 = [(HUIStepSlider *)self ticks];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __31__HUIStepSlider_layoutSubviews__block_invoke_2;
  v28[3] = &unk_2647CD200;
  v28[4] = self;
  int v29 = v13;
  v28[5] = v4;
  v28[6] = v6;
  v28[7] = v8;
  v28[8] = v10;
  *(double *)&v28[9] = v15;
  [v23 enumerateObjectsUsingBlock:v28];

  v24 = [(HUIStepSlider *)self ticks];
  v25 = [v24 firstObject];
  objc_msgSend(v25, "setHidden:", -[HUIStepSlider drawsEndTicks](self, "drawsEndTicks") ^ 1);

  v26 = [(HUIStepSlider *)self ticks];
  v27 = [v26 lastObject];
  objc_msgSend(v27, "setHidden:", -[HUIStepSlider drawsEndTicks](self, "drawsEndTicks") ^ 1);

  if ([(HUIStepSlider *)self supportsVibrancy]) {
    [(HUIStepSlider *)self _setOverrideVibrancyTrait:1];
  }
}

uint64_t __31__HUIStepSlider_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

void __31__HUIStepSlider_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 minimumValue];
  float v8 = v7 + (float)((float)a3 * *(float *)(a1 + 80));
  [*(id *)(a1 + 32) minimumValue];
  float v10 = v8 - v9;
  [*(id *)(a1 + 32) maximumValue];
  float v12 = v11;
  [*(id *)(a1 + 32) minimumValue];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", AXHARoundToPixel(*(double *)(a1 + 40) + (float)(v10 / (float)(v12 - v13)) * *(double *)(a1 + 56) + -0.5), *(double *)(a1 + 72) + -7.0, 2.0, 15.0, 10.0);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", objc_msgSend(v14, "CGPath"));
}

- (void)accessibilityIncrement
{
  if (self->_restrictsValuesToTicks && (unint64_t segmentCount = self->_segmentCount, segmentCount >= 2))
  {
    double v4 = (double)segmentCount;
    [(HUIStepSlider *)self value];
    double v6 = (double)((int)(v4 * v5) + 1) / v4;
    *(float *)&double v6 = v6;
    [(HUIStepSlider *)self setValue:1 animated:v6];
    [(HUIStepSlider *)self sendActionsForControlEvents:4096];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUIStepSlider;
    [(HUIStepSlider *)&v7 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  if (self->_restrictsValuesToTicks && (unint64_t segmentCount = self->_segmentCount, segmentCount >= 2))
  {
    double v4 = (double)segmentCount;
    [(HUIStepSlider *)self value];
    double v6 = (double)((int)(v4 * v5) - 1) / v4;
    *(float *)&double v6 = v6;
    [(HUIStepSlider *)self setValue:1 animated:v6];
    [(HUIStepSlider *)self sendActionsForControlEvents:4096];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUIStepSlider;
    [(HUIStepSlider *)&v7 accessibilityDecrement];
  }
}

- (unint64_t)segmentCount
{
  return self->_segmentCount;
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->_unint64_t segmentCount = a3;
}

- (BOOL)restrictsValuesToTicks
{
  return self->_restrictsValuesToTicks;
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy;
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  self->_supportsVibrancCGFloat y = a3;
}

- (BOOL)drawsEndTicks
{
  return self->_drawsEndTicks;
}

- (void)setDrawsEndTicks:(BOOL)a3
{
  self->_drawsEndTicks = a3;
}

- (UIColor)tickColor
{
  return self->_tickColor;
}

- (void)setTickColor:(id)a3
{
}

- (NSMutableArray)ticks
{
  return self->_ticks;
}

- (void)setTicks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticks, 0);
  objc_storeStrong((id *)&self->_tickColor, 0);
}

@end