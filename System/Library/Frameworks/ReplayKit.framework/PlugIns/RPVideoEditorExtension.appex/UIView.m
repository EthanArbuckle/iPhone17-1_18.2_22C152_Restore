@interface UIView
+ (id)_srVideoOverlayButtonWithStyle:(int64_t)a3;
@end

@implementation UIView

+ (id)_srVideoOverlayButtonWithStyle:(int64_t)a3
{
  if (a3 == 2
    || !a3
    && (+[UIDevice currentDevice],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 _graphicsQuality],
        v4,
        v5 == (id)10))
  {
    v6 = off_1000183D0;
  }
  else
  {
    v6 = &off_1000183D8;
  }
  id v7 = [objc_alloc(*v6) initWithStyle:a3];

  return v7;
}

@end