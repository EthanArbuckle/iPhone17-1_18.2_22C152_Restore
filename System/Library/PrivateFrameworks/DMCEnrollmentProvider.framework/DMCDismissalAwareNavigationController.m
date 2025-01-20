@interface DMCDismissalAwareNavigationController
- (BOOL)isPresentingAlert;
- (BOOL)isPushBlocked;
- (BOOL)pendingPushAnimated;
- (NSArray)pendingViewControllers;
- (id)dismissedCompletionBlock;
- (id)rootViewController;
- (id)transitionCompletionBlock;
- (void)blockNavigationPush;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)presentAlert:(id)a3 animated:(BOOL)a4;
- (void)setDismissedCompletionBlock:(id)a3;
- (void)setIsPresentingAlert:(BOOL)a3;
- (void)setIsPushBlocked:(BOOL)a3;
- (void)setPendingPushAnimated:(BOOL)a3;
- (void)setPendingViewControllers:(id)a3;
- (void)setTransitionCompletionBlock:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)unblockNavigationPush;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation DMCDismissalAwareNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DMCDismissalAwareNavigationController;
  [(DMCDismissalAwareNavigationController *)&v16 viewDidDisappear:a3];
  v4 = [(DMCDismissalAwareNavigationController *)self presentingViewController];

  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(DMCDismissalAwareNavigationController *)self viewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&unk_26D46D0B8]) {
            [v10 viewControllerHasBeenDismissed];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }

    dismissedCompletionBlock = (void (**)(void))self->_dismissedCompletionBlock;
    if (dismissedCompletionBlock) {
      dismissedCompletionBlock[2]();
    }
  }
}

- (void)presentAlert:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(DMCDismissalAwareNavigationController *)self _isTransitioning] & 1) != 0
    || ([(DMCDismissalAwareNavigationController *)self disappearingViewController],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke;
    v19[3] = &unk_2645E9410;
    id v20 = v6;
    BOOL v21 = v4;
    id v8 = v6;
    [(DMCDismissalAwareNavigationController *)self setTransitionCompletionBlock:v19];
    v9 = v20;
  }
  else
  {
    [(DMCDismissalAwareNavigationController *)self setIsPresentingAlert:1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_2;
    v17[3] = &unk_2645E92D0;
    v17[4] = self;
    id v18 = v6;
    id v10 = v6;
    v11 = (void *)MEMORY[0x223C90320](v17);
    long long v12 = [(DMCDismissalAwareNavigationController *)self topViewController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_3;
    v15[3] = &unk_2645E9320;
    id v16 = v11;
    id v13 = v11;
    [v12 presentViewController:v10 animated:v4 completion:v15];

    dispatch_time_t v14 = dispatch_time(0, 1000000000);
    dispatch_after(v14, MEMORY[0x263EF83A0], v13);

    v9 = v18;
  }
}

uint64_t __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

void __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPresentingAlert])
  {
    [*(id *)(a1 + 32) setIsPresentingAlert:0];
    v2 = [*(id *)(a1 + 32) transitionCompletionBlock];

    if (v2)
    {
      v3 = [*(id *)(a1 + 32) transitionCompletionBlock];
      v3[2](v3, *(void *)(a1 + 40));

      BOOL v4 = *(void **)(a1 + 32);
      [v4 setTransitionCompletionBlock:0];
    }
  }
}

void __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_4;
  block[3] = &unk_2645E9320;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(DMCDismissalAwareNavigationController *)self isPushBlocked])
  {
    uint64_t v7 = (void *)[v6 copy];
    [(DMCDismissalAwareNavigationController *)self setPendingViewControllers:v7];

    [(DMCDismissalAwareNavigationController *)self setPendingPushAnimated:v4];
  }
  else if ([(DMCDismissalAwareNavigationController *)self isPresentingAlert])
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__DMCDismissalAwareNavigationController_setViewControllers_animated___block_invoke;
    v9[3] = &unk_2645E9438;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    BOOL v12 = v4;
    [(DMCDismissalAwareNavigationController *)self setTransitionCompletionBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DMCDismissalAwareNavigationController;
    [(DMCDismissalAwareNavigationController *)&v8 setViewControllers:v6 animated:v4];
  }
}

void __69__DMCDismissalAwareNavigationController_setViewControllers_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setViewControllers:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCDismissalAwareNavigationController;
  [(DMCDismissalAwareNavigationController *)&v10 didShowViewController:v6 animated:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__DMCDismissalAwareNavigationController_didShowViewController_animated___block_invoke;
  v8[3] = &unk_2645E92D0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __72__DMCDismissalAwareNavigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transitionCompletionBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) transitionCompletionBlock];
    v3[2](v3, *(void *)(a1 + 40));

    BOOL v4 = *(void **)(a1 + 32);
    [v4 setTransitionCompletionBlock:0];
  }
}

- (id)rootViewController
{
  id v2 = [(DMCDismissalAwareNavigationController *)self viewControllers];
  v3 = [v2 objectAtIndexedSubscript:0];

  return v3;
}

- (void)blockNavigationPush
{
}

- (void)unblockNavigationPush
{
  [(DMCDismissalAwareNavigationController *)self setIsPushBlocked:0];
  v3 = [(DMCDismissalAwareNavigationController *)self pendingViewControllers];

  if (v3)
  {
    BOOL v4 = [(DMCDismissalAwareNavigationController *)self pendingViewControllers];
    [(DMCDismissalAwareNavigationController *)self setViewControllers:v4 animated:[(DMCDismissalAwareNavigationController *)self pendingPushAnimated]];

    [(DMCDismissalAwareNavigationController *)self setPendingViewControllers:0];
  }
}

- (id)dismissedCompletionBlock
{
  return self->_dismissedCompletionBlock;
}

- (void)setDismissedCompletionBlock:(id)a3
{
}

- (BOOL)isPresentingAlert
{
  return self->_isPresentingAlert;
}

- (void)setIsPresentingAlert:(BOOL)a3
{
  self->_isPresentingAlert = a3;
}

- (id)transitionCompletionBlock
{
  return self->_transitionCompletionBlock;
}

- (void)setTransitionCompletionBlock:(id)a3
{
}

- (BOOL)isPushBlocked
{
  return self->_isPushBlocked;
}

- (void)setIsPushBlocked:(BOOL)a3
{
  self->_isPushBlocked = a3;
}

- (BOOL)pendingPushAnimated
{
  return self->_pendingPushAnimated;
}

- (void)setPendingPushAnimated:(BOOL)a3
{
  self->_pendingPushAnimated = a3;
}

- (NSArray)pendingViewControllers
{
  return self->_pendingViewControllers;
}

- (void)setPendingViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingViewControllers, 0);
  objc_storeStrong(&self->_transitionCompletionBlock, 0);
  objc_storeStrong(&self->_dismissedCompletionBlock, 0);
}

@end