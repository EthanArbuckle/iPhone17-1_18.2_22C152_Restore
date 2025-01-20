@interface WFDefaultFileStorageService
+ (Class)resultItemClass;
+ (id)containerName;
+ (id)directoryTraversalError;
+ (id)serviceName;
- (BOOL)fileIsInProtectedList:(id)a3;
- (BOOL)hasPublicURLs;
- (BOOL)supportsJumpingToSubdirectoryInUI;
- (Class)accessResourceClass;
- (Class)objectRepresentationClass;
- (INAppDescriptor)associatedAppDescriptor;
- (NSProgress)progress;
- (NSString)storageLocationPrefix;
- (id)_saveFiles:(id)a3 toURL:(id)a4 isDestinationKnownDirectory:(BOOL)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8;
- (id)fileURLFromDirectory:(id)a3 path:(id)a4;
- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toDirectory:(id)a5 subpath:(id)a6 options:(unint64_t)a7 progress:(id)a8 completionHandler:(id)a9;
- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)_moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDestination:(id)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)_retrieveFilesForAppendingAtURL:(id)a3 completionHandler:(id)a4;
- (void)appendText:(id)a3 toDirectory:(id)a4 subpath:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4;
- (void)createFolderAtPath:(id)a3 inDirectory:(id)a4 completionHandler:(id)a5;
- (void)createFolderAtPath:(id)a3 parentDirectoryItem:(id)a4 completionHandler:(id)a5;
- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteItems:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5;
- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5;
- (void)moveFile:(id)a3 destination:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7;
- (void)moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)moveItem:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)recursivelyCreateFolderAtPathWithComponents:(id)a3 withParentDirectoryItem:(id)a4 completionHandler:(id)a5;
- (void)renameItem:(id)a3 name:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7;
- (void)retrieveFileAtPath:(id)a3 fromDirectory:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)retrieveFilesForAppendingAtPath:(id)a3 completionHandler:(id)a4;
- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5;
- (void)setProgress:(id)a3;
@end

@implementation WFDefaultFileStorageService

+ (Class)resultItemClass
{
  return (Class)objc_opt_class();
}

+ (id)serviceName
{
  return WFLocalizedString(@"iCloud Drive");
}

+ (id)directoryTraversalError
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"Invalid file path");
  v3 = WFLocalizedString(@"The provided file path must be contained within the directory.");
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

+ (id)containerName
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F86B50] documentsDirectoryWithError:0];
  v8[0] = *MEMORY[0x263EFF788];
  uint64_t v3 = v8[0];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v2 resourceValuesForKeys:v4 error:0];
  uint64_t v6 = [v5 objectForKey:v3];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  return (NSProgress *)WeakRetained;
}

- (INAppDescriptor)associatedAppDescriptor
{
  v2 = [MEMORY[0x263F33708] platformFileManagerLocation];
  uint64_t v3 = [v2 appDescriptor];

  return (INAppDescriptor *)v3;
}

- (BOOL)supportsJumpingToSubdirectoryInUI
{
  return 0;
}

- (NSString)storageLocationPrefix
{
  return (NSString *)@"/Shortcuts/";
}

- (Class)accessResourceClass
{
  return (Class)objc_opt_class();
}

- (Class)objectRepresentationClass
{
  return 0;
}

- (BOOL)hasPublicURLs
{
  return 0;
}

- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  return 0;
}

- (void)deleteItems:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v9 = (void *)getFPDeleteOperationClass_softClass;
    uint64_t v27 = getFPDeleteOperationClass_softClass;
    if (!getFPDeleteOperationClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __getFPDeleteOperationClass_block_invoke;
      v22 = &unk_264E5EC88;
      v23 = &v24;
      __getFPDeleteOperationClass_block_invoke((uint64_t)&v19);
LABEL_6:
      v9 = (void *)v25[3];
    }
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v9 = (void *)getFPTrashOperationClass_softClass;
    uint64_t v27 = getFPTrashOperationClass_softClass;
    if (!getFPTrashOperationClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __getFPTrashOperationClass_block_invoke;
      v22 = &unk_264E5EC88;
      v23 = &v24;
      __getFPTrashOperationClass_block_invoke((uint64_t)&v19);
      goto LABEL_6;
    }
  }
  v10 = v9;
  _Block_object_dispose(&v24, 8);
  v11 = (void *)[[v10 alloc] initWithItems:v7];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __79__WFDefaultFileStorageService_deleteItems_deleteImmediately_completionHandler___block_invoke;
  v17 = &unk_264E5CA00;
  id v18 = v8;
  id v12 = v8;
  [v11 setActionCompletionBlock:&v14];
  v13 = objc_msgSend(getFPItemManagerClass_40461(), "defaultManager", v14, v15, v16, v17);
  [v13 scheduleAction:v11];
}

uint64_t __79__WFDefaultFileStorageService_deleteItems_deleteImmediately_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renameItem:(id)a3 name:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v14 = (void *)getFPRenameOperationClass_softClass;
  uint64_t v27 = getFPRenameOperationClass_softClass;
  if (!getFPRenameOperationClass_softClass)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __getFPRenameOperationClass_block_invoke;
    v23[3] = &unk_264E5EC88;
    v23[4] = &v24;
    __getFPRenameOperationClass_block_invoke((uint64_t)v23);
    uint64_t v14 = (void *)v25[3];
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v24, 8);
  v16 = (void *)[[v15 alloc] initWithItem:v10 newFileName:v11];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke;
  v20[3] = &unk_264E5B4A0;
  id v21 = v10;
  id v22 = v13;
  id v17 = v10;
  id v18 = v13;
  [v16 setActionCompletionBlock:v20];
  uint64_t v19 = [getFPItemManagerClass_40461() defaultManager];
  [v19 scheduleAction:v16];
}

