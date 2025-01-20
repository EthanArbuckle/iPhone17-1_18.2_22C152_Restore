@interface _BRShareOverviewActivityViewController
- (BOOL)configureForCloudSharing;
- (BRShareOverviewActivityViewControllerDelegate)delegate;
- (UIViewController)vcForActivityPresentation;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setVcForActivityPresentation:(id)a3;
- (void)setupActivityDelegate;
@end

@implementation _BRShareOverviewActivityViewController

- (BOOL)configureForCloudSharing
{
  return 1;
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  v5 = cdui_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002EA8C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(_BRShareOverviewActivityViewController *)self delegate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002A874;
  v15[3] = &unk_10004D8B0;
  id v16 = v4;
  v17 = self;
  id v14 = v4;
  [v13 shareActivityController:self prepareForActivity:v14 completion:v15];
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = cdui_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002EAFC(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained shareActivityControllerShouldPresentActivity:self])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002AAC4;
    v18[3] = &unk_10004D070;
    id v19 = WeakRetained;
    v20 = self;
    id v21 = v6;
    id v22 = v7;
    v17.receiver = self;
    v17.super_class = (Class)_BRShareOverviewActivityViewController;
    [(_BRShareOverviewActivityViewController *)&v17 _prepareActivity:v21 completion:v18];
  }
  else
  {
    [v6 activityDidFinish:0];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v10 = [(_BRShareOverviewActivityViewController *)self vcForActivityPresentation];
  uint64_t v11 = [(_BRShareOverviewActivityViewController *)self activity];

  if (v11 && v10)
  {
    uint64_t v12 = cdui_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002EB34(v8, v12);
    }

    +[NSDate timeIntervalSinceReferenceDate];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002AD3C;
    v14[3] = &unk_10004D2C8;
    id v15 = v9;
    [v10 presentViewController:v8 animated:v6 completion:v14];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_BRShareOverviewActivityViewController;
    [(_BRShareOverviewActivityViewController *)&v13 presentViewController:v8 animated:v6 completion:v9];
  }
}

- (void)setupActivityDelegate
{
  id v8 = [(_BRShareOverviewActivityViewController *)self activity];
  v3 = [v8 activityType];
  unsigned int v4 = [v3 isEqualToString:UIActivityTypeMail];

  if (v4)
  {
    v5 = [v8 mailComposeViewController];
    [v5 setMailComposeDelegate:self];
  }
  else
  {
    BOOL v6 = [v8 activityType];
    unsigned int v7 = [v6 isEqualToString:UIActivityTypeMessage];

    if (!v7) {
      goto LABEL_6;
    }
    v5 = [v8 messageComposeViewController];
    [v5 setMessageComposeDelegate:self];
  }

LABEL_6:
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = cdui_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 134218242;
    int64_t v15 = a4;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[INFO] mailComposeController:didFinishWithResult:%luerror:%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v11 = [(_BRShareOverviewActivityViewController *)self activity];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    objc_super v13 = [(_BRShareOverviewActivityViewController *)self activity];
    [v13 mailComposeController:v8 didFinishWithResult:a4 error:v9];
  }
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = cdui_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    int64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] messageComposeViewController:didFinishWithResult:%lu", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(_BRShareOverviewActivityViewController *)self activity];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(_BRShareOverviewActivityViewController *)self activity];
    [v10 messageComposeViewController:v6 didFinishWithResult:a4];
  }
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  int64_t v12 = [(_BRShareOverviewActivityViewController *)self delegate];
  objc_super v13 = [(_BRShareOverviewActivityViewController *)self activity];
  int v14 = [v13 activityType];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002B188;
  v17[3] = &unk_10004D950;
  id v18 = v9;
  id v19 = v10;
  v17[4] = self;
  id v15 = v9;
  id v16 = v10;
  [v12 shareViewController:self addParticipants:v11 activityType:v14 completion:v17];
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  int64_t v12 = [(_BRShareOverviewActivityViewController *)self delegate];
  objc_super v13 = [(_BRShareOverviewActivityViewController *)self activity];
  int v14 = [v13 activityType];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002B338;
  v17[3] = &unk_10004D950;
  id v18 = v9;
  id v19 = v10;
  v17[4] = self;
  id v15 = v9;
  id v16 = v10;
  [v12 shareViewController:self addParticipants:v11 activityType:v14 completion:v17];
}

- (UIViewController)vcForActivityPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vcForActivityPresentation);

  return (UIViewController *)WeakRetained;
}

- (void)setVcForActivityPresentation:(id)a3
{
}

- (BRShareOverviewActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BRShareOverviewActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_vcForActivityPresentation);
}

@end