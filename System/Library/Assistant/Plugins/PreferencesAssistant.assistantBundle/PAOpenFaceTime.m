@interface PAOpenFaceTime
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation PAOpenFaceTime

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = PALogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "########## PAOpenFaceTime", (uint8_t *)&v18, 2u);
  }

  v8 = (void *)MCFeatureVideoConferencingAllowed;
  BOOL v9 = sub_6234(MCFeatureVideoConferencingAllowed);
  int v10 = sub_6298(v8);
  int v11 = v10;
  if (v9 && (v10 & 1) != 0)
  {
    v12 = +[PSFaceTimeSettingsDetail preferencesURL];
    [v5 openSensitiveURL:v12];
    v13 = (Class *)SACommandSucceeded_ptr;
  }
  else
  {
    v12 = PALogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"not allowed";
      if (v9) {
        CFStringRef v14 = @"allowed";
      }
      CFStringRef v15 = @"has capability";
      if (!v11) {
        CFStringRef v15 = @"missing capability";
      }
      int v18 = 138412546;
      CFStringRef v19 = v14;
      __int16 v20 = 2112;
      CFStringRef v21 = v15;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "########## %@ %@", (uint8_t *)&v18, 0x16u);
    }
    v13 = (Class *)SACommandFailed_ptr;
  }

  id v16 = objc_alloc_init(*v13);
  v17 = [v16 dictionary];
  v6[2](v6, v17);
}

@end