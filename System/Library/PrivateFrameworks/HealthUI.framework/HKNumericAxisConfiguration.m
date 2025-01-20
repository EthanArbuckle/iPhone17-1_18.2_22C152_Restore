@interface HKNumericAxisConfiguration
- (HKAxisLabelDimension)labelDimension;
- (HKNumericAxisConfiguration)init;
- (double)bottomVerticalLabelPadding;
- (double)topVerticalLabelPadding;
- (void)applyOverridesFromNumericAxisConfiguration:(id)a3;
- (void)setBottomVerticalLabelPadding:(double)a3;
- (void)setLabelDimension:(id)a3;
- (void)setTopVerticalLabelPadding:(double)a3;
@end

@implementation HKNumericAxisConfiguration

- (void)setTopVerticalLabelPadding:(double)a3
{
  self->_topVerticalLabelPadding = a3;
}

- (void)setBottomVerticalLabelPadding:(double)a3
{
  self->_bottomVerticalLabelPadding = a3;
}

- (HKNumericAxisConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKNumericAxisConfiguration;
  v2 = [(HKAxisConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    labelDimension = v2->_labelDimension;
    v2->_labelDimension = 0;

    v3->_topVerticalLabelPadding = 10.0;
    v3->_bottomVerticalLabelPadding = 10.0;
  }
  return v3;
}

- (double)topVerticalLabelPadding
{
  return self->_topVerticalLabelPadding;
}

- (HKAxisLabelDimension)labelDimension
{
  return self->_labelDimension;
}

- (double)bottomVerticalLabelPadding
{
  return self->_bottomVerticalLabelPadding;
}

- (void).cxx_destruct
{
}

- (void)applyOverridesFromNumericAxisConfiguration:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKNumericAxisConfiguration);
  objc_super v6 = [v4 labelDimension];
  v7 = [(HKNumericAxisConfiguration *)v5 labelDimension];

  if (v6 != v7)
  {
    v8 = [v4 labelDimension];
    [(HKNumericAxisConfiguration *)self setLabelDimension:v8];
  }
  [v4 topVerticalLabelPadding];
  double v10 = v9;
  [(HKNumericAxisConfiguration *)v5 topVerticalLabelPadding];
  if (v10 != v11)
  {
    [v4 topVerticalLabelPadding];
    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](self, "setTopVerticalLabelPadding:");
  }
  [v4 bottomVerticalLabelPadding];
  double v13 = v12;
  [(HKNumericAxisConfiguration *)v5 bottomVerticalLabelPadding];
  if (v13 != v14)
  {
    [v4 bottomVerticalLabelPadding];
    -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](self, "setBottomVerticalLabelPadding:");
  }
  v15.receiver = self;
  v15.super_class = (Class)HKNumericAxisConfiguration;
  [(HKAxisConfiguration *)&v15 applyOverridesFromAxisConfiguration:v4];
}

- (void)setLabelDimension:(id)a3
{
}

@end