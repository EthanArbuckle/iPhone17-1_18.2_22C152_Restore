@interface UIView
- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4;
- (double)xOriginForCenterOfSuperview;
- (double)yOriginForCenterOfSuperview;
@end

@implementation UIView

- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4
{
  id v9 = a5;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v25 = v9;
  v11 = [v9 window];

  if (!v11)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a3 object:self file:@"PHInCallUIUtilities.m" lineNumber:72 description:@"The window must not be nil to abut views within it."];
  }
  if (a4 == 8)
  {
    [(UIView *)self frame];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    double v16 = v18;
    [v25 frame];
    double v20 = v19;
    [v25 frame];
    double v17 = v20 + v21;
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_8;
    }
    [(UIView *)self frame];
    double v13 = v12;
    [(UIView *)self frame];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v13 + v14, 0.0);
    double v16 = v15;
    [v25 frame];
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v17, 0.0);
  *(float *)&double v22 = v22 - v16;
  CGAffineTransformMakeTranslation(retstr, roundf(*(float *)&v22), 0.0);
LABEL_8:

  return result;
}

- (double)xOriginForCenterOfSuperview
{
  v4 = [(UIView *)self superview];

  if (!v4)
  {
    double v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PHInCallUIUtilities.m" lineNumber:94 description:@"xOriginForCenterOfSuperview - there is no superview"];
  }
  v5 = [(UIView *)self superview];
  [v5 bounds];
  double v7 = v6 * 0.5;
  [(UIView *)self bounds];
  float v9 = v7 - v8 * 0.5;
  double v10 = floorf(v9);

  return v10;
}

- (double)yOriginForCenterOfSuperview
{
  v4 = [(UIView *)self superview];

  if (!v4)
  {
    double v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PHInCallUIUtilities.m" lineNumber:101 description:@"yOriginForCenterOfSuperview - there is no superview"];
  }
  v5 = [(UIView *)self superview];
  [v5 bounds];
  double v7 = v6 * 0.5;
  [(UIView *)self bounds];
  float v9 = v7 - v8 * 0.5;
  double v10 = floorf(v9);

  return v10;
}

@end