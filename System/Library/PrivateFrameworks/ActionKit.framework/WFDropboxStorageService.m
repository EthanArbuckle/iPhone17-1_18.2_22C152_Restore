@interface WFDropboxStorageService
+ (Class)resultItemClass;
+ (id)serviceName;
- (BOOL)hasPublicURLs;
- (BOOL)supportsJumpingToSubdirectoryInUI;
- (Class)accessResourceClass;
- (Class)objectRepresentationClass;
- (INAppDescriptor)associatedAppDescriptor;
- (NSString)storageLocationPrefix;
- (id)associatedAppBundleIdentifier;
- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4;
- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5;
- (void)finishRetrievalWithContentsOfFolderAtPath:(id)a3 sessionManager:(id)a4 retrievalHandler:(id)a5;
- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5;
- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5;
@end

@implementation WFDropboxStorageService

+ (Class)resultItemClass
{
  return (Class)objc_opt_class();
}

+ (id)serviceName
{
  return WFLocalizedString(@"Dropbox");
}

- (INAppDescriptor)associatedAppDescriptor
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithLocalizedName:0 bundleIdentifier:@"com.getdropbox.Dropbox" extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:@"G7HH3F8CAK" supportedIntents:0 bundleURL:0 documentTypes:0];
  v3 = [MEMORY[0x263F0F9B0] sharedResolver];
  v4 = [v3 resolvedAppMatchingDescriptor:v2];

  if ([v4 isInstalled])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x263F33708] platformFileManagerLocation];
    id v5 = [v6 appDescriptor];
  }
  return (INAppDescriptor *)v5;
}

- (id)associatedAppBundleIdentifier
{
  return @"com.getdropbox.Dropbox";
}

- (BOOL)supportsJumpingToSubdirectoryInUI
{
  return 1;
}

- (NSString)storageLocationPrefix
{
  return 0;
}

- (Class)accessResourceClass
{
  return (Class)objc_opt_class();
}

- (Class)objectRepresentationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPublicURLs
{
  return 1;
}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[WFAccount accounts];
  v11 = [v10 firstObject];

  v12 = objc_alloc_init(WFDropboxSessionManager);
  v13 = [v11 credential];
  [(WFDropboxSessionManager *)v12 setCredential:v13];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke;
  v15[3] = &unk_264E5CE88;
  id v16 = v7;
  id v14 = v7;
  [(WFDropboxSessionManager *)v12 searchFiles:v9 inPath:v8 completionHandler:v15];
}

void __64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v8 count];
  if (v5 || !v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_255);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFFileStorageServiceResult *__64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:a2];
}

- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = +[WFAccount accounts];
  id v14 = [v13 firstObject];

  v15 = objc_alloc_init(WFDropboxSessionManager);
  id v16 = [v14 credential];
  [(WFDropboxSessionManager *)v15 setCredential:v16];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke;
  aBlock[3] = &unk_264E58050;
  v17 = v15;
  v34 = v17;
  id v18 = v12;
  id v35 = v18;
  v19 = _Block_copy(aBlock);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_3;
  v25[3] = &unk_264E580A0;
  id v26 = v11;
  v27 = self;
  id v30 = v18;
  id v31 = v19;
  id v28 = v10;
  v29 = v17;
  unint64_t v32 = a5;
  v20 = v17;
  id v21 = v19;
  id v22 = v10;
  id v23 = v18;
  id v24 = v11;
  [(WFDropboxSessionManager *)v20 getItemAtPath:v24 completionHandler:v25];
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_2;
  v9[3] = &unk_264E57EE8;
  id v7 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v8 = (id)[v7 saveFile:a2 toPath:a3 overwrite:a4 progress:0 completionHandler:v9];
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v33[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (![v5 isDirectory])
  {
    if (v5)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_4;
      v28[3] = &unk_264E58078;
      id v18 = *(void **)(a1 + 56);
      id v19 = *(id *)(a1 + 48);
      id v21 = *(void **)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 80);
      id v29 = v19;
      uint64_t v31 = v20;
      id v30 = v21;
      [v18 downloadFile:v5 ofType:0 proposedFilename:0 completionHandler:v28];

      goto LABEL_11;
    }
    id v22 = [v6 domain];
    if ([v22 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v23 = [v6 code];

      if (v23 == 4)
      {
        id v24 = (void *)MEMORY[0x263F33870];
        v25 = [*(id *)(a1 + 48) dataUsingEncoding:4];
        id v26 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
        v27 = [*(id *)(a1 + 32) lastPathComponent];
        id v11 = [v24 fileWithData:v25 ofType:v26 proposedFilename:v27];

        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        goto LABEL_3;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_11;
  }
  id v7 = NSString;
  id v8 = WFLocalizedString(@"The path you tried to save to (%1$@) is an existing folder in your %2$@. When appending or prepending text to a file, you should specify a path to a file instead.");
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [(id)objc_opt_class() serviceName];
  id v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10);

  uint64_t v12 = *(void *)(a1 + 64);
  v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F07F70];
  v32[0] = *MEMORY[0x263F08338];
  v15 = WFLocalizedString(@"Folder already exists");
  v32[1] = *MEMORY[0x263F08320];
  v33[0] = v15;
  v33[1] = v11;
  id v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  v17 = [v13 errorWithDomain:v14 code:516 userInfo:v16];
  (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v17);

