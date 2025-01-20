@interface UIViewController(AdaptiveModalPresentation)
- (uint64_t)showAdaptively:()AdaptiveModalPresentation sender:;
@end

@implementation UIViewController(AdaptiveModalPresentation)

- (uint64_t)showAdaptively:()AdaptiveModalPresentation sender:
{
  return objc_msgSend(a1, "_hk_showAdaptively:sender:animated:", a3, a4, 1);
}

@end