@interface HUSceneUtilities
+ (id)_hasSuggestedScenesForHome:(id)a3;
+ (id)initialViewControllerForAddingSceneWithPresentationDelegate:(id)a3 home:(id)a4;
@end

@implementation HUSceneUtilities

+ (id)initialViewControllerForAddingSceneWithPresentationDelegate:(id)a3 home:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  v10 = [a1 _hasSuggestedScenesForHome:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HUSceneUtilities_initialViewControllerForAddingSceneWithPresentationDelegate_home___block_invoke;
  v17[3] = &unk_1E638DF78;
  id v18 = v6;
  id v11 = v9;
  id v19 = v11;
  id v12 = v6;
  id v13 = (id)[v10 addCompletionBlock:v17];

  v14 = v19;
  id v15 = v11;

  return v15;
}

void __85__HUSceneUtilities_initialViewControllerForAddingSceneWithPresentationDelegate_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8 && [v8 BOOLValue]) {
    id v6 = objc_alloc_init(HUSceneSuggestionsViewController);
  }
  else {
    id v6 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:0 mode:2];
  }
  v7 = v6;
  [(HUSceneSuggestionsViewController *)v6 setPresentationDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) finishWithResult:v7];
}

+ (id)_hasSuggestedScenesForHome:(id)a3
{
  v3 = +[HUSceneSuggestionsViewController computeNumberOfSuggestionsInHome:a3];
  v4 = [v3 flatMap:&__block_literal_global_177];

  return v4;
}

id __47__HUSceneUtilities__hasSuggestedScenesForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "unsignedIntegerValue") != 0);
  v4 = [v2 futureWithResult:v3];

  return v4;
}

@end