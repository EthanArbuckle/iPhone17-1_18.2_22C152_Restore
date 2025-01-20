@interface AVTGroupDialMaskingView
- (AVTGroupDialMaskingView)initWithFrame:(CGRect)a3;
- (CAGradientLayer)maskLayer;
- (void)layoutSubviews;
- (void)setMaskLayer:(id)a3;
@end

@implementation AVTGroupDialMaskingView

- (AVTGroupDialMaskingView)initWithFrame:(CGRect)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AVTGroupDialMaskingView;
  v3 = -[AVTGroupDialMaskingView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F157D0] layer];
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = (CAGradientLayer *)v4;

    id v6 = [MEMORY[0x263F1C550] clearColor];
    v14[0] = [v6 CGColor];
    id v7 = [MEMORY[0x263F1C550] blackColor];
    v14[1] = [v7 CGColor];
    id v8 = [MEMORY[0x263F1C550] blackColor];
    v14[2] = [v8 CGColor];
    id v9 = [MEMORY[0x263F1C550] clearColor];
    v14[3] = [v9 CGColor];
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
    [(CAGradientLayer *)v3->_maskLayer setColors:v10];

    -[CAGradientLayer setStartPoint:](v3->_maskLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_maskLayer, "setEndPoint:", 1.0, 0.5);
    [(CAGradientLayer *)v3->_maskLayer setLocations:&unk_26BF4D618];
    [(AVTGroupDialMaskingView *)v3 bounds];
    CGRect v16 = CGRectInset(v15, 15.0, 0.0);
    -[CAGradientLayer setFrame:](v3->_maskLayer, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    v11 = [(AVTGroupDialMaskingView *)v3 layer];
    [v11 addSublayer:v3->_maskLayer];

    [(AVTGroupDialMaskingView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTGroupDialMaskingView;
  [(AVTGroupDialMaskingView *)&v3 layoutSubviews];
  [(AVTGroupDialMaskingView *)self bounds];
  CGRect v5 = CGRectInset(v4, 15.0, 0.0);
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (CAGradientLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end