LABEL_3:
LABEL_11:
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[6];
  id v7 = a3;
  id v10 = +[WFAppendUtilities fileByAppendingText:v5 toFile:a2 options:v6];
  uint64_t v8 = a1[5];
  uint64_t v9 = [v7 path];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, 1);
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = a3;
    id v6 = +[WFFileStorageServiceResult resultWithMetadata:a2];
    v9[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v7, v5);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, void, id))(v3 + 16);
    id v6 = a3;
    v8(v3, 0, v6);
  }
}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[WFAccount accounts];
  uint64_t v9 = [v8 firstObject];

  id v10 = objc_alloc_init(WFDropboxSessionManager);
  id v11 = [v9 credential];
  [(WFDropboxSessionManager *)v10 setCredential:v11];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke;
  v15[3] = &unk_264E58028;
  id v16 = v6;
  v17 = v10;
  id v18 = self;
  id v19 = v7;
  uint64_t v12 = v10;
  id v13 = v7;
  id v14 = v6;
  [(WFDropboxSessionManager *)v12 createFolderAtPath:v14 completionHandler:v15];
}

void __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!a2)
  {
    id v10 = [v5 domain];
    if ([v10 isEqualToString:@"WFDropboxErrorDomain"])
    {
      uint64_t v11 = [v6 code];

      if (v11 == 105)
      {
        if ([*(id *)(a1 + 32) length]
          && ![*(id *)(a1 + 32) isEqualToString:@"/"])
        {
          uint64_t v14 = *(void *)(a1 + 32);
          id v13 = *(void **)(a1 + 40);
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke_2;
          v17[3] = &unk_264E58000;
          id v20 = *(id *)(a1 + 56);
          id v15 = *(id *)(a1 + 32);
          uint64_t v16 = *(void *)(a1 + 48);
          id v18 = v15;
          uint64_t v19 = v16;
          [v13 getItemAtPath:v14 completionHandler:v17];

          goto LABEL_11;
        }
        uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
    v12();
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = +[WFFileStorageServiceResult resultWithMetadata:a2];
  v21[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v9, v6);

LABEL_11:
}

void __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isDirectory])
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v5)
    {
      uint64_t v8 = +[WFFileStorageServiceResult resultWithMetadata:v5];
      v22[0] = v8;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v6);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    id v10 = NSString;
    uint64_t v11 = WFLocalizedString(@"The path you tried to save to (%1$@) is an existing file in your %2$@.");
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [(id)objc_opt_class() serviceName];
    uint64_t v14 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, v13);

    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F70];
    v20[0] = *MEMORY[0x263F08338];
    v17 = WFLocalizedString(@"File already exists");
    v20[1] = *MEMORY[0x263F08320];
    v21[0] = v17;
    v21[1] = v14;
    id v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    uint64_t v19 = [v15 errorWithDomain:v16 code:516 userInfo:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = (id)v19;
  }
}

- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke;
  v9[3] = &unk_264E5BDE0;
  id v10 = v6;
  id v7 = v6;
  id v8 = a3;
  [v8 getObjectRepresentations:v9 forClass:objc_opt_class()];
}

