@interface GKDashboardLeaderboardScoreDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)forceInitialShowMore;
- (BOOL)hasFriendsButton;
- (BOOL)isShowMoreIndexPath:(id)a3;
- (BOOL)isShowcaseIndexPath:(id)a3;
- (BOOL)isShowingMoreScores;
- (BOOL)needsShowMoreCell;
- (BOOL)needsShowcaseCell;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4;
- (GKGameRecord)gameRecord;
- (GKLeaderboard)leaderboard;
- (NSArray)scores;
- (SEL)timeScopeAction;
- (UIFont)sectionHeaderFont;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (id)timeScopeTarget;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)playerScope;
- (int64_t)timeScope;
- (int64_t)visibleItemCount;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)revealMoreItemsInCollectionView:(id)a3 section:(int64_t)a4 completion:(id)a5;
- (void)sectionHeaderButtonPressed:(id)a3;
- (void)setForceInitialShowMore:(BOOL)a3;
- (void)setGameRecord:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setPlayerScope:(int64_t)a3;
- (void)setScores:(id)a3;
- (void)setShowingMoreScores:(BOOL)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setTimeScopeAction:(SEL)a3;
- (void)setTimeScopeTarget:(id)a3;
- (void)setVisibleItemCount:(int64_t)a3;
- (void)setupCollectionView:(id)a3;
- (void)showMoreInCollectionView:(id)a3 section:(int64_t)a4;
@end

@implementation GKDashboardLeaderboardScoreDataSource

- (GKDashboardLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  v8 = [(GKCollectionDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKDashboardLeaderboardScoreDataSource *)v8 setGameRecord:v6];
    [(GKDashboardLeaderboardScoreDataSource *)v9 setLeaderboard:v7];
    [(GKDashboardLeaderboardScoreDataSource *)v9 setForceInitialShowMore:0];
    [(GKCollectionDataSource *)v9 setUseStandardHeaders:0];
  }

  return v9;
}

- (void)setPlayerScope:(int64_t)a3
{
}

- (int64_t)playerScope
{
  return [(GKLeaderboard *)self->_leaderboard playerScope];
}

- (void)setTimeScope:(int64_t)a3
{
}

- (int64_t)timeScope
{
  return [(GKLeaderboard *)self->_leaderboard timeScope];
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  v5 = +[GKDashboardLeaderboardScoreCell lowRankNib];
  [v4 registerNib:v5 forCellWithReuseIdentifier:@"lowRankCell"];
  id v6 = +[GKDashboardLeaderboardScoreCell highRankNib];

  [v4 registerNib:v6 forCellWithReuseIdentifier:@"highRankCell"];
  id v7 = +[NSObject _gkNib];

  [v4 registerNib:v7 forCellWithReuseIdentifier:@"showMoreCell"];
  if (![(GKCollectionDataSource *)self useStandardHeaders])
  {
    uint64_t v8 = +[NSObject _gkNib];

    [v4 registerNib:v8 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"sectionHeader"];
    id v7 = (void *)v8;
  }
  if ([(GKDashboardLeaderboardScoreDataSource *)self hasFriendsButton])
  {
    uint64_t v9 = +[NSObject _gkNib];

    [v4 registerNib:v9 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"sectionFooter"];
    id v7 = (void *)v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  [(GKCollectionDataSource *)&v10 setupCollectionView:v4];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
  objc_msgSend(v5, "setRange:", 1, 100);

  id v6 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
  id v7 = [(GKDashboardLeaderboardScoreDataSource *)self gameRecord];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__GKDashboardLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5F63300;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 loadScoresForGame:v7 withCompletionHandler:v9];
}

