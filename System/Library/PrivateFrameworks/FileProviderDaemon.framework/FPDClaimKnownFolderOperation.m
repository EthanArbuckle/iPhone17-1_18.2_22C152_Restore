@interface FPDClaimKnownFolderOperation
- (BOOL)isDisallowedByOrganization;
- (FPDClaimKnownFolderOperation)initWithDescriptors:(id)a3 server:(id)a4 request:(id)a5;
- (FPDClaimKnownFolderOperation)initWithKnownFolderLocations:(id)a3 domain:(id)a4 server:(id)a5 localizedReason:(id)a6 request:(id)a7;
- (FPDClaimKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 domain:(id)a4 server:(id)a5 request:(id)a6;
- (void)attachClaimedKnownFoldersWithCompletionHandler:(id)a3;
- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4;
- (void)getKnownFolderLocationsWithCompletionHandler:(id)a3;
- (void)isDisallowedByOrganization;
- (void)main;
- (void)notifyUserWithCompletionHandler:(id)a3;
- (void)resolveKnownFolder:(id)a3 location:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)resolveLogicalURLsOfLocations:(id)a3 completionHandler:(id)a4;
@end

@implementation FPDClaimKnownFolderOperation

- (FPDClaimKnownFolderOperation)initWithKnownFolderLocations:(id)a3 domain:(id)a4 server:(id)a5 localizedReason:(id)a6 request:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FPDClaimKnownFolderOperation;
  v16 = [(FPOperation *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_isProviderInitiated = 1;
    v16->_knownFolders = [v12 providedKnownFolders];
    objc_storeStrong((id *)&v17->_locations, a3);
    objc_storeStrong((id *)&v17->_domain, a4);
    objc_storeStrong((id *)&v17->_server, a5);
    objc_storeStrong((id *)&v17->_request, a7);
    v17->_skipSystemAlerts = 0;
  }

  return v17;
}

- (FPDClaimKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 domain:(id)a4 server:(id)a5 request:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FPDClaimKnownFolderOperation;
  id v14 = [(FPOperation *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    v14->_isProviderInitiated = 0;
    v14->_knownFolders = a3;
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_server, a5);
    objc_storeStrong((id *)&v15->_request, a6);
    v15->_skipSystemAlerts = 0;
  }

  return v15;
}

- (FPDClaimKnownFolderOperation)initWithDescriptors:(id)a3 server:(id)a4 request:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FPDClaimKnownFolderOperation;
  id v12 = [(FPOperation *)&v36 init];
  id v13 = v12;
  if (v12)
  {
    id v28 = v11;
    id obj = a4;
    id v30 = v10;
    v12->_isProviderInitiated = 0;
    objc_storeStrong((id *)&v12->_descriptors, a3);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v31 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (!v15) {
      goto LABEL_14;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v20 = [v19 knownFolder];
        v21 = +[FPDKnownFolderArbiter desktopURL];
        uint64_t v22 = objc_msgSend(v20, "fp_relationshipToItemAtURL:", v21);

        if (v22 == 1)
        {
          uint64_t v23 = 1;
        }
        else
        {
          v24 = [v19 knownFolder];
          v25 = +[FPDKnownFolderArbiter documentsURL];
          uint64_t v26 = objc_msgSend(v24, "fp_relationshipToItemAtURL:", v25);

          if (v26 != 1) {
            continue;
          }
          uint64_t v23 = 2;
        }
        v13->_knownFolders |= v23;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (!v16)
      {
LABEL_14:

        objc_storeStrong((id *)&v13->_server, obj);
        objc_storeStrong((id *)&v13->_request, a5);
        v13->_skipSystemAlerts = 0;
        id v9 = v31;
        id v10 = v30;
        id v11 = v28;
        break;
      }
    }
  }

  return v13;
}

