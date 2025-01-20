@interface UIViewController(GKChallengeAdditions)
- (uint64_t)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:;
- (void)_gkPresentChallengeVC:()GKChallengeAdditions;
- (void)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:complete:;
@end

@implementation UIViewController(GKChallengeAdditions)

- (void)_gkPresentChallengeVC:()GKChallengeAdditions
{
  id v4 = a3;
  v5 = (unsigned char *)MEMORY[0x1E4F63830];
  id v33 = v4;
  if (!*MEMORY[0x1E4F63830])
  {
    v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    id v4 = v33;
    if (v17 != 1 || (*v5 ? (BOOL v18 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v18 = 0), v18))
    {
      v6 = [[GKNavigationController alloc] initWithRootViewController:v33];
      v19 = [(GKNavigationController *)v6 navigationBar];
      v20 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v19 _gkApplyTheme:v20 navbarStyle:1];

      v21 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v22 = [v21 userInterfaceIdiom];

      if (v22 == 1)
      {
        [(GKNavigationController *)v6 setModalPresentationStyle:16];
        v23 = [MEMORY[0x1E4F63A10] sharedTheme];
        [v23 formSheetSize];
        -[GKNavigationController setFormSheetSize:](v6, "setFormSheetSize:");
      }
      [a1 setWantsFullScreenLayout:1];
      v24 = [a1 _popoverController];
      uint64_t v25 = [v24 delegate];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [a1 _popoverController];
        v28 = [v27 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v30 = [a1 _popoverController];
          v31 = [v30 delegate];

          goto LABEL_26;
        }
      }
      else
      {
      }
      v31 = [a1 navigationController];
LABEL_26:
      [v31 presentViewController:v6 animated:1 completion:&__block_literal_global_130];
      if (objc_opt_respondsToSelector())
      {
        [v31 dismissPopoverAnimated:0];
      }
      else
      {
        v32 = [a1 _popoverController];
        [v32 dismissPopoverAnimated:0];
      }
      goto LABEL_21;
    }
  }
  v6 = [v4 view];
  [(GKNavigationController *)v6 setBackgroundColor:0];
  [(GKNavigationController *)v6 setOpaque:0];
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    BOOL v14 = v11 > 1024.0;
    if (v13 > 1024.0) {
      BOOL v14 = 1;
    }
    double v15 = 320.0;
    if (v14) {
      double v15 = 375.0;
    }
  }
  else
  {
    double v15 = 320.0;
  }
  objc_msgSend(v33, "setPreferredContentSize:", v15, 440.0);
  v31 = [a1 navigationController];
  [v31 pushViewController:v33 animated:1];
LABEL_21:
}

- (uint64_t)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:
{
  return [a1 _gkPresentSendDialogForChallenge:a3 selectPlayers:a4 defaultMessage:a5 complete:0];
}

- (void)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:complete:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__3;
  v19[4] = __Block_byref_object_dispose__3;
  id v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke;
  v18[3] = &unk_1E5F64A18;
  v18[4] = a1;
  v18[5] = v19;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke_2;
  v15[3] = &unk_1E5F64A40;
  uint64_t v17 = v19;
  id v14 = v13;
  v15[4] = a1;
  id v16 = v14;
  +[GKChallengeComposeController composeAndSendFlowForChallenge:v10 selectPlayers:v11 defaultMessage:v12 forcePicker:0 readyHandler:v18 completionHandler:v15];

  _Block_object_dispose(v19, 8);
}

@end