@interface HSUserListViewController
- (BOOL)_isUserListEmpty;
- (HMHome)home;
- (HSUserListViewController)init;
- (HSUserListViewControllerDelegate)delegate;
- (HUUserListTableManager)tableViewManager;
- (void)_doneTapped;
- (void)_updateEditButton;
- (void)managerDidCancelInvite:(id)a3 error:(id)a4;
- (void)managerDidDismissWithError:(id)a3;
- (void)managerDidRemoveUser:(id)a3 error:(id)a4;
- (void)managerDidSendInvitations:(id)a3;
- (void)managerDidUpdateUserList;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHome:(id)a3;
- (void)setTableViewManager:(id)a3;
- (void)updateHome:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSUserListViewController

- (HSUserListViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HSUserListViewController;
  v2 = [(HSUserListViewController *)&v8 initWithStyle:1];
  if (v2)
  {
    id v3 = objc_alloc((Class)HUUserListTableManager);
    v4 = [(HSUserListViewController *)v2 tableView];
    v5 = (HUUserListTableManager *)[v3 initWithTableView:v4 viewController:v2];
    tableViewManager = v2->_tableViewManager;
    v2->_tableViewManager = v5;

    [(HUUserListTableManager *)v2->_tableViewManager setDelegate:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HSUserListViewController;
  [(HSUserListViewController *)&v5 viewDidLoad];
  [(HSUserListViewController *)self setEdgesForExtendedLayout:0];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneTapped"];
  v4 = [(HSUserListViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSUserListViewController;
  [(HSUserListViewController *)&v12 setEditing:a3 animated:a4];
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100048984;
    v11[3] = &unk_1000A90B0;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100048A00;
    v10[3] = &unk_1000AAE50;
    v10[4] = self;
    +[UIView animateWithDuration:v11 animations:v10 completion:0.3];
  }
  else
  {
    v6 = [(HSUserListViewController *)self navigationItem];
    v7 = [v6 leftBarButtonItem];
    [v7 setEnabled:1];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100048A60;
    v9[3] = &unk_1000A90B0;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.3];
  }
  objc_super v8 = [(HSUserListViewController *)self tableViewManager];
  [v8 setEditing:v4];
}

- (HMHome)home
{
  v2 = [(HSUserListViewController *)self tableViewManager];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (void)setHome:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HSUserListViewController *)self tableViewManager];
  [v5 setHome:v4];

  id v7 = [v4 name];

  if (v7)
  {
    [(HSUserListViewController *)self setTitle:v7];
  }
  else
  {
    v6 = sub_100060C64(@"HSUserManagementSharingTitle");
    [(HSUserListViewController *)self setTitle:v6];
  }
}

- (void)updateHome:(id)a3
{
  [(HSUserListViewController *)self setHome:a3];

  [(HSUserListViewController *)self _updateEditButton];
}

- (void)managerDidDismissWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HSUserListViewController *)self delegate];
  [v5 controllerDidDismissWithError:v4];
}

- (void)managerDidSendInvitations:(id)a3
{
  id v4 = a3;
  id v5 = [(HSUserListViewController *)self delegate];
  [v5 controllerDidSendInvitations:v4];
}

- (void)managerDidUpdateUserList
{
}

- (void)managerDidRemoveUser:(id)a3 error:(id)a4
{
  if ([(HSUserListViewController *)self _isUserListEmpty]
    && [(HSUserListViewController *)self isEditing])
  {
    [(HSUserListViewController *)self setEditing:0 animated:1];
  }
}

- (void)managerDidCancelInvite:(id)a3 error:(id)a4
{
  if ([(HSUserListViewController *)self _isUserListEmpty]
    && [(HSUserListViewController *)self isEditing])
  {
    [(HSUserListViewController *)self setEditing:0 animated:1];
  }
}

- (void)_doneTapped
{
  id v2 = [(HSUserListViewController *)self delegate];
  [v2 controllerDidDismissWithError:0];
}

- (BOOL)_isUserListEmpty
{
  id v3 = [(HSUserListViewController *)self tableViewManager];
  id v4 = [v3 users];
  if ([v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [(HSUserListViewController *)self tableViewManager];
    id v7 = [v6 invitations];
    BOOL v5 = [v7 count] == 0;
  }
  return v5;
}

- (void)_updateEditButton
{
  id v4 = [(HSUserListViewController *)self navigationItem];
  if ([(HSUserListViewController *)self _isUserListEmpty])
  {
    [v4 setRightBarButtonItem:0 animated:1];
  }
  else
  {
    id v3 = [(HSUserListViewController *)self editButtonItem];
    [v4 setRightBarButtonItem:v3 animated:1];
  }
}

- (HSUserListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSUserListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUUserListTableManager)tableViewManager
{
  return self->_tableViewManager;
}

- (void)setTableViewManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end