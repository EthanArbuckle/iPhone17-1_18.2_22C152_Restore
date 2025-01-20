@interface HUTableViewDiffableDataSource
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (HUTableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 delegate:(id)a5;
- (HUTableViewDiffableDataSourceDelegate)delegate;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation HUTableViewDiffableDataSource

- (HUTableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 delegate:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a4;
  id v10 = a3;
  objc_storeWeak((id *)p_delegate, a5);
  v13.receiver = self;
  v13.super_class = (Class)HUTableViewDiffableDataSource;
  v11 = [(UITableViewDiffableDataSource *)&v13 initWithTableView:v10 cellProvider:v9];

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HUTableViewDiffableDataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(HUTableViewDiffableDataSource *)self delegate];
    id v10 = [v9 tableView:v6 titleForHeaderInSection:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HUTableViewDiffableDataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(HUTableViewDiffableDataSource *)self delegate];
    id v10 = [v9 tableView:v6 titleForFooterInSection:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUTableViewDiffableDataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HUTableViewDiffableDataSource *)self delegate];
    char v11 = [v10 tableView:v6 canEditRowAtIndexPath:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUTableViewDiffableDataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HUTableViewDiffableDataSource *)self delegate];
    char v11 = [v10 tableView:v6 canMoveRowAtIndexPath:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  char v9 = [(HUTableViewDiffableDataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(HUTableViewDiffableDataSource *)self delegate];
    [v11 tableView:v12 commitEditingStyle:a4 forRowAtIndexPath:v8];
  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [(HUTableViewDiffableDataSource *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(HUTableViewDiffableDataSource *)self delegate];
    [v12 tableView:v13 moveRowAtIndexPath:v8 toIndexPath:v9];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_tableView_commitEditingStyle_forRowAtIndexPath_ == a3)
  {
    v4 = [(HUTableViewDiffableDataSource *)self delegate];
    unsigned __int8 v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUTableViewDiffableDataSource;
    unsigned __int8 v3 = [(HUTableViewDiffableDataSource *)&v6 respondsToSelector:a3];
  }
  return v3 & 1;
}

- (HUTableViewDiffableDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTableViewDiffableDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end