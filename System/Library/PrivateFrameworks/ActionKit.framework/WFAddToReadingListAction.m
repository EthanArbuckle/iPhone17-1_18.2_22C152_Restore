@interface WFAddToReadingListAction
- (id)service;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)addReadingListItem:(id)a3 title:(id)a4 previewText:(id)a5 withService:(id)a6 error:(id *)a7;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAddToReadingListAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to your Reading List?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%@” to add item(s) to your Reading List?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFAddToReadingListAction *)self input];
  v7 = v4;
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __71__WFAddToReadingListAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85578]];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (void)addReadingListItem:(id)a3 title:(id)a4 previewText:(id)a5 withService:(id)a6 error:(id *)a7
{
  [a6 addReadingListItemWithURL:a3 title:a4 previewText:a5 error:a7];
  id v8 = (id)objc_opt_new();
  [(WFAddToReadingListAction *)self setExtendedOperation:v8];
}

- (id)service
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getSSReadingListClass_softClass;
  uint64_t v10 = getSSReadingListClass_softClass;
  if (!getSSReadingListClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getSSReadingListClass_block_invoke;
    v6[3] = &unk_264E5EC88;
    v6[4] = &v7;
    __getSSReadingListClass_block_invoke((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  uint64_t v4 = [v3 defaultReadingList];
  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [v6 numberOfItems];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8)
  {
    uint64_t v10 = [v9 service];
    v11 = [v6 items];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_264E56970;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_4;
    v13[3] = &unk_264E5E8E8;
    v13[4] = v15;
    id v12 = v10;
    objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v14, v13);
  }
  else
  {
    [v9 finishRunningWithError:v7];
  }
}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) contentPermissionRequestor];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_3;
  v12[3] = &unk_264E56948;
  uint64_t v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v9;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v11 getTitleWithPermissionRequestor:v8 completionHandler:v12];
}

uint64_t __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 URL];
  uint64_t v7 = a1[6];
  id v9 = 0;
  [v3 addReadingListItem:v6 title:v5 previewText:0 withService:v7 error:&v9];

  id v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();
}

@end