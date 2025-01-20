@interface FPItemManager
+ (BOOL)isAnyDocumentRecentlyUsed:(id)a3 excludedFileTypes:(id)a4 allowedFileProviderIdentifiers:(id)a5;
+ (id)defaultManager;
+ (void)_promoteItemToAppLibraryIfNeeded:(id)a3;
- (BOOL)_isValidDestination:(id)a3;
- (BOOL)_itemIsOfArchiveType:(id)a3;
- (BOOL)isItemInTrash:(id)a3;
- (FPItemManager)init;
- (id)appLibraryCollectionForProviderDomain:(id)a3;
- (id)appLibraryCollectionForProviderDomainID:(id)a3;
- (id)collectionForFolderItem:(id)a3;
- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 fileTypes:(id)a6;
- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 sortDescriptors:(id)a6;
- (id)collectionWithIdentifier:(id)a3 providerIdentifier:(id)a4 fileTypes:(id)a5;
- (id)eligibleActionsForDroppingItems:(id)a3 underItem:(id)a4;
- (id)eligibleActionsForDroppingUTIs:(id)a3 underItem:(id)a4;
- (id)eligibleActionsForItems:(id)a3;
- (id)eligibleActionsForItems:(id)a3 domainCachePolicy:(unint64_t)a4;
- (id)eligibleActionsForItems:(id)a3 providerDomain:(id)a4;
- (id)evictItemAtURL:(id)a3 completionHandler:(id)a4;
- (id)itemForURL:(id)a3 error:(id *)a4;
- (id)newCollectionForProvider:(id)a3;
- (id)newCollectionForTag:(id)a3;
- (id)newCollectionWithItemAtURL:(id)a3 error:(id *)a4;
- (id)newCollectionWithItemAtURL:(id)a3 skipValidation:(BOOL)a4 error:(id *)a5;
- (id)newCollectionWithItemID:(id)a3;
- (id)newEvictableCollection;
- (id)newFavoritesCollection;
- (id)newNonAutoEvictableCollection;
- (id)newRecentsCollection;
- (id)newSearchCollection;
- (id)newSearchTrashCollection;
- (id)newSharedItemsCollection;
- (id)newTagCollection;
- (id)newTrashCollection;
- (id)operationForAction:(id)a3 items:(id)a4;
- (id)rootCollectionForProviderDomain:(id)a3;
- (id)serverCollectionForFolderItem:(id)a3;
- (id)servicesForItemAtURL:(id)a3 error:(id *)a4;
- (id)thumbnailsFetchOperationForItem:(id)a3 withVersions:(id)a4 withSize:(CGSize)a5 scale:(double)a6;
- (id)thumbnailsFetchOperationForItems:(id)a3 withSize:(CGSize)a4 scale:(double)a5;
- (id)trashCollectionForProviderDomain:(id)a3;
- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 depth:(unint64_t)a5 completionHandler:(id)a6;
- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 skipURLValidation:(BOOL)a5 completionHandler:(id)a6;
- (void)_fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandlerWithInfo:(id)a5;
- (void)extendBookmarkForItem:(id)a3 receivingBundleID:(id)a4 completionHandler:(id)a5;
- (void)fetchAllParentsForItem:(id)a3 completionHandler:(id)a4;
- (void)fetchDefaultLocationForApplication:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5;
- (void)fetchDefaultLocationForApplicationRecord:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5;
- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchIndexPropertiesForItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)fetchItemForItemID:(id)a3 completionHandler:(id)a4;
- (void)fetchItemForURL:(id)a3 completionHandler:(id)a4;
- (void)fetchOperationServiceForProviderDomainID:(id)a3 handler:(id)a4;
- (void)fetchParentForItem:(id)a3 completionHandler:(id)a4;
- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4;
- (void)fetchRemoteDomainForProviderDomainID:(id)a3 handler:(id)a4;
- (void)fetchRootItemForProviderDomain:(id)a3 completionHandler:(id)a4;
- (void)fetchServicesWithName:(id)a3 itemAtURL:(id)a4 synchronously:(BOOL)a5 handler:(id)a6;
- (void)fetchURLForItem:(id)a3 completionHandler:(id)a4;
- (void)fetchURLForItem:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchURLForItemID:(id)a3 completionHandler:(id)a4;
- (void)fetchVendorServiceForProviderDomainID:(id)a3 handler:(id)a4;
- (void)recursivelyExportItem:(id)a3 toURL:(id)a4 completionHandler:(id)a5;
- (void)scheduleAction:(id)a3;
@end

@implementation FPItemManager

uint64_t __37__FPItemManager_newRecentsCollection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = FPRecencyQualifyingAttributes();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(v2, "valueForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);

        if (!v8)
        {

          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if ([v2 isTrashed]) {
LABEL_12:
  }
    uint64_t v9 = 0;
  else {
    uint64_t v9 = [v2 isFolder] ^ 1;
  }

  return v9;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_57);
  }
  id v2 = (void *)defaultManager_defaultManager_0;

  return v2;
}

- (id)eligibleActionsForItems:(id)a3
{
  return [(FPItemManager *)self eligibleActionsForItems:a3 domainCachePolicy:1];
}

void __84__FPItemManager__fetchItemForURL_synchronously_skipURLValidation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  +[FPItemManager _promoteItemToAppLibraryIfNeeded:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  +[FPItemManager _promoteItemToAppLibraryIfNeeded:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_promoteItemToAppLibraryIfNeeded:(id)a3
{
  id v7 = a3;
  if ([v7 isFolder])
  {
    v3 = [v7 parentItemIdentifier];
    int v4 = [v3 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

    if (v4)
    {
      id v5 = +[FPAppRegistry sharedRegistry];
      id v6 = (id)[v5 promoteItemToAppLibraryIfNeeded:v7];
    }
  }
}

- (id)itemForURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__29;
  v21 = __Block_byref_object_dispose__29;
  id v22 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__FPItemManager_itemForURL_error___block_invoke;
  v10[3] = &unk_1E5AF29E8;
  v10[4] = &v17;
  v10[5] = &v11;
  [(FPItemManager *)self _fetchItemForURL:v6 synchronously:1 completionHandler:v10];
  id v7 = (void *)v18[5];
  if (a4 && !v7)
  {
    *a4 = (id) v12[5];
    id v7 = (void *)v18[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 skipURLValidation:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (!v8)
  {
    uint64_t v12 = __FPMakeAsyncCompletionBlock((id *)&self->super.isa, v11);

    id v11 = (id)v12;
  }
  if (!a5)
  {
    id v21 = 0;
    [v10 getResourceValue:&v21 forKey:@"FPOriginalDocumentURL" error:0];
    id v13 = v21;
    if (v13)
    {
      long long v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:]((uint64_t)v13);
      }

      id v15 = v13;
      id v10 = v15;
    }
    if (!FPURLMightBeInFileProvider(v10))
    {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
      goto LABEL_13;
    }
  }
  id v13 = +[FPDaemonConnection sharedConnection];
  id v16 = [v13 connectionProxy];
  uint64_t v17 = v16;
  if (v8)
  {
    uint64_t v18 = [v16 synchronousRemoteObjectProxy];

    uint64_t v17 = (void *)v18;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__FPItemManager__fetchItemForURL_synchronously_skipURLValidation_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF2B08;
  id v20 = v11;
  [v17 itemForURL:v10 completionHandler:v19];

LABEL_13:
}

- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
}

void __34__FPItemManager_itemForURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)fetchRootItemForProviderDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = +[FPItemID rootItemIDWithProviderDomainID:v7];

  [(FPItemManager *)self fetchItemForItemID:v8 completionHandler:v6];
}

