@interface MCMCodeSigningMapping
+ (id)_moveDBIfNeededFromURL:(id)a3 queue:(id)a4 error:(id *)a5;
+ (id)codeSignMappingWithError:(id *)a3;
- (BOOL)_onQueue_addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)_onQueue_identifierHasCallerRegisteredEntitlements:(id)a3;
- (BOOL)_onQueue_invalidateCodeSigningInfoForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 oldEntitlements:(id)a6 error:(id *)a7 reconcileHandler:(id)a8;
- (BOOL)_onQueue_removeAllAdvanceCopiesWithError:(id *)a3;
- (BOOL)_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4;
- (BOOL)_onQueue_removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)_onqueue_enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (BOOL)enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)identifierHasCallerRegisteredEntitlements:(id)a3;
- (BOOL)identifierHasSystemContainer:(id)a3;
- (BOOL)invalidateCodeSigningInfoForIdentifier:(id)a3 withError:(id *)a4;
- (BOOL)invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3 withError:(id *)a4;
- (BOOL)removeAllAdvanceCopiesWithError:(id *)a3;
- (BOOL)removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4;
- (BOOL)removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7;
- (MCMChildParentMapCache)childParentMapCache;
- (MCMCodeSigningMapping)initWithUserIdentityCache:(id)a3 queue:(id)a4 mappingDB:(id)a5 childParentMapCache:(id)a6 library:(id)a7;
- (MCMManagedPath)library;
- (MCMSQLiteDB)codeSigningMappingDB;
- (MCMUserIdentityCache)userIdentityCache;
- (OS_dispatch_queue)queue;
- (id)_codeSigningInfoForCodeSigningEntry:(id)a3 externalRequest:(BOOL)a4;
- (id)_entitlementsFromCodeSigningEntry:(id)a3;
- (id)_onQueue_codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4;
- (id)_onQueue_codeSigningInfoForIdentifier:(id)a3 externalRequest:(BOOL)a4;
- (id)_onQueue_copyReferenceCountSetForContainerClass:(unint64_t)a3;
- (id)_onQueue_entitlementsForIdentifier:(id)a3;
- (id)_onQueue_identifiersWithError:(id *)a3;
- (id)_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3;
- (id)_onQueue_removeReferenceForGroupIdentifiers:(id)a3 containerClass:(unint64_t)a4;
- (id)_onQueue_setCodeSigningDictionaryValues:(id)a3 forIdentifiers:(id)a4;
- (id)_readCodeSigningMappingFromDiskAtURL:(id)a3;
- (id)appGroupIdentifiersForIdentifier:(id)a3;
- (id)codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4;
- (id)copyReferenceCountSetForContainerClass:(unint64_t)a3;
- (id)entitlementsForIdentifier:(id)a3;
- (id)getCodeSigningInfoForIdentifier:(id)a3;
- (id)groupContainerIdentifiersAssociatedWithIdentifier:(id)a3 containerClass:(unint64_t)a4;
- (id)identifiersWithError:(id *)a3;
- (id)processCallerRegisteredEntitlements:(id)a3 identifier:(id)a4 error:(id *)a5;
- (id)processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 error:(id *)a6;
- (id)removeCodeSigningDictionaryForIdentifiers:(id)a3;
- (id)systemGroupIdentifiersForIdentifier:(id)a3;
- (unint64_t)_onQueue_dataContainerTypeForIdentifier:(id)a3;
- (unint64_t)dataContainerTypeForIdentifier:(id)a3;
- (unint64_t)invalidateCodeSigningInfoForAppsWithoutDataContainer;
- (void)_onQueue_handleChangeFromOldGroupContainerIds:(id)a3 toNewGroupContainerIds:(id)a4 containerClass:(unint64_t)a5 reconcileHandler:(id)a6;
- (void)_onQueue_iterateGroupIdsWithKey:(id)a3 fallBackKey:(id)a4 noReferenceKey:(id)a5 forAllIdentifiersUsingBlock:(id)a6;
- (void)_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:(id)a3;
- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5;
- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:(id)a3 containerClass:(unint64_t)a4;
- (void)_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile;
- (void)_onQueue_migrateFromMappingFileToDBIfNecessary;
- (void)_onQueue_reconcileSystemContainersWithContext:(id)a3;
- (void)migrateAppGroupIdsFromDataContainersToFile;
- (void)migrateCachedCodeSigningInfoFromBundleContainersToMapping;
- (void)performAllCodeSigningMigrationAndReconciliationWithContext:(id)a3;
- (void)setCodeSigningMappingDB:(id)a3;
@end

@implementation MCMCodeSigningMapping

uint64_t __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_dataContainerTypeForIdentifier:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_onQueue_dataContainerTypeForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v14 = 0;
  v7 = [v6 codeSigningEntryWithIdentifier:v4 error:&v14];
  id v8 = v14;

  if (v7) {
    goto LABEL_2;
  }
  v10 = [v8 domain];
  if ([v10 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v11 = [v8 code];

    if (v11 == 67)
    {
LABEL_2:
      unint64_t v9 = [v7 dataContainerClass];
      goto LABEL_10;
    }
  }
  else
  {
  }
  v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  unint64_t v9 = 0;
LABEL_10:

  return v9;
}

uint64_t __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_entitlementsForIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)appGroupIdentifiersForIdentifier:(id)a3
{
  v3 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:a3];
  id v4 = [v3 appGroupIdentifiers];

  return v4;
}

- (id)entitlementsForIdentifier:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4018;
  v43 = __Block_byref_object_dispose__4019;
  id v44 = 0;
  v5 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke;
  block[3] = &unk_1E6A806E0;
  v38 = &v39;
  block[4] = self;
  id v6 = v4;
  id v37 = v6;
  dispatch_sync(v5, block);

  if (!v40[5])
  {
    id v7 = containermanager_copy_global_configuration();
    BOOL v8 = [v7 dispositionForContainerClass:1] == 1;

    if (v8)
    {
      id v9 = containermanager_copy_global_configuration();
      v10 = [v9 staticConfig];
      uint64_t v11 = [v10 configForContainerClass:1];

      v12 = +[MCMUserIdentityCache defaultUserIdentity];
      v13 = [(MCMCodeSigningMapping *)self userIdentityCache];
      id v14 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v12 identifier:v6 containerConfig:v11 platform:0 transient:0 userIdentityCache:v13 error:0];

      if (v14)
      {
        v32 = [(id)gContainerCache entryForContainerIdentity:v14 error:0];
        v15 = [v32 metadataWithError:0];
        id v16 = v15;
        if (v15)
        {
          __int16 v17 = [v15 info];
          id v18 = [v17 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
          objc_opt_class();
          id v19 = v18;
          if (objc_opt_isKindOfClass()) {
            id v20 = v19;
          }
          else {
            id v20 = 0;
          }

          if (v20)
          {
            v21 = (void *)[v20 mutableCopy];
            v22 = container_log_handle_for_category();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v16 identifier];
              *(_DWORD *)buf = 138412290;
              v46 = v23;
              _os_log_impl(&dword_1D7739000, v22, OS_LOG_TYPE_DEFAULT, "Migrating code signing info from bundle container upon request for %@", buf, 0xCu);
            }
            v24 = [v20 objectForKeyedSubscript:@"Entitlements"];
            [v21 setObject:v24 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];

            v25 = [[MCMCodeSigningEntry alloc] initWithCodeSigningInfo:v21 andDataContainerClass:2];
            v26 = [(MCMCodeSigningMapping *)self queue];
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_100;
            v33[3] = &unk_1E6A80270;
            v33[4] = self;
            v27 = v25;
            v34 = v27;
            id v35 = v16;
            dispatch_sync(v26, v33);

            uint64_t v28 = [v21 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
            v29 = (void *)v40[5];
            v40[5] = v28;
          }
        }
      }
    }
  }
  id v30 = (id)v40[5];

  _Block_object_dispose(&v39, 8);

  return v30;
}

- (id)_onQueue_entitlementsForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MCMCodeSigningMapping *)self _onQueue_codeSigningInfoForIdentifier:v4 externalRequest:0];
  id v7 = [MCMEntitlements alloc];
  BOOL v8 = [v6 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  id v9 = containermanager_copy_global_configuration();
  v10 = [v9 classIterator];
  uint64_t v11 = [(MCMEntitlements *)v7 initWithEntitlements:v8 clientIdentifier:v4 classIterator:v10];

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_onQueue_codeSigningInfoForIdentifier:(id)a3 externalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v16 = 0;
  id v9 = [v8 codeSigningEntryWithIdentifier:v6 error:&v16];
  id v10 = v16;

  if (v9) {
    goto LABEL_2;
  }
  v12 = [v10 domain];
  if ([v12 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v13 = [v10 code];

    if (v13 == 67)
    {
LABEL_2:
      uint64_t v11 = [(MCMCodeSigningMapping *)self _codeSigningInfoForCodeSigningEntry:v9 externalRequest:v4];
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (MCMSQLiteDB)codeSigningMappingDB
{
  return self->_codeSigningMappingDB;
}

- (id)_codeSigningInfoForCodeSigningEntry:(id)a3 externalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4
    && (([v5 isPlaceholder] & 1) != 0
     || ([v6 isAdvanceCopy] & 1) != 0
     || ([v6 isInvalid] & 1) != 0
     || ([v6 isRegisteredByKernel] & 1) != 0))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v6 codeSigningInfo];
  }

  return v7;
}

- (unint64_t)dataContainerTypeForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke;
  v9[3] = &unk_1E6A806E0;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(v5, v9);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_codeSigningMappingDB, 0);
  objc_storeStrong((id *)&self->_childParentMapCache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)setCodeSigningMappingDB:(id)a3
{
  p_codeSigningMappingDB = &self->_codeSigningMappingDB;

  objc_storeStrong((id *)p_codeSigningMappingDB, a3);
}

- (MCMChildParentMapCache)childParentMapCache
{
  return self->_childParentMapCache;
}

- (BOOL)_onQueue_removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    v26 = [[MCMError alloc] initWithErrorType:20 category:4];
LABEL_9:
    BOOL v25 = 0;
    goto LABEL_10;
  }
  uint64_t v15 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v30 = 0;
  uint64_t v16 = [v15 codeSigningEntryWithIdentifier:v12 error:&v30];
  id v17 = v30;

  if (!v16)
  {
    v26 = [[MCMError alloc] initWithErrorType:67 category:3];

    goto LABEL_9;
  }
  uint64_t v28 = v17;
  id v18 = [(MCMCodeSigningMapping *)self _entitlementsFromCodeSigningEntry:v16];
  __int16 v19 = [MCMEntitlements alloc];
  id v20 = containermanager_copy_global_configuration();
  uint64_t v21 = [v20 classIterator];
  v22 = [(MCMEntitlements *)v19 initWithEntitlements:v18 clientIdentifier:v12 classIterator:v21];

  if (!v22)
  {
    v26 = [[MCMError alloc] initWithErrorType:60 category:3];

    goto LABEL_9;
  }
  id v23 = [(MCMEntitlements *)v22 copyEntitlementsDictionaryByRemovingGroupContainerOfClass:a5 groupIdentifier:v11];
  v31 = @"com.apple.MobileContainerManager.Entitlements";
  v32[0] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  id v29 = 0;
  BOOL v25 = [(MCMCodeSigningMapping *)self _onQueue_processCodeSigningInfo:v24 identifier:v12 options:0 oldEntitlements:v22 error:&v29 reconcileHandler:v13];
  v26 = (MCMError *)v29;

LABEL_10:
  return v25;
}

- (BOOL)_onQueue_addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    v24 = [[MCMError alloc] initWithErrorType:20 category:4];
LABEL_10:
    BOOL v27 = 0;
    goto LABEL_11;
  }
  uint64_t v15 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v32 = 0;
  uint64_t v16 = [v15 codeSigningEntryWithIdentifier:v12 error:&v32];
  id v29 = v32;

  unint64_t v17 = 0x1E4F1C000uLL;
  if (!v16)
  {
    BOOL v25 = +[MCMEntitlements publicEntitlementForGroupContainerClass:](MCMEntitlements, "publicEntitlementForGroupContainerClass:", a5, v29);
    id v35 = v25;
    v36[0] = v11;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

    id v18 = 0;
    v22 = 0;
    goto LABEL_8;
  }
  id v18 = [(MCMCodeSigningMapping *)self _entitlementsFromCodeSigningEntry:v16];
  __int16 v19 = [MCMEntitlements alloc];
  id v20 = containermanager_copy_global_configuration();
  uint64_t v21 = [v20 classIterator];
  v22 = [(MCMEntitlements *)v19 initWithEntitlements:v18 clientIdentifier:v12 classIterator:v21];

  if (!v22)
  {
    v24 = [[MCMError alloc] initWithErrorType:60 category:3];

    goto LABEL_10;
  }
  id v23 = -[MCMEntitlements copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:](v22, "copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:", a5, v11, v29);
  unint64_t v17 = 0x1E4F1C000;
