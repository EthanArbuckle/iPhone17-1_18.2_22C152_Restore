@interface WFChooseFromListAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
+ (id)userInterfaceProtocol;
- (BOOL)populatesInputFromInputParameter;
- (id)appResource;
- (id)contentDestinationWithError:(id *)a3;
- (id)contentItemsFromSelectedItem:(id)a3;
- (id)itemsFromDictionaryItem:(id)a3;
- (id)roundedImageFromWFImage:(id)a3 roundingStyle:(unint64_t)a4 desiredSize:(CGSize)a5 desiredScale:(double)a6;
- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4;
- (void)presentAlertWithUserInterface:(id)a3 prompt:(id)a4 input:(id)a5;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFChooseFromListAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  id v23 = a3;
  v7 = (void (**)(id, void))a4;
  if (!v7)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFChooseFromListAction.m", 243, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v8 = objc_opt_class();
  v9 = WFEnforceClass(v23, v8);
  v10 = v9;
  if (v9)
  {
    v11 = [v9 selectedItem];
    v12 = [v11 identifier];
    uint64_t v13 = [v12 integerValue];

    v14 = [(WFChooseFromListAction *)self input];
    uint64_t v15 = [v14 numberOfItems];

    if (v13 >= v15)
    {
      v7[2](v7, 0);
    }
    else
    {
      v16 = [(WFChooseFromListAction *)self input];
      v17 = [v16 items];
      v18 = [v17 objectAtIndex:v13];

      v19 = (void *)MEMORY[0x263F337B0];
      v20 = [(WFChooseFromListAction *)self contentItemsFromSelectedItem:v18];
      v21 = [v19 collectionWithItems:v20];
      ((void (**)(id, void *))v7)[2](v7, v21);
    }
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (id)roundedImageFromWFImage:(id)a3 roundingStyle:(unint64_t)a4 desiredSize:(CGSize)a5 desiredScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  WFContentItemListThumbnailCornerRadiusForRoundingStyle();
  CGFloat v11 = v10;
  objc_msgSend(MEMORY[0x263F85188], "contextWithSize:scale:", width, height, a6);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (CGContext *)[v12 CGContext];
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.double width = width;
  v18.size.double height = height;
  v14 = CGPathCreateWithRoundedRect(v18, v11, v11, 0);
  CGContextAddPath(v13, v14);
  CGContextClip(v13);
  objc_msgSend(v9, "drawInContext:inRect:", v12, 0.0, 0.0, width, height);

  uint64_t v15 = [v12 image];

  return v15;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"originalItems"];

  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.shortcuts.choose-from-list", v19);

    v21 = [v15 items];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v24[3] = &unk_264E56920;
    v24[4] = self;
    dispatch_queue_t v25 = v20;
    v22 = v20;
    objc_msgSend(v21, "if_mapAsynchronouslyOnQueue:transform:completionHandler:", v22, v24, v16);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)WFChooseFromListAction;
    [(WFHandleIntentAction *)&v23 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__6188;
  v36[4] = __Block_byref_object_dispose__6189;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__6188;
  v34[4] = __Block_byref_object_dispose__6189;
  id v35 = 0;
  dispatch_group_enter(v9);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_257;
  v30[3] = &unk_264E568A8;
  uint64_t v10 = *(void *)(a1 + 32);
  v32 = v34;
  v30[4] = v10;
  __asm { FMOV            V0.2D, #31.0 }
  long long v33 = _Q0;
  id v16 = v9;
  v31 = v16;
  if ((objc_msgSend(v7, "getListThumbnail:forSize:", v30, 31.0, 31.0) & 1) == 0) {
    dispatch_group_leave(v16);
  }
  dispatch_group_enter(v16);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2;
  v27[3] = &unk_264E568D0;
  v29 = v36;
  v17 = v16;
  v28 = v17;
  if (([v7 getListSubtitle:v27] & 1) == 0) {
    dispatch_group_leave(v17);
  }
  int v18 = *(NSObject **)(a1 + 40);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
  v21[3] = &unk_264E568F8;
  id v22 = v7;
  id v23 = v8;
  v24 = v36;
  dispatch_queue_t v25 = v34;
  uint64_t v26 = a3;
  id v19 = v7;
  id v20 = v8;
  dispatch_group_notify(v17, v18, v21);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_257(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263F85630]];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v6 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v6 = 0;
  }

  if (v15)
  {
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x263F85258] currentDevice];
    [v9 screenScale];
    CGFloat v11 = objc_msgSend(v8, "roundedImageFromWFImage:roundingStyle:desiredSize:desiredScale:", v15, v6, *(double *)(a1 + 56), *(double *)(a1 + 64), v10);
    uint64_t v12 = [v7 imageWithWFImage:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(a1 + 64));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [WFChooseFromListItem alloc];
  id v4 = [*(id *)(a1 + 32) name];
  v5 = [(WFChooseFromListItem *)v3 initWithIdentifier:v6 displayString:v4 subtitleString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) displayImage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  (*(void (**)(uint64_t, WFChooseFromListItem *, void))(v2 + 16))(v2, v5, 0);
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)presentAlertWithUserInterface:(id)a3 prompt:(id)a4 input:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(WFChooseFromListAction *)self parameterValueForKey:@"WFChooseFromListActionSelectMultiple" ofClass:objc_opt_class()];
  int v11 = [v10 BOOLValue];

  uint64_t v12 = [(WFChooseFromListAction *)self parameterValueForKey:@"WFChooseFromListActionSelectAll" ofClass:objc_opt_class()];
  unsigned __int8 v13 = [v12 BOOLValue];

  id v14 = [v9 items];
  if ([v14 count] == 1)
  {
    id v15 = [v14 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v17 = [v9 items];
      int v18 = [v17 firstObject];
      uint64_t v19 = [(WFChooseFromListAction *)self itemsFromDictionaryItem:v18];

      id v14 = (void *)v19;
    }
  }
  id v35 = v9;
  if (v11 & v13)
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v14, "count", v9));
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  id v22 = objc_msgSend(MEMORY[0x263F336E8], "alertWithPreferredStyle:", 1, v35);
  if ([v8 length]) {
    id v23 = v8;
  }
  else {
    id v23 = 0;
  }
  [v22 setTitle:v23];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke;
  v45[3] = &unk_264E56880;
  id v24 = v21;
  id v46 = v24;
  char v49 = v11;
  id v25 = v22;
  id v47 = v25;
  v48 = self;
  uint64_t v26 = objc_msgSend(v14, "if_compactMap:", v45);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        [v25 addButton:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v28);
  }
  v31 = [MEMORY[0x263F336F0] cancelButtonWithTarget:self action:sel_cancel];
  [v25 addButton:v31];

  if (v11)
  {
    v32 = (void *)MEMORY[0x263F336F0];
    long long v33 = WFLocalizedString(@"Done");
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_4;
    v38[3] = &unk_264E5DED8;
    id v39 = v26;
    v40 = self;
    v34 = [v32 buttonWithTitle:v33 style:0 preferred:1 handler:v38];
    [v25 addButton:v34];
  }
  [v37 presentAlert:v25];
}

