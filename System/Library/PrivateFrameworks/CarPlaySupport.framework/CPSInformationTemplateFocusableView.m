@interface CPSInformationTemplateFocusableView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
@end

@implementation CPSInformationTemplateFocusableView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

@end