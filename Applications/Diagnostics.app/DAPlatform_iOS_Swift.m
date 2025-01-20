@interface DAPlatform_iOS_Swift
+ (id)sharedInstance;
- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7;
@end

@implementation DAPlatform_iOS_Swift

+ (id)sharedInstance
{
  if (qword_1001869D0[0] != -1) {
    dispatch_once(qword_1001869D0, &stru_10014C470);
  }
  v2 = (void *)qword_1001869C8;

  return v2;
}

- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100032EEC;
  v22[3] = &unk_10014C4E8;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  id v27 = v14;
  id v28 = v15;
  id v16 = v14;
  id v17 = v15;
  v18 = v26;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
}

@end