LABEL_8:
  v33 = @"com.apple.MobileContainerManager.Entitlements";
  v34 = v23;
  v26 = [*(id *)(v17 + 2536) dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v31 = 0;
  BOOL v27 = [(MCMCodeSigningMapping *)self _onQueue_processCodeSigningInfo:v26 identifier:v12 options:0 oldEntitlements:v22 error:&v31 reconcileHandler:v13];
  v24 = (MCMError *)v31;

LABEL_11:
  return v27;
}

- (BOOL)removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v15 = [(MCMCodeSigningMapping *)self queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_1E6A7FDD8;
  v20[4] = self;
  id v21 = v12;
  v24 = &v27;
  unint64_t v25 = a5;
  v26 = a6;
  id v22 = v13;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

uint64_t __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v15 = [(MCMCodeSigningMapping *)self queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_1E6A7FDD8;
  v20[4] = self;
  id v21 = v12;
  v24 = &v27;
  unint64_t v25 = a5;
  v26 = a6;
  id v22 = v13;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

uint64_t __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_addGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_onqueue_enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x1D9478DF0]();
  id v11 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v15[3] = &unk_1E6A7FDB0;
  unint64_t v17 = a3;
  id v12 = v8;
  id v16 = v12;
  id v13 = [v11 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v15];

  if (a4 && v13) {
    *a4 = [[MCMError alloc] initWithNSError:v13 url:0 defaultErrorType:66];
  }

  return v13 == 0;
}

void __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [MCMEntitlements alloc];
  id v8 = [v6 codeSigningInfo];
  id v9 = [v8 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  id v10 = containermanager_copy_global_configuration();
  id v11 = [v10 classIterator];
  id v12 = [(MCMEntitlements *)v7 initWithEntitlements:v9 clientIdentifier:v5 classIterator:v11];

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13 == 13)
  {
    id v14 = [(MCMEntitlements *)v12 systemGroupIdentifiers];
  }
  else if (v13 == 7)
  {
    id v14 = [(MCMEntitlements *)v12 appGroupIdentifiers];
  }
  else
  {
    id v14 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v17);
  }
}

- (BOOL)enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4018;
  uint64_t v27 = __Block_byref_object_dispose__4019;
  id v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v9 = [(MCMCodeSigningMapping *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v14[3] = &unk_1E6A7FD88;
  uint64_t v16 = &v19;
  uint64_t v17 = &v23;
  v14[4] = self;
  unint64_t v18 = a3;
  id v10 = v8;
  id v15 = v10;
  dispatch_sync(v9, v14);

  int v11 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = (id) v24[5];
    int v11 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke(uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  obj[0] = *(id *)(v3 + 40);
  char v4 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_enumerateOwnersAndGroupsWithGroupClass:error:block:", v2, obj, *(void *)(a1 + 40));
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (BOOL)_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  unint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  LOBYTE(a4) = [v8 deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:a3 error:a4];

  return (char)a4;
}

- (BOOL)removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  unint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke;
  block[3] = &unk_1E6A7FD60;
  block[4] = self;
  void block[5] = &v10;
  block[6] = a3;
  block[7] = a4;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

uint64_t __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:error:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_removeAllAdvanceCopiesWithError:(id *)a3
{
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  LOBYTE(a3) = [v6 deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:a3];

  return (char)a3;
}

- (BOOL)removeAllAdvanceCopiesWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke;
  v7[3] = &unk_1E6A800E0;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

uint64_t __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeAllAdvanceCopiesWithError:", *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_onQueue_removeReferenceForGroupIdentifiers:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v27 = self;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_new();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke;
  v32[3] = &unk_1E6A7FD10;
  unint64_t v34 = a4;
  v32[4] = v27;
  id v24 = v6;
  id v33 = v24;
  v26 = (uint64_t (**)(void, void, void))MEMORY[0x1D9479020](v32);
  if (v25 && [v25 count])
  {
    unint64_t v7 = [(MCMCodeSigningMapping *)v27 _onQueue_copyReferenceCountSetForContainerClass:a4];
    if (v7)
    {
      if (a4 == 13)
      {
        uint64_t v8 = container_log_handle_for_category();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v25;
          _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "Would have removed system group container references for %@", buf, 0xCu);
        }
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v9 = v25;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v43 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v14 = [v7 countForObject:v13];
              if (v14 == 1)
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000;
                char v40 = 1;
                id v15 = container_log_handle_for_category();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id v35 = 138543618;
                  uint64_t v36 = v13;
                  __int16 v37 = 2048;
                  uint64_t v38 = 1;
                  _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %ld, including for delete", v35, 0x16u);
                }

                if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:a4])
                {
                  uint64_t v16 = [(MCMCodeSigningMapping *)v27 userIdentityCache];
                  v29[0] = MEMORY[0x1E4F143A8];
                  v29[1] = 3221225472;
                  v29[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_127;
                  v29[3] = &unk_1E6A7FD38;
                  uint64_t v31 = buf;
                  uint64_t v17 = v26;
                  v29[4] = v13;
                  id v30 = v17;
                  [v16 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v29];
                }
                else if (*(unsigned char *)(*(void *)&buf[8] + 24))
                {
                  uint64_t v19 = [(MCMCodeSigningMapping *)v27 userIdentityCache];
                  id v20 = [v19 globalSystemUserIdentity];
                  char v21 = ((uint64_t (**)(void, uint64_t, void *))v26)[2](v26, v13, v20);
                  *(unsigned char *)(*(void *)&buf[8] + 24) = v21;
                }
                else
                {
                  *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
                }
                if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
                  [v7 removeObject:v13];
                }
                _Block_object_dispose(buf, 8);
              }
              else
              {
                unint64_t v18 = container_log_handle_for_category();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v13;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v14;
                  _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %ld", buf, 0x16u);
                }
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v41 count:16];
          }
          while (v10);
        }
      }
    }
    else
    {
      unint64_t v7 = container_log_handle_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a4;
        _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to get reference count information for class: %llu", buf, 0xCu);
      }
    }
  }
  char v22 = (void *)[v24 copy];

  return v22;
}

BOOL __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 homeDirectoryExists])
  {
    id v7 = containermanager_copy_global_configuration();
    uint64_t v8 = [v7 staticConfig];
    id v9 = [v8 configForContainerClass:*(void *)(a1 + 48)];

    uint64_t v18 = 1;
    uint64_t v10 = [*(id *)(a1 + 32) userIdentityCache];
    uint64_t v11 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v6 identifier:v5 containerConfig:v9 platform:0 userIdentityCache:v10 error:&v18];

    BOOL v12 = v11 != 0;
    if (v11)
    {
      [*(id *)(a1 + 40) addObject:v11];
    }
    else
    {
      uint64_t v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v18;
        uint64_t error_description = container_get_error_description();
        uint64_t v17 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        uint64_t v22 = error_description;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2048;
        uint64_t v28 = v17;
        _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Could not generate identity for ref cnt delete of container; error = (%llu) %s, userIdentity = %@, identifier "
          "= %@, class = %llu",
          buf,
          0x34u);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_127(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

- (void)_onQueue_handleChangeFromOldGroupContainerIds:(id)a3 toNewGroupContainerIds:(id)a4 containerClass:(unint64_t)a5 reconcileHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (uint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  BOOL v12 = (void (**)(id, void *, void *))a6;
  uint64_t v13 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = objc_opt_new();
  if (!(v10 | v11))
  {
    unint64_t v11 = 0;
    uint64_t v10 = 0;
LABEL_6:
    if (!v12) {
      goto LABEL_8;
    }
LABEL_7:
    v12[2](v12, v14, v15);
    goto LABEL_8;
  }
  if ([(id)v10 isEqualToSet:v11]) {
    goto LABEL_6;
  }
  if (v11)
  {
    uint64_t v16 = (void *)[(id)v10 mutableCopy];
    uint64_t v17 = (void *)[(id)v11 mutableCopy];
    [v16 minusSet:v11];
    uint64_t v18 = [v16 copy];

    [v17 minusSet:v18];
    uint64_t v26 = [v17 copy];

    uint64_t v10 = v18;
    uint64_t v19 = (void *)v26;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [(id)v10 allObjects];
  uint64_t v21 = [(MCMCodeSigningMapping *)self _onQueue_removeReferenceForGroupIdentifiers:v20 containerClass:a5];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke;
  v29[3] = &unk_1E6A801A8;
  unint64_t v11 = v19;
  unint64_t v33 = a5;
  id v30 = (id)v11;
  uint64_t v31 = self;
  id v32 = v15;
  uint64_t v22 = (void (**)(void, void))MEMORY[0x1D9479020](v29);
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:a5])
  {
    __int16 v23 = [(MCMCodeSigningMapping *)self userIdentityCache];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_125;
    v27[3] = &unk_1E6A7FCE8;
    uint64_t v28 = v22;
    [v23 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v27];

    id v24 = v28;
  }
  else
  {
    id v24 = [(MCMCodeSigningMapping *)self userIdentityCache];
    __int16 v25 = [v24 globalSystemUserIdentity];
    ((void (**)(void, void *))v22)[2](v22, v25);
  }
  uint64_t v14 = (void *)v21;
  if (v12) {
    goto LABEL_7;
  }
LABEL_8:
}

void __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * v7);
        id v9 = containermanager_copy_global_configuration();
        uint64_t v10 = [v9 staticConfig];
        unint64_t v11 = [v10 configForContainerClass:*(void *)(a1 + 56)];

        uint64_t v19 = 1;
        BOOL v12 = [*(id *)(a1 + 40) userIdentityCache];
        uint64_t v13 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v3 identifier:v8 containerConfig:v11 platform:0 userIdentityCache:v12 error:&v19];

        if (v13)
        {
          [*(id *)(a1 + 48) addObject:v13];
        }
        else
        {
          uint64_t v14 = container_log_handle_for_category();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v19;
            uint64_t error_description = container_get_error_description();
            uint64_t v16 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 134219010;
            uint64_t v21 = v17;
            __int16 v22 = 2080;
            uint64_t v23 = error_description;
            __int16 v24 = 2112;
            id v25 = v3;
            __int16 v26 = 2112;
            uint64_t v27 = v8;
            __int16 v28 = 2048;
            uint64_t v29 = v16;
            _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not generate identity for ref cnt add of container; error = (%llu) %s, userIdentity = %@, identifier"
              " = %@, class = %llu",
              buf,
              0x34u);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v5);
  }
}

uint64_t __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_125(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v1();
}

- (id)_onQueue_copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4018;
  uint64_t v16 = __Block_byref_object_dispose__4019;
  id v17 = [MEMORY[0x1E4F28BD0] setWithCapacity:0];
  if (a3 == 7)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2F12458];
    uint64_t v8 = 0;
    uint64_t v7 = @"com.apple.private.MobileContainerManager.appGroup.noReference";
    goto LABEL_5;
  }
  if (a3 == 13)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.security.system-groups"];
    uint64_t v7 = 0;
    uint64_t v8 = @"com.apple.security.system-group-containers";
LABEL_5:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke;
    v11[3] = &unk_1E6A7FCC0;
    v11[4] = &v12;
    [(MCMCodeSigningMapping *)self _onQueue_iterateGroupIdsWithKey:v6 fallBackKey:v8 noReferenceKey:v7 forAllIdentifiersUsingBlock:v11];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

void __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      id v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_debug_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEBUG, "Entitlements for identifier %@ references container IDs: %@", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      unint64_t v11 = [v7 allObjects];
      [v10 addObjectsFromArray:v11];
    }
    else
    {
      unint64_t v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "identifier: %@ has non-array type of group container IDs: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (id)copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__4018;
  id v13 = __Block_byref_object_dispose__4019;
  id v14 = 0;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke;
  v8[3] = &unk_1E6A800E0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_copyReferenceCountSetForContainerClass:", *(void *)(a1 + 48));

  return MEMORY[0x1F41817F8]();
}

- (BOOL)invalidateCodeSigningInfoForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v7 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke;
  block[3] = &unk_1E6A7FA68;
  block[4] = self;
  id v11 = v6;
  int v12 = &v14;
  id v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return (char)a4;
}

uint64_t __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_invalidateCodeSigningInfoForIdentifier:error:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__4018;
  uint64_t v19 = __Block_byref_object_dispose__4019;
  id v20 = 0;
  id v7 = [(MCMCodeSigningMapping *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke;
  v12[3] = &unk_1E6A806E0;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(v7, v12);

  uint64_t v9 = (void *)v16[5];
  if (a4 && v9)
  {
    *a4 = v9;
    uint64_t v9 = (void *)v16[5];
  }
  BOOL v10 = v9 == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)_onQueue_identifiersWithError:(id *)a3
{
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v7 = [v6 identifiersWithError:a3];

  return v7;
}

- (id)identifiersWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4018;
  id v20 = __Block_byref_object_dispose__4019;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4018;
  uint64_t v14 = __Block_byref_object_dispose__4019;
  id v15 = 0;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__MCMCodeSigningMapping_identifiersWithError___block_invoke;
  v9[3] = &unk_1E6A80108;
  v9[4] = self;
  void v9[5] = &v10;
  v9[6] = &v16;
  dispatch_sync(v5, v9);

  id v6 = (void *)v11[5];
  if (a3 && !v6)
  {
    *a3 = (id) v17[5];
    id v6 = (void *)v11[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __46__MCMCodeSigningMapping_identifiersWithError___block_invoke(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v3 + 40);
  uint64_t v4 = objc_msgSend(v2, "_onQueue_identifiersWithError:", obj);
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (unint64_t)invalidateCodeSigningInfoForAppsWithoutDataContainer
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v52 = 0;
  uint64_t v3 = [(MCMCodeSigningMapping *)self identifiersWithError:&v52];
  id v34 = v52;
  if (!v3)
  {
    uint64_t v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v63) = 138412290;
      *(void *)((char *)&v63 + 4) = v34;
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "Failed to enumerate containers when invalidating code signing info: %@", (uint8_t *)&v63, 0xCu);
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v3;
  uint64_t v38 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v70 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1D9478DF0]();
        *(void *)&long long v63 = 0;
        *((void *)&v63 + 1) = &v63;
        uint64_t v64 = 0x3032000000;
        v65 = __Block_byref_object_copy__4018;
        v66 = __Block_byref_object_dispose__4019;
        id v67 = 0;
        uint64_t v46 = 0;
        uint64_t v47 = &v46;
        uint64_t v48 = 0x3032000000;
        v49 = __Block_byref_object_copy__4018;
        v50 = __Block_byref_object_dispose__4019;
        id v51 = 0;
        id v8 = [(MCMCodeSigningMapping *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke;
        block[3] = &unk_1E6A80220;
        block[4] = self;
        void block[5] = v6;
        block[6] = &v63;
        block[7] = &v46;
        dispatch_sync(v8, block);

        if (v47[5])
        {
          uint64_t v9 = container_log_handle_for_category();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = v47[5];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v31;
            _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Error fetching code sign info for %@ to check for invalidation: %@", buf, 0x16u);
          }
        }
        else
        {
          int v10 = [*(id *)(*((void *)&v63 + 1) + 40) isRegisteredByCaller];
          BOOL v11 = 0;
          unint64_t v12 = [*(id *)(*((void *)&v63 + 1) + 40) dataContainerClass] - 3;
          unint64_t v37 = v12;
          if (*(void *)(*((void *)&v63 + 1) + 40) && v12 <= 3)
          {
            id v13 = [(MCMCodeSigningMapping *)self childParentMapCache];
            uint64_t v14 = [v13 parentIdentifierForChildIdentifier:v6];

            BOOL v11 = v14 != 0;
          }
          id v15 = container_log_handle_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = *(void *)(*((void *)&v63 + 1) + 40);
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v16;
            *(_WORD *)&buf[22] = 1024;
            int v58 = v10;
            __int16 v59 = 1024;
            BOOL v60 = v37 < 4;
            __int16 v61 = 1024;
            BOOL v62 = v11;
            _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_INFO, "Checking for invalidation: identifier = %@, codeSigningEntry = <%p>, isRegisteredByCaller = %d, isPlugIn = %d, hasParent = %d", buf, 0x28u);
          }

          if (!(v10 & 1 | (v37 < 4 && v11)))
          {
            uint64_t v17 = 0;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v18 = 1;
            LOBYTE(v58) = 0;
            do
            {
              uint64_t v19 = qword_1D7815AD0[v17];
              id v20 = containermanager_copy_global_configuration();
              id v21 = [v20 staticConfig];
              uint64_t v22 = [v21 configForContainerClass:v19];

              uint64_t v23 = [(MCMCodeSigningMapping *)self userIdentityCache];
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_101;
              v41[3] = &unk_1E6A7FC70;
              long long v44 = buf;
              v41[4] = v6;
              id v24 = v22;
              id v42 = v24;
              long long v43 = self;
              [(id)v23 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v41];

              LOBYTE(v23) = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;
              char v25 = v23 & v18;
              uint64_t v17 = 1;
              char v18 = 0;
            }
            while ((v25 & 1) != 0);
            if (!*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              __int16 v26 = container_log_handle_for_category();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v53 = 138412546;
                uint64_t v54 = v6;
                __int16 v55 = 1024;
                BOOL v56 = v37 < 4;
                _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_DEFAULT, "Invalidating: identifier = %@, isPlugin = %d", v53, 0x12u);
              }

              uint64_t v27 = (id *)(v47 + 5);
              id v40 = (id)v47[5];
              BOOL v28 = [(MCMCodeSigningMapping *)self invalidateCodeSigningInfoForIdentifierAndItsChildren:v6 withError:&v40];
              objc_storeStrong(v27, v40);
              if (!v28)
              {
                v39[0] = MEMORY[0x1E4F143A8];
                v39[1] = 3221225472;
                v39[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_103;
                v39[3] = &unk_1E6A7FC98;
                v39[4] = v6;
                v39[5] = &v46;
                uint64_t v29 = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_103((uint64_t)v39);
                id v30 = (void *)v47[5];
                v47[5] = v29;
              }
            }
            _Block_object_dispose(buf, 8);
          }
        }
        _Block_object_dispose(&v46, 8);

        _Block_object_dispose(&v63, 8);
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
    }
    while (v38);
  }

  if (v34) {
    unint64_t v32 = [v34 code];
  }
  else {
    unint64_t v32 = 1;
  }

  return v32;
}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke(uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = [v2 codeSigningEntryWithIdentifier:v3 error:obj];
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_101(void *a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = (void *)a1[6];
    id v6 = a2;
    id v7 = [v5 userIdentityCache];
    id v9 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v6 identifier:v3 containerConfig:v4 platform:0 transient:0 userIdentityCache:v7 error:0];

    if (v9)
    {
      id v8 = [(id)gContainerCache entryForContainerIdentity:v9 error:0];
      if (v8)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      }
    }
  }
}

id __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_103(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Failed to invalidate code signing info for %@ : %@", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMCodeSigningMapping invalidateCodeSigningInfoForAppsWithoutDataContainer]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11A68;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v7 = (void *)[v6 copy];

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      int v10 = "%{public}@ (%{public}@)";
      BOOL v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v16 = v2;
  int v10 = "%{public}@";
  BOOL v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

void __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_100(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) identifier];
  id v9 = 0;
  char v5 = [v2 addCodeSigningEntry:v3 withIdentifier:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 48) identifier];
      *(_DWORD *)buf = 138412546;
      BOOL v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Failed to write code signing info to DB for %@ : %@", buf, 0x16u);
    }
  }
}

- (id)getCodeSigningInfoForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4018;
  __int16 v17 = __Block_byref_object_dispose__4019;
  id v18 = 0;
  id v5 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:v4];
  id v6 = [(MCMCodeSigningMapping *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke;
  v10[3] = &unk_1E6A806E0;
  id v11 = v4;
  __int16 v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  dispatch_sync(v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_codeSigningInfoForIdentifier:externalRequest:", *(void *)(a1 + 40), 1);

  return MEMORY[0x1F41817F8]();
}

- (id)processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__4018;
  uint64_t v39 = __Block_byref_object_dispose__4019;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  unint64_t v32 = __Block_byref_object_copy__4018;
  long long v33 = __Block_byref_object_dispose__4019;
  id v34 = 0;
  uint64_t v13 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:v11];
  uint64_t v14 = [(MCMCodeSigningMapping *)self queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke;
  v22[3] = &unk_1E6A7FC48;
  v22[4] = self;
  id v15 = v10;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  uint64_t v27 = &v35;
  BOOL v28 = &v29;
  dispatch_sync(v14, v22);

  uint64_t v19 = v30;
  if (a6 && !v30[5])
  {
    *a6 = (id) v36[5];
    uint64_t v19 = v30;
  }
  id v20 = (id)v19[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke(void *a1)
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[8];
  uint64_t v4 = *(void *)(a1[9] + 8);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v8[0] = *(id *)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2;
  v7[3] = &unk_1E6A7FC20;
  v7[4] = a1[10];
  objc_msgSend(v2, "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:", v1, v5, v6, v3, v8, v7);
  objc_storeStrong((id *)(v4 + 40), v8[0]);
}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  objc_storeStrong(v2, a2);
}

- (id)processCallerRegisteredEntitlements:(id)a3 identifier:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v19 = [[MCMError alloc] initWithErrorType:18];
    id v10 = 0;
    id v18 = 0;
    id v12 = 0;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  id v35 = 0;
  id v10 = [(MCMCodeSigningMapping *)self codeSigningEntryForIdentifier:v9 withError:&v35];
  id v11 = v35;
  id v12 = v11;
  if (!v10)
  {
    id v20 = [v11 domain];
    if ([v20 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v21 = [v12 code];

      if (v21 == 67) {
        goto LABEL_3;
      }
      if (v12) {
        goto LABEL_12;
      }
    }
    else
    {

      if (v12)
      {
LABEL_12:
        uint64_t v22 = [v12 domain];
        int v23 = [v22 isEqual:@"MCMErrorDomain"];

        if (v23)
        {
          id v24 = [MCMError alloc];
          uint64_t v25 = [v12 code];
          id v26 = v24;
LABEL_24:
          uint64_t v32 = [(MCMError *)v26 initWithErrorType:v25];
LABEL_25:
          uint64_t v19 = (MCMError *)v32;
          id v10 = 0;
          id v18 = 0;
          if (!a5) {
            goto LABEL_28;
          }
          goto LABEL_26;
        }
        id v30 = [v12 domain];
        int v31 = [v30 isEqual:@"MCMErrorDomain"];

        id v26 = [MCMError alloc];
        if (v31)
        {
          uint64_t v32 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v26, "initWithErrorType:category:path:POSIXerrno:", 40, 1, 0, [v12 code]);
          goto LABEL_25;
        }
LABEL_23:
        uint64_t v25 = 40;
        goto LABEL_24;
      }
    }
    id v26 = [MCMError alloc];
    goto LABEL_23;
  }
LABEL_3:
  uint64_t v13 = [v10 codeSigningInfo];

  if (v13)
  {
    if (![v10 isRegisteredByCaller]) {
      goto LABEL_6;
    }
    uint64_t v14 = [v10 codeSigningInfo];
    id v15 = [v14 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
    id v16 = [v8 rawEntitlements];
    int v17 = [v15 isEqualToDictionary:v16];

    if (v17)
    {
LABEL_6:
      id v18 = objc_opt_new();
      uint64_t v19 = 0;
      goto LABEL_28;
    }
    uint64_t v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v9;
      _os_log_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEFAULT, "%@ has changed entitlements. Re-registering.", buf, 0xCu);
    }
  }
  uint64_t v36 = @"com.apple.MobileContainerManager.Entitlements";
  BOOL v28 = [v8 rawEntitlements];
  uint64_t v37 = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  id v34 = 0;
  id v18 = [(MCMCodeSigningMapping *)self processCodeSigningInfo:v29 identifier:v9 options:&unk_1F2F10F90 error:&v34];
  uint64_t v19 = (MCMError *)v34;

  if (a5)
  {
LABEL_26:
    if (v19)
    {
      uint64_t v19 = v19;
      *a5 = v19;
    }
  }
