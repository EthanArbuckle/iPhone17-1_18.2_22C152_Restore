@interface GAXUINavigationBarOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)backButtonViewAtPoint:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation GAXUINavigationBarOverride

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)backButtonViewAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)GAXUINavigationBarOverride;
  v5 = -[GAXUINavigationBarOverride backButtonViewAtPoint:](&v9, "backButtonViewAtPoint:");
  v6 = +[GAXClient sharedInstance];
  unsigned int v7 = [v6 serverMode];

  if (v7 == 2)
  {
    [v5 frame];
    v11.CGFloat x = x;
    v11.CGFloat y = y;
    if (!CGRectContainsPoint(v12, v11))
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  v18.receiver = self;
  v18.super_class = (Class)GAXUINavigationBarOverride;
  -[GAXUINavigationBarOverride hitTest:withEvent:](&v18, "hitTest:withEvent:", a4);
  unsigned int v7 = (GAXUINavigationBarOverride *)objc_claimAutoreleasedReturnValue();
  v8 = +[GAXClient sharedInstance];
  unsigned int v9 = [v8 serverMode];

  BOOL v11 = v9 != 2 || v7 == 0 || v7 == v6;
  if (v11
    || (-[GAXUINavigationBarOverride convertPoint:toView:](v6, "convertPoint:toView:", v7, x, y),
        CGFloat v13 = v12,
        CGFloat v15 = v14,
        [(GAXUINavigationBarOverride *)v7 bounds],
        v19.double x = v13,
        v19.double y = v15,
        CGRectContainsPoint(v20, v19)))
  {
    v6 = v7;
  }
  v16 = v6;

  return v16;
}

@end