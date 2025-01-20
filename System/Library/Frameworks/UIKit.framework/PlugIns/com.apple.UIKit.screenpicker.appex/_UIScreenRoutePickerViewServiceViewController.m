@interface _UIScreenRoutePickerViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_UIScreenRoutePickerViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)hostingViewController;
- (void)_disconnectRouteWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_prepareForDisplayWithCompletion:(id)a3;
- (void)_setCurrentOutputDeviceEnabled:(BOOL)a3 completion:(id)a4;
- (void)dismiss;
- (void)routeSelectionTableViewControllerSelectedRoute:(id)a3;
@end

@implementation _UIScreenRoutePickerViewServiceViewController

- (_UIScreenRoutePickerViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIScreenRoutePickerViewServiceViewController;
  v4 = [(_UIScreenRoutePickerViewServiceViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(_UIScreenRoutePickerViewServiceViewController *)v4 setNavigationBarHidden:1];
    v6 = objc_alloc_init(_UIScreenRouteSelectionTableViewController);
    routeSelectionTableViewController = v5->_routeSelectionTableViewController;
    v5->_routeSelectionTableViewController = v6;

    [(_UIScreenRouteSelectionTableViewController *)v5->_routeSelectionTableViewController setDelegate:v5];
    [(_UIScreenRoutePickerViewServiceViewController *)v5 pushViewController:v5->_routeSelectionTableViewController animated:0];
  }
  return v5;
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIScreenRoutePickerRemoteViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIScreenRoutePickerRemoteViewControllerHost];
}

- (void)dismiss
{
  id v2 = [(_UIScreenRoutePickerViewServiceViewController *)self hostingViewController];
  [v2 _dismissViewController];
}

- (void)_invalidate
{
}

- (id)hostingViewController
{
  return [(_UIScreenRoutePickerViewServiceViewController *)self _remoteViewControllerProxy];
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  [(_UIScreenRouteSelectionTableViewController *)self->_routeSelectionTableViewController setPid:[(_UIScreenRoutePickerViewServiceViewController *)self _hostProcessIdentifier]];
  [(_UIScreenRoutePickerViewServiceViewController *)self preferredContentSize];
  v4[2]();
}

- (void)routeSelectionTableViewControllerSelectedRoute:(id)a3
{
}

- (void)_disconnectRouteWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B78;
  block[3] = &unk_100008380;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_setCurrentOutputDeviceEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004CA4;
  block[3] = &unk_1000083A8;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void).cxx_destruct
{
}

@end