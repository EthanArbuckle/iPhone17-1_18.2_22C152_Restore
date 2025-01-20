@interface CAMDrawerSmartStyleResetButton
- (id)accessibilityIdentifier;
- (id)imageNameForCurrentState;
@end

@implementation CAMDrawerSmartStyleResetButton

- (id)imageNameForCurrentState
{
  return @"arrow.counterclockwise";
}

- (id)accessibilityIdentifier
{
  return @"SmartStyleResetButton";
}

@end