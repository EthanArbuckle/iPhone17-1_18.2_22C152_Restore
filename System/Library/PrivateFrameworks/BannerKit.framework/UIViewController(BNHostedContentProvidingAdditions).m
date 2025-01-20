@interface UIViewController(BNHostedContentProvidingAdditions)
- (double)bannerContentOutsets;
- (uint64_t)bannerSizeTransitionAnimationSettings;
- (uint64_t)bn_shouldAnimateViewTransitionToSize:()BNHostedContentProvidingAdditions;
- (uint64_t)isClippingEnabled;
@end

@implementation UIViewController(BNHostedContentProvidingAdditions)

- (double)bannerContentOutsets
{
  return *MEMORY[0x1E4F437F8];
}

- (uint64_t)bannerSizeTransitionAnimationSettings
{
  return 0;
}

- (uint64_t)bn_shouldAnimateViewTransitionToSize:()BNHostedContentProvidingAdditions
{
  return 1;
}

- (uint64_t)isClippingEnabled
{
  return 1;
}

@end