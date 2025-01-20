@interface AXUIActiveWindow
- (BOOL)_accessibilityWindowVisible;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation AXUIActiveWindow

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(AXUIActiveWindow *)self rootViewController];
  v9 = [v8 view];

  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  v10 = objc_msgSend(v9, "hitTest:withEvent:", v7);

  if (v10 == v9)
  {
    BOOL v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXUIActiveWindow;
    BOOL v11 = -[AXUIActiveWindow pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }

  return v11;
}

- (BOOL)_accessibilityWindowVisible
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

@end