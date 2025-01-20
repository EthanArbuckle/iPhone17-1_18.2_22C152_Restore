@interface DOCFavoritesManager
+ (id)favoritesCollection;
+ (id)sharedManager;
- (BOOL)isGathering;
- (NSArray)favoritedLocations;
- (id)_newlyComputedRanksForItems:(id)a3;
- (void)_reverseInsertAll:(id)a3 atIndex:(int64_t)a4 completion:(id)a5;
- (void)addFavorite:(id)a3 completion:(id)a4;
- (void)favoriteItems:(id)a3 ranks:(id)a4 completion:(id)a5;
- (void)insertFavorite:(id)a3 atIndex:(int64_t)a4 completion:(id)a5;
- (void)insertFavorites:(id)a3 atIndex:(int64_t)a4 completion:(id)a5;
- (void)moveFavorite:(id)a3 toTargetIndex:(int64_t)a4 completion:(id)a5;
- (void)redistributeRanksCompletion:(id)a3;
- (void)removeFavorite:(id)a3 completion:(id)a4;
- (void)runInMainThread:(id)a3;
- (void)updateFavoritesRanksToMatchOrderedFavorites:(id)a3 completion:(id)a4;
@end

@implementation DOCFavoritesManager

void __36__DOCFavoritesManager_sharedManager__block_invoke()
{
  id v2 = [(id)objc_opt_class() favoritesCollection];
  v0 = [(DOCItemCollectionObserver *)[DOCFavoritesManager alloc] initWithItemCollection:v2];
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

+ (id)favoritesCollection
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F054C0] defaultManager];
  v3 = (void *)[v2 newFavoritesCollection];

  v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_1];
  [v3 setItemFilteringPredicate:v4];

  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"favoriteRank" ascending:0 comparator:&__block_literal_global_10];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v3 reorderItemsWithSortDescriptors:v6];

  return v3;
}

- (NSArray)favoritedLocations
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"DOCFavoritesManager.m" lineNumber:78 description:@"Must call from main thread"];
  }
  v4 = [(DOCItemCollectionObserver *)self itemCollection];
  v5 = [v4 items];

  return (NSArray *)v5;
}

- (BOOL)isGathering
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"DOCFavoritesManager.m" lineNumber:83 description:@"Must call from main thread"];
  }
  v4 = [(DOCItemCollectionObserver *)self itemCollection];
  char v5 = [v4 isGathering];

  return v5;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DOCFavoritesManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  id v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __42__DOCFavoritesManager_favoritesCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = +[DOCManagedPermission defaultPermission];
    int v4 = [v3 canHostAppPerformAction:2 targetNode:v2];

    char v5 = [v2 favoriteRank];
    if (v5) {
      uint64_t v6 = v4 & ~[v2 isTrashed];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __42__DOCFavoritesManager_favoritesCollection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 unsignedIntegerValue];
  if (v6 <= [v5 unsignedIntegerValue])
  {
    unint64_t v8 = [v4 unsignedIntegerValue];
    if (v8 >= [v5 unsignedIntegerValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x21668ED30](a4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__DOCFavoritesManager_addFavorite_completion___block_invoke;
  v11[3] = &unk_2641B57F0;
  id v12 = v7;
  id v8 = v7;
  v9 = (void *)MEMORY[0x21668ED30](v11);
  v10 = (void *)MEMORY[0x21668ED30]();
  [(DOCFavoritesManager *)self insertFavorite:v6 atIndex:0 completion:v10];
}

uint64_t __46__DOCFavoritesManager_addFavorite_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)insertFavorites:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x21668ED30](a5);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke;
  v17[3] = &unk_2641B57F0;
  id v18 = v9;
  id v10 = v9;
  v11 = (void *)MEMORY[0x21668ED30](v17);
  id v12 = (void *)MEMORY[0x21668ED30]();
  v13 = (void *)[v8 mutableCopy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke_2;
  v15[3] = &unk_2641B57F0;
  id v16 = v12;
  id v14 = v12;
  [(DOCFavoritesManager *)self _reverseInsertAll:v13 atIndex:a4 completion:v15];
}

uint64_t __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reverseInsertAll:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x21668ED30](a5);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke;
  v21[3] = &unk_2641B57F0;
  id v10 = v9;
  id v22 = v10;
  v11 = (void *)MEMORY[0x21668ED30](v21);
  id v12 = (void (**)(void, void))MEMORY[0x21668ED30]();
  if ([v8 count])
  {
    v13 = [v8 lastObject];
    [v8 removeLastObject];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = a4;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_2;
    v15[3] = &unk_2641B5868;
    void v15[4] = self;
    id v14 = v13;
    id v16 = v14;
    v19 = v20;
    id v17 = v8;
    id v18 = v12;
    [(DOCFavoritesManager *)self insertFavorite:v14 atIndex:a4 completion:v15];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v12[2](v12, 1);
  }
}

