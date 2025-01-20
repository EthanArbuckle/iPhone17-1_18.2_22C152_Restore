@interface PBADeviceUnlockViewController
- (void)successfulAuthHandler:(id)a3;
@end

@implementation PBADeviceUnlockViewController

- (void)successfulAuthHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_10001CC90);
  if ([v4 type] == (id)1)
  {
    dispatch_group_enter(v5);
    v6 = [(PBADevicePasscodeViewController *)self authenticationController];
    v7 = [v6 createKeybagUnlockAssertionWithReason:@"com.apple.PreBoard.StashBagCreate"];

    [v7 activate];
    v8 = +[SBFMobileKeyBag sharedInstance];
    id v9 = objc_alloc((Class)SBFMobileKeyBagUnlockOptions);
    v10 = [v4 passcode];
    v11 = [v10 dataUsingEncoding:4];
    id v12 = [v9 initWithPasscode:v11 skipSEKeepUserDataOperation:1];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000C398;
    v17[3] = &unk_10001C8E0;
    id v18 = v7;
    v19 = v5;
    id v13 = v7;
    [v8 createStashBagWithOptions:v12 completion:v17];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C3D4;
  v15[3] = &unk_10001C748;
  v16 = v5;
  v14 = v5;
  [(PBADevicePasscodeViewController *)self handlePasscodeEntrySuccessful:v15];
}

@end