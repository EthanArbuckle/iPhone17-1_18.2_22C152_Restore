@interface PasscodeActiveViewFactory
- (id)passcodeViewForPasscode:(id)a3 style:(id)a4;
- (int)_lockStyleForPasscodeType:(int64_t)a3;
@end

@implementation PasscodeActiveViewFactory

- (id)passcodeViewForPasscode:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSDate date];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = (id)3221225472;
  v15[2] = sub_100006A14;
  v15[3] = &unk_100085F90;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = sub_100006A14(v15);
  [v11 setShowsEmergencyCallButton:0];
  [v11 setBiometricAuthenticationAllowed:0];
  v12 = LALogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [v8 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    double v19 = -v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SBUIPasscodeLockViewFactory call took %.2f secs", buf, 0xCu);
  }

  return v11;
}

- (int)_lockStyleForPasscodeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

@end