void __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[WFAccount accounts];
    uint64_t v9 = [v8 firstObject];

    id v10 = objc_alloc_init(WFDropboxSessionManager);
    uint64_t v11 = [v9 credential];
    [(WFDropboxSessionManager *)v10 setCredential:v11];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2;
    v15[3] = &unk_264E57FD8;
    uint64_t v16 = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4;
    v13[3] = &unk_264E58828;
    id v14 = *(id *)(a1 + 32);
    uint64_t v12 = v10;
    objc_msgSend(v6, "if_enumerateAsynchronously:completionHandler:", v15, v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3;
  v9[3] = &unk_264E57EE8;
  id v10 = v6;
  id v8 = v6;
  [v7 deleteItem:a2 completionHandler:v9];
}

uint64_t __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke;
  v9[3] = &unk_264E5BDE0;
  id v10 = v6;
  id v7 = v6;
  id v8 = a3;
  [v8 getObjectRepresentations:v9 forClass:objc_opt_class()];
}

void __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[WFAccount accounts];
    uint64_t v9 = [v8 firstObject];

    id v10 = objc_alloc_init(WFDropboxSessionManager);
    uint64_t v11 = [v9 credential];
    [(WFDropboxSessionManager *)v10 setCredential:v11];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2;
    v14[3] = &unk_264E57FB0;
    id v15 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v10;
    objc_msgSend(v6, "if_mapAsynchronously:completionHandler:", v14, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_3;
  v9[3] = &unk_264E57F88;
  id v10 = v6;
  id v8 = v6;
  [v7 getSharedLinkForFile:a2 completionHandler:v9];
}