- (void)fetchItemForItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a4);
  id v8 = [v6 providerDomainID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF60E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(FPItemManager *)self fetchOperationServiceForProviderDomainID:v8 handler:v11];
}

- (void)fetchOperationServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[FPDaemonConnection sharedConnectionProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__FPItemManager_fetchOperationServiceForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E5AF6138;
  id v10 = v5;
  id v8 = v5;
  [v7 startAccessingOperationServiceForProviderDomainID:v6 handler:v9];
}

- (id)eligibleActionsForItems:(id)a3 providerDomain:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v13 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_116;
  }
  uint64_t v7 = objc_opt_new();
  id v8 = objc_opt_new();
  v49 = objc_opt_new();
  id v9 = v6;
  if ([v5 count] == 1)
  {
    id v10 = [v5 firstObject];
    if (([v9 isReadOnly] & 1) == 0)
    {
      if (([v10 capabilities] & 8) != 0) {
        [v7 addObject:@"Rename"];
      }
      if ([v10 isFolder] && (objc_msgSend(v10, "capabilities") & 2) != 0) {
        [v7 addObject:@"Import"];
      }
    }
    if (([v10 capabilities] & 0x40000000) != 0) {
      [v7 addObject:@"FetchPublishingURL"];
    }
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Archive", @"Unarchive", @"Copy", 0);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Delete", @"Trash", @"Untrash", @"Favorite", @"Tag", @"ModifyFlags", @"ExcludeFromSync", @"Unignore", 0);
  v46 = (void *)v11;
  [v7 unionSet:v11];
  v43 = (void *)v12;
  if ([v9 isReadOnly])
  {
    [v8 addObject:@"Archive"];
    [v8 addObject:@"Unarchive"];
  }
  else
  {
    [v7 unionSet:v12];
  }
  id v44 = v6;
  id v45 = v5;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v14)
  {
    id v16 = 0;
    v52 = 0;
    char v48 = 0;
    goto LABEL_105;
  }
  uint64_t v15 = v14;
  id v16 = 0;
  v52 = 0;
  char v48 = 0;
  uint64_t v17 = *(void *)v55;
  v47 = v7;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v55 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8 * v18);
      if (![v19 isActionable])
      {
        id v13 = [MEMORY[0x1E4F1CAD0] set];

        id v6 = v44;
        id v5 = v45;
        v38 = v43;
        goto LABEL_115;
      }
      if ([v19 isBusy])
      {
        char v48 = 1;
        goto LABEL_96;
      }
      id v20 = [v19 itemIdentifier];
      if ([v20 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
      {

LABEL_27:
        [v8 addObject:@"Tag"];
        [v8 addObject:@"Favorite"];
        [v8 addObject:@"Archive"];
        [v8 addObject:@"Unarchive"];
        [v8 addObject:@"Rename"];
        [v8 addObject:@"Trash"];
        [v8 addObject:@"Delete"];
        [v8 addObject:@"ModifyFlags"];
        [v8 addObject:@"Pin"];
        goto LABEL_28;
      }
      id v21 = [v19 itemIdentifier];
      int v22 = [v21 isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"];

      if (v22) {
        goto LABEL_27;
      }
LABEL_28:
      if (([v19 capabilities] & 1) == 0) {
        [v8 unionSet:v46];
      }
      if (![(FPItemManager *)self _itemIsOfArchiveType:v19]) {
        [v8 addObject:@"Unarchive"];
      }
      if (v16)
      {
        id v23 = v16;
      }
      else
      {
        id v23 = [v19 providerDomainID];
      }
      id v16 = v23;

      if (v52)
      {
        id v24 = v52;
      }
      else
      {
        id v24 = [v19 parentItemIdentifier];
      }
      v52 = v24;

      if (!v9
        || ([v19 providerDomainID],
            v25 = objc_claimAutoreleasedReturnValue(),
            [v9 identifier],
            v26 = objc_claimAutoreleasedReturnValue(),
            char v27 = [v25 isEqualToString:v26],
            v26,
            v25,
            (v27 & 1) == 0))
      {
        id v53 = 0;
        uint64_t v28 = +[FPProviderDomain providerDomainWithID:v16 cachePolicy:1 error:&v53];
        id v29 = v53;

        if (!v28)
        {
          v30 = fp_current_or_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v36 = objc_msgSend(v29, "fp_prettyDescription");
            *(_DWORD *)buf = 138412546;
            v59 = v19;
            __int16 v60 = 2112;
            v61 = v36;
            _os_log_error_impl(&dword_1A33AE000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Failed to fetch domain for FPItem %@, error: %@", buf, 0x16u);
          }
        }

        id v9 = (id)v28;
      }
      v31 = [v19 providerDomainID];
      [v49 addObject:v31];

      uint64_t v7 = v47;
      if ([v19 isCloudItem])
      {
        if (([v19 capabilities] & 0x40) != 0) {
          [v47 addObject:@"Evict"];
        }
        if (([v19 isDownloaded] & 1) == 0)
        {
          if ([v19 allowsContextualMenuDownloadEntry]) {
            v32 = @"Download";
          }
          else {
            v32 = @"DownloadNoContextMenu";
          }
          [v47 addObject:v32];
        }
        if ([v19 isFolder] && (objc_msgSend(v19, "isRecursivelyDownloaded") & 1) == 0)
        {
          if ([v19 allowsContextualMenuDownloadEntry]) {
            v33 = @"DownloadRecursively";
          }
          else {
            v33 = @"DownloadRecursivelyNoContextMenu";
          }
          [v47 addObject:v33];
        }
      }
      if (FPPinningSupportedForItem(v19)) {
        [v47 addObject:@"Pin"];
      }
      if (([v19 capabilities] & 0x8000000) != 0) {
        [v47 addObject:@"Unpin"];
      }
      if (([v19 isFolder] & 1) == 0) {
        [v8 addObject:@"Favorite"];
      }
      if ([v19 isContainer]) {
        [v8 addObject:@"ModifyFlags"];
      }
      if (([v19 exclusionType] & 1) != 0
        || ([v8 addObject:@"Unignore"], (objc_msgSend(v19, "capabilities") & 0x80) == 0))
      {
        [v8 addObject:@"ExcludeFromSync"];
      }
      if (![v19 exclusionType] && objc_msgSend(v19, "isExcludedFromSync"))
      {
        [v8 addObject:@"Unignore"];
        [v8 addObject:@"ExcludeFromSync"];
      }
      if ([v19 exclusionType] || objc_msgSend(v19, "isExcludedFromSync"))
      {
        [v8 addObject:@"Evict"];
        [v8 addObject:@"Pin"];
        [v8 addObject:@"Download"];
        [v8 addObject:@"DownloadRecursively"];
      }
      if ([v19 isCollaborationInvitation])
      {
        [v8 addObject:@"Copy"];
        [v8 addObject:@"Tag"];
      }
      if (([v19 capabilities] & 0x10) == 0) {
        goto LABEL_79;
      }
      if ([(FPItemManager *)self isItemInTrash:v19])
      {
        [v8 addObject:@"Trash"];
        [v8 addObject:@"Favorite"];
        [v8 addObject:@"Unarchive"];
        [v8 addObject:@"Archive"];
        [v8 addObject:@"ModifyFlags"];
        [v8 addObject:@"Pin"];
        v34 = v47;
        v35 = @"Delete";
        goto LABEL_83;
      }
      if (v9 && ([v9 supportsSyncingTrash] & 1) == 0) {
LABEL_79:
      }
        [v8 addObject:@"Trash"];
      v34 = v8;
      v35 = @"Untrash";
LABEL_83:
      [v34 addObject:v35];
      if (([v19 capabilities] & 4) == 0) {
        [v8 addObject:@"Move"];
      }
      if (([v19 capabilities] & 0x20) == 0
        && ![(FPItemManager *)self isItemInTrash:v19])
      {
        [v8 addObject:@"Delete"];
      }
      if (([v19 capabilities] & 0x20000000) == 0) {
        [v8 addObject:@"Tag"];
      }
      if (([v19 capabilities] & 2) == 0) {
        [v8 addObject:@"ModifyFlags"];
      }
      if (([v19 capabilities] & 0x4000000) == 0) {
        [v8 addObject:@"DownloadRecursively"];
      }
      if (([v19 capabilities] & 0x40) == 0) {
        [v8 addObject:@"Evict"];
      }
LABEL_96:
      ++v18;
    }
    while (v15 != v18);
    uint64_t v37 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    uint64_t v15 = v37;
  }
  while (v37);
LABEL_105:

  if ([obj count] == 1)
  {
    char v39 = [v8 containsObject:@"Unarchive"];
    id v6 = v44;
    id v5 = v45;
    v38 = v43;
    v40 = @"Archive";
    if (v39) {
      goto LABEL_110;
    }
  }
  else
  {
    v40 = @"Unarchive";
    id v6 = v44;
    id v5 = v45;
    v38 = v43;
  }
  [v8 addObject:v40];
LABEL_110:
  if ((unint64_t)objc_msgSend(v49, "count", v40) >= 2) {
    [v8 addObject:@"Move"];
  }
  [v7 minusSet:v8];
  if (v48)
  {
    v41 = [MEMORY[0x1E4F1CAD0] setWithObject:@"Delete"];
    [v7 intersectSet:v41];
  }
  id v13 = v7;
LABEL_115:

LABEL_116:

  return v13;
}

