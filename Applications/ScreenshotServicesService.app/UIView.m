@interface UIView
+ (void)sss_animateWithAnimationParameters:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)sss_setFrameUnanimating:(CGRect)a3;
- (void)sss_setFrameUnanimatingIfChangingFromCGSizeZero:(CGRect)a3;
- (void)sss_setFrameUnanimatingLayingOut:(CGRect)a3;
@end

@implementation UIView

- (void)sss_setFrameUnanimatingIfChangingFromCGSizeZero:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    [(UIView *)self frame];
    if (v9 == CGSizeZero.width && v8 == CGSizeZero.height)
    {
      -[UIView sss_setFrameUnanimating:](self, "sss_setFrameUnanimating:", x, y, width, height);
    }
    else
    {
      -[UIView setFrame:](self, "setFrame:", x, y, width, height);
    }
  }
}

- (void)sss_setFrameUnanimating:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self frame];
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001E838;
    v8[3] = &unk_10009A040;
    v8[4] = self;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)sss_setFrameUnanimatingLayingOut:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIView *)self frame];
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001E910;
    v8[3] = &unk_10009A040;
    v8[4] = self;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    +[UIView performWithoutAnimation:v8];
  }
}

+ (void)sss_animateWithAnimationParameters:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002B698;
  v21[3] = &unk_10009A410;
  id v10 = v7;
  id v22 = v10;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  CGRect v13 = objc_retainBlock(v21);
  if ([v10 animationReason])
  {
    CAFrameRateRange v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    float minimum = v25.minimum;
    float maximum = v25.maximum;
    float preferred = v25.preferred;
    unsigned __int16 v17 = (unsigned __int16)[v10 animationReason];
    *(float *)&double v18 = minimum;
    *(float *)&double v19 = maximum;
    *(float *)&double v20 = preferred;
    +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v17 | 0x160000u, v13, v18, v19, v20);
  }
  else
  {
    ((void (*)(void *))v13[2])(v13);
  }
}

@end