void __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v4 = [getFPItemManagerClass_40461() defaultManager];
    uint64_t v5 = [*(id *)(a1 + 32) itemID];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke_2;
    v6[3] = &unk_264E5B518;
    id v7 = *(id *)(a1 + 40);
    [v4 fetchItemForItemID:v5 completionHandler:v6];
  }
}

void __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F33870];
  id v6 = a3;
  id v7 = [a2 fileURL];
  id v8 = [v5 fileWithURL:v7 options:8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)moveItem:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  v46[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  uint64_t v15 = [v11 providerDomainID];
  v16 = [v12 providerDomainID];
  char v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    id v18 = (void *)getFPMoveOperationClass_softClass;
    uint64_t v44 = getFPMoveOperationClass_softClass;
    if (!getFPMoveOperationClass_softClass)
    {
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __getFPMoveOperationClass_block_invoke;
      v39 = &unk_264E5EC88;
      v40 = &v41;
      __getFPMoveOperationClass_block_invoke((uint64_t)&v36);
      id v18 = (void *)v42[3];
    }
    uint64_t v19 = v18;
    _Block_object_dispose(&v41, 8);
    id v20 = [v19 alloc];
    id v45 = v11;
    id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    uint64_t v22 = [v20 initWithItems:v21 destinationFolder:v12];
  }
  else
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v23 = (void *)getFPCopyOperationClass_softClass;
    uint64_t v44 = getFPCopyOperationClass_softClass;
    if (!getFPCopyOperationClass_softClass)
    {
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __getFPCopyOperationClass_block_invoke;
      v39 = &unk_264E5EC88;
      v40 = &v41;
      __getFPCopyOperationClass_block_invoke((uint64_t)&v36);
      v23 = (void *)v42[3];
    }
    uint64_t v24 = v23;
    _Block_object_dispose(&v41, 8);
    id v25 = [v24 alloc];
    v46[0] = v11;
    id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    uint64_t v22 = [v25 initWithItems:v21 destinationFolder:v12];
  }
  uint64_t v26 = (void *)v22;

  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke;
  v33 = &unk_264E5B4A0;
  id v34 = v11;
  id v35 = v14;
  id v27 = v11;
  id v28 = v14;
  [v26 setActionCompletionBlock:&v30];
  v29 = objc_msgSend(getFPItemManagerClass_40461(), "defaultManager", v30, v31, v32, v33);
  [v29 scheduleAction:v26];
}

void __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v4 = [getFPItemManagerClass_40461() defaultManager];
    uint64_t v5 = [*(id *)(a1 + 32) itemID];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke_2;
    v6[3] = &unk_264E5B518;
    id v7 = *(id *)(a1 + 40);
    [v4 fetchItemForItemID:v5 completionHandler:v6];
  }
}

void __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F33870];
  id v6 = a3;
  id v7 = [a2 fileURL];
  id v8 = [v5 fileWithURL:v7 options:8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recursivelyCreateFolderAtPathWithComponents:(id)a3 withParentDirectoryItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 firstObject];
  if ([v11 length] && !objc_msgSend(v11, "isEqualToString:", @"/"))
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v12 = (void *)getFPCreateFolderOperationClass_softClass;
    uint64_t v27 = getFPCreateFolderOperationClass_softClass;
    if (!getFPCreateFolderOperationClass_softClass)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __getFPCreateFolderOperationClass_block_invoke;
      v23[3] = &unk_264E5EC88;
      v23[4] = &v24;
      __getFPCreateFolderOperationClass_block_invoke((uint64_t)v23);
      id v12 = (void *)v25[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v24, 8);
    id v14 = (void *)[[v13 alloc] initWithParentItem:v9 folderName:v11];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __117__WFDefaultFileStorageService_recursivelyCreateFolderAtPathWithComponents_withParentDirectoryItem_completionHandler___block_invoke;
    uint64_t v19 = &unk_264E5B540;
    id v22 = v10;
    id v20 = self;
    id v21 = v8;
    [v14 setCreateFolderCompletionBlock:&v16];
    uint64_t v15 = objc_msgSend(getFPItemManagerClass_40461(), "defaultManager", v16, v17, v18, v19, v20);
    [v15 scheduleAction:v14];
  }
  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v9, 0);
  }
}

void __117__WFDefaultFileStorageService_recursivelyCreateFolderAtPathWithComponents_withParentDirectoryItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
LABEL_2:
    id v8 = *(void **)(a1 + 32);
    id v9 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    [v8 recursivelyCreateFolderAtPathWithComponents:v9 withParentDirectoryItem:v5 completionHandler:*(void *)(a1 + 48)];