- (BOOL)_itemIsOfArchiveType:(id)a3
{
  uint64_t v3 = _itemIsOfArchiveType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_itemIsOfArchiveType__onceToken, &__block_literal_global_110_0);
  }
  id v5 = (void *)_itemIsOfArchiveType__archiveTypes;
  id v6 = [v4 typeIdentifier];

  char v7 = [v5 containsObject:v6];
  return v7;
}

- (BOOL)isItemInTrash:(id)a3
{
  id v3 = a3;
  if ([v3 isTrashed])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [v3 providerID];
    int v4 = [v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

    id v6 = [v3 itemID];
    char v7 = [v6 isDiskIdentifier];

    if ((v7 & 1) != 0 || v4)
    {
      id v8 = [v3 fileURL];
      id v9 = [v8 pathComponents];
      LOBYTE(v4) = [v9 containsObject:@".Trash"];
    }
  }

  return v4;
}

- (id)newSearchCollection
{
  return objc_alloc_init(FPSearchCollection);
}

- (id)eligibleActionsForItems:(id)a3 domainCachePolicy:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    char v7 = [v6 firstObject];
    id v8 = [v7 providerDomainID];
    id v14 = 0;
    id v9 = +[FPProviderDomain providerDomainWithID:v8 cachePolicy:a4 error:&v14];
    id v10 = v14;
    if (!v9)
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FPItemManager eligibleActionsForItems:domainCachePolicy:]((uint64_t)v7, v10, v11);
      }
    }
    uint64_t v12 = [(FPItemManager *)self eligibleActionsForItems:v6 providerDomain:v9];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v12;
}

void __66__FPItemManager_fetchOperationServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v19 = a2;
  unint64_t v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14 && v19 | v11)
  {
    uint64_t v15 = [FPService alloc];
    id v16 = FPXOperationServiceXPCInterface();
    if (v19) {
      uint64_t v17 = [(FPService *)v15 initWithProxy:v19 interface:v16 lifetimeExtender:v12 providerDomainID:v13];
    }
    else {
      uint64_t v17 = [(FPService *)v15 initWithEndpoint:v11 interface:v16 lifetimeExtender:v12 providerDomainID:v13];
    }
    uint64_t v18 = (void *)v17;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      id v10 = [*(id *)(a1 + 32) identifier];
      char v7 = FPItemNotFoundError((uint64_t)v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [v5 remoteObjectProxy];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5AF2B08;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v8 fetchItemID:v9 reply:v11];

    char v7 = v12;
  }
}

