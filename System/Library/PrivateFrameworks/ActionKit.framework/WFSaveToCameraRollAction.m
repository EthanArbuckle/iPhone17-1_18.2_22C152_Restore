@interface WFSaveToCameraRollAction
- (id)contentDestinationWithError:(id *)a3;
- (id)fetchOptions;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithAssetCollection:(id)a3 input:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSaveToCameraRollAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to save %2$@ in a photo album?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)[MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85558]];
}

- (id)fetchOptions
{
  v2 = [MEMORY[0x263F33988] sharedLibrary];
  uint64_t v6 = 0;
  v3 = [v2 fetchOptionsWithError:&v6];

  [v3 setIncludeAllBurstAssets:1];
  if (v3) {
    id v4 = v3;
  }

  return v3;
}

- (void)runAsynchronouslyWithAssetCollection:(id)a3 input:(id)a4
{
  v16[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFSaveToCameraRollAction *)self fetchOptions];
  [v8 setWantsIncrementalChangeDetails:0];
  v9 = [getPHAssetClass_51815() fetchAssetsInAssetCollection:v6 options:v8];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke;
  v13[3] = &unk_264E5DF58;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  [v7 generateCollectionByCoercingToItemClasses:v10 completionHandler:v13];
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    id v8 = [v6 items];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2;
    v11[3] = &unk_264E5DA58;
    id v12 = a1[5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_5;
    v9[3] = &unk_264E5DB20;
    v9[4] = a1[4];
    id v10 = a1[6];
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v11, v9);
  }
  else
  {
    [a1[4] finishRunningWithError:v7];
  }
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 asset];
    if ([*(id *)(a1 + 32) containsObject:v8])
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3;
      v14[3] = &unk_264E5DBC8;
      id v15 = v7;
      [v6 getFileRepresentation:v14 forType:0];
    }
    else
    {
      id v11 = [v6 asset];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
    }
  }
  else
  {
    v9 = [v6 preferredFileType];
    int v10 = [v9 conformsToUTType:*MEMORY[0x263F1DC90]];

    if (v10)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4;
      v12[3] = &unk_264E5DBC8;
      id v13 = v7;
      [v6 getFileRepresentation:v12 forType:0];
    }
  }
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__51820;
  void v16[4] = __Block_byref_object_dispose__51821;
  id v17 = (id)objc_opt_new();
  id v7 = [MEMORY[0x263F33988] sharedLibrary];
  id v15 = 0;
  id v8 = [v7 systemPhotoLibraryWithError:&v15];
  id v9 = v15;

  if (v8)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_191;
    v11[3] = &unk_264E5DAA8;
    id v12 = *(id *)(a1 + 40);
    id v14 = v16;
    id v13 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3_196;
    v10[3] = &unk_264E5DAF8;
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v16;
    [v8 performChanges:v11 completionHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }

  _Block_object_dispose(v16, 8);
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_191(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canPerformEditOperation:3])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v2 = (void *)getPHAssetCollectionChangeRequestClass_softClass_51826;
    uint64_t v16 = getPHAssetCollectionChangeRequestClass_softClass_51826;
    if (!getPHAssetCollectionChangeRequestClass_softClass_51826)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getPHAssetCollectionChangeRequestClass_block_invoke_51827;
      v12[3] = &unk_264E5EC88;
      void v12[4] = &v13;
      __getPHAssetCollectionChangeRequestClass_block_invoke_51827((uint64_t)v12);
      v2 = (void *)v14[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v13, 8);
    id v4 = [v3 changeRequestForAssetCollection:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2_192;
  v10[3] = &unk_264E5DA80;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "if_compactMap:", v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3_196(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v4 = [*(id *)(a1 + 32) fetchOptions];
  [v4 setWantsIncrementalChangeDetails:0];
  id v5 = [getPHAssetClass_51815() fetchAssetsWithLocalIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) options:v4];
  id v6 = objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4_198;
  v21[3] = &unk_264E5DAD0;
  id v7 = v6;
  id v22 = v7;
  [v5 enumerateObjectsUsingBlock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        id v14 = [*(id *)(a1 + 32) output];
        uint64_t v15 = [v7 objectForKey:v13];
        [v14 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) finishRunningWithError:v16];
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4_198(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKey:v4];
}

id __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2_192(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  getPHAssetClass_51815();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    v26[0] = v3;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = v3;
    id v7 = [v5 arrayWithObjects:v26 count:1];
    [v4 addAssets:v7];

    id v8 = [v6 localIdentifier];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_14;
    }
    id v6 = v3;
    uint64_t v9 = [v6 wfType];
    int v10 = [v9 conformsToUTType:*MEMORY[0x263F1D9C0]];

    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v11 = (void *)getPHAssetChangeRequestClass_softClass_51830;
    uint64_t v24 = getPHAssetChangeRequestClass_softClass_51830;
    if (!getPHAssetChangeRequestClass_softClass_51830)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getPHAssetChangeRequestClass_block_invoke_51831;
      v20[3] = &unk_264E5EC88;
      v20[4] = &v21;
      __getPHAssetChangeRequestClass_block_invoke_51831((uint64_t)v20);
      uint64_t v11 = (void *)v22[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v21, 8);
    id v13 = v12;
    id v14 = [v6 fileURL];
    if (v10) {
      [v13 creationRequestForAssetFromVideoAtFileURL:v14];
    }
    else {
    uint64_t v15 = [v13 creationRequestForAssetFromImageAtFileURL:v14];
    }
    id v16 = [v15 placeholderForCreatedAsset];

    if (v16)
    {
      long long v17 = *(void **)(a1 + 32);
      v25 = v16;
      long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [v17 addAssets:v18];
    }
    id v8 = [v16 localIdentifier];
  }
LABEL_14:

  return v8;
}

uint64_t __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFSaveToCameraRollAction *)self parameterValueForKey:@"WFCameraRollSelectedGroup" ofClass:objc_opt_class()];
  id v6 = WFPHAssetCollectionMatchingDescriptor(v5);
  if (v6)
  {
    [(WFSaveToCameraRollAction *)self runAsynchronouslyWithAssetCollection:v6 input:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F870B8];
    v13[0] = *MEMORY[0x263F08338];
    uint64_t v9 = WFLocalizedString(@"Unknown Album");
    v14[0] = v9;
    v13[1] = *MEMORY[0x263F08320];
    int v10 = WFLocalizedString(@"The photo album that was selected does not exist.");
    v14[1] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v12 = [v7 errorWithDomain:v8 code:5 userInfo:v11];
    [(WFSaveToCameraRollAction *)self finishRunningWithError:v12];
  }
}

@end