void __71__GKDashboardLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) scores];
  if ([v6 isEqual:v13])
  {

LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_12;
  }

  if (!v13 && v5) {
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setScores:");
  [*(id *)(a1 + 32) setForceInitialShowMore:0];
  id v8 = [*(id *)(a1 + 32) scores];
  unint64_t v9 = [v8 count];
  id v10 = *(void **)(a1 + 32);
  if (v9 >= 0x1A)
  {
    [v10 setVisibleItemCount:25];
  }
  else
  {
    objc_super v11 = [v10 scores];
    objc_msgSend(*(id *)(a1 + 32), "setVisibleItemCount:", objc_msgSend(v11, "count"));
  }
  if ([*(id *)(a1 + 32) needsShowMoreCell]) {
    objc_msgSend(*(id *)(a1 + 32), "setVisibleItemCount:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") + 1);
  }
  uint64_t v7 = 1;
LABEL_12:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v7, v5);
  }
}

- (void)showMoreInCollectionView:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  if (![(GKDashboardLeaderboardScoreDataSource *)self isShowingMoreScores])
  {
    uint64_t v7 = [MEMORY[0x1E4F636D8] dispatchGroupWithName:@"showMoreInCollectionView"];
    [(GKDashboardLeaderboardScoreDataSource *)self setShowingMoreScores:1];
    unint64_t v8 = [(GKDashboardLeaderboardScoreDataSource *)self visibleItemCount] + 25;
    unint64_t v9 = [(GKDashboardLeaderboardScoreDataSource *)self scores];
    if (v8 <= [v9 count])
    {
    }
    else
    {
      id v10 = [(GKDashboardLeaderboardScoreDataSource *)self scores];
      unint64_t v11 = [v10 count];
      uint64_t v12 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
      unint64_t v13 = [v12 maxRange];

      if (v11 < v13)
      {
        v14 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
        unint64_t v15 = [v14 range];
        v16 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
        unint64_t v17 = [v16 maxRange];

        if (v15 >= v17)
        {
LABEL_11:
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_7;
          v35[3] = &unk_1E5F62EB0;
          v35[4] = self;
          [v7 notifyOnMainQueueWithBlock:v35];

          goto LABEL_12;
        }
        v18 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
        uint64_t v19 = [v18 range];
        uint64_t v21 = v20;

        unint64_t v22 = v19 + 100;
        v23 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
        unint64_t v24 = [v23 maxRange];

        if (v22 <= v24)
        {
          v30 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
          unint64_t v31 = [v30 maxRange];

          if (v22 + v21 <= v31)
          {
LABEL_18:
            v33 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
            objc_msgSend(v33, "setRange:", v22, v21);

            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_3;
            v36[3] = &unk_1E5F65ED0;
            v36[4] = self;
            v29 = &v37;
            id v34 = v7;
            id v37 = v34;
            id v38 = v6;
            int64_t v39 = a4;
            [v34 perform:v36];

            goto LABEL_10;
          }
          v32 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
          uint64_t v21 = [v32 maxRange] - v22;
        }
        else
        {
          v25 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
          [v25 range];
          if (v26 > 0x63)
          {
            uint64_t v21 = 100;
          }
          else
          {
            v27 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
            [v27 range];
            uint64_t v21 = v28;
          }
          v32 = [(GKDashboardLeaderboardScoreDataSource *)self leaderboard];
          unint64_t v22 = [v32 maxRange] - v21;
        }

        goto LABEL_18;
      }
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke;
    v40[3] = &unk_1E5F64738;
    v40[4] = self;
    v29 = (id *)v41;
    v41[0] = v6;
    v41[1] = a4;
    [v7 perform:v40];
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:
}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_2;
  v8[3] = &unk_1E5F631C0;
  id v9 = v3;
  id v7 = v3;
  [v4 revealMoreItemsInCollectionView:v5 section:v6 completion:v8];
}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) leaderboard];
  uint64_t v5 = [*(id *)(a1 + 32) gameRecord];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_4;
  v10[3] = &unk_1E5F65EA8;
  uint64_t v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v13 = v3;
  uint64_t v14 = v8;
  id v12 = v7;
  id v9 = v3;
  [v4 loadScoresForGame:v5 withCompletionHandler:v10];
}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) scores];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4)
    {
      uint64_t v6 = [v5 scores];
      id v7 = [v6 arrayByAddingObjectsFromArray:v3];
      [*(id *)(a1 + 32) setScores:v7];
    }
    else
    {
      [v5 setScores:v3];
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_5;
    v11[3] = &unk_1E5F64738;
    uint64_t v8 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    id v12 = v9;
    uint64_t v13 = v10;
    [v8 perform:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_6;
  v8[3] = &unk_1E5F631C0;
  id v9 = v3;
  id v7 = v3;
  [v4 revealMoreItemsInCollectionView:v5 section:v6 completion:v8];
}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingMoreScores:0];
}

