@interface UIView(FBKUtils)
- (id)superviewWithClass:()FBKUtils;
@end

@implementation UIView(FBKUtils)

- (id)superviewWithClass:()FBKUtils
{
  uint64_t v1 = [a1 superview];
  if (v1)
  {
    v2 = (void *)v1;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = [v2 superview];

      v2 = v3;
      if (!v3)
      {
        id v4 = 0;
        goto LABEL_8;
      }
    }
    id v4 = v2;
    v3 = v4;
  }
  else
  {
    id v4 = 0;
    v3 = 0;
  }
LABEL_8:

  return v4;
}

@end