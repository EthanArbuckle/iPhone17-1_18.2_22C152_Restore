@interface GKDashboardFocusContainerView
- (BOOL)canBecomeFocused;
- (UIView)focusView;
- (id)preferredFocusEnvironments;
- (void)setFocusView:(id)a3;
@end

@implementation GKDashboardFocusContainerView

- (BOOL)canBecomeFocused
{
  return [(UIView *)self->_focusView canBecomeFocused];
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_focusView)
  {
    v4[0] = self->_focusView;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
  self->_focusView = (UIView *)a3;
}

@end