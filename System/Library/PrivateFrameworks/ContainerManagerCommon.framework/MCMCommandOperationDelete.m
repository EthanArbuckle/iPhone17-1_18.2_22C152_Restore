@interface MCMCommandOperationDelete
+ (BOOL)deleteContainerRootURL:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 containerPathIdentifier:(id)a6 preferDirectDelete:(BOOL)a7 error:(id *)a8;
+ (Class)incomingMessageClass;
+ (id)commandForOperationDeleteWithContainerIdentities:(id)a3 removeAllCodeSignInfo:(BOOL)a4 context:(id)a5 resultPromise:(id)a6;
+ (unint64_t)command;
- (BOOL)_writeDeleteManifestsForItems:(id)a3 error:(id *)a4;
- (BOOL)preflightClientAllowed;
- (BOOL)removeAllCodeSignInfo;
- (BOOL)waitForDiskSpaceReclaim;
- (MCMCommandOperationDelete)initWithContainerIdentities:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandOperationDelete)initWithManifests:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandOperationDelete)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMXPCMessageOperationDelete)message;
- (NSArray)concreteContainerIdentities;
- (NSArray)containerIdentities;
- (NSMutableSet)manifests;
- (id)_codeSignIdentifiersToRemoveFor:(id)a3 amendingCumulativeIdentifiers:(id)a4;
- (id)_containerIdentities;
- (id)_containersToDeleteRecursivelyStartingWithContainerIdentities:(id)a3 error:(id *)a4;
- (id)_deleteItems:(id)a3 directDelete:(BOOL)a4 error:(id *)a5;
- (id)_deleteManifest:(id)a3;
- (id)_getManifestWithContainerIdentity:(id)a3;
- (id)_getOrCreateManifestWithContainerIdentity:(id)a3;
- (id)_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:(id)a3;
- (id)_initWithContainerIdentities:(id)a3 manifests:(id)a4 waitForDiskSpaceReclaim:(BOOL)a5 removeAllCodeSignInfo:(BOOL)a6 context:(id)a7 resultPromise:(id)a8;
- (id)_replyFromRelayToDaemonWithContainerIdentities:(id)a3;
- (void)_deleteManifestForContainerIdentity:(id)a3;
- (void)_relayContainerIdentities:(id)a3 andAmendResult:(id)a4;
- (void)_routeContainersToHandle:(id *)a3 toRelay:(id *)a4;
- (void)execute;
@end

@implementation MCMCommandOperationDelete

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifests, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_containerIdentities, 0);

  objc_storeStrong((id *)&self->_concreteContainerIdentities, 0);
}

- (NSMutableSet)manifests
{
  return self->_manifests;
}

- (MCMXPCMessageOperationDelete)message
{
  return self->_message;
}

- (BOOL)removeAllCodeSignInfo
{
  return self->_removeAllCodeSignInfo;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (BOOL)waitForDiskSpaceReclaim
{
  return self->_waitForDiskSpaceReclaim;
}

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (BOOL)_writeDeleteManifestsForItems:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v26 = a4;
    id obj = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v36;
    while (2)
    {
      uint64_t v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        v13 = objc_msgSend(v12, "cacheEntry", v26);
        v14 = [v13 containerPath];
        v15 = [v14 userIdentity];

        v16 = [(MCMCommand *)self context];
        v17 = [v16 userIdentityCache];
        v18 = [v17 libraryRepairForUserIdentity:v15];

        v19 = [v12 manifest];
        id v29 = v11;
        v20 = [v19 deleteManifestAfterWritingUsingLibraryRepairForUser:v18 error:&v29];
        id v8 = v29;

        BOOL v21 = v20 != 0;
        if (!v20)
        {
          v22 = container_log_handle_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v24 = [v12 cacheEntry];
            v25 = [v24 containerIdentity];
            *(_DWORD *)buf = 138412546;
            id v31 = v8;
            __int16 v32 = 2112;
            v33 = v25;
            _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Failed to write delete manifest; error = %@, identity = %@",
              buf,
              0x16u);
          }
          id v5 = obj;
          goto LABEL_13;
        }
        [v12 setManifest:v20];

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      id v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }
LABEL_13:

    if (v26 && v8)
    {
      id v8 = v8;
      id *v26 = v8;
    }
  }
  else
  {

    id v8 = 0;
    BOOL v21 = 1;
  }

  return v21;
}

- (void)_deleteManifestForContainerIdentity:(id)a3
{
  id v9 = a3;
  v4 = [(MCMCommandOperationDelete *)self manifests];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(MCMCommandOperationDelete *)self _getManifestWithContainerIdentity:v9];
      if (v6)
      {
        uint64_t v7 = [(MCMCommandOperationDelete *)self _deleteManifest:v6];
        if (v7)
        {
          id v8 = [(MCMCommandOperationDelete *)self manifests];
          [v8 removeObject:v6];
        }
      }
    }
  }
}

