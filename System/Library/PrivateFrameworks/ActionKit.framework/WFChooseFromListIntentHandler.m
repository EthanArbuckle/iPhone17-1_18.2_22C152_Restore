@interface WFChooseFromListIntentHandler
- (void)handleChooseFromList:(id)a3 completion:(id)a4;
- (void)provideChosenItemsOptionsCollectionForChooseFromList:(id)a3 withCompletion:(id)a4;
- (void)resolveChosenItemsForChooseFromList:(id)a3 withCompletion:(id)a4;
- (void)resolvePromptForChooseFromList:(id)a3 withCompletion:(id)a4;
@end

@implementation WFChooseFromListIntentHandler

- (void)resolvePromptForChooseFromList:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = [v13 prompt];
  uint64_t v7 = [v6 length];

  v8 = (void *)MEMORY[0x263F10020];
  if (v7)
  {
    v9 = [v13 prompt];
    v10 = [v8 successWithResolvedString:v9];
    v5[2](v5, v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x263F0FA88];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v11 deferredLocalizedIntentsStringWithFormat:@"DisambiguationSelectionPromptDialog" fromTable:@"Localizable" bundle:v9];
    uint64_t v12 = [v8 successWithResolvedString:v10];
    v5[2](v5, (void *)v12);

    v5 = (void (**)(id, void *))v12;
  }
}

- (void)provideChosenItemsOptionsCollectionForChooseFromList:(id)a3 withCompletion:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F0FCB8];
  id v6 = a4;
  id v7 = [v5 alloc];
  id v8 = (id)[v7 initWithItems:MEMORY[0x263EFFA68]];
  (*((void (**)(id, id, void))a4 + 2))(v6, v8, 0);
}

- (void)resolveChosenItemsForChooseFromList:(id)a3 withCompletion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = [v6 chosenItems];
  if ([v7 count]) {
    [v6 chosenItems];
  }
  else {
  id v8 = [v6 originalItems];
  }

  if ((unint64_t)[v8 count] < 2)
  {
    if ([v8 count])
    {
      v9 = [v8 firstObject];
      v10 = +[WFChooseFromListItemResolutionResult successWithResolvedChooseFromListItem:v9];
      id v13 = v10;
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
      v5[2](v5, v11);
    }
    else
    {
      v9 = +[WFChooseFromListItemResolutionResult needsValue];
      uint64_t v12 = v9;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
      v5[2](v5, v10);
    }
  }
  else
  {
    v9 = +[WFChooseFromListItemResolutionResult disambiguationWithChooseFromListItemsToDisambiguate:v8];
    v14[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v5[2](v5, v10);
  }
}

- (void)handleChooseFromList:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, WFChooseFromListIntentResponse *))a4;
  id v6 = a3;
  v9 = [[WFChooseFromListIntentResponse alloc] initWithCode:4 userActivity:0];
  id v7 = [v6 chosenItems];

  id v8 = [v7 firstObject];
  [(WFChooseFromListIntentResponse *)v9 setSelectedItem:v8];

  v5[2](v5, v9);
}

@end