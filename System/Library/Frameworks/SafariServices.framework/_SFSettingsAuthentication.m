@interface _SFSettingsAuthentication
+ (BOOL)authenticationRequiresPasscode;
+ (id)_localAuthenticationOptionsWithAuthenticationContext:(id)a3;
+ (int64_t)biometryTypeCurrentlyAvailableForDevice;
+ (void)authenticateForSettings:(id)a3 allowAuthenticationReuse:(BOOL)a4 completionHandler:(id)a5;
+ (void)pushSettingsAfterAuthentication:(id)a3 onBehalfOfViewController:(id)a4 resourceDictionary:(id)a5 completionHandler:(id)a6;
@end

@implementation _SFSettingsAuthentication

+ (BOOL)authenticationRequiresPasscode
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  id v8 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v8];
  id v4 = v8;
  v5 = v4;
  BOOL v6 = (v3 & 1) != 0 || [v4 code] != -5;

  return v6;
}

+ (int64_t)biometryTypeCurrentlyAvailableForDevice
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  id v7 = 0;
  [v2 canEvaluatePolicy:1 error:&v7];
  id v3 = v7;
  id v4 = v3;
  if (v3 && (unint64_t)([v3 code] + 7) < 3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = [v2 biometryType];
  }

  return v5;
}

+ (void)authenticateForSettings:(id)a3 allowAuthenticationReuse:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  v11 = v10;
  if (v6) {
    [v10 setTouchIDAuthenticationAllowableReuseDuration:10.0];
  }
  uint64_t v12 = [v8 authenticationPolicy];
  id v28 = 0;
  char v13 = [v11 canEvaluatePolicy:v12 error:&v28];
  id v14 = v28;
  v15 = v14;
  if (v13)
  {
    v16 = [a1 _localAuthenticationOptionsWithAuthenticationContext:v8];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5C73AC0;
    id v22 = v8;
    id v23 = v9;
    id v17 = v9;
    id v18 = v8;
    [v11 evaluatePolicy:v12 options:v16 reply:v21];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke;
    block[3] = &unk_1E5C76EE0;
    id v25 = v8;
    id v26 = v14;
    id v27 = v9;
    id v19 = v9;
    id v20 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v16 = v25;
  }
}

+ (void)pushSettingsAfterAuthentication:(id)a3 onBehalfOfViewController:(id)a4 resourceDictionary:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_msgSend(v12, "safari_stringForKey:", *MEMORY[0x1E4F99358]);
  uint64_t v15 = [v14 isEqualToString:*MEMORY[0x1E4F99360]];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __123___SFSettingsAuthentication_pushSettingsAfterAuthentication_onBehalfOfViewController_resourceDictionary_completionHandler___block_invoke;
  v20[3] = &unk_1E5C76F08;
  id v21 = v11;
  id v22 = v10;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  [a1 authenticateForSettings:v18 allowAuthenticationReuse:v15 completionHandler:v20];
}

+ (id)_localAuthenticationOptionsWithAuthenticationContext:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 customLocalAuthenticationOptions];
  }
  else
  {
    if ([v3 showsAuthenticationPromptAsTitle])
    {
      v10[0] = &unk_1EFBDEFB0;
      int64_t v5 = +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts];
      v10[1] = &unk_1EFBDEFC8;
      v11[0] = v5;
      BOOL v6 = [v3 authenticationPrompt];
      v11[1] = v6;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    }
    else
    {
      id v8 = &unk_1EFBDEFE0;
      int64_t v5 = [v3 authenticationPrompt];
      id v9 = v5;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    }
  }

  return v4;
}

@end