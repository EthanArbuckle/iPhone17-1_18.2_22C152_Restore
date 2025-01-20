@interface UIViewController(_CRKCardViewController)
- (uint64_t)_crk_isDescendantOfViewController:()_CRKCardViewController;
@end

@implementation UIViewController(_CRKCardViewController)

- (uint64_t)_crk_isDescendantOfViewController:()_CRKCardViewController
{
  id v4 = a3;
  id v5 = [a1 parentViewController];
  if (v5 == v4)
  {
    uint64_t v7 = 1;
  }
  else
  {
    v6 = [a1 parentViewController];
    uint64_t v7 = objc_msgSend(v6, "_crk_isDescendantOfViewController:", v4);
  }
  return v7;
}

@end