uint64_t __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  if (!v13)
  {
    id v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"WFDropboxStorageService.m", 67, @"Invalid parameter not satisfying: %@", @"fileRepresentations" object file lineNumber description];
  }
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__15888;
  v53[4] = __Block_byref_object_dispose__15889;
  id v54 = (id)objc_opt_new();
  v17 = objc_opt_new();
  id v18 = [WFStorageServiceCancellableOperation alloc];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke;
  v50[3] = &unk_264E5EEC0;
  id v19 = v17;
  id v51 = v19;
  v52 = v53;
  id v20 = [(WFStorageServiceCancellableOperation *)v18 initWithCancelBlock:v50];
  unint64_t v38 = a6;
  v37 = objc_msgSend(v13, "if_map:", &__block_literal_global_203);
  id v21 = [MEMORY[0x263F337B0] collectionWithItems:v37];
  id v22 = +[WFAccount accounts];
  uint64_t v23 = [v22 firstObject];
  v36 = v13;

  id v24 = objc_alloc_init(WFDropboxSessionManager);
  v25 = [v23 credential];
  [(WFDropboxSessionManager *)v24 setCredential:v25];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_3;
  v40[3] = &unk_264E57F60;
  id v26 = v20;
  v41 = v26;
  id v27 = v16;
  id v47 = v27;
  id v28 = v14;
  unint64_t v49 = v38;
  id v42 = v28;
  v43 = self;
  id v29 = v15;
  id v44 = v29;
  id v30 = v19;
  id v45 = v30;
  v48 = v53;
  uint64_t v31 = v24;
  v46 = v31;
  [v21 getFileRepresentations:v40 forType:0];
  unint64_t v32 = v46;
  v33 = v26;

  _Block_object_dispose(v53, 8);
  return v33;
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6++), "cancel", (void)v10);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  return [*(id *)(a1 + 32) unlock];
}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] && !objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if ([*(id *)(a1 + 40) length]) {
      int v7 = [*(id *)(a1 + 40) isEqualToString:@"/"];
    }
    else {
      int v7 = 1;
    }
    char v8 = *(unsigned char *)(a1 + 96) & 1;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_4;
    id v19 = &unk_264E57F38;
    id v20 = *(id *)(a1 + 32);
    id v27 = *(id *)(a1 + 80);
    id v21 = *(id *)(a1 + 40);
    char v29 = v7;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 48);
    long long v11 = *(void **)(a1 + 56);
    id v22 = v9;
    uint64_t v23 = v10;
    char v30 = v8;
    id v24 = v11;
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 88);
    id v25 = v12;
    uint64_t v28 = v13;
    id v26 = *(id *)(a1 + 72);
    id v14 = _Block_copy(&v16);
    uint64_t v15 = v14;
    if (v7) {
      (*((void (**)(void *, void, void))v14 + 2))(v14, 0, 0);
    }
    else {
      objc_msgSend(*(id *)(a1 + 72), "getItemAtPath:completionHandler:", *(void *)(a1 + 40), v14, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v45[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 domain];
  uint64_t v8 = *MEMORY[0x263F07F70];
  if ([v7 isEqualToString:*MEMORY[0x263F07F70]])
  {
    uint64_t v9 = [v6 code];

    if (v9 == 4)
    {

      goto LABEL_6;
    }
  }
  else
  {
  }
  if (!v6)
  {
LABEL_6:
    if ([*(id *)(a1 + 32) isCancelled])
    {
      id v6 = 0;
      goto LABEL_8;
    }
    id v10 = *(id *)(a1 + 40);
    if (([v5 isDirectory] & 1) != 0 || *(unsigned char *)(a1 + 104)) {
      char v11 = 1;
    }
    else {
      char v11 = [*(id *)(a1 + 40) hasSuffix:@"/"];
    }
    if ((unint64_t)[*(id *)(a1 + 48) count] < 2)
    {
      if ((v11 & 1) == 0)
      {
        if (v5 && *(unsigned char *)(a1 + 105))
        {
          char v21 = 0;
        }
        else
        {
          id v22 = (void *)MEMORY[0x263F33870];
          uint64_t v23 = [v10 lastPathComponent];
          id v24 = [*(id *)(a1 + 48) firstObject];
          id v25 = [v24 wfType];
          id v26 = [v22 proposedFilenameForFile:v23 ofType:v25];

          id v27 = [v10 stringByDeletingLastPathComponent];
          uint64_t v28 = [v27 stringByAppendingPathComponent:v26];

          char v21 = 0;
          id v10 = (id)v28;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if (v5) {
        char v12 = v11;
      }
      else {
        char v12 = 1;
      }
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = NSString;
        id v14 = WFLocalizedString(@"The path you tried to save to (%1$@) is an existing file in your %2$@. When saving multiple files at a time, you should specify a path to a folder instead.");
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = [(id)objc_opt_class() serviceName];
        uint64_t v17 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15, v16);

        id v18 = (void *)MEMORY[0x263F087E8];
        v44[0] = *MEMORY[0x263F08338];
        id v19 = WFLocalizedString(@"File already exists");
        v44[1] = *MEMORY[0x263F08320];
        v45[0] = v19;
        v45[1] = v17;
        id v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
        id v6 = [v18 errorWithDomain:v8 code:516 userInfo:v20];

        (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_26:

        goto LABEL_27;
      }
    }
    char v21 = 1;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 64), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 48), "count"));
    [*(id *)(a1 + 64) setCompletedUnitCount:0];
    char v29 = *(void **)(a1 + 48);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_5;
    v35[3] = &unk_264E57F10;
    id v36 = *(id *)(a1 + 32);
    id v37 = *(id *)(a1 + 64);
    char v42 = v21;
    id v10 = v10;
    id v38 = v10;
    id v30 = *(id *)(a1 + 72);
    uint64_t v31 = *(void *)(a1 + 96);
    id v39 = v30;
    uint64_t v41 = v31;
    id v40 = *(id *)(a1 + 80);
    char v43 = *(unsigned char *)(a1 + 105);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_7;
    v32[3] = &unk_264E5E4B8;
    id v33 = *(id *)(a1 + 32);
    id v34 = *(id *)(a1 + 88);
    objc_msgSend(v29, "if_mapAsynchronously:completionHandler:", v35, v32);

    id v6 = 0;
    uint64_t v17 = v36;
    goto LABEL_26;
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_27:
}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else if ([v6 representationType] == 1 {
         && ([v6 fileURL],
  }
             uint64_t v8 = objc_claimAutoreleasedReturnValue(),
             int v9 = objc_msgSend(v8, "wf_fileIsDirectory"),
             v8,
             v9))
  {
    id v10 = NSString;
    char v11 = WFLocalizedString(@"“%@” is a folder");
    char v12 = [v6 filename];
    uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);

    id v14 = NSString;
    uint64_t v15 = WFLocalizedString(@"“%@” could not be saved because it is a folder or package. Consider zipping this file using Make Archive before saving.");
    uint64_t v16 = [v6 filename];
    uint64_t v17 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);

    id v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08438];
    uint64_t v20 = *MEMORY[0x263F08320];
    v33[0] = *MEMORY[0x263F08338];
    v33[1] = v20;
    v34[0] = v13;
    v34[1] = v17;
    char v21 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v22 = [v18 errorWithDomain:v19 code:21 userInfo:v21];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v22);
  }
  else
  {
    [*(id *)(a1 + 40) becomeCurrentWithPendingUnitCount:1];
    uint64_t v23 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:1];
    [*(id *)(a1 + 40) resignCurrent];
    id v24 = *(void **)(a1 + 48);
    if (*(unsigned char *)(a1 + 80))
    {
      id v25 = [v6 filename];
      id v26 = [v24 stringByAppendingPathComponent:v25];
    }
    else
    {
      id v26 = v24;
    }
    [*(id *)(a1 + 56) lock];
    id v27 = *(void **)(a1 + 64);
    uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v29 = *(unsigned __int8 *)(a1 + 81);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_6;
    v31[3] = &unk_264E57EE8;
    id v32 = v7;
    id v30 = [v27 saveFile:v6 toPath:v26 overwrite:v29 progress:v23 completionHandler:v31];
    [v28 addObject:v30];

    [*(id *)(a1 + 56) unlock];
  }
}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v8 count];
  if (v5 || !v6 || [*(id *)(a1 + 32) isCancelled])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_231);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

