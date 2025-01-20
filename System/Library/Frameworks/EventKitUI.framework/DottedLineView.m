@interface DottedLineView
- (DottedLineView)init;
- (void)_updateShapeLayer;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation DottedLineView

- (DottedLineView)init
{
  v8.receiver = self;
  v8.super_class = (Class)DottedLineView;
  v2 = [(DottedLineView *)&v8 init];
  if (v2)
  {
    v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    shapeLayer = v2->_shapeLayer;
    v2->_shapeLayer = v3;

    v5 = [(DottedLineView *)v2 layer];
    [v5 addSublayer:v2->_shapeLayer];

    v6 = [(DottedLineView *)v2 layer];
    [v6 setMasksToBounds:1];
  }
  return v2;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)DottedLineView;
  [(DottedLineView *)&v5 layoutSubviews];
  [(DottedLineView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v6) * 0.5;
  v4 = [(DottedLineView *)self layer];
  [v4 setCornerRadius:v3];

  [(DottedLineView *)self _updateShapeLayer];
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);

  [(DottedLineView *)self _updateShapeLayer];
}

- (void)_updateShapeLayer
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (self->_color)
  {
    [(DottedLineView *)self bounds];
    double Width = CGRectGetWidth(v13);
    [(DottedLineView *)self bounds];
    CGFloat MidX = CGRectGetMidX(v14);
    objc_super v5 = [(DottedLineView *)self layer];
    [v5 bounds];
    -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:");

    [(CAShapeLayer *)self->_shapeLayer setStrokeColor:[(UIColor *)self->_color CGColor]];
    [(CAShapeLayer *)self->_shapeLayer setLineWidth:Width];
    v12[0] = &unk_1F0D03550;
    CGRect v6 = [NSNumber numberWithDouble:Width + Width];
    v12[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [(CAShapeLayer *)self->_shapeLayer setLineDashPattern:v7];

    [(CAShapeLayer *)self->_shapeLayer setLineCap:*MEMORY[0x1E4F3A458]];
    [(CAShapeLayer *)self->_shapeLayer setLineDashPhase:Width * -0.5];
    Mutable = CGPathCreateMutable();
    [(CAShapeLayer *)self->_shapeLayer bounds];
    points.x = MidX;
    points.y = CGRectGetMaxY(v15);
    [(CAShapeLayer *)self->_shapeLayer bounds];
    CGFloat v10 = MidX;
    CGFloat MinY = CGRectGetMinY(v16);
    CGPathAddLines(Mutable, 0, &points, 2uLL);
    [(CAShapeLayer *)self->_shapeLayer setPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end