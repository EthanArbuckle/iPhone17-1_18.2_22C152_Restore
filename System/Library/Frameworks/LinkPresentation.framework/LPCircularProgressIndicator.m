@interface LPCircularProgressIndicator
- (LPCircularProgressIndicator)initWithHost:(id)a3 style:(id)a4;
- (double)progress;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
- (void)updatePaths;
@end

@implementation LPCircularProgressIndicator

- (LPCircularProgressIndicator)initWithHost:(id)a3 style:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LPCircularProgressIndicator;
  v7 = [(LPCircularProgressIndicator *)&v21 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_style, a4);
    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = v9;

    [(CAShapeLayer *)v8->_borderLayer setName:@"borderLayer"];
    [v6 borderWidth];
    -[CAShapeLayer setLineWidth:](v8->_borderLayer, "setLineWidth:");
    id v11 = [v6 borderColor];
    -[CAShapeLayer setStrokeColor:](v8->_borderLayer, "setStrokeColor:", [v11 CGColor]);

    id v12 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v8->_borderLayer, "setFillColor:", [v12 CGColor]);

    v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    progressLayer = v8->_progressLayer;
    v8->_progressLayer = v13;

    [(CAShapeLayer *)v8->_progressLayer setName:@"progressLayer"];
    id v15 = [v6 fillColor];
    -[CAShapeLayer setFillColor:](v8->_progressLayer, "setFillColor:", [v15 CGColor]);

    id v16 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setStrokeColor:](v8->_progressLayer, "setStrokeColor:", [v16 CGColor]);

    v17 = [(LPCircularProgressIndicator *)v8 layer];
    [v17 addSublayer:v8->_progressLayer];

    v18 = [(LPCircularProgressIndicator *)v8 layer];
    [v18 addSublayer:v8->_borderLayer];

    v19 = v8;
  }

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LPCircularProgressIndicator;
  [(LPCircularProgressIndicator *)&v3 layoutSubviews];
  [(LPCircularProgressIndicator *)self bounds];
  -[CAShapeLayer setFrame:](self->_borderLayer, "setFrame:");
  [(LPCircularProgressIndicator *)self bounds];
  -[CAShapeLayer setFrame:](self->_progressLayer, "setFrame:");
  [(LPCircularProgressIndicator *)self updatePaths];
}

- (void)updatePaths
{
  objc_super v3 = (void *)MEMORY[0x1E4FB14C0];
  [(LPCircularProgressIndicator *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v11 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", [v11 CGPath]);
  [(LPCircularProgressIndicator *)self bounds];
  double Width = CGRectGetWidth(v13);
  [(LPCircularProgressIndicatorStyle *)self->_style borderWidth];
  double v6 = v5;
  [(LPCircularProgressIndicator *)self bounds];
  double MidX = CGRectGetMidX(v14);
  [(LPCircularProgressIndicator *)self bounds];
  double MidY = CGRectGetMidY(v15);
  v9 = [MEMORY[0x1E4FB14C0] bezierPath];
  objc_msgSend(v9, "moveToPoint:", MidX, MidY);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, (Width - v6) * 0.5, -1.57079633, (self->_progress * 360.0 + -90.0) * 3.14159265 / 180.0);
  objc_msgSend(v9, "addLineToPoint:", MidX, MidY);
  id v10 = v9;
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", [v10 CGPath]);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end