- (id)newFavoritesCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_31_1);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  [(FPQueryCollection *)v3 setDescriptionName:@"favorited items"];

  return v3;
}

- (id)newRecentsCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_62);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  int v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByLastUsedDate");
  [(FPItemCollection *)v3 reorderItemsWithSortDescriptors:v4];

  [(FPQueryCollection *)v3 setDescriptionName:@"recent files"];
  return v3;
}

- (id)newSharedItemsCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_82);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  [(FPQueryCollection *)v3 setDescriptionName:@"all shared items"];

  return v3;
}

- (id)newTrashCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_38);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  [(FPQueryCollection *)v3 setDescriptionName:@"trashed items (CS)"];
  int v4 = [[FPTrashUnionCollection alloc] initWithQueryCollection:v3];

  return v4;
}

uint64_t __31__FPItemManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager_0 = objc_alloc_init(FPItemManager);

  return MEMORY[0x1F41817F8]();
}

- (FPItemManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)FPItemManager;
  id v2 = [(FPItemManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"FPItemManager operation queue"];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("FPItemManager completion queue", v5);
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (OS_dispatch_queue *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("FPItemManager.notificationQueue", v8);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    activeCollections = v2->_activeCollections;
    v2->_activeCollections = (NSMutableSet *)v11;
  }
  return v2;
}

void __38__FPItemManager__itemIsOfArchiveType___block_invoke()
{
  v5[11] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F44558] identifier];
  v1 = objc_msgSend((id)*MEMORY[0x1E4F443D8], "identifier", v0);
  v5[1] = v1;
  id v2 = [(id)*MEMORY[0x1E4F44348] identifier];
  v5[2] = v2;
  v5[3] = @"public.cpio-archive";
  v5[4] = @"com.apple.bom-compressed-cpio";
  v5[5] = @"org.gnu.gnu-tar-archive";
  v5[6] = @"public.tar-archive";
  v5[7] = @"org.gnu.gnu-zip-tar-archive";
  v5[8] = @"com.pkware.zip-archive";
  v5[9] = @"com.apple.archive";
  v5[10] = @"com.apple.encrypted-archive";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:11];
  int v4 = (void *)_itemIsOfArchiveType__archiveTypes;
  _itemIsOfArchiveType__archiveTypes = v3;
}

- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 sortDescriptors:(id)a6
{
  return 0;
}

- (id)collectionWithIdentifier:(id)a3 providerIdentifier:(id)a4 fileTypes:(id)a5
{
  return [(FPItemManager *)self collectionWithIdentifier:a3 domainIdentifier:0 providerIdentifier:a4 fileTypes:a5];
}

- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 fileTypes:(id)a6
{
  return [(FPItemManager *)self collectionWithIdentifier:a3 domainIdentifier:a4 providerIdentifier:a5 fileTypes:MEMORY[0x1E4F1CBF0]];
}

- (id)rootCollectionForProviderDomain:(id)a3
{
  int v4 = [a3 identifier];
  id v5 = +[FPItemID rootItemIDWithProviderDomainID:v4];

  id v6 = [(FPItemManager *)self newCollectionWithItemID:v5];

  return v6;
}

- (id)collectionForFolderItem:(id)a3
{
  id v5 = a3;
  if ([v5 state])
  {
    dispatch_queue_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPItemManager.m" lineNumber:130 description:@"this operation isn't supported for placeholder items"];
  }
  id v6 = [v5 itemID];
  id v7 = [(FPItemManager *)self newCollectionWithItemID:v6];

  return v7;
}

- (id)serverCollectionForFolderItem:(id)a3
{
  id v5 = a3;
  if ([v5 state])
  {
    dispatch_queue_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPItemManager.m" lineNumber:141 description:@"this operation isn't supported for placeholder items"];
  }
  id v6 = [v5 formerItemID];
  id v7 = [(FPItemManager *)self newCollectionWithItemID:v6];

  return v7;
}

- (id)trashCollectionForProviderDomain:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  id v5 = [FPItemID alloc];
  id v6 = [v3 identifier];

  id v7 = [(FPItemID *)v5 initWithProviderDomainID:v6 itemIdentifier:@"NSFileProviderTrashContainerItemIdentifier"];
  [v4 setEnumeratedItemID:v7];

  id v8 = [[FPExtensionCollection alloc] initWithSettings:v4];

  return v8;
}

- (id)newCollectionWithItemID:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  [v4 setEnumeratedItemID:v3];

  id v5 = [[FPExtensionCollection alloc] initWithSettings:v4];
  return v5;
}

- (id)newCollectionWithItemAtURL:(id)a3 skipValidation:(BOOL)a4 error:(id *)a5
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4)
  {
LABEL_15:
    if (![v7 checkResourceIsReachableAndReturnError:a5])
    {
      id v20 = 0;
      goto LABEL_19;
    }
    id v8 = objc_opt_new();
    [v8 setEnumeratedURL:v7];
    [v8 setRequireSandboxAccess:1];
    id v20 = [[FPExtensionCollection alloc] initWithSettings:v8];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"com~apple~CloudDocs" isDirectory:1];
    id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
    uint64_t v11 = [v10 URLByAppendingPathComponent:@"Desktop" isDirectory:1];
    id v12 = [v10 URLByAppendingPathComponent:@"Documents" isDirectory:1];
    v29[0] = v8;
    v29[1] = v9;
    int v22 = (void *)v11;
    id v23 = (void *)v9;
    v29[2] = v11;
    v29[3] = v12;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(v7, "fp_relativePathWithRealpath:", *(void *)(*((void *)&v24 + 1) + 8 * v17));
          unint64_t v19 = v18;
          if (v18 && ![v18 length])
          {

            goto LABEL_15;
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v20 = 0;
  }

LABEL_19:
  return v20;
}

- (id)newCollectionWithItemAtURL:(id)a3 error:(id *)a4
{
  return [(FPItemManager *)self newCollectionWithItemAtURL:a3 skipValidation:0 error:a4];
}

- (id)appLibraryCollectionForProviderDomain:(id)a3
{
  int v4 = [a3 identifier];
  id v5 = [(FPItemManager *)self appLibraryCollectionForProviderDomainID:v4];

  return v5;
}

