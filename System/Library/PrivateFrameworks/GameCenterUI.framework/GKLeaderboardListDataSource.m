@interface GKLeaderboardListDataSource
- (CGSize)standardCellSizeForCollectionView:(id)a3;
- (GKLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4;
- (GKLeaderboardSet)leaderboardSet;
- (NSDictionary)assetNames;
- (NSMutableArray)leaderboards;
- (NSTimer)timer;
- (UICollectionView)collectionView;
- (id)itemForIndexPath:(id)a3;
- (id)title;
- (int64_t)itemCount;
- (void)dealloc;
- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)prepareCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)removeLeaderboardsWithoutImages;
- (void)setAssetNames:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setLeaderboardSet:(id)a3;
- (void)setLeaderboards:(id)a3;
- (void)setTimer:(id)a3;
- (void)setupCollectionView:(id)a3;
- (void)setupTimer;
- (void)updateHighlightsInSectionHeader:(id)a3;
@end

@implementation GKLeaderboardListDataSource

- (GKLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboardListDataSource;
  v7 = [(GKGameLayerCollectionDataSource *)&v10 initWithGameRecord:a3];
  v8 = v7;
  if (v7) {
    [(GKLeaderboardListDataSource *)v7 setLeaderboardSet:v6];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(GKLeaderboardListDataSource *)self timer];
  [v3 invalidate];

  [(GKLeaderboardListDataSource *)self setTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardListDataSource;
  [(GKLeaderboardListDataSource *)&v4 dealloc];
}

- (void)setupCollectionView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListDataSource;
  id v4 = a3;
  [(GKLeaderboardCollectionDataSource *)&v5 setupCollectionView:v4];
  -[GKLeaderboardListDataSource setCollectionView:](self, "setCollectionView:", v4, v5.receiver, v5.super_class);
}

- (void)setupTimer
{
  v3 = [(GKLeaderboardListDataSource *)self timer];

  if (v3)
  {
    id v4 = [(GKLeaderboardListDataSource *)self timer];
    [v4 invalidate];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke;
  v6[3] = &unk_1E5F64D28;
  v6[4] = self;
  objc_super v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v6 block:1.0];
  [(GKLeaderboardListDataSource *)self setTimer:v5];
}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  id v4 = [*(id *)(a1 + 32) leaderboards];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke_2;
  v13[3] = &unk_1E5F64D00;
  id v5 = v3;
  id v14 = v5;
  id v6 = v2;
  id v15 = v6;
  [v4 enumerateObjectsUsingBlock:v13];

  if ([v5 count])
  {
    v7 = (void *)MEMORY[0x1E4F63738];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke_3;
    v10[3] = &unk_1E5F63D90;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 loadLeaderboardsWithIDs:v5 completionHandler:v10];
  }
}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  if ([v14 type] == 1)
  {
    id v5 = [v14 nextStartDate];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      objc_super v10 = [v14 baseLeaderboardID];
      [v9 addObject:v10];

      id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
      uint64_t v12 = *(void **)(a1 + 40);
      v13 = [v14 baseLeaderboardID];
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
  }
}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = objc_msgSend(v10, "baseLeaderboardID", (void)v16);
        v13 = [v11 objectForKeyedSubscript:v12];

        [v4 addObject:v13];
        id v14 = [*(id *)(a1 + 40) leaderboards];
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v10, objc_msgSend(v13, "item"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id v15 = [*(id *)(a1 + 40) collectionView];
    [v15 reloadItemsAtIndexPaths:v4];
  }
}

