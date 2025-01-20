@interface IMDSafetyMonitorResponseHandler
- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4;
- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5;
@end

@implementation IMDSafetyMonitorResponseHandler

- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4
{
  id v4 = a3;
  v5 = [v4 notification];
  v6 = [v5 request];
  v7 = [v6 content];
  v8 = [v7 userInfo];

  v9 = [v8 objectForKeyedSubscript:@"CKBBContextKeyBalloonBundleID"];
  v10 = [v4 notification];
  v11 = [v10 request];
  v12 = [v11 content];
  v13 = [v12 categoryIdentifier];

  if ([v9 isEqualToString:*MEMORY[0x1E4F6CB28]])
  {
    char v14 = 1;
  }
  else
  {
    v15 = IMBalloonExtensionIDWithSuffix();
    if ([v9 isEqualToString:v15])
    {
      char v14 = 1;
    }
    else
    {
      v16 = [v4 actionIdentifier];
      v17 = IMSMWorkoutAlwaysPromptActionIdentifier();
      if ([v16 isEqualToString:v17]) {
        char v14 = 1;
      }
      else {
        char v14 = [v13 isEqualToString:@"com.apple.SafetyMonitor.Suggestions.WorkoutAlwaysPrompt"];
      }
    }
  }

  return v14;
}

- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  v8 = [v7 notification];
  v9 = [v8 request];
  v10 = [v9 content];
  v11 = [v10 userInfo];

  v12 = [v7 notification];
  v13 = [v12 request];
  char v14 = [v13 identifier];

  v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F6DF98]];
  v16 = [v7 actionIdentifier];
  v17 = [v7 notification];

  v18 = [v17 request];
  v19 = [v18 content];
  v20 = [v19 categoryIdentifier];

  if (v16)
  {
    if ([(__CFString *)v16 isEqualToString:*MEMORY[0x1E4F446E0]]
      && [v20 isEqualToString:@"com.apple.SafetyMonitor.Suggestions.WorkoutAlwaysPrompt"])
    {

      v16 = @"SMWorkoutAlwaysPromptDismissActionIdentifier";
    }
    v21 = [MEMORY[0x1E4F6E940] sharedCoordinator];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D96F5064;
    v23[3] = &unk_1E6B74478;
    id v25 = v6;
    id v24 = v15;
    [v21 respondToNotificationWithIdentifier:v14 sessionIdentifier:v24 actionIdentifier:v16 completion:v23];
  }
  else
  {
    v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFC6C(v22);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

@end