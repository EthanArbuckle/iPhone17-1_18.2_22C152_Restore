@interface FATableViewDecorator
- (BOOL)respondsToSelector:(SEL)a3;
- (FATableViewDecorator)initWithTableView:(id)a3;
- (FATableViewProtocol)tableView;
- (UITableViewDataSource)dataSource;
- (UITableViewDelegate)delegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)reloadData;
- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation FATableViewDecorator

- (FATableViewDecorator)initWithTableView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FATableViewDecorator;
  v6 = [(FATableViewDecorator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    v8 = [v5 dataSource];
    objc_storeWeak((id *)&v7->_dataSource, v8);

    v9 = [v5 delegate];
    objc_storeWeak((id *)&v7->_delegate, v9);

    [(FATableViewProtocol *)v7->_tableView setDelegate:v7];
    [(FATableViewProtocol *)v7->_tableView setDataSource:v7];
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    || (p_dataSource = &self->_delegate,
        id v7 = objc_loadWeakRetained((id *)&self->_delegate),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FATableViewDecorator;
  if (-[FATableViewDecorator respondsToSelector:](&v9, sel_respondsToSelector_)
    || (id v4 = objc_loadWeakRetained((id *)&self->_dataSource),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    char v6 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();
  }
  return v6 & 1;
}

- (void)reloadData
{
}

- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  int64_t v8 = [WeakRetained tableView:v6 numberOfRowsInSection:a4];

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_super v9 = [WeakRetained tableView:v7 cellForRowAtIndexPath:v6];

  return v9;
}

- (UITableViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (UITableViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (UITableViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITableViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FATableViewProtocol)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end