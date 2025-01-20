@interface AMSUIWebFlowController
- (AMSUIWebClientContext)context;
- (AMSUIWebContainerViewController)currentContainer;
- (AMSUIWebContainerViewController)rootContainer;
- (AMSUIWebFlowController)initWithRootContainer:(id)a3 context:(id)a4;
- (NSLock)timeoutLock;
- (NSMutableSet)timeouts;
- (NSString)currentRefreshToken;
- (id)_refreshPageWithForContainer:(id)a3 options:(id)a4 isRetry:(BOOL)a5;
- (id)navigationControllerForViewController:(id)a3;
- (id)refreshPageForContainer:(id)a3 options:(id)a4;
- (id)replaceWithPageModel:(id)a3 forContainer:(id)a4 options:(id)a5;
- (int64_t)previousPageIndex;
- (unint64_t)previousNavigationIndex;
- (void)_setWindowSize:(CGSize)a3 onContainer:(id)a4 completion:(id)a5;
- (void)_takeSnapshotFromContainer:(id)a3 completion:(id)a4;
- (void)dismissViewController;
- (void)performSafeTransitionFrom:(id)a3 block:(id)a4;
- (void)popViewController;
- (void)popViewControllerToRelativeIndex:(int64_t)a3;
- (void)presentWithOptions:(id)a3;
- (void)pushWithOptions:(id)a3;
- (void)setCurrentRefreshToken:(id)a3;
- (void)setPreviousNavigationIndex:(unint64_t)a3;
- (void)setPreviousPageIndex:(int64_t)a3;
- (void)setTimeoutLock:(id)a3;
- (void)setTimeouts:(id)a3;
- (void)startTimeout:(double)a3 queue:(id)a4 block:(id)a5;
- (void)startTimeoutInterruption;
- (void)stopTimeoutInterruption;
@end

@implementation AMSUIWebFlowController

- (AMSUIWebFlowController)initWithRootContainer:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFlowController;
  v8 = [(AMSUIWebFlowController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v7);
    objc_storeWeak((id *)&v9->_rootContainer, v6);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    timeouts = v9->_timeouts;
    v9->_timeouts = v10;
  }
  return v9;
}

- (AMSUIWebContainerViewController)currentContainer
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(AMSUIWebFlowController *)self rootContainer];
  v4 = [v3 nextContainer];

  if (v4)
  {
    do
    {
      v5 = [v3 nextContainer];

      id v6 = [v5 nextContainer];

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return (AMSUIWebContainerViewController *)v5;
}

- (void)dismissViewController
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AMSUIWebFlowController *)self currentContainer];
  v4 = [MEMORY[0x263F27E08] currentProcess];
  v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.ios.StoreKitUIService"];

  id v7 = v3;
  if (v6)
  {
    v8 = [(AMSUIWebFlowController *)self currentContainer];
    uint64_t v9 = [v8 navigationController];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v3;
    }
    id v7 = v11;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__AMSUIWebFlowController_dismissViewController__block_invoke;
  v13[3] = &unk_2643E3118;
  id v14 = v3;
  id v12 = v3;
  objc_msgSend(v7, "ams_dismissViewControllerAnimated:includePresented:completion:", 1, 1, v13);
}

uint64_t __47__AMSUIWebFlowController_dismissViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleModalDismissal];
}

