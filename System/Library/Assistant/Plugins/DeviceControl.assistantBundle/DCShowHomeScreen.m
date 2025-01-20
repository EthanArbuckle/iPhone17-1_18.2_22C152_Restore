@interface DCShowHomeScreen
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation DCShowHomeScreen

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.ace.devicecontrol", "DeviceControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_3490(v7);
  }
  v8 = +[AXPISystemActionHelper sharedInstance];
  [v8 warm];

  [v6 dismissAssistantWithReason:2];
  dispatch_time_t v9 = dispatch_time(0, 700000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3168;
  block[3] = &unk_40C0;
  v10 = v7;
  v14 = v10;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  if (v5)
  {
    id v11 = objc_alloc_init((Class)SACommandSucceeded);
    v12 = [v11 dictionary];
    v5[2](v5, v12);
  }
}

@end