LABEL_28:

  return v18;
}

- (id)systemGroupIdentifiersForIdentifier:(id)a3
{
  uint64_t v3 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:a3];
  uint64_t v4 = [v3 systemGroupIdentifiers];

  return v4;
}

- (BOOL)identifierHasSystemContainer:(id)a3
{
  uint64_t v3 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:a3];
  char v4 = [v3 hasSystemContainer];

  return v4;
}

- (BOOL)identifierHasCallerRegisteredEntitlements:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(MCMCodeSigningMapping *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke;
  v8[3] = &unk_1E6A806E0;
  id v9 = v4;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(self) = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_identifierHasCallerRegisteredEntitlements:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4018;
  uint64_t v19 = __Block_byref_object_dispose__4019;
  id v20 = 0;
  id v7 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke;
  block[3] = &unk_1E6A7FA68;
  block[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  char v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_codeSigningEntryForIdentifier:withError:", *(void *)(a1 + 40), *(void *)(a1 + 56));

  return MEMORY[0x1F41817F8]();
}

- (id)removeCodeSigningDictionaryForIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v8 = 138412546;
    long long v19 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
        id v20 = v13;
        uint64_t v15 = -[MCMCodeSigningMapping processCodeSigningInfo:identifier:options:error:](self, "processCodeSigningInfo:identifier:options:error:", 0, v14, 0, &v20, v19);
        id v10 = v20;

        if (v15)
        {
          [v5 unionSet:v15];
        }
        else
        {
          id v16 = container_log_handle_for_category();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v22 = v14;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to clear entitlements for %@ : %@", buf, 0x16u);
          }
        }
        ++v12;
        uint64_t v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v9);
  }
  uint64_t v17 = (void *)[v5 copy];

  return v17;
}

- (id)groupContainerIdentifiersAssociatedWithIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v5 = [(MCMCodeSigningMapping *)self entitlementsForIdentifier:a3];
  id v6 = v5;
  if (a4 == 13)
  {
    id v8 = containermanager_copy_global_configuration();
    int v9 = [v8 systemContainerMode];

    if (v9)
    {
      uint64_t v7 = [v6 systemGroupIdentifiers];
LABEL_6:
      id v10 = (void *)v7;
      if (v7) {
        goto LABEL_8;
      }
    }
  }
  else if (a4 == 7)
  {
    uint64_t v7 = [v5 appGroupIdentifiers];
    goto LABEL_6;
  }
  id v10 = objc_opt_new();
LABEL_8:

  return v10;
}

- (void)_onQueue_iterateGroupIdsWithKey:(id)a3 fallBackKey:(id)a4 noReferenceKey:(id)a5 forAllIdentifiersUsingBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke;
  v22[3] = &unk_1E6A7FBF8;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = [v15 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v22];

  if (v20)
  {
    uint64_t v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v20;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Failed to enumerate code signing info: %@", buf, 0xCu);
    }
  }
}

void __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) _entitlementsFromCodeSigningEntry:a3];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = (void *)a1;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = +[MCMEntitlements copyGroupEntitlementForIdentifier:v5 entitlements:v6 groupKey:*(void *)(*((void *)&v22 + 1) + 8 * v13)];

        [v7 unionSet:v11];
        ++v13;
        uint64_t v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  if (v20[6] && ![v7 count])
  {
    id v15 = +[MCMEntitlements copyGroupEntitlementForIdentifier:v5 entitlements:v6 groupKey:v20[6]];

    uint64_t v16 = [v15 mutableCopy];
    id v11 = v15;
    uint64_t v7 = (void *)v16;
  }
  if (v20[7] && [v7 count])
  {
    id v17 = +[MCMEntitlements copyGroupEntitlementForIdentifier:v5 entitlements:v6 groupKey:v20[7]];

    [v7 minusSet:v17];
    id v11 = v17;
  }
  if (![v7 count])
  {

    uint64_t v7 = 0;
  }
  uint64_t v18 = v20[8];
  id v19 = (void *)[v7 copy];
  (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v5, v19);
}

- (BOOL)_onQueue_invalidateCodeSigningInfoForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  LOBYTE(a4) = [v8 invalidateCodeSigningWithIdentifier:v6 error:a4];

  return (char)a4;
}

- (id)_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  v9[0] = 0;
  [v6 invalidateCodeSigningForIdentifierAndAllChildren:v4 error:v9];

  id v7 = v9[0];

  return v7;
}

- (BOOL)_onQueue_processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 oldEntitlements:(id)a6 error:(id *)a7 reconcileHandler:(id)a8
{
  uint64_t v73 = a7;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v83 = a4;
  id v84 = a5;
  id v78 = a6;
  v74 = (void (**)(void))a8;
  v77 = self;
  uint64_t v13 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v13);

  v76 = objc_opt_new();
  v75 = objc_opt_new();
  v79 = objc_opt_new();
  v81 = objc_opt_new();
  v82 = objc_opt_new();
  if (!v83)
  {
    long long v24 = 0;
    long long v25 = [[MCMError alloc] initWithErrorType:18];
    v85 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    long long v28 = 0;
    uint64_t v29 = 0;
    id v17 = 0;
    goto LABEL_79;
  }
  id v14 = v84;
  if (!v84) {
    id v14 = (id)MEMORY[0x1E4F1CC08];
  }
  id v84 = v14;
  id v15 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v93 = 0;
  uint64_t v16 = [v15 codeSigningEntryWithIdentifier:v83 error:&v93];
  id v17 = v93;

  if (!v16)
  {
    uint64_t v30 = [v17 domain];
    if ([v30 isEqualToString:@"MCMErrorDomain"])
    {
      BOOL v31 = [v17 code] == 67;

      if (v31)
      {

        id v17 = 0;
        goto LABEL_5;
      }
    }
    else
    {
    }
    uint64_t v32 = container_log_handle_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v95 = v83;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v17;
      _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    uint64_t v16 = 0;
    v85 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    long long v28 = 0;
    uint64_t v29 = 0;
    BOOL v33 = 0;
    if (!v17) {
      goto LABEL_73;
    }
    goto LABEL_67;
  }
LABEL_5:
  uint64_t v18 = [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.DataContainerClass"];
  objc_msgSend(v82, "setDataContainerClass:", objc_msgSend(v18, "unsignedLongLongValue"));

  v85 = [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.ParentBundleID"];
  if (!v85) {
    goto LABEL_30;
  }
  id v19 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v92 = v17;
  id v20 = [v19 codeSigningEntryWithIdentifier:v85 error:&v92];
  id v21 = v92;

  if (v20)
  {
    id v17 = v21;
    goto LABEL_8;
  }
  id v34 = [v21 domain];
  if (![v34 isEqualToString:@"MCMErrorDomain"])
  {

LABEL_45:
    BOOL v56 = container_log_handle_for_category();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v95 = v83;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v21;
      _os_log_error_impl(&dword_1D7739000, v56, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    uint64_t v26 = 0;
    uint64_t v27 = 0;
    long long v28 = 0;
    uint64_t v29 = 0;
    BOOL v33 = 0;
    id v17 = v21;
    if (!v21) {
      goto LABEL_73;
    }
    goto LABEL_67;
  }
  BOOL v35 = [v21 code] == 67;

  if (!v35) {
    goto LABEL_45;
  }

  id v17 = 0;
LABEL_8:
  long long v22 = [v20 childBundleIdentifiers];
  long long v23 = (void *)[v22 mutableCopy];

  if (v23)
  {
    if (!v20) {
      goto LABEL_24;
    }
  }
  else
  {
    long long v23 = objc_opt_new();
    if (!v20) {
LABEL_24:
    }
      id v20 = objc_opt_new();
  }
  if (([v23 containsObject:v83] & 1) == 0)
  {
    [v23 addObject:v83];
    uint64_t v36 = (void *)[v23 copy];
    [v20 setChildBundleIdentifiers:v36];

    uint64_t v37 = container_log_handle_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v95 = v23;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v85;
      __int16 v98 = 2112;
      uint64_t v99 = (uint64_t)v83;
      _os_log_debug_impl(&dword_1D7739000, v37, OS_LOG_TYPE_DEBUG, "Staging Child Bundles: %@ for parent ID: %@ by appending: %@", buf, 0x20u);
    }

    [v79 addObject:v20];
    [v81 addObject:v85];
  }

LABEL_30:
  uint64_t v38 = [v84 objectForKeyedSubscript:@"RegByCaller"];
  int v39 = [v38 BOOLValue];

  if (v39) {
    [v82 setRegisteredByCaller:1];
  }
  uint64_t v40 = [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
  int v41 = [v40 BOOLValue];

  if (v41) {
    [v82 setPlaceholder:1];
  }
  id v42 = [v84 objectForKeyedSubscript:@"com.apple.MobileContainerManager.AdvanceCopy"];
  int v43 = [v42 BOOLValue];

  if (v43) {
    [v82 setAdvanceCopy:1];
  }
  [v82 setCodeSigningInfo:v80];
  if (v16 && ([v16 isEqual:v82] & 1) != 0)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    long long v28 = 0;
    uint64_t v29 = 0;
  }
  else
  {
    long long v44 = [v80 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
    long long v45 = [MCMEntitlements alloc];
    id v46 = containermanager_copy_global_configuration();
    uint64_t v47 = [v46 classIterator];
    uint64_t v48 = [(MCMEntitlements *)v45 initWithEntitlements:v44 clientIdentifier:v83 classIterator:v47];

    id v49 = containermanager_copy_global_configuration();
    BOOL v50 = [v49 systemContainerMode] == 0;

    if (!v50
      && [v78 hasSystemContainer]
      && ![(MCMEntitlements *)v48 hasSystemContainer])
    {
      id v51 = containermanager_copy_global_configuration();
      id v52 = [v51 staticConfig];
      v53 = [v52 configForContainerClass:12];

      uint64_t v54 = [(MCMCodeSigningMapping *)v77 userIdentityCache];
      __int16 v55 = +[MCMContainerIdentity containerIdentityWithIdentifier:v83 containerConfig:v53 platform:0 userIdentityCache:v54 error:0];

      if (v55)
      {
        [v76 addObject:v55];
      }
      else
      {
        v57 = container_log_handle_for_category();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v95 = v83;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v17;
          _os_log_error_impl(&dword_1D7739000, v57, OS_LOG_TYPE_ERROR, "Failed to create system container identity for %@: %@", buf, 0x16u);
        }

        id v17 = 0;
      }
    }
    uint64_t v29 = [(MCMEntitlements *)v48 appGroupIdentifiers];
    uint64_t v27 = [v78 appGroupIdentifiers];
    if (v27 | v29)
    {
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke;
      v89[3] = &unk_1E6A7FBD0;
      id v90 = v76;
      id v91 = v75;
      [(MCMCodeSigningMapping *)v77 _onQueue_handleChangeFromOldGroupContainerIds:v27 toNewGroupContainerIds:v29 containerClass:7 reconcileHandler:v89];
    }
    id v58 = containermanager_copy_global_configuration();
    BOOL v59 = [v58 systemContainerMode] == 0;

    if (v59
      || ([(MCMEntitlements *)v48 systemGroupIdentifiers],
          uint64_t v60 = objc_claimAutoreleasedReturnValue(),
          [v78 systemGroupIdentifiers],
          uint64_t v61 = objc_claimAutoreleasedReturnValue(),
          !(v61 | v60)))
    {
      uint64_t v26 = 0;
      long long v28 = 0;
    }
    else
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2;
      v86[3] = &unk_1E6A7FBD0;
      id v87 = v76;
      id v88 = v75;
      [(MCMCodeSigningMapping *)v77 _onQueue_handleChangeFromOldGroupContainerIds:v61 toNewGroupContainerIds:v60 containerClass:13 reconcileHandler:v86];

      uint64_t v26 = (void *)v61;
      long long v28 = (void *)v60;
    }
    BOOL v62 = container_log_handle_for_category();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      id v95 = v83;
      __int16 v96 = 2112;
      uint64_t v97 = v27;
      __int16 v98 = 2112;
      uint64_t v99 = v29;
      __int16 v100 = 2112;
      v101 = v26;
      __int16 v102 = 2112;
      v103 = v28;
      _os_log_impl(&dword_1D7739000, v62, OS_LOG_TYPE_DEFAULT, "Reconciled [%@]; old app groups: %@, new app groups: %@, old system groups: %@, new system groups: %@",
        buf,
        0x34u);
    }

    if (v80)
    {
      long long v63 = v82;
    }
    else
    {
      uint64_t v64 = objc_opt_new();

      long long v63 = (void *)v64;
    }
    v82 = v63;
    objc_msgSend(v79, "addObject:");
    [v81 addObject:v83];
  }
  if (![v81 count])
  {
    BOOL v33 = 1;
    if (!v17) {
      goto LABEL_73;
    }
LABEL_67:
    long long v24 = v16;
    v66 = [v17 domain];
    int v67 = [v66 isEqual:@"MCMErrorDomain"];

    if (v67)
    {
      v68 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", [v17 code]);
    }
    else
    {
      long long v69 = [v17 domain];
      int v70 = [v69 isEqual:*MEMORY[0x1E4F28798]];

      if (!v70)
      {
        long long v25 = [[MCMError alloc] initWithErrorType:40];
LABEL_79:
        BOOL v33 = 0;
        if (v73 && v25)
        {
          long long v25 = v25;
          BOOL v33 = 0;
          *uint64_t v73 = v25;
        }
        uint64_t v16 = v24;
        goto LABEL_83;
      }
      v68 = -[MCMError initWithErrorType:category:path:POSIXerrno:]([MCMError alloc], "initWithErrorType:category:path:POSIXerrno:", 40, 1, 0, [v17 code]);
    }
    long long v25 = v68;
    goto LABEL_79;
  }
  uint64_t v65 = [(MCMCodeSigningMapping *)v77 _onQueue_setCodeSigningDictionaryValues:v79 forIdentifiers:v81];

  BOOL v33 = 1;
  id v17 = (id)v65;
  if (v65) {
    goto LABEL_67;
  }
