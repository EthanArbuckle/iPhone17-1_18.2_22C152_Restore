@interface UIView(APUIWidgetAdditions)
- (id)apuiFindInnermostSuperviewOfClass:()APUIWidgetAdditions;
@end

@implementation UIView(APUIWidgetAdditions)

- (id)apuiFindInnermostSuperviewOfClass:()APUIWidgetAdditions
{
  if (objc_opt_isKindOfClass())
  {
    id v5 = a1;
  }
  else
  {
    v6 = [a1 superview];
    id v5 = [v6 apuiFindInnermostSuperviewOfClass:a3];
  }
  return v5;
}

@end