- (id)_deleteManifest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MCMCommand *)self context];
  uint64_t v6 = [v5 userIdentityCache];
  uint64_t v7 = [v4 concreteContainerIdentity];
  id v8 = [v7 userIdentity];
  id v9 = [v6 libraryRepairForUserIdentity:v8];

  id v15 = 0;
  uint64_t v10 = [v4 deleteManifestAfterRemovingUsingLibraryRepairForUser:v9 error:&v15];
  id v11 = v15;
  if (!v10)
  {
    v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v4 concreteContainerIdentity];
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Could not remove delete manifest; error = %@, identity = %@",
        buf,
        0x16u);
    }
  }

  return v10;
}

- (id)_getOrCreateManifestWithContainerIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCMCommandOperationDelete *)self _getManifestWithContainerIdentity:v4];
  if (!v5)
  {
    uint64_t v6 = [MCMDeleteManifest alloc];
    uint64_t v7 = [(MCMCommand *)self context];
    id v8 = [v7 userIdentityCache];
    uint64_t v5 = [(MCMDeleteManifest *)v6 initWithConcreteContainerIdentity:v4 userIdentityCache:v8];
  }

  return v5;
}

- (id)_getManifestWithContainerIdentity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(MCMCommandOperationDelete *)self manifests];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 concreteContainerIdentity];
        char v11 = [v10 isEqualToContainerIdentity:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25 = objc_opt_new();
  uint64_t v5 = (void *)[(id)gCodeSigningMapping copyReferenceCountSetForContainerClass:7];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * v6);
        id v8 = [(id)gCodeSigningMapping groupContainerIdentifiersAssociatedWithIdentifier:v7 containerClass:7];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              [v5 removeObject:v13];
              uint64_t v14 = [v5 countForObject:v13];
              if (v14)
              {
                uint64_t v15 = v14;
                long long v16 = container_log_handle_for_category();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v30 = v13;
                  __int16 v31 = 2048;
                  uint64_t v32 = v15;
                  __int16 v33 = 2112;
                  uint64_t v34 = v7;
                  _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_INFO, "Ref count for [%@] will reach %lu after removing [%@]", buf, 0x20u);
                }
              }
              else
              {
                long long v17 = [(MCMCommand *)self context];
                uint64_t v18 = [v17 userIdentityCache];
                v26[0] = MEMORY[0x1E4F143A8];
                v26[1] = 3221225472;
                v26[2] = __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke;
                v26[3] = &unk_1E6A7F1B0;
                v26[4] = self;
                v26[5] = v13;
                uint64_t v28 = 7;
                v26[6] = v7;
                id v27 = v25;
                [v18 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v26];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v35 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v23);
  }

  v19 = (void *)[v25 copy];

  return v19;
}

void __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v4 globalConfiguration];
  uint64_t v6 = [v5 staticConfig];
  uint64_t v7 = [v6 configForContainerClass:*(void *)(a1 + 64)];

  uint64_t v20 = 1;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) context];
  uint64_t v10 = [v9 userIdentityCache];
  uint64_t v11 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v3 identifier:v8 containerConfig:v7 platform:0 transient:0 userIdentityCache:v10 error:&v20];

  v12 = container_log_handle_for_category();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      long long v16 = [v3 shortDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v16;
      _os_log_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEFAULT, "Ref count for [%@] will reach zero after removing [%@]; queueing ui=%@ for delete.",
        buf,
        0x20u);
    }
    [*(id *)(a1 + 56) addObject:v11];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = v20;
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      uint64_t v26 = error_description;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Could not generate identity for [%@] during group reconciliation; error = (%llu) %s",
        buf,
        0x20u);
    }
  }
}

