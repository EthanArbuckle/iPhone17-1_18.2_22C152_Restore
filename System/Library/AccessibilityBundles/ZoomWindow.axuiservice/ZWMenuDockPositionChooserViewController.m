@interface ZWMenuDockPositionChooserViewController
- (NSArray)dockPositionIdentifiers;
- (ZWMenuDockPositionChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDockPositionIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZWMenuDockPositionChooserViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)ZWMenuDockPositionChooserViewController;
  [(ZWMenuChooserTableViewController *)&v5 loadView];
  v3 = AXZoomDockPositions();
  v4 = [v3 array];
  [(ZWMenuDockPositionChooserViewController *)self setDockPositionIdentifiers:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ZWMenuDockPositionChooserViewController;
  id v6 = a4;
  [(ZWMenuChooserTableViewController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(ZWMenuDockPositionChooserViewController *)self delegate];
  v8 = [(ZWMenuDockPositionChooserViewController *)self dockPositionIdentifiers];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];
  [v7 menuDockPositionChooserViewController:self didChooseDockPosition:v10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(ZWMenuDockPositionChooserViewController *)self dockPositionIdentifiers];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)ZWMenuDockPositionChooserViewController;
  id v6 = a4;
  v7 = [(ZWMenuChooserTableViewController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = [(ZWMenuDockPositionChooserViewController *)self dockPositionIdentifiers];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  objc_super v11 = AXUILocalizedTitleForDockPosition();
  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = [v7 textLabel];
  [v13 setTextAlignment:4];

  v14 = +[AXSettings sharedInstance];
  v15 = [v14 zoomPreferredCurrentDockPosition];

  if ([v15 isEqualToString:v10]) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [v7 setAccessoryType:v16];

  return v7;
}

- (ZWMenuDockPositionChooserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWMenuDockPositionChooserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dockPositionIdentifiers
{
  return self->_dockPositionIdentifiers;
}

- (void)setDockPositionIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockPositionIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end