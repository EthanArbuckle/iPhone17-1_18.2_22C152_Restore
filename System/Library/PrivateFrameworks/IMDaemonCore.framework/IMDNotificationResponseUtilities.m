@interface IMDNotificationResponseUtilities
+ (id)sharedInstance;
- (IMDAskToBuyResponseHandler)askToBuyResponseHandler;
- (IMDFamilyInviteReponseHandler)familyInviteResponseHandler;
- (IMDNotificationResponseUtilities)init;
- (IMDSafetyMonitorResponseHandler)safetyMonitorResponseHandler;
- (IMDScreenTimeAskReponseHandler)screenTimeAskReponseHandler;
- (UNUserNotificationCenter)notificationCenter;
- (void)_markMessageAsRead:(id)a3 inChat:(id)a4 withCompletionHandler:(id)a5;
- (void)_setupNotificationCenter;
- (void)setAskToBuyResponseHandler:(id)a3;
- (void)setFamilyInviteResponseHandler:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setSafetyMonitorResponseHandler:(id)a3;
- (void)setScreenTimeAskReponseHandler:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation IMDNotificationResponseUtilities

+ (id)sharedInstance
{
  if (qword_1EBE2B858 != -1) {
    dispatch_once(&qword_1EBE2B858, &unk_1F33912E0);
  }
  v2 = (void *)qword_1EBE2B990;

  return v2;
}

- (IMDNotificationResponseUtilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMDNotificationResponseUtilities;
  v2 = [(IMDNotificationResponseUtilities *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMDNotificationResponseUtilities *)v2 _setupNotificationCenter];
  }
  return v3;
}

- (IMDScreenTimeAskReponseHandler)screenTimeAskReponseHandler
{
  screenTimeAskReponseHandler = self->_screenTimeAskReponseHandler;
  if (!screenTimeAskReponseHandler)
  {
    v4 = objc_alloc_init(IMDScreenTimeAskReponseHandler);
    objc_super v5 = self->_screenTimeAskReponseHandler;
    self->_screenTimeAskReponseHandler = v4;

    screenTimeAskReponseHandler = self->_screenTimeAskReponseHandler;
  }

  return screenTimeAskReponseHandler;
}

- (IMDFamilyInviteReponseHandler)familyInviteResponseHandler
{
  familyInviteResponseHandler = self->_familyInviteResponseHandler;
  if (!familyInviteResponseHandler)
  {
    v4 = objc_alloc_init(IMDFamilyInviteReponseHandler);
    objc_super v5 = self->_familyInviteResponseHandler;
    self->_familyInviteResponseHandler = v4;

    familyInviteResponseHandler = self->_familyInviteResponseHandler;
  }

  return familyInviteResponseHandler;
}

- (IMDAskToBuyResponseHandler)askToBuyResponseHandler
{
  askToBuyResponseHandler = self->_askToBuyResponseHandler;
  if (!askToBuyResponseHandler)
  {
    v4 = objc_alloc_init(IMDAskToBuyResponseHandler);
    objc_super v5 = self->_askToBuyResponseHandler;
    self->_askToBuyResponseHandler = v4;

    askToBuyResponseHandler = self->_askToBuyResponseHandler;
  }

  return askToBuyResponseHandler;
}

- (IMDSafetyMonitorResponseHandler)safetyMonitorResponseHandler
{
  safetyMonitorResponseHandler = self->_safetyMonitorResponseHandler;
  if (!safetyMonitorResponseHandler)
  {
    v4 = objc_alloc_init(IMDSafetyMonitorResponseHandler);
    objc_super v5 = self->_safetyMonitorResponseHandler;
    self->_safetyMonitorResponseHandler = v4;

    safetyMonitorResponseHandler = self->_safetyMonitorResponseHandler;
  }

  return safetyMonitorResponseHandler;
}

- (void)_setupNotificationCenter
{
  v3 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;

  [(UNUserNotificationCenter *)self->_notificationCenter setDelegate:self];
  objc_super v5 = self->_notificationCenter;

  MEMORY[0x1F4181798](v5, sel_setWantsNotificationResponsesDelivered);
}

