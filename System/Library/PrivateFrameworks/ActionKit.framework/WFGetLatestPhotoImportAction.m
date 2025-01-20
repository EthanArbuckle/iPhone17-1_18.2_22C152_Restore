@interface WFGetLatestPhotoImportAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetLatestPhotoImportAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  id v29 = a3;
  v4 = [MEMORY[0x263F33988] sharedLibrary];
  id v35 = 0;
  v5 = [v4 fetchOptionsWithError:&v35];
  id v6 = v35;

  if (v5)
  {
    [v5 setWantsIncrementalChangeDetails:0];
    [v5 setFetchLimit:1];
    v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:0];
    v49[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
    [v5 setSortDescriptors:v8];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v9 = (void *)getPHImportSessionClass_softClass;
    uint64_t v44 = getPHImportSessionClass_softClass;
    if (!getPHImportSessionClass_softClass)
    {
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __getPHImportSessionClass_block_invoke;
      v39 = &unk_264E5EC88;
      v40 = &v41;
      __getPHImportSessionClass_block_invoke((uint64_t)&v36);
      v9 = (void *)v42[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v41, 8);
    v11 = [v10 fetchImportSessionsWithOptions:v5];
    if ([v11 count])
    {
      v12 = [MEMORY[0x263F33988] sharedLibrary];
      id v34 = v6;
      v13 = [v12 fetchOptionsWithError:&v34];
      id v28 = v34;

      if (v13)
      {
        [v13 setWantsIncrementalChangeDetails:0];
        v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:1];
        v46 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        [v13 setSortDescriptors:v15];

        v27 = [v11 firstObject];
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2050000000;
        v16 = (void *)getPHAssetClass_softClass_27570;
        uint64_t v44 = getPHAssetClass_softClass_27570;
        if (!getPHAssetClass_softClass_27570)
        {
          uint64_t v36 = MEMORY[0x263EF8330];
          uint64_t v37 = 3221225472;
          v38 = __getPHAssetClass_block_invoke_27571;
          v39 = &unk_264E5EC88;
          v40 = &v41;
          __getPHAssetClass_block_invoke_27571((uint64_t)&v36);
          v16 = (void *)v42[3];
        }
        id v17 = v16;
        _Block_object_dispose(&v41, 8);
        v18 = [v17 fetchAssetsInAssetCollection:v27 options:v13];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v31;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v21);
              v23 = [(WFGetLatestPhotoImportAction *)self output];
              [v23 addObject:v22];

              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v45 count:16];
          }
          while (v19);
        }
        [(WFGetLatestPhotoImportAction *)self finishRunningWithError:0];
      }
      else
      {
        [(WFGetLatestPhotoImportAction *)self finishRunningWithError:v28];
        v13 = 0;
      }
      id v6 = v28;
    }
    else
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v47 = *MEMORY[0x263F08320];
      v13 = WFLocalizedString(@"Shortcuts couldn’t find any imports in your photo library.");
      v48 = v13;
      v25 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v26 = [v24 errorWithDomain:*MEMORY[0x263F07F70] code:260 userInfo:v25];
      [(WFGetLatestPhotoImportAction *)self finishRunningWithError:v26];
    }
  }
  else
  {
    [(WFGetLatestPhotoImportAction *)self finishRunningWithError:v6];
  }
}

@end