id __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) containsIndex:a3];
  if (*(unsigned char *)(a1 + 56))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_2;
    aBlock[3] = &unk_264E56858;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = a3;
    id v7 = _Block_copy(aBlock);
    id v8 = v14;
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_3;
    v11[3] = &unk_264E5DED8;
    v11[4] = *(void *)(a1 + 48);
    id v12 = v5;
    id v7 = _Block_copy(v11);
    id v8 = v12;
  }

  id v9 = [MEMORY[0x263F33798] buttonWithContentItem:v5 selected:v6 stickySelection:*(unsigned __int8 *)(a1 + 56) handler:v7];

  return v9;
}

void __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSelected", (void)v13))
        {
          id v9 = *(void **)(a1 + 40);
          double v10 = [v8 contentItem];
          int v11 = [v9 contentItemsFromSelectedItem:v10];
          [v2 addObjectsFromArray:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v12 = [MEMORY[0x263F337B0] collectionWithItems:v2];
  [*(id *)(a1 + 40) setOutput:v12];

  [*(id *)(a1 + 40) finishRunningWithError:0];
}

void __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) buttons];
  id v3 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelected:", objc_msgSend(v5, "isSelected") ^ 1);
}

uint64_t __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F337B0];
  id v3 = [*(id *)(a1 + 32) contentItemsFromSelectedItem:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 collectionWithItems:v3];
  [*(id *)(a1 + 32) setOutput:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 finishRunningWithError:0];
}

- (id)contentItemsFromSelectedItem:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 attributionSet];
  id v5 = [v4 attributionSetByFilteringNeighborsOfContentItem:v3];
  [v3 setAttributionSet:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v3 items];
  }
  else
  {
    v9[0] = v3;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)itemsFromDictionaryItem:(id)a3
{
  id v3 = [a3 dictionary];
  uint64_t v4 = [v3 allKeys];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__WFChooseFromListAction_itemsFromDictionaryItem___block_invoke;
  v8[3] = &unk_264E56830;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "if_compactMap:", v8);

  return v6;
}