- (void)performSafeTransitionFrom:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke;
  v9[3] = &unk_2643E33B0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transitionCoordinator];
  int v3 = [v2 isInteractive];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) transitionCoordinator];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke_2;
    v6[3] = &unk_2643E4F88;
    id v7 = *(id *)(a1 + 40);
    [v4 notifyWhenInteractionChangesUsingBlock:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)popViewController
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v3 = [(AMSUIWebFlowController *)self currentContainer];
  id v7 = [(AMSUIWebFlowController *)self navigationControllerForViewController:v3];

  v4 = [v7 viewControllers];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    id v6 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (void)popViewControllerToRelativeIndex:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t v5 = [(AMSUIWebFlowController *)self context];
  id v6 = [v5 flowController];
  id v7 = [v6 currentContainer];

  id v8 = [v7 pushPresentationDelegate];

  if (v8)
  {
    do
    {
      id v19 = [v7 pushPresentationDelegate];

      uint64_t v9 = [v19 pushPresentationDelegate];

      id v10 = v19;
      id v7 = v19;
    }
    while (v9);
  }
  else
  {
    id v10 = v7;
  }
  id v20 = v10;
  id v11 = -[AMSUIWebFlowController navigationControllerForViewController:](self, "navigationControllerForViewController:");
  id v12 = [v11 viewControllers];
  uint64_t v13 = [v12 count];
  while (--v13 >= 0)
  {
    id v14 = [v12 objectAtIndexedSubscript:v13];
    int v15 = objc_msgSend(v14, "ams_hasDescendentChildViewController:", v20);

    if (v15) {
      goto LABEL_10;
    }
  }
  uint64_t v13 = 0;
LABEL_10:
  unint64_t v16 = v13 + a3;
  if (a3 || v16 != [v12 count] - 1)
  {
    if ((v16 & 0x8000000000000000) != 0 || v16 >= [v12 count])
    {
      [(AMSUIWebFlowController *)self popViewController];
    }
    else
    {
      v17 = [v12 objectAtIndexedSubscript:v16];
      id v18 = (id)[v11 popToViewController:v17 animated:1];
    }
  }
}

- (void)presentWithOptions:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    unint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [(AMSUIWebFlowController *)self context];
    uint64_t v9 = [v8 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = v7;
    __int16 v48 = 2114;
    v49 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Presenting new page", buf, 0x16u);
  }
  id v10 = [(AMSUIWebFlowController *)self currentContainer];
  id v11 = [v4 loadingPage];
  id v12 = [v11 navigationBar];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v4 navigationBar];
  }
  int v15 = v14;

  unint64_t v16 = [AMSUIWebPlaceholderViewController alloc];
  v17 = [v4 loadingPage];
  id v18 = [(AMSUIWebFlowController *)self context];
  id v19 = [v10 appearance];
  id v20 = [(AMSUIWebPlaceholderViewController *)v16 initWithModel:v17 context:v18 appearance:v19];

  [(AMSUIWebPlaceholderViewController *)v20 setAnimateFadeIn:1];
  v21 = [AMSUIWebContainerViewController alloc];
  v22 = [v10 appearance];
  v23 = [(AMSUIWebFlowController *)self context];
  v24 = [(AMSUIWebContainerViewController *)v21 initWithViewController:v20 appearance:v22 navigationBar:v15 context:v23];

  v25 = [v4 pageData];
  [(AMSUIWebContainerViewController *)v24 setPageInfo:v25];

  v26 = [(AMSUIWebContainerViewController *)v24 appearance];
  v27 = [v4 backgroundColor];
  [v26 updateBackgroundColorWithJSString:v27];

  [(AMSUIWebContainerViewController *)v24 setModalPresentationDelegate:v10];
  -[AMSUIWebContainerViewController setContainerIndex:](v24, "setContainerIndex:", [v10 containerIndex] + 1);
  [v10 setNextContainer:v24];
  uint64_t v28 = 2 * ([v4 modalPresentationStyle] != 1);
  uint64_t v29 = 2 * ([v4 modalTransitionStyle] == 1);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke;
  aBlock[3] = &unk_2643E4FB0;
  v30 = v24;
  uint64_t v44 = v28;
  uint64_t v45 = v29;
  v42 = v30;
  id v43 = v10;
  id v31 = v10;
  v32 = _Block_copy(aBlock);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke_2;
  v36[3] = &unk_2643E5000;
  id v37 = v4;
  v38 = self;
  v39 = v30;
  id v40 = v32;
  v33 = v30;
  id v34 = v32;
  id v35 = v4;
  [(AMSUIWebFlowController *)self _takeSnapshotFromContainer:v31 completion:v36];
}