- (BOOL)isDisallowedByOrganization
{
  domain = self->_domain;
  if (domain)
  {
    v4 = domain;
  }
  else
  {
    descriptors = self->_descriptors;
    if (!descriptors || ![(NSArray *)descriptors count])
    {
      BOOL v7 = 0;
      v4 = 0;
      goto LABEL_13;
    }
    id v9 = [(FPDServer *)self->_server extensionManager];
    id v10 = [(NSArray *)self->_descriptors objectAtIndexedSubscript:0];
    id v11 = [v10 logicalLocation];
    v4 = [v9 domainForURL:v11 reason:0];

    if (!v4) {
      goto LABEL_4;
    }
  }
  v5 = [(FPDDomain *)v4 provider];
  char v6 = [v5 isKnownFolderSyncingAllowedByManagement];

  if (v6)
  {
LABEL_4:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    [(FPDClaimKnownFolderOperation *)(uint64_t)self isDisallowedByOrganization];
  }

  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (void)getKnownFolderLocationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  if (self->_descriptors)
  {
    char v6 = (void (*)(void))*((void *)v4 + 2);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if (self->_isProviderInitiated)
  {
    char v6 = (void (*)(void))*((void *)v4 + 2);
    goto LABEL_5;
  }
  BOOL v7 = [(FPDDomain *)self->_domain defaultBackend];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(FPDDomain *)self->_domain defaultBackend];
    unint64_t knownFolders = self->_knownFolders;
    request = self->_request;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__FPDClaimKnownFolderOperation_getKnownFolderLocationsWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E6A768C8;
    v13[4] = self;
    id v14 = v5;
    [v9 getKnownFolderLocations:knownFolders request:request completionHandler:v13];
  }
  else
  {
    id v12 = FPNotSupportedError();
    ((void (**)(void, void, void *))v5)[2](v5, 0, v12);
  }
LABEL_6:
}

void __77__FPDClaimKnownFolderOperation_getKnownFolderLocationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = v5;
  if (a3)
  {
    BOOL v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if ((*(void *)(*(void *)(a1 + 32) + 312) & ~[v5 providedKnownFolders]) == 0)
  {
    BOOL v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  char v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 312);
    int v13 = 138412802;
    uint64_t v14 = v11;
    __int16 v15 = 1024;
    int v16 = v12;
    __int16 v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1D744C000, v8, OS_LOG_TYPE_ERROR, "[ERROR] %@: we asked for locations for %x, got %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = FPNotSupportedError();
  (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

LABEL_6:
}

- (void)resolveKnownFolder:(id)a3 location:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [v11 asExistingLocation];
  uint64_t v14 = v13;
  if (!v13)
  {
    unint64_t v39 = a5;
    uint64_t v19 = 0;
    goto LABEL_9;
  }
  __int16 v15 = [v13 itemIdentifier];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F25C70]];

  if (!v16)
  {
    v20 = [v14 itemIdentifier];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F25C90]];

    if (v21)
    {
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = @"the trash item cannot be used as the location of a known folder";
      goto LABEL_7;
    }
    unint64_t v39 = a5;
    id v23 = objc_alloc(MEMORY[0x1E4F25D30]);
    v24 = [(FPDDomain *)self->_domain identifier];
    v25 = [v14 itemIdentifier];
    uint64_t v19 = (void *)[v23 initWithProviderDomainID:v24 itemIdentifier:v25];

LABEL_9:
    uint64_t v26 = [v11 asPathMatchingLocation];
    uint64_t v38 = self;
    if (v26)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F25D30]);
      id v28 = [(FPDDomain *)self->_domain identifier];
      v29 = [v26 parentItemIdentifier];
      uint64_t v30 = [v27 initWithProviderDomainID:v28 itemIdentifier:v29];

      id v31 = [v26 filename];
      uint64_t v19 = (void *)v30;
      if (v30) {
        goto LABEL_11;
      }
    }
    else
    {
      id v31 = 0;
      if (v19)
      {
LABEL_11:
        if (([v31 containsString:@"/"] & 1) == 0
          && ([v31 isEqualToString:@"."] & 1) == 0
          && ![v31 isEqualToString:@".."])
        {
          [(FPDDomain *)v38->_domain defaultBackend];
          v36 = long long v35 = v10;
          request = v38->_request;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __86__FPDClaimKnownFolderOperation_resolveKnownFolder_location_options_completionHandler___block_invoke;
          v40[3] = &unk_1E6A768F0;
          id v44 = v12;
          id v41 = v19;
          id v42 = v31;
          id v43 = v35;
          unint64_t v45 = v39;
          [v36 itemForItemID:v41 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 request:request completionHandler:v40];

          id v10 = v35;
          goto LABEL_18;
        }
        long long v32 = (void *)MEMORY[0x1E4F28C58];
        long long v33 = @"invalid folder name";
LABEL_17:
        long long v34 = objc_msgSend(v32, "fp_invalidArgumentError:", v33);
        (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v34);

LABEL_18:
        goto LABEL_19;
      }
    }
    long long v32 = (void *)MEMORY[0x1E4F28C58];
    long long v33 = @"invalid known folder location";
    goto LABEL_17;
  }
  __int16 v17 = (void *)MEMORY[0x1E4F28C58];
  v18 = @"the root item cannot be used as the location of a known folder";