LABEL_15:
    return;
  }
  id v10 = [v6 domain];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v11 = (id *)getNSFileProviderErrorDomainSymbolLoc_ptr;
  uint64_t v32 = getNSFileProviderErrorDomainSymbolLoc_ptr;
  if (!getNSFileProviderErrorDomainSymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getNSFileProviderErrorDomainSymbolLoc_block_invoke;
    uint64_t v27 = &unk_264E5EC88;
    id v28 = &v29;
    id v12 = FileProviderLibrary_40464();
    v30[3] = (uint64_t)dlsym(v12, "NSFileProviderErrorDomain");
    getNSFileProviderErrorDomainSymbolLoc_ptr = *(void *)(v28[1] + 24);
    id v11 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (v11)
  {
    id v13 = *v11;
    if ([v10 isEqualToString:v13] && objc_msgSend(v7, "code") == -1001)
    {
      id v14 = [v7 userInfo];
      uint64_t v15 = getNSFileProviderErrorItemKey();
      uint64_t v16 = [v14 objectForKey:v15];
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2050000000;
      uint64_t v17 = (void *)getFPItemClass_softClass;
      uint64_t v32 = getFPItemClass_softClass;
      if (!getFPItemClass_softClass)
      {
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __getFPItemClass_block_invoke;
        uint64_t v27 = &unk_264E5EC88;
        id v28 = &v29;
        __getFPItemClass_block_invoke((uint64_t)&v24);
        uint64_t v17 = (void *)v30[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v29, 8);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v20 = [v7 userInfo];
        id v21 = getNSFileProviderErrorItemKey();
        id v5 = [v20 objectForKey:v21];

        if (v5) {
          goto LABEL_2;
        }
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  id v22 = [MEMORY[0x263F08690] currentHandler];
  v23 = [NSString stringWithUTF8String:"NSErrorDomain getNSFileProviderErrorDomain(void)"];
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFDefaultFileStorageService.m", 45, @"%s", dlerror());

  __break(1u);
}

- (void)createFolderAtPath:(id)a3 parentDirectoryItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 stringByStandardizingPath];
  id v11 = [v10 componentsSeparatedByString:@"/"];

  id v12 = [v11 firstObject];
  int v13 = [v12 isEqualToString:&stru_26F008428];

  if (v13)
  {
    uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);

    id v11 = (void *)v14;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__WFDefaultFileStorageService_createFolderAtPath_parentDirectoryItem_completionHandler___block_invoke;
  v16[3] = &unk_264E5B518;
  id v17 = v9;
  id v15 = v9;
  [(WFDefaultFileStorageService *)self recursivelyCreateFolderAtPathWithComponents:v11 withParentDirectoryItem:v8 completionHandler:v16];
}

void __88__WFDefaultFileStorageService_createFolderAtPath_parentDirectoryItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x263F33870];
    id v7 = [a2 fileURL];
    id v8 = [v6 fileWithURL:v7 options:8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = getWFFilesLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[WFDefaultFileStorageService createFolderAtPath:parentDirectoryItem:completionHandler:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s No item returned when creating folder recursively with error: %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)fileIsInProtectedList:(id)a3
{
  return 0;
}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
}

- (void)_retrieveFilesForAppendingAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F33A00]) initWithFileURL:v6 retrieveFolderContents:0 progress:0];
  [v8 start];
  [v8 waitUntilFinished];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke;
  aBlock[3] = &unk_264E5E648;
  id v15 = v6;
  uint64_t v16 = self;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  __int16 v12 = [v8 downloadedFiles];

  if (v12)
  {
    id v13 = [v8 downloadedFiles];
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", &__block_literal_global_269, v11);
  }
  else
  {
    id v13 = [v8 downloadError];
    v11[2](v11, 0, v13);
  }
}

void __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]) {
    goto LABEL_8;
  }
  id v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x263F07F70]]) {
    goto LABEL_7;
  }
  if ([v6 code] == 4)
  {

    goto LABEL_6;
  }
  uint64_t v8 = [v6 code];

  if (v8 == 260)
  {
LABEL_6:
    id v9 = (void *)MEMORY[0x263F852B8];
    id v10 = [*(id *)(a1 + 32) path];
    id v11 = [v10 lastPathComponent];
    id v7 = [v9 typeFromFilename:v11];

    uint64_t v12 = *MEMORY[0x263F1DC20];
    if (([v7 conformsToUTType:*MEMORY[0x263F1DC20]] & 1) == 0)
    {
      id v13 = [*(id *)(a1 + 32) path];
      uint64_t v14 = [MEMORY[0x263F852B8] typeWithUTType:v12];
      id v15 = [v14 fileExtension];
      uint64_t v16 = [v13 stringByAppendingPathExtension:v15];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_2;
      v18[3] = &unk_264E5CE88;
      id v17 = *(void **)(a1 + 40);
      id v19 = *(id *)(a1 + 48);
      [v17 retrieveFilesAtPath:v16 options:1 progress:0 completionHandler:v18];

      goto LABEL_9;
    }
LABEL_7:
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

void __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  id v7 = [v5 filename];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F87558]];

  if (v8)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    id v9 = [v5 fileURL];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_4;
    v10[3] = &unk_264E5E9A8;
    id v11 = v6;
    +[WFFileStorageServiceResult getResultWithFileURL:v9 consumingBundleID:0 resultBlock:v10];
  }
}

uint64_t __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appendText:(id)a3 toDirectory:(id)a4 subpath:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (![v15 length])
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"WFDefaultFileStorageService.m" lineNumber:441 description:@"Subpath length must be greater than zero when appending to text file."];
  }
  id v17 = [(WFDefaultFileStorageService *)self fileURLFromDirectory:v14 path:v15];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke;
  v24[3] = &unk_264E5B4F0;
  id v25 = v17;
  id v26 = v14;
  uint64_t v27 = self;
  id v28 = v13;
  id v29 = v15;
  id v30 = v16;
  unint64_t v31 = a6;
  id v18 = v15;
  id v19 = v13;
  id v20 = v16;
  id v21 = v14;
  id v22 = v17;
  [(WFDefaultFileStorageService *)self _retrieveFilesForAppendingAtURL:v22 completionHandler:v24];
}