void __45__AMSUIWebFlowController_presentWithOptions___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:*(void *)(a1 + 32)];
  [v4 setModalPresentationStyle:*(void *)(a1 + 48)];
  [v4 setModalTransitionStyle:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [v4 presentationController];
  [v3 setDelegate:v2];

  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

void __45__AMSUIWebFlowController_presentWithOptions___block_invoke_2(id *a1)
{
  if ([a1[4] deferredPresentation])
  {
    uint64_t v2 = [a1[5] context];
    int v3 = [v2 flowController];
    id v4 = [v3 refreshPageForContainer:a1[6] options:a1[4]];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke_3;
    v6[3] = &unk_2643E4FD8;
    id v7 = a1[6];
    id v8 = a1[7];
    [v4 addFinishBlock:v6];
  }
  else
  {
    unint64_t v5 = (void (*)(void))*((void *)a1[7] + 2);
    v5();
  }
}

uint64_t __45__AMSUIWebFlowController_presentWithOptions___block_invoke_3(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [*(id *)(a1 + 32) setShouldSkipInitialRefresh:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)navigationControllerForViewController:(id)a3
{
  return (id)objc_msgSend(a3, "ams_navigationController");
}

- (void)pushWithOptions:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t v5 = [(AMSUIWebFlowController *)self currentContainer];
  id v6 = [(AMSUIWebFlowController *)self navigationControllerForViewController:v5];

  uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v8 = (AMSUIWebPlaceholderViewController *)v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [(AMSUIWebPlaceholderViewController *)v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = [(AMSUIWebFlowController *)self context];
      id v12 = [v11 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v10;
      __int16 v47 = 2114;
      __int16 v48 = v12;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Pushing new page", buf, 0x16u);
    }
    uint64_t v13 = [(AMSUIWebFlowController *)self currentContainer];
    id v14 = [AMSUIWebPlaceholderViewController alloc];
    int v15 = [v4 loadingPage];
    unint64_t v16 = [(AMSUIWebFlowController *)self context];
    v17 = [v13 appearance];
    id v8 = [(AMSUIWebPlaceholderViewController *)v14 initWithModel:v15 context:v16 appearance:v17];

    [(AMSUIWebPlaceholderViewController *)v8 setAnimateFadeIn:1];
    id v18 = [v4 loadingPage];
    id v19 = [v18 navigationBar];
    id v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      v21 = [v4 navigationBar];
    }
    v22 = v21;

    v26 = [AMSUIWebContainerViewController alloc];
    v27 = [v13 appearance];
    uint64_t v28 = [(AMSUIWebFlowController *)self context];
    uint64_t v29 = [(AMSUIWebContainerViewController *)v26 initWithViewController:v8 appearance:v27 navigationBar:v22 context:v28];

    v30 = [(AMSUIWebContainerViewController *)v29 appearance];
    id v31 = [v4 backgroundColor];
    [v30 updateBackgroundColorWithJSString:v31];

    v32 = [v4 pageData];
    [(AMSUIWebContainerViewController *)v29 setPageInfo:v32];

    v33 = [v13 modalPresentationDelegate];
    [(AMSUIWebContainerViewController *)v29 setModalPresentationDelegate:v33];

    [(AMSUIWebContainerViewController *)v29 setPushPresentationDelegate:v13];
    -[AMSUIWebContainerViewController setContainerIndex:](v29, "setContainerIndex:", [v13 containerIndex] + 1);
    [v13 setNextContainer:v29];
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    v39 = __42__AMSUIWebFlowController_pushWithOptions___block_invoke;
    id v40 = &unk_2643E38F0;
    id v41 = v4;
    v42 = self;
    id v43 = v13;
    uint64_t v44 = v29;
    id v34 = v29;
    id v35 = v13;
    v36 = _Block_copy(&v37);
    -[AMSUIWebFlowController _takeSnapshotFromContainer:completion:](self, "_takeSnapshotFromContainer:completion:", v35, v36, v37, v38, v39, v40);
  }
  else
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v22 = [(AMSUIWebPlaceholderViewController *)v8 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = [(AMSUIWebFlowController *)self context];
      v25 = [v24 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v23;
      __int16 v47 = 2114;
      __int16 v48 = v25;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Push failed, no navigation controller found.", buf, 0x16u);
    }
  }
}

