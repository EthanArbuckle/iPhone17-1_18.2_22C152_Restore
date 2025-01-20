@interface UIAlertController(MCUI)
+ (uint64_t)MCUIShowWatchUnavailableAlertWithCompletion:()MCUI;
+ (void)MCUIShowAlertForError:()MCUI fromViewController:suggestedTitle:suggestedMessage:completion:;
+ (void)MCUIShowRebootAlertFromViewController:()MCUI;
- (void)MCUIAddActionWithTitle:()MCUI style:completion:;
- (void)MCUIAddCancelActionWithTitle:()MCUI;
- (void)MCUIShowFromController:()MCUI;
@end

@implementation UIAlertController(MCUI)

- (void)MCUIAddActionWithTitle:()MCUI style:completion:
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke;
    v13[3] = &unk_1E6EAD4A8;
    id v14 = v9;
    v11 = (void *)MEMORY[0x1E4E8BC40](v13);
  }
  else
  {
    v11 = 0;
  }
  v12 = [MEMORY[0x1E4F42720] actionWithTitle:v8 style:a4 handler:v11];
  [a1 addAction:v12];
}

- (void)MCUIAddCancelActionWithTitle:()MCUI
{
  id v4 = [MEMORY[0x1E4F42720] actionWithTitle:a3 style:1 handler:0];
  [a1 addAction:v4];
}

- (void)MCUIShowFromController:()MCUI
{
  id v4 = a3;
  id v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v6 = objc_initWeak(&location, v4);
  int v7 = [v4 _isTransitioning];

  if (!v7)
  {
    objc_destroyWeak(&location);
LABEL_5:
    [v4 presentViewController:v5 animated:1 completion:0];
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__UIAlertController_MCUI__MCUIShowFromController___block_invoke;
  v9[3] = &unk_1E6EADBE8;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v8 = objc_loadWeakRetained(&location);
  [v8 setShowViewControllerCompletionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
LABEL_6:
}

+ (uint64_t)MCUIShowWatchUnavailableAlertWithCompletion:()MCUI
{
  return MEMORY[0x1F410D0A8](@"MCUI is performing a profile operation", a3);
}

+ (void)MCUIShowRebootAlertFromViewController:()MCUI
{
  id v3 = a3;
  if (MCUIForPairedDevice())
  {
    NSLog(&cfstr_ShowingRebootM.isa);
    id v4 = MCUILocalizedString(@"REBOOT_SUGGESTED_TITLE_WATCH");
    MCUILocalizedString(@"REBOOT_SUGGESTED_TEXT_WATCH");
  }
  else
  {
    NSLog(&cfstr_ShowingRebootM_0.isa);
    id v4 = MCUILocalizedString(@"REBOOT_SUGGESTED_TITLE");
    MCUILocalizedStringByDevice(@"REBOOT_SUGGESTED_TEXT");
  id v5 = };
  id v6 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
  int v7 = (void *)MEMORY[0x1E4F42720];
  id v8 = MCUILocalizedString(@"REBOOT");
  id v9 = [v7 actionWithTitle:v8 style:0 handler:&__block_literal_global_8];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x1E4F42720];
  id v11 = MCUILocalizedString(@"NOTNOW");
  v12 = [v10 actionWithTitle:v11 style:0 handler:0];
  [v6 addAction:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke_2;
  v15[3] = &unk_1E6EAD458;
  id v16 = v3;
  id v17 = v6;
  id v13 = v6;
  id v14 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

+ (void)MCUIShowAlertForError:()MCUI fromViewController:suggestedTitle:suggestedMessage:completion:
{
  id v25 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  uint64_t v13 = a6;
  id v14 = a7;
  if (MCUIForPairedDevice())
  {
    v15 = [v25 domain];
    int v16 = [v15 isEqualToString:@"NSSErrorDomain"];

    if (v16)
    {
      id v17 = [v25 userInfo];
      v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      uint64_t v19 = [v18 localizedDescription];

      uint64_t v20 = [v18 localizedRecoverySuggestion];

      uint64_t v13 = v20;
      uint64_t v12 = v19;
    }
    id v21 = v25;
    if (!(v12 | v13))
    {
      NSLog(&cfstr_McuiPresenting.isa, v25);
      [MEMORY[0x1E4F42728] MCUIShowWatchUnavailableAlertWithCompletion:v14];
      goto LABEL_8;
    }
  }
  else
  {
    id v21 = v25;
  }
  NSLog(&cfstr_McuiPresenting_0.isa, v12, v13, v21);
  v22 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v12 message:v13 preferredStyle:1];
  v23 = MCUILocalizedString(@"OK");
  [v22 MCUIAddCancelActionWithTitle:v23];

  v24 = [v11 MCUITopViewController];
  [v24 presentViewController:v22 animated:1 completion:v14];

LABEL_8:
}

@end