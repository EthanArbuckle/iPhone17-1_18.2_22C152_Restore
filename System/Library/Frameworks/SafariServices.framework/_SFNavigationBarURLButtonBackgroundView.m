@interface _SFNavigationBarURLButtonBackgroundView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _SFNavigationBarURLButtonBackgroundView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFNavigationBarURLButtonBackgroundView;
    BOOL v5 = [(_SFNavigationBarURLButtonBackgroundView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end