void __42__AMSUIWebFlowController_pushWithOptions___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) deferredPresentation];
  int v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = [v3 context];
    unint64_t v5 = [v4 flowController];
    id v6 = [v5 refreshPageForContainer:*(void *)(a1 + 56) options:*(void *)(a1 + 32)];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__AMSUIWebFlowController_pushWithOptions___block_invoke_2;
    v11[3] = &unk_2643E3DD0;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = v9;
    id v15 = *(id *)(a1 + 32);
    [v6 addFinishBlock:v11];
  }
  else
  {
    id v10 = [v3 navigationControllerForViewController:*(void *)(a1 + 48)];
    objc_msgSend(v10, "pushViewController:animated:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "animated"));
  }
}

void __42__AMSUIWebFlowController_pushWithOptions___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [*(id *)(a1 + 32) setShouldSkipInitialRefresh:1];
  id v2 = [*(id *)(a1 + 40) navigationControllerForViewController:*(void *)(a1 + 48)];
  objc_msgSend(v2, "pushViewController:animated:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 56), "animated"));
}

- (id)replaceWithPageModel:(id)a3 forContainer:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [v8 loadPage];
  objc_initWeak(&location, v9);
  objc_initWeak(&from, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke;
  v17[3] = &unk_2643E5050;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  id v14 = v10;
  id v20 = v14;
  [v11 addSuccessBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_11;
  v16[3] = &unk_2643E3570;
  v16[4] = self;
  [v11 addErrorBlock:v16];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v11;
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_2;
  v3[3] = &unk_2643E5050;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_copyWeak(&v8, (id *)(a1 + 72));
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) windowSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_3;
  v8[3] = &unk_2643E5028;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  objc_copyWeak(&v12, (id *)(a1 + 72));
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_setWindowSize:onContainer:completion:", v7, v8, v4, v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_3(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = objc_loadWeakRetained(a1 + 7);
  if ([a1[4] reuseExistingPage]
    && ([WeakRetained containedViewController],
        double v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v6 = [WeakRetained containedViewController];
  }
  else
  {
    uint64_t v6 = [a1[5] createViewControllerForContainer:WeakRetained];
  }
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    id v8 = [WeakRetained appearance];
    id v9 = [a1[5] backgroundColor];
    [v8 updateBackgroundColorWithJSString:v9];

    if (objc_opt_respondsToSelector())
    {
      id v10 = a1[5];
      id v11 = [WeakRetained appearance];
      [v7 willPresentPageModel:v10 appearance:v11];
    }
    [WeakRetained updateSafeAreaEdgesForPageModel:a1[5]];
    id v12 = [a1[5] navigationBar];
    [WeakRetained applyNavigationModel:v12];

    [WeakRetained setupToolbarAnimated:0];
    id v13 = [WeakRetained containedViewController];

    if (v13 != v7)
    {
      objc_msgSend(WeakRetained, "setDisableReappearPlaceholder:", objc_msgSend(a1[5], "disableReappearPlaceholder"));
      objc_msgSend(WeakRetained, "replaceContentWithViewController:animated:completion:", v7, objc_msgSend(a1[4], "animated"), 0);
      id v14 = [a1[5] impressionEvent];

      if (v14)
      {
        id v15 = [v3 context];
        unint64_t v16 = [v15 metrics];
        v17 = [a1[5] impressionEvent];
        [v16 enqueueEvent:v17];
      }
    }
  }
  else
  {
    id v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v18)
    {
      id v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      id v21 = [v3 context];
      id v22 = [v21 logKey];
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      v26 = v22;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to present a nil view controller", (uint8_t *)&v23, 0x16u);
    }
  }
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_11(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    id v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    double v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 logKey];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encountered error when loading page.", (uint8_t *)&v7, 0x16u);
  }
}

- (id)refreshPageForContainer:(id)a3 options:(id)a4
{
  return [(AMSUIWebFlowController *)self _refreshPageWithForContainer:a3 options:a4 isRetry:0];
}

