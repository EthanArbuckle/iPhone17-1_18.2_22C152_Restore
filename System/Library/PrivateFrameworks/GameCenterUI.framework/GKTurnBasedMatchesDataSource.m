@interface GKTurnBasedMatchesDataSource
- (GKGame)game;
- (GKTurnBasedMatchesDataSourceDelegate)delegate;
- (SEL)detailPressedAction;
- (UIEdgeInsets)cellMarginInsets;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (unint64_t)numberOfMatches;
- (void)collectionViewWillBecomeActive:(id)a3;
- (void)configureCollectionView:(id)a3;
- (void)configureDataSource;
- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4;
- (void)setCellMarginInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailPressedAction:(SEL)a3;
- (void)setGame:(id)a3;
@end

@implementation GKTurnBasedMatchesDataSource

- (void)configureDataSource
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)GKTurnBasedMatchesDataSource;
  [(GKSplittingDataSource *)&v21 configureDataSource];
  v3 = objc_alloc_init(GKRawTurnsDataSource);
  v20.receiver = self;
  v20.super_class = (Class)GKTurnBasedMatchesDataSource;
  [(GKSplittingDataSource *)&v20 setUnderlyingDataSource:v3];

  v4 = GKGameCenterUIFrameworkBundle();
  v5 = GKGetLocalizedStringFromTableInBundle();
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateSortKey" ascending:0];
  v25[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [(GKSplittingDataSource *)self addSectionWithTitle:v5 sortDescriptors:v7];

  v8 = GKGameCenterUIFrameworkBundle();
  v9 = GKGetLocalizedStringFromTableInBundle();
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateSortKey" ascending:0];
  v24 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [(GKSplittingDataSource *)self addSectionWithTitle:v9 sortDescriptors:v11];

  v12 = GKGameCenterUIFrameworkBundle();
  v13 = GKGetLocalizedStringFromTableInBundle();
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateSortKey" ascending:0];
  v23 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [(GKSplittingDataSource *)self addSectionWithTitle:v13 sortDescriptors:v15];

  v16 = GKGameCenterUIFrameworkBundle();
  v17 = GKGetLocalizedStringFromTableInBundle();
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateSortKey" ascending:0];
  v22 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [(GKSplittingDataSource *)self addSectionWithTitle:v17 sortDescriptors:v19];
}