LABEL_7:
  uint64_t v22 = objc_msgSend(v17, "fp_invalidArgumentError:", v18);
  (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v22);

LABEL_19:
}

void __86__FPDClaimKnownFolderOperation_resolveKnownFolder_location_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    BOOL v7 = [v5 fileURL];

    if (v7)
    {
      if ([v6 isFolder])
      {
        char v8 = [v6 detachedRootLogicalURL];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [v6 fileURL];
        }
        int v16 = v10;

        uint64_t v17 = *(void *)(a1 + 40);
        if (v17)
        {
          __int16 v15 = [v16 URLByAppendingPathComponent:v17 isDirectory:1];

          v18 = [v6 fileURL];
          uint64_t v19 = [v18 URLByAppendingPathComponent:*(void *)(a1 + 40) isDirectory:1];

          objc_msgSend(v19, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0);
          id v20 = objc_claimAutoreleasedReturnValue();
          int v21 = lstat((const char *)[v20 fileSystemRepresentation], &v32);
          mode_t st_mode = v32.st_mode;

          if (v21 < 0 || (st_mode & 0xF000) == 0x4000)
          {
            v25 = (void *)[objc_alloc(MEMORY[0x1E4F25DD0]) initWithKnownFolder:*(void *)(a1 + 48) logicalLocation:v15 detachOptions:*(void *)(a1 + 64)];
            id v29 = objc_alloc(MEMORY[0x1E4F25DD8]);
            uint64_t v30 = [v6 itemIdentifier];
            id v31 = (void *)[v29 initWithParentItemIdentifier:v30 filename:*(void *)(a1 + 40)];
            [v25 setLocation:v31];

            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          else
          {
            uint64_t v23 = *(void *)(a1 + 56);
            v24 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"resolved item location is not a directory");
            (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);

            v25 = 0;
          }
        }
        else
        {
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F25DD0]) initWithKnownFolder:*(void *)(a1 + 48) logicalLocation:v16 detachOptions:*(void *)(a1 + 64)];
          id v26 = objc_alloc(MEMORY[0x1E4F25DD8]);
          id v27 = [v6 itemIdentifier];
          id v28 = (void *)[v26 initWithExistingItemIdentifier:v27];
          [v25 setLocation:v28];

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          __int16 v15 = v16;
        }
      }
      else
      {
        uint64_t v14 = *(void *)(a1 + 56);
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"resolved item location is not a directory");
        (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = [*(id *)(a1 + 32) identifier];
      int v13 = FPItemNotFoundError();
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v13);
    }
  }
}

