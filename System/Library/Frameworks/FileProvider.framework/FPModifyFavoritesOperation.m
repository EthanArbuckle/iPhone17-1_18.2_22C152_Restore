@interface FPModifyFavoritesOperation
- (FPModifyFavoritesOperation)initWithItems:(id)a3 favoriteRanks:(id)a4 isUnfavorite:(BOOL)a5;
- (FPModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4;
- (FPModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation FPModifyFavoritesOperation

- (id)replicateForItems:(id)a3
{
  id v4 = a3;
  v5 = [FPModifyFavoritesOperation alloc];
  v6 = [(FPTransformOperation *)self items];
  v7 = objc_msgSend(v6, "fp_pickItemsFromArray:correspondingToIndexesOfItemsInArray:", self->_ranks, v4);
  v8 = [(FPModifyFavoritesOperation *)v5 initWithItems:v4 favoriteRanks:v7 isUnfavorite:self->_isUnfavorite];

  return v8;
}

- (FPModifyFavoritesOperation)initWithItems:(id)a3 favoriteRanks:(id)a4 isUnfavorite:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPModifyFavoritesOperation;
  v11 = [(FPTransformOperation *)&v16 initWithItemsOfDifferentProviders:v9 action:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ranks, a4);
    v12->_isUnfavorite = a5;
    if (!a5)
    {
      uint64_t v13 = [v9 count];
      if (v13 != [(NSArray *)v12->_ranks count])
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, v12, @"FPActionOperation.m", 1382, @"%@ needs to be initialized with either the same number of ranks and items or to unfavorite", objc_opt_class() object file lineNumber description];
      }
    }
    [(FPActionOperation *)v12 setSetupRemoteOperationService:1];
  }

  return v12;
}

- (FPModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4
{
  return [(FPModifyFavoritesOperation *)self initWithItems:a3 favoriteRanks:a4 isUnfavorite:0];
}

- (FPModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3
{
  return [(FPModifyFavoritesOperation *)self initWithItems:a3 favoriteRanks:0 isUnfavorite:1];
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_isUnfavorite)
  {
    [v6 setFavoriteRank:0];
  }
  else
  {
    v8 = [(NSArray *)self->_ranks objectAtIndexedSubscript:a4];
    [v7 setFavoriteRank:v8];
  }
  objc_msgSend(v7, "setState:", objc_msgSend(v7, "state") & 0xFFFFFFFFFFFFFFFBLL);

  return 32;
}

- (id)fp_prettyDescription
{
  v3 = NSString;
  id v4 = FPAbbreviatedArrayDescription(self->_ranks);
  v5 = [(FPTransformOperation *)self items];
  id v6 = objc_msgSend(v5, "fp_itemIdentifiers");
  v7 = FPAbbreviatedArrayDescription(v6);
  v8 = [v3 stringWithFormat:@"set favorite rank %@ on %@", v4, v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end