WFFileStorageServiceResult *__96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:a2];
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F337C8] itemWithFile:a2];
}

- (void)finishRetrievalWithContentsOfFolderAtPath:(id)a3 sessionManager:(id)a4 retrievalHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke;
  v9[3] = &unk_264E5CE88;
  id v10 = v7;
  id v8 = v7;
  [a4 getContentsOfFolderAtPath:a3 completionHandler:v9];
}

void __101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_15917);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFFileStorageServiceResult *__101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:a2];
}

- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6
{
  char v7 = a4;
  id v9 = a3;
  id v10 = a6;
  char v11 = +[WFAccount accounts];
  char v12 = [v11 firstObject];

  uint64_t v13 = objc_alloc_init(WFDropboxSessionManager);
  id v14 = [v12 credential];
  [(WFDropboxSessionManager *)v13 setCredential:v14];

  if ([v9 isEqualToString:@"/"])
  {
    [(WFDropboxStorageService *)self finishRetrievalWithContentsOfFolderAtPath:&stru_26F008428 sessionManager:v13 retrievalHandler:v10];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__WFDropboxStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke;
    v15[3] = &unk_264E57E80;
    char v20 = v7 & 1;
    id v19 = v10;
    id v16 = v9;
    uint64_t v17 = self;
    id v18 = v13;
    [(WFDropboxSessionManager *)v18 getItemAtPath:v16 completionHandler:v15];
  }
}

void __82__WFDropboxStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  id v8 = [v6 domain];
  if (([v8 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
  {

LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_10;
  }
  uint64_t v9 = [v7 code];

  if (v9 != 4 || *(unsigned char *)(a1 + 64)) {
    goto LABEL_9;
  }
LABEL_5:
  if (v5)
  {
    if ([v5 isDirectory])
    {
      [*(id *)(a1 + 40) finishRetrievalWithContentsOfFolderAtPath:*(void *)(a1 + 32) sessionManager:*(void *)(a1 + 48) retrievalHandler:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = +[WFFileStorageServiceResult resultWithMetadata:v5];
      char v21 = v19;
      char v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v20, 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 64))
    {
      char v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F07F70];
      uint64_t v22 = *MEMORY[0x263F08320];
      uint64_t v13 = NSString;
      id v14 = WFLocalizedString(@"No item was found at path: %@");
      uint64_t v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, *(void *)(a1 + 32));
      v23[0] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v17 = [v11 errorWithDomain:v12 code:4 userInfo:v16];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v17);
    }
    else
    {
      (*(void (**)(void, void, void))(v10 + 16))(*(void *)(a1 + 56), 0, 0);
    }
  }
LABEL_10:
}

@end