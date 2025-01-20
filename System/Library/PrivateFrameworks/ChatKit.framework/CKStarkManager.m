@interface CKStarkManager
+ (BOOL)isCarPlayConnected;
+ (id)_directActionSource;
+ (void)_activateSiriWithContext:(id)a3;
+ (void)activateForConversation:(id)a3;
+ (void)activateForRecipient:(id)a3;
- (CKStarkConversationController)conversationController;
- (void)openSMSURL:(id)a3;
- (void)openURL:(id)a3 sourceApplication:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setConversationController:(id)a3;
- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4;
- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4;
@end

@implementation CKStarkManager

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Stark window did connect", v11, 2u);
    }
  }
  CKStarkManagerConnectedToCarPlay = 1;
  v9 = [[CKStarkConversationController alloc] initWithInterfaceController:v7];
  conversationController = self->_conversationController;
  self->_conversationController = v9;
}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Stark window did disconnect", v10, 2u);
    }
  }
  conversationController = self->_conversationController;
  self->_conversationController = 0;

  CKStarkManagerConnectedToCarPlay = 0;
}

+ (BOOL)isCarPlayConnected
{
  return CKStarkManagerConnectedToCarPlay;
}

+ (id)_directActionSource
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F9F950]) initWithDelegate:0];

  return v2;
}

+ (void)_activateSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _directActionSource];
  [v5 activateWithContext:v4 completion:&__block_literal_global_53];
}

void __43__CKStarkManager__activateSiriWithContext___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = @"Unsuccessfully";
      if (a2) {
        id v4 = @"Successfully";
      }
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Siri Activated %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)activateForRecipient:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v6 = CKMakeHandlesFromRecipients(v5);

  if ([v6 count])
  {
    uint64_t v7 = [v6 firstObject];
    v8 = [v7 fullName];
    if ([v8 length]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  v10 = [MEMORY[0x1E4F9F948] messageComposeNewThreadDirectActionWithAppBundleId:@"com.apple.MobileSMS" fullName:v9 phoneOrEmailAddress:v4];
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Activated to read message with recipients [%@]", (uint8_t *)&v12, 0xCu);
    }
  }
  [a1 _activateSiriWithContext:v10];
}

+ (void)activateForConversation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 chat];
  uint64_t v6 = [v5 guid];
  uint64_t v7 = (void *)v6;
  v8 = &stru_1EDE4CA38;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  id v9 = v8;

  if ([v4 hasUnreadMessages]) {
    [MEMORY[0x1E4F9F948] messageReadDirectActionWithAppBundleId:@"com.apple.MobileSMS" conversationGUID:v9];
  }
  else {
  v10 = [MEMORY[0x1E4F9F948] messageReplyDirectActionWithAppBundleId:@"com.apple.MobileSMS" conversationGUID:v9];
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Activated to read message with message id [%@] from conversation [%@]", (uint8_t *)&v12, 0x16u);
    }
  }
  [a1 _activateSiriWithContext:v10];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  uint64_t v7 = [a5 URLContexts];
  if (v7) {
    [(CKStarkManager *)self scene:v8 openURLContexts:v7];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  objc_msgSend(a4, "anyObject", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = [v8 URL];
  uint64_t v6 = [v8 options];
  uint64_t v7 = [v6 sourceApplication];

  [(CKStarkManager *)self openURL:v5 sourceApplication:v7];
}

- (void)openURL:(id)a3 sourceApplication:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Opening url: %@ from source application: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v9 = [v6 scheme];
  v10 = [v9 lowercaseString];
  if (([v10 isEqualToString:@"sms"] & 1) == 0)
  {
    v11 = [v6 scheme];
    int v12 = [v11 lowercaseString];
    if (([v12 isEqualToString:@"sms-private"] & 1) == 0)
    {
      id v13 = [v6 scheme];
      __int16 v14 = [v13 lowercaseString];
      char v15 = [v14 isEqualToString:@"imessage"];

      if ((v15 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  [(CKStarkManager *)self openSMSURL:v6];
LABEL_10:
}

- (void)openSMSURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v21 = 0;
  int v5 = [v4 chatForURL:v3 outMessageText:0 outRecipientIDs:&v21 outService:0 outMessageGUID:0];
  id v6 = v21;

  if (v5 && ([v5 allowedToShowConversation] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v3;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, " received URL: (%@) to a chat which contained non-allowlisted handles during downtime, so aborting open url request.", buf, 0xCu);
      }
    }
  }
  else
  {
    if ([v3 ckAllowRetargeting])
    {
      id v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      id v20 = 0;
      id v8 = [v7 existingChatWithAddresses:v6 allowAlternativeService:1 bestHandles:&v20];
      id v9 = v20;

      if (v8)
      {
        id v10 = v8;

        int v5 = v10;
      }
      uint64_t v11 = [v9 count];
      if (v11 == [v6 count])
      {
        uint64_t v12 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &__block_literal_global_64_0);

        id v6 = (id)v12;
      }
    }
    if (v5)
    {
      id v13 = +[CKConversationList sharedConversationList];
      __int16 v14 = [v13 conversationForExistingChat:v5];
    }
    else
    {
      __int16 v14 = 0;
    }
    BOOL v16 = +[CKStarkManager isCarPlayConnected];
    if (v14) {
      BOOL v17 = v16;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17)
    {
      +[CKStarkManager activateForConversation:v14];
    }
    else if (+[CKStarkManager isCarPlayConnected] {
           && [v6 count])
    }
    {
      __int16 v18 = [v6 firstObject];
      +[CKStarkManager activateForRecipient:v18];
    }
    else if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v3;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Ignoring open url, no conversation or recipients for url %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __29__CKStarkManager_openSMSURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ID];
}

- (CKStarkConversationController)conversationController
{
  return self->_conversationController;
}

- (void)setConversationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end