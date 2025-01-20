@interface PAOpenMCC
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation PAOpenMCC

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = PALogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "########## PAOpenMCC", v11, 2u);
  }

  v8 = +[PSMCCSettingsDetail preferencesURL];
  [v5 openSensitiveURL:v8];

  id v9 = objc_alloc_init((Class)SACommandSucceeded);
  v10 = [v9 dictionary];
  v6[2](v6, v10);
}

@end