- (void)resolveLogicalURLsOfLocations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  descriptors = self->_descriptors;
  if (descriptors)
  {
    (*((void (**)(id, NSArray *, void))v7 + 2))(v7, descriptors, 0);
  }
  else
  {
    id v10 = dispatch_group_create();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__16;
    v36[4] = __Block_byref_object_dispose__16;
    id v37 = 0;
    uint64_t v11 = objc_opt_new();
    unsigned int v12 = [v6 shouldCreateBinaryCompatibilitySymlink];
    int v13 = [v6 desktopLocation];

    if (v13)
    {
      dispatch_group_enter(v10);
      uint64_t v14 = +[FPDKnownFolderArbiter desktopURL];
      __int16 v15 = [v6 desktopLocation];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke;
      v32[3] = &unk_1E6A76918;
      long long v33 = v10;
      long long v35 = v36;
      id v34 = v11;
      [(FPDClaimKnownFolderOperation *)self resolveKnownFolder:v14 location:v15 options:v12 completionHandler:v32];
    }
    int v16 = [v6 documentsLocation];

    if (v16)
    {
      dispatch_group_enter(v10);
      uint64_t v17 = +[FPDKnownFolderArbiter documentsURL];
      v18 = [v6 documentsLocation];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_2;
      v28[3] = &unk_1E6A76918;
      id v29 = v10;
      id v31 = v36;
      id v30 = v11;
      [(FPDClaimKnownFolderOperation *)self resolveKnownFolder:v17 location:v18 options:v12 completionHandler:v28];
    }
    uint64_t v19 = [(FPOperation *)self callbackQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_3;
    v22[3] = &unk_1E6A76940;
    uint64_t v23 = v10;
    id v27 = v36;
    id v25 = v11;
    id v26 = v8;
    v24 = self;
    id v20 = v11;
    int v21 = v10;
    dispatch_group_notify(v21, v19, v22);

    _Block_object_dispose(v36, 8);
  }
}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v7 + 40);
    char v8 = (id *)(v7 + 40);
    uint64_t v9 = v10;
    if (v10) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v5;
    }
    objc_storeStrong(v8, v11);
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v12];
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v7 + 40);
    char v8 = (id *)(v7 + 40);
    uint64_t v9 = v10;
    if (v10) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v5;
    }
    objc_storeStrong(v8, v11);
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v12];
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_31;
  }
  unint64_t v3 = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 368) = 1;
  *(void *)&long long v2 = 134218240;
  long long v27 = v2;
LABEL_4:
  if (v3 >= objc_msgSend(*(id *)(a1 + 48), "count", v27))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_31;
  }
  id v4 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v3];
  id v5 = v4;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 368))
  {
    memset(&v31, 0, sizeof(v31));
    id v6 = [v4 knownFolder];
    if (lstat((const char *)[v6 fileSystemRepresentation], &v31)) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = (v31.st_mode & 0xF000) == 40960;
    }
    int v8 = v7;

    if (!v8) {
      goto LABEL_17;
    }
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    id v9 = [v5 knownFolder];
    if (stat((const char *)[v9 fileSystemRepresentation], &v29)) {
      goto LABEL_16;
    }
    id v10 = [v5 logicalLocation];
    if (stat((const char *)[v10 fileSystemRepresentation], &v30))
    {

LABEL_16:
LABEL_17:
      *(unsigned char *)(*(void *)(a1 + 40) + 368) = 0;
      goto LABEL_18;
    }
    BOOL v21 = v29.st_ino == v30.st_ino;

    if (!v21) {
      goto LABEL_17;
    }
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = v27;
      unint64_t v33 = v3;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] known folder %lu out of %lu is a symlink to the logical location", buf, 0x16u);
    }
  }
LABEL_18:
  for (unint64_t i = ++v3; ; ++i)
  {
    if (i >= [*(id *)(a1 + 48) count])
    {

      goto LABEL_4;
    }
    id v12 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
    int v13 = [v5 logicalLocation];
    uint64_t v14 = [v12 logicalLocation];
    BOOL v15 = objc_msgSend(v13, "fp_relationshipToItemAtURL:", v14) == 2;

    if (!v15)
    {
      uint64_t v24 = *(void *)(a1 + 56);
      id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"claimed locations are related to each other");
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v25);
      goto LABEL_30;
    }
    int v16 = [v5 logicalLocation];
    uint64_t v17 = [v16 URLByDeletingLastPathComponent];
    v18 = [v12 logicalLocation];
    uint64_t v19 = [v18 URLByDeletingLastPathComponent];
    BOOL v20 = objc_msgSend(v17, "fp_relationshipToItemAtURL:", v19) == 1;

    if (!v20) {
      break;
    }
  }
  uint64_t v26 = *(void *)(a1 + 56);
  id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"claimed locations should have the same parent directory");
  (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v25);
LABEL_30:

LABEL_31:
  objc_sync_exit(obj);
}

