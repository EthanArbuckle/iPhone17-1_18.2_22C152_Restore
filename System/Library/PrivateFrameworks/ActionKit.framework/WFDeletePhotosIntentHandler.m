@interface WFDeletePhotosIntentHandler
- (void)handleDeletePhotos:(id)a3 completion:(id)a4;
@end

@implementation WFDeletePhotosIntentHandler

- (void)handleDeletePhotos:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F33988] sharedLibrary];
  id v20 = 0;
  v8 = [v7 systemPhotoLibraryWithError:&v20];
  id v9 = v20;

  if (v8)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v10 = (void *)getPHAssetClass_softClass_26243;
    uint64_t v25 = getPHAssetClass_softClass_26243;
    if (!getPHAssetClass_softClass_26243)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getPHAssetClass_block_invoke_26244;
      v21[3] = &unk_264E5EC88;
      v21[4] = &v22;
      __getPHAssetClass_block_invoke_26244((uint64_t)v21);
      v10 = (void *)v23[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v22, 8);
    v12 = [v5 assetIdentifiers];
    v13 = [v8 librarySpecificFetchOptions];
    v14 = [v11 fetchAssetsWithLocalIdentifiers:v12 options:v13];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke;
    v18[3] = &unk_264E5EE70;
    id v19 = v14;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke_2;
    v16[3] = &unk_264E59738;
    id v17 = v6;
    v15 = v14;
    [v8 performChanges:v18 completionHandler:v16];
  }
  else
  {
    v15 = [[WFDeletePhotosIntentResponse alloc] initWithCode:5 userActivity:0];
    (*((void (**)(id, WFDeletePhotosIntentResponse *))v6 + 2))(v6, v15);
  }
}

void __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void *)(*((void *)&v9 + 1) + 8 * v4);
        uint64_t v14 = 0;
        v15 = &v14;
        uint64_t v16 = 0x2050000000;
        id v6 = (void *)getPHAssetChangeRequestClass_softClass;
        uint64_t v17 = getPHAssetChangeRequestClass_softClass;
        if (!getPHAssetChangeRequestClass_softClass)
        {
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __getPHAssetChangeRequestClass_block_invoke;
          v13[3] = &unk_264E5EC88;
          v13[4] = &v14;
          __getPHAssetChangeRequestClass_block_invoke((uint64_t)v13);
          id v6 = (void *)v15[3];
        }
        id v7 = v6;
        _Block_object_dispose(&v14, 8);
        uint64_t v18 = v5;
        v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v18, 1, (void)v9);
        [v7 deleteAssets:v8];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v19 count:16];
    }
    while (v2);
  }
}

void __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F07F70]] && objc_msgSend(v4, "code") == -1) {
    goto LABEL_9;
  }
  id v6 = [v4 domain];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v7 = (void *)getPHPhotosErrorDomainSymbolLoc_ptr;
  uint64_t v19 = getPHPhotosErrorDomainSymbolLoc_ptr;
  if (!getPHPhotosErrorDomainSymbolLoc_ptr)
  {
    v8 = PhotosLibrary_26245();
    v17[3] = (uint64_t)dlsym(v8, "PHPhotosErrorDomain");
    getPHPhotosErrorDomainSymbolLoc_ptr = v17[3];
    id v7 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v7)
  {
    if ([v6 isEqualToString:*v7])
    {
      if ([v4 code] == 4101)
      {

LABEL_9:
LABEL_12:
        uint64_t v10 = *(void *)(a1 + 32);
        long long v11 = [WFDeletePhotosIntentResponse alloc];
        uint64_t v12 = 5;
LABEL_14:
        v13 = [(WFDeletePhotosIntentResponse *)v11 initWithCode:v12 userActivity:0];
        (*(void (**)(uint64_t, WFDeletePhotosIntentResponse *))(v10 + 16))(v10, v13);

        return;
      }
      uint64_t v9 = [v4 code];

      if (v9 == 3072) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = [WFDeletePhotosIntentResponse alloc];
    uint64_t v12 = 4;
    goto LABEL_14;
  }
  uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
  v15 = [NSString stringWithUTF8String:"NSErrorDomain getPHPhotosErrorDomain(void)"];
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFDeletePhotosIntentHandler.m", 21, @"%s", dlerror());

  __break(1u);
}

@end