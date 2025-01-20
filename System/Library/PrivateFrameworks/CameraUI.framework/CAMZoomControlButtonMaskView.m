@interface CAMZoomControlButtonMaskView
- (CAMZoomControlButtonMaskView)initWithFrame:(CGRect)a3;
- (CAShapeLayer)_shapeLayer;
- (CGRect)maskOvalFrame;
- (void)layoutSubviews;
- (void)setMaskOvalFrame:(CGRect)a3;
@end

@implementation CAMZoomControlButtonMaskView

- (CAMZoomControlButtonMaskView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMZoomControlButtonMaskView;
  v3 = -[CAMZoomControlButtonMaskView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMZoomControlButtonMaskView *)v3 setOpaque:0];
    [(CAMZoomControlButtonMaskView *)v4 setContentMode:3];
    v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    shapeLayer = v4->__shapeLayer;
    v4->__shapeLayer = v5;

    v7 = [(CAMZoomControlButtonMaskView *)v4 layer];
    [v7 addSublayer:v4->__shapeLayer];

    v8 = v4;
  }

  return v4;
}

- (void)setMaskOvalFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_maskOvalFrame = &self->_maskOvalFrame;
  if (!CGRectEqualToRect(self->_maskOvalFrame, a3))
  {
    p_maskOvalFrame->origin.CGFloat x = x;
    p_maskOvalFrame->origin.CGFloat y = y;
    p_maskOvalFrame->size.CGFloat width = width;
    p_maskOvalFrame->size.CGFloat height = height;
    [(CAMZoomControlButtonMaskView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(CAMZoomControlButtonMaskView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CAMZoomControlButtonMaskView *)self maskOvalFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v24 = [(CAMZoomControlButtonMaskView *)self _shapeLayer];
  objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);
  v19 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", v12, v14, v16, v18);
  v20 = [v19 bezierPathByReversingPath];
  v21 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v4, v6, v8, v10);
  [v21 appendPath:v20];
  id v22 = v21;
  objc_msgSend(v24, "setPath:", objc_msgSend(v22, "CGPath"));
  id v23 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v24, "setFillColor:", objc_msgSend(v23, "CGColor"));
}

- (CGRect)maskOvalFrame
{
  double x = self->_maskOvalFrame.origin.x;
  double y = self->_maskOvalFrame.origin.y;
  double width = self->_maskOvalFrame.size.width;
  double height = self->_maskOvalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CAShapeLayer)_shapeLayer
{
  return self->__shapeLayer;
}

- (void).cxx_destruct
{
}

@end