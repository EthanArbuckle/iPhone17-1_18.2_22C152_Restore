@interface UIView(EKUIViewHierarchy)
- (double)ekui_height;
- (double)ekui_size;
- (double)ekui_width;
- (uint64_t)ekui_horizontalSizeClass;
- (uint64_t)ekui_interfaceOrientation;
- (uint64_t)ekui_verticalSizeClass;
- (void)ekui_affineTransform;
@end

@implementation UIView(EKUIViewHierarchy)

- (double)ekui_size
{
  [a1 bounds];
  return v1;
}

- (uint64_t)ekui_horizontalSizeClass
{
  v2 = [a1 traitCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [a1 rootViewController];
    uint64_t v4 = objc_msgSend(v3, "ekui_futureTraitCollection");

    v2 = (void *)v4;
  }
  uint64_t v5 = [v2 horizontalSizeClass];

  return v5;
}

- (uint64_t)ekui_verticalSizeClass
{
  v2 = [a1 traitCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [a1 rootViewController];
    uint64_t v4 = objc_msgSend(v3, "ekui_futureTraitCollection");

    v2 = (void *)v4;
  }
  uint64_t v5 = [v2 verticalSizeClass];

  return v5;
}

- (double)ekui_width
{
  [a1 bounds];

  return CGRectGetWidth(*(CGRect *)&v1);
}

- (double)ekui_height
{
  [a1 bounds];

  return CGRectGetHeight(*(CGRect *)&v1);
}

- (uint64_t)ekui_interfaceOrientation
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = [a1 windowScene];
  uint64_t v3 = [v2 interfaceOrientation];

  return v3;
}

- (void)ekui_affineTransform
{
  uint64_t v3 = [a1 layer];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 affineTransform];
    uint64_t v3 = v4;
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
}

@end