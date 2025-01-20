@interface CKNavigationBar
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CKNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  v12.receiver = self;
  v12.super_class = (Class)CKNavigationBar;
  -[CKNavigationBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  v7 = (CKNavigationBar *)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    if (objc_opt_respondsToSelector())
    {
      v8 = -[CKNavigationBar backButtonViewAtPoint:](v6, "backButtonViewAtPoint:", x, y);

      v9 = [(CKNavigationBar *)v6 topItem];
      if (v8)
      {
LABEL_8:

        v7 = v6;
        goto LABEL_9;
      }
    }
    else
    {
      v9 = [(CKNavigationBar *)v6 topItem];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 contentScrollView];

      v6 = (CKNavigationBar *)v10;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

@end