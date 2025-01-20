@interface GKDashboardMultiplayerPickerSearchDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isSearching;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardMultiplayerPickerSearchDataSource)initWithSearchPlayers:(id)a3 maxSelectable:(int64_t)a4;
- (NSArray)allPlayers;
- (NSArray)searchPlayers;
- (NSArray)selectedPlayers;
- (NSMutableDictionary)playerStates;
- (UISearchBar)searchBar;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)searchKeyForSection:(int64_t)a3;
- (int64_t)itemCount;
- (int64_t)maxSelectable;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchTextHasChanged;
- (void)setAllPlayers:(id)a3;
- (void)setPlayerStates:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchPlayers:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardMultiplayerPickerSearchDataSource

- (GKDashboardMultiplayerPickerSearchDataSource)initWithSearchPlayers:(id)a3 maxSelectable:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardMultiplayerPickerSearchDataSource;
  v7 = [(GKCollectionDataSource *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    allPlayers = v7->_allPlayers;
    v7->_allPlayers = (NSArray *)v8;

    v7->_maxSelectable = a4;
  }

  return v7;
}

- (void)setupCollectionView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerSearchDataSource;
  id v3 = a3;
  [(GKCollectionDataSource *)&v5 setupCollectionView:v3];
  v4 = +[NSObject _gkNib];
  [v3 registerNib:v4 forCellWithReuseIdentifier:@"playerCell"];
}

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (NSArray)selectedPlayers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v15 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(GKDashboardMultiplayerPickerSearchDataSource *)self allPlayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
        v10 = [v8 referenceKey];
        objc_super v11 = [v9 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (v12 == 1) {
          [v15 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v13 = [v15 allObjects];

  return (NSArray *)v13;
}

- (void)searchTextHasChanged
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(GKDashboardMultiplayerPickerSearchDataSource *)self isSearching])
  {
    id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(GKDashboardMultiplayerPickerSearchDataSource *)self allPlayers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if ([(GKCollectionDataSource *)self searchMatchesItem:v9 inSection:0]) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    v10 = [v3 sortedArrayUsingComparator:&__block_literal_global_10];
    [(GKDashboardMultiplayerPickerSearchDataSource *)self setSearchPlayers:v10];
  }
  else
  {
    [(GKDashboardMultiplayerPickerSearchDataSource *)self setSearchPlayers:0];
  }
}

uint64_t __68__GKDashboardMultiplayerPickerSearchDataSource_searchTextHasChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 displayNameWithOptions:0];
  uint64_t v6 = [v4 displayNameWithOptions:0];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return @"searchName";
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)itemCount
{
  v2 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchPlayers];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"playerCell" forIndexPath:v6];
  uint64_t v8 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchPlayers];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  [v7 setPlayer:v10];
  long long v11 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
  long long v12 = [v10 referenceKey];
  long long v13 = [v11 objectForKey:v12];
  uint64_t v14 = [v13 integerValue];

  if ((unint64_t)(v14 - 1) > 1)
  {
    v15 = [(GKDashboardMultiplayerPickerSearchDataSource *)self selectedPlayers];
    objc_msgSend(v7, "setSelectable:", objc_msgSend(v15, "count") < (unint64_t)-[GKDashboardMultiplayerPickerSearchDataSource maxSelectable](self, "maxSelectable"));
  }
  else
  {
    [v7 setSelectable:v14 == 1];
  }
  [v7 setSelected:v14 == 1];
  uint64_t v16 = [v10 lastPlayedDate];
  [v7 setShowsPlayerSubtitle:v16 != 0];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  +[GKDashboardPlayerPickerCell defaultSize];
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchPlayers];
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndexedSubscript:v7];

  uint64_t v9 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
  v10 = [v8 referenceKey];
  long long v11 = [v9 objectForKey:v10];
  uint64_t v12 = [v11 integerValue];

  return v12 != 2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchPlayers];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  if (v9)
  {
    v10 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
    long long v11 = [v9 referenceKey];
    uint64_t v12 = [v10 objectForKey:v11];
    uint64_t v13 = [v12 integerValue];

    if (v13 == 1)
    {
      long long v19 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
      v20 = [v9 referenceKey];
      [v19 setObject:&unk_1F0811D60 forKeyedSubscript:v20];
    }
    else if (!v13)
    {
      uint64_t v14 = [(GKDashboardMultiplayerPickerSearchDataSource *)self playerStates];
      v15 = [v9 referenceKey];
      [v14 setObject:&unk_1F0811D48 forKeyedSubscript:v15];

      if ([(GKDashboardMultiplayerPickerSearchDataSource *)self maxSelectable] >= 1)
      {
        uint64_t v16 = [(GKDashboardMultiplayerPickerSearchDataSource *)self selectedPlayers];
        unint64_t v17 = [v16 count];
        unint64_t v18 = [(GKDashboardMultiplayerPickerSearchDataSource *)self maxSelectable];

        if (v17 > v18) {
          [v6 deselectItemAtIndexPath:v7 animated:1];
        }
      }
    }
    v22[0] = v7;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v6 reloadItemsAtIndexPaths:v21];
  }
  else
  {
    [v6 deselectItemAtIndexPath:v7 animated:0];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchBar];
  int v5 = [v4 isFirstResponder];

  if (v5)
  {
    id v6 = [(GKDashboardMultiplayerPickerSearchDataSource *)self searchBar];
    [v6 resignFirstResponder];
  }
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (void)setSearchBar:(id)a3
{
}

- (NSArray)allPlayers
{
  return self->_allPlayers;
}

- (void)setAllPlayers:(id)a3
{
}

- (NSArray)searchPlayers
{
  return self->_searchPlayers;
}

- (void)setSearchPlayers:(id)a3
{
}

- (int64_t)maxSelectable
{
  return self->_maxSelectable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPlayers, 0);
  objc_storeStrong((id *)&self->_allPlayers, 0);
  objc_destroyWeak((id *)&self->_searchBar);

  objc_storeStrong((id *)&self->_playerStates, 0);
}

@end