- (void)startTimeoutInterruption
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIWebFlowController *)self timeoutLock];
  [v3 lock];

  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = [(AMSUIWebFlowController *)self context];
    uint64_t v8 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    int v23 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Starting timeout interruption.", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v9 = [(AMSUIWebFlowController *)self timeouts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13++) pause];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  id v14 = [(AMSUIWebFlowController *)self timeoutLock];
  [v14 unlock];
}

- (void)startTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  __int16 v9 = (void *)MEMORY[0x263F27CB8];
  id v10 = a4;
  uint64_t v11 = [v9 sharedWebUIConfig];
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = [(AMSUIWebFlowController *)self context];
    long long v15 = [v14 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v13;
    __int16 v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Starting timeout...", buf, 0x16u);
  }
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  int v23 = __51__AMSUIWebFlowController_startTimeout_queue_block___block_invoke;
  uint64_t v24 = &unk_2643E5078;
  __int16 v25 = self;
  id v26 = v8;
  id v16 = v8;
  long long v17 = +[AMSUIWebFlowTimeout timeoutWithTimeout:v10 queue:&v21 block:a3];

  long long v18 = [(AMSUIWebFlowController *)self timeoutLock];
  [v18 lock];

  id v19 = [(AMSUIWebFlowController *)self timeouts];
  [v19 addObject:v17];

  [v17 start];
  uint64_t v20 = [(AMSUIWebFlowController *)self timeoutLock];
  [v20 unlock];
}

uint64_t __51__AMSUIWebFlowController_startTimeout_queue_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 timeoutLock];
  [v5 lock];

  uint64_t v6 = [*(id *)(a1 + 32) timeouts];
  [v6 removeObject:v4];

  int v7 = [*(id *)(a1 + 32) timeoutLock];
  [v7 unlock];

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

- (void)stopTimeoutInterruption
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIWebFlowController *)self timeoutLock];
  [v3 lock];

  id v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = [(AMSUIWebFlowController *)self context];
    id v8 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Stopping timeout interruption.", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __int16 v9 = [(AMSUIWebFlowController *)self timeouts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v14 reset];
        [v14 start];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  long long v15 = [(AMSUIWebFlowController *)self timeoutLock];
  [v15 unlock];
}