void __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "wf_proposedFileIsContainedByDirectoryAtURL:", *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 72);
    id v14 = [(id)objc_opt_class() directoryTraversalError];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

    goto LABEL_6;
  }
  if (![v5 count])
  {
    id v15 = [v6 domain];
    if ([v15 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v6 code] == 4)
      {

LABEL_12:
        id v17 = (void *)MEMORY[0x263F33870];
        id v18 = [*(id *)(a1 + 56) dataUsingEncoding:4];
        id v19 = [*(id *)(a1 + 64) lastPathComponent];
        int v8 = [v17 fileWithData:v18 ofType:0 proposedFilename:v19];

        id v20 = (void *)MEMORY[0x263F337B0];
        id v21 = [MEMORY[0x263F337C8] itemWithFile:v8];
        v28[0] = v21;
        id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
        id v11 = [v20 collectionWithItems:v22];

        v23 = *(void **)(a1 + 48);
        uint64_t v24 = *(void *)(a1 + 32);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke_2;
        v26[3] = &unk_264E5CE88;
        id v27 = *(id *)(a1 + 72);
        id v25 = (id)[v23 _saveFiles:v11 toURL:v24 isDestinationKnownDirectory:0 options:0 progress:0 completionHandler:v26];

        goto LABEL_4;
      }
      uint64_t v16 = [v6 code];

      if (v16 == 260) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_6;
  }
  id v7 = [v5 firstObject];
  int v8 = [v7 wrappedURL];

  id v9 = (void *)MEMORY[0x263F33870];
  id v10 = [v8 url];
  id v11 = [v9 fileWithURL:v10 options:0];

  uint64_t v12 = +[WFAppendUtilities fileByAppendingText:*(void *)(a1 + 56) toFile:v11 options:*(void *)(a1 + 80)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_4:
LABEL_6:
}

void __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDestination:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  v27[2] = *MEMORY[0x263EF8340];
  id v11 = a8;
  uint64_t v12 = (void *)MEMORY[0x263F08820];
  id v13 = a6;
  id v14 = [v12 writingIntentWithURL:a3 options:2];
  id v15 = [MEMORY[0x263F08820] writingIntentWithURL:v13 options:8];

  v27[0] = v14;
  v27[1] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  id v17 = objc_opt_new();
  id v18 = [MEMORY[0x263F08A48] mainQueue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __115__WFDefaultFileStorageService__moveFile_replaceExisting_withManagedLevel_toDestination_progress_completionHandler___block_invoke;
  v22[3] = &unk_264E5B4C8;
  id v24 = v14;
  id v25 = v11;
  BOOL v26 = a4;
  id v23 = v15;
  id v19 = v14;
  id v20 = v15;
  id v21 = v11;
  [v17 coordinateAccessWithIntents:v16 queue:v18 byAccessor:v22];
}

void __115__WFDefaultFileStorageService__moveFile_replaceExisting_withManagedLevel_toDestination_progress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  int v4 = *(unsigned __int8 *)(a1 + 56);
  id v5 = [MEMORY[0x263F08850] defaultManager];
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) URL];
    id v7 = [*(id *)(a1 + 40) URL];
    uint64_t v14 = 0;
    int v8 = (id *)&v14;
    [v5 replaceItemAtURL:v6 withItemAtURL:v7 backupItemName:0 options:1 resultingItemURL:0 error:&v14];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) URL];
    id v7 = [*(id *)(a1 + 32) URL];
    uint64_t v13 = 0;
    int v8 = (id *)&v13;
    [v5 moveItemAtURL:v6 toURL:v7 error:&v13];
  }
  id v9 = *v8;

  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F33870];
    id v11 = [*(id *)(a1 + 32) URL];
    uint64_t v12 = [v10 fileWithURL:v11 options:8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = [a6 fileURL];
  id v18 = [v16 fileURL];
  id v19 = [v18 lastPathComponent];
  id v21 = [v17 URLByAppendingPathComponent:v19];

  id v20 = [v16 fileURL];

  [(WFDefaultFileStorageService *)self _moveFile:v20 replaceExisting:v11 withManagedLevel:a5 toDestination:v21 progress:v15 completionHandler:v14];
}

- (void)moveFile:(id)a3 destination:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = [a3 fileURL];
  [(WFDefaultFileStorageService *)self _moveFile:v15 replaceExisting:0 withManagedLevel:a5 toDestination:v14 progress:v13 completionHandler:v12];
}

- (void)retrieveFilesForAppendingAtPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke;
  v10[3] = &unk_264E5E648;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WFDefaultFileStorageService *)self retrieveFilesAtPath:v9 options:1 progress:0 completionHandler:v10];
}

void __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]) {
    goto LABEL_8;
  }
  id v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x263F07F70]]) {
    goto LABEL_7;
  }
  if ([v6 code] == 4)
  {

    goto LABEL_6;
  }
  uint64_t v8 = [v6 code];

  if (v8 == 260)
  {
LABEL_6:
    id v9 = (void *)MEMORY[0x263F852B8];
    id v10 = [*(id *)(a1 + 32) lastPathComponent];
    id v7 = [v9 typeFromFilename:v10];

    uint64_t v11 = *MEMORY[0x263F1DC20];
    if (([v7 conformsToUTType:*MEMORY[0x263F1DC20]] & 1) == 0)
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = [MEMORY[0x263F852B8] typeWithUTType:v11];
      id v14 = [v13 fileExtension];
      id v15 = [v12 stringByAppendingPathExtension:v14];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke_2;
      v19[3] = &unk_264E5E4B8;
      id v16 = *(void **)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      id v20 = v15;
      id v21 = v17;
      id v18 = v15;
      [v16 retrieveFilesAtPath:v18 options:1 progress:0 completionHandler:v19];

      goto LABEL_9;
    }