- (id)_deleteItems:(id)a3 directDelete:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(MCMCommand *)self context];
  v49 = [v8 clientIdentity];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D9478DF0]();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v7;
  uint64_t v56 = [obj countByEnumeratingWithState:&v72 objects:v71 count:16];
  if (v56)
  {
    v50 = self;
    id v9 = 0;
    uint64_t v55 = *(void *)v73;
    unsigned int v51 = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v73 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "cacheEntry", context);
        uint64_t v13 = [v12 containerPath];
        v60 = [v12 identifier];
        uint64_t v14 = [v13 userIdentity];
        uint64_t v15 = [v13 containerPathIdentifier];
        uint64_t v16 = [v13 containerClass];
        uint64_t v17 = [v13 containerRootURL];
        [v12 containerIdentity];
        v59 = v58 = (void *)v15;
        id v62 = v9;
        v57 = (void *)v17;
        LODWORD(v15) = +[MCMCommandOperationDelete deleteContainerRootURL:v17 userIdentity:v14 containerClass:v16 containerPathIdentifier:v15 preferDirectDelete:v5 error:&v62];
        uint64_t v18 = v5;
        id v19 = v62;

        if (!v15)
        {
          id v9 = v19;
LABEL_24:
          uint64_t v5 = v18;
          goto LABEL_28;
        }
        v54 = v19;
        uint64_t v20 = container_log_handle_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v21 = [v57 path];
          *(_DWORD *)buf = 138412546;
          v64 = v21;
          __int16 v65 = 2112;
          id v66 = v59;
          _os_log_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] %@", buf, 0x16u);
        }
        uint64_t v22 = container_log_handle_for_category();
        if (os_signpost_enabled(v22))
        {
          __int16 v23 = [v49 codeSignInfo];
          uint64_t v24 = [v23 identifier];
          __int16 v25 = (void *)v24;
          *(_DWORD *)buf = 138478595;
          uint64_t v26 = @"<unknown>";
          if (v24) {
            uint64_t v26 = (__CFString *)v24;
          }
          v64 = v58;
          __int16 v65 = 2113;
          id v66 = v60;
          __int16 v67 = 2050;
          uint64_t v68 = v16;
          __int16 v69 = 2113;
          v70 = v26;
          _os_signpost_emit_with_name_impl(&dword_1D7739000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DeletedContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", buf, 0x2Au);
        }
        [v52 addObject:v12];
        uint64_t v27 = [v11 codeSignIdentifiersToRemove];
        if (v27)
        {
          uint64_t v28 = (void *)v27;
          id v29 = [v11 codeSignIdentifiersToRemove];
          uint64_t v30 = [v29 count];

          if (v30)
          {
            __int16 v31 = container_log_handle_for_category();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v11 codeSignIdentifiersToRemove];
              *(_DWORD *)buf = 138412290;
              v64 = v32;
              _os_log_impl(&dword_1D7739000, v31, OS_LOG_TYPE_DEFAULT, "Removing codesign info for [%@]", buf, 0xCu);
            }
            __int16 v33 = (void *)gCodeSigningMapping;
            uint64_t v34 = [v11 codeSignIdentifiersToRemove];
            id v35 = (id)[v33 removeCodeSigningDictionaryForIdentifiers:v34];
          }
        }
        long long v36 = [v11 manifest];

        if (v36)
        {
          long long v37 = [v11 manifest];
          long long v38 = v50;
          id v39 = [(MCMCommandOperationDelete *)v50 _deleteManifest:v37];
        }
        else
        {
          long long v37 = container_log_handle_for_category();
          long long v38 = v50;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = [v12 containerIdentity];
            *(_DWORD *)buf = 138412290;
            v64 = v45;
            _os_log_debug_impl(&dword_1D7739000, v37, OS_LOG_TYPE_DEBUG, "No delete manifest URL; identity = %@",
              buf,
              0xCu);
          }
        }
        uint64_t v18 = v51;

        v40 = [(MCMCommand *)v38 context];
        long long v41 = [v40 containerCache];
        uint64_t v42 = [v13 transient];
        id v61 = 0;
        char v43 = [v41 removeContainerForUserIdentity:v14 contentClass:v16 identifier:v60 transient:v42 error:&v61];
        id v9 = v61;

        if (v43) {
          goto LABEL_24;
        }
        long long v44 = container_log_handle_for_category();
        uint64_t v5 = v51;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v59;
          __int16 v65 = 2112;
          id v66 = v9;
          _os_log_error_impl(&dword_1D7739000, v44, OS_LOG_TYPE_ERROR, "Failed to remove from cache %@; error = %@",
            buf,
            0x16u);
        }

        id v9 = 0;
LABEL_28:
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v72 objects:v71 count:16];
      if (!v56) {
        goto LABEL_32;
      }
    }
  }
  id v9 = 0;
LABEL_32:

  if (a5 && v9) {
    *a5 = v9;
  }

  return v52;
}

- (id)_containersToDeleteRecursivelyStartingWithContainerIdentities:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [v5 allObjects];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v34 = v5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v38 = [MEMORY[0x1E4F1CA80] set];
  long long v36 = v8;
  long long v37 = v9;
  id v35 = self;
  while (1)
  {
    uint64_t v10 = [v8 lastObject];
    [v8 removeLastObject];
    if (v10)
    {
      do
      {
        uint64_t v11 = [v10 containerIdentity];
        char v12 = [v9 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = [v10 containerIdentity];
          [v9 addObject:v13];

          uint64_t v14 = [(MCMCommand *)self context];
          uint64_t v15 = [v14 containerCache];
          id v40 = 0;
          uint64_t v16 = [v15 entryForContainerIdentity:v10 error:&v40];
          id v39 = v40;

          if (v16 && ([v16 metadataMinimal], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v18 = (void *)v17;
            id v19 = [(MCMCommandOperationDelete *)self _codeSignIdentifiersToRemoveFor:v17 amendingCumulativeIdentifiers:v38];
            uint64_t v20 = [v16 containerIdentity];
            BOOL v21 = [(MCMCommandOperationDelete *)self _getOrCreateManifestWithContainerIdentity:v20];

            do
            {
              uint64_t v22 = [[MCMCommandOperationDeleteItem alloc] initWithCacheEntry:v16 codeSignIdentifiersToRemove:v19 manifest:v21];
              if (v22)
              {
                [v6 addObject:v22];
              }
              else
              {
                __int16 v23 = container_log_handle_for_category();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  __int16 v25 = [v18 shortDescription];
                  *(_DWORD *)buf = 138412290;
                  id v42 = v25;
                  _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Could not create delete item; metadata = %@",
                    buf,
                    0xCu);
                }
              }

              uint64_t v24 = [v16 next];

              uint64_t v16 = (void *)v24;
            }
            while (v24);

            self = v35;
            uint64_t v8 = v36;
            id v9 = v37;
            uint64_t v27 = v39;
          }
          else
          {
            uint64_t v26 = container_log_handle_for_category();
            uint64_t v27 = v39;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v39;
              __int16 v43 = 2112;
              long long v44 = v10;
              _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Could not find container from container identity queued for delete; error = %@, identity = %@",
                buf,
                0x16u);
            }

            if ([v39 type] == 21) {
              [(MCMCommandOperationDelete *)self _deleteManifestForContainerIdentity:v10];
            }
          }
        }
        uint64_t v28 = [v8 lastObject];

        [v8 removeLastObject];
        uint64_t v10 = (void *)v28;
      }
      while (v28);
    }
    if (!v38)
    {
      uint64_t v30 = 0;
      goto LABEL_28;
    }
    if (![v38 count]) {
      break;
    }
    id v29 = [(MCMCommandOperationDelete *)self _groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:v38];
    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];

    if (!v29 || ![v29 count])
    {

      goto LABEL_28;
    }
    __int16 v31 = [v29 allObjects];
    [v8 addObjectsFromArray:v31];

    id v9 = v37;
    long long v38 = v30;
  }
  uint64_t v30 = v38;