LABEL_73:
  char v71 = !v33;
  if (!v74) {
    char v71 = 1;
  }
  if (v71)
  {
    long long v25 = 0;
    id v17 = 0;
  }
  else
  {
    v74[2]();
    long long v25 = 0;
    id v17 = 0;
    BOOL v33 = 1;
  }
LABEL_83:

  return v33;
}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 unionSet:a2];
  [*(id *)(a1 + 40) unionSet:v6];
}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 unionSet:a2];
  [*(id *)(a1 + 40) unionSet:v6];
}

id __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_92(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 callStackSymbols];
  id v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11A50;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];

  return v10;
}

- (BOOL)_onQueue_identifierHasCallerRegisteredEntitlements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v14 = 0;
  uint64_t v7 = [v6 codeSigningEntryWithIdentifier:v4 error:&v14];
  id v8 = v14;

  if (v7) {
    goto LABEL_2;
  }
  uint64_t v10 = [v8 domain];
  if ([v10 isEqualToString:@"MCMErrorDomain"])
  {
    uint64_t v11 = [v8 code];

    if (v11 == 67)
    {
LABEL_2:
      char v9 = [v7 isRegisteredByCaller];
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  char v9 = 0;
LABEL_10:

  return v9;
}

- (id)_onQueue_codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v15 = 0;
  char v9 = [v8 codeSigningEntryWithIdentifier:v6 error:&v15];
  id v10 = v15;

  if (!v9)
  {
    uint64_t v11 = [v10 domain];
    if ([v11 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 67)
      {
        if (!a4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    else
    {
    }
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    if (a4) {
LABEL_5:
    }
      *a4 = v10;
  }
LABEL_6:

  return v9;
}

- (id)_entitlementsFromCodeSigningEntry:(id)a3
{
  uint64_t v3 = [(MCMCodeSigningMapping *)self _codeSigningInfoForCodeSigningEntry:a3 externalRequest:0];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];

  return v4;
}

- (id)_onQueue_setCodeSigningDictionaryValues:(id)a3 forIdentifiers:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 count];
  if (v9 != [v7 count])
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke;
    v39[3] = &unk_1E6A80510;
    id v40 = v6;
    id v41 = v7;
    __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke((uint64_t)v39);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = (uint64_t)v40;
    goto LABEL_31;
  }
  if (![v6 count] || !objc_msgSend(v6, "count"))
  {
    id v11 = 0;
    goto LABEL_33;
  }
  id v11 = 0;
  uint64_t v12 = 0;
  *(void *)&long long v10 = 138412290;
  long long v34 = v10;
  while (1)
  {
    uint64_t v13 = v11;
    uint64_t v14 = objc_msgSend(v6, "objectAtIndex:", v12, v34);
    id v15 = [v7 objectAtIndex:v12];
    id v16 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
    id v38 = v11;
    uint64_t v17 = [v16 codeSigningEntryWithIdentifier:v15 error:&v38];
    id v11 = v38;

    if (v17) {
      goto LABEL_9;
    }
    __int16 v18 = [v11 domain];
    if (![v18 isEqualToString:@"MCMErrorDomain"]) {
      break;
    }
    uint64_t v19 = [v11 code];

    if (v19 != 67) {
      goto LABEL_37;
    }

    id v11 = 0;
LABEL_9:
    uint64_t v20 = [(id)v14 codeSigningInfo];

    if (!v20)
    {

      uint64_t v14 = 0;
    }
    if (!(v17 | v14) || ([(id)v14 isEqual:v17] & 1) != 0) {
      goto LABEL_26;
    }
    id v21 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
    long long v22 = v21;
    if (v14)
    {
      id v37 = v11;
      char v23 = [v21 addCodeSigningEntry:v14 withIdentifier:v15 error:&v37];
      id v35 = v37;

      if (v23)
      {
        long long v24 = container_log_handle_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v43 = v15;
          __int16 v44 = 2112;
          uint64_t v45 = v14;
          long long v25 = v24;
          uint64_t v26 = "Set Code Signing Mapping for ID: %@ : %@";
          uint32_t v27 = 22;
LABEL_20:
          _os_log_impl(&dword_1D7739000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
        }
      }
      else
      {
        long long v24 = container_log_handle_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          int v43 = v15;
          __int16 v44 = 2112;
          id v29 = v35;
          uint64_t v45 = (uint64_t)v35;
          uint64_t v30 = v24;
          BOOL v31 = "Failed to write code signing info to DB for %@ : %@";
LABEL_29:
          _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
          goto LABEL_25;
        }
      }
    }
    else
    {
      id v36 = v11;
      char v28 = [v21 deleteCodeSigningEntryWithIdentifier:v15 error:&v36];
      id v35 = v36;

      if (v28)
      {
        long long v24 = container_log_handle_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          int v43 = v15;
          long long v25 = v24;
          uint64_t v26 = "Deleted Code Signing Mapping for ID: %@";
          uint32_t v27 = 12;
          goto LABEL_20;
        }
      }
      else
      {
        long long v24 = container_log_handle_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          int v43 = v15;
          __int16 v44 = 2112;
          id v29 = v35;
          uint64_t v45 = (uint64_t)v35;
          uint64_t v30 = v24;
          BOOL v31 = "Failed to delete code signing info from DB for %@ : %@";
          goto LABEL_29;
        }
      }
    }
    id v29 = v35;
LABEL_25:

    id v11 = v29;
LABEL_26:

    if (++v12 >= (unint64_t)[v6 count]) {
      goto LABEL_33;
    }
  }

LABEL_37:
  BOOL v33 = container_log_handle_for_category();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    int v43 = v15;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v11;
    _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

LABEL_31:
LABEL_33:

  return v11;
}

id __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)[[NSString alloc] initWithFormat:@"Can't act on an invalid input: values count: %ld, IDs count: %ld", objc_msgSend(*(id *)(a1 + 32), "count"), objc_msgSend(*(id *)(a1 + 40), "count")];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMCodeSigningMapping _onQueue_setCodeSigningDictionaryValues:forIdentifiers:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11A38;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:60 userInfo:v4];

  return v6;
}

- (id)_readCodeSigningMappingFromDiskAtURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "MCM_dictionaryWithContentsOfURL:options:error:", v3, 0, &v23);
  id v5 = v23;
  id v6 = v5;
  if (v4)
  {
    id v7 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v4 allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v21 = v6;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x1D9478DF0]();
          uint64_t v14 = [MCMCodeSigningEntry alloc];
          id v15 = [v4 objectForKeyedSubscript:v12];
          id v16 = [(MCMCodeSigningEntry *)v14 initWithSerializedDictionary:v15];

          [v7 setObject:v16 forKeyedSubscript:v12];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
      }
      while (v9);
      id v6 = v21;
    }
  }
  else
  {
    uint64_t v17 = [v5 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v18 = [v6 code];

      if (v18 == 2)
      {
        id v7 = 0;
        goto LABEL_18;
      }
    }
    else
    {
    }
    id obj = container_log_handle_for_category();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v3 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v6;
      _os_log_error_impl(&dword_1D7739000, obj, OS_LOG_TYPE_ERROR, "Failed to read code signing mapping file at %@ : %@", buf, 0x16u);
    }
    id v7 = 0;
  }

LABEL_18:

  return v7;
}

- (void)performAllCodeSigningMigrationAndReconciliationWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t multiuser_flags = 0;
  host_t v5 = MEMORY[0x1D9478CB0]();
  if (host_get_multiuser_config_flags(v5, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0) {
    [(MCMCodeSigningMapping *)self migrateAppGroupIdsFromDataContainersToFile];
  }
  id v6 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke;
  block[3] = &unk_1E6A80730;
  block[4] = self;
  dispatch_sync(v6, block);

  uint64_t v7 = [(MCMCodeSigningMapping *)self migrateCachedCodeSigningInfoFromBundleContainersToMapping];
  uint32_t multiuser_flags = 0;
  host_t v8 = MEMORY[0x1D9478CB0](v7);
  if (host_get_multiuser_config_flags(v8, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    uint64_t v9 = +[MCMGroupManager defaultManager];
    [v9 reconcileGroupContainersForContainerClass:7 context:v4];
  }
}

uint64_t __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);

  return objc_msgSend(v1, "_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile");
}

- (void)_onQueue_reconcileSystemContainersWithContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v4 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy__4018;
  id v40 = __Block_byref_object_dispose__4019;
  id v41 = 0;
  host_t v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  id v6 = [(MCMCodeSigningMapping *)self userIdentityCache];
  id v29 = [v6 defaultUserIdentity];

  uint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke;
  block[3] = &unk_1E6A806E0;
  id v35 = &v36;
  block[4] = self;
  id v31 = v5;
  id v34 = v31;
  dispatch_sync(v7, block);

  if (v37[5])
  {
    log = container_log_handle_for_category();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      host_t v8 = v37[5];
      *(_DWORD *)buf = 138412290;
      id v49 = v8;
      _os_log_error_impl(&dword_1D7739000, log, OS_LOG_TYPE_ERROR, "Failed to enumerate system container references: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [v30 containerCache];
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v29];
    id v32 = 0;
    long long v27 = [v9 entriesForUserIdentities:v10 contentClass:12 transient:0 error:&v32];
    log = v32;

    if (v27)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v11 = v27;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = [*(id *)(*((void *)&v44 + 1) + 8 * i) metadataMinimal];
            id v16 = [v15 identifier];
            char v17 = [v31 containsObject:v16];

            if ((v17 & 1) == 0)
            {
              uint64_t v18 = container_log_handle_for_category();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                long long v26 = [v15 identifier];
                *(_DWORD *)buf = 138412290;
                id v49 = v26;
                _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Removing system container with identifier %@", buf, 0xCu);
              }
              uint64_t v19 = objc_alloc_init(MCMResultPromise);
              uint64_t v20 = [v15 containerIdentity];
              id v42 = v20;
              id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
              long long v22 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v21 removeAllCodeSignInfo:0 context:v30 resultPromise:v19];

              [v22 execute];
              id v23 = [(MCMResultPromise *)v19 result];
              long long v24 = [v23 error];

              if (v24)
              {
                long long v25 = container_log_handle_for_category();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v49 = v24;
                  _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to destroy system container(s) with no references; error = %@",
                    buf,
                    0xCu);
                }
              }
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v43 count:16];
        }
        while (v12);
      }
    }
    else
    {
      id v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = log;
        _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch system container list: %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v36, 8);
}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) codeSigningMappingDB];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2;
  v7[3] = &unk_1E6A7FBA8;
  id v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v4 = [v2 enumerateIdentifiersAndCodeSigningInfoUsingBlock:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) _entitlementsFromCodeSigningEntry:a3];
  uint64_t v7 = [MCMEntitlements alloc];
  id v8 = containermanager_copy_global_configuration();
  uint64_t v9 = [v8 classIterator];
  uint64_t v10 = [(MCMEntitlements *)v7 initWithEntitlements:v6 clientIdentifier:v5 classIterator:v9];

  if ([(MCMEntitlements *)v10 hasSystemContainer])
  {
    id v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "System container exists for identifier %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v27 = 0;
  int v12 = [v11 codeSigningEntryWithIdentifier:v9 error:&v27];
  id v13 = v27;

  if (v12 && ([v12 isInvalid] & 1) == 0)
  {
    char v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEFAULT, "Deleting cached code signing info for %@ because we already have it in mapping", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v14 = [v13 domain];
  if ([v14 isEqualToString:@"MCMErrorDomain"] && objc_msgSend(v13, "code") == 67)
  {

    goto LABEL_7;
  }
  char v15 = [v12 isInvalid];

  if ((v15 & 1) == 0)
  {
    char v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }
LABEL_17:
    id v21 = v13;
    goto LABEL_27;
  }
LABEL_7:
  id v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v9;
    _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Migrating code signing info for %@", buf, 0xCu);
  }

  char v17 = [v8 mutableCopy];
  uint64_t v18 = [v8 objectForKeyedSubscript:@"Entitlements"];
  [v17 setObject:v18 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];

  uint64_t v19 = [MCMCodeSigningEntry alloc];
  uint64_t v20 = 2;
  if ((uint64_t)a5 > 4)
  {
    if (a5 == 5)
    {
      uint64_t v20 = 6;
      goto LABEL_22;
    }
    if (a5 != 14) {
      goto LABEL_20;
    }
  }
  else if (a5 != 1)
  {
    if (a5 == 3)
    {
      uint64_t v20 = 4;
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v20 = 0;
  }
LABEL_22:
  long long v22 = [(MCMCodeSigningEntry *)v19 initWithCodeSigningInfo:v17 andDataContainerClass:v20];
  id v23 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
  id v26 = v13;
  char v24 = [v23 addCodeSigningEntry:v22 withIdentifier:v9 error:&v26];
  id v21 = v26;

  if ((v24 & 1) == 0)
  {
    long long v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to write migrated cached cs info from bundle container to DB for %@ : %@", buf, 0x16u);
    }
  }
