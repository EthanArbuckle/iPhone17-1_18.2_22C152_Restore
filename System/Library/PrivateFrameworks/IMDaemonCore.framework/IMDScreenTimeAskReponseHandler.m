@interface IMDScreenTimeAskReponseHandler
- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4;
- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5;
@end

@implementation IMDScreenTimeAskReponseHandler

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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v41 = a4;
  v42 = (void (**)(id, BOOL))a5;
  v8 = [v7 notification];
  v9 = [v8 request];
  v10 = [v9 content];
  v43 = [v10 userInfo];

  v11 = [v43 objectForKey:*MEMORY[0x1E4F6DE90]];
  if (v11)
  {
LABEL_2:
    id v12 = objc_alloc_init(MEMORY[0x1E4F99D58]);
    v13 = [v7 actionIdentifier];
    char v14 = [v13 isEqualToString:*MEMORY[0x1E4F6DFA8]];

    if (v14)
    {
      v15 = @"approve15";
      uint64_t v16 = 1;
    }
    else
    {
      v17 = [v7 actionIdentifier];
      char v18 = [v17 isEqualToString:*MEMORY[0x1E4F6DFB8]];

      if (v18)
      {
        v15 = @"approveHour";
        uint64_t v16 = 2;
      }
      else
      {
        v27 = [v7 actionIdentifier];
        char v28 = [v27 isEqualToString:*MEMORY[0x1E4F6DFA0]];

        if (v28)
        {
          v15 = @"approveDay";
          uint64_t v16 = 3;
        }
        else
        {
          v31 = [v7 actionIdentifier];
          int v32 = [v31 isEqualToString:*MEMORY[0x1E4F6DFB0]];

          uint64_t v16 = 0;
          if (v32) {
            v15 = @"decline";
          }
          else {
            v15 = 0;
          }
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = [NSNumber numberWithInteger:v16];
        *(_DWORD *)buf = 138412290;
        v50 = v34;
        _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Sending sent ST response with answer: %@", buf, 0xCu);
      }
    }
    id v44 = 0;
    [v12 respondToAskForTimeRequestWithIdentifier:v11 answer:v16 error:&v44];
    id v35 = v44;
    if (v35)
    {
      v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1D98FE280(v16, (uint64_t)v35, v36);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = [NSNumber numberWithInteger:v16];
          *(_DWORD *)buf = 138412290;
          v50 = v38;
          _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Successfully sent ST response with answer: %@", buf, 0xCu);
        }
      }
      v36 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v36 trackAction:v15 extensionBundleID:*MEMORY[0x1E4F6CB10] isNotification:1];
    }

    v42[2](v42, v35 == 0);
    goto LABEL_42;
  }
  v40 = [v43 objectForKey:*MEMORY[0x1E4F6DE88]];
  v19 = [MEMORY[0x1E4F1CB10] URLWithString:v40];
  if (v19)
  {
    v39 = [MEMORY[0x1E4F29088] componentsWithURL:v19 resolvingAgainstBaseURL:1];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v20 = [v39 queryItems];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v25 = [v24 name];
          int v26 = [v25 isEqualToString:@"requestID"];

          if (v26)
          {
            v11 = [v24 value];
            goto LABEL_19;
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    v11 = 0;
LABEL_19:

    if (v11) {
      goto LABEL_2;
    }
    v29 = IMLogHandleForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE23C(v29);
    }

    v42[2](v42, 0);
  }
  else
  {
    v30 = IMLogHandleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE1F8(v30);
    }

    v42[2](v42, 0);
  }
LABEL_42:
}

@end