LABEL_7:
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

uint64_t __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)createFolderAtPath:(id)a3 inDirectory:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__40507;
  uint64_t v37 = __Block_byref_object_dispose__40508;
  id v38 = 0;
  uint64_t v11 = [v9 fileURL];
  id v12 = [(WFDefaultFileStorageService *)self fileURLFromDirectory:v11 path:v8];

  id v13 = [v9 fileURL];
  char v14 = objc_msgSend(v12, "wf_proposedFileIsContainedByDirectoryAtURL:", v13);

  if (v14)
  {
    id v15 = objc_opt_new();
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    id v28 = 0;
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __80__WFDefaultFileStorageService_createFolderAtPath_inDirectory_completionHandler___block_invoke;
    id v24 = &unk_264E5B3B8;
    BOOL v26 = &v29;
    id v16 = v12;
    id v25 = v16;
    id v27 = &v33;
    [v15 coordinateWritingItemAtURL:v16 options:0 error:&v28 byAccessor:&v21];
    id v17 = v28;
    id v18 = v17;
    if (*((unsigned char *)v30 + 24))
    {
      id v19 = objc_msgSend(MEMORY[0x263F33870], "fileWithURL:options:", v16, 24, v21, v22, v23, v24);
      v10[2](v10, v19, v34[5]);
    }
    else
    {
      if (v34[5]) {
        uint64_t v20 = v34[5];
      }
      else {
        uint64_t v20 = (uint64_t)v17;
      }
      v10[2](v10, 0, v20);
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v10[2](v10, 0, 0);
  }

  _Block_object_dispose(&v33, 8);
}

void __80__WFDefaultFileStorageService_createFolderAtPath_inDirectory_completionHandler___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke;
  v9[3] = &unk_264E5BB10;
  BOOL v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [a3 getFileRepresentations:v9 forType:0];
}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3;
  v3[3] = &unk_264E5BB10;
  char v5 = *(unsigned char *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_mapAsynchronously:completionHandler:", &__block_literal_global_254, v3);
}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = objc_opt_new();
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v34 = v6;
    id v9 = [MEMORY[0x263F86B50] documentsDirectoryWithError:&v34];
    id v10 = v34;

    if (v9)
    {
      id v26 = v10;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = objc_msgSend(MEMORY[0x263F08820], "writingIntentWithURL:options:", *(void *)(*((void *)&v30 + 1) + 8 * i), 1, v26);
            [v8 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
        }
        while (v13);
      }

      id v17 = [MEMORY[0x263F08A48] mainQueue];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4;
      void v27[3] = &unk_264E5B4A0;
      id v29 = *(id *)(a1 + 32);
      id v28 = v8;
      [v7 coordinateAccessWithIntents:v28 queue:v17 byAccessor:v27];

      id v10 = v26;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    id v6 = v10;
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          id v24 = [MEMORY[0x263F08850] defaultManager];
          id v35 = 0;
          [v24 trashItemAtURL:v23 resultingItemURL:0 error:&v35];
          id v25 = v35;

          if (v25)
          {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

            goto LABEL_23;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
LABEL_23:
}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void, void))
{
  id v6 = a4;
  id v7 = [a2 originalURL];
  ((void (**)(void, id, void))a4)[2](v6, v7, 0);
}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v14 = v3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v12 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v14);
        uint64_t v13 = [v11 URL];
        id v15 = v10;
        [v12 removeItemAtURL:v13 error:&v15];
        id v7 = v15;

        if (v7) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke;
  v8[3] = &unk_264E5CE88;
  id v9 = v6;
  id v7 = v6;
  [a3 getFileRepresentations:v8 forType:0];
}

void __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__40507;
  void v9[4] = __Block_byref_object_dispose__40508;
  id v10 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2;
  v8[3] = &unk_264E5B458;
  void v8[4] = v9;
  id v7 = objc_msgSend(v5, "if_compactMap:", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  _Block_object_dispose(v9, 8);
}

