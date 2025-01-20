@interface _SFNavigationBarLabelsContainer
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _SFNavigationBarLabelsContainer

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"anchorPoint"])
  {
    unsigned __int8 shouldAnimateBoundsChanges = 1;
  }
  else if ([v4 isEqualToString:@"bounds"])
  {
    unsigned __int8 shouldAnimateBoundsChanges = self->_shouldAnimateBoundsChanges;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFNavigationBarLabelsContainer;
    unsigned __int8 shouldAnimateBoundsChanges = [(_SFNavigationBarLabelsContainer *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return shouldAnimateBoundsChanges;
}

@end