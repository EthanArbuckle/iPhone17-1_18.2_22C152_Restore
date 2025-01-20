@interface UIView
+ (void)load;
- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4;
- (double)xOriginForCenterOfSuperview;
- (double)yOriginForCenterOfSuperview;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
@end

@implementation UIView

- (int64_t)action
{
  return [(UIView *)self tag];
}

- (void)setAction:(int64_t)a3
{
}

+ (void)load
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083750;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100326108 != -1) {
    dispatch_once(&qword_100326108, block);
  }
}

- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4
{
  id v8 = a5;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (a4 == 8)
  {
    id v22 = v8;
    [(UIView *)self frame];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    double v14 = v16;
    [v22 frame];
    double v18 = v17;
    [v22 frame];
    double v15 = v18 + v19;
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_6;
    }
    id v22 = v8;
    [(UIView *)self frame];
    double v11 = v10;
    [(UIView *)self frame];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v11 + v12, 0.0);
    double v14 = v13;
    [v22 frame];
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v15, 0.0);
  *(float *)&double v20 = v20 - v14;
  CGAffineTransformMakeTranslation(retstr, roundf(*(float *)&v20), 0.0);
  id v8 = v22;
LABEL_6:

  return result;
}

- (double)xOriginForCenterOfSuperview
{
  v3 = [(UIView *)self superview];
  [v3 bounds];
  double v5 = v4 * 0.5;
  [(UIView *)self bounds];
  float v7 = v5 - v6 * 0.5;
  double v8 = floorf(v7);

  return v8;
}

- (double)yOriginForCenterOfSuperview
{
  v3 = [(UIView *)self superview];
  [v3 bounds];
  double v5 = v4 * 0.5;
  [(UIView *)self bounds];
  float v7 = v5 - v6 * 0.5;
  double v8 = floorf(v7);

  return v8;
}

@end