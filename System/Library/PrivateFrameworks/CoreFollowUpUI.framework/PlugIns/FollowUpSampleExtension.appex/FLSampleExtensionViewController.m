@interface FLSampleExtensionViewController
- (void)_appeared;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FLSampleExtensionViewController

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002CF8;
  v6[3] = &unk_100004150;
  id v7 = objc_alloc_init((Class)FLFollowUpController);
  id v8 = v3;
  id v4 = v3;
  id v5 = v7;
  [v5 pendingFollowUpItemsWithCompletion:v6];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, uint64_t))a5;
  v12 = _FLLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Extension processing item: %@ action: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_activeItem, a3);
  objc_storeStrong((id *)&self->_activeAction, a4);
  v13 = [v10 identifier];
  unsigned int v14 = [v13 isEqualToString:@"com.followup.clear_notification_action"];

  if (v14)
  {
    id v15 = objc_alloc_init((Class)FLFollowUpController);
    [v15 clearNotificationForItem:v9 error:0];
LABEL_7:
    v11[2](v11, 1);

    goto LABEL_15;
  }
  v16 = [v10 identifier];
  unsigned int v17 = [v16 isEqualToString:@"com.followup.clear_item_action"];

  if (v17)
  {
    id v15 = objc_alloc_init((Class)FLFollowUpController);
    v18 = [v9 uniqueIdentifier];
    v23 = v18;
    v19 = +[NSArray arrayWithObjects:&v23 count:1];
    [v15 clearPendingFollowUpItemsWithUniqueIdentifiers:v19 error:0];

    goto LABEL_7;
  }
  v20 = [v10 label];
  unsigned int v21 = [v20 isEqualToString:@"ADDED LATER"];

  if (v21)
  {
    [v10 _loadActionURL];
LABEL_14:
    v11[2](v11, 1);
    goto LABEL_15;
  }
  if (!v10) {
    goto LABEL_14;
  }
  +[NSThread sleepForTimeInterval:1.0];
  v22 = _FLLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Extension processed item %@", buf, 0xCu);
  }

  v11[2](v11, 0);
LABEL_15:
}

- (void)_appeared
{
  id v3 = [(FLFollowUpAction *)self->_activeAction label];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(FLFollowUpAction *)self->_activeAction eventSource]];
  id v5 = +[NSString stringWithFormat:@"Dismiss - %@ - %@", v3, v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000033C4;
  v11[3] = &unk_100004178;
  v11[4] = self;
  v6 = +[FLAlertControllerAction actionWithTitle:v5 style:0 handler:v11];
  v12 = v6;
  id v7 = +[NSArray arrayWithObjects:&v12 count:1];
  id v8 = [v7 mutableCopy];

  id v9 = [(FLFollowUpAction *)self->_activeAction identifier];
  LODWORD(v4) = [v9 isEqualToString:@"com.followup.crash"];

  if (v4)
  {
    id v10 = +[FLAlertControllerAction actionWithTitle:@"Crash" style:2 handler:&stru_1000041B8];
    [v8 addObject:v10];
  }
  +[FLAlertControllerHelper presentAlertWithTitle:@"Extension Alert" message:@"We are running in extension process now" actions:v8 presentingController:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FLSampleExtensionViewController;
  [(FLSampleExtensionViewController *)&v4 viewDidAppear:a3];
  [(FLSampleExtensionViewController *)self _appeared];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAction, 0);

  objc_storeStrong((id *)&self->_activeItem, 0);
}

@end