- (id)appLibraryCollectionForProviderDomainID:(id)a3
{
  id v3 = a3;
  int v4 = [[FPItemID alloc] initWithProviderDomainID:v3 itemIdentifier:@"NSFileProviderRootContainerItemIdentifier"];

  id v5 = objc_opt_new();
  [v5 setBuildAndFilterAppLibraries:1];
  [v5 setEnumeratedItemID:v4];
  id v6 = [(FPExtensionCollection *)[FPAppLibraryCollection alloc] initWithSettings:v5];

  return v6;
}

uint64_t __39__FPItemManager_newFavoritesCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 favoriteRank];
  if (v3 && ([v2 isTrashed] & 1) == 0) {
    uint64_t v4 = [v2 isFolder];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __35__FPItemManager_newTrashCollection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTrashed];
}

- (id)newEvictableCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_45);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByLastUsedDate");
  id v5 = objc_msgSend(v4, "fp_map:", &__block_literal_global_49_0);
  [(FPItemCollection *)v3 reorderItemsWithSortDescriptors:v5];

  [(FPQueryCollection *)v3 setDescriptionName:@"evictable files"];
  return v3;
}

unint64_t __39__FPItemManager_newEvictableCollection__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 6) & 1;
}

uint64_t __39__FPItemManager_newEvictableCollection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reversedSortDescriptor];
}

- (id)newNonAutoEvictableCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_54_0);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByDocumentSize");
  id v5 = objc_msgSend(v4, "fp_map:", &__block_literal_global_57_0);
  [(FPItemCollection *)v3 reorderItemsWithSortDescriptors:v5];

  [(FPQueryCollection *)v3 setDescriptionName:@"all files that aren't autoevictable"];
  return v3;
}

BOOL __46__FPItemManager_newNonAutoEvictableCollection__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 capabilities] & 0x40) == 0;
}

uint64_t __46__FPItemManager_newNonAutoEvictableCollection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reversedSortDescriptor];
}

- (id)newCollectionForProvider:(id)a3
{
  id v3 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __42__FPItemManager_newCollectionForProvider___block_invoke;
  id v13 = &unk_1E5AF6020;
  id v14 = v3;
  id v4 = v3;
  id v5 = FPItemPredicate(&v10);
  id v6 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "fp_sortDescriptorByLastUsedDate");
  [(FPItemCollection *)v6 reorderItemsWithSortDescriptors:v7];

  id v8 = [NSString stringWithFormat:@"all items for %@", v4, v10, v11, v12, v13];
  [(FPQueryCollection *)v6 setDescriptionName:v8];

  return v6;
}

uint64_t __42__FPItemManager_newCollectionForProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 providerID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)newTagCollection
{
  id v2 = FPItemPredicate(&__block_literal_global_73);
  id v3 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v2];
  [(FPQueryCollection *)v3 setDescriptionName:@"all tagged files"];

  return v3;
}

BOOL __33__FPItemManager_newTagCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 tags];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)newCollectionForTag:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 lowercaseString];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __37__FPItemManager_newCollectionForTag___block_invoke;
  id v13 = &unk_1E5AF6020;
  id v14 = v4;
  id v5 = v4;
  id v6 = FPItemPredicate(&v10);
  id v7 = [[FPQueryCollection alloc] initWithQueryDescriptorClass:objc_opt_class() predicate:v6];
  [(FPQueryCollection *)v7 setTagIdentifier:v3];
  id v8 = [NSString stringWithFormat:@"files tagged %@", v3, v10, v11, v12, v13];

  [(FPQueryCollection *)v7 setDescriptionName:v8];
  return v7;
}

uint64_t __37__FPItemManager_newCollectionForTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(a2, "tagData", 0);
  uint64_t v4 = FPGetTagsFromTagsData(v3);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) label];
        uint64_t v10 = [v9 lowercaseString];
        char v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

        if (v11)
        {
          uint64_t v12 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

uint64_t __41__FPItemManager_newSharedItemsCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isTrashed]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isShared];
  }

  return v3;
}

- (id)newSearchTrashCollection
{
  return objc_alloc_init(FPSearchTrashCollection);
}

+ (BOOL)isAnyDocumentRecentlyUsed:(id)a3 excludedFileTypes:(id)a4 allowedFileProviderIdentifiers:(id)a5
{
  return FPIsAnyDocumentRecentlyUsed(a3, a4, a5);
}

- (id)thumbnailsFetchOperationForItems:(id)a3 withSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v10 = -[FPFetchThumbnailsOperation initWithItems:desiredSize:screenScale:itemManager:]([FPFetchThumbnailsOperation alloc], "initWithItems:desiredSize:screenScale:itemManager:", v9, self, width, height, a5);

  return v10;
}

- (id)thumbnailsFetchOperationForItem:(id)a3 withVersions:(id)a4 withSize:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[FPFetchThumbnailsOperation initWithItem:versions:desiredSize:screenScale:itemManager:]([FPFetchThumbnailsOperation alloc], "initWithItem:versions:desiredSize:screenScale:itemManager:", v12, v11, self, width, height, a6);

  return v13;
}

- (void)fetchURLForItem:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a5);
  id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  int v10 = [v8 isPlaceholder];
  id v11 = [v8 fileURL];
  id v12 = v11;
  if (!v10)
  {
    if (v6 || !v11)
    {
      long long v14 = [v8 itemID];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__FPItemManager_fetchURLForItem_creatingPlaceholderIfMissing_completionHandler___block_invoke;
      v20[3] = &unk_1E5AF6048;
      id v21 = v8;
      int v22 = v9;
      [(FPItemManager *)self _fetchURLForItemID:v14 creatingPlaceholderIfMissing:v6 completionHandlerWithInfo:v20];
    }
    else
    {
      ((void (**)(void, FPItemID *, void))v9)[2](v9, v11, 0);
    }
    goto LABEL_11;
  }

  if (!v12)
  {
    long long v15 = [v8 placeholderIdentifier];

    if (!v15)
    {
      id v13 = [v8 itemIdentifier];
      uint64_t v19 = FPItemNotFoundError((uint64_t)v13);
      ((void (**)(void, void, void *))v9)[2](v9, 0, v19);

      goto LABEL_4;
    }
    long long v16 = [FPItemID alloc];
    long long v17 = [v8 providerDomainID];
    uint64_t v18 = [v8 placeholderIdentifier];
    id v12 = [(FPItemID *)v16 initWithProviderDomainID:v17 itemIdentifier:v18];

    [(FPItemManager *)self _fetchURLForItemID:v12 creatingPlaceholderIfMissing:0 completionHandler:v9];
LABEL_11:

    goto LABEL_12;
  }
  id v13 = [v8 fileURL];
  ((void (**)(void, void *, void))v9)[2](v9, v13, 0);