- (void)revealMoreItemsInCollectionView:(id)a3 section:(int64_t)a4 completion:(id)a5
{
  id v23 = a3;
  id v24 = a5;
  int64_t visibleItemCount = self->_visibleItemCount;
  int64_t v9 = visibleItemCount - 1;
  unint64_t v22 = [MEMORY[0x1E4F28D58] indexPathForItem:visibleItemCount - 1 inSection:a4];
  if ([(GKDashboardLeaderboardScoreDataSource *)self needsShowcaseCell])
  {
    uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:visibleItemCount - 2 inSection:a4];
  }
  else
  {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSArray *)self->_scores count];
  if (v11 - visibleItemCount >= 0x19) {
    uint64_t v12 = 25;
  }
  else {
    uint64_t v12 = v11 - visibleItemCount;
  }
  BOOL v13 = [(GKDashboardLeaderboardScoreDataSource *)self needsShowcaseCell];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  if (v12)
  {
    int64_t v15 = v9 - v13;
    uint64_t v16 = v12;
    do
    {
      unint64_t v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v15 inSection:a4];
      [v14 addObject:v17];

      ++v15;
      --v16;
    }
    while (v16);
  }
  self->_visibleItemCount += v12;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__GKDashboardLeaderboardScoreDataSource_revealMoreItemsInCollectionView_section_completion___block_invoke;
  v25[3] = &unk_1E5F655F8;
  v25[4] = self;
  id v26 = v10;
  id v27 = v23;
  id v28 = v14;
  id v29 = v22;
  int64_t v30 = a4;
  id v18 = v22;
  id v19 = v14;
  id v20 = v23;
  id v21 = v10;
  [v20 performBatchUpdates:v25 completion:v24];
}

void __92__GKDashboardLeaderboardScoreDataSource_revealMoreItemsInCollectionView_section_completion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") - 1, *(void *)(a1 + 72));
  id v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") - 2, *(void *)(a1 + 72));
  if (*(void *)(a1 + 40))
  {
    int v4 = [*(id *)(a1 + 32) needsShowcaseCell];
    uint64_t v5 = *(void **)(a1 + 48);
    if (v4)
    {
      [*(id *)(a1 + 48) moveItemAtIndexPath:*(void *)(a1 + 40) toIndexPath:v3];
    }
    else
    {
      v11[0] = *(void *)(a1 + 40);
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v5 deleteItemsAtIndexPaths:v6];

      [*(id *)(a1 + 56) addObject:v3];
    }
  }
  int v7 = [*(id *)(a1 + 32) needsShowMoreCell];
  uint64_t v8 = *(void **)(a1 + 48);
  if (v7)
  {
    [*(id *)(a1 + 48) moveItemAtIndexPath:*(void *)(a1 + 64) toIndexPath:v2];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 64);
    int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v8 deleteItemsAtIndexPaths:v9];

    [*(id *)(a1 + 56) addObject:v2];
  }
  [*(id *)(a1 + 48) insertItemsAtIndexPaths:*(void *)(a1 + 56)];
}

- (BOOL)needsShowMoreCell
{
  unint64_t visibleItemCount = self->_visibleItemCount;
  NSUInteger v4 = [(GKLeaderboard *)self->_leaderboard maxRange];
  BOOL v5 = !self->_forceInitialShowMore && visibleItemCount >= v4;
  return !v5;
}

