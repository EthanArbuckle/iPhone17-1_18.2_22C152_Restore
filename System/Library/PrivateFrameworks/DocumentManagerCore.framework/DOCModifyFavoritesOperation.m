@interface DOCModifyFavoritesOperation
- (BOOL)isUnfavorite;
- (DOCModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4 undoManager:(id)a5;
- (DOCModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3 undoManager:(id)a4;
- (DOCUndoManager)undoManager;
- (NSArray)oldFavorites;
- (NSArray)oldRanks;
- (NSArray)updatedRanks;
- (NSString)actionNameForUndoing;
- (id)currentFavoriteRanks;
- (id)currentFavorites;
- (id)favoriteRanksFromItems:(id)a3;
- (id)oldRanksForOperationItems;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCModifyFavoritesOperation

- (DOCModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4 undoManager:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DOCModifyFavoritesOperation;
  v11 = [(FPModifyFavoritesOperation *)&v18 initWithItemsToFavorite:a3 favoriteRanks:v9];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(DOCModifyFavoritesOperation *)v11 currentFavorites];
    oldFavorites = v12->_oldFavorites;
    v12->_oldFavorites = (NSArray *)v13;

    uint64_t v15 = [(DOCModifyFavoritesOperation *)v12 currentFavoriteRanks];
    oldRanks = v12->_oldRanks;
    v12->_oldRanks = (NSArray *)v15;

    objc_storeStrong((id *)&v12->_updatedRanks, a4);
    objc_storeStrong((id *)&v12->_undoManager, a5);
    v12->_isUnfavorite = 0;
    [(DOCModifyFavoritesOperation *)v12 registerUndo];
  }

  return v12;
}

- (DOCModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3 undoManager:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DOCModifyFavoritesOperation;
  v8 = [(FPModifyFavoritesOperation *)&v17 initWithItemsToUnfavorite:a3];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(DOCModifyFavoritesOperation *)v8 currentFavorites];
    oldFavorites = v9->_oldFavorites;
    v9->_oldFavorites = (NSArray *)v10;

    uint64_t v12 = [(DOCModifyFavoritesOperation *)v9 currentFavoriteRanks];
    oldRanks = v9->_oldRanks;
    v9->_oldRanks = (NSArray *)v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    updatedRanks = v9->_updatedRanks;
    v9->_updatedRanks = v14;

    objc_storeStrong((id *)&v9->_undoManager, a4);
    v9->_isUnfavorite = 1;
    [(DOCModifyFavoritesOperation *)v9 registerUndo];
  }

  return v9;
}

- (NSString)actionNameForUndoing
{
  v3 = _DocumentManagerBundle();
  v4 = [v3 localizedStringForKey:@"Modify Favorite of “%@” [undo / redo command]" value:@"Modify Favorite of “%@”" table:@"Localizable"];

  v5 = _DocumentManagerBundle();
  v6 = [v5 localizedStringForKey:@"Modify Favorites of %lu Items [undo / redo command]" value:@"Modify Favorites of %lu Items [undo / redo command]" table:@"Localizable"];

  id v7 = [(FPTransformOperation *)self items];
  uint64_t v8 = [v7 count];

  id v9 = [(FPTransformOperation *)self items];
  uint64_t v10 = [v9 firstObject];
  v11 = [v10 displayName];

  if (v8 == 1) {
    objc_msgSend(NSString, "localizedStringWithFormat:", v4, v11);
  }
  else {
  uint64_t v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v8);
  }

  return (NSString *)v12;
}

