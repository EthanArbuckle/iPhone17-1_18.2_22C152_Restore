@interface ATXSuggestedPagesStackLayoutTwoSmallOnTop
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5;
@end

@implementation ATXSuggestedPagesStackLayoutTwoSmallOnTop

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  v8 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (!objc_msgSend(v14, "size", (void)v23)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  if ((unint64_t)[v8 count] >= 2)
  {
    v16 = +[ATXSuggestedPagesUtils createSmallStack];
    v17 = +[ATXSuggestedPagesUtils createSmallStack];
    v18 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v8 limit:0];
    uint64_t v19 = [v18 count];
    v28[0] = v16;
    v28[1] = v17;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v21 = [v7 tunableConstants];
    +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v18, 0, v19, v20, 0, (int)[v21 maxWidgetsInStack]);

    v27[0] = v16;
    v27[1] = v17;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7 = a3;
  if ([v7 count] != 2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ATXSuggestedPagesStackLayoutTwoSmallOnTop.m", 48, @"Invalid parameter not satisfying: %@", @"stacks.count == 2" object file lineNumber description];
  }
  v8 = [v7 objectAtIndexedSubscript:0];
  [v8 assignWidgetSpaceCoordinateWithRow:0 column:0];

  id v10 = [v7 objectAtIndexedSubscript:1];

  [v10 assignWidgetSpaceCoordinateWithRow:0 column:1];
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 2;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 0;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  if (objc_msgSend(MEMORY[0x1E4F93B08], "isiPad", a3)) {
    return 4;
  }
  else {
    return 3;
  }
}

@end