@interface UIBezierPath
- (id)_convertPointInPathWithBlock:(id)a3;
- (id)convertPathToView:(id)a3;
- (id)offsetPathByPoint:(CGPoint)a3;
- (void)ax_addArcWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4 cornerRadius:(double)a5;
- (void)enumerateElementsUsingBlock:(id)a3;
@end

@implementation UIBezierPath

- (void)ax_addArcWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4 cornerRadius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(UIBezierPath *)self currentPoint];
  double v12 = v9 - v11;
  double v14 = v8 - v13;
  double v31 = v13;
  double v32 = v11;
  double v15 = x - v11;
  double v16 = y - v13;
  double v17 = 0.0;
  BOOL v18 = v12 == CGPointZero.x && v14 == CGPointZero.y;
  double v19 = 0.0;
  double v30 = 0.0;
  if (!v18)
  {
    double v19 = atan2(v14, v12);
    double v30 = a5;
  }
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeRotation(&v33, -v19);
  double v20 = v33.tx + v14 * v33.c + v33.a * v12;
  double v21 = v33.ty + v14 * v33.d + v33.b * v12;
  double v22 = v33.tx + v16 * v33.c + v33.a * v15;
  double v23 = v33.ty + v16 * v33.d + v33.b * v15;
  if (v20 != v22 || v21 != v23) {
    double v17 = 3.14159265 - fabs(atan2(v23 - v21, v22 - v20));
  }
  double v25 = sin(v17 * 0.5);
  double v26 = 0.0;
  if (v25 == 0.0)
  {
    double v27 = 0.0;
    double v28 = v21;
    double v29 = 0.0;
  }
  else
  {
    double v29 = v30;
    double v20 = v20 - v30 * fabs(cos(v17 * 0.5) / v25);
    if (v23 <= v21)
    {
      double v28 = -v30;
      double v27 = v17 + -1.57079633;
      double v26 = 1.57079633;
    }
    else
    {
      double v27 = 1.57079633 - v17;
      double v26 = -1.57079633;
      double v28 = v30;
    }
  }
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeRotation(&v33, v19);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v23 > v21, v32 + v33.tx + v28 * v33.c + v33.a * v20, v31 + v33.ty + v28 * v33.d + v33.b * v20, v29, v19 + v26, v19 + v27);
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  v4 = self;
  id v5 = a3;
  [(UIBezierPath *)v4 CGPath];
  AX_CGPathEnumerateElementsUsingBlock();
}

- (id)_convertPointInPathWithBlock:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100041314;
  v9[3] = &unk_1001ABFA0;
  id v11 = a3;
  id v4 = objc_alloc_init((Class)UIBezierPath);
  id v10 = v4;
  id v5 = v11;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v9];
  v6 = v10;
  id v7 = v4;

  return v7;
}

- (id)offsetPathByPoint:(CGPoint)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041520;
  v5[3] = &unk_1001ABDE8;
  CGPoint v6 = a3;
  v3 = [(UIBezierPath *)self _convertPointInPathWithBlock:v5];

  return v3;
}

- (id)convertPathToView:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000415E0;
  v7[3] = &unk_1001ABFC8;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(UIBezierPath *)self _convertPointInPathWithBlock:v7];

  return v5;
}

@end