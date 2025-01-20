@interface GKLeaderboardSetDataSource
- (CGSize)standardCellSizeForCollectionView:(id)a3;
- (NSArray)leaderboardSets;
- (NSDictionary)leaderboardAssetNames;
- (NSDictionary)leaderboardSetAssetNames;
- (id)itemForIndexPath:(id)a3;
- (id)title;
- (int64_t)allowedColumnCount:(int64_t)a3;
- (int64_t)itemCount;
- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)prepareCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)presentLeaderboardsListWithSet:(id)a3 segueToLeaderboard:(id)a4;
- (void)removeLeaderboardSetsWithoutImages;
- (void)setLeaderboardAssetNames:(id)a3;
- (void)setLeaderboardSetAssetNames:(id)a3;
- (void)setLeaderboardSets:(id)a3;
- (void)updateHighlightsInSectionHeader:(id)a3;
@end

@implementation GKLeaderboardSetDataSource

- (int64_t)allowedColumnCount:(int64_t)a3
{
  int64_t v4 = [(GKLeaderboardSetDataSource *)self itemCount];
  if (a3 >= v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = a3;
  }
  if (v5 >= 3) {
    uint64_t v5 = 3;
  }
  if (v5 <= 1) {
    return 1;
  }
  else {
    return v5;
  }
}

- (id)title
{
  v2 = GKGameCenterUIFrameworkBundle();
  v3 = GKGetLocalizedStringFromTableInBundle();

  return v3;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4F636D8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardSetDataSource.m", 60, "-[GKLeaderboardSetDataSource loadDataWithCompletionHandler:]");
  v7 = [v5 dispatchGroupWithName:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5F65440;
  v14[4] = self;
  v14[5] = v15;
  [v7 perform:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v10[3] = &unk_1E5F65468;
  id v8 = v4;
  id v12 = v8;
  v13 = v15;
  id v9 = v7;
  id v11 = v9;
  [v9 notifyOnMainQueueWithBlock:v10];

  _Block_object_dispose(v15, 8);
}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63758];
  uint64_t v5 = [*(id *)(a1 + 32) gameRecord];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5F65418;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  v9[4] = v7;
  id v8 = v3;
  [v4 loadLeaderboardSetsForGame:v5 withCompletionHandler:v9];
}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) leaderboardSets];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 count] == 0;

  uint64_t v6 = [*(id *)(a1 + 32) leaderboardSets];
  if ([v6 isEqual:v7])
  {
  }
  else
  {

    if (v7 || !a3)
    {
      [*(id *)(a1 + 32) setLeaderboardSets:v7];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)removeLeaderboardSetsWithoutImages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
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
        leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
        v13 = [v11 identifier];
        v14 = [(NSDictionary *)leaderboardSetAssetNames objectForKeyedSubscript:v13];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(GKLeaderboardSetDataSource *)self setLeaderboardSets:v5];
}

- (int64_t)itemCount
{
  uint64_t v2 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
  unint64_t v6 = [v5 count];
  if (v6 <= [v4 item])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v8;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  BOOL v5 = [v4 horizontalSizeClass] == 1 && objc_msgSend(v4, "verticalSizeClass") == 2;
  unint64_t v6 = [v4 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
  {
    uint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    *(double *)&uint64_t v9 = 282.0;
    if (v8 == 1)
    {
      double v10 = 696.0;
    }
    else if (v5)
    {
      [v3 frame];
      if (v12 + -20.0 <= 335.0) {
        double v10 = v12 + -20.0;
      }
      else {
        double v10 = 335.0;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4FB2778]])
      {
        *(double *)&uint64_t v9 = 564.0;
      }
      else if ([v6 isEqualToString:*MEMORY[0x1E4FB2780]])
      {
        *(double *)&uint64_t v9 = 534.0;
      }
      else if ([v6 isEqualToString:*MEMORY[0x1E4FB2788]])
      {
        *(double *)&uint64_t v9 = 504.0;
      }
      else if ([v6 isEqualToString:*MEMORY[0x1E4FB2790]])
      {
        *(double *)&uint64_t v9 = 474.0;
      }
      else
      {
        *(double *)&uint64_t v9 = 444.0;
      }
    }
    else
    {
      [v3 bounds];
      double v16 = v15;
      long long v17 = [v3 superview];
      [v17 safeAreaInsets];
      double v19 = v16 - v18;
      uint64_t v20 = [v3 superview];
      [v20 safeAreaInsets];
      double v10 = v19 - v21 + -32.0;
    }
  }
  else
  {
    if (v5)
    {
      [v3 frame];
      if (v11 + -20.0 <= 335.0) {
        double v10 = v11 + -20.0;
      }
      else {
        double v10 = 335.0;
      }
    }
    else
    {
      double v10 = 335.0;
    }
    *(double *)&uint64_t v9 = 276.0;
  }

  double v13 = v10;
  double v14 = *(double *)&v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)updateHighlightsInSectionHeader:(id)a3
{
  id v4 = a3;
  id v5 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  objc_msgSend(v4, "updateHighlightsWithGameRecord:leaderboardCount:setCount:", v5, 0, -[GKLeaderboardSetDataSource itemCount](self, "itemCount"));
}

