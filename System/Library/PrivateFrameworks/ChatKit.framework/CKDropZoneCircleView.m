@interface CKDropZoneCircleView
- (BOOL)isAnimating;
- (CAShapeLayer)dropZoneShapeLayer;
- (CKDropZoneCircleView)initWithFrame:(CGRect)a3;
- (id)spinAnimation;
- (void)_updateShapeLayerStrokeColor;
- (void)layoutSubviews;
- (void)setDropZoneShapeLayer:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKDropZoneCircleView

- (CKDropZoneCircleView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKDropZoneCircleView;
  v3 = -[CKDropZoneCircleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    dropZoneShapeLayer = v3->_dropZoneShapeLayer;
    v3->_dropZoneShapeLayer = v4;

    [(CAShapeLayer *)v3->_dropZoneShapeLayer setFillColor:0];
    [(CAShapeLayer *)v3->_dropZoneShapeLayer setLineWidth:1.5];
    [(CAShapeLayer *)v3->_dropZoneShapeLayer setLineCap:*MEMORY[0x1E4F3A458]];
    [(CKDropZoneCircleView *)v3 _updateShapeLayerStrokeColor];
    [(CAShapeLayer *)v3->_dropZoneShapeLayer setLineDashPattern:&unk_1EDF15EA8];
    v6 = [(CKDropZoneCircleView *)v3 layer];
    [v6 addSublayer:v3->_dropZoneShapeLayer];

    [(CKDropZoneCircleView *)v3 startAnimating];
    [(CKDropZoneCircleView *)v3 setNeedsLayout];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CKDropZoneCircleView;
  [(CKDropZoneCircleView *)&v14 layoutSubviews];
  [(CKDropZoneCircleView *)self bounds];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  double v7 = CGRectGetHeight(v16);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  double v8 = CGRectGetWidth(v17);
  if (v7 < v8) {
    double v8 = v7;
  }
  v9 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8 * 0.5);
  -[CAShapeLayer setFrame:](self->_dropZoneShapeLayer, "setFrame:", x, y, width, height);
  id v10 = v9;
  -[CAShapeLayer setPath:](self->_dropZoneShapeLayer, "setPath:", [v10 CGPath]);
  v11 = objc_msgSend(NSNumber, "numberWithDouble:");
  v15[0] = v11;
  v12 = [NSNumber numberWithDouble:width * 3.14159265 / 30.6 * 0.8];
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(CAShapeLayer *)self->_dropZoneShapeLayer setLineDashPattern:v13];
}

- (id)spinAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
  [v2 setByValue:&unk_1EDF177F8];
  [v2 setDuration:20.0];
  LODWORD(v3) = 2139095040;
  [v2 setRepeatCount:v3];
  [v2 setRemovedOnCompletion:0];

  return v2;
}

- (void)stopAnimating
{
  if (self->_isAnimating)
  {
    self->_isAnimating = 0;
    [(CAShapeLayer *)self->_dropZoneShapeLayer removeAnimationForKey:@"CKSpinAnimation"];
  }
}

- (void)startAnimating
{
  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    dropZoneShapeLayer = self->_dropZoneShapeLayer;
    id v3 = [(CKDropZoneCircleView *)self spinAnimation];
    [(CAShapeLayer *)dropZoneShapeLayer addAnimation:v3 forKey:@"CKSpinAnimation"];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKDropZoneCircleView;
  [(CKDropZoneCircleView *)&v4 traitCollectionDidChange:a3];
  [(CKDropZoneCircleView *)self _updateShapeLayerStrokeColor];
}

- (void)_updateShapeLayerStrokeColor
{
  id v3 = [(CKDropZoneCircleView *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceStyle];

  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.22];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F428B8] colorWithRed:0.31372549 green:0.333333333 blue:0.360784314 alpha:0.14];
  }
  id v8 = v5;
  uint64_t v6 = [v8 CGColor];
  double v7 = [(CKDropZoneCircleView *)self dropZoneShapeLayer];
  [v7 setStrokeColor:v6];
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CAShapeLayer)dropZoneShapeLayer
{
  return self->_dropZoneShapeLayer;
}

- (void)setDropZoneShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end