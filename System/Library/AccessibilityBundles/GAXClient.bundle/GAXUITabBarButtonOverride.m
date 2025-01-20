@interface GAXUITabBarButtonOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation GAXUITabBarButtonOverride

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = +[GAXClient sharedInstance];
  unsigned int v9 = [v8 serverMode];

  if (v9 == 2)
  {
    v10 = [(GAXUITabBarButtonOverride *)self safeValueForKey:@"bounds"];
    [v10 CGRectValue];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v24.origin.double x = v12;
    v24.origin.double y = v14;
    v24.size.width = v16;
    v24.size.height = v18;
    v23.double x = x;
    v23.double y = y;
    BOOL v19 = CGRectContainsPoint(v24, v23);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)GAXUITabBarButtonOverride;
    BOOL v19 = -[GAXUITabBarButtonOverride pointInside:withEvent:](&v22, "pointInside:withEvent:", v7, x, y);
  }
  BOOL v20 = v19;

  return v20;
}

@end