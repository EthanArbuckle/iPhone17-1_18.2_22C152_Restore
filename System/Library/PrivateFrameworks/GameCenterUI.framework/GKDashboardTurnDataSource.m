@interface GKDashboardTurnDataSource
- (BOOL)shouldShowPlay;
- (BOOL)shouldShowQuit;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardTurnDataSource)init;
- (NSArray)matches;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setMatches:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setShouldShowQuit:(BOOL)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardTurnDataSource

- (GKDashboardTurnDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardTurnDataSource;
  v2 = [(GKCollectionDataSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKCollectionDataSource *)v2 setUseStandardHeaders:1];
  }
  return v3;
}

- (void)setupCollectionView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardTurnDataSource;
  id v3 = a3;
  [(GKCollectionDataSource *)&v5 setupCollectionView:v3];
  v4 = +[NSObject _gkNib];
  [v3 registerNib:v4 forCellWithReuseIdentifier:@"turnCell"];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F63818];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5F63300;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 loadTurnBasedMatchSummariesIncludingCompatibleBundleID:1 withCompletionHandler:v7];
}

void __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a2;
  v7 = [v5 predicateWithBlock:&__block_literal_global_23];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  if (([*(id *)(*(void *)(a1 + 32) + 64) isEqualToArray:v8] & 1) != 0 || !v6 && v11)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) setMatches:v8];
    uint64_t v9 = 1;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v9, v11);
  }
}

BOOL __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 status] != 2;
}

- (int64_t)itemCount
{
  return [(NSArray *)self->_matches count];
}

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSArray *)self->_matches count];
  if (v5 <= [v4 item])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", [v4 item]);
  }

  return v6;
}

- (id)sectionHeaderText
{
  [(GKDashboardTurnDataSource *)self itemCount];
  v2 = NSString;
  id v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();

  unint64_t v5 = GKFormattedStringWithGroupingFromInteger();
  id v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"turnCell" forIndexPath:v6];
  unint64_t v8 = [v6 item];

  if ([(NSArray *)self->_matches count] <= v8)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [NSString stringWithFormat:@"Assertion failed"];
    id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDataSource.m"];
    id v12 = [v11 lastPathComponent];
    v13 = [v9 stringWithFormat:@"%@ (_matches.count > index)\n[%s (%s:%d)]", v10, "-[GKDashboardTurnDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 107];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  v14 = [(NSArray *)self->_matches objectAtIndexedSubscript:v8];
  [v7 configureForMatch:v14];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  +[GKDashboardTurnCell defaultSize];
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  v7 = [(GKCollectionDataSource *)self presentationViewController];

  if (v7)
  {
    unint64_t v8 = [v6 item];
    if ([(NSArray *)self->_matches count] <= v8)
    {
      uint64_t v9 = NSString;
      uint64_t v10 = [NSString stringWithFormat:@"Assertion failed"];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDataSource.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [v9 stringWithFormat:@"%@ (_matches.count > index)\n[%s (%s:%d)]", v10, "-[GKDashboardTurnDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 125];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
    }
    v14 = [(NSArray *)self->_matches objectAtIndexedSubscript:v8];
    v15 = [[GKDashboardTurnDetailViewController alloc] initWithTurnBasedMatch:v14];
    [(GKDashboardTurnDetailViewController *)v15 setShouldShowPlay:self->_shouldShowPlay];
    [(GKDashboardTurnDetailViewController *)v15 setShouldShowQuit:self->_shouldShowQuit];
    v16 = [v18 cellForItemAtIndexPath:v6];
    v17 = [v16 popoverSourceView];
    [(GKCollectionDataSource *)self showViewController:v15 popoverSourceView:v17];
  }
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setMatches:(id)a3
{
}

- (void).cxx_destruct
{
}

@end