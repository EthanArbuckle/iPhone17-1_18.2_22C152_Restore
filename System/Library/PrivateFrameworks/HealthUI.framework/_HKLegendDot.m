@interface _HKLegendDot
- (CALayer)innerDotLayer;
- (CGSize)intrinsicContentSize;
- (UIColor)dotColor;
- (UIColor)innerDotColor;
- (_HKLegendDot)init;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setDotColor:(id)a3;
- (void)setInnerDotColor:(id)a3;
- (void)setInnerDotLayer:(id)a3;
@end

@implementation _HKLegendDot

- (_HKLegendDot)init
{
  v20.receiver = self;
  v20.super_class = (Class)_HKLegendDot;
  v2 = -[_HKLegendDot initWithFrame:](&v20, sel_initWithFrame_, 0.0, 0.0, 8.0, 8.0);
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v4 = [v3 CGColor];

    v5 = [(_HKLegendDot *)v2 layer];
    [v5 setBackgroundColor:v4];

    v6 = [(_HKLegendDot *)v2 layer];
    [v6 setMasksToBounds:1];

    v7 = [(_HKLegendDot *)v2 layer];
    [v7 setCornerRadius:4.0];

    LODWORD(v8) = 1148846080;
    [(_HKLegendDot *)v2 setContentHuggingPriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(_HKLegendDot *)v2 setContentHuggingPriority:0 forAxis:v9];
    [(_HKLegendDot *)v2 setInnerDotColor:0];
    id v10 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(_HKLegendDot *)v2 setInnerDotLayer:v10];

    v11 = [(_HKLegendDot *)v2 innerDotLayer];
    [v11 setBackgroundColor:v4];

    v12 = [(_HKLegendDot *)v2 innerDotLayer];
    [v12 setMasksToBounds:1];

    v13 = [(_HKLegendDot *)v2 innerDotLayer];
    [v13 setCornerRadius:2.0];

    v14 = [(_HKLegendDot *)v2 innerDotLayer];
    objc_msgSend(v14, "setBounds:", 0.0, 0.0, 4.0, 4.0);

    v15 = [(_HKLegendDot *)v2 layer];
    v16 = [(_HKLegendDot *)v2 innerDotLayer];
    [v15 addSublayer:v16];

    v17 = [(_HKLegendDot *)v2 layer];
    [v17 setDelegate:v2];

    v18 = [(_HKLegendDot *)v2 innerDotLayer];
    [v18 setHidden:1];
  }
  return v2;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  uint64_t v4 = [(_HKLegendDot *)self layer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = [(_HKLegendDot *)self innerDotLayer];
  objc_msgSend(v11, "setPosition:", v6 + v10 * 0.5, v8 + v10 * 0.5);
}

- (void)setDotColor:(id)a3
{
  p_dotColor = &self->_dotColor;
  objc_storeStrong((id *)&self->_dotColor, a3);
  id v6 = a3;
  uint64_t v7 = [(UIColor *)*p_dotColor CGColor];

  double v8 = [(_HKLegendDot *)self layer];
  [v8 setBackgroundColor:v7];

  [(_HKLegendDot *)self setNeedsDisplay];
}

- (void)setInnerDotColor:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_innerDotColor, a3);
  if (v10)
  {
    uint64_t v5 = [v10 CGColor];
    id v6 = [(_HKLegendDot *)self innerDotLayer];
    [v6 setBackgroundColor:v5];

    uint64_t v7 = [(_HKLegendDot *)self innerDotLayer];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = [(_HKLegendDot *)self innerDotLayer];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHidden:v9];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 8.0;
  double v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (CALayer)innerDotLayer
{
  return self->_innerDotLayer;
}

- (void)setInnerDotLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerDotLayer, 0);
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_dotColor, 0);
}

@end