- (id)_refreshPageWithForContainer:(id)a3 options:(id)a4 isRetry:(BOOL)a5
{
  BOOL v5 = a5;
  v54[6] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v38 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v37 = [v10 UUIDString];

  [(AMSUIWebFlowController *)self setCurrentRefreshToken:v37];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke;
  v47[3] = &unk_2643E50C8;
  objc_copyWeak(&v49, &location);
  objc_copyWeak(&v50, &from);
  id v11 = v9;
  id v48 = v11;
  [v38 addErrorBlock:v47];
  if (([v11 disableTimeout] & 1) == 0)
  {
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2_26;
    v45[3] = &unk_2643E3118;
    id v46 = v38;
    [(AMSUIWebFlowController *)self startTimeout:MEMORY[0x263EF83A0] queue:v45 block:10.0];
  }
  if (([v11 deferredPresentation] & 1) == 0)
  {
    uint64_t v12 = [v8 containedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v14 = [v11 loadingPage];
      long long v15 = v14;
      if (v14)
      {
        long long v16 = v14;
      }
      else
      {
        long long v17 = [AMSUIWebLoadingPageModel alloc];
        long long v18 = [(AMSUIWebFlowController *)self context];
        long long v16 = [(AMSUIWebLoadingPageModel *)v17 initWithContext:v18];
      }
      id v19 = [(AMSUIWebFlowController *)self replaceWithPageModel:v16 forContainer:v8 options:0];
    }
  }
  v53[0] = @"data";
  uint64_t v20 = [v11 pageData];
  uint64_t v21 = (void *)v20;
  uint64_t v22 = MEMORY[0x263EFFA78];
  if (v20) {
    uint64_t v22 = v20;
  }
  v54[0] = v22;
  v53[1] = @"isRetry";
  __int16 v23 = [NSNumber numberWithBool:v5];
  v54[1] = v23;
  v53[2] = @"navigationIndex";
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "ams_navigationIndex"));
  v54[2] = v24;
  v53[3] = @"previousNavigationIndex";
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AMSUIWebFlowController previousNavigationIndex](self, "previousNavigationIndex"));
  v54[3] = v25;
  v53[4] = @"pageIndex";
  id v26 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v8, "containerIndex"));
  v54[4] = v26;
  v53[5] = @"previousPageIndex";
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithLong:", -[AMSUIWebFlowController previousPageIndex](self, "previousPageIndex"));
  v54[5] = v27;
  uint64_t v28 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:6];

  __int16 v29 = [(AMSUIWebFlowController *)self context];
  v30 = [v29 dataProvider];
  uint64_t v31 = [v30 loadPageModelWithInfo:v28];

  -[AMSUIWebFlowController setPreviousNavigationIndex:](self, "setPreviousNavigationIndex:", objc_msgSend(v8, "ams_navigationIndex"));
  -[AMSUIWebFlowController setPreviousPageIndex:](self, "setPreviousPageIndex:", [v8 containerIndex]);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_3;
  v39[3] = &unk_2643E5118;
  objc_copyWeak(&v43, &location);
  objc_copyWeak(&v44, &from);
  id v32 = v38;
  id v40 = v32;
  id v33 = v37;
  id v41 = v33;
  id v34 = v11;
  id v42 = v34;
  [v31 addFinishBlock:v39];
  id v35 = [v32 binaryPromiseAdapter];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v35;
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2;
  v5[3] = &unk_2643E5028;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2(id *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = objc_loadWeakRetained(a1 + 7);
  if (([a1[4] suppressErrorPage] & 1) == 0)
  {
    BOOL v5 = [WeakRetained currentContainer];
    id v6 = [v5 containedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v8)
      {
        id v8 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v10;
        __int16 v32 = 2114;
        id v33 = v11;
        _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping error page since container is currently an error.", buf, 0x16u);
      }
LABEL_7:

      goto LABEL_17;
    }
    uint64_t v12 = [a1[5] userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"skipErrorView"];
    if (objc_opt_respondsToSelector())
    {
      id v14 = [a1[5] userInfo];
      long long v15 = [v14 objectForKeyedSubscript:@"skipErrorView"];
      int v16 = [v15 BOOLValue];

      if (v16)
      {
        id v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v8)
        {
          id v8 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        id v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = objc_opt_class();
          long long v18 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v17;
          __int16 v32 = 2114;
          id v33 = v18;
          _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping error page.", buf, 0x16u);
        }
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v19 = [AMSUIWebErrorPageModel alloc];
    id v20 = a1[5];
    uint64_t v21 = [WeakRetained context];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_24;
    v26[3] = &unk_2643E50A0;
    objc_copyWeak(&v28, v2);
    objc_copyWeak(&v29, a1 + 7);
    id v27 = a1[4];
    uint64_t v22 = [(AMSUIWebErrorPageModel *)v19 initWithError:v20 context:v21 actionBlock:v26];

    __int16 v23 = [WeakRetained context];
    uint64_t v24 = [v23 flowController];
    id v25 = (id)[v24 replaceWithPageModel:v22 forContainer:v4 options:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
  }
LABEL_17:
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_24(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if ((a2 & 1) == 0) {
    id v5 = (id)[WeakRetained _refreshPageWithForContainer:v4 options:*(void *)(a1 + 32) isRetry:1];
  }
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2_26(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    AMSErrorWithFormat();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) finishWithError:v2];
  }
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = [WeakRetained context];
  uint64_t v10 = [v9 dataProvider];
  id v11 = [v10 loadPageRenderData];

  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  __int16 v23 = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_4;
  uint64_t v24 = &unk_2643E50F0;
  id v12 = v8;
  id v25 = v12;
  id v13 = v5;
  id v26 = v13;
  [v11 addFinishBlock:&v21];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished", v21, v22, v23, v24) & 1) == 0)
  {
    if (v6)
    {
      [*(id *)(a1 + 32) finishWithError:v6];
      goto LABEL_11;
    }
    id v14 = [WeakRetained currentContainer];

    if (v14 == v12)
    {
      int v16 = *(void **)(a1 + 40);
      uint64_t v17 = [WeakRetained currentRefreshToken];
      LOBYTE(v16) = [v16 isEqualToString:v17];

      if (v16)
      {
        long long v18 = [WeakRetained replaceWithPageModel:v13 forContainer:v12 options:*(void *)(a1 + 48)];
        id v19 = *(void **)(a1 + 32);
        id v20 = [v18 promiseAdapter];
        [v19 finishWithPromise:v20];

LABEL_10:
        goto LABEL_11;
      }
      long long v15 = *(void **)(a1 + 32);
    }
    else
    {
      long long v15 = *(void **)(a1 + 32);
    }
    long long v18 = AMSCustomError();
    [v15 finishWithError:v18];
    goto LABEL_10;
  }
LABEL_11:
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [*(id *)(a1 + 32) pageMetrics];
  id v7 = [v5 dictionaryWithDictionary:v6];

  id v8 = [*(id *)(a1 + 40) navigationBar];
  id v9 = [v8 title];
  [v7 setObject:v9 forKeyedSubscript:@"pageType"];

  uint64_t v10 = [*(id *)(a1 + 32) pageRenderPresenter];
  [v10 endWithActivity:0 pageMetrics:v7];

  if (!a3)
  {
    id v11 = [*(id *)(a1 + 32) pageRenderPresenter];
    id v12 = [v14 objectForKeyedSubscript:@"properties"];
    [v11 importTimings:v12];
  }
  id v13 = [*(id *)(a1 + 32) pageRenderPresenter];
  [v13 enqueueEvent];
}

