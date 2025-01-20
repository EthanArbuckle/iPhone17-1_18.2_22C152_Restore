@interface IMDFamilyInviteReponseHandler
- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4;
- (BOOL)isValidInviteURL:(id)a3;
- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5;
@end

@implementation IMDFamilyInviteReponseHandler

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
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void))a5;
  v8 = [a3 notification];
  v9 = [v8 request];
  v10 = [v9 content];
  v11 = [v10 userInfo];

  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F6DE88]];
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
  if (!v13)
  {
    v39 = IMLogHandleForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1D99000A8(v39, v40, v41, v42, v43, v44, v45, v46);
    }

    v7[2](v7, 0);
    goto LABEL_28;
  }
  v54 = self;
  v56 = v12;
  v57 = v11;
  [MEMORY[0x1E4F29088] componentsWithURL:v13 resolvingAgainstBaseURL:1];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v55 = long long v61 = 0u;
  v14 = [v55 queryItems];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v59;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v59 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      v20 = [v19 name];
      char v21 = [v20 isEqualToString:@"inviteUrl"];

      if (v21)
      {
        v22 = [v19 value];

        if (!v22) {
          goto LABEL_15;
        }
        v23 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
        v24 = [MEMORY[0x1E4F29088] componentsWithURL:v23 resolvingAgainstBaseURL:1];
        BOOL v25 = [(IMDFamilyInviteReponseHandler *)v54 isValidInviteURL:v24];

        if (v25)
        {
          v26 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          v27 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
          uint64_t v28 = [v26 openSensitiveURL:v27 withOptions:0];

          if (!v28)
          {
            v12 = v56;
            v11 = v57;
            v38 = v55;
            goto LABEL_26;
          }
          v29 = [MEMORY[0x1E4F6E890] sharedInstance];
          [v29 trackAction:@"view" extensionBundleID:*MEMORY[0x1E4F6CB00] isNotification:1];
        }
        else
        {
          v29 = IMLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1D9900118(v29, v47, v48, v49, v50, v51, v52, v53);
          }
          uint64_t v28 = 0;
        }
        v12 = v56;
        v11 = v57;
        v38 = v55;

LABEL_26:
        v7[2](v7, v28);

        goto LABEL_27;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_10:

LABEL_15:
  v30 = IMLogHandleForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1D99000E0(v30, v31, v32, v33, v34, v35, v36, v37);
  }

  v7[2](v7, 0);
  v12 = v56;
  v11 = v57;
  v38 = v55;
LABEL_27:

LABEL_28:
}

- (BOOL)isValidInviteURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 host];
  if ([v4 isEqual:@"setup.icloud.com"])
  {
    v5 = [v3 path];
    if ([v5 isEqual:@"/family/messages"])
    {
      v6 = [v3 scheme];
      char v7 = [v6 isEqual:@"https"];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end