- (id)operationForRedoing
{
  v3 = [(FPTransformOperation *)self items];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(DOCModifyFavoritesOperation *)self isUnfavorite];
    v6 = [DOCModifyFavoritesOperation alloc];
    id v7 = [(FPTransformOperation *)self items];
    if (v5)
    {
      uint64_t v8 = [(DOCModifyFavoritesOperation *)self undoManager];
      id v9 = [(DOCModifyFavoritesOperation *)v6 initWithItemsToUnfavorite:v7 undoManager:v8];
    }
    else
    {
      uint64_t v8 = [(DOCModifyFavoritesOperation *)self updatedRanks];
      uint64_t v10 = [(DOCModifyFavoritesOperation *)self undoManager];
      id v9 = [(DOCModifyFavoritesOperation *)v6 initWithItemsToFavorite:v7 favoriteRanks:v8 undoManager:v10];
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)operationForUndoing
{
  v3 = [(FPTransformOperation *)self items];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v9 = 0;
    goto LABEL_9;
  }
  BOOL v5 = [(DOCModifyFavoritesOperation *)self oldRanksForOperationItems];
  if ([(DOCModifyFavoritesOperation *)self isUnfavorite])
  {
    v6 = [DOCModifyFavoritesOperation alloc];
    id v7 = [(FPTransformOperation *)self items];
    uint64_t v8 = [(DOCModifyFavoritesOperation *)self undoManager];
  }
  else
  {
    uint64_t v10 = [v5 count];
    v6 = [DOCModifyFavoritesOperation alloc];
    id v7 = [(FPTransformOperation *)self items];
    uint64_t v8 = [(DOCModifyFavoritesOperation *)self undoManager];
    if (!v10)
    {
      uint64_t v11 = [(DOCModifyFavoritesOperation *)v6 initWithItemsToUnfavorite:v7 undoManager:v8];
      goto LABEL_8;
    }
  }
  uint64_t v11 = [(DOCModifyFavoritesOperation *)v6 initWithItemsToFavorite:v7 favoriteRanks:v5 undoManager:v8];
LABEL_8:
  id v9 = (void *)v11;

LABEL_9:
  return v9;
}

- (void)registerUndo
{
  id v3 = [(DOCModifyFavoritesOperation *)self undoManager];
  [v3 registerUndoOperationForSender:self];
}

- (id)currentFavorites
{
  v2 = +[DOCFavoritesManager sharedManager];
  id v3 = [v2 favoritedLocations];

  return v3;
}

- (id)currentFavoriteRanks
{
  id v3 = [(DOCModifyFavoritesOperation *)self currentFavorites];
  uint64_t v4 = [(DOCModifyFavoritesOperation *)self favoriteRanksFromItems:v3];

  return v4;
}

- (id)favoriteRanksFromItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "favoriteRank", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)oldRanksForOperationItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(FPTransformOperation *)self items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke;
  v9[3] = &unk_2641B5CE0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v4 = [*(id *)(a1 + 32) oldFavorites];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke_2;
  uint64_t v11 = &unk_2641B5CB8;
  id v5 = v3;
  id v12 = v5;
  long long v15 = &v16;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v7;
  [v4 enumerateObjectsUsingBlock:&v8];

  if (!*((unsigned char *)v17 + 24)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", &unk_26C40CB98, v8, v9, v10, v11, v12);
  }

  _Block_object_dispose(&v16, 8);
}

void __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 itemID];
  uint64_t v8 = [v6 itemID];

  LODWORD(v6) = [v7 isEqualToItemID:v8];
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v9 = *(void **)(a1 + 40);
    id v11 = [*(id *)(a1 + 48) oldRanks];
    id v10 = [v11 objectAtIndexedSubscript:a3];
    [v9 addObject:v10];
  }
}

- (NSArray)oldFavorites
{
  return self->_oldFavorites;
}

- (NSArray)oldRanks
{
  return self->_oldRanks;
}

- (NSArray)updatedRanks
{
  return self->_updatedRanks;
}

- (BOOL)isUnfavorite
{
  return self->_isUnfavorite;
}

- (DOCUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_updatedRanks, 0);
  objc_storeStrong((id *)&self->_oldRanks, 0);
  objc_storeStrong((id *)&self->_oldFavorites, 0);
}

@end