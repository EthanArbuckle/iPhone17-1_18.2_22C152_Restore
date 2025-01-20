@interface UIViewController(CNPeopleCardTransition)
- (id)_cardViewControllerTransitioning;
- (void)set_cardViewControllerTransitioning:()CNPeopleCardTransition;
@end

@implementation UIViewController(CNPeopleCardTransition)

- (id)_cardViewControllerTransitioning
{
  objc_getAssociatedObject(a1, "CardViewControllerTransitioning");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ([a1 conformsToProtocol:&unk_1ED944448]) {
      id v2 = a1;
    }
    else {
      id v2 = 0;
    }
  }

  return v2;
}

- (void)set_cardViewControllerTransitioning:()CNPeopleCardTransition
{
}

@end