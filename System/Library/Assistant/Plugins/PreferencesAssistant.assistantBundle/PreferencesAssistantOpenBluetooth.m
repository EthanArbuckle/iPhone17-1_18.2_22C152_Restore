@interface PreferencesAssistantOpenBluetooth
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation PreferencesAssistantOpenBluetooth

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = PALogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "########## PreferencesAssistantOpenBluetooth", (uint8_t *)&v12, 2u);
  }

  if (sub_6298(off_1A078))
  {
    v8 = +[PSBluetoothSettingsDetail preferencesURL];
    [v5 openSensitiveURL:v8];
    v9 = (Class *)SACommandSucceeded_ptr;
  }
  else
  {
    v8 = PALogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      CFStringRef v13 = @"missing capability";
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "########## %@", (uint8_t *)&v12, 0xCu);
    }
    v9 = (Class *)SACommandFailed_ptr;
  }

  id v10 = objc_alloc_init(*v9);
  v11 = [v10 dictionary];
  v6[2](v6, v11);
}

@end