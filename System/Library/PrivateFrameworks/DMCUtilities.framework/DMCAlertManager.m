@interface DMCAlertManager
+ (void)displayAlertWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 altButtonText:(id)a6 destructive:(BOOL)a7 completion:(id)a8;
+ (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completion:(id)a6;
@end

@implementation DMCAlertManager

+ (void)displayAlertWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 altButtonText:(id)a6 destructive:(BOOL)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = syncQueue();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __104__DMCAlertManager_displayAlertWithTitle_message_defaultButtonText_altButtonText_destructive_completion___block_invoke;
  v24[3] = &unk_1E5CFD6E8;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  BOOL v30 = a7;
  id v29 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(v18, v24);
}

void __104__DMCAlertManager_displayAlertWithTitle_message_defaultButtonText_altButtonText_destructive_completion___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setTitle:*(void *)(a1 + 32)];
  [v3 setMessage:*(void *)(a1 + 40)];
  [v3 setDefaultButtonText:*(void *)(a1 + 48)];
  [v3 setAlternateButtonText:*(void *)(a1 + 56)];
  [v3 setDestructive:*(unsigned __int8 *)(a1 + 72)];
  [v3 setCompletionBlock:*(void *)(a1 + 64)];
  v2 = syncQueueAlertQueue();
  [v2 addObject:v3];

  syncQueueShowNextAlert();
}

+ (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = syncQueue();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke;
  v18[3] = &unk_1E5CFD788;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v22 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  id v17 = v12;
  dispatch_async(v13, v18);
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke(uint64_t a1)
{
  v2 = syncQueueiTunesLoginCompletionBlocks();
  if (![v2 count])
  {
    if (*(void *)(a1 + 56))
    {
      v5 = (void *)MEMORY[0x1AD0D2220]();
      [v2 addObject:v5];
    }
    v4 = objc_opt_new();
    [v4 setTitle:*(void *)(a1 + 40)];
    [v4 setMessage:*(void *)(a1 + 48)];
    v6 = DMCLocalizedString(@"MDM_APP_INSTALL_BUTTON_LOGIN");
    [v4 setDefaultButtonText:v6];

    v7 = DMCLocalizedString(@"MDM_APP_INSTALL_BUTTON_CANCEL");
    [v4 setAlternateButtonText:v7];

    [v4 setDisplayOnLockScreen:0];
    [v4 setDismissAfterTimeInterval:900.0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_5;
    v9[3] = &unk_1E5CFD760;
    id v10 = *(id *)(a1 + 32);
    [v4 setCompletionBlock:v9];
    [*(id *)(a1 + 32) park];
    v8 = syncQueueAlertQueue();
    [v8 addObject:v4];

    syncQueueShowNextAlert();
    goto LABEL_9;
  }
  id v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  if (*(void *)(a1 + 56))
  {
    v4 = (void *)MEMORY[0x1AD0D2220]();
    [v2 addObject:v4];
LABEL_9:
  }
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_5(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) unpark];
  v4 = syncQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_2;
  v5[3] = &unk_1E5CFD738;
  int v7 = a2;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_2(uint64_t a1)
{
  v2 = syncQueueiTunesLoginCompletionBlocks();
  if ([v2 count])
  {
    id v3 = (void *)[v2 copy];
    [v2 removeAllObjects];
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_3;
    block[3] = &unk_1E5CFD710;
    id v7 = v3;
    int v9 = *(_DWORD *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(v4, block);
  }
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 67109120;
    int v18 = [v3 count];
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d iTunes login events.", buf, 8u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1AD0D2000](v6);
        (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(unsigned int *)(a1 + 48));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

@end