@interface QLMovieItemAggregatedViewController
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
@end

@implementation QLMovieItemAggregatedViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFA470];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v15[3] = &unk_2642F68F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 assetIsAutoloopMedia:v14 completionHandler:v15];
}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  id v2 = a1[5];
  id v3 = a1[6];
  id v4 = a1[7];
  QLRunInMainThread();
}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_new();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1144), v2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v6[3] = &unk_2642F68A8;
  objc_copyWeak(&v9, &location);
  id v5 = v2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  [v5 loadPreviewControllerIfNeededWithContents:v3 context:v4 completionHandler:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  id v4 = a1[4];
  id v6 = a1[5];
  id v5 = v3;
  QLRunInMainThread();

  objc_destroyWeak(&v7);
}

uint64_t __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained showPreviewViewController:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end