- (void)collectionViewWillBecomeActive:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesDataSource;
  [(GKCollectionViewDataSource *)&v12 collectionViewWillBecomeActive:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke;
  v11[3] = &unk_1E5F63218;
  v11[4] = self;
  v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v11];
  [(GKSplittingDataSource *)self setFilterPredicate:v4 forSection:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_2;
  v10[3] = &unk_1E5F63218;
  v10[4] = self;
  v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
  [(GKSplittingDataSource *)self setFilterPredicate:v5 forSection:1];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_3;
  v9[3] = &unk_1E5F63218;
  v9[4] = self;
  v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  [(GKSplittingDataSource *)self setFilterPredicate:v6 forSection:2];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_4;
  v8[3] = &unk_1E5F63218;
  v8[4] = self;
  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  [(GKSplittingDataSource *)self setFilterPredicate:v7 forSection:3];
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 bundleID];
  v5 = [*(id *)(a1 + 32) game];
  v6 = [v5 bundleIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    BOOL v8 = [v3 state] == 1;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 bundleID];
  v5 = [*(id *)(a1 + 32) game];
  v6 = [v5 bundleIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    BOOL v8 = ([v3 state] & 0xFFFFFFFE) == 2;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 bundleID];
  v5 = [*(id *)(a1 + 32) game];
  v6 = [v5 bundleIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    BOOL v8 = [v3 state] == 4;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 bundleID];
  v5 = [*(id *)(a1 + 32) game];
  v6 = [v5 bundleIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    BOOL v8 = [v3 state] == 5;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)configureCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchesDataSource;
  id v3 = a3;
  [(GKCollectionViewDataSource *)&v4 configureCollectionView:v3];
  +[GKTurnParticipantCell registerCellClassesForCollectionView:](GKTurnParticipantCell, "registerCellClassesForCollectionView:", v3, v4.receiver, v4.super_class);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", [v6 section]);
  v9 = [v8 items];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  v11 = [v7 _gkDequeueCellForClass:objc_opt_class() forIndexPath:v6];
  objc_super v12 = v11;
  if (self->_detailPressedAction) {
    SEL detailPressedAction = self->_detailPressedAction;
  }
  else {
    SEL detailPressedAction = 0;
  }
  [v11 setDetailPressedAction:detailPressedAction];

  [v12 setMatch:v10];
  v14 = [v10 playingWithParticipantOrFirstKnownPlayer];
  [v12 setParticipant:v14];

  v15 = GKGameCenterUIFrameworkBundle();
  v16 = GKGetLocalizedStringFromTableInBundle();
  v17 = +[GKEditAction deleteActionWithName:v16];
  v27[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v12 setEditActions:v18];

  objc_msgSend(v12, "setInsets:", self->_cellMarginInsets.top, self->_cellMarginInsets.left, self->_cellMarginInsets.bottom, self->_cellMarginInsets.right);
  uint64_t v19 = [v6 item];
  objc_super v20 = [v8 items];
  uint64_t v21 = [v20 count] - 1;

  if (v19 == v21)
  {
    v22 = [v12 layer];
    [v22 setCornerRadius:10.0];

    v23 = [v12 layer];
    [v23 setMaskedCorners:12];

    v24 = [v12 divider];
    [v24 setHidden:1];
  }
  else
  {
    v25 = [v12 divider];
    [v25 setHidden:0];

    v24 = [v12 layer];
    [v24 setCornerRadius:0.0];
  }

  return v12;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30 = self;
  BOOL v8 = -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", [v6 section]);
  v9 = [v8 items];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  if ([v10 state] == 1)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke;
    v45[3] = &unk_1E5F63240;
    id v46 = v10;
    [v46 declineInviteWithCompletionHandler:v45];
  }
  else if ([v10 state] == 5)
  {
    [v10 removeWithCompletionHandler:0];
  }
  else
  {
    v11 = [(GKTurnBasedMatchesDataSource *)v30 delegate];
    [v11 turnBasedMatchesDataSource:v30 didQuitMatch:v10];
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  id v44 = &__block_literal_global_0;
  uint64_t v12 = [&__block_literal_global_0 copy];
  v28 = v10;
  v29 = (void (**)(void, void))v7;
  v13 = (void *)v40[5];
  v40[5] = v12;

  v14 = [v8 items];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = _Block_copy((const void *)v40[5]);
      if (i == [v6 item])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_2;
        aBlock[3] = &unk_1E5F63268;
        id v38 = v17;
        aBlock[4] = v30;
        id v37 = v6;
        v18 = _Block_copy(aBlock);
        uint64_t v19 = (void *)v40[5];
        v40[5] = (uint64_t)v18;
        objc_super v20 = &v37;
        uint64_t v21 = &v38;
      }
      else
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_3;
        v33[3] = &unk_1E5F63290;
        v35[0] = v17;
        v35[1] = i;
        v33[4] = v30;
        id v34 = v6;
        v22 = _Block_copy(v33);
        uint64_t v19 = (void *)v40[5];
        v40[5] = (uint64_t)v22;
        objc_super v20 = &v34;
        uint64_t v21 = (id *)v35;
      }

      uint64_t v23 = [(id)v40[5] copy];
      v24 = (void *)v40[5];
      v40[5] = v23;
    }
  }
  uint64_t v25 = [v6 item];
  v26 = [v8 items];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_4;
  v32[3] = &__block_descriptor_40_e11__24__0_8Q16l;
  v32[4] = v25;
  v27 = [v26 _gkFilterWithBlock:v32];
  [v8 setItems:v27];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_5;
  v31[3] = &unk_1E5F632D8;
  v31[4] = &v39;
  [(GKCollectionViewDataSource *)v30 notifyBatchUpdate:v31];
  if (v29) {
    v29[2](v29, 0);
  }
  _Block_object_dispose(&v39, 8);
}

uint64_t __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeWithCompletionHandler:0];
}

void __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 notifyItemsRemovedAtIndexPaths:v3];
}

void __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "section"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", *(void *)(a1 + 56) - (*(void *)(a1 + 56) >= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "item")), objc_msgSend(*(id *)(a1 + 40), "section"));
  [v2 notifyItemMovedFromIndexPath:v4 toIndexPaths:v3];
}

id __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) == a3) {
    return 0;
  }
  else {
    return a2;
  }
}

uint64_t __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

- (unint64_t)numberOfMatches
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  do
  {
    v5 = [(GKSplittingDataSource *)self itemsForSection:v3];
    v4 += [v5 count];

    ++v3;
  }
  while (v3 != 4);
  return v4;
}

- (GKTurnBasedMatchesDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateWeak);

  return (GKTurnBasedMatchesDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (SEL)detailPressedAction
{
  if (self->_detailPressedAction) {
    return self->_detailPressedAction;
  }
  else {
    return 0;
  }
}

- (void)setDetailPressedAction:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_SEL detailPressedAction = v3;
}

- (UIEdgeInsets)cellMarginInsets
{
  double top = self->_cellMarginInsets.top;
  double left = self->_cellMarginInsets.left;
  double bottom = self->_cellMarginInsets.bottom;
  double right = self->_cellMarginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCellMarginInsets:(UIEdgeInsets)a3
{
  self->_cellMarginInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_game, 0);

  objc_destroyWeak((id *)&self->_delegateWeak);
}

@end