@interface UITab
- (NSString)playActivityFeatureName;
@end

@implementation UITab

- (NSString)playActivityFeatureName
{
  return (NSString *)@objc UIViewController.playActivityFeatureName.getter(self, (uint64_t)a2, (void (*)(void))UITab.playActivityFeatureName.getter);
}

@end