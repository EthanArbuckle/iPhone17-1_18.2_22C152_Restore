@interface CSContentStyleGradientView
- (CSContentStyleGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5;
- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
@end

@implementation CSContentStyleGradientView

- (CSContentStyleGradientView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CSContentStyleGradientView;
  v3 = -[CSContentStyleGradientView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CSContentStyleGradientView *)v3 setClipsToBounds:1];
    uint64_t v5 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v5;

    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.5, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 0.5, 1.0);
    v7 = v4->_gradientLayer;
    [(CSContentStyleGradientView *)v4 bounds];
    -[CAGradientLayer setFrame:](v7, "setFrame:");
    v8 = [(CSContentStyleGradientView *)v4 layer];
    [v8 addSublayer:v4->_gradientLayer];

    v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v9 setValue:&unk_1F0480BF8 forKey:@"inputRadius"];
    [v9 setName:@"filters.gaussianBlur.inputRadius"];
    v10 = v4->_gradientLayer;
    v14[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(CAGradientLayer *)v10 setFilters:v11];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSContentStyleGradientView;
  [(CSContentStyleGradientView *)&v4 layoutSubviews];
  gradientLayer = self->_gradientLayer;
  [(CSContentStyleGradientView *)self bounds];
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
}

- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v10) {
    [(CAGradientLayer *)self->_gradientLayer setColors:v10];
  }
  if (v8) {
    [(CAGradientLayer *)self->_gradientLayer setLocations:v8];
  }
  if (v9) {
    [(CAGradientLayer *)self->_gradientLayer setType:v9];
  }
}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", a3.x, a3.y);
  gradientLayer = self->_gradientLayer;

  -[CAGradientLayer setEndPoint:](gradientLayer, "setEndPoint:", x, y);
}

- (void).cxx_destruct
{
}

@end