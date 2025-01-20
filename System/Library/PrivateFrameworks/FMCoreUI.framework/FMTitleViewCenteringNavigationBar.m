@interface FMTitleViewCenteringNavigationBar
- (void)layoutSubviews;
@end

@implementation FMTitleViewCenteringNavigationBar

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)FMTitleViewCenteringNavigationBar;
  [(FMTitleViewCenteringNavigationBar *)&v39 layoutSubviews];
  v3 = [(FMTitleViewCenteringNavigationBar *)self topItem];
  v4 = [v3 titleView];

  if (v4)
  {
    v5 = [(FMTitleViewCenteringNavigationBar *)self currentLeftView];

    double v6 = 0.0;
    double v7 = 0.0;
    if (v5)
    {
      v8 = [(FMTitleViewCenteringNavigationBar *)self currentLeftView];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;

      double v7 = v10 + v12;
    }
    v13 = [(FMTitleViewCenteringNavigationBar *)self currentRightView];

    if (v13)
    {
      v14 = [(FMTitleViewCenteringNavigationBar *)self currentRightView];
      [v14 frame];
      double v16 = v15;

      [(FMTitleViewCenteringNavigationBar *)self frame];
      double v6 = v17 - v16;
    }
    v18 = [(FMTitleViewCenteringNavigationBar *)self topItem];
    v19 = [v18 titleView];
    [v19 frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    [(FMTitleViewCenteringNavigationBar *)self bounds];
    if (v7 >= v6) {
      CGFloat v32 = v7;
    }
    else {
      CGFloat v32 = v6;
    }
    CGRect v40 = CGRectInset(*(CGRect *)&v28, v32, 0.0);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double width = v40.size.width;
    double height = v40.size.height;
    v40.origin.double x = v21;
    v40.origin.double y = v23;
    v40.size.double width = v25;
    v40.size.double height = v27;
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    if (!CGRectEqualToRect(v40, v41))
    {
      v37 = [(FMTitleViewCenteringNavigationBar *)self topItem];
      v38 = [v37 titleView];
      objc_msgSend(v38, "setFrame:", x, y, width, height);
    }
  }
}

@end