- (id)title
{
  id v3 = [(GKLeaderboardListDataSource *)self leaderboardSet];

  if (v3)
  {
    id v4 = [(GKLeaderboardListDataSource *)self leaderboardSet];
    [v4 title];
  }
  else
  {
    id v4 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
  id v5 = };

  return v5;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v5 = (void *)MEMORY[0x1E4F636D8];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardListDataSource.m", 116, "-[GKLeaderboardListDataSource loadDataWithCompletionHandler:]");
  uint64_t v7 = [v5 dispatchGroupWithName:v6];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F64D50;
  v16[4] = self;
  long long v18 = v22;
  long long v19 = v20;
  id v8 = v7;
  id v17 = v8;
  [v8 perform:v16];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E5F64D78;
  id v14 = v20;
  v11[4] = self;
  id v9 = v4;
  id v13 = v9;
  id v15 = v22;
  id v10 = v8;
  id v12 = v10;
  [v10 notifyOnMainQueueWithBlock:v11];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63738];
  id v5 = [*(id *)(a1 + 32) leaderboardSet];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) gameRecord];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5F63600;
  id v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 48);
  id v11 = v8;
  id v12 = v3;
  id v9 = v3;
  [v4 loadLeaderboardsWithIDs:0 setIdentifier:v6 game:v7 completionHandler:v10];
}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) leaderboards];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 count] == 0;

  id v8 = [*(id *)(a1 + 32) leaderboards];
  if ([v8 isEqual:v5])
  {
LABEL_14:

    goto LABEL_15;
  }

  if (v5 || !v6)
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
    [*(id *)(a1 + 32) setLeaderboards:v9];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "type", (void)v14) == 1)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "setError:", v6, (void)v14);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [*(id *)(a1 + 32) setupTimer];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    id v4 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
  }
}

- (void)removeLeaderboardsWithoutImages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(GKLeaderboardListDataSource *)self leaderboards];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(GKLeaderboardListDataSource *)self leaderboards];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        assetNames = self->_assetNames;
        long long v13 = [v11 identifier];
        long long v14 = [(NSDictionary *)assetNames objectForKeyedSubscript:v13];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(GKLeaderboardListDataSource *)self setLeaderboards:v5];
}

- (int64_t)itemCount
{
  uint64_t v2 = [(GKLeaderboardListDataSource *)self leaderboards];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLeaderboardListDataSource *)self leaderboards];
  unint64_t v6 = [v5 count];
  if (v6 <= [v4 item])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(GKLeaderboardListDataSource *)self leaderboards];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v8;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  id v4 = a3;
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    *(double *)&uint64_t v5 = 288.0;
    double v6 = 188.0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    BOOL v8 = [v7 horizontalSizeClass] == 1 && objc_msgSend(v7, "verticalSizeClass") == 2;
    uint64_t v9 = [v7 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v9))
    {
      uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v11 = [v10 userInterfaceIdiom];

      *(double *)&uint64_t v5 = 282.0;
      if (v11 == 1)
      {
        double v6 = 696.0;
      }
      else if (v8)
      {
        [v4 frame];
        if (v16 + -20.0 <= 335.0) {
          double v6 = v16 + -20.0;
        }
        else {
          double v6 = 335.0;
        }
        if ([v9 isEqualToString:*MEMORY[0x1E4FB2778]])
        {
          *(double *)&uint64_t v5 = 564.0;
        }
        else if ([v9 isEqualToString:*MEMORY[0x1E4FB2780]])
        {
          *(double *)&uint64_t v5 = 534.0;
        }
        else if ([v9 isEqualToString:*MEMORY[0x1E4FB2788]])
        {
          *(double *)&uint64_t v5 = 504.0;
        }
        else if ([v9 isEqualToString:*MEMORY[0x1E4FB2790]])
        {
          *(double *)&uint64_t v5 = 474.0;
        }
        else
        {
          *(double *)&uint64_t v5 = 444.0;
        }
      }
      else
      {
        [v4 bounds];
        double v20 = v19;
        char v21 = [v4 superview];
        [v21 safeAreaInsets];
        double v23 = v20 - v22;
        v24 = [v4 superview];
        [v24 safeAreaInsets];
        double v6 = v23 - v25 + -32.0;
      }
    }
    else
    {
      if (v8)
      {
        [v4 frame];
        double v13 = v12 + -20.0;
        [(GKLeaderboardCollectionDataSource *)self cellSpacing];
        double v15 = (v13 - v14) * 0.5;
        if (v15 <= 162.0) {
          double v6 = v15;
        }
        else {
          double v6 = 162.0;
        }
      }
      else
      {
        double v6 = 162.0;
      }
      *(double *)&uint64_t v5 = 276.0;
    }
  }
  double v17 = v6;
  double v18 = *(double *)&v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)updateHighlightsInSectionHeader:(id)a3
{
  id v4 = a3;
  id v5 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  objc_msgSend(v4, "updateHighlightsWithGameRecord:leaderboardCount:setCount:", v5, -[GKLeaderboardListDataSource itemCount](self, "itemCount"), 0);
}

