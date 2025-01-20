@interface PAOpenCellularData
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation PAOpenCellularData

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  unsigned int v7 = +[PSCellularDataSettingsDetail deviceSupportsCellularData];
  v8 = PALogForCategory(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "########## PAOpenCellularData", buf, 2u);
    }

    v10 = +[PSCellularDataSettingsDetail preferencesURL];
    [v5 openSensitiveURL:v10];

    id v11 = objc_alloc_init((Class)SACommandSucceeded);
    id v12 = 0;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "########## Device does not support Cellular Data", v15, 2u);
    }

    id v13 = objc_alloc_init((Class)SACommandFailed);
    [v13 setErrorCode:SASettingPropertyUnsupportedByDeviceErrorCode];
    [v13 setReason:@"Device does not support Cellular Data"];
    id v12 = v13;
    id v11 = v12;
  }
  v14 = [v11 dictionary];
  v6[2](v6, v14);
}

@end