- (void)notifyUserWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (self->_isProviderInitiated && !self->_skipSystemAlerts)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:]();
    }

    if (os_variant_has_internal_content())
    {
      BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
      int v8 = [v7 stringForKey:@"forceClaimPromptResult"];
      if ([v8 isEqualToString:@"approve"])
      {
        id v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:]();
        }

        id v10 = [MEMORY[0x1E4F1C9C8] now];
        [v10 timeIntervalSince1970];
        objc_msgSend(v7, "setDouble:forKey:", @"forceClaimPromptLastInterception");

        v5[2](v5, 0);
        goto LABEL_20;
      }
      if ([v8 isEqualToString:@"decline"])
      {
        uint64_t v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:]();
        }

        id v12 = [MEMORY[0x1E4F1C9C8] now];
        [v12 timeIntervalSince1970];
        objc_msgSend(v7, "setDouble:forKey:", @"forceClaimPromptLastInterception");

        int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
        ((void (**)(void, void *))v5)[2](v5, v13);
        goto LABEL_19;
      }
    }
    uint64_t v14 = [(FPDDomain *)self->_domain provider];
    BOOL v7 = [v14 providerDomainForDomain:self->_domain];

    BOOL v15 = [(FPDDomain *)self->_domain provider];
    objc_msgSend(v7, "setShouldHideDomainDisplayName:", objc_msgSend(v15, "shouldHideDomainDisplayName"));

    int v8 = (void *)[(id)objc_opt_new() initWithProviderDomain:v7];
    if ([v8 presentAlertWithUserAprovalToContinue])
    {
      v5[2](v5, 0);
LABEL_20:

      goto LABEL_21;
    }
    int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v13);
LABEL_19:

    goto LABEL_20;
  }
  (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_21:
}

- (void)attachClaimedKnownFoldersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  descriptors = self->_descriptors;
  if (descriptors)
  {
    id v6 = [(NSArray *)descriptors fp_map:&__block_literal_global_25];
    BOOL v7 = [[FPDAttachKnownFolderOperation alloc] initWithKnownFolderURLs:v6 onlyForDomain:0 server:self->_server options:2 request:self->_request];
  }
  else
  {
    BOOL v7 = [[FPDAttachKnownFolderOperation alloc] initWithKnownFolders:self->_knownFolders onlyForDomain:0 server:self->_server options:2 request:self->_request];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6A76968;
  id v10 = v4;
  id v8 = v4;
  [(FPOperation *)v7 setFinishedBlock:v9];
  [(FPOperation *)v7 start];
}

uint64_t __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 knownFolder];
}

uint64_t __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[FPDDetachKnownFolderOperation alloc] initWithKnownFolder:v7 server:self->_server request:self->_request];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__FPDClaimKnownFolderOperation_detachKnownFolders_completionHandler___block_invoke;
  v10[3] = &unk_1E6A76968;
  id v11 = v6;
  id v9 = v6;
  [(FPOperation *)v8 setFinishedBlock:v10];
  [(FPOperation *)v8 start];
}

