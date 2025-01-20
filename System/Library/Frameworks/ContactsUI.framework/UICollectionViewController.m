@interface UICollectionViewController
@end

@implementation UICollectionViewController

void __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke_2;
  v2[3] = &unk_1E5499510;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) collectionView];
  id v8 = v3;
  if (v2)
  {
    v4 = [v3 refreshControl];

    if (v4) {
      return;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1B58]);
    v6 = [*(id *)(a1 + 32) collectionView];
    [v6 setRefreshControl:v5];

    id v8 = [*(id *)(a1 + 32) collectionView];
    v7 = [v8 refreshControl];
    [v7 addTarget:*(void *)(a1 + 32) action:sel_refreshAccountsNow_ forControlEvents:4096];
  }
  else
  {
    [v3 setRefreshControl:0];
  }
}

uint64_t __70__UICollectionViewController_CNUI___cnui_beginRefreshingWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRefreshing];
}

@end