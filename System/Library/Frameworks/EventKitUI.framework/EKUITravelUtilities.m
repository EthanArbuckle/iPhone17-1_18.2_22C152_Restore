@interface EKUITravelUtilities
- (id)travelTimePopupMenuForEvent:(id)a3 selectionHandler:(id)a4;
@end

@implementation EKUITravelUtilities

- (id)travelTimePopupMenuForEvent:(id)a3 selectionHandler:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  [v5 travelTime];
  double v9 = v8;
  v10 = EventKitUIBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"Travel time menu no travel time" value:@"None" table:0];

  v12 = (void *)MEMORY[0x1E4FB13F0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke;
  v33[3] = &unk_1E608AE48;
  id v13 = v6;
  id v34 = v13;
  v29 = (void *)v11;
  v14 = [v12 actionWithTitle:v11 image:0 identifier:0 handler:v33];
  v15 = v14;
  if (v9 == 0.0) {
    [v14 setState:1];
  }
  v35[0] = v15;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 1, v15);
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  CalAddInlineMenuItemArrayToArray(v7, v16);

  v17 = [v5 structuredLocation];
  if ([v17 isStructured])
  {
    v18 = [v5 travelStartLocation];
    [v18 isStructured];
  }
  v19 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 6; ++i)
  {
    double v21 = *(double *)&_travelTimeDurations_0[i];
    v22 = (void *)MEMORY[0x1E4FB13F0];
    v23 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke_2;
    v30[3] = &unk_1E608AE70;
    id v24 = v13;
    id v31 = v24;
    double v32 = v21;
    v25 = [v22 actionWithTitle:v23 image:0 identifier:0 handler:v30];

    if (v21 == v9) {
      [v25 setState:1];
    }
    [v19 addObject:v25];
  }
  CalAddInlineMenuItemArrayToArray(v7, (const char *)v19);
  v26 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v7];

  return v26;
}

uint64_t __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t __68__EKUITravelUtilities_travelTimePopupMenuForEvent_selectionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

@end