- (BOOL)isShowMoreIndexPath:(id)a3
{
  id v4 = a3;
  if ([(GKDashboardLeaderboardScoreDataSource *)self needsShowMoreCell]) {
    BOOL v5 = [v4 item] == self->_visibleItemCount - 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isShowcaseIndexPath:(id)a3
{
  id v4 = a3;
  if ([(GKDashboardLeaderboardScoreDataSource *)self needsShowcaseCell]) {
    BOOL v5 = [v4 item] == self->_visibleItemCount - 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasFriendsButton
{
  return [(GKDashboardLeaderboardScoreDataSource *)self playerScope] == 1;
}

- (BOOL)needsShowcaseCell
{
  id v3 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];
  if (v3 && [(GKLeaderboard *)self->_leaderboard playerScope] == GKLeaderboardPlayerScopeGlobal)
  {
    BOOL v5 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];
    BOOL v4 = [v5 rank] > self->_visibleItemCount;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)itemCount
{
  return self->_visibleItemCount;
}

- (double)preferredCollectionHeight
{
  id v3 = NSString;
  BOOL v4 = [NSString stringWithFormat:@"Leaderboard scores are not intended to be embedded in a GKDashboardMultiCollectionViewController"];
  BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m"];
  id v6 = [v5 lastPathComponent];
  int v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKDashboardLeaderboardScoreDataSource preferredCollectionHeight]", objc_msgSend(v6, "UTF8String"), 293];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  [(GKCollectionDataSource *)&v9 preferredCollectionHeight];
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  if ([(GKDashboardLeaderboardScoreDataSource *)self isShowcaseIndexPath:v4])
  {
    uint64_t v6 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];
LABEL_6:
    int v7 = (void *)v6;
    goto LABEL_8;
  }
  if (![(GKDashboardLeaderboardScoreDataSource *)self isShowMoreIndexPath:v4]
    && [(NSArray *)self->_scores count] > v5)
  {
    uint64_t v6 = [(NSArray *)self->_scores objectAtIndexedSubscript:v5];
    goto LABEL_6;
  }
  int v7 = 0;
LABEL_8:

  return v7;
}

- (id)sectionHeaderText
{
  [(GKLeaderboard *)self->_leaderboard maxRange];
  if ([(GKLeaderboard *)self->_leaderboard playerScope] == GKLeaderboardPlayerScopeFriendsOnly)
  {
    id v3 = GKGameCenterUIFrameworkBundle();
    id v4 = GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    unint64_t v5 = NSString;
    uint64_t v6 = GKGameCenterUIFrameworkBundle();
    id v3 = GKGetLocalizedStringFromTableInBundle();

    int v7 = GKFormattedStringWithGroupingFromInteger();
    id v4 = objc_msgSend(v5, "stringWithFormat:", v3, v7);
  }

  return v4;
}

- (UIFont)sectionHeaderFont
{
  return 0;
}

- (void)sectionHeaderButtonPressed:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(GKDashboardLeaderboardScoreDataSource *)self timeScopeTarget];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    uint64_t v6 = [(GKDashboardLeaderboardScoreDataSource *)self timeScopeAction];

    if (v6)
    {
      int v7 = [(GKDashboardLeaderboardScoreDataSource *)self timeScopeTarget];
      uint64_t v8 = (void (*)(void *, SEL, id))objc_msgSend(v7, "methodForSelector:", -[GKDashboardLeaderboardScoreDataSource timeScopeAction](self, "timeScopeAction"));

      objc_super v9 = [(GKDashboardLeaderboardScoreDataSource *)self timeScopeTarget];
      v8(v9, [(GKDashboardLeaderboardScoreDataSource *)self timeScopeAction], v10);
    }
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GKDashboardLeaderboardScoreDataSource *)self isShowMoreIndexPath:v7])
  {
    uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"showMoreCell" forIndexPath:v7];
  }
  else
  {
    objc_super v9 = [(GKDashboardLeaderboardScoreDataSource *)self itemForIndexPath:v7];
    if (!v9)
    {
      id v10 = NSString;
      NSUInteger v11 = [NSString stringWithFormat:@"Assertion failed"];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [v10 stringWithFormat:@"%@ (score)\n[%s (%s:%d)]", v11, "-[GKDashboardLeaderboardScoreDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 361];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    }
    if ([v9 rank] >= 100) {
      int64_t v15 = @"highRankCell";
    }
    else {
      int64_t v15 = @"lowRankCell";
    }
    uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];
    [v8 setScore:v9];
    if ([(GKDashboardLeaderboardScoreDataSource *)self needsShowcaseCell])
    {
      uint64_t v16 = [v9 player];
      objc_msgSend(v8, "setLinesVisible:", objc_msgSend(v16, "isLocalPlayer"));
    }
    else
    {
      [v8 setLinesVisible:0];
    }
  }

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  BOOL v5 = -[GKDashboardLeaderboardScoreDataSource isShowMoreIndexPath:](self, "isShowMoreIndexPath:", a5, a4);
  id v6 = off_1E5F61F88;
  if (!v5) {
    id v6 = off_1E5F61F18;
  }
  id v7 = *v6;

  [(__objc2_class *)v7 defaultSize];
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(GKCollectionDataSource *)self useStandardHeaders])
  {
    uint64_t v14 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderText];
    int64_t v15 = objc_msgSend(MEMORY[0x1E4F63738], "localizedStringForTimeScope:", -[GKDashboardLeaderboardScoreDataSource timeScope](self, "timeScope"));
    +[GKDashboardButtonSectionHeaderView platformSizeForTitle:v14 buttonTitle:v15];