id __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 originalURL];
  uint64_t v6 = *MEMORY[0x263EFF6D0];
  v47[0] = *MEMORY[0x263EFF6A8];
  uint64_t v5 = v47[0];
  v47[1] = v6;
  uint64_t v48 = *MEMORY[0x263EFF710];
  uint64_t v7 = v48;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
  id v9 = [v4 promisedItemResourceValuesForKeys:v8 error:0];

  id v10 = [v9 objectForKey:v5];
  LOBYTE(v8) = [v10 BOOLValue];

  id v11 = [v9 objectForKey:v6];
  int v12 = [v11 BOOLValue];

  uint64_t v13 = [v9 objectForKey:v7];
  char v14 = [v13 BOOLValue];

  if ((v8 & 1) != 0 || v12)
  {
    uint64_t v20 = NSString;
    if (v12)
    {
      uint64_t v21 = WFLocalizedString(@"“%@” is a bundle");
      uint64_t v22 = [v4 lastPathComponent];
      id v15 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);

      uint64_t v23 = NSString;
      id v24 = WFLocalizedString(@"iCloud could not get a link to this %@ because it is a bundle (a bundle is a folder that acts like a file).");
      id v25 = [v3 wfType];
      id v26 = [v25 typeDescription];
      long long v19 = objc_msgSend(v23, "localizedStringWithFormat:", v24, v26);
    }
    else
    {
      id v27 = WFLocalizedString(@"“%@” is a folder");
      id v28 = [v4 lastPathComponent];
      id v15 = objc_msgSend(v20, "localizedStringWithFormat:", v27, v28);

      long long v19 = WFLocalizedString(@"iCloud could not get a link to this file because it is a folder. iCloud only supports getting links to regular files.");
    }
    uint64_t v29 = *MEMORY[0x263F08320];
    v45[0] = *MEMORY[0x263F08338];
    v45[1] = v29;
    v46[0] = v15;
    v46[1] = v19;
    long long v30 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    long long v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08438];
    uint64_t v33 = 21;
  }
  else
  {
    if (v14)
    {
      id v15 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      id v42 = *(id *)(v16 + 40);
      long long v17 = [v15 URLForPublishingUbiquitousItemAtURL:v4 expirationDate:0 error:&v42];
      id v18 = v42;
      long long v19 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v18;
      goto LABEL_11;
    }
    id v34 = NSString;
    id v35 = WFLocalizedString(@"“%@” is not uploaded to iCloud");
    long long v36 = [v4 lastPathComponent];
    id v15 = objc_msgSend(v34, "localizedStringWithFormat:", v35, v36);

    long long v19 = WFLocalizedString(@"Could not get a link to this file because it must already be uploaded to iCloud.");
    uint64_t v37 = *MEMORY[0x263F08320];
    v43[0] = *MEMORY[0x263F08338];
    v43[1] = v37;
    v44[0] = v15;
    v44[1] = v19;
    long long v30 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    long long v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08570];
    uint64_t v33 = -1002;
  }
  uint64_t v38 = [v31 errorWithDomain:v32 code:v33 userInfo:v30];
  uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8);
  v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = v38;

  long long v17 = 0;
LABEL_11:

  return v17;
}

