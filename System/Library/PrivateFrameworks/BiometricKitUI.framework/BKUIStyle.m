@interface BKUIStyle
+ (UIEdgeInsets)_layoutMarginsForPearEnrollView;
+ (UIEdgeInsets)_obkStyleButtonMarginsForParentBounds:(CGRect)a3;
+ (double)_buttonSizeForPads;
+ (id)sharedStyle;
@end

@implementation BKUIStyle

+ (id)sharedStyle
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___BKUIStyle;
  v2 = objc_msgSendSuper2(&v4, sel_sharedStyle);

  return v2;
}

+ (UIEdgeInsets)_layoutMarginsForPearEnrollView
{
  v2 = +[BKUIDevice sharedInstance];
  char v3 = [v2 isIdiomPad];

  if (v3)
  {
    double v4 = 88.0;
  }
  else
  {
    v5 = +[BKUIDevice sharedInstance];
    if ([v5 isD32Sized])
    {

      double v4 = 24.0;
    }
    else
    {
      v6 = +[BKUIDevice sharedInstance];
      int v7 = [v6 isN84];

      double v4 = 24.0;
      if (!v7) {
        double v4 = 44.0;
      }
    }
  }
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v4;
  result.right = v10;
  result.bottom = v9;
  result.left = v4;
  result.top = v8;
  return result;
}

+ (UIEdgeInsets)_obkStyleButtonMarginsForParentBounds:(CGRect)a3
{
  double v4 = +[BKUIDevice sharedInstance];
  char v5 = [v4 isIdiomPad];

  if (v5)
  {
    double v6 = 0.0;
    double v7 = 132.0;
    double v8 = 132.0;
    double v9 = 0.0;
  }
  else
  {
    [a1 _layoutMarginsForPearEnrollView];
  }
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

+ (double)_buttonSizeForPads
{
  return 360.0;
}

@end