LABEL_28:
  uint64_t v32 = (void *)[v6 copy];

  return v32;
}

- (id)_codeSignIdentifiersToRemoveFor:(id)a3 amendingCumulativeIdentifiers:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 containerClass];
  if (v8 > 0xB || ((1 << v8) & 0xED4) == 0)
  {
    id v11 = 0;
LABEL_19:
    char v12 = 0;
    goto LABEL_29;
  }
  uint64_t v10 = [v6 containerClass];
  id v11 = 0;
  char v12 = 0;
  if (v10 != 7 && v10 != 13)
  {
    uint64_t v13 = [(MCMCommand *)self context];
    uint64_t v14 = [v13 containerCache];
    uint64_t v15 = [v6 containerIdentity];
    uint64_t v16 = [v14 countContainersForOtherUserIdentitiesWithIdentity:v15 error:0];

    id v11 = 0;
    char v12 = 0;
    if (!v16)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v18 = [v6 identifier];
      char v12 = [v17 setWithObject:v18];

      id v19 = [(id)gCodeSigningMapping childParentMapCache];
      uint64_t v20 = [v6 identifier];
      BOOL v21 = [v19 childBundleIdentifiersForParentIdentifier:v20];

      if (v21) {
        [v12 unionSet:v21];
      }

      if (!v12)
      {
        id v11 = 0;
        goto LABEL_29;
      }
      if ([v6 transient])
      {
        uint64_t v43 = 1;
        uint64_t v22 = [v6 userIdentity];
        __int16 v23 = [v6 identifier];
        id v40 = [v6 containerIdentity];
        uint64_t v24 = [v40 containerConfig];
        uint64_t v25 = [v6 platform];
        uint64_t v26 = [(MCMCommand *)self context];
        uint64_t v27 = [v26 userIdentityCache];
        uint64_t v28 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v22 identifier:v23 containerConfig:v24 platform:v25 transient:0 userIdentityCache:v27 error:&v43];

        if (v28)
        {
          id v29 = [(MCMCommand *)self context];
          uint64_t v30 = [v29 containerCache];
          id v42 = 0;
          __int16 v31 = [v30 entryForContainerIdentity:v28 error:&v42];
          id v32 = v42;

          if (v31)
          {
            id v41 = v32;
            __int16 v33 = [v31 metadataWithError:&v41];
            id v11 = v41;

            if (v33)
            {
              uint64_t v34 = container_log_handle_for_category();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                id v35 = [v6 identifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v45 = v35;
                __int16 v46 = 2112;
                uint64_t v47 = 0;
                _os_log_impl(&dword_1D7739000, v34, OS_LOG_TYPE_DEFAULT, "Skipping removal of code sign mapping since container to be deleted [%@] is transient and there's a permanent one; error = %@",
                  buf,
                  0x16u);
              }
              goto LABEL_19;
            }
          }
          else
          {
            id v11 = v32;
          }

          goto LABEL_27;
        }
        long long v36 = container_log_handle_for_category();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          id v39 = [v6 shortDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v45 = v39;
          __int16 v46 = 2048;
          uint64_t v47 = v43;
          _os_log_error_impl(&dword_1D7739000, v36, OS_LOG_TYPE_ERROR, "Could not construct container identity from %@ to check for permanent copy: %llu", buf, 0x16u);
        }
      }
      id v11 = 0;
LABEL_27:
      if ([v12 count]) {
        [v7 unionSet:v12];
      }
    }
  }