uint64_t __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_2(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_3;
  v7[3] = &unk_2641B5840;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v5;
  uint64_t v11 = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  char v12 = a2;
  DOCRunInMainThread(v7);
}

void __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritedLocations];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_4;
  v7[3] = &unk_2641B5818;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 72);
  [v4 _reverseInsertAll:v6 atIndex:v5 completion:v7];
}

uint64_t __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    a2 = a2;
  }
  else {
    a2 = 0;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)updateFavoritesRanksToMatchOrderedFavorites:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x21668ED30](a4);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke;
  v51[3] = &unk_2641B57F0;
  id v8 = v7;
  id v52 = v8;
  char v9 = (void *)MEMORY[0x21668ED30](v51);
  id v10 = (void (**)(void, void))MEMORY[0x21668ED30]();
  if ([v6 count])
  {
    uint64_t v11 = [(DOCFavoritesManager *)self favoritedLocations];
    uint64_t v12 = [v6 count];
    if (v12 != [v11 count])
    {
      v20 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        v20 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[DOCFavoritesManager updateFavoritesRanksToMatchOrderedFavorites:completion:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
      v10[2](v10, 0);
      goto LABEL_20;
    }
    v40 = v11;
    v13 = [MEMORY[0x263EFF980] array];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_22;
    v49[3] = &unk_2641B5890;
    id v14 = v13;
    id v50 = v14;
    [v6 enumerateObjectsUsingBlock:v49];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    uint64_t v15 = [v14 count];
    v39 = self;
    if (v15 == [v6 count])
    {
      id v16 = [v6 firstObject];
      id v17 = [v40 firstObject];
      char v18 = [v16 isEqual:v17];

      if ((v18 & 1) == 0)
      {
        v19 = objc_msgSend(v6, "doc_computeNewRankForIndex:", 0);
        if (v19) {
          [v14 replaceObjectAtIndex:0 withObject:v19];
        }
        else {
          *((unsigned char *)v46 + 24) = 1;
        }
      }
      v28 = v46;
      if (!*((unsigned char *)v46 + 24))
      {
        v31 = [v14 firstObject];
        unint64_t v32 = [v31 unsignedLongLongValue];

        v33 = [MEMORY[0x263F089C8] indexSet];
        for (unint64_t i = 1; i < objc_msgSend(v14, "count", v39); ++i)
        {
          v35 = [v14 objectAtIndexedSubscript:i];
          unint64_t v36 = [v35 unsignedLongLongValue];

          if (v36 >= v32)
          {
            [v33 addIndex:i];
            unint64_t v36 = v32;
          }
          unint64_t v32 = v36;
        }
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_2;
        v41[3] = &unk_2641B58B8;
        id v37 = v6;
        id v42 = v37;
        id v38 = v14;
        id v43 = v38;
        v44 = &v45;
        [v33 enumerateRangesUsingBlock:v41];

        if (!*((unsigned char *)v46 + 24))
        {
          [(DOCFavoritesManager *)v39 favoriteItems:v37 ranks:v38 completion:v10];
          goto LABEL_19;
        }
LABEL_18:
        v29 = v39;
        v30 = -[DOCFavoritesManager _newlyComputedRanksForItems:](v39, "_newlyComputedRanksForItems:", v6, v39);
        [(DOCFavoritesManager *)v29 favoriteItems:v6 ranks:v30 completion:v10];

LABEL_19:
        _Block_object_dispose(&v45, 8);

        uint64_t v11 = v40;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v28 = v46;
    }
    *((unsigned char *)v28 + 24) = 1;
    goto LABEL_18;
  }
  v10[2](v10, 1);
LABEL_21:
}

uint64_t __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_22(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 favoriteRank];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v6 = [*(id *)(a1 + 32) addObject:v6];
    uint64_t v7 = v9;
  }
  else
  {
    *a4 = 1;
  }
  return MEMORY[0x270F9A758](v6, v7);
}