LABEL_6:
    double v11 = v16;
    double v13 = v17;

    goto LABEL_7;
  }
  if (![(GKDashboardLeaderboardScoreDataSource *)self itemCount])
  {
    uint64_t v14 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderText];
    int64_t v15 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderFont];
    +[GKDashboardSectionHeaderView platformSizeForTitle:v14 withFont:v15];
    goto LABEL_6;
  }
  v20.receiver = self;
  v20.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  [(GKCollectionDataSource *)&v20 collectionView:v8 layout:v9 referenceSizeForHeaderInSection:a5];
  double v11 = v10;
  double v13 = v12;
LABEL_7:

  double v18 = v11;
  double v19 = v13;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v7 = [(GKDashboardLeaderboardScoreDataSource *)self hasFriendsButton];
  if (v7) {
    double v8 = 40.0;
  }
  else {
    double v8 = v6;
  }
  double v9 = 0.0;
  if (!v7) {
    double v9 = v5;
  }
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4FB2770];
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    if ([(GKCollectionDataSource *)self useStandardHeaders])
    {
      v24.receiver = self;
      v24.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
      double v12 = [(GKCollectionDataSource *)&v24 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
      double v13 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderFont];
      [v12 setFont:v13];
    }
    else
    {
      double v12 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:@"sectionHeader" forIndexPath:v10];
      double v17 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderText];
      [v12 setTitle:v17];

      double v18 = [(GKDashboardLeaderboardScoreDataSource *)self sectionHeaderFont];
      [v12 setFont:v18];

      objc_msgSend(v12, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));
      double v19 = objc_msgSend(MEMORY[0x1E4F63738], "localizedStringForTimeScope:", -[GKDashboardLeaderboardScoreDataSource timeScope](self, "timeScope"));
      [v12 setButtonTitle:v19];

      [v12 setButtonTarget:self];
      [v12 setButtonAction:sel_sectionHeaderButtonPressed_];
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4FB2760];
    if ([v9 isEqualToString:*MEMORY[0x1E4FB2760]]
      && [(GKDashboardLeaderboardScoreDataSource *)self hasFriendsButton])
    {
      double v12 = [v8 dequeueReusableSupplementaryViewOfKind:v14 withReuseIdentifier:@"sectionFooter" forIndexPath:v10];
      int64_t v15 = GKGameCenterUIFrameworkBundle();
      double v16 = GKGetLocalizedStringFromTableInBundle();
      [v12 setButtonTitle:v16 forState:0];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
      v22[3] = &unk_1E5F63350;
      v22[4] = self;
      id v23 = v8;
      [v12 setButtonTapHandler:v22];
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
      double v12 = [(GKCollectionDataSource *)&v21 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
    }
  }

  return v12;
}