- (id)_saveFiles:(id)a3 toURL:(id)a4 isDestinationKnownDirectory:(BOOL)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if ([v13 numberOfItems])
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__40507;
    v31[4] = __Block_byref_object_dispose__40508;
    id v32 = 0;
    long long v17 = [WFStorageServiceCancellableOperation alloc];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke;
    v30[3] = &unk_264E5EC88;
    v30[4] = v31;
    id v18 = [(WFStorageServiceCancellableOperation *)v17 initWithCancelBlock:v30];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_2;
    v23[3] = &unk_264E5B430;
    id v24 = v14;
    id v27 = v31;
    unint64_t v28 = a6;
    BOOL v29 = a5;
    long long v19 = v18;
    id v25 = v19;
    id v26 = v16;
    [v13 getFileRepresentations:v23 forType:0];
    uint64_t v20 = v26;
    uint64_t v21 = v19;

    _Block_object_dispose(v31, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    uint64_t v21 = 0;
  }

  return v21;
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v72[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v65 = 0;
  v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__40507;
  v69 = __Block_byref_object_dispose__40508;
  id v70 = 0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  int v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v13 = v66;
  id v14 = v66[5];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_3;
  v55[3] = &unk_264E5B390;
  v55[4] = &v61;
  v55[5] = &v57;
  id obj = v14;
  [v12 coordinateReadingItemAtURL:v7 options:4 error:&obj byAccessor:v55];
  objc_storeStrong(v13 + 5, obj);
  if (!*((unsigned char *)v62 + 24)) {
    *((unsigned char *)v58 + 24) = *(unsigned char *)(a1 + 72);
  }
  if (![*(id *)(a1 + 40) isCancelled])
  {
    char v15 = v8 & 1;
    if ((unint64_t)[v5 count] < 2)
    {
      if (!*((unsigned char *)v58 + 24) && ((v8 & 1) == 0 || !*((unsigned char *)v62 + 24)))
      {
        id v25 = (void *)MEMORY[0x263F33870];
        id v26 = [v7 lastPathComponent];
        id v27 = [v5 firstObject];
        unint64_t v28 = [v27 wfType];
        BOOL v29 = [v25 proposedFilenameForFile:v26 ofType:v28];

        long long v30 = [v7 URLByDeletingLastPathComponent];
        uint64_t v31 = [v30 URLByAppendingPathComponent:v29];

        id v7 = (id)v31;
      }
    }
    else if (!*((unsigned char *)v58 + 24))
    {
      objc_msgSend(v7, "wf_displayPath");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      long long v17 = NSString;
      id v18 = WFLocalizedString(@"The path you tried to save to (%@) is a file, but multiple files were provided. When saving multiple files at a time, you should specify a path to a folder instead.");
      long long v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v16);

      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      v71[0] = *MEMORY[0x263F08338];
      uint64_t v21 = WFLocalizedString(@"File already exists.");
      v71[1] = *MEMORY[0x263F08320];
      v72[0] = v21;
      v72[1] = v19;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
      uint64_t v23 = [v20 errorWithDomain:*MEMORY[0x263F07F70] code:516 userInfo:v22];
      id v24 = v66[5];
      v66[5] = (id)v23;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:

      goto LABEL_23;
    }
    if (!*((unsigned char *)v62 + 24))
    {
      if (*((unsigned char *)v58 + 24))
      {
        id v32 = v7;
      }
      else
      {
        id v32 = [v7 URLByDeletingLastPathComponent];
      }
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2020000000;
      char v54 = 0;
      uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v50 = 0;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      void v46[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_4;
      v46[3] = &unk_264E5B3B8;
      uint64_t v48 = &v51;
      id v16 = v32;
      id v47 = v16;
      uint64_t v49 = &v65;
      [v33 coordinateWritingItemAtURL:v16 options:0 error:&v50 byAccessor:v46];
      id v34 = v50;
      if (!*((unsigned char *)v52 + 24))
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        _Block_object_dispose(&v51, 8);
        goto LABEL_22;
      }

      _Block_object_dispose(&v51, 8);
    }
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_5;
    v38[3] = &unk_264E5B408;
    uint64_t v41 = &v57;
    id v7 = v7;
    char v45 = v15;
    uint64_t v35 = *(void *)(a1 + 56);
    id v39 = v7;
    uint64_t v42 = v35;
    uint64_t v43 = &v65;
    uint64_t v44 = &v61;
    id v40 = *(id *)(a1 + 40);
    long long v36 = objc_msgSend(v5, "if_compactMap:", v38);
    if ([*(id *)(a1 + 40) isCancelled]) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v36;
    }
    (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v37, v66[5]);

    id v16 = v39;
    goto LABEL_22;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_23:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v65, 8);
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v6 = [v3 defaultManager];
  id v5 = [v4 path];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 fileExistsAtPath:v5 isDirectory:*(void *)(*(void *)(a1 + 40) + 8) + 24];
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_4(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

id __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  char v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = [v3 filename];
    id v7 = [v5 URLByAppendingPathComponent:v6];
  }
  else
  {
    id v7 = v5;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v8 = 1;
LABEL_6:
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v9 + 40);
    int v10 = [v4 writeToFileURL:v7 overwriting:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v10 && ![*(id *)(a1 + 40) isCancelled])
    {
      id v13 = [MEMORY[0x263F33870] fileWithURL:v7 options:0];
    }
    else
    {
      id v11 = getWFFilesLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        long long v36 = "-[WFDefaultFileStorageService _saveFiles:toURL:isDestinationKnownDirectory:options:progress:completionHand"
              "ler:]_block_invoke_5";
        __int16 v37 = 2112;
        uint64_t v38 = v12;
        _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save file with error %@", buf, 0x16u);
      }

      id v13 = 0;
    }
    goto LABEL_18;
  }
  unint64_t v28 = v4;
  BOOL v29 = [v7 URLByDeletingLastPathComponent];
  id v14 = [v7 lastPathComponent];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  id v16 = *(void **)(v15 + 40);
  long long v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_6;
  v33[3] = &unk_264E5B3E0;
  v33[4] = *(void *)(a1 + 72);
  id v34 = v16;
  [v17 coordinateReadingItemAtURL:v7 options:4 error:&v34 byAccessor:v33];
  objc_storeStrong((id *)(v15 + 40), v34);
  if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    uint64_t v19 = 2;
    while (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v20 = [v14 stringByDeletingPathExtension];
      uint64_t v21 = objc_msgSend(v20, "stringByAppendingFormat:", @"-%lu", v19);
      uint64_t v22 = [v14 pathExtension];
      uint64_t v23 = [v21 stringByAppendingPathExtension:v22];
      uint64_t v18 = [v29 URLByAppendingPathComponent:v23];

      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      id v25 = *(void **)(v24 + 40);
      id v26 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_7;
      v31[3] = &unk_264E5B3E0;
      v31[4] = *(void *)(a1 + 72);
      id v32 = v25;
      [v26 coordinateReadingItemAtURL:v18 options:4 error:&v32 byAccessor:v31];
      objc_storeStrong((id *)(v24 + 40), v32);
      ++v19;
      id v7 = (id)v18;
      if ([*(id *)(a1 + 40) isCancelled]) {
        goto LABEL_16;
      }
    }

    BOOL v8 = *(unsigned char *)(a1 + 80) != 0;
    uint64_t v4 = v28;
    goto LABEL_6;
  }
  uint64_t v18 = (uint64_t)v7;
LABEL_16:

  id v13 = 0;
  id v7 = (id)v18;
  uint64_t v4 = v28;
LABEL_18:

  return v13;
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v6 = [v3 defaultManager];
  char v5 = [v4 path];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 fileExistsAtPath:v5];
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v6 = [v3 defaultManager];
  char v5 = [v4 path];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 fileExistsAtPath:v5];
}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toDirectory:(id)a5 subpath:(id)a6 options:(unint64_t)a7 progress:(id)a8 completionHandler:(id)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  id v16 = (void (**)(id, void, void *))a9;
  id v17 = a6;
  uint64_t v18 = objc_msgSend(v13, "if_map:", &__block_literal_global_191_40564);
  uint64_t v19 = [MEMORY[0x263F337B0] collectionWithItems:v18];
  uint64_t v20 = [(WFDefaultFileStorageService *)self fileURLFromDirectory:v14 path:v17];

  uint64_t v21 = [v20 pathComponents];
  uint64_t v22 = [v21 lastObject];

  if ([v22 length]) {
    BOOL v23 = ([v22 hasSuffix:@"/"] & 1) != 0 || (unint64_t)objc_msgSend(v13, "count") > 1;
  }
  else {
    BOOL v23 = 0;
  }
  if (objc_msgSend(v20, "wf_proposedFileIsContainedByDirectoryAtURL:", v14))
  {
    uint64_t v24 = [(WFDefaultFileStorageService *)self _saveFiles:v19 toURL:v20 isDestinationKnownDirectory:v23 options:a7 progress:v15 completionHandler:v16];
  }
  else
  {
    id v25 = [(id)objc_opt_class() directoryTraversalError];
    v16[2](v16, 0, v25);

    uint64_t v24 = 0;
  }

  return v24;
}

