@interface IMDAskToBuyResponseHandler
- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4;
- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5;
@end

@implementation IMDAskToBuyResponseHandler

- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4
{
  v4 = [a3 notification];
  v5 = [v4 request];
  v6 = [v5 content];
  v7 = [v6 userInfo];

  v8 = [v7 objectForKeyedSubscript:@"CKBBContextKeyBalloonBundleID"];
  v9 = IMBalloonExtensionIDWithSuffix();
  LOBYTE(v6) = [v8 isEqualToString:v9];

  return (char)v6;
}

- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  v27 = v7;
  v9 = [v7 notification];
  v10 = [v9 request];
  v11 = [v10 content];
  v30 = [v11 userInfo];

  v29 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F6DE88]];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:v29];
  if (v12)
  {
    v26 = [MEMORY[0x1E4F29088] componentsWithURL:v12 resolvingAgainstBaseURL:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v13 = [v26 queryItems];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v33;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
        v18 = [v17 name];
        char v19 = [v18 isEqualToString:@"requestID"];

        if (v19) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v20 = [v17 value];

      if (!v20) {
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Launching askpermission page", buf, 2u);
        }
      }
      v22 = (void *)MEMORY[0x1E0169C30](@"APRequestHandler", @"AskPermission");
      if (v22)
      {
        [v22 presentApprovalSheetWithRequestIdentifier:v20 completion:0];
        v23 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v23 trackAction:@"view" extensionBundleID:*MEMORY[0x1E4F6CB08] isNotification:1];

        v8[2](v8, 1);
      }
      else
      {
        v8[2](v8, 0);
      }
    }
    else
    {
LABEL_10:

LABEL_19:
      v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1D9905574(v24);
      }

      v8[2](v8, 0);
    }
  }
  else
  {
    v25 = IMLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1D9905530(v25);
    }

    v8[2](v8, 0);
  }
}

@end