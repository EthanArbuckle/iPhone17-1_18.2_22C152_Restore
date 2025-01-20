@interface DDReminderViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)title;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)prepareForAction:(id)a3;
- (void)setCancellable:(BOOL)a3;
@end

@implementation DDReminderViewController

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
  v13 = self;
  SEL v12 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1000108B4;
  v8 = &unk_1000209C0;
  id v9 = location;
  v10[0] = v13;
  v10[1] = (id)v12;
  dispatch_async(queue, &v4);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (id)title
{
  int v5 = [(DDReminderCreationController *)self->_reminderDelegate title];
  int v6 = [(NSAttributedString *)v5 string];
  if (v6) {
    v2 = v6;
  }
  else {
    v2 = &stru_100020FA8;
  }
  v4 = v2;

  return v4;
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (void)setCancellable:(BOOL)a3
{
  v4  = a3;
  v3  = [(DDReminderViewController *)self _remoteViewControllerProxy];
  [v3 actionCanBeCancelledExternally:v4];
}

- (void).cxx_destruct
{
}

@end