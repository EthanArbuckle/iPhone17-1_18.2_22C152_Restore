@interface ATXSuggestedPagesStackLayoutFourSmallOnTop
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5;
@end

@implementation ATXSuggestedPagesStackLayoutFourSmallOnTop

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (a4 == 4 || ([MEMORY[0x1E4F93B08] isiPad] & 1) != 0)
  {
    id v9 = 0;
  }
  else
  {
    v10 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (![v16 size]) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    if ((unint64_t)[v10 count] >= 4)
    {
      v17 = +[ATXSuggestedPagesUtils createSmallStack];
      v18 = +[ATXSuggestedPagesUtils createSmallStack];
      v19 = +[ATXSuggestedPagesUtils createSmallStack];
      v20 = +[ATXSuggestedPagesUtils createSmallStack];
      v30[0] = v17;
      v30[1] = v18;
      v30[2] = v19;
      v30[3] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
      v22 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v10 limit:4];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __89__ATXSuggestedPagesStackLayoutFourSmallOnTop_makeStacksFromWidgets_pageType_environment___block_invoke;
      v24[3] = &unk_1E68B0AF0;
      id v9 = v21;
      id v25 = v9;
      [v22 enumerateObjectsUsingBlock:v24];
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

void __89__ATXSuggestedPagesStackLayoutFourSmallOnTop_makeStacksFromWidgets_pageType_environment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a2;
  id v7 = [v5 arrayWithObjects:&v9 count:1];
  id v8 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3, v9, v10);

  [v8 setWidgets:v7];
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7 = a3;
  if ([v7 count] != 4)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXSuggestedPagesStackLayoutFourSmallOnTop.m", 56, @"Invalid parameter not satisfying: %@", @"stacks.count == 4" object file lineNumber description];
  }
  id v8 = [v7 objectAtIndexedSubscript:0];
  [v8 assignWidgetSpaceCoordinateWithRow:0 column:0];

  id v9 = [v7 objectAtIndexedSubscript:1];
  [v9 assignWidgetSpaceCoordinateWithRow:0 column:1];

  uint64_t v10 = [v7 objectAtIndexedSubscript:2];
  [v10 assignWidgetSpaceCoordinateWithRow:1 column:0];

  id v12 = [v7 objectAtIndexedSubscript:3];

  [v12 assignWidgetSpaceCoordinateWithRow:1 column:1];
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 4;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 0;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  if (objc_msgSend(MEMORY[0x1E4F93B08], "isiPad", a3)) {
    return 3;
  }
  else {
    return 1;
  }
}

@end