@interface AVTCircularView
- (AVTCircularView)initWithFrame:(CGRect)a3;
- (CAShapeLayer)clippingLayer;
- (void)layoutSubviews;
- (void)setClippingLayer:(id)a3;
@end

@implementation AVTCircularView

- (AVTCircularView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTCircularView;
  v3 = -[AVTCircularView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    clippingLayer = v3->_clippingLayer;
    v3->_clippingLayer = v4;

    v6 = v3->_clippingLayer;
    v7 = [(AVTCircularView *)v3 layer];
    [v7 setMask:v6];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AVTCircularView;
  [(AVTCircularView *)&v5 layoutSubviews];
  v3 = (void *)MEMORY[0x263F1C478];
  [(AVTCircularView *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_clippingLayer, "setPath:", [v4 CGPath]);
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end