LABEL_27:
}

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v7);

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v61 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v49 = *(void *)v63;
    *(void *)&long long v10 = 138412546;
    long long v43 = v10;
    id v44 = v8;
    long long v45 = self;
    unint64_t v46 = a4;
    do
    {
      uint64_t v12 = 0;
      uint64_t v47 = v11;
      do
      {
        if (*(void *)v63 != v49) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x1D9478DF0]();
        id v54 = 0;
        char v15 = [v13 metadataWithError:&v54];
        id v16 = v54;
        char v17 = v16;
        if (v15)
        {
          id v50 = v16;
          id v51 = v14;
          uint64_t v18 = [v15 info];
          uint64_t v19 = [v18 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
          objc_opt_class();
          id v20 = v19;
          if (objc_opt_isKindOfClass()) {
            id v21 = v20;
          }
          else {
            id v21 = 0;
          }

          if (!v21)
          {
            char v17 = v50;
            uint64_t v14 = v51;
            goto LABEL_41;
          }
          long long v22 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
          id v23 = [v15 identifier];
          id v53 = 0;
          char v24 = [v22 codeSigningEntryWithIdentifier:v23 error:&v53];
          id v25 = v53;

          uint64_t v48 = v24;
          if (v24 && ([v24 isInvalid] & 1) == 0)
          {
            __int16 v30 = container_log_handle_for_category();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
            id v34 = [v15 identifier];
            *(_DWORD *)buf = 138412290;
            BOOL v56 = v34;
            _os_log_impl(&dword_1D7739000, v30, OS_LOG_TYPE_DEFAULT, "Deleting cached code signing info for %@ because we already have it in mapping", buf, 0xCu);
          }
          else
          {
            id v26 = objc_msgSend(v25, "domain", v43);
            if ([v26 isEqualToString:@"MCMErrorDomain"]
              && [v25 code] == 67)
            {

              goto LABEL_20;
            }
            char v27 = [v24 isInvalid];

            if (v27)
            {
LABEL_20:
              long long v28 = container_log_handle_for_category();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v15 identifier];
                *(_DWORD *)buf = 138412290;
                BOOL v56 = v29;
                _os_log_impl(&dword_1D7739000, v28, OS_LOG_TYPE_DEFAULT, "Migrating code signing info for %@", buf, 0xCu);
              }
              __int16 v30 = [v21 mutableCopy];
              id v31 = [v21 objectForKeyedSubscript:@"Entitlements"];
              [v30 setObject:v31 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];

              uint64_t v32 = [MCMCodeSigningEntry alloc];
              if ((uint64_t)a4 > 4)
              {
                if (a4 == 5)
                {
                  uint64_t v33 = 6;
                }
                else
                {
                  uint64_t v33 = 2;
                  if (a4 != 14) {
                    goto LABEL_33;
                  }
                }
              }
              else
              {
                uint64_t v33 = 2;
                if (a4 == 1) {
                  goto LABEL_35;
                }
                if (a4 == 3)
                {
                  uint64_t v33 = 4;
                  goto LABEL_35;
                }
LABEL_33:
                uint64_t v33 = 0;
              }
LABEL_35:
              uint64_t v36 = [(MCMCodeSigningEntry *)v32 initWithCodeSigningInfo:v30 andDataContainerClass:v33];
              id v37 = [(MCMCodeSigningMapping *)self codeSigningMappingDB];
              uint64_t v38 = [v15 identifier];
              id v52 = v25;
              char v39 = [v37 addCodeSigningEntry:v36 withIdentifier:v38 error:&v52];
              id v35 = v52;

              id v8 = v44;
              if ((v39 & 1) == 0)
              {
                id v40 = container_log_handle_for_category();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  id v41 = [v15 identifier];
                  *(_DWORD *)buf = v43;
                  BOOL v56 = v41;
                  __int16 v57 = 2112;
                  id v58 = v35;
                  _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Failed to write migrated cached cs info from bundle container to DB for %@ : %@", buf, 0x16u);
                }
              }

              self = v45;
              a4 = v46;
LABEL_40:
              char v17 = v50;
              uint64_t v14 = v51;

              uint64_t v11 = v47;
              goto LABEL_41;
            }
            __int16 v30 = container_log_handle_for_category();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_30:
              id v35 = v25;
              goto LABEL_40;
            }
            id v34 = [v15 identifier];
            *(_DWORD *)buf = v43;
            BOOL v56 = v34;
            __int16 v57 = 2112;
            id v58 = v25;
            _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
          }

          goto LABEL_30;
        }
        id v21 = container_log_handle_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          BOOL v56 = "-[MCMCodeSigningMapping _onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainers"
                "Legacy:containerClass:]";
          __int16 v57 = 2112;
          id v58 = v13;
          __int16 v59 = 2112;
          uint64_t v60 = v17;
          _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
            buf,
            0x20u);
        }
LABEL_41:

        ++v12;
      }
      while (v11 != v12);
      uint64_t v42 = [v8 countByEnumeratingWithState:&v62 objects:v61 count:16];
      uint64_t v11 = v42;
    }
    while (v42);
  }
}

- (void)migrateCachedCodeSigningInfoFromBundleContainersToMapping
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = objc_opt_new();
  if (([v4 hasMigrationOccurredForType:@"CodeSigningMigration"] & 1) == 0)
  {
    id v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Performing code signing migration", buf, 2u);
    }

    id v6 = containermanager_copy_global_configuration();
    uint64_t v7 = [v6 classIterator];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke;
    v8[3] = &unk_1E6A7FB80;
    v8[4] = self;
    [v7 selectWithFlags:0x10000040000 iterator:v8];

    [v4 setMigrationCompleteForType:@"CodeSigningMigration"];
  }
}

void __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 handledByProxy])
  {
    container_query_create();
    [v3 containerClass];
    container_query_set_class();
    container_query_set_include_other_owners();
    container_query_operation_set_flags();
    v46[1] = (id)MEMORY[0x1E4F143A8];
    v46[2] = (id)3221225472;
    v46[3] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2;
    v46[4] = &unk_1E6A7FB58;
    v46[5] = *(id *)(a1 + 32);
    id v47 = v3;
    container_query_iterate_results_sync();
    container_query_free();

    goto LABEL_29;
  }
  uint64_t v4 = [*(id *)(a1 + 32) userIdentityCache];
  id v5 = [v4 defaultUserIdentity];

  id v40 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:v5];
  id v6 = (void *)gContainerCache;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  v46[0] = 0;
  id v8 = objc_msgSend(v6, "entriesForUserIdentities:contentClass:transient:error:", v7, objc_msgSend(v3, "containerClass"), 0, v46);
  id v9 = v46[0];

  if (v8)
  {
    id v35 = v9;
    id v37 = v5;
    uint64_t v10 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_57;
    block[3] = &unk_1E6A80270;
    block[4] = *(void *)(a1 + 32);
    uint64_t v36 = v8;
    id v11 = v8;
    id v44 = v11;
    id v38 = v3;
    id v45 = v3;
    dispatch_sync(v10, block);

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
    if (!v12) {
      goto LABEL_24;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v56;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v55 + 1) + 8 * v15);
        id v42 = 0;
        char v17 = [v16 metadataWithError:&v42];
        id v18 = v42;
        if (!v17)
        {
          container_log_handle_for_category();
          id v23 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v49 = "-[MCMCodeSigningMapping migrateCachedCodeSigningInfoFromBundleContainersToMapping]_block_invoke_2";
            __int16 v50 = 2112;
            id v51 = v16;
            __int16 v52 = 2112;
            id v53 = v18;
            _os_log_error_impl(&dword_1D7739000, &v23->super, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }
          goto LABEL_21;
        }
        uint64_t v19 = [v17 info];
        id v20 = [v19 objectForKeyedSubscript:@"com.apple.MobileInstallation.CachedCodeSigningInfo"];
        objc_opt_class();
        id v21 = v20;
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }

        if (v22)
        {
          id v23 = objc_alloc_init(MCMResultPromise);
          char v24 = [MCMCommandSetInfoValue alloc];
          id v25 = [v17 containerIdentity];
          id v26 = [v40 context];
          char v27 = [(MCMCommandSetInfoValue *)v24 initWithKey:@"com.apple.MobileInstallation.CachedCodeSigningInfo" value:0 containerIdentity:v25 context:v26 resultPromise:v23];

          [(MCMCommandSetInfoValue *)v27 execute];
          long long v28 = [(MCMResultPromise *)v23 result];
          id v29 = [v28 error];

          if (v29)
          {
            __int16 v30 = container_log_handle_for_category();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              id v31 = [v17 containerIdentity];
              char v39 = [(MCMResultPromise *)v23 result];
              uint64_t v32 = [v39 error];
              *(_DWORD *)buf = 138412546;
              uint64_t v49 = v31;
              __int16 v50 = 2112;
              id v51 = v32;
              _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Error setting info value for identity %@ : %@", buf, 0x16u);
            }
          }

LABEL_21:
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
      if (!v13)
      {
LABEL_24:

        id v5 = v37;
        id v3 = v38;
        id v9 = v35;
        id v8 = v36;
        goto LABEL_28;
      }
    }
  }
  uint64_t v33 = container_log_handle_for_category();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = [v3 containerClass];
    *(_DWORD *)buf = 134218242;
    uint64_t v49 = (const char *)v34;
    __int16 v50 = 2112;
    id v51 = v9;
    _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for class %llu : %@", buf, 0x16u);
  }

LABEL_28:
LABEL_29:
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = container_object_get_info();
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = xpc_dictionary_get_value(v2, "com.apple.MobileInstallation.CachedCodeSigningInfo");
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [NSString stringWithUTF8String:container_get_identifier()];
      uint64_t v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      id v8 = [*(id *)(a1 + 32) queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3;
      v15[3] = &unk_1E6A7FB30;
      void v15[4] = *(void *)(a1 + 32);
      id v16 = v7;
      id v9 = v6;
      id v17 = v9;
      id v18 = *(id *)(a1 + 40);
      id v10 = v7;
      dispatch_sync(v8, v15);

      uint64_t v11 = container_set_info_value();
      if (v11 != 1)
      {
        uint64_t v12 = v11;
        uint64_t v13 = container_log_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v9;
          __int16 v21 = 2048;
          uint64_t v22 = v12;
          _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Error setting info value for identity %@ : %llu", buf, 0x16u);
        }
      }
    }
  }

  return 1;
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_57(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) containerClass];

  return objc_msgSend(v1, "_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:containerClass:", v2, v3);
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 56) containerClass];

  return objc_msgSend(v1, "_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:identifier:containerClass:", v2, v3, v4);
}

