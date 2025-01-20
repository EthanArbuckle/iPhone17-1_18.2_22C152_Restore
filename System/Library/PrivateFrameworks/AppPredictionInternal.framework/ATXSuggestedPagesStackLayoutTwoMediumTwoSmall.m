@interface ATXSuggestedPagesStackLayoutTwoMediumTwoSmall
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
@end

@implementation ATXSuggestedPagesStackLayoutTwoMediumTwoSmall

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v8 = objc_opt_new();
    v9 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:1 usedPersonalities:v8];
    if ((unint64_t)[v9 count] >= 2)
    {
      uint64_t v11 = +[ATXSuggestedPagesUtils createMediumStack];
      v12 = +[ATXSuggestedPagesUtils createMediumStack];
      uint64_t v13 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v9 limit:0];
      v29 = (void *)v11;
      v35[0] = v11;
      v35[1] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      v15 = [v7 tunableConstants];
      v30 = (void *)v13;
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v13, 0, 2, v14, v8, (int)[v15 maxWidgetsInStack]);

      v16 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:0 usedPersonalities:v8];
      v10 = 0;
      if ((unint64_t)[v16 count] >= 2)
      {
        v28 = +[ATXSuggestedPagesUtils createSmallStack];
        v26 = +[ATXSuggestedPagesUtils createSmallStack];
        v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:1];
        v34 = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        v25 = [v16 sortedArrayUsingDescriptors:v18];

        v33[0] = v28;
        v33[1] = v26;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
        [v7 tunableConstants];
        v20 = v27 = v16;
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v25, 0, 2, v19, v8, (int)[v20 maxWidgetsInStack]);

        uint64_t v21 = [v30 count] - 2;
        v32[0] = v29;
        v32[1] = v12;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
        v23 = [v7 tunableConstants];
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v30, 2, v21, v22, v8, (int)[v23 maxWidgetsInStack]);

        v16 = v27;
        v31[0] = v26;
        v31[1] = v28;
        v31[2] = v12;
        v31[3] = v29;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  return 4;
}

@end