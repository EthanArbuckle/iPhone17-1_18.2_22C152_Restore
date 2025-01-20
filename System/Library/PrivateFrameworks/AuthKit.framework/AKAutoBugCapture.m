@interface AKAutoBugCapture
+ (BOOL)shouldCapturePromptBugForContext:(id)a3;
+ (id)userInfoFromAccount:(id)a3;
+ (id)userInfoFromContext:(id)a3;
+ (void)triggerAutoBugCaptureWithSubType:(id)a3 andBundleID:(id)a4 userInfo:(id)a5;
@end

@implementation AKAutoBugCapture

+ (void)triggerAutoBugCaptureWithSubType:(id)a3 andBundleID:(id)a4 userInfo:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (triggerAutoBugCaptureWithSubType_andBundleID_userInfo__onceToken != -1) {
    dispatch_once(&triggerAutoBugCaptureWithSubType_andBundleID_userInfo__onceToken, &__block_literal_global_52);
  }
  v10 = [(id)triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter signatureWithDomain:@"Application" type:@"Functional" subType:v7 detectedProcess:v8 triggerThresholdValues:0];
  if (v9)
  {
    v17 = @"userInfo";
    v18[0] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    v11 = 0;
  }
  char v12 = [(id)triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter snapshotWithSignature:v10 duration:0 event:v11 payload:&__block_literal_global_26 reply:15.0];
  v13 = _AKLogSystem();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "Diagnostic Reporter sent snapshot for signature %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:andBundleID:userInfo:]((uint64_t)v10, v14);
  }
}

uint64_t __74__AKAutoBugCapture_triggerAutoBugCaptureWithSubType_andBundleID_userInfo___block_invoke()
{
  triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter = (uint64_t)objc_alloc_init(MEMORY[0x1E4FA8AF0]);

  return MEMORY[0x1F41817F8]();
}

void __74__AKAutoBugCapture_triggerAutoBugCaptureWithSubType_andBundleID_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Received response from Diagnostic Reporter - %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (BOOL)shouldCapturePromptBugForContext:(id)a3
{
  id v3 = a3;
  if ([v3 _capabilityForUIDisplay] == 1)
  {
    int v4 = [v3 username];
    if (v4) {
      int v5 = [v3 isUsernameEditable] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)userInfoFromContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "serviceType"));
  [v4 setObject:v5 forKeyedSubscript:@"serviceType"];

  uint64_t v6 = [v3 _proxiedAppBundleID];

  if (v6)
  {
    id v7 = [v3 _proxiedAppBundleID];
    [v4 setObject:v7 forKeyedSubscript:@"proxiedAppBundleID"];
  }

  return v4;
}

+ (id)userInfoFromAccount:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v21[0] = @"altDSID";
  id v4 = (void *)0x1E575E000;
  v20 = +[AKAccountManager sharedInstance];
  int v5 = [v20 altDSIDForAccount:v3];
  uint64_t v6 = @"(******)";
  if (v5)
  {
    v19 = +[AKAccountManager sharedInstance];
    v18 = [v19 altDSIDForAccount:v3];
    if ([v18 length]) {
      id v7 = @"(******)";
    }
    else {
      id v7 = @"(empty)";
    }
  }
  else
  {
    id v7 = @"(null)";
  }
  v22[0] = v7;
  v21[1] = @"DSID";
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 altDSIDForAccount:v3];
  if (v9)
  {
    v17 = +[AKAccountManager sharedInstance];
    v16 = [v17 altDSIDForAccount:v3];
    if ([v16 length]) {
      v10 = @"(******)";
    }
    else {
      v10 = @"(empty)";
    }
  }
  else
  {
    v10 = @"(null)";
  }
  v22[1] = v10;
  v21[2] = @"username";
  v11 = +[AKAccountManager sharedInstance];
  char v12 = [v11 altDSIDForAccount:v3];
  if (v12)
  {
    id v4 = +[AKAccountManager sharedInstance];
    uint64_t v6 = [v4 altDSIDForAccount:v3];
    if ([(__CFString *)v6 length]) {
      v13 = @"(******)";
    }
    else {
      v13 = @"(empty)";
    }
  }
  else
  {
    v13 = @"(null)";
  }
  v22[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  if (v12)
  {
  }
  if (v9)
  {
  }
  if (v5)
  {
  }

  return v14;
}

+ (void)triggerAutoBugCaptureWithSubType:(uint64_t)a1 andBundleID:(NSObject *)a2 userInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

@end