LABEL_4:

LABEL_12:
}

void __80__FPItemManager_fetchURLForItem_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v8 = a2;
  id v7 = a4;
  if (v8 && (a3 & 1) == 0) {
    [*(id *)(a1 + 32) setFileURL:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchURLForItem:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchURLForItemID:(id)a3 completionHandler:(id)a4
{
}

- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF6070;
  id v11 = v8;
  id v9 = v8;
  [(FPItemManager *)self _fetchURLForItemID:a3 creatingPlaceholderIfMissing:v5 completionHandlerWithInfo:v10];
}

uint64_t __83__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandlerWithInfo:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[FPDaemonConnection sharedConnectionProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandlerWithInfo___block_invoke;
  v11[3] = &unk_1E5AF3D60;
  id v12 = v7;
  id v10 = v7;
  [v9 documentURLFromItemID:v8 creatingPlaceholderIfMissing:v5 ignoreAlternateContentsURL:0 completionHandler:v11];
}

void __91__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandlerWithInfo___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  [a2 url];
  if (objc_claimAutoreleasedReturnValue()) {
    FPMarkAsFileProviderBookmark();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)evictItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FPDaemonConnection sharedConnection];
  id v8 = [v7 evictItemAtURL:v6 evenIfEnumeratingFP:1 andClearACLForConsumer:0 completionHandler:v5];

  return v8;
}

- (void)fetchIndexPropertiesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[FPItemManager fetchIndexPropertiesForItemAtURL:completionHandler:](v6);
  }

  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, v7);
  id v9 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();

  id v10 = FPNotSupportedError();
  ((void (**)(void, void, void, void, void *))v9)[2](v9, 0, 0, 0, v10);
}

- (void)fetchItemForURL:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[FPDaemonConnection sharedConnectionProxy];
  [v15 fetchFSItemsForItemIdentifiers:v14 providerIdentifier:v13 domainIdentifier:v12 materializingIfNeeded:v7 completionHandler:v11];
}

- (void)extendBookmarkForItem:(id)a3 receivingBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a5);
  id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot extend bookmark for nil item", v15, 2u);
    }

    id v12 = FPItemNotFoundError(0);
    ((void (**)(void, void, void *))v10)[2](v10, 0, v12);
  }
  id v13 = +[FPDaemonConnection sharedConnectionProxy];
  id v14 = [v9 itemID];

  [v13 extendBookmarkForItemID:v14 consumerID:v8 completionHandler:v10];
}

- (void)_fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__FPItemManager__fetchParentsForItemID_recursively_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF50B8;
  id v11 = v8;
  id v9 = v8;
  [(FPItemManager *)self _fetchHierarchyForItemID:a3 recursively:v5 completionHandler:v10];
}

void __70__FPItemManager__fetchParentsForItemID_recursively_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  unint64_t v6 = [v9 count];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6 < 2)
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, MEMORY[0x1E4F1CBF0], v5);
  }
  else
  {
    id v8 = objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 depth:(unint64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v18 = a6;
  if (v11)
  {
    if (a5 < 6)
    {
      v30 = [v11 providerDomainID];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke;
      v31[3] = &unk_1E5AF60C0;
      id v34 = v18;
      BOOL v36 = a4;
      id v32 = v11;
      v33 = self;
      unint64_t v35 = a5;
      [(FPItemManager *)self fetchOperationServiceForProviderDomainID:v30 handler:v31];

      goto LABEL_9;
    }
    uint64_t v19 = NSStringFromSelector(a2);
    fp_simulate_crash(@"Recursion too deep in %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);

    long long v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[FPItemManager _fetchHierarchyForItemID:recursively:depth:completionHandler:](a2);
    }

    uint64_t v28 = @"depth";
  }
  else
  {
    uint64_t v28 = @"itemID";
  }
  id v29 = FPInvalidParameterError((uint64_t)v28, 0, v12, v13, v14, v15, v16, v17);
  (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v29);

LABEL_9:
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    id v5 = [a2 remoteObjectProxy];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5AF6098;
    char v13 = v6;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    void v10[4] = *(void *)(a1 + 40);
    uint64_t v12 = v7;
    id v11 = v8;
    [v5 fetchHierarchyForItemID:v9 recursively:v6 ignoreAlternateContentURL:0 reply:v10];
  }
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 2);
    +[FPItemManager _promoteItemToAppLibraryIfNeeded:v7];
  }
  id v8 = [v5 lastObject];
  uint64_t v9 = v8;
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend(v8, "fp_parentDomainIdentifier");
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = (void *)v10;
  uint64_t v12 = objc_msgSend(v9, "fp_parentDomainIdentifier");
  char v13 = [v9 domainIdentifier];
  char v14 = [v12 isEqualToString:v13];

  if (v6 || (v14 & 1) != 0)
  {
LABEL_8:
    if (v5) {
      id v23 = v5;
    }
    else {
      id v23 = (id)MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v23, v6);
  }
  else
  {
    uint64_t v15 = [FPItemID alloc];
    uint64_t v16 = [v9 providerID];
    uint64_t v17 = objc_msgSend(v9, "fp_parentDomainIdentifier");
    id v18 = [v9 parentItemIdentifier];
    uint64_t v19 = [(FPItemID *)v15 initWithProviderID:v16 domainIdentifier:v17 itemIdentifier:v18];

    uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 48) + 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3;
    v24[3] = &unk_1E5AF32D8;
    uint64_t v22 = *(void **)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    id v25 = v5;
    [v22 _fetchHierarchyForItemID:v19 recursively:v20 depth:v21 completionHandler:v24];
  }
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3_cold_1(a1);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:v5];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
}

- (void)fetchParentForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 itemID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__FPItemManager_fetchParentForItem_completionHandler___block_invoke;
  v9[3] = &unk_1E5AF50B8;
  id v10 = v6;
  id v8 = v6;
  [(FPItemManager *)self _fetchParentsForItemID:v7 recursively:0 completionHandler:v9];
}

void __54__FPItemManager_fetchParentForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchAllParentsForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 itemID];
  [(FPItemManager *)self _fetchParentsForItemID:v7 recursively:1 completionHandler:v6];
}

- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a4);
  id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v16 = 0;
  [v6 getResourceValue:&v16 forKey:@"FPOriginalDocumentURL" error:0];
  id v8 = v16;
  if (v8)
  {
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:]((uint64_t)v8);
    }

    id v10 = v8;
    id v6 = v10;
  }
  id v11 = self->_completionQueue;
  if (FPURLMightBeInFileProvider(v6))
  {
    uint64_t v12 = +[FPDaemonConnection sharedConnection];
    char v13 = [v12 connectionProxy];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__FPItemManager_fetchPathComponentsForURL_completionHandler___block_invoke;
    v14[3] = &unk_1E5AF50B8;
    uint64_t v15 = v7;
    [v13 fetchPathComponentsForURL:v6 completionHandler:v14];
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

uint64_t __61__FPItemManager_fetchPathComponentsForURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDefaultLocationForApplication:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 correspondingApplicationRecord];
  [(FPItemManager *)self fetchDefaultLocationForApplicationRecord:v10 defaultProviderDomain:v9 completionHandler:v8];
}

- (void)fetchDefaultLocationForApplicationRecord:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[FPFetchDefaultContainerOperation alloc] initForApplicationRecord:v10 providerDomain:v9];

  [v11 setFetchCompletionBlock:v8];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

- (BOOL)_isValidDestination:(id)a3
{
  id v3 = a3;
  if (([v3 isPending] & 1) != 0 || !objc_msgSend(v3, "isFolder")) {
    LOBYTE(v4) = 0;
  }
  else {
    unint64_t v4 = ((unint64_t)[v3 capabilities] >> 1) & 1;
  }

  return v4;
}

- (id)eligibleActionsForDroppingItems:(id)a3 underItem:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30 = [v7 providerDomainID];
  if ([v6 count] && -[FPItemManager _isValidDestination:](self, "_isValidDestination:", v7))
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"Move", @"Copy", @"Untrash", 0);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v6;
    uint64_t v29 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v29)
    {
      id v26 = v6;
      id obj = v9;
      uint64_t v28 = *(void *)v32;
      int v10 = 1;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        if ([v12 isPending])
        {
          id v24 = [MEMORY[0x1E4F1CAD0] set];

          id v6 = v26;
          goto LABEL_37;
        }
        char v13 = [v12 providerDomainID];
        char v14 = [v13 isEqualToString:v30];

        if ((v14 & 1) == 0)
        {
          [v8 removeObject:@"Move"];
          [v8 removeObject:@"Untrash"];
        }
        if (([v12 capabilities] & 0x20) != 0) {
          goto LABEL_17;
        }
        uint64_t v15 = [v12 providerDomainID];
        if ([v15 isEqualToString:v30])
        {
          char v16 = [v7 isExcludedFromSync];

          if ((v16 & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        [v8 removeObject:@"Move"];
        [v8 removeObject:@"Untrash"];
LABEL_17:
        uint64_t v17 = [v12 itemID];
        id v18 = [v7 itemID];
        int v19 = [v17 isEqualToItemID:v18];

        if (v19)
        {
          [v8 removeObject:@"Move"];
          [v8 removeObject:@"Copy"];
        }
        if (([v12 capabilities] & 4) == 0) {
          [v8 removeObject:@"Move"];
        }
        if (([v12 capabilities] & 1) == 0) {
          [v8 removeObject:@"Copy"];
        }
        if ([(FPItemManager *)self isItemInTrash:v12]) {
          uint64_t v20 = @"Move";
        }
        else {
          uint64_t v20 = @"Untrash";
        }
        [v8 removeObject:v20];
        uint64_t v21 = [v12 parentItemID];
        uint64_t v22 = [v7 itemID];
        int v23 = [v21 isEqualToItemID:v22];

        v10 &= v23;
        if (v29 == ++v11)
        {
          id v9 = obj;
          uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v29) {
            goto LABEL_5;
          }

          id v6 = v26;
          if (!v10) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
      }
    }

LABEL_33:
    [v8 removeObject:@"Move"];
LABEL_34:
    if ([v8 count]) {
      FPFilterActionsForDroppingItems(v9, v7, v8);
    }
    id v24 = v8;
LABEL_37:
  }
  else
  {
    id v24 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v24;
}

- (id)eligibleActionsForDroppingUTIs:(id)a3 underItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FPItemManager *)self _isValidDestination:v7])
  {
    char v8 = FPAreUTIsImportable(v6, v7);
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    if (v8)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Move", @"Copy", 0);
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
  }
  uint64_t v10 = [v9 set];
LABEL_6:
  uint64_t v11 = (void *)v10;

  return v11;
}

- (id)operationForAction:(id)a3 items:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v23 + 1) + 8 * v12) state])
        {
          char v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"FPItemManager.m" lineNumber:1150 description:@"this operation isn't supported for placeholder items"];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  if ([v7 isEqualToString:@"Delete"])
  {
    char v14 = FPDeleteOperation;
LABEL_12:
    uint64_t v15 = (FPUntrashOperation *)[[v14 alloc] initWithItems:v8];
LABEL_13:
    char v16 = (FPFetchPublishingURLOperation *)v15;
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"Download"])
  {
    uint64_t v17 = [[FPDownloadOperation alloc] initWithItems:v8];
    char v16 = (FPFetchPublishingURLOperation *)v17;
    uint64_t v18 = 0;
LABEL_18:
    [(FPDownloadOperation *)v17 setRecursively:v18];
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"DownloadRecursively"])
  {
    uint64_t v17 = [[FPDownloadOperation alloc] initWithItems:v8];
    char v16 = (FPFetchPublishingURLOperation *)v17;
    uint64_t v18 = 1;
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"Evict"])
  {
    char v14 = FPEvictOperation;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"Trash"])
  {
    char v14 = FPTrashOperation;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"Untrash"])
  {
    uint64_t v15 = [[FPUntrashOperation alloc] initWithItems:v8 restoreDirectory:0];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"FetchPublishingURL"])
  {
    uint64_t v20 = [FPFetchPublishingURLOperation alloc];
    uint64_t v21 = [v8 firstObject];
    char v16 = [(FPFetchPublishingURLOperation *)v20 initWithItem:v21];
  }
  else
  {
    if ([v7 isEqualToString:@"ExcludeFromSync"])
    {
      char v14 = FPIgnoreItemsOperation;
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"Unignore"])
    {
      char v14 = FPUnignoreItemsOperation;
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"Pin"])
    {
      char v14 = FPPinOperation;
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"Unpin"])
    {
      char v14 = FPUnpinOperation;
      goto LABEL_12;
    }
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"FPItemManager.m", 1179, @"UNREACHABLE: build your own %@ operation!", v7 object file lineNumber description];

    char v16 = 0;
  }
