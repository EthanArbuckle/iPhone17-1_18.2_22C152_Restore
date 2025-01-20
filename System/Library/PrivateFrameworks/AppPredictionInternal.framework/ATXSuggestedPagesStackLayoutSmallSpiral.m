@interface ATXSuggestedPagesStackLayoutSmallSpiral
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5;
@end

@implementation ATXSuggestedPagesStackLayoutSmallSpiral

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (![v15 size]) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }

    if ((unint64_t)[v9 count] >= 3)
    {
      v16 = objc_opt_new();
      v17 = objc_opt_new();
      v18 = objc_opt_new();
      v25 = +[ATXSuggestedPagesUtils createSmallStack];
      v19 = +[ATXSuggestedPagesUtils createSmallStack];
      v20 = +[ATXSuggestedPagesUtils createSmallStack];
      v26 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v9 limit:0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __86__ATXSuggestedPagesStackLayoutSmallSpiral_makeStacksFromWidgets_pageType_environment___block_invoke;
      v27[3] = &unk_1E68B4600;
      id v28 = v17;
      id v29 = v18;
      id v30 = v16;
      id v31 = v7;
      id v21 = v16;
      id v22 = v18;
      id v23 = v17;
      [v26 enumerateObjectsUsingBlock:v27];
      [v25 setWidgets:v21];
      [v19 setWidgets:v23];
      [v20 setWidgets:v22];
      v36[0] = v25;
      v36[1] = v19;
      v36[2] = v20;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

uint64_t __86__ATXSuggestedPagesStackLayoutSmallSpiral_makeStacksFromWidgets_pageType_environment___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  if (a3 == 2)
  {
    v5 = a1 + 5;
  }
  else if (a3 == 1)
  {
    v5 = a1 + 4;
  }
  else
  {
    id v6 = a1[6];
    v5 = a1 + 6;
    unint64_t v7 = [v6 count];
    v8 = [v5[1] tunableConstants];
    int v9 = [v8 maxWidgetsInStack];

    id v11 = v13;
    if (v7 >= v9) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = [*v5 addObject:v13];
  id v11 = v13;
LABEL_7:
  return MEMORY[0x1F41817F8](v10, v11);
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7 = a3;
  if ([v7 count] != 3)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ATXSuggestedPagesStackLayoutSmallSpiral.m", 70, @"Invalid parameter not satisfying: %@", @"stacks.count == 3" object file lineNumber description];
  }
  v8 = [v7 objectAtIndexedSubscript:0];
  [v8 setCoordinateRow:0];

  int v9 = [v7 objectAtIndexedSubscript:0];
  [v9 setCoordinateColumn:0];

  uint64_t v10 = [v7 objectAtIndexedSubscript:1];
  [v10 setCoordinateRow:2];

  id v11 = [v7 objectAtIndexedSubscript:1];
  [v11 setCoordinateColumn:2];

  uint64_t v12 = [v7 objectAtIndexedSubscript:2];
  [v12 setCoordinateRow:4];

  id v14 = [v7 objectAtIndexedSubscript:2];

  [v14 setCoordinateColumn:0];
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 3;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 12;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  return 0;
}

@end