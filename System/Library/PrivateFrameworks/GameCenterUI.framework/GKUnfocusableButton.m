@interface GKUnfocusableButton
- (BOOL)canBecomeFocused;
@end

@implementation GKUnfocusableButton

- (BOOL)canBecomeFocused
{
  return 0;
}

@end