id __113__WFDefaultFileStorageService_saveFiles_withManagedLevel_toDirectory_subpath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F33870];
  id v3 = [a2 url];
  id v4 = [v2 fileWithURL:v3 options:8];

  char v5 = [MEMORY[0x263F337C8] itemWithFile:v4 attributionSet:0];

  return v5;
}

- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  id v22 = 0;
  id v13 = [MEMORY[0x263F86B50] documentsDirectoryWithError:&v22];
  id v14 = v22;
  if (v13)
  {
    id v15 = [(WFDefaultFileStorageService *)self fileURLFromDirectory:v13 path:v10];
    if ((objc_msgSend(v15, "wf_proposedFileIsContainedByDirectoryAtURL:", v13) & 1) == 0)
    {
      id v16 = [(id)objc_opt_class() directoryTraversalError];
      v12[2](v12, 0, v16);
LABEL_16:

      goto LABEL_17;
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x263F33A00]) initWithFileURL:v15 retrieveFolderContents:(a4 >> 4) & 1 progress:v11];
    [v16 start];
    [v16 waitUntilFinished];
    id v17 = [v16 downloadError];

    uint64_t v18 = [v17 domain];
    if ([v18 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v17 code] == 4)
      {

        if (a4)
        {
LABEL_13:
          id v14 = v17;
          uint64_t v20 = [v16 downloadedFiles];

          if (v20)
          {
            uint64_t v21 = [v16 downloadedFiles];
            objc_msgSend(v21, "if_mapAsynchronously:completionHandler:", &__block_literal_global_40567, v12);
          }
          else
          {
            v12[2](v12, 0, v17);
          }
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v19 = [v17 code];

        if ((a4 & 1) != 0 || v19 != 260) {
          goto LABEL_13;
        }
      }
      uint64_t v18 = v17;
      id v17 = 0;
    }

    goto LABEL_13;
  }
  v12[2](v12, 0, v14);
LABEL_17:
}

void __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  id v7 = [v5 filename];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F87558]];

  if (v8)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    uint64_t v9 = [v5 fileURL];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke_2;
    v10[3] = &unk_264E5E9A8;
    id v11 = v6;
    +[WFFileStorageServiceResult getResultWithFileURL:v9 consumingBundleID:0 resultBlock:v10];
  }
}

uint64_t __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveFileAtPath:(id)a3 fromDirectory:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = a3;
  id v13 = [v10 fileURL];
  id v14 = [(WFDefaultFileStorageService *)self fileURLFromDirectory:v13 path:v12];

  id v15 = (void *)[objc_alloc(MEMORY[0x263F33A00]) initWithFileURL:v14 retrieveFolderContents:(a5 >> 4) & 1 progress:0];
  [v15 start];
  [v15 waitUntilFinished];
  id v16 = [v15 downloadError];
  id v17 = [v16 domain];
  if (![v17 isEqualToString:*MEMORY[0x263F07F70]]) {
    goto LABEL_8;
  }
  if ([v16 code] == 4)
  {

    if (a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v18 = [v16 code];

  if ((a5 & 1) == 0 && v18 == 260)
  {
LABEL_7:
    id v17 = v16;
    id v16 = 0;
LABEL_8:
  }
LABEL_9:
  uint64_t v19 = [v10 fileURL];
  char v20 = objc_msgSend(v14, "wf_proposedFileIsContainedByDirectoryAtURL:", v19);

  if (v20)
  {
    uint64_t v21 = [v15 downloadedFiles];

    if (!v21)
    {
      v11[2](v11, 0, v16);
      goto LABEL_15;
    }
    id v22 = [MEMORY[0x263F86B50] documentsDirectoryWithError:0];
    BOOL v23 = [v22 URLByAppendingPathComponent:*MEMORY[0x263F87558]];
    uint64_t v24 = [v15 downloadedFiles];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __90__WFDefaultFileStorageService_retrieveFileAtPath_fromDirectory_options_completionHandler___block_invoke;
    void v27[3] = &unk_264E5B348;
    id v28 = v23;
    id v25 = v23;
    id v26 = objc_msgSend(v24, "if_compactMap:", v27);

    ((void (**)(id, void *, void *))v11)[2](v11, v26, v16);
  }
  else
  {
    id v22 = [(id)objc_opt_class() directoryTraversalError];
    v11[2](v11, 0, v22);
  }

LABEL_15:
}

id __90__WFDefaultFileStorageService_retrieveFileAtPath_fromDirectory_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fileURL];
  id v5 = [v4 path];
  id v6 = [*(id *)(a1 + 32) path];
  char v7 = [v5 isEqualToString:v6];

  if (v7) {
    id v8 = 0;
  }
  else {
    id v8 = v3;
  }

  return v8;
}

- (id)fileURLFromDirectory:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 hasPrefix:@"/"])
  {
    id v7 = [v6 substringFromIndex:1];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;
  if ([v7 length])
  {
    id v9 = [v5 URLByAppendingPathComponent:v8];
  }
  else
  {
    id v9 = v5;
  }
  id v10 = v9;
  id v11 = [v9 URLByStandardizingPath];

  return v11;
}

@end