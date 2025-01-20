@interface STSearchListController
- (int64_t)tableViewStyle;
- (void)searchButtonPressed;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STSearchListController

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [(STSearchListController *)self indexForIndexPath:a4];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    v7 = [(STSearchListController *)self parentController];
    v8 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v6];
    v9 = [(STSearchListController *)self selectSpecifier:v8];
    if (v9)
    {
      v10 = [(STSearchListController *)self presentingViewController];
      [v7 showController:v9 animate:0];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_D5AC;
      v11[3] = &unk_2CA28;
      id v12 = v9;
      id v13 = v7;
      [v10 dismissViewControllerAnimated:1 completion:v11];
    }
  }
}

- (void)searchButtonPressed
{
  id v5 = [(STSearchListController *)self table];
  if ([v5 numberOfSections] == (char *)&dword_0 + 1
    && [v5 numberOfRowsInSection:0] == (char *)&dword_0 + 1)
  {
    v3 = [(STSearchListController *)self table];
    v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
    [(STSearchListController *)self tableView:v3 didSelectRowAtIndexPath:v4];
  }
}

- (int64_t)tableViewStyle
{
  return 0;
}

@end