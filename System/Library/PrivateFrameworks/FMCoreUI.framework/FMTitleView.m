@interface FMTitleView
- (void)layoutSubviews;
@end

@implementation FMTitleView

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)FMTitleView;
  [(FMTitleView *)&v38 layoutSubviews];
  v4 = [(FMTitleView *)self superview];

  if (v4)
  {
    v5 = [(FMTitleView *)self superview];
    if (v5)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v6 = [v5 superview];

        v5 = (void *)v6;
      }
      while (v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = [MEMORY[0x263F08690] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"FMTitleView.m", 34, @"Invalid parameter not satisfying: %@", @"[navbar isKindOfClass:[UINavigationBar class]]" object file lineNumber description];
    }
    v7 = [v5 currentLeftView];

    double v8 = 0.0;
    double v9 = 0.0;
    if (v7)
    {
      v10 = [v5 currentLeftView];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;

      double v9 = v12 + v14;
    }
    v15 = [v5 currentRightView];

    if (v15)
    {
      v16 = [v5 currentRightView];
      [v16 frame];
      double v18 = v17;

      [v5 frame];
      double v8 = v19 - v18;
    }
    [(FMTitleView *)self frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v5 bounds];
    if (v9 >= v8) {
      CGFloat v32 = v9;
    }
    else {
      CGFloat v32 = v8;
    }
    CGRect v39 = CGRectInset(*(CGRect *)&v28, v32, 0.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    v39.origin.double x = v21;
    v39.origin.double y = v23;
    v39.size.double width = v25;
    v39.size.double height = v27;
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    if (!CGRectEqualToRect(v39, v40)) {
      -[FMTitleView setFrame:](self, "setFrame:", x, y, width, height);
    }
  }
}

@end