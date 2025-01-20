@interface UIViewController(PocketAdditions)
- (id)hu_pocketedContainerViewController;
@end

@implementation UIViewController(PocketAdditions)

- (id)hu_pocketedContainerViewController
{
  objc_opt_class();
  v2 = [a1 parentViewController];
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

@end