uint64_t __69__FPDClaimKnownFolderOperation_detachKnownFolders_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)main
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if ([(FPDClaimKnownFolderOperation *)self isDisallowedByOrganization])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    FPLoc();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = objc_msgSend(v3, "fp_disallowedByManagement:");
    [(FPOperation *)self finishWithResult:0 error:v4];

    return;
  }
  domain = self->_domain;
  if (!domain) {
    goto LABEL_26;
  }
  id v6 = [(FPDDomain *)domain volume];
  int v7 = [v6 role];

  if (v7 != 1)
  {
    int v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(FPDDomain *)self->_domain identifier];
      v18 = objc_msgSend(v17, "fp_obfuscatedProviderDomainID");
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = self;
      __int16 v37 = 2114;
      *(void *)uint64_t v38 = v18;
      _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: %{public}@ is not on the home volume", buf, 0x16u);
    }
    uint64_t v19 = [(FPDDomain *)self->_domain provider];
    BOOL v15 = [v19 providerDomainForDomain:self->_domain];

    if ([v15 isiCloudDriveProvider])
    {
      BOOL v20 = FPLoc();
    }
    else
    {
      stat v32 = [v15 domainFullDisplayName];
      BOOL v20 = FPLoc();
    }
    BOOL v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28798];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = v20;
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v32);
    uint64_t v24 = [v21 errorWithDomain:v22 code:18 userInfo:v23];
    [(FPOperation *)self finishWithResult:0 error:v24];

    goto LABEL_19;
  }
  id v8 = self->_domain;
  if (self->_isProviderInitiated)
  {
    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
  if (!v8) {
    goto LABEL_26;
  }
  id v25 = [(FPDDomain *)v8 nsDomain];
  unint64_t v26 = self->_knownFolders & ~[v25 replicatedKnownFolders];

  if (v26)
  {
    id v8 = self->_domain;
    if (v8)
    {
LABEL_9:
      id v9 = [(FPDDomain *)v8 nsDomain];
      unint64_t v10 = self->_knownFolders & ~[v9 supportedKnownFolders];

      if (v10)
      {
        id v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t knownFolders = self->_knownFolders;
          int v13 = [(FPDDomain *)self->_domain identifier];
          uint64_t v14 = objc_msgSend(v13, "fp_obfuscatedProviderDomainID");
          *(_DWORD *)buf = 138412802;
          uint64_t v36 = self;
          __int16 v37 = 1024;
          *(_DWORD *)uint64_t v38 = knownFolders;
          *(_WORD *)&v38[4] = 2114;
          *(void *)&v38[6] = v14;
          _os_log_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: attempting to switch %x to %{public}@ that doesn't support those folders", buf, 0x1Cu);
        }
        BOOL v15 = FPNotSupportedError();
        [(FPOperation *)self finishWithResult:0 error:v15];
LABEL_19:

        return;
      }
    }
LABEL_26:
    stat v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = self;
      _os_log_impl(&dword_1D744C000, v31, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: resolving locations", buf, 0xCu);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke;
    v34[3] = &unk_1E6A76990;
    v34[4] = self;
    [(FPDClaimKnownFolderOperation *)self getKnownFolderLocationsWithCompletionHandler:v34];
    return;
  }
  long long v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [(FPDDomain *)self->_domain identifier];
    stat v29 = objc_msgSend(v28, "fp_obfuscatedProviderDomainID");
    unint64_t v30 = self->_knownFolders;
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2114;
    *(void *)uint64_t v38 = v29;
    *(_WORD *)&v38[8] = 1024;
    *(_DWORD *)&v38[10] = v30;
    _os_log_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: %{public}@ is already syncing the requested folders %x", buf, 0x1Cu);
  }
  [(FPOperation *)self finishWithResult:0 error:0];
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:a3];
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: resolving logical URLs", buf, 0xCu);
    }

    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_117;
    v9[3] = &unk_1E6A76260;
    void v9[4] = v8;
    [v8 resolveLogicalURLsOfLocations:v5 completionHandler:v9];
  }
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || [*(id *)(a1 + 32) isCancelled])
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:v6];
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: notify user", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_118;
    v10[3] = &unk_1E6A73C80;
    void v10[4] = v9;
    id v11 = v5;
    [v9 notifyUserWithCompletionHandler:v10];
  }
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 || [*(id *)(a1 + 32) isCancelled])
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:v3];
  }
  else
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: attach folders", buf, 0xCu);
    }

    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_119;
    v7[3] = &unk_1E6A73C80;
    v7[4] = v6;
    id v8 = *(id *)(a1 + 40);
    [v6 attachClaimedKnownFoldersWithCompletionHandler:v7];
  }
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 || [*(id *)(a1 + 32) isCancelled])
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:v3];
  }
  else
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: detach folders", buf, 0xCu);
    }

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_120;
    v8[3] = &unk_1E6A73580;
    v8[4] = v6;
    [v6 detachKnownFolders:v7 completionHandler:v8];
  }
}

uint64_t __36__FPDClaimKnownFolderOperation_main__block_invoke_120(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_localizedReason, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

- (void)isDisallowedByOrganization
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 328);
  id v6 = [a2 providerDomainID];
  uint64_t v7 = objc_msgSend(v6, "fp_obfuscatedProviderDomainID");
  uint64_t v8 = *(void *)(a1 + 360);
  int v9 = 138412802;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Management Disallows claiming known folders %@ by %{public}@ for %{public}@", (uint8_t *)&v9, 0x20u);
}

- (void)notifyUserWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  forcing approval of claim", v2, v3, v4, v5, v6);
}

- (void)notifyUserWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  forcing decline of claim", v2, v3, v4, v5, v6);
}

- (void)notifyUserWithCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  asking the user whether we should allow claim", v2, v3, v4, v5, v6);
}

@end