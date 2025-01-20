@interface AVSharedPreferences
- (SBSExternalDisplayService)externalDisplayService;
- (void)extendedDisplayActive:(id)a3;
- (void)setAutomaticVideoGravity:(id)a3 completion:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation AVSharedPreferences

- (void).cxx_destruct
{
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (void)extendedDisplayActive:(id)a3
{
  id v4 = a3;
  externalDisplayService = self->_externalDisplayService;
  if (!externalDisplayService)
  {
    v6 = (SBSExternalDisplayService *)objc_alloc_init((Class)SBSExternalDisplayService);
    v7 = self->_externalDisplayService;
    self->_externalDisplayService = v6;

    externalDisplayService = self->_externalDisplayService;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003318;
  v9[3] = &unk_100004150;
  id v10 = v4;
  id v8 = v4;
  [(SBSExternalDisplayService *)externalDisplayService getConnectedDisplayInfoWithCompletionHandler:v9];
}

- (void)setAutomaticVideoGravity:(id)a3 completion:(id)a4
{
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  v9 = (void (**)(void))a5;
  id v10 = sub_1000035B8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setString: %{public}@ forKey:%{public}@", (uint8_t *)&v12, 0x16u);
  }

  CFPreferencesSetValue(v8, v7, @"com.apple.avkit", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v9) {
    v9[2](v9);
  }
  v11 = sub_1000035B8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setString complete", (uint8_t *)&v12, 2u);
  }
}

@end