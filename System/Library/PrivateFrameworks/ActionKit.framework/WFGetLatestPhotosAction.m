@interface WFGetLatestPhotosAction
+ (id)cameraRollAlbumName;
- (int64_t)initialSuggestionBehavior;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetLatestPhotosAction

- (int64_t)initialSuggestionBehavior
{
  v3 = [(WFGetLatestPhotosAction *)self definition];
  v4 = [v3 objectForKey:@"WFGetLatestPhotosActionType"];

  if ([v4 isEqualToString:@"Live Photo"]
    && ([MEMORY[0x263F85258] currentDevice],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasCapability:*MEMORY[0x263F85668]],
        v5,
        !v6))
  {
    int64_t v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFGetLatestPhotosAction;
    int64_t v7 = [(WFGetLatestPhotosAction *)&v9 initialSuggestionBehavior];
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v54[1] = *MEMORY[0x263EF8340];
  v4 = [(WFGetLatestPhotosAction *)self definition];
  v5 = [v4 objectForKey:@"WFGetLatestPhotosActionType"];

  int v6 = objc_opt_new();
  int64_t v7 = (void *)MEMORY[0x263F33938];
  v8 = WFImagePropertyNameAlbum();
  uint64_t v9 = [v7 propertyForName:v8];

  v10 = (void *)MEMORY[0x263F33938];
  v11 = WFImagePropertyNameMediaType();
  uint64_t v12 = [v10 propertyForName:v11];

  v13 = (void *)MEMORY[0x263F33938];
  v14 = WFImagePropertyNamePhotoType();
  uint64_t v15 = [v13 propertyForName:v14];

  v16 = (void *)MEMORY[0x263F33938];
  v17 = WFImagePropertyNameDateTaken();
  v49 = [v16 propertyForName:v17];

  v18 = (void *)MEMORY[0x263F33938];
  v19 = WFImagePropertyNameIsScreenshot();
  v52 = [v18 propertyForName:v19];

  if ([v5 isEqualToString:@"Video"]) {
    WFPhotoLibraryMediaTypeVideo();
  }
  else {
  v48 = WFPhotoLibraryMediaTypeImage();
  }
  v50 = (void *)v12;
  v47 = [MEMORY[0x263F337B8] predicateWithValue:v48 forProperty:v12 comparisonType:4];
  objc_msgSend(v6, "addObject:");
  uint64_t v20 = [(id)objc_opt_class() cameraRollAlbumName];
  if (v20)
  {
    v21 = [MEMORY[0x263F337B8] predicateWithValue:v20 forProperty:v9 comparisonType:4];
    [v6 addObject:v21];
  }
  v51 = (void *)v9;
  int v22 = objc_msgSend(v5, "isEqualToString:", @"Live Photo", v20);
  int v23 = [v5 isEqualToString:@"Burst"];
  int v24 = [v5 isEqualToString:@"Screenshot"];
  v25 = [(WFGetLatestPhotosAction *)self parameterValueForKey:@"WFGetLatestPhotosActionIncludeScreenshots" ofClass:objc_opt_class()];
  int v26 = [v25 BOOLValue];

  int v27 = [v5 isEqualToString:@"Photo"];
  if (v23)
  {
    v28 = (void *)MEMORY[0x263F337B8];
    v29 = WFPhotoLibraryPhotoTypeBurst();
    v30 = v28;
    v31 = v29;
    v32 = (void *)v15;
    uint64_t v33 = v15;
LABEL_10:
    v35 = [v30 predicateWithValue:v31 forProperty:v33 comparisonType:4];
    [v6 addObject:v35];

LABEL_16:
    goto LABEL_17;
  }
  v32 = (void *)v15;
  if (v22)
  {
    v34 = (void *)MEMORY[0x263F337B8];
    v29 = WFPhotoLibraryPhotoTypeLivePhoto();
    v30 = v34;
    v31 = v29;
    uint64_t v33 = v15;
    goto LABEL_10;
  }
  if (v24)
  {
    v36 = (void *)MEMORY[0x263F337B8];
    uint64_t v37 = MEMORY[0x263EFFA88];
LABEL_15:
    v29 = [v36 predicateWithValue:v37 forProperty:v52 comparisonType:4];
    [v6 addObject:v29];
    goto LABEL_16;
  }
  if (((v27 ^ 1 | v26) & 1) == 0)
  {
    v36 = (void *)MEMORY[0x263F337B8];
    uint64_t v37 = MEMORY[0x263EFFA80];
    goto LABEL_15;
  }
LABEL_17:
  v38 = [MEMORY[0x263F337C0] andPredicateWithSubpredicates:v6];
  v39 = (void *)[objc_alloc(MEMORY[0x263F33810]) initWithPredicate:v38];
  v40 = [MEMORY[0x263F33818] sortDescriptorWithProperty:v49 ascending:0 comparator:0];
  v54[0] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
  [v39 setSortDescriptors:v41];

  v42 = [(WFGetLatestPhotosAction *)self parameterValueForKey:@"WFGetLatestPhotoCount" ofClass:objc_opt_class()];
  uint64_t v43 = [v42 integerValue];

  objc_msgSend(v39, "setSlice:", 0x7FFFFFFFFFFFFFFFLL, v43);
  v44 = (void *)MEMORY[0x263F33938];
  v45 = [(WFGetLatestPhotosAction *)self contentPermissionRequestor];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __54__WFGetLatestPhotosAction_runAsynchronouslyWithInput___block_invoke;
  v53[3] = &unk_264E5EEE8;
  v53[4] = self;
  [v44 runQuery:v39 withItems:0 permissionRequestor:v45 completionHandler:v53];
}

void __54__WFGetLatestPhotosAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          v13 = objc_msgSend(*(id *)(a1 + 32), "output", (void)v22);
          [v13 addItem:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v14 = *(void **)(a1 + 32);
    id v15 = 0;
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    if (!v6)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F07F70];
      uint64_t v27 = *MEMORY[0x263F08320];
      v19 = WFLocalizedString(@"Shortcuts couldn’t find the requested items in your photo library.");
      v28[0] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v21 = [v17 errorWithDomain:v18 code:260 userInfo:v20];
      [v16 finishRunningWithError:v21];

      goto LABEL_13;
    }
    v14 = v16;
    id v15 = v6;
  }
  objc_msgSend(v14, "finishRunningWithError:", v15, (void)v22);
LABEL_13:
}

+ (id)cameraRollAlbumName
{
  v2 = [MEMORY[0x263F33988] sharedLibrary];
  id v11 = 0;
  v3 = [v2 fetchOptionsWithError:&v11];
  id v4 = v11;

  if (v3)
  {
    [v3 setWantsIncrementalChangeDetails:0];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v5 = (void *)getPHAssetCollectionClass_softClass_31049;
    uint64_t v16 = getPHAssetCollectionClass_softClass_31049;
    if (!getPHAssetCollectionClass_softClass_31049)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getPHAssetCollectionClass_block_invoke_31050;
      v12[3] = &unk_264E5EC88;
      v12[4] = &v13;
      __getPHAssetCollectionClass_block_invoke_31050((uint64_t)v12);
      id v5 = (void *)v14[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v13, 8);
    id v7 = [v6 fetchAssetCollectionsWithType:2 subtype:209 options:v3];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [v8 localizedTitle];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end