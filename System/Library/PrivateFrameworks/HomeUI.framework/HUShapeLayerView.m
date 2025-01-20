@interface HUShapeLayerView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)fillColorMatchesTintColor;
- (HUShapeLayerView)initWithPathLayoutBlock:(id)a3;
- (UIColor)fillColor;
- (id)pathLayoutBlock;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setFillColor:(id)a3;
- (void)setFillColorMatchesTintColor:(BOOL)a3;
- (void)setPathLayoutBlock:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HUShapeLayerView

- (HUShapeLayerView)initWithPathLayoutBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUShapeLayerView;
  v5 = [(HUShapeLayerView *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUShapeLayerView *)v5 setPathLayoutBlock:v4];
  }

  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)HUShapeLayerView;
  [(HUShapeLayerView *)&v7 layoutSubviews];
  v3 = [(HUShapeLayerView *)self pathLayoutBlock];
  [(HUShapeLayerView *)self bounds];
  v3[2](v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 CGPath];
  v6 = [(HUShapeLayerView *)self layer];
  [v6 setPath:v5];
}

- (UIColor)fillColor
{
  v2 = (void *)MEMORY[0x1E4F428B8];
  v3 = [(HUShapeLayerView *)self layer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));

  return (UIColor *)v4;
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  [(HUShapeLayerView *)self setFillColorMatchesTintColor:0];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(HUShapeLayerView *)self layer];
  [v7 setFillColor:v6];
}

- (void)setFillColorMatchesTintColor:(BOOL)a3
{
  if (self->_fillColorMatchesTintColor != a3)
  {
    self->_fillColorMatchesTintColor = a3;
    if (a3)
    {
      id v6 = [(HUShapeLayerView *)self tintColor];
      uint64_t v4 = [v6 CGColor];
      id v5 = [(HUShapeLayerView *)self layer];
      [v5 setFillColor:v4];
    }
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)HUShapeLayerView;
  [(HUShapeLayerView *)&v3 didMoveToSuperview];
  [(HUShapeLayerView *)self tintColorDidChange];
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)HUShapeLayerView;
  [(HUShapeLayerView *)&v6 tintColorDidChange];
  if ([(HUShapeLayerView *)self fillColorMatchesTintColor])
  {
    id v3 = [(HUShapeLayerView *)self tintColor];
    uint64_t v4 = [v3 CGColor];
    id v5 = [(HUShapeLayerView *)self layer];
    [v5 setFillColor:v4];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUShapeLayerView;
    BOOL v5 = [(HUShapeLayerView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)fillColorMatchesTintColor
{
  return self->_fillColorMatchesTintColor;
}

- (id)pathLayoutBlock
{
  return self->_pathLayoutBlock;
}

- (void)setPathLayoutBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end