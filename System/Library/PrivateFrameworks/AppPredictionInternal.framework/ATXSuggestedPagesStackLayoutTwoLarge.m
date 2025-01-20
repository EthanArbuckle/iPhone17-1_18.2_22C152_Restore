@interface ATXSuggestedPagesStackLayoutTwoLarge
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5;
@end

@implementation ATXSuggestedPagesStackLayoutTwoLarge

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v8 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:2 usedPersonalities:0];
    v9 = 0;
    if ((unint64_t)[v8 count] >= 2)
    {
      v10 = +[ATXSuggestedPagesUtils createLargeStack];
      v11 = +[ATXSuggestedPagesUtils createLargeStack];
      v12 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v8 limit:0];
      uint64_t v13 = [v12 count];
      v18[0] = v10;
      v18[1] = v11;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      v15 = [v7 tunableConstants];
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v12, 0, v13, v14, 0, (int)[v15 maxWidgetsInStack]);

      v17[0] = v10;
      v17[1] = v11;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7 = a3;
  if ([v7 count] != 2)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ATXSuggestedPagesStackLayoutTwoLarge.m", 46, @"Invalid parameter not satisfying: %@", @"stacks.count == 2" object file lineNumber description];
  }
  v8 = [v7 objectAtIndexedSubscript:0];
  [v8 assignWidgetSpaceCoordinateWithRow:0 column:0];

  id v10 = [v7 objectAtIndexedSubscript:1];

  [v10 assignWidgetSpaceCoordinateWithRow:0 column:2];
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
  return 4;
}

@end