@interface GKDashboardChallengeDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)shouldShowPlay;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardChallengeDataSource)initWithGameRecord:(id)a3;
- (GKGameRecord)gameRecord;
- (NSArray)challenges;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setChallenges:(id)a3;
- (void)setGameRecord:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardChallengeDataSource

- (GKDashboardChallengeDataSource)initWithGameRecord:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardChallengeDataSource;
  v5 = [(GKCollectionDataSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(GKDashboardChallengeDataSource *)v5 setGameRecord:v4];
    [(GKCollectionDataSource *)v6 setUseStandardHeaders:1];
  }

  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  v5 = +[NSObject _gkNib];
  [v4 registerNib:v5 forCellWithReuseIdentifier:@"challengeCell"];
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengeDataSource;
  [(GKCollectionDataSource *)&v6 setupCollectionView:v4];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v5 = (void *)MEMORY[0x1E4F636D8];
  objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardChallengeDataSource.m", 72, "-[GKDashboardChallengeDataSource loadDataWithCompletionHandler:]");
  v7 = [v5 dispatchGroupWithName:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5F66728;
  id v8 = v7;
  id v16 = v8;
  v17 = self;
  v18 = v19;
  [v8 perform:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E5F65468;
  id v9 = v4;
  id v13 = v9;
  v14 = v19;
  id v10 = v8;
  id v12 = v10;
  [v10 notifyOnMainQueueWithBlock:v11];

  _Block_object_dispose(v19, 8);
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F636A8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5F66CB8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  uint64_t v13 = v7;
  id v8 = v3;
  [v4 loadReceivedPendingChallengesWithCompletionHandler:v9];
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (([*(id *)(*(void *)(a1 + 40) + 72) isEqualToArray:v5] & 1) == 0 && (v5 || !a3))
  {
    [*(id *)(a1 + 40) setChallenges:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 40) + 72);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          id v12 = *(void **)(a1 + 32);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_3;
          v13[3] = &unk_1E5F63650;
          v13[4] = v11;
          [v12 perform:v13];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E5F639B0;
  id v7 = v3;
  id v5 = v3;
  [v4 loadDetailsWithCompletionHandler:v6];
}

uint64_t __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (int64_t)itemCount
{
  return [(NSArray *)self->_challenges count];
}

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSArray *)self->_challenges count];
  if (v5 <= [v4 item])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_challenges, "objectAtIndexedSubscript:", [v4 item]);
  }

  return v6;
}

- (id)sectionHeaderText
{
  id v3 = NSString;
  id v4 = GKGameCenterUIFrameworkBundle();
  unint64_t v5 = GKGetLocalizedStringFromTableInBundle();
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, -[GKDashboardChallengeDataSource itemCount](self, "itemCount"));
  id v7 = [v6 localizedUppercaseString];

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"challengeCell" forIndexPath:v6];
  unint64_t v8 = [v6 item];

  if ([(NSArray *)self->_challenges count] <= v8)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/Legacy Challenges UI/GKDashboardChallengeDataSource.m"];
    id v12 = [v11 lastPathComponent];
    uint64_t v13 = [v9 stringWithFormat:@"%@ (_challenges.count > index)\n[%s (%s:%d)]", v10, "-[GKDashboardChallengeDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 135];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  long long v14 = [(NSArray *)self->_challenges objectAtIndexedSubscript:v8];
  long long v15 = [v14 issuingPlayer];
  [v7 setPlayer:v15];

  long long v16 = NSString;
  long long v17 = GKGameCenterUIFrameworkBundle();
  v18 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v19 = [v14 issuingPlayer];
  char v20 = [v19 displayNameWithOptions:0];
  v21 = objc_msgSend(v16, "stringWithFormat:", v18, v20);
  [v7 setNameText:v21];

  v22 = [v14 listTitleText];
  [v7 setStatusText:v22];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  +[GKDashboardPlayerCell defaultSize];
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
  id v17 = a4;
  BOOL v5 = [(GKCollectionDataSource *)self presentationViewController];

  double v6 = v17;
  if (v5)
  {
    unint64_t v7 = [v17 item];
    if ([(NSArray *)self->_challenges count] <= v7)
    {
      unint64_t v8 = NSString;
      uint64_t v9 = [NSString stringWithFormat:@"Assertion failed"];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/Legacy Challenges UI/GKDashboardChallengeDataSource.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [v8 stringWithFormat:@"%@ (_challenges.count > index)\n[%s (%s:%d)]", v9, "-[GKDashboardChallengeDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v11, "UTF8String"), 160];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
    }
    uint64_t v13 = [(NSArray *)self->_challenges objectAtIndexedSubscript:v7];
    long long v14 = [[GKChallengeDetailViewController alloc] initWithChallenge:v13];
    [(GKChallengeDetailViewController *)v14 setShouldShowPlay:self->_shouldShowPlay];
    [(GKChallengeDetailViewController *)v14 setDelegate:self];
    long long v15 = [(GKCollectionDataSource *)self presentationViewController];

    if (v15)
    {
      long long v16 = [(GKCollectionDataSource *)self presentationViewController];
      +[GKDashboardPresentationController presentViewController:v14 presentingViewController:v16 animated:1];
    }
    double v6 = v17;
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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (NSArray)challenges
{
  return self->_challenges;
}

- (void)setChallenges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenges, 0);

  objc_storeStrong((id *)&self->_gameRecord, 0);
}

@end