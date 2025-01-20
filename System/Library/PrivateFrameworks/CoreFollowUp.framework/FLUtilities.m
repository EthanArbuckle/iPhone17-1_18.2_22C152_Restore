@interface FLUtilities
+ (BOOL)launchPasswordChangeForAppleID:(id)a3;
+ (BOOL)launchPasswordResetForAppleID:(id)a3;
+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4;
@end

@implementation FLUtilities

+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4
{
  id v19 = a4;
  v5 = (objc_class *)MEMORY[0x1E4F29088];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setScheme:@"tap-to-radar"];
  [v7 setHost:@"new"];
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"FollowUp"];
  [v8 addObject:v9];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v8 addObject:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"637431"];
  [v8 addObject:v11];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Serious Bug"];
  [v8 addObject:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"I Didn't Try"];
  [v8 addObject:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"AutoDiagnostics" value:@"phone"];
  [v8 addObject:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v6];
  [v8 addObject:v15];

  if (v19)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v19];
    [v8 addObject:v16];
  }
  [v7 setQueryItems:v8];
  v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v18 = [v7 URL];
  [v17 openURL:v18];
}

+ (BOOL)launchPasswordResetForAppleID:(id)a3
{
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[FLUtilities launchPasswordResetForAppleID:](v3);
  }

  return 0;
}

+ (BOOL)launchPasswordChangeForAppleID:(id)a3
{
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[FLUtilities launchPasswordChangeForAppleID:](v3);
  }

  return 0;
}

+ (void)launchPasswordResetForAppleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BE24A000, log, OS_LOG_TYPE_ERROR, "Password reset notifications are not driven by FollowUp on iOS!", v1, 2u);
}

+ (void)launchPasswordChangeForAppleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BE24A000, log, OS_LOG_TYPE_ERROR, "Password change notifications are not driven by FollowUp on iOS!", v1, 2u);
}

@end