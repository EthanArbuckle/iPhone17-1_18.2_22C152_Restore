@interface _DDUINotificationManager
- (_DDUINotificationManager)init;
- (_DDUINotificationPresenter)notificationPresenter;
- (void)cancelMessageWithID:(id)a3;
- (void)deepLinkToAppStoreForApplication:(id)a3;
- (void)handleApplicationInfo:(id)a3 withID:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6;
- (void)handleContinuityCameraConfirmationWithID:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)setNotificationPresenter:(id)a3;
@end

@implementation _DDUINotificationManager

- (_DDUINotificationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DDUINotificationManager;
  v2 = [(_DDUINotificationManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_DDUIiOSNotificationPresenter);
    notificationPresenter = v2->_notificationPresenter;
    v2->_notificationPresenter = (_DDUINotificationPresenter *)v3;

    [(_DDUINotificationPresenter *)v2->_notificationPresenter setDelegate:v2];
  }
  return v2;
}

- (void)handleApplicationInfo:(id)a3 withID:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = _DDUICoreLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v10 name];
    int v18 = 138412546;
    id v19 = v10;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1CFC71000, v14, OS_LOG_TYPE_DEFAULT, "remoteDevice %@ deviceName %@", (uint8_t *)&v18, 0x16u);
  }
  v16 = [(_DDUINotificationManager *)self notificationPresenter];
  v17 = [v10 name];
  [v16 showNotificationForApplication:v13 deviceName:v17 identifier:v12 completion:v11];
}

- (void)handleContinuityCameraConfirmationWithID:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _DDUICoreLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 name];
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1CFC71000, v11, OS_LOG_TYPE_DEFAULT, "remoteDevice %@ deviceName %@", (uint8_t *)&v14, 0x16u);
  }
  id v13 = [(_DDUINotificationManager *)self notificationPresenter];
  [v13 showContinuityCameraConfirmation:v8 identifier:v10 completion:v9];
}

- (void)cancelMessageWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(_DDUINotificationManager *)self notificationPresenter];
  [v5 dismissNotificationWithIdentifier:v4];
}

- (void)deepLinkToAppStoreForApplication:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _DDUICoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = [v3 adamID];
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to launch app store for adamID %lld", buf, 0xCu);
  }

  id v5 = objc_msgSend(@"itms-apps://apple.com/app/id", "stringByAppendingFormat:", @"%lld", objc_msgSend(v3, "adamID"));
  objc_super v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  uint64_t v7 = *MEMORY[0x1E4F62688];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
}

- (_DDUINotificationPresenter)notificationPresenter
{
  return self->_notificationPresenter;
}

- (void)setNotificationPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end