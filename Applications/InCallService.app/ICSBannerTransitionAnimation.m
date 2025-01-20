@interface ICSBannerTransitionAnimation
+ (void)performBannerToFullScreenCrossFadeAnimationWithView:(id)a3;
- (ICSBannerTransitionAnimation)init;
@end

@implementation ICSBannerTransitionAnimation

+ (void)performBannerToFullScreenCrossFadeAnimationWithView:(id)a3
{
  id v3 = a3;
  sub_1001BFA00(v3);
}

- (ICSBannerTransitionAnimation)init
{
  return (ICSBannerTransitionAnimation *)sub_1001BFC14();
}

@end