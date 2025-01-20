@interface FIUIChartMinMaxValueAxisDescriptor
- (CGSize)shadowOffset;
- (Class)expectedDataType;
- (NSNumber)highlightedValue;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (UIColor)highlightedLabelColor;
- (UIColor)shadowColor;
- (UIColor)unhighlightedLabelColor;
- (UIFont)labelFont;
- (double)axisDescriptorPadding;
- (double)shadowBlur;
- (id)_axisLabelForValue:(id)a3 highlighted:(BOOL)a4;
- (id)axisLabels;
- (void)setAxisDescriptorPadding:(double)a3;
- (void)setHighlightedLabelColor:(id)a3;
- (void)setHighlightedValue:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setUnhighlightedLabelColor:(id)a3;
@end

@implementation FIUIChartMinMaxValueAxisDescriptor

- (id)_axisLabelForValue:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(FIUIChartAxisLabel);
  v8 = [MEMORY[0x263F08A30] localizedStringFromNumber:v6 numberStyle:1];
  [(FIUIChartAxisLabel *)v7 setText:v8];

  uint64_t v9 = 16;
  if (v4) {
    uint64_t v9 = 24;
  }
  [(FIUIChartAxisLabel *)v7 setLabelColor:*(Class *)((char *)&self->super.isa + v9)];
  [(FIUIChartAxisLabel *)v7 setLocation:v6];

  [(FIUIChartAxisLabel *)v7 setShadowColor:self->_shadowColor];
  -[FIUIChartAxisLabel setShadowOffset:](v7, "setShadowOffset:", self->_shadowOffset.width, self->_shadowOffset.height);
  [(FIUIChartAxisLabel *)v7 setShadowBlur:self->_shadowBlur];
  return v7;
}

- (id)axisLabels
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  BOOL v4 = [(FIUIChartMinMaxValueAxisDescriptor *)self _axisLabelForValue:self->_minValue highlighted:0];
  [v3 addObject:v4];

  highlightedValue = self->_highlightedValue;
  if (highlightedValue)
  {
    id v6 = [(FIUIChartMinMaxValueAxisDescriptor *)self _axisLabelForValue:highlightedValue highlighted:1];
    [v3 addObject:v6];
  }
  v7 = [(FIUIChartMinMaxValueAxisDescriptor *)self _axisLabelForValue:self->_maxValue highlighted:0];
  [v3 addObject:v7];

  v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v8;
}

- (Class)expectedDataType
{
  return (Class)objc_opt_class();
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (UIColor)unhighlightedLabelColor
{
  return self->_unhighlightedLabelColor;
}

- (void)setUnhighlightedLabelColor:(id)a3
{
}

- (UIColor)highlightedLabelColor
{
  return self->_highlightedLabelColor;
}

- (void)setHighlightedLabelColor:(id)a3
{
}

- (double)axisDescriptorPadding
{
  return self->_axisDescriptorPadding;
}

- (void)setAxisDescriptorPadding:(double)a3
{
  self->_axisDescriptorPadding = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowBlur
{
  return self->_shadowBlur;
}

- (void)setShadowBlur:(double)a3
{
  self->_shadowBlur = a3;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
}

- (NSNumber)highlightedValue
{
  return self->_highlightedValue;
}

- (void)setHighlightedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_highlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
}

@end