- (void)prepareCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a4 item];
  uint64_t v8 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
  unint64_t v9 = [v8 count];

  if (v9 <= v7)
  {
    double v10 = NSString;
    double v11 = [NSString stringWithFormat:@"Assertion failed"];
    double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSetDataSource.m"];
    id v13 = [v12 lastPathComponent];
    double v14 = [v10 stringWithFormat:@"%@ (self.leaderboardSets.count > index)\n[%s (%s:%d)]", v11, "-[GKLeaderboardSetDataSource prepareCell:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 169];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  double v15 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
  id v21 = [v15 objectAtIndexedSubscript:v7];

  double v16 = [(GKGameLayerCollectionDataSource *)self gameRecord];
  long long v17 = [v16 bundleIdentifier];
  [v6 setBundleIdentifier:v17];

  double v18 = [(GKLeaderboardSetDataSource *)self leaderboardSetAssetNames];
  double v19 = [v21 identifier];
  uint64_t v20 = [v18 objectForKeyedSubscript:v19];
  [v6 setImageName:v20];

  [v6 setLeaderboardSet:v21];
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(GKGameLayerCollectionDataSource *)self presentationViewController];

  if (v6)
  {
    unint64_t v7 = [v5 item];
    uint64_t v8 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
    unint64_t v9 = [v8 count];

    if (v9 <= v7)
    {
      double v10 = NSString;
      double v11 = [NSString stringWithFormat:@"Assertion failed"];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSetDataSource.m"];
      id v13 = [v12 lastPathComponent];
      double v14 = [v10 stringWithFormat:@"%@ (self.leaderboardSets.count > index)\n[%s (%s:%d)]", v11, "-[GKLeaderboardSetDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 182];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    }
    double v15 = [(GKLeaderboardSetDataSource *)self leaderboardSets];
    double v16 = [v15 objectAtIndexedSubscript:v7];

    long long v17 = [MEMORY[0x1E4F63660] reporter];
    double v18 = [v16 identifier];
    [v17 recordClickWithAction:@"navigate" targetId:v18 targetType:@"button" pageId:@"leaderboardGroups" pageType:@"leaderboard"];

    double v19 = [v16 leaderboardIdentifiers];
    unint64_t v20 = [v19 count];

    if (v20 < 2)
    {
      id v21 = (void *)MEMORY[0x1E4F63738];
      v22 = [(GKGameLayerCollectionDataSource *)self gameRecord];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __81__GKLeaderboardSetDataSource_handleSelectionInCollectionView_forItemAtIndexPath___block_invoke;
      v23[3] = &unk_1E5F65490;
      v23[4] = self;
      id v24 = v16;
      [v21 loadLeaderboardsForGame:v22 forSet:v24 withPlayer:0 withCompletionHandler:v23];
    }
    else
    {
      [(GKLeaderboardSetDataSource *)self presentLeaderboardsListWithSet:v16 segueToLeaderboard:0];
    }
  }
}

void __81__GKLeaderboardSetDataSource_handleSelectionInCollectionView_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  [*(id *)(a1 + 32) presentLeaderboardsListWithSet:*(void *)(a1 + 40) segueToLeaderboard:v3];
}

- (void)presentLeaderboardsListWithSet:(id)a3 segueToLeaderboard:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  unint64_t v7 = [(GKGameLayerCollectionDataSource *)self presentationViewController];

  if (v7)
  {
    uint64_t v8 = [(GKGameLayerCollectionDataSource *)self presentationViewController];
    unint64_t v9 = [v8 navigationController];

    double v10 = [v9 viewControllers];
    double v11 = (void *)[v10 mutableCopy];

    if (v6)
    {
      double v12 = [GKLeaderboardScoreViewController alloc];
      id v13 = [(GKGameLayerCollectionDataSource *)self gameRecord];
      double v14 = [(GKLeaderboardScoreViewController *)v12 initWithGameRecord:v13 leaderboard:v6];

      [v11 addObject:v14];
    }
    else
    {
      double v15 = [GKLeaderboardListViewController alloc];
      double v16 = [(GKGameLayerCollectionDataSource *)self gameRecord];
      double v14 = [(GKLeaderboardListViewController *)v15 initWithGameRecord:v16 leaderboardSet:v21];

      long long v17 = [(GKLeaderboardScoreViewController *)v14 dataSource];
      [v17 setAssetNames:self->_leaderboardAssetNames];
      [v11 addObject:v14];
    }
    double v18 = [MEMORY[0x1E4F637F8] reporter];
    double v19 = v18;
    unint64_t v20 = (void *)MEMORY[0x1E4F631A8];
    if (v6) {
      unint64_t v20 = (void *)MEMORY[0x1E4F631A0];
    }
    [v18 reportEvent:*MEMORY[0x1E4F63528] type:*v20];

    [v9 setViewControllers:v11 animated:1];
  }
}

- (NSDictionary)leaderboardSetAssetNames
{
  return self->_leaderboardSetAssetNames;
}

- (void)setLeaderboardSetAssetNames:(id)a3
{
}

- (NSDictionary)leaderboardAssetNames
{
  return self->_leaderboardAssetNames;
}

- (void)setLeaderboardAssetNames:(id)a3
{
}

- (NSArray)leaderboardSets
{
  return self->_leaderboardSets;
}

- (void)setLeaderboardSets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardSets, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);

  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);
}

@end