- (void)_setWindowSize:(CGSize)a3 onContainer:(id)a4 completion:(id)a5
{
}

- (void)_takeSnapshotFromContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = [v6 containedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [v6 containedViewController];
    [v6 cacheScrollViewPositionFor:v10];

    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__5;
    id v25 = __Block_byref_object_dispose__5;
    id v11 = [AMSUIWebPlaceholderViewController alloc];
    id v12 = [v6 containedViewController];
    id v13 = [(AMSUIWebFlowController *)self context];
    id v14 = [v6 appearance];
    id v26 = [(AMSUIWebPlaceholderViewController *)v11 initWithSnapshot:v12 context:v13 appearance:v14];

    objc_initWeak(&location, v6);
    long long v15 = (void *)v22[5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__AMSUIWebFlowController__takeSnapshotFromContainer_completion___block_invoke;
    v16[3] = &unk_2643E5140;
    objc_copyWeak(&v19, &location);
    long long v18 = &v21;
    uint64_t v17 = v7;
    [v15 awaitSnapshotWithCompletion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v21, 8);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __64__AMSUIWebFlowController__takeSnapshotFromContainer_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained containedViewController];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setOriginalViewController:v2];

  [WeakRetained replaceContentWithViewController:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animated:0 completion:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (AMSUIWebContainerViewController)rootContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  return (AMSUIWebContainerViewController *)WeakRetained;
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (NSString)currentRefreshToken
{
  return self->_currentRefreshToken;
}

- (void)setCurrentRefreshToken:(id)a3
{
}

- (NSLock)timeoutLock
{
  return self->_timeoutLock;
}

- (void)setTimeoutLock:(id)a3
{
}

- (NSMutableSet)timeouts
{
  return self->_timeouts;
}

- (void)setTimeouts:(id)a3
{
}

- (unint64_t)previousNavigationIndex
{
  return self->_previousNavigationIndex;
}

- (void)setPreviousNavigationIndex:(unint64_t)a3
{
  self->_previousNavigationIndex = a3;
}

- (int64_t)previousPageIndex
{
  return self->_previousPageIndex;
}

- (void)setPreviousPageIndex:(int64_t)a3
{
  self->_previousPageIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_timeoutLock, 0);
  objc_storeStrong((id *)&self->_currentRefreshToken, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_rootContainer);
}

@end