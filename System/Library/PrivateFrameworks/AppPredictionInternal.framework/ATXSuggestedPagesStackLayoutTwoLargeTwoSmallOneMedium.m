@interface ATXSuggestedPagesStackLayoutTwoLargeTwoSmallOneMedium
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
@end

@implementation ATXSuggestedPagesStackLayoutTwoLargeTwoSmallOneMedium

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v8 = objc_opt_new();
    v9 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:2 usedPersonalities:v8];
    if ((unint64_t)[v9 count] >= 2)
    {
      uint64_t v11 = +[ATXSuggestedPagesUtils createLargeStack];
      v12 = +[ATXSuggestedPagesUtils createLargeStack];
      uint64_t v13 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v9 limit:0];
      v38 = (void *)v11;
      v44[0] = v11;
      v44[1] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      v15 = [v7 tunableConstants];
      v37 = (void *)v13;
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v13, 0, 2, v14, v8, (int)[v15 maxWidgetsInStack]);

      v16 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:1 usedPersonalities:v8];
      if ([v16 count])
      {
        v36 = v12;
        uint64_t v17 = +[ATXSuggestedPagesUtils createMediumStack];
        v34 = v16;
        v18 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:v16 limit:0];
        v35 = (void *)v17;
        uint64_t v43 = v17;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v20 = [v7 tunableConstants];
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v18, 0, 1, v19, v8, (int)[v20 maxWidgetsInStack]);

        v21 = +[ATXSuggestedPagesUtils filterWidgets:v6 bySize:0 usedPersonalities:v8];
        v10 = 0;
        if ((unint64_t)[v21 count] >= 2)
        {
          v32 = +[ATXSuggestedPagesUtils createSmallStack];
          v31 = +[ATXSuggestedPagesUtils createSmallStack];
          [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:1];
          v22 = v33 = v21;
          v42 = v22;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
          v30 = [v33 sortedArrayUsingDescriptors:v23];

          v41[0] = v32;
          v41[1] = v31;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
          v25 = [v7 tunableConstants];
          +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v30, 0, 2, v24, v8, (int)[v25 maxWidgetsInStack]);

          uint64_t v26 = [v37 count] - 2;
          v40[0] = v38;
          v40[1] = v36;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
          v28 = [v7 tunableConstants];
          +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v37, 2, v26, v27, v8, (int)[v28 maxWidgetsInStack]);

          v39[0] = v31;
          v39[1] = v32;
          v39[2] = v35;
          v39[3] = v36;
          v39[4] = v38;
          v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:5];

          v21 = v33;
        }

        v12 = v36;
        v16 = v34;
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
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 5;
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