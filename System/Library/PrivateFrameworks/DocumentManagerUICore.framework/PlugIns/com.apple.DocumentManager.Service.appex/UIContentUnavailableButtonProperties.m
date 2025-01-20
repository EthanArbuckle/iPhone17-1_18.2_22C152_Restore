@interface UIContentUnavailableButtonProperties
- (id)asDOC;
@end

@implementation UIContentUnavailableButtonProperties

- (id)asDOC
{
  return +[DOCUIContentUnavailableShim instanceWrappingImpl:self];
}

@end