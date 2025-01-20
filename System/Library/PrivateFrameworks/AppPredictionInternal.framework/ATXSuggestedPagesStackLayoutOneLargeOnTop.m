@interface ATXSuggestedPagesStackLayoutOneLargeOnTop
- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5;
- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3;
- (unint64_t)maxAppRowsForPageType:(int64_t)a3;
- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3;
@end

@implementation ATXSuggestedPagesStackLayoutOneLargeOnTop

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "size", (void)v20) == 2) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    v15 = +[ATXSuggestedPagesUtils createLargeStack];
    v16 = [v7 tunableConstants];
    v17 = +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v8, (int)[v16 maxWidgetsInStack]);
    [v15 setWidgets:v17];

    v24 = v15;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 1;
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