LABEL_29:
  long long v37 = (void *)[v12 copy];

  return v37;
}

- (id)_containerIdentities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMCommandOperationDelete *)self containerIdentities];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = [(MCMCommandOperationDelete *)self manifests];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) concreteContainerIdentity];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];

  return v14;
}

- (id)_replyFromRelayToDaemonWithContainerIdentities:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __s[1] = 0;
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v77 objects:v76 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v78 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = v10;
          *(void *)uint64_t v48 = 1;
          uint64_t v12 = [v11 createLibsystemContainerWithError:v48];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = xpc_dictionary_create(0, 0, 0);
            container_xpc_encode_container_object();
            xpc_array_append_value(v4, v14);
            MEMORY[0x1D94785B0](v13);
          }
          else
          {
            uint64_t v14 = container_log_handle_for_category();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = *(void *)v48;
              uint64_t error_description = container_get_error_description();
              *(_DWORD *)buf = 138412802;
              *(void *)&v68[0] = v11;
              WORD4(v68[0]) = 2048;
              *(void *)((char *)v68 + 10) = v15;
              WORD1(v68[1]) = 2080;
              *(void *)((char *)&v68[1] + 4) = error_description;
              _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not allocate container object for delete relay using %@: (%llu) %s", buf, 0x20u);
            }
          }
        }
        else
        {
          uint64_t v11 = container_log_handle_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&v68[0] = v10;
            _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Non-libsystem identity encountered when constructing delete relay: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v77 objects:v76 count:16];
    }
    while (v7);
  }

  long long v17 = self;
  uint64_t v18 = [(MCMCommandOperationDelete *)self waitForDiskSpaceReclaim];
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v19, "Command", 3uLL);
  xpc_dictionary_set_uint64(v19, "Flags", v18);
  xpc_dictionary_set_value(v19, "ContainersArray", v4);
  long long v20 = container_log_handle_for_category();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1D9479780](v19);
    __s[0] = v22;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v73 = 0u;
    int current_persona_originator_info = voucher_get_current_persona_originator_info();
    int v45 = DWORD2(v73);
    int v43 = DWORD1(v74);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    int v40 = DWORD1(v71);
    int v41 = DWORD2(v70);
    uint64_t v69 = 0;
    memset(v68, 0, sizeof(v68));
    *(_DWORD *)buf = 2;
    int current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      id v39 = "<unknown>";
      uint64_t v26 = "NOPERSONA";
    }
    else
    {
      if ((DWORD1(v68[0]) - 2) > 4) {
        uint64_t v26 = "<unknown>";
      }
      else {
        uint64_t v26 = off_1E6A7F1D0[DWORD1(v68[0]) - 2];
      }
      id v39 = (char *)&v68[5] + 4;
    }
    uint64_t v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = v45 & ~(current_persona_originator_info >> 31);
      int v29 = v43 & ~(current_persona_originator_info >> 31);
      int v44 = v41 & ~(current_persona_proximate_info >> 31);
      int v46 = v40 & ~(current_persona_proximate_info >> 31);
      uid_t v30 = geteuid();
      uid_t v31 = getuid();
      *(_DWORD *)uint64_t v48 = 67111427;
      *(_DWORD *)&v48[4] = current_persona;
      __int16 v49 = 2082;
      v50 = v26;
      __int16 v51 = 2082;
      id v52 = v39;
      __int16 v53 = 1024;
      int v54 = v28;
      long long v17 = self;
      __int16 v55 = 1024;
      int v56 = v29;
      __int16 v57 = 1024;
      int v58 = v44;
      __int16 v59 = 1024;
      int v60 = v46;
      __int16 v61 = 1024;
      uid_t v62 = v30;
      __int16 v63 = 1024;
      uid_t v64 = v31;
      __int16 v65 = 2081;
      id v66 = v22;
      _os_log_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEFAULT, "Container delete; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proxi"
        "mate [pid = %d, personaid = %d], euid = %d, uid = %d, message = %{private}s",
        v48,
        0x4Au);
    }

    if (v22)
    {
      free(v22);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  *(void *)uint64_t v48 = 1;
  container_xpc_set_use_shared_connection();
  id v32 = [(MCMCommand *)v17 context];
  __int16 v33 = [v32 clientIdentity];
  [v33 createLibsystemClient];

  uint64_t v34 = (void *)container_client_copy_encoded_xpc_object();
  if (v34)
  {
    id v35 = 0;
    if (*(void *)v48 == 1)
    {
      xpc_dictionary_set_value(v19, "ProxyForClient", v34);
      id v35 = (void *)container_xpc_send_sync_message();
    }
  }
  else
  {
    id v35 = 0;
  }
  long long v36 = (void *)container_error_copy_unlocalized_description();
  *(void *)&long long v73 = v36;
  long long v37 = container_log_handle_for_category();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&v68[0] = v36;
    _os_log_impl(&dword_1D7739000, v37, OS_LOG_TYPE_DEFAULT, "Delete relay response: %s", buf, 0xCu);
  }

  if (v36)
  {
    free(v36);
    memset_s(&v73, 8uLL, 0, 8uLL);
  }
  container_free_client();
  container_error_free();

  return v35;
}

