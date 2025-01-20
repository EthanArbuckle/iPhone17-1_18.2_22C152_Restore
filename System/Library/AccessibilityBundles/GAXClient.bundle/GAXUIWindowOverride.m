@interface GAXUIWindowOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIColor)_gaxOriginalBackgroundColor;
- (id)_targetForStolenStatusBarTouchesAtPoint:(CGPoint)a3 withEvent:(id)a4 excludingWindow:(id)a5;
- (unint64_t)_gaxOverridingBackgroundColorToClearRequestsCount;
- (void)_gaxBeginOverridingBackgroundColorToClear;
- (void)_gaxEndOverridingBackgroundColorToClear;
- (void)_gaxSetOriginalBackgroundColor:(id)a3;
- (void)_gaxSetOverridingBackgroundColorToClearRequestsCount:(unint64_t)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation GAXUIWindowOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_gaxOverridingBackgroundColorToClearRequestsCount
{
  v2 = objc_getAssociatedObject(self, &unk_1BCA8);
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)_gaxSetOverridingBackgroundColorToClearRequestsCount:(unint64_t)a3
{
  if (a3)
  {
    a3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  id v4 = (id)a3;
  objc_setAssociatedObject(self, &unk_1BCA8, (id)a3, (char *)&dword_0 + 1);
}

- (UIColor)_gaxOriginalBackgroundColor
{
  return (UIColor *)objc_getAssociatedObject(self, &unk_1BCA9);
}

- (void)_gaxSetOriginalBackgroundColor:(id)a3
{
}

- (void)_gaxBeginOverridingBackgroundColorToClear
{
  unint64_t v3 = [(GAXUIWindowOverride *)self _gaxOverridingBackgroundColorToClearRequestsCount];
  [(GAXUIWindowOverride *)self _gaxSetOverridingBackgroundColorToClearRequestsCount:v3 + 1];
  if (!v3)
  {
    id v4 = [(GAXUIWindowOverride *)self backgroundColor];
    [(GAXUIWindowOverride *)self _gaxSetOriginalBackgroundColor:v4];

    v5 = +[UIColor clearColor];
    v6.receiver = self;
    v6.super_class = (Class)GAXUIWindowOverride;
    [(GAXUIWindowOverride *)&v6 setBackgroundColor:v5];
  }
}

- (void)_gaxEndOverridingBackgroundColorToClear
{
  unint64_t v3 = [(GAXUIWindowOverride *)self _gaxOverridingBackgroundColorToClearRequestsCount];
  if (v3)
  {
    unint64_t v4 = v3 - 1;
  }
  else
  {
    _AXAssert();
    unint64_t v4 = 0;
  }
  [(GAXUIWindowOverride *)self _gaxSetOverridingBackgroundColorToClearRequestsCount:v4];
  if (v3 <= 1)
  {
    v5 = [(GAXUIWindowOverride *)self _gaxOriginalBackgroundColor];
    v6.receiver = self;
    v6.super_class = (Class)GAXUIWindowOverride;
    [(GAXUIWindowOverride *)&v6 setBackgroundColor:v5];

    [(GAXUIWindowOverride *)self _gaxSetOriginalBackgroundColor:0];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if ([(GAXUIWindowOverride *)self _gaxOverridingBackgroundColorToClearRequestsCount])
  {
    [(GAXUIWindowOverride *)self _gaxSetOriginalBackgroundColor:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GAXUIWindowOverride;
    [(GAXUIWindowOverride *)&v5 setBackgroundColor:v4];
  }
}

- (id)_targetForStolenStatusBarTouchesAtPoint:(CGPoint)a3 withEvent:(id)a4 excludingWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v11 = +[GAXClient sharedInstance];
  unsigned int v12 = [v11 serverMode];

  if (v12 == 2)
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GAXUIWindowOverride;
    v13 = -[GAXUIWindowOverride _targetForStolenStatusBarTouchesAtPoint:withEvent:excludingWindow:](&v15, "_targetForStolenStatusBarTouchesAtPoint:withEvent:excludingWindow:", v9, v10, x, y);
  }

  return v13;
}

@end