void __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v5 = a3;
  unint64_t v6 = a2;
  uint64_t v8 = a2 - 1;
  unint64_t v9 = a2 + a3;
  unint64_t v10 = [*(id *)(a1 + 32) count];
  uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
  uint64_t v12 = v11;
  if (v9 >= v10)
  {
    id v17 = objc_msgSend(*(id *)(a1 + 40), "doc_ranksForInsertingBelowRank:count:", v11, v5);
    if (v17) {
      objc_msgSend(*(id *)(a1 + 40), "replaceObjectsInRange:withObjectsFromArray:", v6, v5, v17);
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v13 = [v11 unsignedLongLongValue];

    id v14 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v9];
    uint64_t v15 = [v14 unsignedLongLongValue];

    unint64_t v16 = v13 + ~v15;
    if (v5 <= v16)
    {
      if (v6 < v9)
      {
        unint64_t v18 = v16 / v5;
        do
        {
          v13 -= v18;
          v19 = *(void **)(a1 + 40);
          v20 = [NSNumber numberWithUnsignedLongLong:v13];
          [v19 replaceObjectAtIndex:v6 withObject:v20];

          ++v6;
          --v5;
        }
        while (v5);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)moveFavorite:(id)a3 toTargetIndex:(int64_t)a4 completion:(id)a5
{
  v37[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (void *)MEMORY[0x21668ED30](a5);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke;
  v34[3] = &unk_2641B57F0;
  id v10 = v9;
  id v35 = v10;
  uint64_t v11 = (void *)MEMORY[0x21668ED30](v34);
  uint64_t v12 = (void (**)(void, void))MEMORY[0x21668ED30]();
  uint64_t v13 = [(DOCFavoritesManager *)self favoritedLocations];
  uint64_t v14 = [v13 indexOfObject:v8];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 == a4)
  {
    v12[2](v12, 0);
  }
  else
  {
    uint64_t v15 = [(DOCFavoritesManager *)self favoritedLocations];
    unint64_t v16 = (void *)[v15 mutableCopy];

    [v16 removeObjectAtIndex:v14];
    unint64_t v17 = [v16 count];
    if (v17 >= a4) {
      int64_t v18 = a4;
    }
    else {
      int64_t v18 = v17;
    }
    v19 = objc_msgSend(v16, "doc_computeNewRankForIndex:", v18);
    if (v19)
    {
      v37[0] = v8;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
      unint64_t v36 = v19;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      [(DOCFavoritesManager *)self favoriteItems:v20 ranks:v21 completion:v12];
    }
    else
    {
      uint64_t v22 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        uint64_t v22 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DOCFavoritesManager moveFavorite:toTargetIndex:completion:](v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke_27;
      v30[3] = &unk_2641B58E0;
      v30[4] = self;
      id v31 = v8;
      int64_t v33 = a4;
      unint64_t v32 = v12;
      [(DOCFavoritesManager *)self redistributeRanksCompletion:v30];
    }
  }
}

uint64_t __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke_27(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) moveFavorite:*(void *)(a1 + 40) toTargetIndex:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x21668ED30](a4);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke;
  v27[3] = &unk_2641B57F0;
  id v8 = v7;
  id v28 = v8;
  unint64_t v9 = (void *)MEMORY[0x21668ED30](v27);
  id v10 = (void (**)(void, void))MEMORY[0x21668ED30]();
  uint64_t v11 = [(DOCFavoritesManager *)self favoritedLocations];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_2;
  v25[3] = &unk_2641B5908;
  id v12 = v6;
  id v26 = v12;
  uint64_t v13 = [v11 indexesOfObjectsPassingTest:v25];

  if ([v13 count])
  {
    uint64_t v14 = [DOCModifyFavoritesOperation alloc];
    v29[0] = v12;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    unint64_t v16 = +[DOCUndoManager shared];
    unint64_t v17 = [(DOCModifyFavoritesOperation *)v14 initWithItemsToUnfavorite:v15 undoManager:v16];

    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3;
    uint64_t v22 = &unk_2641B5930;
    id v23 = v12;
    uint64_t v24 = v10;
    [(FPActionOperation *)v17 setActionCompletionBlock:&v19];
    int64_t v18 = objc_msgSend(MEMORY[0x263F054C0], "defaultManager", v19, v20, v21, v22);
    [v18 scheduleAction:v17];
  }
  else
  {
    v10[2](v10, 0);
  }
}

