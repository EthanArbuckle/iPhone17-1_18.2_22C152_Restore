@interface CAMSlashMaskView
+ (Class)layerClass;
- (CAMSlashMaskView)initWithFrame:(CGRect)a3;
- (CGRect)slashBounds;
- (void)_updateShapeLayerAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setSlashBounds:(CGRect)a3;
- (void)setSlashBounds:(CGRect)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMaskAnimated;
@end

@implementation CAMSlashMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMSlashMaskView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSlashMaskView;
  v3 = -[CAMSlashMaskView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CAMSlashMaskView *)v3 _shapeLayer];
    id v6 = [MEMORY[0x263F825C8] whiteColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [v5 setFillRule:*MEMORY[0x263F15AC0]];
  }
  return v4;
}

- (void)layoutSubviews
{
}

- (void)traitCollectionDidChange:(id)a3
{
}

- (void)setSlashBounds:(CGRect)a3
{
}

- (void)setSlashBounds:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_slashBounds = &self->_slashBounds;
  if (!CGRectEqualToRect(a3, self->_slashBounds))
  {
    p_slashBounds->origin.CGFloat x = x;
    p_slashBounds->origin.CGFloat y = y;
    p_slashBounds->size.CGFloat width = width;
    p_slashBounds->size.CGFloat height = height;
    [(CAMSlashMaskView *)self _updateShapeLayerAnimated:v4];
  }
}

- (void)updateMaskAnimated
{
}

- (void)_updateShapeLayerAnimated:(BOOL)a3
{
  id v37 = [(CAMSlashMaskView *)self _shapeLayer];
  [(CAMSlashMaskView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(CAMSlashMaskView *)self slashBounds];
  double x = v39.origin.x;
  double y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  CGFloat MaxX = CGRectGetMaxX(v39);
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v40);
  v18 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v6, v8, v10, v12);
  v19 = [(CAMSlashMaskView *)self traitCollection];
  uint64_t v20 = [v19 legibilityWeight];

  if (v20 == 1) {
    double v21 = 2.0;
  }
  else {
    double v21 = 1.2;
  }
  objc_msgSend(v18, "moveToPoint:", x - v21, y + v21, *(void *)&MaxX);
  objc_msgSend(v18, "addLineToPoint:", x + v21, y - v21);
  objc_msgSend(v18, "addLineToPoint:", v36 + v21, MaxY - v21);
  objc_msgSend(v18, "addLineToPoint:", v36 - v21, MaxY + v21);
  uint64_t v22 = [v37 animationForKey:@"slashMask"];
  v27 = (void *)v22;
  if (a3 || v22)
  {
    LODWORD(v23) = 1045220557;
    LODWORD(v25) = 1041865114;
    LODWORD(v26) = 1.0;
    LODWORD(v24) = 1045220557;
    v28 = [MEMORY[0x263F15808] functionWithControlPoints:v23 :v24 :v25 :v26];
    v29 = [v37 presentationLayer];
    v30 = v29;
    if (!v29)
    {
      if (v27)
      {
        id v31 = [v27 fromValue];
        goto LABEL_10;
      }
      v29 = v37;
    }
    id v31 = (id)[v29 path];
LABEL_10:
    v32 = v31;
    v33 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
    [v33 setFromValue:v32];
    objc_msgSend(v33, "setToValue:", objc_msgSend(v18, "CGPath"));
    [v33 setTimingFunction:v28];
    [v33 setDuration:0.4];
    [v37 addAnimation:v33 forKey:@"slashMask"];
  }
  id v34 = v18;
  objc_msgSend(v37, "setPath:", objc_msgSend(v34, "CGPath"));
}

- (CGRect)slashBounds
{
  double x = self->_slashBounds.origin.x;
  double y = self->_slashBounds.origin.y;
  double width = self->_slashBounds.size.width;
  double height = self->_slashBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end