@interface SFAutomaticPasswordInputViewController
@end

@implementation SFAutomaticPasswordInputViewController

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B50] mainBundle];
      id v8 = [v9 bundleIdentifier];
    }
    v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1((uint64_t)v8, v6, v10);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_22;
  v12[3] = &unk_1E5C73380;
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_22(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length]) {
    v2 = [[_SFAutomaticPasswordInputViewController alloc] initWithPassword:*(void *)(a1 + 32) keyboardType:1];
  }
  else {
    v2 = 0;
  }
  v3 = v2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) inputViewControllerDidSelectUseCustomPassword:*(void *)(a1 + 40)];
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) replaceCurrentPasswordWithPassword:*(void *)(a1 + 40)];
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F98948] sharedLogger];
  [v2 didChooseStrongPasswordWithoutSpecialCharacters];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 replaceCurrentPasswordWithPassword:v4];
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F98948] sharedLogger];
  [v2 didChooseToEditStrongPassword];

  v3 = *(void **)(a1 + 32);

  return [v3 makeStrongPasswordFieldViewableAndEditable:1];
}

uint64_t __79___SFAutomaticPasswordInputViewController_inputViewControllerOtherOptionsMenu___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) copyCurrentStrongPassword];
}

void __138___SFAutomaticPasswordInputViewController__inputViewControllerWithAutoFillContext_passwordRules_overrideApplicationIdentifier_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 domain];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F98280]];

  if (v8)
  {
    unint64_t v9 = [v5 code];

    if (v9 > 3) {
      v10 = &stru_1EFB97EB8;
    }
    else {
      v10 = off_1E5C75FE8[v9];
    }
  }
  else
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  int v11 = 138543618;
  uint64_t v12 = a1;
  __int16 v13 = 2114;
  id v14 = v10;
  _os_log_error_impl(&dword_1A690B000, v6, OS_LOG_TYPE_ERROR, "Cannot show Automatic Strong Passwords for app bundleID: %{public}@ due to error: %{public}@", (uint8_t *)&v11, 0x16u);
}

@end