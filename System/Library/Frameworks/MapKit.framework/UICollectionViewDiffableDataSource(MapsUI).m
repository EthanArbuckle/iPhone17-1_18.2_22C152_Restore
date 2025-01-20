@interface UICollectionViewDiffableDataSource(MapsUI)
- (id)_mapkit_visibleFocusItemsInCollectionView:()MapsUI forSection:;
@end

@implementation UICollectionViewDiffableDataSource(MapsUI)

- (id)_mapkit_visibleFocusItemsInCollectionView:()MapsUI forSection:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 frame];
  if (CGRectGetWidth(v40) <= 0.0 || ([v6 frame], CGRectGetHeight(v41) <= 0.0))
  {
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  v8 = [a1 snapshotForSection:v7];
  v9 = [v8 items];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    [v6 layoutIfNeeded];
    v11 = [v6 visibleCells];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v31 = v8;
      id v32 = v7;
      uint64_t v16 = *(void *)v34;
      unint64_t v17 = -1;
      do
      {
        v18 = v13;
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v18);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v6, "indexPathForCell:", v20, v31);
          v22 = id v21 = v6;
          unint64_t v23 = [v22 row];

          v24 = [NSNumber numberWithInteger:v23];
          [v12 setObject:v20 forKeyedSubscript:v24];

          id v6 = v21;
          if (v17 >= v23) {
            unint64_t v17 = v23;
          }
        }
        id v13 = v18;
        uint64_t v15 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v15);

      if (v17 == -1)
      {
        v29 = (void *)MEMORY[0x1E4F1CBF0];
        v8 = v31;
        id v7 = v32;
        goto LABEL_23;
      }
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
      id v7 = v32;
      if (v17 < [v12 count] + v17)
      {
        unint64_t v26 = v17;
        do
        {
          v27 = [NSNumber numberWithUnsignedInteger:v26];
          v28 = [v12 objectForKeyedSubscript:v27];
          [v25 addObject:v28];

          ++v26;
        }
        while (v26 < [v12 count] + v17);
      }
      v29 = (void *)[v25 copy];
      v8 = v31;
      id v6 = v21;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F1CBF0];
      v25 = v13;
    }

LABEL_23:
    goto LABEL_24;
  }
  v29 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_24:

LABEL_25:

  return v29;
}

@end