- (void)_routeContainersToHandle:(id *)a3 toRelay:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = [(MCMCommandOperationDelete *)self _containerIdentities];
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v13 = [v12 disposition];
        if (v13)
        {
          if (v13 == 2)
          {
            uint64_t v14 = v6;
          }
          else
          {
            if (v13 != 1) {
              continue;
            }
            uint64_t v14 = v5;
          }
          [v14 addObject:v12];
        }
        else
        {
          uint64_t v15 = container_log_handle_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = [(MCMCommand *)self context];
            long long v17 = [v16 clientIdentity];
            *(_DWORD *)buf = 138412546;
            uint64_t v22 = v12;
            __int16 v23 = 2112;
            uint64_t v24 = v17;
            _os_log_fault_impl(&dword_1D7739000, v15, OS_LOG_TYPE_FAULT, "Attempt to delete container for different user or container class not supported, ignored: %@; client: %@",
              buf,
              0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v9);
  }

  if (a3) {
    *a3 = (id)[v5 copy];
  }
  if (a4) {
    *a4 = (id)[v6 copy];
  }
}

- (void)_relayContainerIdentities:(id)a3 andAmendResult:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    id v7 = [(MCMCommandOperationDelete *)self _replyFromRelayToDaemonWithContainerIdentities:v8];
    if (v7) {
      [v6 mergeWithXPCResult:v7];
    }
  }
}

- (void)execute
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  id v54 = 0;
  id v55 = 0;
  [(MCMCommandOperationDelete *)self _routeContainersToHandle:&v55 toRelay:&v54];
  id v3 = (MCMCommandOperationReclaimDiskSpace *)v55;
  id v47 = v54;
  uint64_t v48 = v3;
  if (![(MCMCommandOperationReclaimDiskSpace *)v3 count])
  {
    id v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to delete locally", buf, 2u);
    }

    id v5 = 0;
    id v9 = 0;
    goto LABEL_45;
  }
  xpc_object_t v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uid_t v62 = v3;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Queueing containers for deletion: %@", buf, 0xCu);
  }

  id v53 = 0;
  id v5 = [(MCMCommandOperationDelete *)self _containersToDeleteRecursivelyStartingWithContainerIdentities:v3 error:&v53];
  id v6 = (MCMCommandOperationReclaimDiskSpace *)v53;
  if (!v5)
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uid_t v62 = v6;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v3;
      _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Failed to collect identities for deletion; error = %@, staring set = %@",
        buf,
        0x16u);
    }

    id v9 = 0;
    id v5 = 0;
    if (v6) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }
  if (![(MCMCommandOperationReclaimDiskSpace *)v5 count])
  {
    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uid_t v62 = v3;
      _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "Collected zero identities for deletion; starting set = %@",
        buf,
        0xCu);
    }

    id v9 = 0;
    if (v6) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }
  id v7 = [(MCMCommandOperationDelete *)self manifests];
  if ([v7 count])
  {

LABEL_22:
    BOOL v15 = 0;
    goto LABEL_23;
  }
  BOOL v12 = (unint64_t)[(MCMCommandOperationReclaimDiskSpace *)v5 count] > 1;

  if (!v12) {
    goto LABEL_22;
  }
  id v52 = v6;
  BOOL v13 = [(MCMCommandOperationDelete *)self _writeDeleteManifestsForItems:v5 error:&v52];
  uint64_t v14 = v52;

  if (!v13)
  {
    if ([(MCMCommandOperationReclaimDiskSpace *)v14 category] != 1
      || [(MCMCommandOperationReclaimDiskSpace *)v14 POSIXerrno] != 28)
    {
      uint64_t v22 = container_log_handle_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uid_t v62 = v14;
        __int16 v63 = 2112;
        uint64_t v64 = (uint64_t)v5;
        _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Failed to write manifest for deletion; error = %@, containers = %@",
          buf,
          0x16u);
      }

      goto LABEL_34;
    }
    BOOL v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uid_t v62 = v5;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Failed to write manifest for deletion because ENOSPC, ignoring and enabling direct delete; containers = %@",
        buf,
        0xCu);
    }

    uint64_t v14 = 0;
  }
  BOOL v15 = !v13;
  id v6 = v14;
LABEL_23:
  uint64_t v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uid_t v62 = v5;
    _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Deleting containers: %@", buf, 0xCu);
  }

  __int16 v51 = v6;
  id v9 = [(MCMCommandOperationDelete *)self _deleteItems:v5 directDelete:v15 error:&v51];
  uint64_t v14 = v51;

  if (!v9)
  {
    uint64_t v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uid_t v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v5;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Failed to delete containers; error = %@, containers = %@",
        buf,
        0x16u);
    }

LABEL_34:
    id v9 = 0;
    goto LABEL_35;
  }
  if (![v9 count])
  {
    long long v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uid_t v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v5;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Deleted zero containers; error = %@, containers = %@",
        buf,
        0x16u);
    }
  }
