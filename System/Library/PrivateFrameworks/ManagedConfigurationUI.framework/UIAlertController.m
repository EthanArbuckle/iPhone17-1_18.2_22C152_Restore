@interface UIAlertController
@end

@implementation UIAlertController

void __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke_2;
  block[3] = &unk_1E6EAD398;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__UIAlertController_MCUI__MCUIShowFromController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

void __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke()
{
  if (MCUIForPairedDevice())
  {
    NSLog(&cfstr_McuiRebootingW.isa);
    id v1 = (id)objc_opt_new();
    [v1 rebootDevice];
  }
  else
  {
    NSLog(&cfstr_McuiRebootingI.isa);
    id v1 = (id)[objc_alloc(MEMORY[0x1E4F62AF0]) initWithReason:@"MCUI reboot iOS device"];
    [v1 setRebootType:1];
    v0 = [MEMORY[0x1E4F62AF8] sharedService];
    [v0 shutdownWithOptions:v1];
  }
}

void __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) MCUITopViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

@end