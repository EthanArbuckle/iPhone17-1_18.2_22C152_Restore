@interface UIViewController(AccountManagerExtras)
- (uint64_t)safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:()AccountManagerExtras;
@end

@implementation UIViewController(AccountManagerExtras)

- (uint64_t)safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:()AccountManagerExtras
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F5F3A0]) initWithPolicyChangeHandler:0];
  v23[0] = @"com.apple.mobilesafari";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v8 = [v6 requestPoliciesForBundleIdentifiers:v7 withError:0];

  v9 = [v5 applicationState];
  if ([v9 isRestricted])
  {
  }
  else
  {
    v10 = [v8 objectForKeyedSubscript:@"com.apple.mobilesafari"];
    uint64_t v11 = [v10 integerValue];

    if (!v11)
    {
      uint64_t v20 = 1;
      goto LABEL_5;
    }
  }
  v12 = NSString;
  v13 = _WBSLocalizedString();
  v14 = [v4 host];
  v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

  v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:0 preferredStyle:1];
  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = _WBSLocalizedString();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__UIViewController_AccountManagerExtras__safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary___block_invoke;
  v22[3] = &unk_1E5C72898;
  v22[4] = a1;
  v19 = [v17 actionWithTitle:v18 style:0 handler:v22];
  [v16 addAction:v19];

  [a1 presentViewController:v16 animated:1 completion:0];
  uint64_t v20 = 0;
LABEL_5:

  return v20;
}

@end