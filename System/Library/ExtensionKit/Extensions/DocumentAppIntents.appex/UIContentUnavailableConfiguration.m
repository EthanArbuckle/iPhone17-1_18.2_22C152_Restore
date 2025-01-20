@interface UIContentUnavailableConfiguration
- (id)asDOC;
@end

@implementation UIContentUnavailableConfiguration

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:self];
}

@end