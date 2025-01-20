@interface GKDashboardLeaderboardSetDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardLeaderboardSetDataSource)initWithGameRecord:(id)a3;
- (GKGameRecord)gameRecord;
- (NSArray)leaderboardSets;
- (NSDictionary)leaderboardAssetNames;
- (NSDictionary)leaderboardSetAssetNames;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (int64_t)itemCount;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)removeLeaderboardSetsWithoutImages;
- (void)setGameRecord:(id)a3;
- (void)setLeaderboardAssetNames:(id)a3;
- (void)setLeaderboardSetAssetNames:(id)a3;
- (void)setLeaderboardSets:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardLeaderboardSetDataSource

- (GKDashboardLeaderboardSetDataSource)initWithGameRecord:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardLeaderboardSetDataSource;
  v5 = [(GKCollectionDataSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(GKDashboardLeaderboardSetDataSource *)v5 setGameRecord:v4];
    [(GKCollectionDataSource *)v6 setUseStandardHeaders:1];
  }

  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  v5 = [v4 _gkFocusingLayout];
  [v5 setFocusScaleFactor:1.0];
  v6 = +[NSObject _gkNib];
  [v4 registerNib:v6 forCellWithReuseIdentifier:@"leaderboardSetCell"];
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardSetDataSource;
  [(GKCollectionDataSource *)&v7 setupCollectionView:v4];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v5 = (void *)MEMORY[0x1E4F636D8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardLeaderboardSetDataSource.m", 83, "-[GKDashboardLeaderboardSetDataSource loadDataWithCompletionHandler:]");
  objc_super v7 = [v5 dispatchGroupWithName:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5F65440;
  v14[4] = self;
  v14[5] = v15;
  [v7 perform:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v10[3] = &unk_1E5F64160;
  v10[4] = self;
  id v8 = v4;
  id v12 = v8;
  v13 = v15;
  id v9 = v7;
  id v11 = v9;
  [v9 notifyOnMainQueueWithBlock:v10];

  _Block_object_dispose(v15, 8);
}

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63758];
  v5 = [*(id *)(a1 + 32) gameRecord];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5F65418;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  v9[4] = v7;
  id v8 = v3;
  [v4 loadLeaderboardSetsForGame:v5 withCompletionHandler:v9];
}

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  v5 = [*(id *)(a1 + 32) leaderboardSets];
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

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v3 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)removeLeaderboardSetsWithoutImages
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_leaderboardSets, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_leaderboardSets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
        uint64_t v11 = objc_msgSend(v9, "identifier", (void)v13);
        id v12 = [(NSDictionary *)leaderboardSetAssetNames objectForKeyedSubscript:v11];

        if (v12) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(GKDashboardLeaderboardSetDataSource *)self setLeaderboardSets:v3];
}

- (int64_t)itemCount
{
  return [(NSArray *)self->_leaderboardSets count];
}

- (double)preferredCollectionHeight
{
  return 95.0;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSArray *)self->_leaderboardSets count];
  if (v5 <= [v4 item])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_leaderboardSets, "objectAtIndexedSubscript:", [v4 item]);
  }

  return v6;
}

- (id)sectionHeaderText
{
  [(GKDashboardLeaderboardSetDataSource *)self itemCount];
  uint64_t v2 = NSString;
  id v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();

  unint64_t v5 = GKFormattedStringWithGroupingFromInteger();
  uint64_t v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"leaderboardSetCell" forIndexPath:v6];
  unint64_t v8 = [v6 item];

  if ([(NSArray *)self->_leaderboardSets count] <= v8)
  {
    id v9 = NSString;
    id v10 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardSetDataSource.m"];
    id v12 = [v11 lastPathComponent];
    long long v13 = [v9 stringWithFormat:@"%@ (_leaderboardSets.count > index)\n[%s (%s:%d)]", v10, "-[GKDashboardLeaderboardSetDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 153];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  long long v14 = [(NSArray *)self->_leaderboardSets objectAtIndexedSubscript:v8];
  long long v15 = [(GKGameRecord *)self->_gameRecord bundleIdentifier];
  [v7 setBundleIdentifier:v15];

  leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
  v17 = [v14 identifier];
  uint64_t v18 = [(NSDictionary *)leaderboardSetAssetNames objectForKeyedSubscript:v17];
  [v7 setImageName:v18];

  [v7 setLeaderboardSet:v14];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 58.0;
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = [a3 indexPathsForSelectedItems];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(GKCollectionDataSource *)self presentationViewController];

  if (v8)
  {
    unint64_t v9 = [v7 item];
    if ([(NSArray *)self->_leaderboardSets count] <= v9)
    {
      id v10 = NSString;
      uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardSetDataSource.m"];
      id v13 = [v12 lastPathComponent];
      long long v14 = [v10 stringWithFormat:@"%@ (_leaderboardSets.count > index)\n[%s (%s:%d)]", v11, "-[GKDashboardLeaderboardSetDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 178];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    }
    long long v15 = [(NSArray *)self->_leaderboardSets objectAtIndexedSubscript:v9];
    long long v16 = [v15 leaderboardIdentifiers];
    unint64_t v17 = [v16 count];

    if (v17 < 2)
    {
      v22 = (void *)MEMORY[0x1E4F63738];
      gameRecord = self->_gameRecord;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __79__GKDashboardLeaderboardSetDataSource_collectionView_didSelectItemAtIndexPath___block_invoke;
      v24[3] = &unk_1E5F66CE0;
      v24[4] = self;
      id v25 = v6;
      id v26 = v7;
      [v22 loadLeaderboardsForGame:gameRecord forSet:v15 withPlayer:0 withCompletionHandler:v24];
    }
    else
    {
      uint64_t v18 = [[GKDashboardLeaderboardListViewController alloc] initWithGameRecord:self->_gameRecord leaderboardSet:v15];
      v19 = [(GKDashboardCollectionViewController *)v18 dataSource];
      [v19 setAssetNames:self->_leaderboardAssetNames];
      v20 = [v6 cellForItemAtIndexPath:v7];
      v21 = [v20 popoverSourceView];
      [(GKCollectionDataSource *)self showViewController:v18 popoverSourceView:v21];
    }
  }
}

void __79__GKDashboardLeaderboardSetDataSource_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 firstObject];
  if (v7)
  {
    id v3 = [GKDashboardLeaderboardScoreViewController alloc];
    id v4 = [*(id *)(a1 + 32) gameRecord];
    BOOL v5 = [(GKDashboardLeaderboardScoreViewController *)v3 initWithGameRecord:v4 leaderboard:v7];

    id v6 = [*(id *)(a1 + 32) presentationViewController];
    [v6 _gkPushViewController:v5 animated:1];
  }
  else
  {
    [*(id *)(a1 + 40) deselectItemAtIndexPath:*(void *)(a1 + 48) animated:0];
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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
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
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);

  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);
}

@end