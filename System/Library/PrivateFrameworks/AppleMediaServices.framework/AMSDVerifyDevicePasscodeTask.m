@interface AMSDVerifyDevicePasscodeTask
- (AMSMutablePromise)passcodeStringPromise;
- (id)_passcodeStringPromise;
- (id)verifyPasscode;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPasscodeStringPromise:(id)a3;
@end

@implementation AMSDVerifyDevicePasscodeTask

- (id)verifyPasscode
{
  v3 = [(AMSDVerifyDevicePasscodeTask *)self _passcodeStringPromise];
  [(AMSDVerifyDevicePasscodeTask *)self setPasscodeStringPromise:v3];
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10006249C;
  v9 = &unk_100114798;
  objc_copyWeak(&v10, &location);
  [v3 addFinishBlock:&v6];
  v4 = objc_msgSend(v3, "binaryPromiseAdapter", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = [(AMSDVerifyDevicePasscodeTask *)self passcodeStringPromise];
  v3 = AMSError();
  [v4 finishWithResult:0 error:v3];
}

- (id)_passcodeStringPromise
{
  id v3 = objc_alloc_init((Class)AMSMutablePromise);
  id v4 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePINEntryViewController"];
  id v5 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v6 = objc_alloc_init((Class)BSMutableSettings);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100062760;
  v16[3] = &unk_1001147C0;
  id v7 = v3;
  id v17 = v7;
  v8 = +[BSActionResponder responderWithHandler:v16];
  id v9 = [objc_alloc((Class)BSAction) initWithInfo:v6 responder:v8];
  id v10 = +[NSSet setWithObject:v9];
  [v5 setActions:v10];

  id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:v4 configurationContext:v5];
  v12 = v11;
  if (v11)
  {
    [v11 registerObserver:self];
    [v12 activateWithContext:0];
    id v13 = v7;
  }
  else
  {
    v14 = AMSError();
    id v13 = +[AMSMutablePromise promiseWithError:v14];
  }
  return v13;
}

- (AMSMutablePromise)passcodeStringPromise
{
  return self->_passcodeStringPromise;
}

- (void)setPasscodeStringPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end