- (void)_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(MCMCodeSigningMapping *)self library];
  id v5 = [v4 url];

  if (v5)
  {
    id v6 = [v5 URLByAppendingPathComponent:@"mcm_entitlements.plist" isDirectory:0];
    uint64_t v7 = +[MCMFileManager defaultManager];
    char v8 = [v7 itemDoesNotExistAtURL:v6];

    if ((v8 & 1) == 0)
    {
      id v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Performing legacy entitlement migration", (uint8_t *)&buf, 2u);
      }

      id v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v6];
      uint64_t v11 = v10;
      if (v10)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v37 = 0x3032000000;
        id v38 = __Block_byref_object_copy__4018;
        char v39 = __Block_byref_object_dispose__4019;
        id v40 = 0;
        uint64_t v12 = [v10 objectForKeyedSubscript:@"com.apple.MobileContainerManager.ChildPluginBundleIDs"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"];
        uint64_t v14 = [v11 objectForKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.ChildPluginBundleIDs"];
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"];
        [v11 removeObjectForKey:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke;
        v27[3] = &unk_1E6A7FB08;
        p_long long buf = &buf;
        void v27[4] = self;
        id v15 = v12;
        id v28 = v15;
        id v16 = v14;
        id v29 = v16;
        id v17 = v13;
        id v30 = v17;
        [v11 enumerateKeysAndObjectsUsingBlock:v27];
        id v18 = +[MCMFileManager defaultManager];
        uint64_t v19 = (id *)(*((void *)&buf + 1) + 40);
        id obj = *(id *)(*((void *)&buf + 1) + 40);
        char v20 = [v18 removeItemAtURL:v6 error:&obj];
        objc_storeStrong(v19, obj);

        if ((v20 & 1) == 0)
        {
          __int16 v21 = container_log_handle_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            char v24 = [v6 path];
            uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
            *(_DWORD *)uint64_t v32 = 138412546;
            uint64_t v33 = v24;
            __int16 v34 = 2112;
            uint64_t v35 = v25;
            _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Failed to remove legacy file at %@: %@", v32, 0x16u);
          }
        }
        uint64_t v22 = container_log_handle_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v32 = 0;
          _os_log_impl(&dword_1D7739000, v22, OS_LOG_TYPE_DEFAULT, "Legacy entitlement migration completed", v32, 2u);
        }

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        uint64_t v11 = container_log_handle_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v6 path];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Entitlement File exists at %@, but we unexpectedly cant read it", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  else
  {
    id v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Failed to get library url.", (uint8_t *)&buf, 2u);
    }
  }
}

void __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v12 + 40);
  uint64_t v13 = [v11 codeSigningEntryWithIdentifier:v9 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);

  if (v13 && ([v13 isInvalid] & 1) == 0)
  {
    uint64_t v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v9;
      _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "Already have code signing info for %@.  No need to migrate legacy entitlements.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) domain];
    if ([v14 isEqualToString:@"MCMErrorDomain"]
      && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code] == 67)
    {

LABEL_7:
      id v16 = container_log_handle_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v9;
        _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Migrating legacy entitlements for %@", buf, 0xCu);
      }

      id v17 = [MCMCodeSigningEntry alloc];
      uint64_t v37 = @"com.apple.MobileContainerManager.Entitlements";
      v38[0] = v10;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      uint64_t v19 = [(MCMCodeSigningEntry *)v17 initWithCodeSigningInfo:v18 andDataContainerClass:0];

      char v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

      if (v20)
      {
        __int16 v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
        [v19 setChildBundleIdentifiers:v21];
      }
      uint64_t v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];

      if (v22) {
        [v19 setPlaceholder:1];
      }
      uint64_t v23 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
      int v24 = [v23 BOOLValue];

      if (v24) {
        [v19 setRegisteredByCaller:1];
      }
      else {
        [v19 setInvalid:1];
      }
      id v26 = [*(id *)(a1 + 32) codeSigningMappingDB];
      uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
      id v31 = *(id *)(v27 + 40);
      char v28 = [v26 addCodeSigningEntry:v19 withIdentifier:v9 error:&v31];
      objc_storeStrong((id *)(v27 + 40), v31);

      if ((v28 & 1) == 0)
      {
        id v29 = container_log_handle_for_category();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          id v34 = v9;
          __int16 v35 = 2112;
          uint64_t v36 = v30;
          _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to write migrated legacy info to DB for %@ : %@", buf, 0x16u);
        }
      }
      goto LABEL_24;
    }
    char v15 = [v13 isInvalid];

    if (v15) {
      goto LABEL_7;
    }
    uint64_t v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }
  }
LABEL_24:
}

- (void)_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v42 = self;
  id v5 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    uint64_t v40 = *(void *)v58;
    id v41 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(NSObject **)(*((void *)&v57 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1D9478DF0]();
        id v45 = 0;
        uint64_t v13 = [v11 metadataWithError:&v45];
        id v14 = v45;
        if (!v13)
        {
          uint64_t v25 = container_log_handle_for_category();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315650;
            id v51 = "-[MCMCodeSigningMapping _onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:]";
            __int16 v52 = 2112;
            id v53 = v11;
            __int16 v54 = 2112;
            id v55 = v14;
            _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }
          goto LABEL_31;
        }
        char v15 = [v13 info];

        if (!v15) {
          goto LABEL_32;
        }
        id v16 = [v13 info];
        id v17 = [v16 objectForKeyedSubscript:@"com.apple.MobileInstallation.GroupContainerIDs"];

        if (v17)
        {
          id v18 = container_log_handle_for_category();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [v13 identifier];
            *(_DWORD *)long long buf = 138412546;
            id v51 = v33;
            __int16 v52 = 2112;
            id v53 = v17;
            _os_log_debug_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEBUG, "Data container for userId: 501, identifier %@ references container IDs: %@", buf, 0x16u);
          }
          uint64_t v19 = [(MCMCodeSigningMapping *)v42 codeSigningMappingDB];
          char v20 = [v13 identifier];
          id v44 = 0;
          __int16 v21 = [v19 codeSigningEntryWithIdentifier:v20 error:&v44];
          uint64_t v22 = v44;

          if (v21)
          {
            uint64_t v23 = container_log_handle_for_category();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = [v13 identifier];
              *(_DWORD *)long long buf = 138412290;
              id v51 = v24;
              _os_log_impl(&dword_1D7739000, v23, OS_LOG_TYPE_DEFAULT, "Deleting app group entitlements for %@ because we already have them in mapping", buf, 0xCu);
              goto LABEL_14;
            }
            goto LABEL_28;
          }
          id v26 = [v22 domain];
          if ([v26 isEqualToString:@"MCMErrorDomain"])
          {
            uint64_t v27 = [v22 code];

            if (v27 == 67)
            {
              char v28 = container_log_handle_for_category();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v13 identifier];
                *(_DWORD *)long long buf = 138412290;
                id v51 = v29;
                _os_log_impl(&dword_1D7739000, v28, OS_LOG_TYPE_DEFAULT, "Migrating app group entitlements for %@", buf, 0xCu);
              }
              uint64_t v30 = [MCMCodeSigningEntry alloc];
              id v47 = v17;
              uint64_t v48 = @"com.apple.MobileContainerManager.Entitlements";
              unint64_t v46 = @"com.apple.security.application-groups";
              uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
              uint64_t v49 = v37;
              id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
              uint64_t v23 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](v30, "initWithCodeSigningInfo:andDataContainerClass:", v31, [v13 containerClass]);

              [v23 setInvalid:1];
              id v38 = [(MCMCodeSigningMapping *)v42 codeSigningMappingDB];
              __int16 v35 = [v13 identifier];
              long long v43 = v22;
              char v36 = [v38 addCodeSigningEntry:v23 withIdentifier:v35 error:&v43];
              uint64_t v25 = v43;

              if ((v36 & 1) == 0)
              {
                uint64_t v32 = container_log_handle_for_category();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  char v39 = [v13 identifier];
                  *(_DWORD *)long long buf = 138412546;
                  id v51 = v39;
                  __int16 v52 = 2112;
                  id v53 = v25;
                  _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Failed to write migrated group id info to DB for %@ : %@", buf, 0x16u);
                }
              }
              goto LABEL_29;
            }
          }
          else
          {
          }
          uint64_t v23 = container_log_handle_for_category();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v24 = [v13 identifier];
            *(_DWORD *)long long buf = 138412546;
            id v51 = v24;
            __int16 v52 = 2112;
            id v53 = v22;
            _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
LABEL_14:
          }
LABEL_28:
          uint64_t v25 = v22;
LABEL_29:

          uint64_t v9 = v40;
          id v6 = v41;
          goto LABEL_30;
        }
        uint64_t v25 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v34 = [v6 countByEnumeratingWithState:&v57 objects:v56 count:16];
      uint64_t v8 = v34;
    }
    while (v34);
  }
}

- (void)migrateAppGroupIdsFromDataContainersToFile
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v3 = objc_opt_new();
  if (([v3 hasMigrationOccurredForType:@"GroupIdMigration"] & 1) == 0)
  {
    uint64_t v33 = v3;
    uint64_t v34 = v2;
    id v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Performing group ID migration", buf, 2u);
    }

    id v5 = [(MCMCodeSigningMapping *)self userIdentityCache];
    uint64_t v6 = [v5 userIdentityForLegacyMobileUser];

    __int16 v35 = (void *)v6;
    uint64_t v7 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:v6];
    uint64_t v8 = 0;
    p_info = MCMContainerSchemaActionMkdir.info;
    while (1)
    {
      uint64_t v10 = (void *)gContainerCache;
      uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v35];
      uint64_t v12 = (void *)qword_1D7815A40[v8];
      id v43 = 0;
      uint64_t v13 = [v10 entriesForUserIdentities:v11 contentClass:v12 transient:0 error:&v43];
      id v14 = v43;

      if (!v13) {
        break;
      }
      uint64_t v37 = v14;
      uint64_t v38 = v8;
      char v15 = [(MCMCodeSigningMapping *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke;
      block[3] = &unk_1E6A805F0;
      block[4] = self;
      id v16 = v13;
      id v42 = v16;
      dispatch_sync(v15, block);

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v16;
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(obj);
            }
            __int16 v21 = [*(id *)(*((void *)&v45 + 1) + 8 * v20) metadataMinimal];
            id v22 = objc_alloc_init((Class)(p_info + 141));
            uint64_t v23 = [MCMCommandSetInfoValue alloc];
            int v24 = [v21 containerIdentity];
            uint64_t v25 = [v7 context];
            id v26 = [(MCMCommandSetInfoValue *)v23 initWithKey:@"com.apple.MobileInstallation.GroupContainerIDs" value:0 containerIdentity:v24 context:v25 resultPromise:v22];

            [(MCMCommandSetInfoValue *)v26 execute];
            uint64_t v27 = [v22 result];
            char v28 = [v27 error];

            if (v28)
            {
              id v29 = container_log_handle_for_category();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                uint64_t v30 = [v21 containerIdentity];
                char v39 = [v22 result];
                id v31 = [v39 error];
                *(_DWORD *)long long buf = 138412546;
                __int16 v50 = v30;
                __int16 v51 = 2112;
                id v52 = v31;
                _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to clear group id metadata for %@ : %@", buf, 0x16u);

                p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
              }
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
        }
        while (v18);
      }

      uint64_t v8 = v38 + 1;
      if (v38 == 2)
      {
        uint64_t v3 = v33;
        [v33 setMigrationCompleteForType:@"GroupIdMigration"];
        uint64_t v2 = v34;
        goto LABEL_22;
      }
    }
    uint64_t v32 = container_log_handle_for_category();
    uint64_t v2 = v34;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218242;
      __int16 v50 = v12;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for userId: 501, class %ld : %@", buf, 0x16u);
    }

    uint64_t v3 = v33;
LABEL_22:
  }
}

uint64_t __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:", v3);
}