uint64_t __49__DOCFavoritesManager_removeFavorite_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = [v6 isEqual:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

void __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = docPickerLogHandle;
    if (!docPickerLogHandle)
    {
      DOCInitLogging();
      id v4 = docPickerLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)insertFavorite:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (void *)MEMORY[0x21668ED30](a5);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke;
  v31[3] = &unk_2641B57F0;
  id v10 = v9;
  id v32 = v10;
  uint64_t v11 = (void *)MEMORY[0x21668ED30](v31);
  id v12 = (void *)MEMORY[0x21668ED30]();
  uint64_t v13 = [(DOCFavoritesManager *)self favoritedLocations];
  int64_t v14 = [v13 indexOfObject:v8];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [(DOCFavoritesManager *)self favoritedLocations];
    unint64_t v16 = objc_msgSend(v15, "doc_computeNewRankForIndex:", a4);

    if (v16)
    {
      v34[0] = v8;
      unint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
      int64_t v33 = v16;
      int64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      [(DOCFavoritesManager *)self favoriteItems:v17 ranks:v18 completion:v12];
    }
    else
    {
      uint64_t v19 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        uint64_t v19 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[DOCFavoritesManager insertFavorite:atIndex:completion:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke_32;
      v27[3] = &unk_2641B58E0;
      void v27[4] = self;
      id v28 = v8;
      int64_t v30 = a4;
      id v29 = v12;
      [(DOCFavoritesManager *)self redistributeRanksCompletion:v27];
    }
  }
  else
  {
    [(DOCFavoritesManager *)self moveFavorite:v8 toTargetIndex:a4 - (v14 < a4) completion:v12];
  }
}

uint64_t __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke_32(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) insertFavorite:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)redistributeRanksCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x21668ED30](a3, a2);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke;
  v12[3] = &unk_2641B57F0;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void *)MEMORY[0x21668ED30](v12);
  uint64_t v7 = (void *)MEMORY[0x21668ED30]();
  id v8 = [(DOCFavoritesManager *)self favoritedLocations];
  if ((unint64_t)[v8 count] >= 2)
  {
    unint64_t v9 = [(DOCFavoritesManager *)self _newlyComputedRanksForItems:v8];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_2;
    v10[3] = &unk_2641B57F0;
    id v11 = v7;
    [(DOCFavoritesManager *)self favoriteItems:v8 ranks:v9 completion:v10];
  }
}

uint64_t __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_3;
  v3[3] = &unk_2641B5958;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  DOCRunInMainThread(v3);
}

uint64_t __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_newlyComputedRanksForItems:(id)a3
{
  id v3 = a3;
  id v4 = NSNumber;
  char v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  uint64_t v7 = [v4 numberWithUnsignedLongLong:(unint64_t)(v6 * 1000.0)];

  id v8 = DOCRandomRankBetween(0, 0x3E8uLL);
  unint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedLongLongValue") - objc_msgSend(v8, "unsignedLongLongValue") * v10);
      [v9 addObject:v11];

      ++v10;
    }
    while ([v3 count] > v10);
  }

  return v9;
}

- (void)favoriteItems:(id)a3 ranks:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void *)MEMORY[0x21668ED30](a5);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke;
  v28[3] = &unk_2641B57F0;
  id v29 = v9;
  id v10 = v9;
  id v11 = (void *)MEMORY[0x21668ED30](v28);
  id v12 = (void *)MEMORY[0x21668ED30]();
  id v13 = [DOCModifyFavoritesOperation alloc];
  int64_t v14 = +[DOCUndoManager shared];
  uint64_t v15 = [(DOCModifyFavoritesOperation *)v13 initWithItemsToFavorite:v7 favoriteRanks:v8 undoManager:v14];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2;
  v25[3] = &unk_2641B5930;
  id v26 = v7;
  id v16 = v12;
  id v27 = v16;
  id v17 = v7;
  [(FPActionOperation *)v15 setActionCompletionBlock:v25];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_34;
  uint64_t v23 = &unk_2641B5980;
  id v24 = v16;
  id v18 = v16;
  [(FPActionOperation *)v15 setErrorRecoveryHandler:&v20];
  uint64_t v19 = objc_msgSend(MEMORY[0x263F054C0], "defaultManager", v20, v21, v22, v23);
  [v19 scheduleAction:v15];
}

uint64_t __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = docPickerLogHandle;
    if (!docPickerLogHandle)
    {
      DOCInitLogging();
      id v4 = docPickerLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runInMainThread:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)updateFavoritesRanksToMatchOrderedFavorites:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)moveFavorite:(uint64_t)a3 toTargetIndex:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Failed to unfavorite item %@. Error: %@");
}

- (void)insertFavorite:(uint64_t)a3 atIndex:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Failed to favorite items %@. Error: %@");
}

@end