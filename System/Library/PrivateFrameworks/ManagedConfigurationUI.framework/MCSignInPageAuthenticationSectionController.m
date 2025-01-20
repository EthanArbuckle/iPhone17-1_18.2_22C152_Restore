@interface MCSignInPageAuthenticationSectionController
- (AKInlineSignInViewController)inlineSignInViewController;
- (MCSignInPageAuthenticationCell)cell;
- (double)authSectionHeight;
- (double)heightForHeader;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)registerCellClassWithTableView:(id)a3;
- (void)setAuthSectionHeight:(double)a3;
- (void)setCell:(id)a3;
- (void)setInlineSignInViewController:(id)a3;
@end

@implementation MCSignInPageAuthenticationSectionController

- (void)registerCellClassWithTableView:(id)a3
{
  v4 = [(MCSignInPageAuthenticationSectionController *)self inlineSignInViewController];
  v5 = [v4 view];
  [v5 sizeToFit];

  id v7 = [(MCSignInPageAuthenticationSectionController *)self inlineSignInViewController];
  v6 = [v7 view];
  [v6 frame];
  [(MCSignInPageAuthenticationSectionController *)self setAuthSectionHeight:CGRectGetHeight(v9)];
}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)titleForHeader
{
  return 0;
}

- (double)heightForHeader
{
  return 10.0;
}

- (MCSignInPageAuthenticationCell)cell
{
  cell = self->_cell;
  if (!cell)
  {
    v4 = [MCSignInPageAuthenticationCell alloc];
    v5 = [(MCSignInPageAuthenticationSectionController *)self inlineSignInViewController];
    v6 = [v5 view];
    id v7 = [(MCSignInPageAuthenticationCell *)v4 initWithAuthView:v6];
    v8 = self->_cell;
    self->_cell = v7;

    cell = self->_cell;
  }
  return cell;
}

- (AKInlineSignInViewController)inlineSignInViewController
{
  inlineSignInViewController = self->_inlineSignInViewController;
  if (!inlineSignInViewController)
  {
    v4 = objc_opt_new();
    [v4 setWantsAuthenticationProgress:1];
    [v4 setSecondaryButtonTitle:0];
    [v4 setTertiaryButtonTitle:0];
    v5 = self->_inlineSignInViewController;
    self->_inlineSignInViewController = (AKInlineSignInViewController *)v4;

    inlineSignInViewController = self->_inlineSignInViewController;
  }
  return inlineSignInViewController;
}

- (void)setInlineSignInViewController:(id)a3
{
}

- (void)setCell:(id)a3
{
}

- (double)authSectionHeight
{
  return self->_authSectionHeight;
}

- (void)setAuthSectionHeight:(double)a3
{
  self->_authSectionHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_inlineSignInViewController, 0);
}

@end