- (void)_onQueue_migrateFromMappingFileToDBIfNecessary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMCodeSigningMapping *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__4018;
  uint64_t v27 = __Block_byref_object_dispose__4019;
  id v28 = 0;
  id v4 = [(MCMCodeSigningMapping *)self library];
  id v5 = [v4 url];

  if (v5)
  {
    uint64_t v6 = [v5 URLByAppendingPathComponent:@"mcm_code_signing_info.plist" isDirectory:0];
    uint64_t v7 = [(MCMCodeSigningMapping *)self _readCodeSigningMappingFromDiskAtURL:v6];
    if (v7)
    {
      *(void *)id v29 = 0;
      uint64_t v30 = v29;
      uint64_t v31 = 0x2020000000;
      __int16 v32 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2020000000;
      __int16 v22 = 0;
      uint64_t v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "Migrating code signing info from file to DB", buf, 2u);
      }

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke;
      v18[3] = &unk_1E6A7FAE0;
      v18[4] = self;
      v18[5] = &v23;
      v18[6] = &v19;
      v18[7] = v29;
      [v7 enumerateKeysAndObjectsUsingBlock:v18];
      uint64_t v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *((unsigned __int16 *)v30 + 12);
        int v11 = *((unsigned __int16 *)v20 + 12);
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)uint64_t v34 = v10;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v11;
        _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Successfully migrated %d entries, failed to migrate %d", buf, 0xEu);
      }

      if (*((_WORD *)v30 + 12))
      {
        uint64_t v12 = +[MCMFileManager defaultManager];
        uint64_t v13 = (id *)(v24 + 5);
        id obj = (id)v24[5];
        char v14 = [v12 removeItemAtURL:v6 error:&obj];
        objc_storeStrong(v13, obj);

        if ((v14 & 1) == 0)
        {
          char v15 = container_log_handle_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = v24[5];
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v34 = v16;
            _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Failed to remove legacy code signing mapping file: %@", buf, 0xCu);
          }
        }
      }
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v29, 8);
    }
  }
  else
  {
    uint64_t v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v29 = 0;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Failed to get library url.", v29, 2u);
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D9478DF0]();
  id v8 = v5;
  id v9 = v6;
  int v10 = [*(id *)(a1 + 32) codeSigningMappingDB];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  char v12 = [v10 addCodeSigningEntry:v9 withIdentifier:v8 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    uint64_t v13 = a1 + 56;
  }
  else
  {
    char v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate code signing entry for %@ : %@", buf, 0x16u);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    uint64_t v13 = a1 + 48;
  }
  ++*(_WORD *)(*(void *)(*(void *)v13 + 8) + 24);
}

- (MCMCodeSigningMapping)initWithUserIdentityCache:(id)a3 queue:(id)a4 mappingDB:(id)a5 childParentMapCache:(id)a6 library:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  uint64_t v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MCMCodeSigningMapping;
  uint64_t v17 = [(MCMCodeSigningMapping *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v18->_userIdentityCache, a3);
    objc_storeStrong((id *)&v18->_codeSigningMappingDB, a5);
    objc_storeStrong((id *)&v18->_library, a7);
    objc_storeStrong((id *)&v18->_childParentMapCache, a6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke;
    block[3] = &unk_1E6A80730;
    uint64_t v22 = v18;
    dispatch_sync(v13, block);
  }
  return v18;
}

uint64_t __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);

  return objc_msgSend(v1, "_onQueue_migrateFromMappingFileToDBIfNecessary");
}

+ (id)_moveDBIfNeededFromURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x3032000000;
  long long v62 = __Block_byref_object_copy__4018;
  long long v63 = __Block_byref_object_dispose__4019;
  id v64 = 0;
  uint64_t v7 = +[MCMUserIdentitySharedCache sharedInstance];
  id v8 = [v7 defaultUserIdentity];
  id v9 = [v7 managedUserPathRegistryForUserIdentity:v8];

  int v10 = [v9 containermanagerUserLibrary];
  uint64_t v11 = [v10 url];
  char v12 = v11;
  if (!v11)
  {
    __int16 v32 = (void *)[[NSString alloc] initWithFormat:&stru_1F2EF6598];
    *(void *)long long v65 = @"FunctionName";
    uint64_t v33 = [NSString stringWithUTF8String:"+[MCMCodeSigningMapping _moveDBIfNeededFromURL:queue:error:]_block_invoke"];
    *(void *)long long buf = v33;
    *(void *)&uint8_t buf[8] = &unk_1F2F11A20;
    uint64_t v34 = *MEMORY[0x1E4F28568];
    *(void *)&v65[8] = @"SourceFileLine";
    *(void *)&v65[16] = v34;
    *(void *)&buf[16] = v32;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v65 count:3];

    uint64_t v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:132 userInfo:v35];

    uint64_t v37 = (void *)v60[5];
    v60[5] = v36;

    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D7739000, v14, OS_LOG_TYPE_FAULT, "Failed to get user library url.", buf, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v13 = [v11 URLByAppendingPathComponent:@"references" isDirectory:0];
  id v14 = [v13 URLByAppendingPathExtension:@"sqlite3"];

  char v58 = 0;
  id v15 = +[MCMFileManager defaultManager];
  id v16 = (id *)(v60 + 5);
  id obj = (id)v60[5];
  char v17 = [v15 itemAtURL:v6 exists:&v58 isDirectory:0 error:&obj];
  objc_storeStrong(v16, obj);

  if ((v17 & 1) == 0)
  {
    uint64_t v38 = container_log_handle_for_category();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      uint64_t v44 = v60[5];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      _os_log_fault_impl(&dword_1D7739000, v38, OS_LOG_TYPE_FAULT, "Failed to check if old database exists at [%@], error = %@", buf, 0x16u);
    }

LABEL_12:
    __int16 v21 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (!v58)
  {
LABEL_18:
    __int16 v21 = v14;
    goto LABEL_19;
  }
  uint64_t v18 = +[MCMFileManager defaultManager];
  [v18 removeItemAtURL:v14 error:0];

  uint64_t v19 = [v14 URLByDeletingPathExtension];
  long long v47 = [v19 URLByAppendingPathExtension:@"sqlite3-wal"];

  id v20 = +[MCMFileManager defaultManager];
  [v20 removeItemAtURL:v47 error:0];

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v68 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke;
  block[3] = &unk_1E6A7FAB8;
  id v55 = buf;
  __int16 v21 = v6;
  id v52 = v21;
  uint64_t v22 = v14;
  uint64_t v53 = v22;
  dispatch_queue_t v54 = (dispatch_queue_t)v48;
  long long v56 = &v59;
  dispatch_sync(v54, block);
  long long v46 = v22;
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v28 = container_log_handle_for_category();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    uint64_t v39 = v60[5];
    *(_DWORD *)long long v65 = 138412802;
    *(void *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(void *)&v65[14] = v22;
    *(_WORD *)&v65[22] = 2112;
    uint64_t v66 = v39;
    uint64_t v40 = "Failed to move database from [%@] to [%@], error = %@";
    id v41 = v28;
    uint32_t v42 = 32;
LABEL_29:
    _os_log_fault_impl(&dword_1D7739000, v41, OS_LOG_TYPE_FAULT, v40, v65, v42);
    goto LABEL_16;
  }
  id v23 = v6;
  uint64_t v24 = +[MCMFileManager defaultManager];
  uint64_t v25 = (id *)(v60 + 5);
  id v50 = (id)v60[5];
  char v26 = [v24 removeItemAtURL:v21 error:&v50];
  objc_storeStrong(v25, v50);
  id v6 = v23;

  if (v26)
  {
    uint64_t v27 = [v21 URLByDeletingPathExtension];
    id v28 = [v27 URLByAppendingPathExtension:@"sqlite3-wal"];

    id v29 = +[MCMFileManager defaultManager];
    [v29 removeItemAtURL:v28 error:0];

    char v30 = 0;
    char v31 = 1;
    goto LABEL_17;
  }
  id v28 = container_log_handle_for_category();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    uint64_t v45 = v60[5];
    *(_DWORD *)long long v65 = 138412546;
    *(void *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(void *)&v65[14] = v45;
    uint64_t v40 = "Failed to delete database from [%@], error = %@";
    id v41 = v28;
    uint32_t v42 = 22;
    goto LABEL_29;
  }
LABEL_16:
  char v31 = 0;
  char v30 = 1;
LABEL_17:

  _Block_object_dispose(buf, 8);
  if (v31) {
    goto LABEL_18;
  }

  if ((v30 & 1) == 0) {
    goto LABEL_23;
  }
  __int16 v21 = 0;
LABEL_20:
  if (a5 && !v21)
  {
    __int16 v21 = 0;
    *a5 = (id) v60[5];
  }
LABEL_23:

  _Block_object_dispose(&v59, 8);

  return v21;
}

void __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  obj[0] = *(id *)(v5 + 40);
  BOOL v6 = +[MCMSQLiteDB moveDBWithURL:v2 toURL:v3 queue:v4 error:obj];
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

+ (id)codeSignMappingWithError:(id *)a3
{
  Class v26 = (Class)a1;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__4018;
  uint64_t v37 = __Block_byref_object_dispose__4019;
  id v38 = 0;
  id v3 = containermanager_copy_global_configuration();
  uint64_t v4 = [v3 managedPathRegistry];
  uint64_t v5 = [v4 containermanagerLibrary];

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.MobileContainerManager.EntitlementQueue", 0);
  uint64_t v7 = [v5 url];
  id v8 = [v7 URLByAppendingPathComponent:@"containers" isDirectory:0];
  id v9 = [v8 URLByAppendingPathExtension:@"sqlite3"];

  if (!v9)
  {
    uint64_t v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(multiuser_flags) = 0;
      _os_log_fault_impl(&dword_1D7739000, v13, OS_LOG_TYPE_FAULT, "Failed to get global library url.", (uint8_t *)&multiuser_flags, 2u);
    }
    id v12 = 0;
    id v14 = 0;
    goto LABEL_14;
  }
  uint32_t multiuser_flags = 0;
  host_t v10 = MEMORY[0x1D9478CB0]();
  if (host_get_multiuser_config_flags(v10, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    id v32 = 0;
    -[objc_class _moveDBIfNeededFromURL:queue:error:](v26, "_moveDBIfNeededFromURL:queue:error:", v9, v6, &v32, v26);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v32;
    uint64_t v11 = v15;
    if (v12) {
      goto LABEL_10;
    }
    if (v15)
    {
      uint64_t v25 = container_log_handle_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        uint32_t multiuser_flags = 138412290;
        id v40 = v11;
        _os_log_fault_impl(&dword_1D7739000, v25, OS_LOG_TYPE_FAULT, "Failed to move database: error = %@", (uint8_t *)&multiuser_flags, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v9;
LABEL_10:

  id v16 = containermanager_copy_global_configuration();
  char v17 = [v16 libraryRepair];
  id v31 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke;
  v28[3] = &unk_1E6A7FA90;
  uint64_t v18 = v6;
  id v29 = v18;
  char v30 = &v33;
  [v17 fixAndRetryIfPermissionsErrorWithURL:v12 error:&v31 duringBlock:v28];
  id v14 = v31;

  if (v34[5])
  {
    uint64_t v19 = [MCMChildParentMapCache alloc];
    uint64_t v13 = [(MCMChildParentMapCache *)v19 initWithDB:v34[5] queue:v18];
    id v20 = [v26 alloc];
    __int16 v21 = +[MCMUserIdentitySharedCache sharedInstance];
    uint64_t v22 = (void *)[v20 initWithUserIdentityCache:v21 queue:v18 mappingDB:v34[5] childParentMapCache:v13 library:v5];

    goto LABEL_15;
  }
  uint64_t v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    uint32_t multiuser_flags = 138412290;
    id v40 = v14;
    _os_log_fault_impl(&dword_1D7739000, v13, OS_LOG_TYPE_FAULT, "Failed to initialize database; error = %@",
      (uint8_t *)&multiuser_flags,
      0xCu);
  }
LABEL_14:
  uint64_t v22 = 0;
LABEL_15:

  if (a3) {
    *a3 = v14;
  }
  id v23 = v22;

  _Block_object_dispose(&v33, 8);

  return v23;
}

BOOL __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_queue_t v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2;
  block[3] = &unk_1E6A7FA68;
  id v13 = v5;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v11;
  long long v14 = v11;
  uint64_t v15 = a3;
  id v8 = v5;
  dispatch_sync(v6, block);
  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;

  return v9;
}

uint64_t __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [[MCMSQLiteDB alloc] initWithURL:a1[4] queue:a1[5] error:a1[7]];

  return MEMORY[0x1F41817F8]();
}

@end