- (void)prepareCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a4 item];
  BOOL v8 = [(GKLeaderboardListDataSource *)self leaderboards];
  unint64_t v9 = [v8 count];

  if (v9 <= v7)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
    double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardListDataSource.m"];
    id v13 = [v12 lastPathComponent];
    double v14 = [v10 stringWithFormat:@"%@ (self.leaderboards.count > index)\n[%s (%s:%d)]", v11, "-[GKLeaderboardListDataSource prepareCell:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 238];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  double v15 = [(GKLeaderboardListDataSource *)self leaderboards];
  id v21 = [v15 objectAtIndexedSubscript:v7];

  double v16 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  double v17 = [v16 bundleIdentifier];
  [v6 setBundleIdentifier:v17];

  assetNames = self->_assetNames;
  double v19 = [v21 identifier];
  double v20 = [(NSDictionary *)assetNames objectForKeyedSubscript:v19];
  [v6 setImageName:v20];

  [v6 setLeaderboard:v21];
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  id v24 = a4;
  id v5 = [(GKGameLayerCollectionDataSource *)self presentationViewController];

  id v6 = v24;
  if (v5)
  {
    unint64_t v7 = [v24 item];
    BOOL v8 = [(GKLeaderboardListDataSource *)self leaderboards];
    unint64_t v9 = [v8 count];

    if (v9 <= v7)
    {
      uint64_t v10 = NSString;
      uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardListDataSource.m"];
      id v13 = [v12 lastPathComponent];
      double v14 = [v10 stringWithFormat:@"%@ (self.leaderboards.count > index)\n[%s (%s:%d)]", v11, "-[GKLeaderboardListDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 252];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    }
    double v15 = [(GKLeaderboardListDataSource *)self leaderboards];
    double v16 = [v15 objectAtIndexedSubscript:v7];

    double v17 = [MEMORY[0x1E4F63660] reporter];
    double v18 = [v16 baseLeaderboardID];
    [v17 recordClickWithAction:@"navigate" targetId:v18 targetType:@"button" pageId:@"leaderboardCollection" pageType:@"leaderboard"];

    double v19 = [GKLeaderboardScoreViewController alloc];
    double v20 = [(GKGameLayerCollectionDataSource *)self gameRecord];
    id v21 = [(GKLeaderboardScoreViewController *)v19 initWithGameRecord:v20 leaderboard:v16];

    double v22 = [(GKGameLayerCollectionDataSource *)self presentationViewController];
    +[GKDashboardPresentationController presentViewController:v21 presentingViewController:v22 animated:1];

    double v23 = [MEMORY[0x1E4F637F8] reporter];
    [v23 reportEvent:*MEMORY[0x1E4F63528] type:*MEMORY[0x1E4F631A0]];

    id v6 = v24;
  }
}

- (NSDictionary)assetNames
{
  return self->_assetNames;
}

- (void)setAssetNames:(id)a3
{
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (void)setLeaderboardSet:(id)a3
{
}

- (NSMutableArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);

  objc_storeStrong((id *)&self->_assetNames, 0);
}

@end