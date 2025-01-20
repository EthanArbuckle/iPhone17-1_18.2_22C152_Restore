@interface UIContentUnavailableConfigurationState
- (id)asDOC;
@end

@implementation UIContentUnavailableConfigurationState

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:self];
}

@end