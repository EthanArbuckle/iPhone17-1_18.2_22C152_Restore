@interface UIViewController(_MKUIViewControllerContent)
- (double)contentAlpha;
- (id)accessibilityIdentifier;
- (uint64_t)contentVisibility;
- (void)setAccessibilityIdentifier:()_MKUIViewControllerContent;
- (void)setContentAlpha:()_MKUIViewControllerContent;
- (void)setContentVisibility:()_MKUIViewControllerContent;
@end

@implementation UIViewController(_MKUIViewControllerContent)

- (void)setAccessibilityIdentifier:()_MKUIViewControllerContent
{
  id v5 = a3;
  if ([a1 isViewLoaded])
  {
    v4 = [a1 view];
    [v4 setAccessibilityIdentifier:v5];
  }
}

- (id)accessibilityIdentifier
{
  if ([a1 isViewLoaded])
  {
    v2 = [a1 view];
    v3 = [v2 accessibilityIdentifier];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (double)contentAlpha
{
  v1 = [a1 view];
  [v1 alpha];
  double v3 = v2;

  return v3;
}

- (void)setContentAlpha:()_MKUIViewControllerContent
{
  id v3 = [a1 view];
  [v3 setAlpha:a2];
}

- (uint64_t)contentVisibility
{
  v1 = objc_getAssociatedObject(a1, &_MKContentVisibilityKey);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setContentVisibility:()_MKUIViewControllerContent
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_MKContentVisibilityKey, v2, (void *)0x301);
}

@end