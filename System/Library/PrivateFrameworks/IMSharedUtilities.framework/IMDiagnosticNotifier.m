@interface IMDiagnosticNotifier
- (IMDiagnosticNotifier)init;
- (UNUserNotificationCenter)notificationCenter;
- (void)postNotification:(id)a3;
- (void)postNotificationWithTitle:(id)a3 body:(id)a4;
- (void)setNotificationCenter:(id)a3;
@end

@implementation IMDiagnosticNotifier

- (IMDiagnosticNotifier)init
{
  v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMDiagnosticNotifier;
    v5 = [(IMDiagnosticNotifier *)&v12 init];
    if (v5)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2050000000;
      v6 = (void *)qword_1E94FF878;
      uint64_t v17 = qword_1E94FF878;
      if (!qword_1E94FF878)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = sub_1A083E650;
        v13[3] = &unk_1E5A10130;
        v13[4] = &v14;
        sub_1A083E650((uint64_t)v13);
        v6 = (void *)v15[3];
      }
      v7 = v6;
      _Block_object_dispose(&v14, 8);
      uint64_t v8 = [[v7 alloc] initWithBundleIdentifier:@"com.apple.Messages.diagnostics.usernotifications"];
      notificationCenter = v5->_notificationCenter;
      v5->_notificationCenter = (UNUserNotificationCenter *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)postNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 _createRequest];
  if (v5)
  {
    v6 = [(IMDiagnosticNotifier *)self notificationCenter];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1A083E250;
    v9[3] = &unk_1E5A136B0;
    id v10 = v4;
    [v6 addNotificationRequest:v5 withCompletionHandler:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v4 identifier];
      *(_DWORD *)buf = 138412290;
      objc_super v12 = v8;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Not posting diagnostic notification %@ due to invalid request", buf, 0xCu);
    }
  }
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[IMDiagnosticNotification alloc] initWithTitle:v7 body:v6];

  [(IMDiagnosticNotifier *)self postNotification:v8];
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end