@interface BSUIVibrancyAnimatingPortalView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation BSUIVibrancyAnimatingPortalView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"filters"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIVibrancyAnimatingPortalView;
    BOOL v5 = [(_UIPortalView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end