LABEL_35:
  id v6 = v14;
  if (v14)
  {
LABEL_36:
    xpc_object_t v19 = [(MCMResultBase *)[MCMResultOperationDelete alloc] initWithError:v6];
    int v20 = 0;
    goto LABEL_55;
  }
LABEL_45:
  __int16 v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v9 = v9;
  uint64_t v25 = [v9 countByEnumeratingWithState:&v57 objects:v56 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v9);
        }
        long long v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        long long v29 = [v28 containerPath];
        [v23 addObject:v29];

        uint64_t v30 = [v28 containerIdentity];
        [v24 addObject:v30];
      }
      uint64_t v25 = [v9 countByEnumeratingWithState:&v57 objects:v56 count:16];
    }
    while (v25);
  }

  uid_t v31 = [MCMResultOperationDelete alloc];
  id v32 = [(MCMCommand *)self context];
  __int16 v33 = [v32 clientIdentity];
  uint64_t v34 = [(MCMResultWithContainersArrayBase *)v31 initWithContainerPaths:v23 containerIdentities:v24 includePath:1 clientIdentity:v33 skipSandboxExtensions:1];

  [(MCMCommandOperationDelete *)self _relayContainerIdentities:v47 andAmendResult:v34];
  id v35 = [MCMResultPromise alloc];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __36__MCMCommandOperationDelete_execute__block_invoke;
  v49[3] = &unk_1E6A7F188;
  v49[4] = self;
  xpc_object_t v19 = v34;
  v50 = v19;
  long long v36 = [(MCMResultPromise *)v35 initWithCompletion:v49];
  long long v37 = [MCMCommandOperationReclaimDiskSpace alloc];
  BOOL v38 = [(MCMCommandOperationDelete *)self waitForDiskSpaceReclaim];
  id v39 = [(MCMCommand *)self context];
  int v40 = [(MCMCommand *)self reply];
  int v41 = [(MCMCommandOperationReclaimDiskSpace *)v37 initWithAsynchronously:!v38 context:v39 resultPromise:v36 handoffForReply:v40];

  id v42 = container_log_handle_for_category();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v45 = [(id)objc_opt_class() command];
    *(_DWORD *)buf = 134218240;
    uid_t v62 = v41;
    __int16 v63 = 2048;
    uint64_t v64 = v45;
    _os_log_debug_impl(&dword_1D7739000, v42, OS_LOG_TYPE_DEBUG, "Completed delete, executing command <%p; %llu>...",
      buf,
      0x16u);
  }

  [(MCMCommandOperationReclaimDiskSpace *)v41 execute];
  id v6 = 0;
  int v20 = 1;
LABEL_55:
  int v43 = +[MCMTestLocks sharedInstance];
  [v43 waitOnLock:11];

  if (!v20 || ![(MCMCommandOperationDelete *)self waitForDiskSpaceReclaim])
  {
    int v44 = [(MCMCommand *)self resultPromise];
    [v44 completeWithResult:v19];
  }
}

id __36__MCMCommandOperationDelete_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) waitForDiskSpaceReclaim])
  {
    xpc_object_t v4 = [*(id *)(a1 + 32) resultPromise];
    [v4 completeWithResult:*(void *)(a1 + 40)];
  }

  return v3;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(MCMCommand *)self context];
  xpc_object_t v4 = [v3 clientIdentity];

  id v5 = [v4 codeSignInfo];
  id v6 = [v5 entitlements];

  if ([v6 allowed])
  {
    BOOL v7 = 1;
  }
  else if ([v6 canDelete])
  {
    id v8 = [v4 codeSignInfo];
    id v9 = [v8 identifier];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = [(MCMCommandOperationDelete *)self containerIdentities];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v22 = v4;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = [v15 identifier];
          char v17 = [v9 isEqualToString:v16];

          uint64_t v18 = [v15 containerClass];
          xpc_object_t v19 = [v15 identifier];
          int v20 = [v6 isEntitledForLookupWithClass:v18 identifier:v19];

          if ((v17 & 1) == 0 && !v20)
          {
            BOOL v7 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      BOOL v7 = 1;
LABEL_16:
      xpc_object_t v4 = v22;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (MCMCommandOperationDelete)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandOperationDelete;
  uint64_t v10 = [(MCMCommand *)&v16 initWithMessage:v9 context:a4 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v9 concreteContainerIdentities];
    containerIdentities = v10->_containerIdentities;
    v10->_containerIdentities = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    manifests = v10->_manifests;
    v10->_manifests = (NSMutableSet *)v13;

    v10->_removeAllCodeSignInfo = 0;
    v10->_waitForDiskSpaceReclaim = [v9 waitForDiskSpaceReclaim];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

- (id)_initWithContainerIdentities:(id)a3 manifests:(id)a4 waitForDiskSpaceReclaim:(BOOL)a5 removeAllCodeSignInfo:(BOOL)a6 context:(id)a7 resultPromise:(id)a8
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MCMCommandOperationDelete;
  objc_super v16 = [(MCMCommand *)&v23 initWithContext:a7 resultPromise:a8];
  uint64_t v17 = v16;
  if (v16)
  {
    if (v14) {
      uint64_t v18 = v14;
    }
    else {
      uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v16->_containerIdentities, v18);
    xpc_object_t v19 = (void *)[v15 mutableCopy];
    int v20 = v19;
    if (!v19)
    {
      int v20 = [MEMORY[0x1E4F1CA80] set];
    }
    objc_storeStrong((id *)&v17->_manifests, v20);
    if (!v19) {

    }
    v17->_removeAllCodeSignInfo = a6;
    v17->_waitForDiskSpaceReclaim = a5;
    message = v17->_message;
    v17->_message = 0;
  }
  return v17;
}

- (MCMCommandOperationDelete)initWithManifests:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)[(MCMCommandOperationDelete *)self _initWithContainerIdentities:0 manifests:a3 waitForDiskSpaceReclaim:a4 removeAllCodeSignInfo:a5 context:a6 resultPromise:a7];
}

