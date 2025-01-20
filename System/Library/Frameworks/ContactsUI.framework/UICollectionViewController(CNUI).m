@interface UICollectionViewController(CNUI)
- (uint64_t)refreshAccountsNow:()CNUI;
- (void)_cnui_beginRefreshingWithDuration:()CNUI;
- (void)_cnui_updateAccountsRefreshControl;
@end

@implementation UICollectionViewController(CNUI)

- (void)_cnui_updateAccountsRefreshControl
{
  v2 = [a1 traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 5)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke;
    v4[3] = &unk_1E549B1C0;
    v4[4] = a1;
    objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_canRequestRefreshWithCompletion:", v4);
  }
}

- (void)_cnui_beginRefreshingWithDuration:()CNUI
{
  uint64_t v3 = [a1 collectionView];
  v4 = [v3 refreshControl];

  if (([v4 isRefreshing] & 1) == 0) {
    [v4 beginRefreshing];
  }
  if ([v4 isRefreshing])
  {
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__UICollectionViewController_CNUI___cnui_beginRefreshingWithDuration___block_invoke;
    block[3] = &unk_1E549B488;
    id v7 = v4;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
}

- (uint64_t)refreshAccountsNow:()CNUI
{
  objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_requestRefreshWithUserAction:", 1);

  return objc_msgSend(a1, "_cnui_beginRefreshingWithDuration:", 1.0);
}

@end