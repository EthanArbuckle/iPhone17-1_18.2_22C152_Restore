@interface ProxCardKitTestPasscodeEntryViewController
- (ProxCardKitTestPasscodeEntryViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
@end

@implementation ProxCardKitTestPasscodeEntryViewController

- (void)didCompleteTextEntry:(id)a3
{
  [(ProxCardKitTestPasscodeEntryViewController *)self showActivityIndicatorWithStatus:@"Waiting"];
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100129790;
  block[3] = &unk_1001A1BD8;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (ProxCardKitTestPasscodeEntryViewController)initWithContentView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ProxCardKitTestPasscodeEntryViewController;
  v3 = [(ProxCardKitTestPasscodeEntryViewController *)&v7 initWithContentView:a3];
  dispatch_time_t v4 = v3;
  if (v3)
  {
    [(ProxCardKitTestPasscodeEntryViewController *)v3 setTitle:@"Enter PIN"];
    [(ProxCardKitTestPasscodeEntryViewController *)v4 setSubtitle:@"Enter your four-digit PIN"];
    [(ProxCardKitTestPasscodeEntryViewController *)v4 setDismissalType:1];
    v5 = v4;
  }

  return v4;
}

@end