- (void)_markMessageAsRead:(id)a3 inChat:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  v10 = +[IMDChatRegistry sharedInstance];
  v11 = [v10 existingChatWithGUID:v8];
  if (v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6E850]) initWithSender:0 time:0 body:0 attributes:0 fileTransferGUIDs:0 flags:0 error:0 guid:v7 threadIdentifier:0];
    v13 = [MEMORY[0x1E4F1C9C8] now];
    [v12 setTimeRead:v13];

    v14 = [v11 serviceSession];
    v15 = [v11 chatIdentifier];
    objc_msgSend(v14, "sendReadReceiptForMessage:toChatID:identifier:style:", v12, v8, v15, objc_msgSend(v11, "style"));

    [v10 updateNotificationUnreadCountForChat:v11];
    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "couldn't find chat for %@ to mark message as read", buf, 0xCu);
    }
  }
  if (v9) {
LABEL_9:
  }
    v9[2](v9);
LABEL_10:
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v8;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "receive notification response for bundleID [%@]", buf, 0xCu);
    }
  }
  v12 = [(IMDNotificationResponseUtilities *)self screenTimeAskReponseHandler];
  int v13 = [v12 canHandleNotificationResponse:v9 userNotificationCenter:v8];

  if (v13)
  {
    v14 = [(IMDNotificationResponseUtilities *)self screenTimeAskReponseHandler];
    v15 = v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D9759D70;
    v29[3] = &unk_1E6B75C88;
    id v16 = v9;
    v29[4] = v16;
    v29[5] = self;
    v29[6] = v10;
    [v14 handleNotificationResponse:v16 userNotificationCenter:v8 completionHandler:v29];
LABEL_13:

    goto LABEL_14;
  }
  v17 = [(IMDNotificationResponseUtilities *)self familyInviteResponseHandler];
  int v18 = [v17 canHandleNotificationResponse:v9 userNotificationCenter:v8];

  if (v18)
  {
    v14 = [(IMDNotificationResponseUtilities *)self familyInviteResponseHandler];
    v15 = v28;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1D9759EB0;
    v28[3] = &unk_1E6B75C88;
    id v19 = v9;
    v28[4] = v19;
    v28[5] = self;
    v28[6] = v10;
    [v14 handleNotificationResponse:v19 userNotificationCenter:v8 completionHandler:v28];
    goto LABEL_13;
  }
  v20 = [(IMDNotificationResponseUtilities *)self askToBuyResponseHandler];
  int v21 = [v20 canHandleNotificationResponse:v9 userNotificationCenter:v8];

  if (v21)
  {
    v14 = [(IMDNotificationResponseUtilities *)self askToBuyResponseHandler];
    v15 = v27;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1D9759FF0;
    v27[3] = &unk_1E6B75C88;
    id v22 = v9;
    v27[4] = v22;
    v27[5] = self;
    v27[6] = v10;
    [v14 handleNotificationResponse:v22 userNotificationCenter:v8 completionHandler:v27];
    goto LABEL_13;
  }
  v23 = [(IMDNotificationResponseUtilities *)self safetyMonitorResponseHandler];
  int v24 = [v23 canHandleNotificationResponse:v9 userNotificationCenter:v8];

  if (v24)
  {
    v14 = [(IMDNotificationResponseUtilities *)self safetyMonitorResponseHandler];
    v15 = v26;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1D975A130;
    v26[3] = &unk_1E6B75C88;
    id v25 = v9;
    v26[4] = v25;
    v26[5] = self;
    v26[6] = v10;
    [v14 handleNotificationResponse:v25 userNotificationCenter:v8 completionHandler:v26];
    goto LABEL_13;
  }
LABEL_14:
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void)setScreenTimeAskReponseHandler:(id)a3
{
}

- (void)setFamilyInviteResponseHandler:(id)a3
{
}

- (void)setAskToBuyResponseHandler:(id)a3
{
}

- (void)setSafetyMonitorResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyMonitorResponseHandler, 0);
  objc_storeStrong((id *)&self->_askToBuyResponseHandler, 0);
  objc_storeStrong((id *)&self->_familyInviteResponseHandler, 0);
  objc_storeStrong((id *)&self->_screenTimeAskReponseHandler, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end