LABEL_19:

  return v16;
}

- (void)scheduleAction:(id)a3
{
  id v4 = a3;
  uint64_t section = __fp_create_section();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPItemManager scheduleAction:](&section);
  }

  [v4 presendNotifications];
  [(NSOperationQueue *)self->_operationQueue addOperation:v4];
  __fp_leave_section_Debug((uint64_t)&section);
}

- (void)recursivelyExportItem:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"FPItemManager.m", 1200, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v11)
  {
LABEL_3:
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"FPItemManager.m", 1201, @"%s must be called with completion handler", "-[FPItemManager recursivelyExportItem:toURL:completionHandler:]");
  }
LABEL_4:
  char v14 = [v10 URLByDeletingLastPathComponent];
  uint64_t v15 = [v10 lastPathComponent];
  char v16 = [FPCopyOperation alloc];
  v26[0] = v9;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v18 = [(FPMoveOperation *)v16 initWithItems:v17 destinationURL:v14];

  id v24 = v9;
  long long v25 = v15;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [(FPMoveOperation *)v18 setTargetFilenamesByItem:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__FPItemManager_recursivelyExportItem_toURL_completionHandler___block_invoke;
  v22[3] = &unk_1E5AF0790;
  id v23 = v12;
  id v20 = v12;
  [(FPActionOperation *)v18 setActionCompletionBlock:v22];
  [(FPItemManager *)self scheduleAction:v18];
}

uint64_t __63__FPItemManager_recursivelyExportItem_toURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRemoteDomainForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FPDaemonConnection sharedConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__FPItemManager_fetchRemoteDomainForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E5AF6110;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchDomainServicerForProviderDomainID:v6 handler:v9];
}

void __62__FPItemManager_fetchRemoteDomainForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = NSString;
  id v8 = a4;
  id v9 = a2;
  id v10 = objc_msgSend(a3, "fp_obfuscatedProviderDomainID");
  id v11 = NSStringFromProtocol((Protocol *)&unk_1EF6EDE80);
  id v13 = [v7 stringWithFormat:@"proxy to %@ for interface %@", v10, v11];

  uint64_t v12 = [[FPXPCAutomaticErrorProxy alloc] initWithConnection:v9 protocol:&unk_1EF6EDE80 orError:0 name:v13 requestPid:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVendorServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FPDaemonConnection sharedConnectionProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__FPItemManager_fetchVendorServiceForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E5AF6160;
  id v10 = v5;
  id v8 = v5;
  [v7 startAccessingExtensionForProviderDomainID:v6 handler:v9];
}

void __63__FPItemManager_fetchVendorServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v14 || a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = [FPService alloc];
    uint64_t v12 = FPXVendorXPCInterface();
    id v13 = [(FPService *)v11 initWithEndpoint:v14 interface:v12 lifetimeExtender:v9 providerDomainID:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)fetchServicesWithName:(id)a3 itemAtURL:(id)a4 synchronously:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  if (v6) {
    +[FPDaemonConnection synchronousSharedConnectionProxy];
  }
  else {
  uint64_t v12 = +[FPDaemonConnection sharedConnectionProxy];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__FPItemManager_fetchServicesWithName_itemAtURL_synchronously_handler___block_invoke;
  v14[3] = &unk_1E5AF6188;
  id v15 = v9;
  id v13 = v9;
  [v12 startAccessingServiceWithName:v11 itemURL:v10 completionHandler:v14];
}

void __71__FPItemManager_fetchServicesWithName_itemAtURL_synchronously_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v17 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v17 || a6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v14 = [FPService alloc];
    id v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6CAC98];
    char v16 = [(FPService *)v14 initWithEndpoint:v17 interface:v15 lifetimeExtender:v11 providerDomainID:v12];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)servicesForItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__29;
  v50 = __Block_byref_object_dispose__29;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__29;
  id v44 = __Block_byref_object_dispose__29;
  id v45 = 0;
  uint64_t v34 = 0;
  unint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__29;
  v38 = __Block_byref_object_dispose__29;
  id v39 = 0;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __44__FPItemManager_servicesForItemAtURL_error___block_invoke;
  v30 = &unk_1E5AF61B0;
  long long v31 = &v40;
  long long v32 = &v34;
  long long v33 = &v46;
  id v21 = v6;
  -[FPItemManager fetchServicesWithName:itemAtURL:synchronously:handler:](self, "fetchServicesWithName:itemAtURL:synchronously:handler:", 0);
  if (v41[5] && v35[5] && !v47[5])
  {
    id v8 = dispatch_group_create();
    id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v10 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend((id)v35[5], "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)v35[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v16 = objc_alloc(MEMORY[0x1E4F28CD0]);
          id v17 = [(id)v41[5] remoteObjectProxyCreating];
          uint64_t v18 = (void *)[v16 initWithName:v15 endpointCreatingProxy:v17 requestFinishedGroup:v8];

          [v10 setObject:v18 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v52 count:16];
      }
      while (v12);
    }

    int v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__FPItemManager_servicesForItemAtURL_error___block_invoke_2;
    block[3] = &unk_1E5AF1950;
    block[4] = &v40;
    dispatch_group_notify(v8, v19, block);

    id v7 = (void *)[v10 copy];
  }
  else
  {
    id v7 = 0;
    if (a4) {
      *a4 = (id) v47[5];
    }
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v7;
}

void __44__FPItemManager_servicesForItemAtURL_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

uint64_t __44__FPItemManager_servicesForItemAtURL_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCollections, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)fetchIndexPropertiesForItemAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_2_7(&dword_1A33AE000, v2, v3, "[CRIT] Deprecated method fetchIndexPropertiesForItemAtURL used for %@.", v4, v5, v6, v7, 2u);
}

- (void)_fetchItemForURL:(uint64_t)a1 synchronously:skipURLValidation:completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] found %@ as original URL to %@", (void)v3, DWORD2(v3));
}

- (void)_fetchHierarchyForItemID:(const char *)a1 recursively:depth:completionHandler:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_7(&dword_1A33AE000, v2, v3, "[SIMCRASH] Recursion too deep in %@", v4, v5, v6, v7, 2u);
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] adding %@ to %@", (void)v3, DWORD2(v3));
}

- (void)eligibleActionsForItems:(NSObject *)a3 domainCachePolicy:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to fetch domain for FPItem %@, error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)scheduleAction:(void *)a1 .cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] ┏%llx scheduling action: %@", (void)v3, DWORD2(v3));
}

@end