@interface _UIScreenRouteSelectionTableViewController
- (_UIRouteSelectionTableViewControllerDelegate)delegate;
- (_UIScreenRouteSelectionTableViewController)init;
- (_UIScreenRouteSelectionTableViewController)initWithCoder:(id)a3;
- (_UIScreenRouteSelectionTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIScreenRouteSelectionTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)pid;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setPid:(int)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePreferredContentSize;
- (void)updateSearchResults:(id)a3 changes:(id)a4;
@end

@implementation _UIScreenRouteSelectionTableViewController

- (_UIScreenRouteSelectionTableViewController)initWithStyle:(int64_t)a3
{
  return [(_UIScreenRouteSelectionTableViewController *)self init];
}

- (_UIScreenRouteSelectionTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(_UIScreenRouteSelectionTableViewController *)self init];
}

- (_UIScreenRouteSelectionTableViewController)initWithCoder:(id)a3
{
  return [(_UIScreenRouteSelectionTableViewController *)self init];
}

- (_UIScreenRouteSelectionTableViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)_UIScreenRouteSelectionTableViewController;
  v2 = [(_UIScreenRouteSelectionTableViewController *)&v11 initWithStyle:0];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"AirPlay[nav bar title]" value:@"AirPlay" table:@"Localizable"];
    [(_UIScreenRouteSelectionTableViewController *)v2 setTitle:v4];

    v5 = [[_UIScreenRouteArrayController alloc] initWithDelegate:v2];
    arrayController = v2->_arrayController;
    v2->_arrayController = v5;

    v7 = [(_UIScreenRouteSelectionTableViewController *)v2 tableView];
    [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"regular"];

    v8 = [(_UIScreenRouteSelectionTableViewController *)v2 tableView];
    v9 = [v8 layer];
    [v9 setHitTestsAsOpaque:1];

    [(_UIScreenRouteSelectionTableViewController *)v2 updatePreferredContentSize];
  }
  return v2;
}

- (void)setPid:(int)a3
{
}

- (int)pid
{
  return [(_UIScreenRouteArrayController *)self->_arrayController pid];
}

- (void)invalidate
{
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F90;
  block[3] = &unk_1000083D0;
  block[4] = self;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateSearchResults:(id)a3 changes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
    [v8 beginUpdates];

    id v9 = [v6 array];
    availableRoutes = self->_availableRoutes;
    self->_availableRoutes = v9;

    objc_super v11 = [v7 objectForKey:_UIArrayControllerInsertedIndexPaths];
    if (v11)
    {
      v12 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
      [v12 insertRowsAtIndexPaths:v11 withRowAnimation:100];
    }
    v13 = [v7 objectForKey:_UIArrayControllerDeletedIndexPaths];

    if (v13)
    {
      v14 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
      [v14 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
    }
    v15 = [v7 objectForKey:_UIArrayControllerModifiedAttributesIndexPathsKey];

    if (v15)
    {
      v16 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
      [v16 insertRowsAtIndexPaths:v15 withRowAnimation:100];

      v17 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
      [v17 deleteRowsAtIndexPaths:v15 withRowAnimation:100];
    }
    v18 = [v7 objectForKey:_UIArrayControllerMovedIndexPaths];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000051E8;
    v22[3] = &unk_1000083F8;
    v22[4] = self;
    [v18 enumerateKeysAndObjectsUsingBlock:v22];

    v19 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
    [v19 endUpdates];
  }
  else
  {
    v20 = [v6 array];
    v21 = self->_availableRoutes;
    self->_availableRoutes = v20;

    v15 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
    [v15 reloadData];
  }

  [(_UIScreenRouteSelectionTableViewController *)self updatePreferredContentSize];
}

- (void)updatePreferredContentSize
{
  v3 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
  [v3 layoutIfNeeded];

  NSUInteger v4 = [(NSArray *)self->_availableRoutes count];
  if (v4 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = v4;
  }
  if (v5 >= 8) {
    unint64_t v5 = 8;
  }
  id v12 = +[NSIndexPath indexPathForItem:v5 - 1 inSection:0];
  id v6 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
  [v6 rowHeight];
  double v8 = v7;

  id v9 = [(_UIScreenRouteSelectionTableViewController *)self tableView];
  [v9 rectForRowAtIndexPath:v12];
  double MaxY = CGRectGetMaxY(v14);

  if (v8 >= MaxY) {
    double v11 = v8;
  }
  else {
    double v11 = MaxY;
  }
  -[_UIScreenRouteSelectionTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v11);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_availableRoutes count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"regular" forIndexPath:v6];
  availableRoutes = self->_availableRoutes;
  id v9 = [v6 row];

  id v10 = [(NSArray *)availableRoutes objectAtIndex:v9];
  double v11 = [(_UIScreenRouteSelectionTableViewController *)self traitCollection];
  id v12 = [v10 displayTitleForTraits:v11];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  CGRect v14 = [(_UIScreenRouteSelectionTableViewController *)self traitCollection];
  v15 = [v10 imageForTraits:v14];
  v16 = [v15 imageWithRenderingMode:2];
  v17 = [v7 imageView];
  [v17 setImage:v16];

  v18 = +[UIColor labelColor];
  v19 = [v7 imageView];
  [v19 setTintColor:v18];

  v20 = [v7 imageView];
  [v20 setContentMode:4];

  if ([v10 isSelected]) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 0;
  }
  [v7 setAccessoryType:v21];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndex:](self->_availableRoutes, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(_UIScreenRouteArrayController *)self->_arrayController selectRoute:v6];
  unint64_t v5 = [(_UIScreenRouteSelectionTableViewController *)self delegate];
  [v5 routeSelectionTableViewControllerSelectedRoute:self];
}

- (_UIRouteSelectionTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIRouteSelectionTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableRoutes, 0);

  objc_storeStrong((id *)&self->_arrayController, 0);
}

@end