id __50__WFChooseFromListAction_itemsFromDictionaryItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 description];
  }
  id v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[WFChooseFromListArrayContentItem itemWithObjects:v6 named:v5];
  }
  else {
  id v7 = [MEMORY[0x263F337C8] itemWithObject:v6 named:v5];
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 items];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    [(WFChooseFromListAction *)self setOutput:v4];
    [(WFHandleIntentAction *)self finishRunningWithError:0];
    goto LABEL_21;
  }
  id v7 = [(WFChooseFromListAction *)self parameterValueForKey:@"WFChooseFromListActionSelectMultiple" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  id v9 = [(WFChooseFromListAction *)self userInterface];
  double v10 = [v9 userInterfaceType];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F33B38]];

  if (!v11)
  {
    id v12 = [(WFChooseFromListAction *)self parameterValueForKey:@"WFChooseFromListActionPrompt" ofClass:objc_opt_class()];
    if (![v12 length] && (v8 & 1) == 0)
    {
      uint64_t v15 = [(WFChooseFromListAction *)self localizedDefaultDisambiguationPrompt];

      id v12 = (void *)v15;
    }
    long long v16 = [v4 items];
    uint64_t v17 = [v16 count];

    if (!v17)
    {
      [(WFChooseFromListAction *)self setOutput:v4];
      long long v13 = self;
      long long v14 = 0;
      goto LABEL_14;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5E938;
    void aBlock[4] = self;
    id v18 = v12;
    id v41 = v18;
    id v19 = v4;
    id v42 = v19;
    uint64_t v20 = (void (**)(void))_Block_copy(aBlock);
    v21 = [v19 collectionByFilteringItemsWithBlock:&__block_literal_global_6220 excludedItems:0];
    id v22 = [(WFChooseFromListAction *)self parameterValueForKey:@"WFChooseFromListActionSelectAll" ofClass:objc_opt_class()];
    char v23 = [v22 BOOLValue];

    id v24 = [(WFChooseFromListAction *)self userInterface];
    long long v33 = v21;
    if ([v24 isRunningWithSiriUI])
    {
    }
    else
    {
      char v30 = v23;
      v31 = v18;
      id v25 = [v21 items];
      uint64_t v32 = [v25 count];
      uint64_t v26 = [v19 items];
      uint64_t v27 = v20;
      uint64_t v28 = [v26 count];

      BOOL v29 = v32 == v28;
      uint64_t v20 = v27;
      if (v29)
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_3;
        v34[3] = &unk_264E56808;
        v34[4] = self;
        id v35 = v31;
        char v38 = v30;
        char v39 = v8;
        id v36 = v19;
        id v37 = v27;
        [(WFChooseFromListAction *)self requestUnlock:v34];

LABEL_19:
        goto LABEL_20;
      }
    }
    v20[2](v20);
    goto LABEL_19;
  }
  if (v8)
  {
    id v12 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    long long v13 = self;
    long long v14 = v12;
LABEL_14:
    [(WFHandleIntentAction *)v13 finishRunningWithError:v14];
LABEL_20:

    goto LABEL_21;
  }
  v43.receiver = self;
  v43.super_class = (Class)WFChooseFromListAction;
  [(WFHandleIntentAction *)&v43 runAsynchronouslyWithInput:v4];
LABEL_21:
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 userInterface];
  [v2 presentAlertWithUserInterface:v3 prompt:a1[5] input:a1[6]];
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_4;
    v7[3] = &unk_264E567E0;
    id v8 = *(id *)(a1 + 40);
    __int16 v12 = *(_WORD *)(a1 + 64);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = v4;
    uint64_t v10 = v5;
    id v11 = *(id *)(a1 + 56);
    [v2 requestInterfacePresentationWithCompletionHandler:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) deviceLockedError];
    [v2 finishRunningWithError:v6];
  }
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 65);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_5;
    v11[3] = &unk_264E5E840;
    v11[4] = *(void *)(a1 + 48);
    [a2 showImagesWithPrompt:v9 canSelectAll:v7 canSelectMultiple:v8 inputItems:v10 completionHandler:v11];
  }
  else if (objc_msgSend(v5, "wf_isUserCancelledError"))
  {
    [*(id *)(a1 + 48) finishRunningWithError:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

uint64_t __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)appResource
{
  return 0;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1488;
}

@end