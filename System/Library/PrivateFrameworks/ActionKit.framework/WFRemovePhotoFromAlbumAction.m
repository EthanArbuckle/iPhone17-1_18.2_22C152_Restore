@interface WFRemovePhotoFromAlbumAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRemovePhotoFromAlbumAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFRemovePhotoFromAlbumAction *)self parameterValueForKey:@"WFRemoveAlbumSelectedGroup" ofClass:objc_opt_class()];
  v6 = WFPHAssetCollectionMatchingDescriptor(v5);
  if (v6)
  {
    v7 = [MEMORY[0x263F33988] sharedLibrary];
    id v19 = 0;
    v8 = [v7 fetchOptionsWithError:&v19];
    id v9 = v19;

    if (v8)
    {
      [v8 setWantsIncrementalChangeDetails:0];
      v10 = [getPHAssetClass() fetchAssetsInAssetCollection:v6 options:v8];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke;
      v16[3] = &unk_264E56FA0;
      v16[4] = self;
      id v17 = v6;
      id v18 = v10;
      id v11 = v10;
      [v4 getObjectRepresentations:v16 forClass:getPHAssetClass()];
    }
    else
    {
      [(WFRemovePhotoFromAlbumAction *)self finishRunningWithError:v9];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    v20[0] = *MEMORY[0x263F08338];
    WFLocalizedString(@"Unknown Album");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v20[1] = *MEMORY[0x263F08320];
    v8 = WFLocalizedString(@"The photo album that was selected does not exist.");
    v21[1] = v8;
    v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    v15 = [v12 errorWithDomain:v13 code:5 userInfo:v14];
    [(WFRemovePhotoFromAlbumAction *)self finishRunningWithError:v15];
  }
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    [a1[4] finishRunningWithError:v9];
  }
  else
  {
    v10 = [MEMORY[0x263F33988] sharedLibrary];
    id v21 = 0;
    id v11 = [v10 systemPhotoLibraryWithError:&v21];
    id v12 = v21;

    if (v11)
    {
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = __Block_byref_object_copy__10633;
      v19[4] = __Block_byref_object_dispose__10634;
      id v20 = 0;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_184;
      v14[3] = &unk_264E5AA50;
      id v15 = a1[5];
      id v18 = v19;
      id v16 = v7;
      id v17 = a1[6];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_3;
      v13[3] = &unk_264E5DAF8;
      v13[4] = a1[4];
      v13[5] = v19;
      [v11 performChanges:v14 completionHandler:v13];

      _Block_object_dispose(v19, 8);
    }
    else
    {
      [a1[4] finishRunningWithError:v12];
    }
  }
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_184(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canPerformEditOperation:2])
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v2 = (void *)getPHAssetCollectionChangeRequestClass_softClass;
    uint64_t v18 = getPHAssetCollectionChangeRequestClass_softClass;
    if (!getPHAssetCollectionChangeRequestClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getPHAssetCollectionChangeRequestClass_block_invoke;
      v14[3] = &unk_264E5EC88;
      void v14[4] = &v15;
      __getPHAssetCollectionChangeRequestClass_block_invoke((uint64_t)v14);
      v2 = (void *)v16[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v15, 8);
    id v4 = [v3 changeRequestForAssetCollection:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_2;
  id v12 = &unk_264E56F78;
  v5 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v6 = objc_msgSend(v5, "if_objectsPassingTest:", &v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_msgSend(v4, "removeAssets:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9, v10, v11, v12);
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "output", (void)v12);
        [v11 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) finishRunningWithError:v4];
}

uint64_t __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

@end