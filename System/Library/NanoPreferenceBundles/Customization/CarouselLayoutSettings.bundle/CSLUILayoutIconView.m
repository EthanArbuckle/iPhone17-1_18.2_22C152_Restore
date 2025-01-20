@interface CSLUILayoutIconView
+ (double)defaultDiameter;
+ (id)circleMaskImage:(id)a3;
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributes;
- (BOOL)isDragging;
- (BOOL)isJiggling;
- (CSLHexAppNode)node;
- (void)applyLayoutAttributes:(id)a3;
- (void)beginDraggingAtPoint:(CGPoint)a3;
- (void)endDraggingToLayoutAttributes:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setJiggling:(BOOL)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation CSLUILayoutIconView

+ (double)defaultDiameter
{
  return 40.0;
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = v3;
  if (![(CSLUILayoutIconView *)self isDragging])
  {
    long long v6 = *((_OWORD *)v4 + 1);
    *(_OWORD *)&v14.a = *(_OWORD *)v4;
    *(_OWORD *)&v14.c = v6;
    [(CSLUILayoutIconView *)self setLayoutAttributes:&v14];
    double v7 = v4[2];
    +[CSLUILayoutIconView defaultDiameter];
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7 / v8, v7 / v8);
    CGAffineTransform v13 = v14;
    [(CSLUILayoutIconView *)self setTransform:&v13];
    long long v12 = *(_OWORD *)v4;
    v9 = +[UIScreen mainScreen];
    [v9 scale];
    uint64_t v11 = v10;

    [(CSLUILayoutIconView *)self setCenter:vdivq_f64(vrndaq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&v12), *(double *)&v11)), (float64x2_t)vdupq_lane_s64(v11, 0))];
  }
}

- (void)beginDraggingAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CSLUILayoutIconView *)self setDragging:1];
  memset(&v10, 0, sizeof(v10));
  [(CSLUILayoutIconView *)self transform];
  CGAffineTransform v8 = v10;
  CGAffineTransformScale(&v9, &v8, 1.6, 1.6);
  CGAffineTransform v10 = v9;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_26F2C;
  v6[3] = &unk_3CE60;
  v6[4] = self;
  *(CGFloat *)&v6[5] = x;
  *(CGFloat *)&v6[6] = y;
  CGAffineTransform v7 = v9;
  +[UIView animateWithDuration:0 delay:v6 options:0 animations:0.1 completion:0.0];
}

- (void)endDraggingToLayoutAttributes:(id)a3
{
  v4 = v3;
  -[CSLUILayoutIconView setDragging:](self, "setDragging:", 0, a3.var0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2703C;
  v7[3] = &unk_3CE88;
  CGAffineTransform v10 = self;
  long long v6 = v4[1];
  long long v8 = *v4;
  long long v9 = v6;
  +[UIView animateWithDuration:0 delay:v7 options:0 animations:0.1 completion:0.0];
}

+ (id)circleMaskImage:(id)a3
{
  id v3 = a3;
  +[CSLUILayoutIconView defaultDiameter];
  CGFloat v5 = v4;
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.double width = v5;
  v20.size.double height = v5;
  CGRect v21 = CGRectIntegral(v20);
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  id v10 = v3;
  uint64_t v11 = (CGImage *)[v10 CGImage];

  v19.double width = v5;
  v19.double height = v5;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, y, width, height);
  id v13 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(CurrentContext, (CGPathRef)[v13 CGPath]);

  CGContextClip(CurrentContext);
  v17.b = 0.0;
  v17.c = 0.0;
  v17.a = 1.0;
  *(_OWORD *)&v17.d = xmmword_2E810;
  v17.tdouble y = v5;
  CGContextConcatCTM(CurrentContext, &v17);
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGContextDrawImage(CurrentContext, v22, v11);
  Image = CGBitmapContextCreateImage(CurrentContext);
  v15 = +[UIImage imageWithCGImage:Image];
  CGImageRelease(Image);
  UIGraphicsEndImageContext();

  return v15;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (BOOL)isJiggling
{
  return self->_jiggling;
}

- (void)setJiggling:(BOOL)a3
{
  self->_jiggling = a3;
}

- (CSLHexAppNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributes
{
  long long v3 = *(_OWORD *)&self[1].super.super.super.isa;
  long long v4 = *(_OWORD *)&self[1]._node;
  _OWORD *v2 = v3;
  v2[1] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v3;
}

- (void)setLayoutAttributes:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self[1].super.super.super.isa = *v3;
  *(_OWORD *)&self[1]._node = v4;
}

- (void).cxx_destruct
{
}

@end