@interface DDEventAddViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (DDAction)action;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)doneWithAddingEvent;
- (void)icsPreviewControllerWantsDismissal:(id)a3;
- (void)prepareForAction:(id)a3;
- (void)setAction:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDEventAddViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (void)prepareForAction:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = objc_alloc_init((Class)EKEventStore);
  id v3 = v12;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100009E24;
  v8 = &unk_100020858;
  id v9 = location[0];
  id v10 = v12;
  v11 = v14;
  [v3 requestFullAccessToEventsWithCompletion:];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(DDEventAddViewController *)self _remoteViewControllerProxy];
  [v3 actionCanBeCancelledExternally:v4];
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (void)doneWithAddingEvent
{
  [(DDEventAddViewController *)self setCancellable:1];
  v2  = [(DDEventAddViewController *)self _remoteViewControllerProxy];
  [v2 actionDidFinishShouldDismiss:1];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v19  = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  v17  = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver  = v19;
  v16.super_class  = (Class)DDEventAddViewController;
  [(DDEventAddViewController *)&v16 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v17];
  id v6 = [location[0] verticalSizeClass];
  v7  = [(DDEventAddViewController *)v19 traitCollection];
  v8  = v6 == [v7 verticalSizeClass];

  if (!v8)
  {
    id v4 = v17;
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    v11  = 0;
    id v12 = sub_10000A73C;
    v13  = &unk_100020880;
    v14  = location[0];
    v15  = v17;
    [v4 animateAlongsideTransition:&v9];
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  id v4 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  [(DDEventAddViewController *)v4 doneWithAddingEvent];
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end