void __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F637F8] reporter];
  [v2 reportEvent:*MEMORY[0x1E4F63540] type:*MEMORY[0x1E4F63090]];

  id v3 = [MEMORY[0x1E4F63660] reporter];
  uint64_t v4 = [*(id *)(a1 + 32) leaderboard];
  double v5 = [v4 identifier];
  [v3 recordClickWithAction:@"navigate" targetId:@"invite" targetType:@"button" pageId:v5 pageType:@"leaderboard"];

  double v6 = [*(id *)(a1 + 40) window];
  BOOL v7 = [v6 rootViewController];

  if (*MEMORY[0x1E4F63830])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_3;
    v11[3] = &unk_1E5F64228;
    id v8 = &v12;
    double v12 = v7;
    id v9 = v7;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:MEMORY[0x1E4F1CBF0] chatGUID:0 completionHandler:v11];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2;
    v13[3] = &unk_1E5F656C0;
    id v8 = &v14;
    uint64_t v14 = v7;
    id v10 = v7;
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:MEMORY[0x1E4F1CBF0] chatGUID:0 resultHandler:v13];
  }
}

void __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = v5;
  }
  if (v6) {
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4 = [a3 indexPathsForSelectedItems];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if ([(GKDashboardLeaderboardScoreDataSource *)self isShowMoreIndexPath:v6])
  {
    [v20 deselectItemAtIndexPath:v6 animated:1];
    self->_forceInitialShowMore = 0;
    -[GKDashboardLeaderboardScoreDataSource showMoreInCollectionView:section:](self, "showMoreInCollectionView:section:", v20, [v6 section]);
  }
  else
  {
    id v7 = [(GKCollectionDataSource *)self presentationViewController];

    if (v7)
    {
      if ([(GKDashboardLeaderboardScoreDataSource *)self isShowcaseIndexPath:v6])
      {
        id v8 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];
      }
      else
      {
        unint64_t v9 = [v6 item];
        if ([(NSArray *)self->_scores count] <= v9)
        {
          id v10 = NSString;
          uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
          double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m"];
          id v13 = [v12 lastPathComponent];
          uint64_t v14 = [v10 stringWithFormat:@"%@ (_scores.count > index)\n[%s (%s:%d)]", v11, "-[GKDashboardLeaderboardScoreDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 499];

          [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
        }
        id v8 = [(NSArray *)self->_scores objectAtIndexedSubscript:v9];
      }
      int64_t v15 = v8;
      double v16 = [v8 player];
      double v17 = [v16 internal];
      double v18 = [v17 playerID];
      double v19 = [(GKCollectionDataSource *)self presentationViewController];
      +[PlayerProfileViewController showProfileFor:v18 from:v19 completion:0];
    }
  }
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (id)timeScopeTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_timeScopeTarget);

  return WeakRetained;
}

- (void)setTimeScopeTarget:(id)a3
{
}

- (SEL)timeScopeAction
{
  if (self->_timeScopeAction) {
    return self->_timeScopeAction;
  }
  else {
    return 0;
  }
}

- (void)setTimeScopeAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_timeScopeAction = v3;
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (int64_t)visibleItemCount
{
  return self->_visibleItemCount;
}

- (void)setVisibleItemCount:(int64_t)a3
{
  self->_unint64_t visibleItemCount = a3;
}

- (BOOL)isShowingMoreScores
{
  return self->_showingMoreScores;
}

- (void)setShowingMoreScores:(BOOL)a3
{
  self->_showingMoreScores = a3;
}

- (BOOL)forceInitialShowMore
{
  return self->_forceInitialShowMore;
}

- (void)setForceInitialShowMore:(BOOL)a3
{
  self->_forceInitialShowMore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_destroyWeak(&self->_timeScopeTarget);

  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end