- (MCMCommandOperationDelete)initWithContainerIdentities:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)[(MCMCommandOperationDelete *)self _initWithContainerIdentities:a3 manifests:0 waitForDiskSpaceReclaim:a4 removeAllCodeSignInfo:a5 context:a6 resultPromise:a7];
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 3;
}

+ (BOOL)deleteContainerRootURL:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 containerPathIdentifier:(id)a6 preferDirectDelete:(BOOL)a7 error:(id *)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = +[MCMFileManager defaultManager];
  if (a7)
  {
    objc_super v16 = 0;
LABEL_17:
    id v26 = 0;
    goto LABEL_18;
  }
  id v41 = v14;
  id v17 = v13;
  uint64_t v18 = a8;
  xpc_object_t v19 = v17;
  int v20 = +[MCMContainerClassDeletedPath containerPathForUserIdentity:containerClass:](MCMContainerClassDeletedPath, "containerPathForUserIdentity:containerClass:");
  id v45 = 0;
  char v21 = [v20 createIfNecessaryWithError:&v45];
  id v22 = v45;
  if ((v21 & 1) == 0)
  {
    objc_super v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v22;
      __int16 v48 = 2112;
      id v49 = v20;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Failed to create deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    id v22 = 0;
  }
  uint64_t v24 = [v20 classURL];
  id v44 = v22;
  long long v25 = [v15 createTemporaryDirectoryInDirectoryURL:v24 withNamePrefix:@"deleting." error:&v44];
  id v26 = v44;

  if (v25)
  {
    char v27 = v21 ^ 1;
    a8 = v18;
  }
  else
  {
    uint64_t v28 = container_log_handle_for_category();
    a8 = v18;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v26;
      __int16 v48 = 2112;
      id v49 = v20;
      _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Failed to create unique deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    id v26 = 0;
    char v27 = 1;
  }
  id v13 = v19;
  id v14 = v41;
  objc_super v16 = [v25 URLByAppendingPathComponent:v41 isDirectory:1];

  if ((v27 & 1) == 0)
  {
    id v43 = v26;
    char v29 = [v15 moveItemAtURL:v12 toURL:v16 error:&v43];
    id v30 = v43;

    if (v29)
    {
LABEL_19:
      __int16 v33 = 0;
      BOOL v34 = 1;
      goto LABEL_25;
    }
    uid_t v31 = container_log_handle_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v39 = [v12 path];
      int v40 = [v16 path];
      *(_DWORD *)buf = 138412802;
      id v47 = v39;
      __int16 v48 = 2112;
      id v49 = v40;
      __int16 v50 = 2112;
      id v51 = v30;
      _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "Couldn't stage for deletion from [%@] to [%@]; trying a direct delete instead: %@",
        buf,
        0x20u);
    }
    goto LABEL_17;
  }
LABEL_18:
  id v42 = v26;
  char v32 = [v15 removeItemAtURL:v12 error:&v42];
  id v30 = v42;

  if (v32) {
    goto LABEL_19;
  }
  id v35 = container_log_handle_for_category();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    BOOL v38 = [v12 path];
    *(_DWORD *)buf = 138412546;
    id v47 = v38;
    __int16 v48 = 2112;
    id v49 = v30;
    _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Failed to delete container at %@: %@", buf, 0x16u);
  }
  long long v36 = [[MCMError alloc] initWithNSError:v30 url:v12 defaultErrorType:28];
  __int16 v33 = v36;
  if (a8)
  {
    __int16 v33 = v36;
    BOOL v34 = 0;
    *a8 = v33;
  }
  else
  {
    BOOL v34 = 0;
  }
LABEL_25:

  return v34;
}

+ (id)commandForOperationDeleteWithContainerIdentities:(id)a3 removeAllCodeSignInfo:(BOOL)a4 context:(id)a5 resultPromise:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithContainerIdentities:v12 waitForDiskSpaceReclaim:0 removeAllCodeSignInfo:v7 context:v11 resultPromise:v10];

  return v13;
}

@end