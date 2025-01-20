@interface CSSystemButtonQuickAction
- (BOOL)isSelected;
- (id)_buttonViewModel;
- (id)accessibilityIdentifier;
- (id)actionIdentifier;
@end

@implementation CSSystemButtonQuickAction

- (id)actionIdentifier
{
  v2 = NSString;
  v3 = [(CSSystemQuickAction *)self viewModel];
  v4 = [v3 title];
  v5 = [v2 stringWithFormat:@"CSSystemButtonQuickAction%@", v4];

  return v5;
}

- (id)accessibilityIdentifier
{
  v3 = [(CSSystemQuickAction *)self viewModel];
  v4 = [v3 accessibilityIdentifier];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = NSString;
    v7 = [(CSSystemQuickAction *)self controlIdentity];
    v8 = [v7 kind];
    id v5 = [v6 stringWithFormat:@"system-orb-button-%@", v8];
  }

  return v5;
}

- (BOOL)isSelected
{
  v2 = [(CSSystemButtonQuickAction *)self _buttonViewModel];
  char v3 = [v2 isAnimating];

  return v3;
}

- (id)_buttonViewModel
{
  v2 = [(CSSystemQuickAction *)self controlInstance];
  char v3 = [v2 viewModel];

  return v3;
}

@end