@interface CPSInvisibleButton
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CPSInvisibleButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v10 = a3;
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (-[CPSInvisibleButton pointInside:withEvent:](v9, "pointInside:withEvent:", location[0], v10.x, v10.y))
  {
    v11 = v9;
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)CPSInvisibleButton;
    v11 = (CPSInvisibleButton *)-[CPSInvisibleButton hitTest:withEvent:](&v6, sel_hitTest_withEvent_, location[0], v10.x, v10.y);
  }
  int v7 = 1;
  objc_storeStrong(location, 0);
  v4 = v11;

  return v4;
}

@end