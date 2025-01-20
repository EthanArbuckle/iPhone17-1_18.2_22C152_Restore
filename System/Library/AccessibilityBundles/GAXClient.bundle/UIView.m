@interface UIView
- (CGPoint)gax_convertPointToDeviceCoordinates:(CGPoint)a3;
- (CGRect)gax_convertRectFromDeviceCoordinates:(CGRect)a3;
- (CGRect)gax_deviceFrame;
- (CGRect)gax_globalFrame;
- (id)gax_findDescendantsMatchingBlock:(id)a3 shouldStopAtFirstMatch:(BOOL)a4;
- (void)gax_setCenter:(CGPoint)a3 alignWithGrid:(BOOL)a4;
@end

@implementation UIView

- (CGRect)gax_globalFrame
{
  v3 = [(UIView *)self window];
  [(UIView *)self bounds];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v3);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v3)
  {
    objc_msgSend(v3, "convertRect:toWindow:", 0, v4, v5, v6, v7);
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
  }

  double v16 = v8;
  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)gax_deviceFrame
{
  v3 = [(UIView *)self layer];
  double v4 = [(UIView *)self window];
  double v5 = [v4 layer];
  double v6 = [v5 superlayer];

  [v3 bounds];
  objc_msgSend(v3, "convertRect:toLayer:", v6);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  if (v6)
  {
    objc_msgSend(v6, "convertRect:toLayer:", 0, v7, v8, v9, v10);
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
  }

  double v19 = v11;
  double v20 = v12;
  double v21 = v13;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGPoint)gax_convertPointToDeviceCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UIView *)self layer];
  double v7 = [(UIView *)self window];
  double v8 = [v7 layer];
  double v9 = [v8 superlayer];

  objc_msgSend(v6, "convertPoint:toLayer:", v9, x, y);
  double v12 = v10;
  double v13 = v11;
  if (v9)
  {
    objc_msgSend(v9, "convertPoint:toLayer:", 0, v10, v11);
    double v12 = v14;
    double v13 = v15;
  }

  double v16 = v12;
  double v17 = v13;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGRect)gax_convertRectFromDeviceCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIView *)self layer];
  double v9 = [(UIView *)self window];
  double v10 = [v9 layer];
  double v11 = [v10 superlayer];

  if (v11)
  {
    objc_msgSend(v11, "convertRect:fromLayer:", 0, x, y, width, height);
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
  }
  objc_msgSend(v8, "convertRect:fromLayer:", v11, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)gax_setCenter:(CGPoint)a3 alignWithGrid:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    memset(&v20, 0, sizeof(v20));
    [(UIView *)self transform];
    CGAffineTransform v19 = v20;
    IsIdentitdouble y = CGAffineTransformIsIdentity(&v19);
    if (!IsIdentity)
    {
      long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v18[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v18[1] = v8;
      v18[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(UIView *)self setTransform:v18];
    }
    [(UIView *)self center];
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeTranslation(&v19, x - v9, y - v10);
    [(UIView *)self frame];
    CGAffineTransform v17 = v19;
    CGRect v23 = CGRectApplyAffineTransform(v22, &v17);
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    CGRect v24 = CGRectIntegral(v23);
    CGFloat v13 = v24.origin.x;
    CGFloat v14 = v24.origin.y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v24);
    v25.origin.double x = v13;
    v25.origin.double y = v14;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    -[UIView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v25));
    if (!IsIdentity)
    {
      CGAffineTransform v16 = v20;
      [(UIView *)self setTransform:&v16];
    }
  }
  else
  {
    -[UIView setCenter:](self, "setCenter:");
  }
}

- (id)gax_findDescendantsMatchingBlock:(id)a3 shouldStopAtFirstMatch:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (unsigned int (**)(id, void *))a3;
  if (v6)
  {
    double v7 = +[NSMutableArray array];
    long long v8 = +[NSMutableArray arrayWithObject:self];
    if ([v8 count])
    {
      while (1)
      {
        double v9 = [v8 objectAtIndex:0];
        if (v6[2](v6, v9)) {
          [v7 addObject:v9];
        }
        if (v4 && [v7 count] == (char *)&dword_0 + 1) {
          break;
        }
        double v10 = [v9 subviews];
        [v8 addObjectsFromArray:v10];

        [v8 removeObjectAtIndex:0];
        if (![v8 count]) {
          goto LABEL_11;
        }
      }
    }
LABEL_11:
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

@end