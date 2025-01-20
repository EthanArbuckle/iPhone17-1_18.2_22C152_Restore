@interface WFCreatePhotoAlbumAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCreatePhotoAlbumAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v5 = a3;
  v6 = [(WFCreatePhotoAlbumAction *)self parameterValueForKey:@"AlbumName" ofClass:objc_opt_class()];
  v7 = [[WFPHAssetCollectionDescriptor alloc] initWithLocalIdentifier:0 localizedTitle:v6];
  v8 = WFPHAssetCollectionMatchingDescriptor(v7);
  if (v8)
  {
    [(WFSaveToCameraRollAction *)self runAsynchronouslyWithAssetCollection:v8 input:v5];
  }
  else
  {
    v9 = [MEMORY[0x263F33988] sharedLibrary];
    id v21 = 0;
    v10 = [v9 systemPhotoLibraryWithError:&v21];
    id v11 = v21;

    if (v10)
    {
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = __Block_byref_object_copy__46993;
      v19[4] = __Block_byref_object_dispose__46994;
      id v20 = 0;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke;
      v16[3] = &unk_264E5EEC0;
      id v17 = v6;
      v18 = v19;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke_2;
      v12[3] = &unk_264E5C8D8;
      v12[4] = self;
      v14 = v19;
      SEL v15 = a2;
      id v13 = v5;
      [v10 performChanges:v16 completionHandler:v12];

      _Block_object_dispose(v19, 8);
    }
    else
    {
      [(WFCreatePhotoAlbumAction *)self finishRunningWithError:v11];
    }
  }
}

void __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getPHAssetCollectionChangeRequestClass_softClass_47020;
  uint64_t v13 = getPHAssetCollectionChangeRequestClass_softClass_47020;
  if (!getPHAssetCollectionChangeRequestClass_softClass_47020)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getPHAssetCollectionChangeRequestClass_block_invoke_47021;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getPHAssetCollectionChangeRequestClass_block_invoke_47021((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  v4 = [v3 creationRequestForAssetCollectionWithTitle:*(void *)(a1 + 32)];
  id v5 = [v4 placeholderForCreatedAssetCollection];
  uint64_t v6 = [v5 localIdentifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [MEMORY[0x263F33988] sharedLibrary];
    id v15 = v5;
    uint64_t v7 = [v6 fetchOptionsWithError:&v15];
    id v8 = v15;

    [v7 setWantsIncrementalChangeDetails:0];
    if (v7)
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2050000000;
      v9 = (void *)getPHAssetCollectionClass_softClass_46996;
      uint64_t v20 = getPHAssetCollectionClass_softClass_46996;
      if (!getPHAssetCollectionClass_softClass_46996)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __getPHAssetCollectionClass_block_invoke_46997;
        v16[3] = &unk_264E5EC88;
        void v16[4] = &v17;
        __getPHAssetCollectionClass_block_invoke_46997((uint64_t)v16);
        v9 = (void *)v18[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v17, 8);
      v21[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      uint64_t v12 = [v10 fetchAssetCollectionsWithLocalIdentifiers:v11 options:v7];
      uint64_t v13 = [v12 firstObject];

      if (!v13)
      {
        v14 = [MEMORY[0x263F08690] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"WFCreatePhotoAlbumAction.m" lineNumber:54 description:@"Album should exist after being created"];
      }
      [*(id *)(a1 + 32) runAsynchronouslyWithAssetCollection:v13 input:*(void *)(a1 + 40)];
    }
    else
    {
      [*(id *)(a1 + 32) finishRunningWithError:v8];
    }

    id v5 = v8;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

@end