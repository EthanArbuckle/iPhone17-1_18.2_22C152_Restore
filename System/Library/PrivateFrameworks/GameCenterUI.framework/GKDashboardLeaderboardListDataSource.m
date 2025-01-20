@interface GKDashboardLeaderboardListDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4;
- (GKGameRecord)gameRecord;
- (GKLeaderboardSet)leaderboardSet;
- (NSArray)leaderboards;
- (NSDictionary)assetNames;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (int64_t)itemCount;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)removeLeaderboardsWithoutImages;
- (void)setAssetNames:(id)a3;
- (void)setGameRecord:(id)a3;
- (void)setLeaderboardSet:(id)a3;
- (void)setLeaderboards:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardLeaderboardListDataSource

- (GKDashboardLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardListDataSource;
  v8 = [(GKCollectionDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKDashboardLeaderboardListDataSource *)v8 setGameRecord:v6];
    [(GKDashboardLeaderboardListDataSource *)v9 setLeaderboardSet:v7];
    [(GKCollectionDataSource *)v9 setUseStandardHeaders:1];
  }

  return v9;
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  v5 = [v4 _gkFocusingLayout];
  [v5 setFocusScaleFactor:1.0];
  id v6 = +[NSObject _gkNib];
  [v4 registerNib:v6 forCellWithReuseIdentifier:@"leaderboardListCell"];
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardListDataSource;
  [(GKCollectionDataSource *)&v7 setupCollectionView:v4];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v5 = (void *)MEMORY[0x1E4F636D8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardLeaderboardListDataSource.m", 82, "-[GKDashboardLeaderboardListDataSource loadDataWithCompletionHandler:]");
  objc_super v7 = [v5 dispatchGroupWithName:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5F64138;
  v15[4] = self;
  v17 = v18;
  id v8 = v7;
  id v16 = v8;
  [v8 perform:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E5F64160;
  v11[4] = self;
  id v9 = v4;
  id v13 = v9;
  v14 = v18;
  id v10 = v8;
  id v12 = v10;
  [v10 notifyOnMainQueueWithBlock:v11];

  _Block_object_dispose(v18, 8);
}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63738];
  v5 = [*(id *)(a1 + 32) gameRecord];
  id v6 = [*(id *)(a1 + 32) leaderboardSet];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5F64110;
  objc_super v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  v10[4] = v8;
  id v11 = v7;
  id v12 = v3;
  id v9 = v3;
  [v4 loadLeaderboardsForGame:v5 forSet:v6 withPlayer:0 withCompletionHandler:v10];
}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_super v7 = [*(id *)(a1 + 32) leaderboards];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 count] == 0;

  uint64_t v8 = [*(id *)(a1 + 32) leaderboards];
  if ([v8 isEqual:v9])
  {
  }
  else
  {

    if (v9 || !v6)
    {
      [*(id *)(a1 + 32) setLeaderboards:v9];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  [*(id *)(a1 + 40) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v3 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (void)removeLeaderboardsWithoutImages
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_leaderboards, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_leaderboards;
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
        assetNames = self->_assetNames;
        id v11 = objc_msgSend(v9, "identifier", (void)v13);
        id v12 = [(NSDictionary *)assetNames objectForKeyedSubscript:v11];

        if (v12) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(GKDashboardLeaderboardListDataSource *)self setLeaderboards:v3];
}

- (int64_t)itemCount
{
  return [(NSArray *)self->_leaderboards count];
}

- (double)preferredCollectionHeight
{
  return 95.0;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSArray *)self->_leaderboards count];
  if (v5 <= [v4 item])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_leaderboards, "objectAtIndexedSubscript:", [v4 item]);
  }

  return v6;
}

- (id)sectionHeaderText
{
  [(GKDashboardLeaderboardListDataSource *)self itemCount];
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
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"leaderboardListCell" forIndexPath:v6];
  unint64_t v8 = [v6 item];

  if ([(NSArray *)self->_leaderboards count] <= v8)
  {
    id v9 = NSString;
    id v10 = [NSString stringWithFormat:@"Assertion failed"];
    id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardListDataSource.m"];
    id v12 = [v11 lastPathComponent];
    long long v13 = [v9 stringWithFormat:@"%@ (_leaderboards.count > index)\n[%s (%s:%d)]", v10, "-[GKDashboardLeaderboardListDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 153];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  long long v14 = [(NSArray *)self->_leaderboards objectAtIndexedSubscript:v8];
  long long v15 = [(GKGameRecord *)self->_gameRecord bundleIdentifier];
  [v7 setBundleIdentifier:v15];

  assetNames = self->_assetNames;
  v17 = [v14 identifier];
  uint64_t v18 = [(NSDictionary *)assetNames objectForKeyedSubscript:v17];
  [v7 setImageName:v18];

  [v7 setLeaderboard:v14];

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
  id v16 = a4;
  BOOL v5 = [(GKCollectionDataSource *)self presentationViewController];

  double v6 = v16;
  if (v5)
  {
    unint64_t v7 = [v16 item];
    if ([(NSArray *)self->_leaderboards count] <= v7)
    {
      unint64_t v8 = NSString;
      id v9 = [NSString stringWithFormat:@"Assertion failed"];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardListDataSource.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [v8 stringWithFormat:@"%@ (_leaderboards.count > index)\n[%s (%s:%d)]", v9, "-[GKDashboardLeaderboardListDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v11, "UTF8String"), 186];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
    }
    long long v13 = [(NSArray *)self->_leaderboards objectAtIndexedSubscript:v7];
    long long v14 = [[GKDashboardLeaderboardScoreViewController alloc] initWithGameRecord:self->_gameRecord leaderboard:v13];
    long long v15 = [(GKCollectionDataSource *)self presentationViewController];
    [v15 _gkPushViewController:v14 animated:1];

    double v6 = v16;
  }
}

- (NSDictionary)assetNames
{
  return self->_assetNames;
}

- (void)setAssetNames:(id)a3
{
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (void)setLeaderboardSet:(id)a3
{
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);

  objc_storeStrong((id *)&self->_assetNames, 0);
}

@end